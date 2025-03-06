Return-Path: <linux-arm-msm+bounces-50453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C052A544AD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 09:23:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D46B16D188
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 08:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E26205AB8;
	Thu,  6 Mar 2025 08:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JqkyzCrR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D002054E4;
	Thu,  6 Mar 2025 08:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741249365; cv=none; b=p2BJ6km+BJ1/9GeP+AaFpjTxO3WNdisAQaubtMp8C7chKYwQJwB7154/Te9AZX6EYhzvALPZztTT5c7vPJXfhRL0GtbcEwoSywtvfRVwG5EqMlFZCsGEvtmNQIbPWmDfyWs8UyXJVSiGJDIUkJeWlPVUTWxDKdVZgx6UCP/2QgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741249365; c=relaxed/simple;
	bh=u+g8hZzesVVTx2fzDPjCHu4UB3dM+SBffpCIoqVGxQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=C3Tj8WX3SChijEwOZvoUQO/iFykoiUubF+36y31c+xionKT23HvIeyG/J8eKDEnTKwHVI3tAKnDiHhbuCxFLV+64WHvX9Rsj/pBcD9cN8SB/XUIT5tDQSVR9tD1J1WZGE0RubogmYZlhQWGyhSqFB4ikIsVuwvfbfhXJuTlkBQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JqkyzCrR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525LGbia020148;
	Thu, 6 Mar 2025 08:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lwq0c27ZmJSFSs3UTfQywQ7T1v0vQSnoPsggrS9CbRY=; b=JqkyzCrROlcx8DlF
	MgGY6Ir4qxvSLzJikYoSGBGCH/UJTy7Xo4BiNJXGgPK1hq1GNLViJdPU2gYsPhTl
	XgI+irlZA+J42dByL+IUonGz2YqNTYsPJMpUsG5oowldcO++u007cJ10seidvS/g
	sluwwLQmFggZh4Dn+cyn8JpfElrqZPucuijVDcTqZxvS9AE2YTddcfV+xdqZFYco
	nwaGCN9/OJq757IqVzsQR1DpQOFXCa1Q3bxdc1uaGq9xYHJFZ2eh8YdxgCdRtasv
	1SRcHXtovLRsmo1rPPFbBHsNYKkKMyQHD+gQfLjb5zX0hVq2POKzAg/7vXTckBXK
	U7/1JA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 456xcuhen0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 08:22:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5268MTfF005487
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 08:22:29 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Mar 2025
 00:22:22 -0800
Message-ID: <c0848f24-26c4-4282-9813-1842c2a50c1e@quicinc.com>
Date: Thu, 6 Mar 2025 16:22:20 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] coresight: add coresight Trace NOC driver
To: Leo Yan <leo.yan@arm.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <kernel@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <kernel@oss.qualcomm.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250226-trace-noc-driver-v2-0-8afc6584afc5@quicinc.com>
 <20250226-trace-noc-driver-v2-2-8afc6584afc5@quicinc.com>
 <20250227113910.GA2157064@e132581.arm.com>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <20250227113910.GA2157064@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QB55w7xxKR2eQD-1-M7BTqC26mNzwx0j
X-Proofpoint-GUID: QB55w7xxKR2eQD-1-M7BTqC26mNzwx0j
X-Authority-Analysis: v=2.4 cv=eeXHf6EH c=1 sm=1 tr=0 ts=67c95b46 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=Rc6TaTaFYq2xoIM3m8AA:9
 a=QEXdDO2ut3YA:10 a=RVmHIydaz68A:10 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_03,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060062



