Return-Path: <linux-arm-msm+bounces-56923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B21AAC0B3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 12:02:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6633D3AB6BE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 10:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F9E27464E;
	Tue,  6 May 2025 10:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B64dQsdk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAC22701BD;
	Tue,  6 May 2025 10:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525697; cv=none; b=LCQhYMnZri73ZqHyPWUFhLu0OvMbeo7cqgBA69Lrlk+eEjdU8715pL5LW883vwaqJ1bc+HJOMD9vMmuApiJYpFxnQwSk30oxbCOfNkspJ1IA4noiFNEBCLKRdFBiuhhALwyrDUwQ6sgWzs2LM8peLJNSPCK/seVXKaGZh5PxrJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525697; c=relaxed/simple;
	bh=E/SK5xohk3qoIf6eJg0u0qkAqShBG6KdrfnyrVTrXDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Rh7wbJrdTBDsRao5ML5LLytnKQtEwjYl/OVA9bixIbFzfMhUE/akHv6F4vfP4CgSYroVIMsPqGvilh02OOdl424atJqUqzOSoe4lnngAjvJsU9BjF2JmU/uOmvrLK9h5K8gWf2BB7eSmby18p3r+PkaPHdRrZUBoOoqDZR0fhlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B64dQsdk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5468avQ9027642;
	Tue, 6 May 2025 10:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BP6MXv/px388FKK/4Qo/qTUksnvTJw+tLho8gS88zQA=; b=B64dQsdkmZdG5/NK
	ySYTiH+oAIfIw7NjlMcbLZ3ZoaEjlfiW/SqduJRUDWFTO4vUwetqa9ekHz9ZJoec
	ZWxcBeDTf1UC20O1nnYEqOPGRAg2PHobEubuivhQapyFAJ11wq+QvvbDZbmI1aPi
	ofw+l8agg41ygze1upan589Kk2Z6Tk7syx400Riw4FYCOGfe3okKt6rda40ofgth
	lRQkSkIFvQbg4bPAiDTIQyJIjmAC/idLhbMPj7eoVFrh3t5abYhfwaUlf+RJ3BYw
	nFgWFRKAzAJ6nYiGzsw1ODrF7muUuUWvLQQ3ekdaK2O8GMCNcz1m+hrthNK43t+T
	CUBCKA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5sv1tk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 10:01:21 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 546A1KcX002794
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 10:01:20 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 6 May 2025
 03:01:17 -0700
Message-ID: <8a9e1d41-3a75-4f67-b47b-4874c2706f8f@quicinc.com>
Date: Tue, 6 May 2025 18:00:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] coresight: add coresight Trace Network On Chip
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
References: <20250415-trace-noc-v4-0-979938fedfd8@quicinc.com>
 <20250415-trace-noc-v4-2-979938fedfd8@quicinc.com>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <20250415-trace-noc-v4-2-979938fedfd8@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2BO2gH0kAuSkZexp2U07LXhT57raLB54
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA5MyBTYWx0ZWRfXxiSvdYz2SKIP
 HW35yl0nb5bDn2yep0JZMGX8SwrtND/JV27SixL46FH+4wXkR3z51lAnUIwupP87nCxT+M1Z+Bc
 UbzJeySSCaBLhX6UVlJrhWYGtEb88r1yNI/k8UuVW9cu9VkVMESimPd9flz6imDdZH8UiZlXv7K
 Wu3JDqWrHNAsCcX9LdjOnUYJ8erdEAtnzYAWeCB0t0VHvkON29VdjiTIOt0HiWjz3FPwAbWmqtu
 sUstfG8SPnrnt1AtLLmDiAblNhja5Sbn7ZDKNdNks2lO2gHJch7OH20Tl+idSiXmBfMYwYMRTy9
 Z14qi+R7fdh/CFBzEvdqLRT2uUvoHjncFhU/ZXjOd/AIFz99/TuyxWGabMbSUMro86Dk7sfL4Kn
 99OnRjEPoq3m4SPBgjBLHs+8Y52k2q/Dv3LYETUQjuQjoFuZVVT1uX1u+fRafOWM0xzWPvYz
