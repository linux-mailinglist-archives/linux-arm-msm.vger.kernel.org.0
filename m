Return-Path: <linux-arm-msm+bounces-38287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 513F19D2204
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 09:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEA341F21F73
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 08:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EFA2150981;
	Tue, 19 Nov 2024 08:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d7iUJj08"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7991798C;
	Tue, 19 Nov 2024 08:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732006761; cv=none; b=Ck+bB41qpIb/uXS1Hxp3RzPoqWfnHXYZfpId+b+2b7AB71HcrUSZb3DopDf6a+16uZXnp89EvmQLt8GprTnTYZuMy2GaZ6HDYnY2QHzMN+qtXvdngVgrCfEUwdvlHiNFzedTn9Vu5B30cBGrHU8yn0Ze+kJavsn2zmR12HNpn4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732006761; c=relaxed/simple;
	bh=JlHQrlbLuIdIqownOM26bRFM+q2r6dW4qRrKda7Lt6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ga7OymXep99Fwl21+VEFIm3lwhznLSqS/4fBnhcky83jHZqlRj3s4PaiiGWf3TGu4TdoVNxHXo/EgRX7G8iU9SLH/LcxJFCiqsmWSDI0HLSQdbVm7G25fT6oQFjxztH0UJUPFJ3ixhz7Bm6HhPp5srZy0iRROj64ROaXecWokeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d7iUJj08; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJ7s0kK028562;
	Tue, 19 Nov 2024 08:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S4tT+dQuydE90Mbj2ruSwdAj9IcakjnOlQwcK5tQoj4=; b=d7iUJj08tjt5gP5h
	h5I0Y71YTH8YO6IGYoweO5DXqt2p+H3zqa/7DaLQKULtIZDsxwksG+pAHX/iJEL8
	W32He4fz+62CuSRv5msqmInDnaTj3GhJbMHBHjBOyrptwqqntYBfZP74+NQhmIXk
	6RfD6mv7N1/9+MrFHlIz5oNpy9d7FTB9cbGKeI9mkYWbCyCzjCqlH/72sHWCSZkP
	mfK6GS6Nkc+vhUVZuafaNmwLAsejxVit4o5VTSkjF06bnmOjbA/1u+FcTAJnoibK
	XNHfzTenM37J9oj0BoxjyLREV0viT9NgjglM8d/wjqMXggwtfiXQlhYklIY7DnXf
	PEYmJg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y81yfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 08:58:58 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJ8wvfi027151
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 08:58:58 GMT
Received: from [10.239.133.211] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 19 Nov
 2024 00:58:53 -0800
Message-ID: <8aeb8ca9-5d3f-4154-bba5-1255b368bf1b@quicinc.com>
Date: Tue, 19 Nov 2024 16:58:50 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] coresight: Add support for trace filtering by
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
References: <20241030093255.26915-1-quic_taozha@quicinc.com>
 <20241030093255.26915-4-quic_taozha@quicinc.com>
 <c39a844e-d0a8-46ac-ab52-530dae741751@arm.com>
 <6bbdd8dd-a5ab-4b51-8152-595331cdd58b@quicinc.com>
 <f2221c21-b891-413f-8adb-e76921da1fb1@arm.com>
 <939c3461-c092-4901-ac06-2173547858ad@quicinc.com>
 <94096b6e-1a4c-4fc4-8294-316b38b35e99@arm.com>
Content-Language: en-US
From: Tao Zhang <quic_taozha@quicinc.com>
In-Reply-To: <94096b6e-1a4c-4fc4-8294-316b38b35e99@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dkOyCXO0G-rlQz4gdi-C4rBFPFIpXLd-
X-Proofpoint-GUID: dkOyCXO0G-rlQz4gdi-C4rBFPFIpXLd-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 mlxscore=0 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190064


