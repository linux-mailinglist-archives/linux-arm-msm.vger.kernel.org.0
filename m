Return-Path: <linux-arm-msm+bounces-29293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BADCC95BC34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 18:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD4071C230A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 16:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 533B51CDFBA;
	Thu, 22 Aug 2024 16:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IgM1tNrQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5AF1CCED2;
	Thu, 22 Aug 2024 16:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724345101; cv=none; b=YgQeyRgbM6owsk9XJaMeXKj/SeymoYq3W8logRfms4n69C+MfAelQpatkRSRICduIauvZo0i5nj3wItCr2Kkgb6t9eFdQN0fMm9KJ68x+dDu38QntVyuatP89JMCkcd/EbfhxSC+XQg/wqd4rlAJOMLrBBWcjraZKiFqQEeuB2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724345101; c=relaxed/simple;
	bh=gb/PxtAPeBxwnd+Rb3BpnqBJtlYdMZojeo/upwU2S7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=m4xlYMHwRTRyH+Bl7RPNbDWWFtnpNXMqKXQ82R2Av3BbqCh9L27OBM38TS2y7QAfmwfwj2PwCxhCws5hOp4IYMMfzuMlpvsBAwM5b4kfOTbIa0iHEOUJ4MXfSoptTo4CyB4qtmzqBAVzPFLitRFYl2QH/5Cln4LfLh9s3UBJ79s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IgM1tNrQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47MAFjcF030682;
	Thu, 22 Aug 2024 16:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	beLPaQ1+NEjWj2QSniz+ik0YoEiT2qNDfRLMkpCiZfA=; b=IgM1tNrQmbiE32Mg
	IBZFgSl7kF+GCF3mVsbD2T58pPvUGQfdns6Yr+X4+8K3fk9lZ4qbjFGz4M57wa7a
	g12/n4roSfO0St1zoyWoK+1Pnpvh5HUGROAtLVhhGeERFgloMhTkehCOELq8uNyP
	/MX0Dexeg5JBh2JdKRFipesP44VDZZGIydd2CQdhNXLtS69r54CCnroRiQAtrfsY
	AFMiCMdvCPoqgnA1NI4VjKKfy5B2GvAMlx+apvButMTBVGz7iTrBIE6DOJ7iqo3Z
	gv44mdwDS7Umwaq22yHHWfSMIkV5LzyOcepoS+lpg8WZCxQYUpODy8E3v/Ub25fM
	SOBZ0A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414pdmgnsq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 16:44:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47MGibkZ003017
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 16:44:37 GMT
Received: from [10.239.133.211] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 22 Aug
 2024 09:44:34 -0700
Message-ID: <a76bf942-e36f-467d-a436-0a1d8e682c10@quicinc.com>
Date: Fri, 23 Aug 2024 00:44:31 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] coresight: Add support for trace filtering by
 source
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan
	<leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20240821031348.6837-1-quic_taozha@quicinc.com>
 <20240821031348.6837-3-quic_taozha@quicinc.com>
 <5d34d9b6-7571-4db8-847b-6721251efc55@arm.com>
Content-Language: en-US
From: Tao Zhang <quic_taozha@quicinc.com>
In-Reply-To: <5d34d9b6-7571-4db8-847b-6721251efc55@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gagUNNu6RbgwUO9w6I1WYdnYY68O5exW
X-Proofpoint-ORIG-GUID: gagUNNu6RbgwUO9w6I1WYdnYY68O5exW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_10,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408220125


