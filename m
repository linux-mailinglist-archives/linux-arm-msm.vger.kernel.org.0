Return-Path: <linux-arm-msm+bounces-28236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2008994CE88
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 12:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCAF128276B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 10:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8841917DD;
	Fri,  9 Aug 2024 10:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BQAGvbxo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8557741C6E;
	Fri,  9 Aug 2024 10:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723198931; cv=none; b=KbI75kHbVod7l0puqpBkB5W3XhUf2z84MDXpdslpalxKP6piU/MRCGBWStjZkftbwTNDezXfvJ+baaubBySgE1ph+JSPc/6ND9L7vUA6KT07dEDWodzZe9BTbPm6/r94HIJU4VkZwF4Om0BZM5uSrGMtxHtPd6NKPVgK8+dBKBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723198931; c=relaxed/simple;
	bh=mMJgD/NF6iFHRlINnA4ZJcg6mVBXsWg0jm30rj2Kduo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IxMUl8yQ8mFrd6MktV0PgwaSTicBr5lSKk+chlMMSyFWH89eWH0In5Fo7yVcWS+tWIpk8kT0VzzeSF8vDwxqGQjQujWI7gRhHb9uaAInMuHWWUrylxoimBI5hBmgYpSHet0gux3OH23Py85MzW19dDP5UywTJUHpkBIL882S5kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BQAGvbxo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4799dIMa007155;
	Fri, 9 Aug 2024 10:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0QclWrk4zFUv/zEfzJHZSa9WNpb7i7LejdPqYbXxQes=; b=BQAGvbxo80y57WVZ
	rHKYTfcubNpuBWjSMsYFx4CRSLLZwtmqUiIjb9IeTNIuHCLmp9AUY9UneAtAV16L
	aXWAY0pkXYfGijFDzCEL06lwQc5R7M+OYaPXblXksqYDNf+6xJ5yNfTzNxmLrU5j
	NZ13VkssaQ4IWD4s3w2tkbAAs/CTigBAwBLoiQPc+zwcreJUDL9L3TB6XLsYRCsu
	NycB7yW8XTtdUKCofIkvRKDIsGGI3NQrUPcqrhTLPt+nximuv4dgqrxrL6ICsxU7
	4Pi7Hb/D++Q2sGoyarOC0AGuBjqeYMAirYWTlBd/rtqeyC4YEgzZQZu4A0MaXX32
	xYY36Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40scx70xf1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Aug 2024 10:21:53 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 479ALpt6008481
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 Aug 2024 10:21:51 GMT
Received: from [10.239.133.211] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 Aug 2024
 03:21:48 -0700
Message-ID: <103157b0-976c-4e60-97fa-49eb713b7982@quicinc.com>
Date: Fri, 9 Aug 2024 18:21:46 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] coresight: Add source filtering for multi-port
 output
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
References: <20240711081750.21792-1-quic_taozha@quicinc.com>
 <20240711081750.21792-3-quic_taozha@quicinc.com>
 <d63cdd7e-69db-4fc4-b98a-d4555a843e05@arm.com>
Content-Language: en-US
From: Tao Zhang <quic_taozha@quicinc.com>
In-Reply-To: <d63cdd7e-69db-4fc4-b98a-d4555a843e05@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: KZcWDf8mZs-eaF8LikPjuBl7aO0FrlnQ
X-Proofpoint-GUID: KZcWDf8mZs-eaF8LikPjuBl7aO0FrlnQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_07,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408090075


On 7/11/2024 9:05 PM, Suzuki K Poulose wrote:
> On 11/07/2024 09:17, Tao Zhang wrote:
>> In order to enable the output ports of multi-port output devices,
>
> This has nothing to do with multi-port. You wanted to pain the picture
> of a multi-port device, while the reality is different.
>
>> such as static replicator, to correspond to designated sources,
>> a mechanism for filtering data sources is introduced for the
>> output ports.
>>
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
>> Then driver will find the expected source marked in the Devicetree, and
>> save it to the coresight path. When the function needs to filter the
>> source, it could obtain it from coresight path parameter. Finally,
>> the output port knows which source it corresponds to, and it also knows
>> which input port it corresponds to.
>
> Minor nit: I think the commit description is full of "How" you are 
> doing something, while it must rather be: "What and Why?"
>
> I would prefer something like :
>
> Subject: coresight: Add support for trace filtering by source
>
> Some replicators have hard coded filtering of "trace" data, based on the
> source device. This is different from the trace filtering based on
> TraceID, available in the standard programmable replicators. e.g.,
> Qualcomm replicators have filtering based on custom trace protocol
> format and is not programmable.
>
> The source device could be connected to the replicator via intermediate
> components (e.g., a funnel). Thus we need platform information from
> the firmware tables to decide the source device corresponding to a
> given output port from the replicator. Given this affects "trace
> path building" and traversing the path back from the sink to source,
> add the concept of "filtering by source" to the generic coresight
> connection.
>
>
>>
>> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c  | 125 ++++++++++++++++--
>>   .../hwtracing/coresight/coresight-platform.c  |  18 +++
>>   include/linux/coresight.h                     |   5 +
>>   3 files changed, 135 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c 
>> b/drivers/hwtracing/coresight/coresight-core.c
>> index 9fc6f6b863e0..3f02a31b9328 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -75,15 +75,60 @@ struct coresight_device 
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
>
> Why is this still here ? Didn't agree to remove this and pass the source
> directly ?