On 11/18/2024 5:56 PM, Suzuki K Poulose wrote:
> On 18/11/2024 09:28, Tao Zhang wrote:
>>
>> On 11/15/2024 5:40 PM, Suzuki K Poulose wrote:
>>> On 15/11/2024 09:18, Tao Zhang wrote:
>>>>
>>>> On 11/13/2024 9:39 PM, Suzuki K Poulose wrote:
>>>>> On 30/10/2024 09:32, Tao Zhang wrote:
>>>>>> Some replicators have hard coded filtering of "trace" data, based 
>>>>>> on the
>>>>>> source device. This is different from the trace filtering based on
>>>>>> TraceID, available in the standard programmable replicators. e.g.,
>>>>>> Qualcomm replicators have filtering based on custom trace protocol
>>>>>> format and is not programmable.
>>>>>>
>>>>>> The source device could be connected to the replicator via 
>>>>>> intermediate
>>>>>> components (e.g., a funnel). Thus we need platform information from
>>>>>> the firmware tables to decide the source device corresponding to a
>>>>>> given output port from the replicator. Given this affects "trace
>>>>>> path building" and traversing the path back from the sink to source,
>>>>>> add the concept of "filtering by source" to the generic coresight
>>>>>> connection.
>>>>>>
>>>>>> The specified source will be marked like below in the Devicetree.
>>>>>> test-replicator {
>>>>>>      ... ... ... ...
>>>>>>      out-ports {
>>>>>>          ... ... ... ...
>>>>>>          port@0 {
>>>>>>              reg = <0>;
>>>>>>              xyz: endpoint {
>>>>>>                  remote-endpoint = <&zyx>;
>>>>>>                  filter-source = <&source_1>; <-- To specify the 
>>>>>> source to
>>>>>>              };                           be filtered out here.
>>>>>>          };
>>>>>>
>>>>>>          port@1 {
>>>>>>              reg = <1>;
>>>>>>              abc: endpoint {
>>>>>>                  remote-endpoint = <&cba>;
>>>>>>                  filter-source = <&source_2>; <-- To specify the 
>>>>>> source to
>>>>>>              };                           be filtered out here.
>>>>>>          };
>>>>>>      };
>>>>>> };
>>>>>>
>>>>>> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
>>>>>> ---
>>>>>>   drivers/hwtracing/coresight/coresight-core.c  | 113 
>>>>>> +++++++++++++ ++---
>>>>>>   .../hwtracing/coresight/coresight-platform.c  |  18 +++
>>>>>>   include/linux/coresight.h                     |   5 +
>>>>>>   3 files changed, 117 insertions(+), 19 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/ 
>>>>>> drivers/hwtracing/coresight/coresight-core.c
>>>>>> index ea38ecf26fcb..0a9380350fb5 100644
>>>>>> --- a/drivers/hwtracing/coresight/coresight-core.c
>>>>>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>>>>>> @@ -75,22 +75,54 @@ struct coresight_device 
>>>>>> *coresight_get_percpu_sink(int cpu)
>>>>>>   }
>>>>>>   EXPORT_SYMBOL_GPL(coresight_get_percpu_sink);
>>>>>>   +static struct coresight_device *coresight_get_source(struct 
>>>>>> list_head *path)
>>>>>> +{
>>>>>> +    struct coresight_device *csdev;
>>>>>> +
>>>>>> +    if (!path)
>>>>>> +        return NULL;
>>>>>> +
>>>>>> +    csdev = list_first_entry(path, struct coresight_node, link)- 
>>>>>> >csdev;
>>>>>> +    if (!coresight_is_device_source(csdev))
>>>>>> +        return NULL;
>>>>>> +
>>>>>> +    return csdev;
>>>>>> +}
>>>>>> +
>>>>>> +/**
>>>>>> + * coresight_blocks_source - checks whether the connection 
>>>>>> matches the source
>>>>>> + * of path if connection is bound to specific source.
>>>>>> + * @src:    The source device of the trace path
>>>>>> + * @conn:    The connection of one outport
>>>>>> + *
>>>>>> + * Return false if the connection doesn't have a source binded 
>>>>>> or source of the
>>>>>> + * path matches the source binds to connection.
>>>>>> + */
>>>>>> +static bool coresight_blocks_source(struct coresight_device *src,
>>>>>> +                    struct coresight_connection *conn)
>>>>>> +{
>>>>>> +    return conn->filter_src_fwnode && (conn->filter_src_dev != 
>>>>>> src);
>>>>>> +}
>>>>>> +
>>>>>>   static struct coresight_connection *
>>>>>> -coresight_find_out_connection(struct coresight_device *src_dev,
>>>>>> -                  struct coresight_device *dest_dev)
>>>>>> +coresight_find_out_connection(struct coresight_device *csdev,
>>>>>> +                  struct coresight_device *out_dev,
>>>>>> +                  struct coresight_device *trace_src)
>>>>>>   {
>>>>>>       int i;
>>>>>>       struct coresight_connection *conn;
>>>>>>   -    for (i = 0; i < src_dev->pdata->nr_outconns; i++) {
>>>>>> -        conn = src_dev->pdata->out_conns[i];
>>>>>> -        if (conn->dest_dev == dest_dev)
>>>>>> +    for (i = 0; i < csdev->pdata->nr_outconns; i++) {
>>>>>> +        conn = csdev->pdata->out_conns[i];
>>>>>> +        if (coresight_blocks_source(trace_src, conn))
>>>>>> +            continue;
>>>>>> +        if (conn->dest_dev == out_dev)
>>>>>>               return conn;
>>>>>>       }
>>>>>>   -    dev_err(&src_dev->dev,
>>>>>> -        "couldn't find output connection, src_dev: %s, dest_dev: 
>>>>>> %s\n",
>>>>>> -        dev_name(&src_dev->dev), dev_name(&dest_dev->dev));
>>>>>> +    dev_err(&csdev->dev,
>>>>>> +        "couldn't find output connection, csdev: %s, out_dev: 
>>>>>> %s\n",
>>>>>> +        dev_name(&csdev->dev), dev_name(&out_dev->dev));
>>>>>>         return ERR_PTR(-ENODEV);
>>>>>>   }
>>>>>> @@ -251,7 +283,8 @@ static void coresight_disable_sink(struct 
>>>>>> coresight_device *csdev)
>>>>>>     static int coresight_enable_link(struct coresight_device *csdev,
>>>>>>                    struct coresight_device *parent,
>>>>>> -                 struct coresight_device *child)
>>>>>> +                 struct coresight_device *child,
>>>>>> +                 struct coresight_device *source)
>>>>>>   {
>>>>>>       int link_subtype;
>>>>>>       struct coresight_connection *inconn, *outconn;
>>>>>> @@ -259,8 +292,8 @@ static int coresight_enable_link(struct 
>>>>>> coresight_device *csdev,
>>>>>>       if (!parent || !child)
>>>>>>           return -EINVAL;
>>>>>>   -    inconn = coresight_find_out_connection(parent, csdev);
>>>>>> -    outconn = coresight_find_out_connection(csdev, child);
>>>>>> +    inconn = coresight_find_out_connection(parent, csdev, source);
>>>>>> +    outconn = coresight_find_out_connection(csdev, child, source);
>>>>>>       link_subtype = csdev->subtype.link_subtype;
>>>>>>         if (link_subtype == CORESIGHT_DEV_SUBTYPE_LINK_MERG && 
>>>>>> IS_ERR(inconn))
>>>>>> @@ -273,15 +306,16 @@ static int coresight_enable_link(struct 
>>>>>> coresight_device *csdev,
>>>>>>     static void coresight_disable_link(struct coresight_device 
>>>>>> *csdev,
>>>>>>                      struct coresight_device *parent,
>>>>>> -                   struct coresight_device *child)
>>>>>> +                   struct coresight_device *child,
>>>>>> +                   struct coresight_device *source)
>>>>>>   {
>>>>>>       struct coresight_connection *inconn, *outconn;
>>>>>>         if (!parent || !child)
>>>>>>           return;
>>>>>>   -    inconn = coresight_find_out_connection(parent, csdev);
>>>>>> -    outconn = coresight_find_out_connection(csdev, child);
>>>>>> +    inconn = coresight_find_out_connection(parent, csdev, source);
>>>>>> +    outconn = coresight_find_out_connection(csdev, child, source);
>>>>>>         link_ops(csdev)->disable(csdev, inconn, outconn);
>>>>>>   }
>>>>>> @@ -375,7 +409,8 @@ static void 
>>>>>> coresight_disable_path_from(struct list_head *path,
>>>>>>           case CORESIGHT_DEV_TYPE_LINK:
>>>>>>               parent = list_prev_entry(nd, link)->csdev;
>>>>>>               child = list_next_entry(nd, link)->csdev;
>>>>>> -            coresight_disable_link(csdev, parent, child);
>>>>>> +            coresight_disable_link(csdev, parent, child,
>>>>>> +                           coresight_get_source(path));
>>>>>>               break;
>>>>>>           default:
>>>>>>               break;
>>>>>> @@ -418,7 +453,9 @@ int coresight_enable_path(struct list_head 
>>>>>> *path, enum cs_mode mode,
>>>>>>       u32 type;
>>>>>>       struct coresight_node *nd;
>>>>>>       struct coresight_device *csdev, *parent, *child;
>>>>>> +    struct coresight_device *source;
>>>>>>   +    source = coresight_get_source(path);
>>>>>>       list_for_each_entry_reverse(nd, path, link) {
>>>>>>           csdev = nd->csdev;
>>>>>>           type = csdev->type;
>>>>>> @@ -456,7 +493,7 @@ int coresight_enable_path(struct list_head 
>>>>>> *path, enum cs_mode mode,
>>>>>>           case CORESIGHT_DEV_TYPE_LINK:
>>>>>>               parent = list_prev_entry(nd, link)->csdev;
>>>>>>               child = list_next_entry(nd, link)->csdev;
>>>>>> -            ret = coresight_enable_link(csdev, parent, child);
>>>>>> +            ret = coresight_enable_link(csdev, parent, child, 
>>>>>> source);
>>>>>>               if (ret)
>>>>>>                   goto err;
>>>>>>               break;
>>>>>> @@ -619,6 +656,7 @@ static void coresight_drop_device(struct 
>>>>>> coresight_device *csdev)
>>>>>>   /**
>>>>>>    * _coresight_build_path - recursively build a path from a 
>>>>>> @csdev to a sink.
>>>>>>    * @csdev:    The device to start from.
>>>>>> + * @source:    The trace source device of the path.
>>>>>>    * @sink:    The final sink we want in this path.
>>>>>>    * @path:    The list to add devices to.
>>>>>>    *
>>>>>> @@ -628,6 +666,7 @@ static void coresight_drop_device(struct 
>>>>>> coresight_device *csdev)
>>>>>>    * the source is the first device and the sink the last one.
>>>>>>    */
>>>>>>   static int _coresight_build_path(struct coresight_device *csdev,
>>>>>> +                 struct coresight_device *source,
>>>>>>                    struct coresight_device *sink,
>>>>>>                    struct list_head *path)
>>>>>>   {
>>>>>> @@ -641,7 +680,7 @@ static int _coresight_build_path(struct 
>>>>>> coresight_device *csdev,
>>>>>>         if (coresight_is_percpu_source(csdev) && 
>>>>>> coresight_is_percpu_sink(sink) &&
>>>>>>           sink == per_cpu(csdev_sink, source_ops(csdev)- 
>>>>>> >cpu_id(csdev))) {
>>>>>> -        if (_coresight_build_path(sink, sink, path) == 0) {
>>>>>> +        if (_coresight_build_path(sink, source, sink, path) == 0) {
>>>>>>               found = true;
>>>>>>               goto out;
>>>>>>           }
>>>>>> @@ -652,8 +691,12 @@ static int _coresight_build_path(struct 
>>>>>> coresight_device *csdev,
>>>>>>           struct coresight_device *child_dev;
>>>>>>             child_dev = csdev->pdata->out_conns[i]->dest_dev;
>>>>>> +
>>>>>> +        if (coresight_blocks_source(source, csdev->pdata- 
>>>>>> >out_conns[i]))
>>>>>> +            continue;
>>>>>> +
>>>>>>           if (child_dev &&
>>>>>> -            _coresight_build_path(child_dev, sink, path) == 0) {
>>>>>> +            _coresight_build_path(child_dev, source, sink, path) 
>>>>>> == 0) {
>>>>>>               found = true;
>>>>>>               break;
>>>>>>           }
>>>>>> @@ -698,7 +741,7 @@ struct list_head *coresight_build_path(struct 
>>>>>> coresight_device *source,
>>>>>>         INIT_LIST_HEAD(path);
>>>>>>   -    rc = _coresight_build_path(source, sink, path);
>>>>>> +    rc = _coresight_build_path(source, source, sink, path);
>>>>>>       if (rc) {
>>>>>>           kfree(path);
>>>>>>           return ERR_PTR(rc);
>>>>>> @@ -927,6 +970,16 @@ static int coresight_orphan_match(struct 
>>>>>> device *dev, void *data)
>>>>>>       for (i = 0; i < src_csdev->pdata->nr_outconns; i++) {
>>>>>>           conn = src_csdev->pdata->out_conns[i];
>>>>>>   +        /* Fix filter source device before skip the port */
>>>>>> +        if (conn->filter_src_fwnode && !conn->filter_src_dev) {
>>>>>> +            if (dst_csdev &&
>>>>>> +                (conn->filter_src_fwnode == 
>>>>>> dst_csdev->dev.fwnode) &&
>>>>>> + !WARN_ON_ONCE(!coresight_is_device_source(dst_csdev)))
>>>>>> +                conn->filter_src_dev = dst_csdev;
>>>>>> +            else
>>>>>> +                still_orphan = true;
>>>>>> +        }
>>>>>> +
>>>>>>           /* Skip the port if it's already connected. */
>>>>>>           if (conn->dest_dev)
>>>>>>               continue;
>>>>>> @@ -977,18 +1030,40 @@ static int 
>>>>>> coresight_fixup_orphan_conns(struct coresight_device *csdev)
>>>>>>                csdev, coresight_orphan_match);
>>>>>>   }
>>>>>>   +static int coresight_clear_filter_source(struct device *dev, 
>>>>>> void *data)
>>>>>> +{
>>>>>> +    int i;
>>>>>> +    struct coresight_device *source = data;
>>>>>> +    struct coresight_device *csdev = to_coresight_device(dev);
>>>>>> +
>>>>>> +    for (i = 0; i < csdev->pdata->nr_outconns; ++i) {
>>>>>> +        if (csdev->pdata->out_conns[i]->filter_src_dev == source)
>>>>>> + csdev->pdata->out_conns[i]->filter_src_dev = NULL;
>>>>>> +    }
>>>>>> +    return 0;
>>>>>> +}
>>>>>> +
>>>>>>   /* coresight_remove_conns - Remove other device's references to 
>>>>>> this device */
>>>>>>   static void coresight_remove_conns(struct coresight_device *csdev)
>>>>>>   {
>>>>>>       int i, j;
>>>>>>       struct coresight_connection *conn;
>>>>>>   +    if (coresight_is_device_source(csdev))
>>>>>> +        bus_for_each_dev(&coresight_bustype, NULL, csdev,
>>>>>> +                 coresight_clear_filter_source);
>>>>>> +
>>>>>>       /*
>>>>>>        * Remove the input connection references from the 
>>>>>> destination device
>>>>>>        * for each output connection.
>>>>>>        */
>>>>>>       for (i = 0; i < csdev->pdata->nr_outconns; i++) {
>>>>>>           conn = csdev->pdata->out_conns[i];
>>>>>> +        if (conn->filter_src_fwnode) {
>>>>>> +            conn->filter_src_dev = NULL;
>>>>>> + fwnode_handle_put(conn->filter_src_fwnode);
>>>>>> +        }
>>>>>> +
>>>>>>           if (!conn->dest_dev)
>>>>>>               continue;
>>>>>>   diff --git a/drivers/hwtracing/coresight/coresight-platform.c 
>>>>>> b/ drivers/hwtracing/coresight/coresight-platform.c
>>>>>> index 64e171eaad82..d5532caa9e92 100644
>>>>>> --- a/drivers/hwtracing/coresight/coresight-platform.c
>>>>>> +++ b/drivers/hwtracing/coresight/coresight-platform.c
>>>>>> @@ -243,6 +243,24 @@ static int 
>>>>>> of_coresight_parse_endpoint(struct device *dev,
>>>>>>           conn.dest_fwnode = fwnode_handle_get(rdev_fwnode);
>>>>>>           conn.dest_port = rendpoint.port;
>>>>>>   +        /*
>>>>>> +         * Get the firmware node of the filter source through the
>>>>>> +         * reference. This could be used to filter the source in
>>>>>> +         * building path.
>>>>>> +         */
>>>>>> +        conn.filter_src_fwnode =
>>>>>> +            fwnode_find_reference(&ep->fwnode, "filter-source", 0);
>>>>>> +        if (IS_ERR(conn.filter_src_fwnode)) {
>>>>>> +            conn.filter_src_fwnode = NULL;
>>>>>> +        } else {
>>>>>> +            conn.filter_src_dev =
>>>>>> + coresight_find_csdev_by_fwnode(conn.filter_src_fwnode);
>>>>>> +            if (conn.filter_src_dev &&
>>>>>> + !coresight_is_device_source(conn.filter_src_dev))
>>>>>> + dev_warn(&conn.filter_src_dev->dev,
>>>>>> +                  "Filter source is not a source device\n");
>>>>>
>>>>> Do we need to reset the conn.filter_src_fwnode ? Otherwise, we can 
>>>>> warn from other places too.
>>>>
>>>> Agree, we need to reset conn.filter_src_fwnode and 
>>>> conn.filter_src_dev here if it is not a SOURCE
>>>>
>>>> type device.
>>>>
>>>> I will update the following code to the next patch series. Could 
>>>> you help check if it is fine to you?
>>>
>>> This looks good.
>>>
>>>>
>>>> +            if (conn.filter_src_dev &&
>>>> + !coresight_is_device_source(conn.filter_src_dev)) {
>>>> +                dev_warn(&conn.filter_src_dev->dev,
>>>> +                  "Filter source is not a source device\n");
>>>
>>> minor nit: It would be good to indicate which device has this 
>>> "filtering". i.e,
>>>           dev_warn(dev, "Filter source is not a trace source : 
>>> %s\n", dev_name(&conn.filter_src_dev->dev));
>> Sure, I will update this to the next patch series.
>
> Also, it may be helpful, if we specify the "port number" which has this
> wrong handle. I guess something like:
>
> dev_warn(dev, "port %d: Filter handle is not a trace source : %s\n",
>      conn.src_port, dev_name(&conn.filter_src_dev->dev));

Sure, I will update this to the next patch series.

Best,

Tao

>
> Suzuki
>
>>>
>>>> +                conn.filter_src_dev = NULL；
>>>> +                conn.filter_src_dev = NULL;
>>
>> Sorry for my mistake here. I also want to set "filter_src_fwnode " to 
>> NULL if it is not a trace source.
>>
>> conn.filter_src_fwnode = NULL;
>
>
>>
>>
>> Best,
>>
>> Tao
>>
>>>
>>> Duplicated line ^
>>>
>>> Suzuki
>>>
>>>> +            }
>>>>
>>>> Best,
>>>>
>>>> Tao
>>>>
>>>>>
>>>>> Suzuki
>>>>>
>>>>>> +        }
>>>>>> +
>>>>>>           new_conn = coresight_add_out_conn(dev, pdata, &conn);
>>>>>>           if (IS_ERR_VALUE(new_conn)) {
>>>>>>               fwnode_handle_put(conn.dest_fwnode);
>>>>>> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
>>>>>> index 9311df8538fc..f372c01ae2fc 100644
>>>>>> --- a/include/linux/coresight.h
>>>>>> +++ b/include/linux/coresight.h
>>>>>> @@ -172,6 +172,9 @@ struct coresight_desc {
>>>>>>    * @dest_dev:    a @coresight_device representation of the 
>>>>>> component
>>>>>>           connected to @src_port. NULL until the device is created
>>>>>>    * @link: Representation of the connection as a sysfs link.
>>>>>> + * @filter_src_fwnode: filter source component's fwnode handle.
>>>>>> + * @filter_src_dev: a @coresight_device representation of the 
>>>>>> component that
>>>>>> +        needs to be filtered.
>>>>>>    *
>>>>>>    * The full connection structure looks like this, where 
>>>>>> in_conns store
>>>>>>    * references to same connection as the source device's out_conns.
>>>>>> @@ -200,6 +203,8 @@ struct coresight_connection {
>>>>>>       struct coresight_device *dest_dev;
>>>>>>       struct coresight_sysfs_link *link;
>>>>>>       struct coresight_device *src_dev;
>>>>>> +    struct fwnode_handle *filter_src_fwnode;
>>>>>> +    struct coresight_device *filter_src_dev;
>>>>>>       atomic_t src_refcnt;
>>>>>>       atomic_t dest_refcnt;
>>>>>>   };
>>>>>
>>>
>

