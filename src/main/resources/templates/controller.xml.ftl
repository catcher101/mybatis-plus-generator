package ${package.Controller};


import org.springframework.web.bind.annotation.*;

<#if restControllerStyle>
  import org.springframework.web.bind.annotation.RestController;
<#else>
  import org.springframework.stereotype.Controller;
</#if>
import org.springframework.beans.factory.annotation.Autowired;
import io.swagger.annotations.Api;
import io.swagger.annotations.*;
import lombok.extern.slf4j.Slf4j;
import java.util.*;
import  ${package.Service}.${table.serviceName};
import  ${package.Entity}.${table.entityName};
<#if superControllerClassPackage??>
  import ${superControllerClassPackage};
</#if>

/**
* <p>
  * ${table.comment!} 前端控制器
  * </p>
*
* @author ${author}
* @since ${date}
*/
<#if restControllerStyle>
  @RestController
<#else>
  @Controller
</#if>
@Slf4j
@Api(value = "${table.comment}", tags = "${table.comment}")
@RequestMapping("/<#if controllerMappingHyphenStyle??>${(controllerMappingHyphen?substring(2))?replace("-","/")}<#else>${table.entityPath}</#if>")
<#if kotlin>
  class ${table.controllerName}<#if superControllerClass??> : ${superControllerClass}()</#if>
<#else>
    <#if superControllerClass??>
      public class ${table.controllerName} extends ${superControllerClass} {
    <#else>
      public class ${table.controllerName} {
    </#if>

  @Autowired
  private ${table.serviceName} ${(table.serviceName?substring(1))?uncap_first};

  @ApiOperation(value = "查询分页数据")
  @ApiImplicitParam(
  // 代码生成工具根据model类生成所有字段描述注解
    <#list table.fields as field><#--生成公共字段 -->
      @ApiImplicitParam(name="${field.name}",value="${field.comment}",required = false,type="${field.columnType}",paramType="query"),
    </#list>
  )
  @GetMapping("/s")
  public String ${table.name}List(@RequestParam(name = "pageNum", defaultValue = "1") int pageNum,@RequestParam(name = "pageSize", defaultValue = "20") int pageSize) throws Exception {

  Collection<${table.entityName}> ${table.name}List = ${(table.serviceName?substring(1))?uncap_first}.listByMap(map);
  return null;
  }

  @ApiOperation(value = "修改${table.name}",notes="根据id修改${table.name}")
  @ApiImplicitParam(name = "${table.name}", value = "${table.name}实体", required = true, dataType = "Student")
  @PutMapping("/")
  public String ${table.name}Update(@RequestBody  ${table.entityName} ${table.name}) throws Exception {

  Boolean flag = ${(table.serviceName?substring(1))?uncap_first}.updateById(${table.name});
  return null;
  }
  @ApiOperation(value = "删除${table.name}",notes="根据id删除${table.name}")
  @ApiImplicitParam(name = "id", value = "${table.name}id", required = true, dataType = "<#list table.fields as field><#if field.keyFlag == true>${field.columnType?lower_case?cap_first}</#if></#list> ")
  @DeleteMapping("/{id}")
  public String ${table.name}Delete(@PathVariable <#list table.fields as field><#if field.keyFlag == true>${field.columnType?lower_case?cap_first}</#if></#list> id) throws Exception {
  // ${table}
  Boolean flag = ${(table.serviceName?substring(1))?uncap_first}.removeById(id);
  return null;
  }

  @ApiOperation(value = "添加${table.name}",notes="新增一条${table.name}")
  @ApiImplicitParam(name = "${table.name}", value = "${table.name}实体", required = true, dataType = "${table.name}")
  @PostMapping("")
  public String ${table.name}Add(@RequestBody  ${table.entityName} ${table.name}) throws Exception {

  Boolean flag = ${(table.serviceName?substring(1))?uncap_first}.save(${table.name});
  return null;
  }
  }
</#if>
