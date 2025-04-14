Return-Path: <linux-arm-msm+bounces-54194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE161A87BAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 11:17:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 707763B0424
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 09:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D805225D21E;
	Mon, 14 Apr 2025 09:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jc7rz72Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9AF51A2632;
	Mon, 14 Apr 2025 09:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744622240; cv=none; b=otINe15meeqbQ/OQKhDYCBPGV6Zx6btlAtxlmlca9S/MafiLI8+dqV6p6I9oihbaTv4/hEmzYF69gaFHTYVd1YLteczWc3sODpKFdIJwDYNHzg0mSwCgoyka/GXZOlGu6UkCqIRCS11ZfhmGRUxI3amR0YbBt9SNj9ouDNWcIu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744622240; c=relaxed/simple;
	bh=Bdp/NSQsVWsrELSLLXeq2ouozOSpEzi22+6vW+WR800=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ESC17PDLZxrf8ZSYw9ovLCiYKEabsm9ltuNIFEokqWBpS15DbeoiZPoPnQ6jsR7vCLoD3zA0jJrS4e2gQvKz9N0vwbakNYb/gQwsx6H4Drv5+do8aLEr+tCABOVuRiiDBlnpQqrth6hVtkGxAYUQywOEsXsFxu5Tg77AYPg6E3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jc7rz72Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99tT2017899;
	Mon, 14 Apr 2025 09:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UzS8rTTeThF/iGF+Bt5ZZ+UGBfBFV8zbebtpZEU+tk8=; b=jc7rz72YXqiuHVU5
	iiI7VSx5DDr9g0FxEZoJSth6yeY4+4J9oqbs7Nor0lXyjrLGCBmQKlRHa/jCnBFy
	Q5O+aWNfggplaQyWJ8kPMM0UKYsrfPiOZTwPb1pyLM8ZpdvowMi6WQURllSx/yNW
	2lEb1m4Nsg+MwLuUTki5C3BIvWcbRUIB6ERwkPnPMcYAV530416BWp+FbZ+0yiAO
	IV6WuC01edG3MXeoLGMt2kEY5qe743aT+yZw+i0cydr+e5LmvuPDDkD1x0vaGxKe
	Z1yy/f4OqVnNswysHnYfhUn+UxRLexIZyQFodtDFAwMvFAuIUIArOIzeGyvaUNUS
	zI82Ww==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vc2da-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 09:17:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53E9H2WY004549
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 09:17:02 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 14 Apr
 2025 02:16:58 -0700
Message-ID: <257fb0a5-7bf7-4a04-9f8d-d8759351584c@quicinc.com>
Date: Mon, 14 Apr 2025 17:16:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] coresight: add coresight Trace Network On Chip
 driver
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>
CC: <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250411-trace-noc-v3-0-1f19ddf7699b@quicinc.com>
 <20250411-trace-noc-v3-2-1f19ddf7699b@quicinc.com>
 <23d02991-3bc6-41e2-bb8b-a38786071c43@arm.com>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <23d02991-3bc6-41e2-bb8b-a38786071c43@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BWJCxXqZF4J66aZr1SmBzZUSxOJgkc24
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=67fcd28f cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=QP5JmWE8YpjSW6ngeHcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=RVmHIydaz68A:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: BWJCxXqZF4J66aZr1SmBzZUSxOJgkc24
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140067