I would like to discuss with you about passing the "source" directly. 
Since the APIs "coresight_enable_path" and

"coresight_disable_path" are called in coresight-etm-perf.c as well. If 
passing the "source" to them directly, I need to

modify the code in coresight-etm-perf.c as well. In order to reduce the 
modification, how about if I keep using

"coresight_get_source" in "coresight_enable_path" and 
"coresight_disable_path" to get "source" for filtering

the source in "coresight_block_source"?


Best,

Tao

>
>> +/**
>> + * coresight_source_filter - checks whether the connection matches 
>> the source
>> + * of path if connection is binded to specific source.
>> + * @trace_source: The source device of the trace path
>> + * @conn:      The connection of one outport
>> + *
>> + * Return zero if the connection doesn't have a source binded or 
>> source of the
>> + * path matches the source binds to connection.
>> + */
>> +static int coresight_source_filter(struct coresight_device 
>> *trace_source,
>> +            struct coresight_connection *conn)
>
> This name is a bit confusing. It doesn't tell you, whether it
> allows the trace or blocks it.
>
>> +{
>> +    int ret = 0;
>> +
>> +    if (!conn->filter_src_dev)
>> +        return ret;
>
> This is not the correct check. It must be :
>
> if (!conn->filter_src_fwnode)
>
> Because, the device could have disappeared (or not appeared yet). 
> e.g., (TPDM) driver module unloaded/not - loaded.
>
>> +
>> +    if (!trace_source)
>
> Is that possible ?
>
>> +        return -1;
>> +
>> +    if (conn->filter_src_dev == trace_source)
>> +        ret = 0;
>> +    else
>> +        ret = -1;
>
> Couldn't this simply be :
>
> /*
>  * Returns true, if the trace path is not possible through @conn
>  * for trace originating from @src
>  */
> static bool coresight_blocks_source(src, conn)
> {
>     return conn->filter_src_fwnode &&
>         (conn->filter_src_dev != src);
> }
>
>> +
>> +    return ret;
>> +}
>> +
>>   static struct coresight_connection *
>>   coresight_find_out_connection(struct coresight_device *src_dev,
>> -                  struct coresight_device *dest_dev)
>> +                  struct coresight_device *dest_dev,
>> +                  struct coresight_device *trace_source)
>
> Please could you rename :
>
>     src_dev => csdev
>     dest_dev => out_dev
>     trace_source => trace_src ?
>
> Having src_dev and trace_source in the same list is confusing.
>
>>   {
>>       int i;
>>       struct coresight_connection *conn;
>>         for (i = 0; i < src_dev->pdata->nr_outconns; i++) {
>>           conn = src_dev->pdata->out_conns[i];
>> +        if (coresight_source_filter(trace_source, conn))
>
>         if (coresight_blocks_source(trace_source, conn))
>             continue;
>
>> +            continue;
>>           if (conn->dest_dev == dest_dev)
>>               return conn;
>>       }
>> @@ -251,7 +296,8 @@ static void coresight_disable_sink(struct 
>> coresight_device *csdev)
>>     static int coresight_enable_link(struct coresight_device *csdev,
>>                    struct coresight_device *parent,
>> -                 struct coresight_device *child)
>> +                 struct coresight_device *child,
>> +                 struct coresight_device *trace_source)
>>   {
>>       int link_subtype;
>>       struct coresight_connection *inconn, *outconn;
>> @@ -259,8 +305,8 @@ static int coresight_enable_link(struct 
>> coresight_device *csdev,
>>       if (!parent || !child)
>>           return -EINVAL;
>>   -    inconn = coresight_find_out_connection(parent, csdev);
>> -    outconn = coresight_find_out_connection(csdev, child);
>> +    inconn = coresight_find_out_connection(parent, csdev, 
>> trace_source);
>> +    outconn = coresight_find_out_connection(csdev, child, 
>> trace_source);
>>       link_subtype = csdev->subtype.link_subtype;
>>         if (link_subtype == CORESIGHT_DEV_SUBTYPE_LINK_MERG && 
>> IS_ERR(inconn))
>> @@ -273,15 +319,16 @@ static int coresight_enable_link(struct 
>> coresight_device *csdev,
>>     static void coresight_disable_link(struct coresight_device *csdev,
>>                      struct coresight_device *parent,
>> -                   struct coresight_device *child)
>> +                   struct coresight_device *child,
>> +                   struct coresight_device *trace_source)
>>   {
>>       struct coresight_connection *inconn, *outconn;
>>         if (!parent || !child)
>>           return;
>>   -    inconn = coresight_find_out_connection(parent, csdev);
>> -    outconn = coresight_find_out_connection(csdev, child);
>> +    inconn = coresight_find_out_connection(parent, csdev, 
>> trace_source);
>> +    outconn = coresight_find_out_connection(csdev, child, 
>> trace_source);
>>         link_ops(csdev)->disable(csdev, inconn, outconn);
>>   }
>> @@ -341,6 +388,9 @@ static void coresight_disable_path_from(struct 
>> list_head *path,
>>   {
>>       u32 type;
>>       struct coresight_device *csdev, *parent, *child;
>> +    struct coresight_device *source;
>> +
>> +    source = coresight_get_source(path);
>
> Grr! This must come from the "caller of the 
> coresight_disable_path_from()", which was my comment. Please go back
> and double check the comment on previous version.
>
>
>>         if (!nd)
>>           nd = list_first_entry(path, struct coresight_node, link);
>> @@ -375,7 +425,7 @@ static void coresight_disable_path_from(struct 
>> list_head *path,
>>           case CORESIGHT_DEV_TYPE_LINK:
>>               parent = list_prev_entry(nd, link)->csdev;
>>               child = list_next_entry(nd, link)->csdev;
>> -            coresight_disable_link(csdev, parent, child);
>> +            coresight_disable_link(csdev, parent, child, source);
>>               break;
>>           default:
>>               break;
>> @@ -418,6 +468,9 @@ int coresight_enable_path(struct list_head *path, 
>> enum cs_mode mode,
>>       u32 type;
>>       struct coresight_node *nd;
>>       struct coresight_device *csdev, *parent, *child;
>> +    struct coresight_device *source;
>> +
>> +    source = coresight_get_source(path);
>>         list_for_each_entry_reverse(nd, path, link) {
>>           csdev = nd->csdev;
>> @@ -456,7 +509,7 @@ int coresight_enable_path(struct list_head *path, 
>> enum cs_mode mode,
>>           case CORESIGHT_DEV_TYPE_LINK:
>>               parent = list_prev_entry(nd, link)->csdev;
>>               child = list_next_entry(nd, link)->csdev;
>> -            ret = coresight_enable_link(csdev, parent, child);
>> +            ret = coresight_enable_link(csdev, parent, child, source);
>>               if (ret)
>>                   goto err;
>>               break;
>> @@ -619,6 +672,7 @@ static void coresight_drop_device(struct 
>> coresight_device *csdev)
>>    * @csdev:    The device to start from.
>>    * @sink:    The final sink we want in this path.
>>    * @path:    The list to add devices to.
>> + * @trace_source: The trace source device of the path.
>>    *
>>    * The tree of Coresight device is traversed until @sink is found.
>>    * From there the sink is added to the list along with all the 
>> devices that led
>> @@ -627,7 +681,8 @@ static void coresight_drop_device(struct 
>> coresight_device *csdev)
>>    */
>>   static int _coresight_build_path(struct coresight_device *csdev,
>>                    struct coresight_device *sink,
>> -                 struct list_head *path)
>> +                 struct list_head *path,
>> +                 struct coresight_device *trace_source)
>>   {
>>       int i, ret;
>>       bool found = false;
>> @@ -639,7 +694,7 @@ static int _coresight_build_path(struct 
>> coresight_device *csdev,
>>         if (coresight_is_percpu_source(csdev) && 
>> coresight_is_percpu_sink(sink) &&
>>           sink == per_cpu(csdev_sink, 
>> source_ops(csdev)->cpu_id(csdev))) {
>> -        if (_coresight_build_path(sink, sink, path) == 0) {
>> +        if (_coresight_build_path(sink, sink, path, trace_source) == 
>> 0) {
>>               found = true;
>>               goto out;
>>           }
>> @@ -650,8 +705,13 @@ static int _coresight_build_path(struct 
>> coresight_device *csdev,
>>           struct coresight_device *child_dev;
>>             child_dev = csdev->pdata->out_conns[i]->dest_dev;
>> +
>> +        if (csdev->pdata->out_conns[i]->filter_src_dev
>> +            && (csdev->pdata->out_conns[i]->filter_src_dev != 
>> trace_source))
>> +            continue;
>> +
>>           if (child_dev &&
>> -            _coresight_build_path(child_dev, sink, path) == 0) {
>> +            _coresight_build_path(child_dev, sink, path, 
>> trace_source) == 0) {
>>               found = true;
>>               break;
>>           }
>> @@ -696,7 +756,7 @@ struct list_head *coresight_build_path(struct 
>> coresight_device *source,
>>         INIT_LIST_HEAD(path);
>>   -    rc = _coresight_build_path(source, sink, path);
>> +    rc = _coresight_build_path(source, sink, path, source);
>>       if (rc) {
>>           kfree(path);
>>           return ERR_PTR(rc);
>> @@ -957,6 +1017,14 @@ static int coresight_orphan_match(struct device 
>> *dev, void *data)
>>               /* This component still has an orphan */
>>               still_orphan = true;
>>           }
>
>
>> +        if ((conn->filter_src_fwnode) && dst_csdev
>> +            && (conn->filter_src_fwnode == dst_csdev->dev.fwnode)) {
>> +            conn->filter_src_dev = dst_csdev;
>> +            if (conn->filter_src_dev->type
>> +                != CORESIGHT_DEV_TYPE_SOURCE)
>> +                dev_warn(&conn->filter_src_dev->dev,
>> +                  "Filter source is not a source device\n");
>> +        }
>
> Have you tested your code with the following order :
>
> 1) Build everything as module
> 2) Load the replicator driver.
> 3) Load the TPDM driver
>
> And are you able to get the trace working ? I suspect it doesn't work. 
> The csdev->orphan must be used to track if there is any missing link
> with unresolved "filter_src_dev".
>
>
>>       }
>>         src_csdev->orphan = still_orphan;
>> @@ -974,6 +1042,30 @@ static int coresight_fixup_orphan_conns(struct 
>> coresight_device *csdev)
>>                csdev, coresight_orphan_match);
>>   }
>>   +/* reset_filter_src - Reset the filter source if the source is 
>> being removed */
>> +static int reset_filter_src(struct coresight_device *trace_source,
>> +                struct coresight_connection *conn)
>> +{
>> +    int i;
>> +    int ret = -1;
>> +    struct coresight_device *csdev;
>> +    struct coresight_connection *output_conn;
>
> I don't think this is sufficient. I would rather walk through the 
> entire coresight bus and fixup the filter_src_dev, rather than 
> traversing the
> paths. e.g., one of the devices in the path could have been removed.
> See coresight_clear_default_sink() for e.g. You should have something
> similar :
>
> coresight_clear_filter_source();
>
>
> Suzuki
>
>
>
>> +
>> +    csdev = conn->dest_dev;
>> +    for (i = 0; i < csdev->pdata->nr_outconns; i++) {
>> +        output_conn = csdev->pdata->out_conns[i];
>> +        if (output_conn->filter_src_dev
>> +            && (output_conn->filter_src_dev == trace_source)) {
>> +            output_conn->filter_src_dev = NULL;
>> +            return 0;
>> +        }
>> +        ret = reset_filter_src(trace_source, output_conn);
>> +        if (!ret)
>> +            return ret;
>> +    }
>> +    return ret;
>> +}
>> +
>>   /* coresight_remove_conns - Remove other device's references to 
>> this device */
>>   static void coresight_remove_conns(struct coresight_device *csdev)
>>   {
>> @@ -986,6 +1078,13 @@ static void coresight_remove_conns(struct 
>> coresight_device *csdev)
>>        */
>
>
>>       for (i = 0; i < csdev->pdata->nr_outconns; i++) {
>>           conn = csdev->pdata->out_conns[i];
>> +        if (csdev->type == CORESIGHT_DEV_TYPE_SOURCE)
>> +            reset_filter_src(csdev, conn);
>> +        if (conn->filter_src_fwnode) {
>> +            conn->filter_src_dev = NULL;
>> +            conn->filter_src_fwnode = NULL;
>> +        }
>> +
>>           if (!conn->dest_dev)
>>               continue;
>>   diff --git a/drivers/hwtracing/coresight/coresight-platform.c 
>> b/drivers/hwtracing/coresight/coresight-platform.c
>> index 64e171eaad82..b3c3e2361d07 100644
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
>> +                  "Filter source %s is not a source device\n");
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

