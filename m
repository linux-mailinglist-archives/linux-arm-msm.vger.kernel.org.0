Return-Path: <linux-arm-msm+bounces-53511-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD50BA8022A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 13:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43069173FD9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 11:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77675267F5F;
	Tue,  8 Apr 2025 11:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V4KGGcxF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F32819AD5C;
	Tue,  8 Apr 2025 11:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744112170; cv=none; b=DloaSfTuFRo8MkTvdFfIM2xRtqJWZG1E+Cf8DuncWn08crrbMGfPxIWY9zhQAor3El7r2NQjUCNsgjFIqNY4pdEeG/A6O7x0kJvD+HGSdiqoWr0a7Ed+cX30vHOGeaWppHMmoaR/8nDMaq8OczLMvZY1QNSAxAzr/TUeni9zXE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744112170; c=relaxed/simple;
	bh=+ngRNwQMn3axrjzat7ASO5h9MlRM0/xdfwhaKHpJWUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Pzz135Jdf+BMisSAziGf2WBCSI/th7VnHSgEDfqedzThhkOHu5uUwRQJOd/TPqPenbTmSbUeW3NQFKIrUKQu3RhQpNcd/mJRHfXapseB89SJErKrxbmiXN+wPmiVi7VBE5x+q50VImSTiHHvwqK939jeTeyrQD76MzEL2JF5T8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V4KGGcxF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538AjAQF029440;
	Tue, 8 Apr 2025 11:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xVjYy0AFck/5OYj8jfDXaAADSmurcdQMlbFlGcMYBhY=; b=V4KGGcxFQaBxMuUX
	QcXfI2RDg1wj2bsNZEeQdxqbuWDyoBBRpF6s9N1i+uIF+/Zq9W2FniQFRJ0aeNxC
	s+kqFJpfFXy2sJ1wyloOR/JnQM2EPlyHruYgSnJA3NBvz4vgfF6xsRjhExkA2jPB
	UXbkIqqjAxjXj1FXMff06BvyLcP7AGHZUv3nxfJDajpc1LC7ucGYwtbFlA032PCe
	yJ7ttgatui0P42Kg70H/LiS4pVVK0lR1+Rc6wqSmtx0RZHknqY+vwEr81LSKYlr3
	I9Cv6SbuUFOJpSSsXF1xjd8b18UuhNN+FAno2RlYf2nKAWv/115WW8qBdAojczs4
	Dmm0VA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrfm99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 11:35:52 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 538BZpY2016210
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Apr 2025 11:35:51 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Apr 2025
 04:35:45 -0700
Message-ID: <b8a4a950-1f66-4698-ba86-8c5939978fa3@quicinc.com>
Date: Tue, 8 Apr 2025 19:35:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] coresight: add coresight Trace NOC driver
To: Mike Leach <mike.leach@linaro.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        James Clark
	<james.clark@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <kernel@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <kernel@oss.qualcomm.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250226-trace-noc-driver-v2-0-8afc6584afc5@quicinc.com>
 <20250226-trace-noc-driver-v2-2-8afc6584afc5@quicinc.com>
 <CAJ9a7Vhkp2xBZmjGO9iqCVkJJAt2+Dh+QkRH-BaCMUZ=6G+t4g@mail.gmail.com>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <CAJ9a7Vhkp2xBZmjGO9iqCVkJJAt2+Dh+QkRH-BaCMUZ=6G+t4g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uXVBf0_DWcLDzD7f_36LWkjcd3zmrtA8
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f50a18 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=cxkefC2O0rBfbOjTquQA:9 a=QEXdDO2ut3YA:10
 a=RVmHIydaz68A:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: uXVBf0_DWcLDzD7f_36LWkjcd3zmrtA8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080082



On 4/7/2025 11:47 PM, Mike Leach wrote:
> Hi,
> 
> On Wed, 26 Feb 2025 at 11:06, Yuanfang Zhang <quic_yuanfang@quicinc.com> wrote:
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
>> +
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
>> +
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
>> +       drvdata->flag_type = FLAG;
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
>> +       },
>> +       {},
>> +};
>> +MODULE_DEVICE_TABLE(amba, trace_noc_ids);
>> +
>> +static struct amba_driver trace_noc_driver = {
>> +       .drv = {
>> +               .name   = "coresight-trace-noc",
>> +               .owner  = THIS_MODULE,
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
> 
> 
> 
>> +#define TRACE_NOC_CTRL_PORTEN  BIT(0)
>> +/* Writing 1 to issue a FREQ or FREQ_TS packet*/
>> +#define TRACE_NOC_CTRL_FREQTSREQ       BIT(5)
>> +/* Sets the type of issued ATB FLAG packets. 0: 'FLAG' packets; 1: 'FLAG_TS' packets.*/
>> +#define TRACE_NOC_CTRL_FLAGTYPE                BIT(7)
>> +/* sets the type of issued ATB FREQ packets. 0: 'FREQ' packets; 1: 'FREQ_TS' packets.*/
>> +#define TRACE_NOC_CTRL_FREQTYPE                BIT(8)
>> +DEFINE_CORESIGHT_DEVLIST(trace_noc_devs, "traceNoc");
> 
> Coresight links do not generate their own packets - please explain
> what these are.
> 
> As far as I am aware, frequency and flag packets are not part of the
> ATB specification.
> 
> If the output bus for this device is not in fact an ATB bus, then it
> should not be referred to as such.
> 
> Thanks and regards
> 
>  Mike
> 
Hi Mike

Frequency and flag packets are STPV2 packet formats, they are generated by FREQ,
FLAG & Sysnc Request Packet interface which is a component of Trace NOC.
 
TNOC is not just a link, it is an integrator that includes TPDA interface,
FREQ, FLAG & Sysnc Request Packet interface, etc. The data generated by these
interfaces will be packaged in STPV2 format and then output through ATB bus.

thanks,
Yuanfang.
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
> 
> 