On 4/11/2025 5:59 PM, Suzuki K Poulose wrote:
> On 11/04/2025 09:57, Yuanfang Zhang wrote:
>> Add a driver to support Coresight device Trace Network On Chip (TNOC),
>> which is an integration hierarchy integrating functionalities of TPDA
>> and funnels. It aggregates the trace and transports to coresight trace
>> bus.
>>
>> Compared to current configuration, it has the following advantages:
>> 1. Reduce wires between subsystems.
>> 2. Continue cleaning the infrastructure.
>> 3. Reduce Data overhead by transporting raw data from source to target.
>>
>>    +------------------------+                +-------------------------+
>>    | Video Subsystem        |                |Video Subsystem          |
>>    |       +-------------+  |                |       +------------+    |
>>    |       | Video TPDM  |  |                |       | Video TPDM |    |
>>    |       +-------------+  |                |       +------------+    |
>>    |            |           |                |              |          |
>>    |            v           |                |              v          |
>>    |   +---------------+    |                |        +-----------+    |
>>    |   | Video funnel  |    |                |        |Video TNOC |    |
>>    |   +---------------+    |                |        +-----------+    |
>>    +------------|-----------+                +------------|------------+
>>                 |                                         |
>>                 v-----+                                   |
>> +--------------------|---------+                         |
>> |  Multimedia        v         |                         |
>> |  Subsystem   +--------+      |                         |
>> |              |  TPDA  |      |                         v
>> |              +----|---+      |              +---------------------+
>> |                   |          |              |    Aggregator TNOC  |
>> |                   |          |              +----------|----------+
>> |                   +--        |                         |
>> |                     |        |                         |
>> |                     |        |                         |
>> |              +------v-----+  |                         |
>> |              |  Funnel    |  |                         |
>> |              +------------+  |                         |
>> +----------------|-------------+                         |
>>                   |                                       |
>>                   v                                       v
>>        +--------------------+                    +------------------+
>>        |   Coresight Sink   |                    |  Coresight Sink  |
>>        +--------------------+                    +------------------+
> 
> If each NOC has TraceID, how do you reliably decode the trace ?
> Is there a single NOC/TPDA in the path from Source to sink ?

Not each TNOC has TraceID, there is only one TNOC has TraceID for one path
from Source to sink. In the example, only the aggregator TNOC has traceID. 
Decode trace relying on TraceID + Inport number.
It can has mutiple TNOC/TPDA in one path. 