X-Authority-Analysis: v=2.4 cv=cOXgskeN c=1 sm=1 tr=0 ts=6819ddf1 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=Sfw9CCg1thp9Ib4EHVEA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2BO2gH0kAuSkZexp2U07LXhT57raLB54
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_04,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060093



On 4/15/2025 5:25 PM, Yuanfang Zhang wrote:
> Add a driver to support Coresight device Trace Network On Chip (TNOC),
> which is an integration hierarchy integrating functionalities of TPDA
> and funnels. It aggregates the trace and transports to coresight trace
> bus.
> 
> Compared to current configuration, it has the following advantages:
> 1. Reduce wires between subsystems.
> 2. Continue cleaning the infrastructure.
> 3. Reduce Data overhead by transporting raw data from source to target.
> 
>   +------------------------+                +-------------------------+
>   | Video Subsystem        |                |Video Subsystem          |
>   |       +-------------+  |                |       +------------+    |
>   |       | Video TPDM  |  |                |       | Video TPDM |    |
>   |       +-------------+  |                |       +------------+    |
>   |            |           |                |              |          |
>   |            v           |                |              v          |
>   |   +---------------+    |                |        +-----------+    |
>   |   | Video funnel  |    |                |        |Video TNOC |    |
>   |   +---------------+    |                |        +-----------+    |
>   +------------|-----------+                +------------|------------+
>                |                                         |
>                v-----+                                   |
> +--------------------|---------+                         |
> |  Multimedia        v         |                         |
> |  Subsystem   +--------+      |                         |
> |              |  TPDA  |      |                         v
> |              +----|---+      |              +---------------------+
> |                   |          |              |   Aggregator  TNOC  |
> |                   |          |              +----------|----------+
> |                   +--        |                         |
> |                     |        |                         |
> |                     |        |                         |
> |              +------v-----+  |                         |
> |              |  Funnel    |  |                         |
> |              +------------+  |                         |
> +----------------|-------------+                         |
>                  |                                       |
>                  v                                       v
>       +--------------------+                    +------------------+
>       |   Coresight Sink   |                    |  Coresight Sink  |
>       +--------------------+                    +------------------+
> 
>        Current Configuration                            TNOC
> 
> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> ---
>  drivers/hwtracing/coresight/Kconfig          |  13 ++
>  drivers/hwtracing/coresight/Makefile         |   1 +
>  drivers/hwtracing/coresight/coresight-tnoc.c | 191 +++++++++++++++++++++++++++
>  drivers/hwtracing/coresight/coresight-tnoc.h |  34 +++++
>  4 files changed, 239 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
> index ecd7086a5b83e86b6bc8ea039d6d26a628334ed3..f20600d58f38568f8178f69d3f678c2df2cbca7e 100644
> --- a/drivers/hwtracing/coresight/Kconfig
> +++ b/drivers/hwtracing/coresight/Kconfig
> @@ -259,4 +259,17 @@ config CORESIGHT_DUMMY
>  
>  	  To compile this driver as a module, choose M here: the module will be
>  	  called coresight-dummy.
> +
> +config CORESIGHT_TNOC
> +	tristate "Coresight Trace Network On Chip driver"
> +	help
> +	  This driver provides support for Trace Network On Chip (TNOC) component.
> +	  TNOC is an interconnect used to collect traces from various subsystems
> +	  and transport to a coresight trace sink. It sits in the different
> +	  tiles of SOC and aggregates the trace local to the tile and transports
> +	  it another tile or to coresight trace sink eventually.
> +
> +	  To compile this driver as a module, choose M here: the module will be
> +	  called coresight-tnoc.
> +
>  endif
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index 8e62c3150aebd1e82b445fafc97a0a9b44397b0e..880e9ed6bfe9c711492c6a2cd972751f56dd8010 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -34,6 +34,7 @@ obj-$(CONFIG_CORESIGHT_SINK_TPIU) += coresight-tpiu.o
>  obj-$(CONFIG_CORESIGHT_SINK_ETBV10) += coresight-etb10.o
>  obj-$(CONFIG_CORESIGHT_LINKS_AND_SINKS) += coresight-funnel.o \
>  					   coresight-replicator.o
> +obj-$(CONFIG_CORESIGHT_TNOC) += coresight-tnoc.o
>  obj-$(CONFIG_CORESIGHT_SOURCE_ETM3X) += coresight-etm3x.o
>  coresight-etm3x-y := coresight-etm3x-core.o coresight-etm-cp14.o \
>  		     coresight-etm3x-sysfs.o
> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..112dca865f80aa29afa5a3fec2fa6b72ef2ebb0b
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
> @@ -0,0 +1,191 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> + #include <linux/amba/bus.h>
> + #include <linux/coresight.h>
> + #include <linux/device.h>
> + #include <linux/io.h>
> + #include <linux/kernel.h>
> + #include <linux/module.h>
> + #include <linux/of.h>
> + #include <linux/platform_device.h>
> +
> +#include "coresight-priv.h"
> +#include "coresight-tnoc.h"
> +#include "coresight-trace-id.h"
> +
> +DEFINE_CORESIGHT_DEVLIST(trace_noc_devs, "traceNoc");
> +
> +static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
> +{
> +	u32 val;
> +
> +	/* Set ATID */
> +	writel_relaxed(drvdata->atid, drvdata->base + TRACE_NOC_XLD);
> +
> +	/* Set the data word count between 'SYNC' packets */
> +	writel_relaxed(TRACE_NOC_SYNC_INTERVAL, drvdata->base + TRACE_NOC_SYNCR);
> +
> +	/* Set the Control register:
> +	 * - Set the FLAG packets to 'FLAG' packets
> +	 * - Set the FREQ packets to 'FREQ_TS' packets
> +	 * - Enable generation of output ATB traffic
> +	 */
> +
> +	val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
> +
> +	val = val & ~TRACE_NOC_CTRL_FLAGTYPE;
> +	val = val | TRACE_NOC_CTRL_FREQTYPE;
> +	val = val | TRACE_NOC_CTRL_PORTEN;
> +
> +	writel(val, drvdata->base + TRACE_NOC_CTRL);
> +}
> +
> +static int trace_noc_enable(struct coresight_device *csdev, struct coresight_connection *inport,
> +			    struct coresight_connection *outport)
> +{
> +	struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +	spin_lock(&drvdata->spinlock);
> +	if (csdev->refcnt == 0)
> +		trace_noc_enable_hw(drvdata);
> +
> +	csdev->refcnt++;
> +	spin_unlock(&drvdata->spinlock);
> +
> +	dev_dbg(drvdata->dev, "Trace NOC is enabled\n");
> +	return 0;
> +}
> +
> +static void trace_noc_disable_hw(struct trace_noc_drvdata *drvdata)
> +{
> +	writel(0x0, drvdata->base + TRACE_NOC_CTRL);
> +}
> +
> +static void trace_noc_disable(struct coresight_device *csdev, struct coresight_connection *inport,
> +			      struct coresight_connection *outport)
> +{
> +	struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +	spin_lock(&drvdata->spinlock);
> +	if (--csdev->refcnt == 0)
> +		trace_noc_disable_hw(drvdata);
> +
> +	spin_unlock(&drvdata->spinlock);
> +	dev_dbg(drvdata->dev, "Trace NOC is disabled\n");
> +}
> +
> +static int trace_noc_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
> +			__maybe_unused struct coresight_device *sink)
> +{
> +	struct trace_noc_drvdata *drvdata;
> +
> +	drvdata = dev_get_drvdata(csdev->dev.parent);
> +
> +	return drvdata->atid;
> +}
> +
> +static const struct coresight_ops_link trace_noc_link_ops = {
> +	.enable		= trace_noc_enable,
> +	.disable	= trace_noc_disable,
> +};
> +
> +static const struct coresight_ops trace_noc_cs_ops = {
> +	.trace_id	= trace_noc_id,
> +	.link_ops	= &trace_noc_link_ops,
> +};
> +
> +static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
> +{
> +	int atid;
> +
> +	atid = coresight_trace_id_get_system_id();
> +	if (atid < 0)
> +		return atid;
> +
> +	drvdata->atid = atid;
> +
> +	return 0;
> +}
> +
> +static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
> +{
> +	struct device *dev = &adev->dev;
> +	struct coresight_platform_data *pdata;
> +	struct trace_noc_drvdata *drvdata;
> +	struct coresight_desc desc = { 0 };
> +	int ret;
> +
> +	desc.name = coresight_alloc_device_name(&trace_noc_devs, dev);
> +	if (!desc.name)
> +		return -ENOMEM;
> +	pdata = coresight_get_platform_data(dev);
> +	if (IS_ERR(pdata))
> +		return PTR_ERR(pdata);
> +	adev->dev.platform_data = pdata;
> +
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	drvdata->dev = &adev->dev;
> +	dev_set_drvdata(dev, drvdata);
> +
> +	drvdata->base = devm_ioremap_resource(dev, &adev->res);
> +	if (!drvdata->base)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&drvdata->spinlock);
> +
> +	ret = trace_noc_init_default_data(drvdata);
> +	if (ret)
> +		return ret;
> +
> +	desc.ops = &trace_noc_cs_ops;
> +	desc.type = CORESIGHT_DEV_TYPE_LINK;
> +	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
> +	desc.pdata = adev->dev.platform_data;
> +	desc.dev = &adev->dev;
> +	desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
> +	drvdata->csdev = coresight_register(&desc);
> +	if (IS_ERR(drvdata->csdev))
> +		return PTR_ERR(drvdata->csdev);
> +
> +	pm_runtime_put(&adev->dev);
> +
> +	return 0;
> +}
> +
> +static void trace_noc_remove(struct amba_device *adev)
> +{
> +	struct trace_noc_drvdata *drvdata = dev_get_drvdata(&adev->dev);
> +
> +	coresight_trace_id_put_system_id(drvdata->atid);
> +	coresight_unregister(drvdata->csdev);
> +}
> +
> +static struct amba_id trace_noc_ids[] = {
> +	{
> +		.id     = 0x000f0c00,
> +		.mask   = 0x00ffff00,
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(amba, trace_noc_ids);
> +
> +static struct amba_driver trace_noc_driver = {
> +	.drv = {
> +		.name   = "coresight-trace-noc",
> +		.suppress_bind_attrs = true,
> +	},
> +	.probe          = trace_noc_probe,
> +	.remove		= trace_noc_remove,
> +	.id_table	= trace_noc_ids,
> +};
> +
> +module_amba_driver(trace_noc_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Trace NOC driver");
> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.h b/drivers/hwtracing/coresight/coresight-tnoc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..34c696965ec50e3664d55e04e22d5b854d6937a7
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-tnoc.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#define TRACE_NOC_CTRL      0x008
> +#define TRACE_NOC_XLD       0x010
> +#define TRACE_NOC_FREQVAL   0x018
> +#define TRACE_NOC_SYNCR     0x020
> +
> +/* Enable generation of output ATB traffic.*/
> +#define TRACE_NOC_CTRL_PORTEN   BIT(0)
> +/* Sets the type of issued ATB FLAG packets.*/
> +#define TRACE_NOC_CTRL_FLAGTYPE BIT(7)
> +/* Sets the type of issued ATB FREQ packet*/
> +#define TRACE_NOC_CTRL_FREQTYPE BIT(8)
> +
> +#define TRACE_NOC_SYNC_INTERVAL	0xFFFF
> +
> +/*
> + * struct trace_noc_drvdata - specifics associated to a trace noc component
> + * @base:	memory mapped base address for this component.
> + * @dev:	device node for trace_noc_drvdata.
> + * @csdev:	component vitals needed by the framework.
> + * @spinlock:	only one at a time pls.
> + * @atid:	id for the trace packet.
> + */
> +struct trace_noc_drvdata {
> +	void __iomem		*base;
> +	struct device		*dev;
> +	struct coresight_device	*csdev;
> +	spinlock_t		spinlock; /* lock for the drvdata. */
> +	u32			atid;
> +};
> 

gently reminder