On 8/21/2024 11:23 PM, Suzuki K Poulose wrote:
> Hi Tao
>
> On 21/08/2024 04:13, Tao Zhang wrote:
>> Some replicators have hard coded filtering of "trace" data, based on the
>> source device. This is different from the trace filtering based on
>> TraceID, available in the standard programmable replicators. e.g.,
>> Qualcomm replicators have filtering based on custom trace protocol
>> format and is not programmable.
>>
>> The source device could be connected to the replicator via intermediate
>> components (e.g., a funnel). Thus we need platform information from
>> the firmware tables to decide the source device corresponding to a
>> given output port from the replicator. Given this affects "trace
>> path building" and traversing the path back from the sink to source,
>> add the concept of "filtering by source" to the generic coresight
>> connection.
>>
>
> This looks good, except for some minor comments below.
OK, I will remove the comments below in the next version.
>
>> The specified source will be marked like below in the Devicetree.
>> test-replicator {
>>      ... ... ... ...
>>      out-ports {
>>          ... ... ... ...
>>          port@0 {
>>              reg = <0>;
>>              xxx: endpoint {
>>                  remote-endpoint = <&xxx>;
>>                  filter_src = <&xxx>; <-- To specify the source to
>>              };                           be filtered out here.
>>          };
>>
>>          port@1 {
>>              reg = <1>;
>>              yyy: endpoint {
>>                  remote-endpoint = <&yyy>;
>>                  filter_src = <&yyy>; <-- To specify the source to
>>              };                           be filtered out here.
>>          };
>>      };
>> };
>>
>> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c  | 136 +++++++++++++++---
>>   .../hwtracing/coresight/coresight-platform.c  |  18 +++
>>   include/linux/coresight.h                     |   5 +
>>   3 files changed, 136 insertions(+), 23 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c 
>> b/drivers/hwtracing/coresight/coresight-core.c
>> index 9fc6f6b863e0..d09266a4dd1c 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -75,22 +75,57 @@ struct coresight_device 
>> *coresight_get_percpu_sink(int cpu)
>>   }
>>   EXPORT_SYMBOL_GPL(coresight_get_percpu_sink);
>>   +static struct coresight_device *coresight_get_source(struct 
>> list_head *path)
>> +{
>> +    struct coresight_device *csdev;
>> +
>> +    if (!path)
>> +        return NULL;
>> +
>> +    csdev = list_first_entry(path, struct coresight_node, link)->csdev;
>> +    if (csdev->type != CORESIGHT_DEV_TYPE_SOURCE)
>> +        return NULL;
>> +
>> +    return csdev;
>> +}
>> +
>> +/**
>> + * coresight_block_source - checks whether the connection matches 
>> the source
>> + * of path if connection is binded to specific source.
>> + * @src:    The source device of the trace path
>> + * @conn:    The connection of one outport
>> + *
>> + * Return false if the connection doesn't have a source binded or 
>> source of the
>> + * path matches the source binds to connection.
>> + */
>> +static bool coresight_block_source(struct coresight_device *src,
>> +                    struct coresight_connection *conn)
>> +{
>> +    if (conn->filter_src_fwnode && (conn->filter_src_dev != src))
>> +        return true;
>> +    else
>> +        return false;
>> +}
>> +
>>   static struct coresight_connection *
>> -coresight_find_out_connection(struct coresight_device *src_dev,
>> -                  struct coresight_device *dest_dev)
>> +coresight_find_out_connection(struct coresight_device *csdev,
>> +                  struct coresight_device *out_dev,
>> +                  struct coresight_device *trace_src)
>>   {
>>       int i;
>>       struct coresight_connection *conn;
>>   -    for (i = 0; i < src_dev->pdata->nr_outconns; i++) {
>> -        conn = src_dev->pdata->out_conns[i];
>> -        if (conn->dest_dev == dest_dev)
>> +    for (i = 0; i < csdev->pdata->nr_outconns; i++) {
>> +        conn = csdev->pdata->out_conns[i];
>> +        if (coresight_block_source(trace_src, conn))
>> +            continue;
>> +        if (conn->dest_dev == out_dev)
>>               return conn;
>>       }
>>   -    dev_err(&src_dev->dev,
>> -        "couldn't find output connection, src_dev: %s, dest_dev: %s\n",
>> -        dev_name(&src_dev->dev), dev_name(&dest_dev->dev));
>> +    dev_err(&csdev->dev,
>> +        "couldn't find output connection, csdev: %s, out_dev: %s\n",
>> +        dev_name(&csdev->dev), dev_name(&out_dev->dev));
>>         return ERR_PTR(-ENODEV);
>>   }
>> @@ -251,7 +286,8 @@ static void coresight_disable_sink(struct 
>> coresight_device *csdev)
>>     static int coresight_enable_link(struct coresight_device *csdev,
>>                    struct coresight_device *parent,
>> -                 struct coresight_device *child)
>> +                 struct coresight_device *child,
>> +                 struct coresight_device *source)
>>   {
>>       int link_subtype;
>>       struct coresight_connection *inconn, *outconn;
>> @@ -259,8 +295,8 @@ static int coresight_enable_link(struct 
>> coresight_device *csdev,
>>       if (!parent || !child)
>>           return -EINVAL;
>>   -    inconn = coresight_find_out_connection(parent, csdev);
>> -    outconn = coresight_find_out_connection(csdev, child);
>> +    inconn = coresight_find_out_connection(parent, csdev, source);
>> +    outconn = coresight_find_out_connection(csdev, child, source);
>>       link_subtype = csdev->subtype.link_subtype;
>>         if (link_subtype == CORESIGHT_DEV_SUBTYPE_LINK_MERG && 
>> IS_ERR(inconn))
>> @@ -273,15 +309,16 @@ static int coresight_enable_link(struct 
>> coresight_device *csdev,
>>     static void coresight_disable_link(struct coresight_device *csdev,
>>                      struct coresight_device *parent,
>> -                   struct coresight_device *child)
>> +                   struct coresight_device *child,
>> +                   struct coresight_device *source)
>>   {
>>       struct coresight_connection *inconn, *outconn;
>>         if (!parent || !child)
>>           return;
>>   -    inconn = coresight_find_out_connection(parent, csdev);
>> -    outconn = coresight_find_out_connection(csdev, child);
>> +    inconn = coresight_find_out_connection(parent, csdev, source);
>> +    outconn = coresight_find_out_connection(csdev, child, source);
>>         link_ops(csdev)->disable(csdev, inconn, outconn);
>>   }
>> @@ -337,7 +374,8 @@ EXPORT_SYMBOL_GPL(coresight_disable_source);
>>    * disabled.
>>    */
>>   static void coresight_disable_path_from(struct list_head *path,
>> -                    struct coresight_node *nd)
>> +                    struct coresight_node *nd,
>> +                    struct coresight_device *source)
>
> Apologies, I may not have been clear enough. But we concluded that the
> path here is suitable for coresight_get_source(path) and as such we
> don't need to explicitly pass the source.

Do you mean we don't need to explicitly pass the source on 
"coresight_disable_path_from",

we can pass the "source" to "coresight_disable_link" by the following way?

coresight_disable_link(csdev, parent, child, coresight_get_source(path));

>
>>   {
>>       u32 type;
>>       struct coresight_device *csdev, *parent, *child;
>> @@ -375,7 +413,7 @@ static void coresight_disable_path_from(struct 
>> list_head *path,
>>           case CORESIGHT_DEV_TYPE_LINK:
>>               parent = list_prev_entry(nd, link)->csdev;
>>               child = list_next_entry(nd, link)->csdev;
>> -            coresight_disable_link(csdev, parent, child);
>> +            coresight_disable_link(csdev, parent, child, source);
>>               break;
>>           default:
>>               break;
>> @@ -388,7 +426,10 @@ static void coresight_disable_path_from(struct 
>> list_head *path,
>>     void coresight_disable_path(struct list_head *path)
>>   {
>> -    coresight_disable_path_from(path, NULL);
>> +    struct coresight_device *source;
>> +
>> +    source = coresight_get_source(path);
>> +    coresight_disable_path_from(path, NULL, source);
>>   }
>>   EXPORT_SYMBOL_GPL(coresight_disable_path);
>>   @@ -418,7 +459,9 @@ int coresight_enable_path(struct list_head 
>> *path, enum cs_mode mode,
>>       u32 type;
>>       struct coresight_node *nd;
>>       struct coresight_device *csdev, *parent, *child;
>> +    struct coresight_device *source;
>>   +    source = coresight_get_source(path);
>>       list_for_each_entry_reverse(nd, path, link) {
>>           csdev = nd->csdev;
>>           type = csdev->type;
>> @@ -456,7 +499,7 @@ int coresight_enable_path(struct list_head *path, 
>> enum cs_mode mode,
>>           case CORESIGHT_DEV_TYPE_LINK:
>>               parent = list_prev_entry(nd, link)->csdev;
>>               child = list_next_entry(nd, link)->csdev;
>> -            ret = coresight_enable_link(csdev, parent, child);
>> +            ret = coresight_enable_link(csdev, parent, child, source);
>>               if (ret)
>>                   goto err;
>>               break;
>> @@ -468,7 +511,7 @@ int coresight_enable_path(struct list_head *path, 
>> enum cs_mode mode,
>>   out:
>>       return ret;
>>   err:
>> -    coresight_disable_path_from(path, nd);
>> +    coresight_disable_path_from(path, nd, source);
>>       goto out;
>>   }
>>   @@ -619,6 +662,7 @@ static void coresight_drop_device(struct 
>> coresight_device *csdev)
>>    * @csdev:    The device to start from.
>>    * @sink:    The final sink we want in this path.
>>    * @path:    The list to add devices to.
>> + * @source:    The trace source device of the path.
>>    *
>>    * The tree of Coresight device is traversed until @sink is found.
>>    * From there the sink is added to the list along with all the 
>> devices that led
>> @@ -627,7 +671,8 @@ static void coresight_drop_device(struct 
>> coresight_device *csdev)
>>    */
>>   static int _coresight_build_path(struct coresight_device *csdev,
>>                    struct coresight_device *sink,
>> -                 struct list_head *path)
>> +                 struct list_head *path,
>> +                 struct coresight_device *source)
>
> minor nit: Please could we reorder the parameter order :
>
> _coresight_build_path(csdev, source, sink, path) ?
>
> That makes it much better to read : build a path from "source" to 
> "sink", from "csdev"
All right, I will update in the next version.
>
>>   {
>>       int i, ret;
>>       bool found = false;
>> @@ -639,7 +684,7 @@ static int _coresight_build_path(struct 
>> coresight_device *csdev,
>>         if (coresight_is_percpu_source(csdev) && 
>> coresight_is_percpu_sink(sink) &&
>>           sink == per_cpu(csdev_sink, 
>> source_ops(csdev)->cpu_id(csdev))) {
>> -        if (_coresight_build_path(sink, sink, path) == 0) {
>> +        if (_coresight_build_path(sink, sink, path, source) == 0) {
>>               found = true;
>>               goto out;
>>           }
>> @@ -650,8 +695,13 @@ static int _coresight_build_path(struct 
>> coresight_device *csdev,
>>           struct coresight_device *child_dev;
>>             child_dev = csdev->pdata->out_conns[i]->dest_dev;
>> +
>> +        if (csdev->pdata->out_conns[i]->filter_src_dev
>> +            && (csdev->pdata->out_conns[i]->filter_src_dev != source))
>> +            continue;
>
> Please reuse coresight_block_source(). i.e.,
>
> if (coresight_block_source(source, csdev->pdata->cout_conns[i]))
>     continue;
OK, I will update in the next version.
>
>> +
>>           if (child_dev &&
>> -            _coresight_build_path(child_dev, sink, path) == 0) {
>> +            _coresight_build_path(child_dev, sink, path, source) == 
>> 0) {
>>               found = true;
>>               break;
>>           }
>> @@ -696,7 +746,7 @@ struct list_head *coresight_build_path(struct 
>> coresight_device *source,
>>         INIT_LIST_HEAD(path);
>>   -    rc = _coresight_build_path(source, sink, path);
>> +    rc = _coresight_build_path(source, sink, path, source);
>>       if (rc) {
>>           kfree(path);
>>           return ERR_PTR(rc);
>> @@ -924,6 +974,16 @@ static int coresight_orphan_match(struct device 
>> *dev, void *data)
>>       for (i = 0; i < src_csdev->pdata->nr_outconns; i++) {
>>           conn = src_csdev->pdata->out_conns[i];
>>   +        /* Fix filter source device before skip the port */
>> +        if ((conn->filter_src_fwnode) && dst_csdev
>
> minor nit: unnecessary () around conn->filter_src_fwnode
OK, I will update in the next version.
>
>> +            && (conn->filter_src_fwnode == dst_csdev->dev.fwnode)) {
>> +            if (dst_csdev->type == CORESIGHT_DEV_TYPE_SOURCE)
>> +                conn->filter_src_dev = dst_csdev;
>> +            else
>> +                dev_warn(&conn->filter_src_dev->dev,
>> +                  "Filter source is not a source device\n");
>> +        }
>
> We could set the still_orphan here instead of down below.
>
>     /* Fixup filter source link */
>     if (conn->filter_src_fwnode && !conn->filter_src_dev) {
>         if (dst_csdev &&
>             conn->filter_src_fwnode == dst_csdev->dev.fwnode &&
>             !WARN_ON_ONCE(dst_csdev->type != CORESIGHT_DEV_TYPE_SOURCE) {
>             conn->filter_src_dev = dst_csdev;
>         else
>             still_orphan = true;
>     }
>
> minor nit: Also I think it is high time we add a helper to check if a
> devices is SOURCE, something like we did for is_device_tpdm(). e.g.,
>
>
> static inline bool coresight_is_device_source(struct coresight_device 
> *csdev)
> {
>     return csdev && (csdev->type == CORESIGHT_DEV_TYPE_SOURCE);
> }
Could you help review the following approach?

I will add the helper to coresight-priv.h

static inline bool coresight_is_device_source(struct coresight_device 
*csdev)
{
     return (csdev && (csdev->type == CORESIGHT_DEV_TYPE_SOURCE));
}

Then, calling the help to check if a device is SOURCE in 
coresight-platform.c and coresight-core.c

coresight-platform.c

... ... ... ...

         else {
             conn.filter_src_dev =
  coresight_find_csdev_by_fwnode(conn.filter_src_fwnode);
             if (conn.filter_src_dev &&
                 !coresight_is_device_source(conn.filter_src_dev))
                 dev_warn(&conn.filter_src_dev->dev,
                   "Filter source is not a source device\n");
         }

coresight-core.c

... ... ... ...

         if (conn->filter_src_fwnode && !conn->filter_src_dev) {
             if (dst_csdev && (conn->filter_src_fwnode == 
dst_csdev->dev.fwnode)
                 && !WARN_ON_ONCE(!coresight_is_device_source(dst_csdev)))
                 conn->filter_src_dev = dst_csdev;
             else
                 still_orphan = true;
         }

>
>
>> +
>>           /* Skip the port if it's already connected. */
>>           if (conn->dest_dev)
>>               continue;
>> @@ -953,6 +1013,14 @@ static int coresight_orphan_match(struct device 
>> *dev, void *data)
>>               ret = coresight_add_in_conn(conn);
>>               if (ret)
>>                   return ret;
>> +
>> +            /*
>> +             * Make sure the device still orphan if there is a
>> +             * filter source firmware node but the filter source
>> +             * device is null.
>> +             */
>> +            if (conn->filter_src_fwnode && !conn->filter_src_dev)
>> +                still_orphan = true;
>
> Could we not move this to the place where we fixup the filter_src_dev 
> ? See above.
OK, I will update in the next version.
>
>>           } else {
>>               /* This component still has an orphan */
>>               still_orphan = true;
>> @@ -974,18 +1042,40 @@ static int coresight_fixup_orphan_conns(struct 
>> coresight_device *csdev)
>>                csdev, coresight_orphan_match);
>>   }
>>   +static int coresight_clear_filter_source(struct device *dev, void 
>> *data)
>> +{
>> +    int i;
>> +    struct coresight_device *source = data;
>> +    struct coresight_device *csdev = to_coresight_device(dev);
>> +
>> +    for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
>> +        if (csdev->pdata->out_conns[i]->filter_src_dev == source)
>> +            csdev->pdata->out_conns[i]->filter_src_dev = NULL;
>> +    }
>> +    return 0;
>> +}
>> +
>>   /* coresight_remove_conns - Remove other device's references to 
>> this device */
>>   static void coresight_remove_conns(struct coresight_device *csdev)
>>   {
>>       int i, j;
>>       struct coresight_connection *conn;
>>   +    if (csdev->type == CORESIGHT_DEV_TYPE_SOURCE)
>> +        bus_for_each_dev(&coresight_bustype, NULL, csdev,
>> +                 coresight_clear_filter_source);
>> +
>>       /*
>>        * Remove the input connection references from the destination 
>> device
>>        * for each output connection.
>>        */
>>       for (i = 0; i < csdev->pdata->nr_outconns; i++) {
>>           conn = csdev->pdata->out_conns[i];
>> +        if (conn->filter_src_fwnode) {
>> +            conn->filter_src_dev = NULL;
>> +            fwnode_handle_put(conn->filter_src_fwnode);
>> +        }
>> +
>>           if (!conn->dest_dev)
>>               continue;
>>   diff --git a/drivers/hwtracing/coresight/coresight-platform.c 
>> b/drivers/hwtracing/coresight/coresight-platform.c
>> index 64e171eaad82..6ef4b26f04bb 100644
>> --- a/drivers/hwtracing/coresight/coresight-platform.c
>> +++ b/drivers/hwtracing/coresight/coresight-platform.c
>> @@ -243,6 +243,24 @@ static int of_coresight_parse_endpoint(struct 
>> device *dev,
>>           conn.dest_fwnode = fwnode_handle_get(rdev_fwnode);
>>           conn.dest_port = rendpoint.port;
>>   +        /*
>> +         * Get the firmware node of the filter source through the
>> +         * reference. This could be used to filter the source in
>> +         * building path.
>> +         */
>> +        conn.filter_src_fwnode =
>> +            fwnode_find_reference(&ep->fwnode, "filter-src", 0);
>> +        if (IS_ERR(conn.filter_src_fwnode))
>> +            conn.filter_src_fwnode = NULL;
>> +        else {
>> +            conn.filter_src_dev =
>> + coresight_find_csdev_by_fwnode(conn.filter_src_fwnode);
>> +            if (conn.filter_src_dev && (conn.filter_src_dev->type
>> +                != CORESIGHT_DEV_TYPE_SOURCE))
>> +                dev_warn(&conn.filter_src_dev->dev,
>> +                  "Filter source is not a source device\n");
>> +        }
>> +
>>           new_conn = coresight_add_out_conn(dev, pdata, &conn);
>>           if (IS_ERR_VALUE(new_conn)) {
>>               fwnode_handle_put(conn.dest_fwnode);
>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
>> index f09ace92176e..91a689b4514b 100644
>> --- a/include/linux/coresight.h
>> +++ b/include/linux/coresight.h
>> @@ -172,6 +172,9 @@ struct coresight_desc {
>>    * @dest_dev:    a @coresight_device representation of the component
>>           connected to @src_port. NULL until the device is created
>>    * @link: Representation of the connection as a sysfs link.
>> + * @filter_src_fwnode: filter source component's fwnode handle.
>> + * @filter_src_dev: a @coresight_device representation of the 
>> component that
>> +        needs to be filtered.
>>    *
>>    * The full connection structure looks like this, where in_conns store
>>    * references to same connection as the source device's out_conns.
>> @@ -200,6 +203,8 @@ struct coresight_connection {
>>       struct coresight_device *dest_dev;
>>       struct coresight_sysfs_link *link;
>>       struct coresight_device *src_dev;
>> +    struct fwnode_handle *filter_src_fwnode;
>> +    struct coresight_device *filter_src_dev;
>>       atomic_t src_refcnt;
>>       atomic_t dest_refcnt;
>>   };
>
>
> Suzuki