> 
>>
>>         Current Configuration                            TNOC
>>
>> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
>> ---
>>   drivers/hwtracing/coresight/Kconfig          |  13 ++
>>   drivers/hwtracing/coresight/Makefile         |   1 +
>>   drivers/hwtracing/coresight/coresight-tnoc.c | 186 +++++++++++++++++++++++++++
>>   drivers/hwtracing/coresight/coresight-tnoc.h |  34 +++++
>>   4 files changed, 234 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
>> index ecd7086a5b83e86b6bc8ea039d6d26a628334ed3..f20600d58f38568f8178f69d3f678c2df2cbca7e 100644
>> --- a/drivers/hwtracing/coresight/Kconfig
>> +++ b/drivers/hwtracing/coresight/Kconfig
>> @@ -259,4 +259,17 @@ config CORESIGHT_DUMMY
>>           To compile this driver as a module, choose M here: the module will be
>>         called coresight-dummy.
>> +
>> +config CORESIGHT_TNOC
>> +    tristate "Coresight Trace Network On Chip driver"
>> +    help
>> +      This driver provides support for Trace Network On Chip (TNOC) component.
>> +      TNOC is an interconnect used to collect traces from various subsystems
>> +      and transport to a coresight trace sink. It sits in the different
>> +      tiles of SOC and aggregates the trace local to the tile and transports
>> +      it another tile or to coresight trace sink eventually.
>> +
>> +      To compile this driver as a module, choose M here: the module will be
>> +      called coresight-tnoc.
>> +
>>   endif
>> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
>> index 8e62c3150aebd1e82b445fafc97a0a9b44397b0e..880e9ed6bfe9c711492c6a2cd972751f56dd8010 100644
>> --- a/drivers/hwtracing/coresight/Makefile
>> +++ b/drivers/hwtracing/coresight/Makefile
>> @@ -34,6 +34,7 @@ obj-$(CONFIG_CORESIGHT_SINK_TPIU) += coresight-tpiu.o
>>   obj-$(CONFIG_CORESIGHT_SINK_ETBV10) += coresight-etb10.o
>>   obj-$(CONFIG_CORESIGHT_LINKS_AND_SINKS) += coresight-funnel.o \
>>                          coresight-replicator.o
>> +obj-$(CONFIG_CORESIGHT_TNOC) += coresight-tnoc.o
>>   obj-$(CONFIG_CORESIGHT_SOURCE_ETM3X) += coresight-etm3x.o
>>   coresight-etm3x-y := coresight-etm3x-core.o coresight-etm-cp14.o \
>>                coresight-etm3x-sysfs.o
>> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..2ec4ead892f0166a3e84f777679c0f73f5da0e83
>> --- /dev/null
>> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
>> @@ -0,0 +1,186 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> + #include <linux/amba/bus.h>
>> + #include <linux/coresight.h>
>> + #include <linux/device.h>
>> + #include <linux/io.h>
>> + #include <linux/kernel.h>
>> + #include <linux/module.h>
>> + #include <linux/of.h>
>> + #include <linux/platform_device.h>
>> +
>> +#include "coresight-priv.h"
>> +#include "coresight-tnoc.h"
>> +#include "coresight-trace-id.h"
>> +
>> +DEFINE_CORESIGHT_DEVLIST(trace_noc_devs, "traceNoc");
>> +
>> +static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
>> +{
>> +    u32 val;
>> +
>> +    /* Set ATID */
>> +    writel_relaxed(drvdata->atid, drvdata->base + TRACE_NOC_XLD);
>> +
>> +    /* Config sync CR */
>> +    writel_relaxed(TRACE_NOC_SYN_VAL, drvdata->base + TRACE_NOC_SYNCR);
> 
> See my comment below about SYN_VAL. Please add a meaningful comment than
> explaining what is obvious from the code.
sure, will update.
> 
>> +
>> +    /* Set Ctrl register */
> 
> Same here. Comment need not explain what is obvious from the code. But
> a description of why we choose the values below is helpful.
sure, will update.
> 
>> +    val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
>> +
>> +    val = val & ~TRACE_NOC_CTRL_FLAGTYPE;
>> +    val = val | TRACE_NOC_CTRL_FREQTYPE;
>> +    val = val | TRACE_NOC_CTRL_PORTEN;
>> +
>> +    writel(val, drvdata->base + TRACE_NOC_CTRL);
>> +}
>> +
>> +static int trace_noc_enable(struct coresight_device *csdev, struct coresight_connection *inport,
>> +                struct coresight_connection *outport)
>> +{
>> +    struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>> +
>> +    spin_lock(&drvdata->spinlock);
>> +    if (csdev->refcnt == 0)
>> +        trace_noc_enable_hw(drvdata);
>> +
>> +    csdev->refcnt++;
>> +    spin_unlock(&drvdata->spinlock);
>> +
>> +    dev_dbg(drvdata->dev, "Trace NOC is enabled\n");
>> +    return 0;
>> +}
>> +
>> +static void trace_noc_disable_hw(struct trace_noc_drvdata *drvdata)
>> +{
>> +    writel(0x0, drvdata->base + TRACE_NOC_CTRL);
>> +}
>> +
>> +static void trace_noc_disable(struct coresight_device *csdev, struct coresight_connection *inport,
>> +                  struct coresight_connection *outport)
>> +{
>> +    struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>> +
>> +    spin_lock(&drvdata->spinlock);
>> +    if (--csdev->refcnt == 0)
>> +        trace_noc_disable_hw(drvdata);
>> +
>> +    spin_unlock(&drvdata->spinlock);
>> +    dev_dbg(drvdata->dev, "Trace NOC is disabled\n");
>> +}
>> +
>> +static int trace_noc_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
>> +            __maybe_unused struct coresight_device *sink)
>> +{
>> +    struct trace_noc_drvdata *drvdata;
>> +
>> +    drvdata = dev_get_drvdata(csdev->dev.parent);
>> +
>> +    return drvdata->atid;
>> +}
>> +
>> +static const struct coresight_ops_link trace_noc_link_ops = {
>> +    .enable        = trace_noc_enable,
>> +    .disable    = trace_noc_disable,
>> +};
>> +
>> +static const struct coresight_ops trace_noc_cs_ops = {
>> +    .trace_id    = trace_noc_id,
>> +    .link_ops    = &trace_noc_link_ops,
>> +};
>> +
>> +static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
>> +{
>> +    int atid;
>> +
>> +    atid = coresight_trace_id_get_system_id();
>> +    if (atid < 0)
>> +        return atid;
>> +
>> +    drvdata->atid = atid;
>> +
>> +    return 0;
>> +}
>> +
>> +static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
>> +{
>> +    struct device *dev = &adev->dev;
>> +    struct coresight_platform_data *pdata;
>> +    struct trace_noc_drvdata *drvdata;
>> +    struct coresight_desc desc = { 0 };
>> +    int ret;
>> +
>> +    desc.name = coresight_alloc_device_name(&trace_noc_devs, dev);
>> +    if (!desc.name)
>> +        return -ENOMEM;
>> +    pdata = coresight_get_platform_data(dev);
>> +    if (IS_ERR(pdata))
>> +        return PTR_ERR(pdata);
>> +    adev->dev.platform_data = pdata;
>> +
>> +    drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>> +    if (!drvdata)
>> +        return -ENOMEM;
>> +
>> +    drvdata->dev = &adev->dev;
>> +    dev_set_drvdata(dev, drvdata);
>> +
>> +    drvdata->base = devm_ioremap_resource(dev, &adev->res);
>> +    if (!drvdata->base)
>> +        return -ENOMEM;
>> +
>> +    spin_lock_init(&drvdata->spinlock);
>> +
>> +    ret = trace_noc_init_default_data(drvdata);
>> +    if (ret)
>> +        return ret;
>> +
>> +    desc.ops = &trace_noc_cs_ops;
>> +    desc.type = CORESIGHT_DEV_TYPE_LINK;
>> +    desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
>> +    desc.pdata = adev->dev.platform_data;
>> +    desc.dev = &adev->dev;
>> +    desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
>> +    drvdata->csdev = coresight_register(&desc);
>> +    if (IS_ERR(drvdata->csdev))
>> +        return PTR_ERR(drvdata->csdev);
>> +
>> +    pm_runtime_put(&adev->dev);
>> +
>> +    return 0;
>> +}
>> +
>> +static void trace_noc_remove(struct amba_device *adev)
>> +{
>> +    struct trace_noc_drvdata *drvdata = dev_get_drvdata(&adev->dev);
>> +
>> +    coresight_trace_id_put_system_id(drvdata->atid);
>> +    coresight_unregister(drvdata->csdev);
>> +}
>> +
>> +static struct amba_id trace_noc_ids[] = {
>> +    {
>> +        .id     = 0x000f0c00,
>> +        .mask   = 0x000fff00,
> 
> Is the mask sufficient ? fyi, the tpdm mask was fixed in
> commit c8ea5f41b421.
will update mask to 0x00ffff00.
> 
> Suzuk
> 
> 
>> +    },
>> +    {},
>> +};
>> +MODULE_DEVICE_TABLE(amba, trace_noc_ids);
>> +
>> +static struct amba_driver trace_noc_driver = {
>> +    .drv = {
>> +        .name   = "coresight-trace-noc",
>> +        .suppress_bind_attrs = true,
>> +    },
>> +    .probe          = trace_noc_probe,
>> +    .remove        = trace_noc_remove,
>> +    .id_table    = trace_noc_ids,
>> +};
>> +
>> +module_amba_driver(trace_noc_driver);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("Trace NOC driver");
>> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.h b/drivers/hwtracing/coresight/coresight-tnoc.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..1291a153412c1c92be530cffe25fb56c2fca0395
>> --- /dev/null
>> +++ b/drivers/hwtracing/coresight/coresight-tnoc.h
>> @@ -0,0 +1,34 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#define TRACE_NOC_CTRL      0x008
>> +#define TRACE_NOC_XLD       0x010
>> +#define TRACE_NOC_FREQVAL   0x018
>> +#define TRACE_NOC_SYNCR     0x020
>> +
>> +/* Enable generation of output ATB traffic.*/
>> +#define TRACE_NOC_CTRL_PORTEN   BIT(0)
>> +/* Sets the type of issued ATB FLAG packets.*/
>> +#define TRACE_NOC_CTRL_FLAGTYPE BIT(7)
>> +/* Sets the type of issued ATB FREQ packet*/
>> +#define TRACE_NOC_CTRL_FREQTYPE BIT(8)
>> +
>> +#define TRACE_NOC_SYN_VAL    0xFFFF
> 
> TRACE_NOC_SYNCR_xx ?
> 
> What does VAL indicate ? It sounds too generic to indicate anything meaningful. Does it mean, allow all inputs ?
> 
The value of TRACE_NOC_SYNCR register. it means the number of data words that are issued between two 'SYNC' packets.

> Suzuki
> 
>> +
>> +/*
>> + * struct trace_noc_drvdata - specifics associated to a trace noc component
>> + * @base:    memory mapped base address for this component.
>> + * @dev:    device node for trace_noc_drvdata.
>> + * @csdev:    component vitals needed by the framework.
>> + * @spinlock:    only one at a time pls.
>> + * @atid:    id for the trace packet.
>> + */
>> +struct trace_noc_drvdata {
>> +    void __iomem        *base;
>> +    struct device        *dev;
>> +    struct coresight_device    *csdev;
>> +    spinlock_t        spinlock; /* lock for the drvdata. */
>> +    u32            atid;
>> +};
>>
> 