On 2/27/2025 7:39 PM, Leo Yan wrote:
> Hi Yuanfang,
> 
> On Wed, Feb 26, 2025 at 07:05:51PM +0800, Yuanfang Zhang wrote:
>>
>> Add driver to support Coresight device Trace NOC(Network On Chip).
>> Trace NOC is an integration hierarchy which is a replacement of
>> Dragonlink configuration. It brings together debug components like
>> TPDA, funnel and interconnect Trace Noc.
>>
>> It sits in the different subsystem of SOC and aggregates the trace
>> and transports to QDSS trace bus.
>>
>> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
>> ---
>>  drivers/hwtracing/coresight/Kconfig          |  13 ++
>>  drivers/hwtracing/coresight/Makefile         |   1 +
>>  drivers/hwtracing/coresight/coresight-tnoc.c | 190 +++++++++++++++++++++++++++
>>  drivers/hwtracing/coresight/coresight-tnoc.h |  53 ++++++++
>>  4 files changed, 257 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
>> index 06f0a7594169c5f03ca5f893b7debd294587de78..6cfd160f09d383ab5f5aa276fa57496a52c8f961 100644
>> --- a/drivers/hwtracing/coresight/Kconfig
>> +++ b/drivers/hwtracing/coresight/Kconfig
>> @@ -247,4 +247,17 @@ config CORESIGHT_DUMMY
>>
>>           To compile this driver as a module, choose M here: the module will be
>>           called coresight-dummy.
>> +
>> +config CORESIGHT_TNOC
>> +       tristate "Coresight Trace Noc driver"
>> +       help
>> +         This driver provides support for Trace NoC component.
>> +         Trace NoC is a interconnect that is used to collect trace from
>> +         various subsystems and transport it QDSS trace sink.It sits in
> 
> Trace NoC is an interconnect used to collect traces from various
> subsystems and transport to a QDSS trace sink.
sure, will update in next version.
> 
>> +         the different tiles of SOC and aggregates the trace local to the
>> +         tile and transports it another tile or to QDSS trace sink eventually.
>> +
>> +         To compile this driver as a module, choose M here: the module will be
>> +         called coresight-tnoc.
>> +
>>  endif
>> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
>> index 4ba478211b318ea5305f9f98dda40a041759f09f..60b729979f19c8f8848c77c290605132dba1a991 100644
>> --- a/drivers/hwtracing/coresight/Makefile
>> +++ b/drivers/hwtracing/coresight/Makefile
>> @@ -34,6 +34,7 @@ obj-$(CONFIG_CORESIGHT_SINK_TPIU) += coresight-tpiu.o
>>  obj-$(CONFIG_CORESIGHT_SINK_ETBV10) += coresight-etb10.o
>>  obj-$(CONFIG_CORESIGHT_LINKS_AND_SINKS) += coresight-funnel.o \
>>                                            coresight-replicator.o
>> +obj-$(CONFIG_CORESIGHT_TNOC) += coresight-tnoc.o
>>  obj-$(CONFIG_CORESIGHT_SOURCE_ETM3X) += coresight-etm3x.o
>>  coresight-etm3x-y := coresight-etm3x-core.o coresight-etm-cp14.o \
>>                      coresight-etm3x-sysfs.o
>> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..fad8e61f05ef25989aba1be342c547f835e8953a
>> --- /dev/null
>> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
>> @@ -0,0 +1,190 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/device.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/amba/bus.h>
>> +#include <linux/io.h>
>> +#include <linux/coresight.h>
>> +#include <linux/of.h>
> 
> Please include headers in alphabetical ordering.
sure, will update in next version.
> 
>> +#include "coresight-priv.h"
>> +#include "coresight-tnoc.h"
>> +#include "coresight-trace-id.h"
>> +
>> +static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
>> +{
>> +       u32 val;
>> +
>> +       /* Set ATID */
>> +       writel_relaxed(drvdata->atid, drvdata->base + TRACE_NOC_XLD);
>> +
>> +       /* Config sync CR */
>> +       writel_relaxed(0xffff, drvdata->base + TRACE_NOC_SYNCR);
>> +
>> +       /* Set frequency value */
>> +       writel_relaxed(drvdata->freq_req_val, drvdata->base + TRACE_NOC_FREQVAL);
>> +
>> +       /* Set Ctrl register */
>> +       val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
>> +
>> +       if (drvdata->flag_type == FLAG_TS)
>> +               val = val | TRACE_NOC_CTRL_FLAGTYPE;
>> +       else
>> +               val = val & ~TRACE_NOC_CTRL_FLAGTYPE;
>> +
>> +       if (drvdata->freq_type == FREQ_TS)
>> +               val = val | TRACE_NOC_CTRL_FREQTYPE;
>> +       else
>> +               val = val & ~TRACE_NOC_CTRL_FREQTYPE;
>> +
>> +       val = val | TRACE_NOC_CTRL_PORTEN;
>> +       writel_relaxed(val, drvdata->base + TRACE_NOC_CTRL);
> 
> It is fine for using writel_relaxed() for continuous writing into the
> same component.  However, the last writing into TRACE_NOC_CTRL enales
> the NOC but without any barrier guard, it might cause the out-of-order
> issue with Arm CoreSight modules (or any other relevant endpoints).
sure, will update in next version.
> 
> I'd like suggest to use writel() for writing TRACE_NOC_CTRL.
> 
>> +       dev_dbg(drvdata->dev, "Trace NOC is enabled\n");
>> +}
>> +
>> +static int trace_noc_enable(struct coresight_device *csdev, struct coresight_connection *inport,
>> +                           struct coresight_connection *outport)
>> +{
>> +       struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>> +
>> +       spin_lock(&drvdata->spinlock);
>> +       if (csdev->refcnt == 0)
> 
> AFAICT csdev->refcnt is only used in sink drivers.  This driver is for
> funnel, it should use `inport->dest_refcnt` as the counter.
sure, will update in next version.
> 
>> +               trace_noc_enable_hw(drvdata);
>> +
>> +       csdev->refcnt++;
>> +       spin_unlock(&drvdata->spinlock);
>> +
>> +       return 0;
>> +}
>> +
>> +static void trace_noc_disable_hw(struct trace_noc_drvdata *drvdata)
>> +{
>> +       writel_relaxed(0x0, drvdata->base + TRACE_NOC_CTRL);
> 
> Same with the comment above for using writel() to replace
> writel_relaxed().
sure.
> 
>> +       dev_dbg(drvdata->dev, "Trace NOC is disabled\n");
>> +}
>> +
>> +static void trace_noc_disable(struct coresight_device *csdev, struct coresight_connection *inport,
>> +                             struct coresight_connection *outport)
>> +{
>> +       struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>> +
>> +       spin_lock(&drvdata->spinlock);
>> +       if (--csdev->refcnt == 0)
>> +               trace_noc_disable_hw(drvdata);
>> +
>> +       spin_unlock(&drvdata->spinlock);
>> +       dev_info(drvdata->dev, "Trace NOC is disabled\n");
>> +}
>> +
>> +static const struct coresight_ops_link trace_noc_link_ops = {
>> +       .enable         = trace_noc_enable,
>> +       .disable        = trace_noc_disable,
>> +};
>> +
>> +static const struct coresight_ops trace_noc_cs_ops = {
>> +       .link_ops       = &trace_noc_link_ops,
>> +};
>> +
>> +static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
>> +{
>> +       int atid;
>> +
>> +       atid = coresight_trace_id_get_system_id();
>> +       if (atid < 0)
>> +               return atid;
>> +
>> +       drvdata->atid = atid;
>> +
>> +       drvdata->freq_type = FREQ_TS;
> 
> I don't see anywhere uses FREQ.  Please remove the unused definitions
> and related code.
it is used in trace_noc_enable_hw().
> 
>> +       drvdata->flag_type = FLAG;
> 
> FLAG_TS is not used in the driver as well.  Remove it.
it is used in trace_noc_enable_hw().
> 
>> +       drvdata->freq_req_val = 0;
>> +
>> +       return 0;
>> +}
>> +
>> +static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
>> +{
>> +       struct device *dev = &adev->dev;
>> +       struct coresight_platform_data *pdata;
>> +       struct trace_noc_drvdata *drvdata;
>> +       struct coresight_desc desc = { 0 };
>> +       int ret;
>> +
>> +       desc.name = coresight_alloc_device_name(&trace_noc_devs, dev);
>> +       if (!desc.name)
>> +               return -ENOMEM;
>> +       pdata = coresight_get_platform_data(dev);
>> +       if (IS_ERR(pdata))
>> +               return PTR_ERR(pdata);
>> +       adev->dev.platform_data = pdata;
>> +
>> +       drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>> +       if (!drvdata)
>> +               return -ENOMEM;
>> +
>> +       drvdata->dev = &adev->dev;
>> +       dev_set_drvdata(dev, drvdata);
>> +
>> +       drvdata->base = devm_ioremap_resource(dev, &adev->res);
>> +       if (!drvdata->base)
>> +               return -ENOMEM;
>> +
>> +       spin_lock_init(&drvdata->spinlock);
>> +
>> +       ret = trace_noc_init_default_data(drvdata);
>> +       if (ret)
>> +               return ret;
>> +
>> +       desc.ops = &trace_noc_cs_ops;
>> +       desc.type = CORESIGHT_DEV_TYPE_LINK;
>> +       desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
>> +       desc.pdata = adev->dev.platform_data;
>> +       desc.dev = &adev->dev;
>> +       desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
>> +       drvdata->csdev = coresight_register(&desc);
>> +       if (IS_ERR(drvdata->csdev))
>> +               return PTR_ERR(drvdata->csdev);
>> +
>> +       pm_runtime_put(&adev->dev);
>> +
>> +       return 0;
>> +}
>> +
>> +static void trace_noc_remove(struct amba_device *adev)
>> +{
>> +       struct trace_noc_drvdata *drvdata = dev_get_drvdata(&adev->dev);
>> +
>> +       coresight_trace_id_put_system_id(drvdata->atid);
>> +       coresight_unregister(drvdata->csdev);
>> +}
>> +
>> +static struct amba_id trace_noc_ids[] = {
>> +       {
>> +               .id     = 0x000f0c00,
>> +               .mask   = 0x000fff00,
> 
> Unlike Arm CoreSight drivers (the mask value is 0x000fffff in most
> cases), could you remind me why here the mask is 0x000fff00?
Because bit 0-7 has different values, records the number of trace initiator NIUs implemented in the NoC. 
> 
>> +       },
>> +       {},
>> +};
>> +MODULE_DEVICE_TABLE(amba, trace_noc_ids);
>> +
>> +static struct amba_driver trace_noc_driver = {
>> +       .drv = {
>> +               .name   = "coresight-trace-noc",
>> +               .owner  = THIS_MODULE,
> 
> I don't think you need to explicitly set `THIS_MODULE`, as this will
> be set default by amba_driver_register().
will remove in next version.
> 
>> +               .suppress_bind_attrs = true,
>> +       },
>> +       .probe          = trace_noc_probe,
>> +       .remove         = trace_noc_remove,
>> +       .id_table       = trace_noc_ids,
>> +};
>> +
>> +module_amba_driver(trace_noc_driver);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("Trace NOC driver");
>> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.h b/drivers/hwtracing/coresight/coresight-tnoc.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..b6bd1ef659897d8e0994c5e8514e8cbdd16eebd8
>> --- /dev/null
>> +++ b/drivers/hwtracing/coresight/coresight-tnoc.h
>> @@ -0,0 +1,53 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#define TRACE_NOC_CTRL 0x008
>> +#define TRACE_NOC_XLD  0x010
>> +#define TRACE_NOC_FREQVAL      0x018
>> +#define TRACE_NOC_SYNCR        0x020
>> +
>> +/* Enable generation of output ATB traffic.*/
>> +#define TRACE_NOC_CTRL_PORTEN  BIT(0)
>> +/* Writing 1 to issue a FREQ or FREQ_TS packet*/
>> +#define TRACE_NOC_CTRL_FREQTSREQ       BIT(5)
> 
> This is not used.  Remove it.
it is used in trace_noc_enable_hw().
> 
>> +/* Sets the type of issued ATB FLAG packets. 0: 'FLAG' packets; 1: 'FLAG_TS' packets.*/
>> +#define TRACE_NOC_CTRL_FLAGTYPE                BIT(7)
> 
>> +/* sets the type of issued ATB FREQ packets. 0: 'FREQ' packets; 1: 'FREQ_TS' packets.*/
>> +#define TRACE_NOC_CTRL_FREQTYPE                BIT(8)
>> +DEFINE_CORESIGHT_DEVLIST(trace_noc_devs, "traceNoc");
> 
> It is good to move the definition into C file.
will update in next version.
> 
> Thanks,
> Leo
> 
>> +
>> +/**
>> + * struct trace_noc_drvdata - specifics associated to a trace noc component
>> + * @base:      memory mapped base address for this component.
>> + * @dev:       device node for trace_noc_drvdata.
>> + * @csdev:     component vitals needed by the framework.
>> + * @spinlock:  only one at a time pls.
>> + * @atid:      id for the trace packet.
>> + * @freqtype:  0: 'FREQ' packets; 1: 'FREQ_TS' packets.
>> + * @flagtype:  0: 'FLAG' packets; 1: 'FLAG_TS' packets.
>> + * @freq_req_val:       set frequency values carried by 'FREQ' and 'FREQ_TS' packets.
>> + */
>> +struct trace_noc_drvdata {
>> +       void __iomem            *base;
>> +       struct device           *dev;
>> +       struct coresight_device *csdev;
>> +       spinlock_t              spinlock; /* lock for the drvdata. */
>> +       u32                     atid;
>> +       u32                     freq_type;
>> +       u32                     flag_type;
>> +       u32                     freq_req_val;
>> +};
>> +
>> +/* freq type */
>> +enum freq_type {
>> +       FREQ,
>> +       FREQ_TS,
>> +};
>> +
>> +/* flag type */
>> +enum flag_type {
>> +       FLAG,
>> +       FLAG_TS,
>> +};
>>
>> --
>> 2.34.1
>>
>> _______________________________________________
>> CoreSight mailing list -- coresight@lists.linaro.org
>> To unsubscribe send an email to coresight-leave@lists.linaro.org


