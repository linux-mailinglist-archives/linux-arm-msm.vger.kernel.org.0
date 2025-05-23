Return-Path: <linux-arm-msm+bounces-59182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B00E5AC1ED2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 10:38:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39931A22C06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 08:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2680F22258C;
	Fri, 23 May 2025 08:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FDrhMpkd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B0F205ABA;
	Fri, 23 May 2025 08:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747989496; cv=none; b=CCt78Q7em0L14FyMO9vJAuwvxeCmVw5gPrfky12sv+5iz7Ghivuq9+sLvtCiE0f7AlpU/zeXDKqhvTDeOAPoueNUIaVrPITSRv3FfcVlp+oqJOi7DA3ZubFXDpEzj/JH7lWDtJrzk48P1kXW1XZ0xj9smOalYUOot4Ab/4t/iPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747989496; c=relaxed/simple;
	bh=1cRaW96s87M8tM+Jl8sws21AgqTgmD8L1WB9CR/QbmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GoMM23cOzOaZ7n9lBwf1O5K1pjSqbC5q9AHe0zp7RKhW1HtAm6CRMwPfLzaLrkxJRbxzMDCIpLGJCu5cy+W+kqhPk86MG8wynk0GIgNlTdPbDmR7iSfpDoTyZbctqlMsKoaiBjAUush5M62lLXMzIBVj9yoZ26DjFnD5BtyvGH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FDrhMpkd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N2m1TN013427;
	Fri, 23 May 2025 08:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Yvu7KvEVhXAGVUKN1IFcmhYovGU5CHhkYDtNb6BvT4=; b=FDrhMpkdjmRcLBHc
	ubNGzWjM+JUoKDzTPS3sq/WSE5TTEiGsIBxiITyVoIad8QbgKTq+DldIS1MaL5c1
	tgs7WE4r0z5F/LOK3WySHpdhlEn5d/xAuQSS8kNm/opiTyY1rebaDXfHzRjviCQ3
	2FsqtWTOfmu/tf1I5+5UigY6x00E/cCla0etO1oGnemIpWomWV3lhVpiR96IywSt
	hD5M67Ei8z01twga4rMT2SfSoofYTUzUvKAHc1k1aO4jgHMb3/LT20Tym2QNE6cZ
	7hiyVXWnug1qcTXaYJsZrhpUYAcsg1omByyqh1EpeO8vpgOogjyJfVKgGv2obrVF
	bZy8Xw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5hhes-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 08:38:02 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54N8c1Xe004721
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 08:38:01 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 23 May
 2025 01:37:58 -0700
Message-ID: <d949c0e7-e791-45cf-89f3-82a26f70382b@quicinc.com>
Date: Fri, 23 May 2025 16:37:56 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] coresight: add coresight Trace Network On Chip
 driver
To: Leo Yan <leo.yan@arm.com>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250522-trace-noc-v6-0-f5a9bcae90ee@quicinc.com>
 <20250522-trace-noc-v6-2-f5a9bcae90ee@quicinc.com>
 <20250522130536.GA2566836@e132581.arm.com>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <20250522130536.GA2566836@e132581.arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA3NyBTYWx0ZWRfX/kHL1qyDEpQi
 5rTUGyBO7WfTzr3FFArunfhZ4L75PCC0a+zxi3ElzsV+VMuuH1D1/nkyqOx0Tx+zxv9oterQak+
 Ms0WkOKe0r1AwBdx+ZJTVrcrh4FcKSbmKP8vVUM9Men23pFxxm2FlvkWmrXndoisnEUhJBCu6iZ
 cX9qbpBAEvjKyVX5jfCqSiZ23g+VxaxYA5VoMgz00eyLUxusgERUnfvQen/9ISKh3ed4qlomMz4
 cTA/p+Uv1tJQmB1Ef4Gv8Q2hgWjijXG/GpKIJsdgEZnMXAgzydGqk4lyLbfsOz2MZBb6nCfw4kU
 R+0YTcxiiAlGZD3s7Aip5riGY8A7qj1amCo1lumnlOmRv6uV/a1/12uuuvskLoejOUJJLHpQnuT
 WKsjRa6DMQmLM4hMfuPJqiQzlLy3k+XsWmQNVQDV52NQ1GHc4lzOoLWakYTX2qWbm7K1VOG8
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=683033ea cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=pgdA0KJcGQdbBMiMy-UA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: SXz430XGB2XuiYhTuTlqxSLU1TNdFVnw
X-Proofpoint-ORIG-GUID: SXz430XGB2XuiYhTuTlqxSLU1TNdFVnw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230077



On 5/22/2025 9:05 PM, Leo Yan wrote:
> Hi Yuanfang,
> 
> On Thu, May 22, 2025 at 04:07:52PM +0800, Yuanfang Zhang wrote:
>> Add a driver to support Coresight device Trace Network On Chip (TNOC),
>> which is an integration hierarchy integrating functionalities of TPDA
>> and funnels. It aggregates the trace and transports to coresight trace
>> bus.
> 
> The code quality is good for me. However, I still have several minor
> comments.
> 
>> Compared to current configuration, it has the following advantages:
>> 1. Reduce wires between subsystems.
>> 2. Continue cleaning the infrastructure.
>> 3. Reduce Data overhead by transporting raw data from source to target.
>>
>>   +------------------------+                +-------------------------+
>>   | Video Subsystem        |                |Video Subsystem          |
>>   |       +-------------+  |                |       +------------+    |
>>   |       | Video TPDM  |  |                |       | Video TPDM |    |
>>   |       +-------------+  |                |       +------------+    |
>>   |            |           |                |              |          |
>>   |            v           |                |              v          |
>>   |   +---------------+    |                |        +-----------+    |
>>   |   | Video funnel  |    |                |        |Video TNOC |    |
>>   |   +---------------+    |                |        +-----------+    |
>>   +------------|-----------+                +------------|------------+
>>                |                                         |
>>                v-----+                                   |
>> +--------------------|---------+                         |
>> |  Multimedia        v         |                         |
>> |  Subsystem   +--------+      |                         |
>> |              |  TPDA  |      |                         v
>> |              +----|---+      |              +---------------------+
>> |                   |          |              |   Aggregator  TNOC  |
>> |                   |          |              +----------|----------+
>> |                   +--        |                         |
>> |                     |        |                         |
>> |                     |        |                         |
>> |              +------v-----+  |                         |
>> |              |  Funnel    |  |                         |
>> |              +------------+  |                         |
>> +----------------|-------------+                         |
>>                  |                                       |
>>                  v                                       v
>>       +--------------------+                    +------------------+
>>       |   Coresight Sink   |                    |  Coresight Sink  |
>>       +--------------------+                    +------------------+
>>
>>        Current Configuration                            TNOC
>>
>> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
>> ---
>>  drivers/hwtracing/coresight/Kconfig          |  13 ++
>>  drivers/hwtracing/coresight/Makefile         |   1 +
>>  drivers/hwtracing/coresight/coresight-tnoc.c | 192 +++++++++++++++++++++++++++
>>  drivers/hwtracing/coresight/coresight-tnoc.h |  34 +++++
>>  4 files changed, 240 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
>> index ecd7086a5b83e86b6bc8ea039d6d26a628334ed3..f20600d58f38568f8178f69d3f678c2df2cbca7e 100644
>> --- a/drivers/hwtracing/coresight/Kconfig
>> +++ b/drivers/hwtracing/coresight/Kconfig
>> @@ -259,4 +259,17 @@ config CORESIGHT_DUMMY
>>  
>>  	  To compile this driver as a module, choose M here: the module will be
>>  	  called coresight-dummy.
>> +
>> +config CORESIGHT_TNOC
>> +	tristate "Coresight Trace Network On Chip driver"
>> +	help
>> +	  This driver provides support for Trace Network On Chip (TNOC) component.
>> +	  TNOC is an interconnect used to collect traces from various subsystems
>> +	  and transport to a coresight trace sink. It sits in the different
>> +	  tiles of SOC and aggregates the trace local to the tile and transports
>> +	  it another tile or to coresight trace sink eventually.
>> +
>> +	  To compile this driver as a module, choose M here: the module will be
>> +	  called coresight-tnoc.
>> +
>>  endif
>> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
>> index 8e62c3150aebd1e82b445fafc97a0a9b44397b0e..880e9ed6bfe9c711492c6a2cd972751f56dd8010 100644
>> --- a/drivers/hwtracing/coresight/Makefile
>> +++ b/drivers/hwtracing/coresight/Makefile
>> @@ -34,6 +34,7 @@ obj-$(CONFIG_CORESIGHT_SINK_TPIU) += coresight-tpiu.o
>>  obj-$(CONFIG_CORESIGHT_SINK_ETBV10) += coresight-etb10.o
>>  obj-$(CONFIG_CORESIGHT_LINKS_AND_SINKS) += coresight-funnel.o \
>>  					   coresight-replicator.o
>> +obj-$(CONFIG_CORESIGHT_TNOC) += coresight-tnoc.o
>>  obj-$(CONFIG_CORESIGHT_SOURCE_ETM3X) += coresight-etm3x.o
>>  coresight-etm3x-y := coresight-etm3x-core.o coresight-etm-cp14.o \
>>  		     coresight-etm3x-sysfs.o
>> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..5658501155d322d28e87ff820c7ba8b787eff7ce
>> --- /dev/null
>> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
>> @@ -0,0 +1,192 @@
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
>> +	u32 val;
>> +
>> +	/* Set ATID */
>> +	writel_relaxed(drvdata->atid, drvdata->base + TRACE_NOC_XLD);
>> +
>> +	/* Set the data word count between 'SYNC' packets */
>> +	writel_relaxed(TRACE_NOC_SYNC_INTERVAL, drvdata->base + TRACE_NOC_SYNCR);
>> +
>> +	/* Set the Control register:
>> +	 * - Set the FLAG packets to 'FLAG' packets
>> +	 * - Set the FREQ packets to 'FREQ_TS' packets
>> +	 * - Enable generation of output ATB traffic
>> +	 */
>> +
>> +	val = readl_relaxed(drvdata->base + TRACE_NOC_CTRL);
>> +
>> +	val &= ~TRACE_NOC_CTRL_FLAGTYPE;
>> +	val |= TRACE_NOC_CTRL_FREQTYPE;
>> +	val |= TRACE_NOC_CTRL_PORTEN;
>> +
>> +	writel(val, drvdata->base + TRACE_NOC_CTRL);
>> +}
>> +
>> +static int trace_noc_enable(struct coresight_device *csdev, struct coresight_connection *inport,
>> +			    struct coresight_connection *outport)
>> +{
>> +	struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>> +
>> +	spin_lock(&drvdata->spinlock);
> 
>         scoped_guard(spinlock, &drvdata->spinlock) {
> 
>         }
> 
Done in next patch.
>> +	if (csdev->refcnt == 0)
>> +		trace_noc_enable_hw(drvdata);
>> +
>> +	csdev->refcnt++;
>> +	spin_unlock(&drvdata->spinlock);
>> +
>> +	dev_dbg(drvdata->dev, "Trace NOC is enabled\n");
>> +	return 0;
>> +}
>> +
>> +static void trace_noc_disable_hw(struct trace_noc_drvdata *drvdata)
>> +{
>> +	writel(0x0, drvdata->base + TRACE_NOC_CTRL);
>> +}
> 
> It is not necessary to use a function to encapsulate single operations.
> 
> Please drop the function trace_noc_disable_hw() and directly use
> writel() in the call site.

Done in next patch.
> 
>> +
>> +static void trace_noc_disable(struct coresight_device *csdev, struct coresight_connection *inport,
>> +			      struct coresight_connection *outport)
>> +{
>> +	struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
>> +
>> +	spin_lock(&drvdata->spinlock);
>> +	if (--csdev->refcnt == 0)
>> +		trace_noc_disable_hw(drvdata);
>> +
>> +	spin_unlock(&drvdata->spinlock);
>> +	dev_dbg(drvdata->dev, "Trace NOC is disabled\n");
>> +}
>> +
>> +static int trace_noc_id(struct coresight_device *csdev, __maybe_unused enum cs_mode mode,
>> +			__maybe_unused struct coresight_device *sink)
>> +{
>> +	struct trace_noc_drvdata *drvdata;
>> +
>> +	drvdata = dev_get_drvdata(csdev->dev.parent);
>> +
>> +	return drvdata->atid;
>> +}
>> +
>> +static const struct coresight_ops_link trace_noc_link_ops = {
>> +	.enable		= trace_noc_enable,
>> +	.disable	= trace_noc_disable,
>> +};
>> +
>> +static const struct coresight_ops trace_noc_cs_ops = {
>> +	.trace_id	= trace_noc_id,
>> +	.link_ops	= &trace_noc_link_ops,
>> +};
>> +
>> +static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
>> +{
>> +	int atid;
>> +
>> +	atid = coresight_trace_id_get_system_id();
>> +	if (atid < 0)
>> +		return atid;
>> +
>> +	drvdata->atid = atid;
>> +
>> +	return 0;
>> +}
>> +
>> +static int trace_noc_probe(struct amba_device *adev, const struct amba_id *id)
>> +{
>> +	struct device *dev = &adev->dev;
>> +	struct coresight_platform_data *pdata;
>> +	struct trace_noc_drvdata *drvdata;
>> +	struct coresight_desc desc = { 0 };
>> +	int ret;
>> +
>> +	desc.name = coresight_alloc_device_name(&trace_noc_devs, dev);
>> +	if (!desc.name)
>> +		return -ENOMEM;
>> +
>> +	pdata = coresight_get_platform_data(dev);
>> +	if (IS_ERR(pdata))
>> +		return PTR_ERR(pdata);
>> +	adev->dev.platform_data = pdata;
>> +
>> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
>> +	if (!drvdata)
>> +		return -ENOMEM;
>> +
>> +	drvdata->dev = &adev->dev;
>> +	dev_set_drvdata(dev, drvdata);
>> +
>> +	drvdata->base = devm_ioremap_resource(dev, &adev->res);
>> +	if (!drvdata->base)
>> +		return -ENOMEM;
>> +
>> +	spin_lock_init(&drvdata->spinlock);
>> +
>> +	ret = trace_noc_init_default_data(drvdata);
>> +	if (ret)
>> +		return ret;
>> +
>> +	desc.ops = &trace_noc_cs_ops;
>> +	desc.type = CORESIGHT_DEV_TYPE_LINK;
>> +	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
>> +	desc.pdata = adev->dev.platform_data;
>> +	desc.dev = &adev->dev;
>> +	desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
>> +	drvdata->csdev = coresight_register(&desc);
>> +	if (IS_ERR(drvdata->csdev))
>> +		return PTR_ERR(drvdata->csdev);
> 
> Invoke coresight_trace_id_put_system_id() for registration failure.
> 
Done in next patch.
>> +
>> +	pm_runtime_put(&adev->dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static void trace_noc_remove(struct amba_device *adev)
>> +{
>> +	struct trace_noc_drvdata *drvdata = dev_get_drvdata(&adev->dev);
>> +
>> +	coresight_trace_id_put_system_id(drvdata->atid);
>> +	coresight_unregister(drvdata->csdev);
>> +}
>> +
>> +static struct amba_id trace_noc_ids[] = {
>> +	{
>> +		.id     = 0x000f0c00,
>> +		.mask   = 0x00ffff00,
>> +	},
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(amba, trace_noc_ids);
>> +
>> +static struct amba_driver trace_noc_driver = {
>> +	.drv = {
>> +		.name   = "coresight-trace-noc",
>> +		.suppress_bind_attrs = true,
>> +	},
>> +	.probe          = trace_noc_probe,
>> +	.remove		= trace_noc_remove,
>> +	.id_table	= trace_noc_ids,
>> +};
>> +
>> +module_amba_driver(trace_noc_driver);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_DESCRIPTION("Trace NOC driver");
>> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.h b/drivers/hwtracing/coresight/coresight-tnoc.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..34c696965ec50e3664d55e04e22d5b854d6937a7
>> --- /dev/null
>> +++ b/drivers/hwtracing/coresight/coresight-tnoc.h
>> @@ -0,0 +1,34 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#define TRACE_NOC_CTRL      0x008
>> +#define TRACE_NOC_XLD       0x010
>> +#define TRACE_NOC_FREQVAL   0x018
>> +#define TRACE_NOC_SYNCR     0x020
>> +
>> +/* Enable generation of output ATB traffic.*/
>> +#define TRACE_NOC_CTRL_PORTEN   BIT(0)
>> +/* Sets the type of issued ATB FLAG packets.*/
>> +#define TRACE_NOC_CTRL_FLAGTYPE BIT(7)
>> +/* Sets the type of issued ATB FREQ packet*/
>> +#define TRACE_NOC_CTRL_FREQTYPE BIT(8)
>> +
>> +#define TRACE_NOC_SYNC_INTERVAL	0xFFFF
>> +
>> +/*
>> + * struct trace_noc_drvdata - specifics associated to a trace noc component
>> + * @base:	memory mapped base address for this component.
>> + * @dev:	device node for trace_noc_drvdata.
>> + * @csdev:	component vitals needed by the framework.
>> + * @spinlock:	only one at a time pls.
> 
> Change to "serialize enable/disable operations" ?
Done in next patch.
> 
>> + * @atid:	id for the trace packet.
>> + */
>> +struct trace_noc_drvdata {
>> +	void __iomem		*base;
>> +	struct device		*dev;
>> +	struct coresight_device	*csdev;
>> +	spinlock_t		spinlock; /* lock for the drvdata. */
> 
> Remove comment "lock for the drvdata" ?  As it has been described in
> the head comments.
it was suggested by "checkpatch.pl", removed in next patch. 
> 
>> +	u32			atid;
>> +};
> 
> Please move the content into coresight-tnoc.c and drop the header.
> 
> The definitions are private for the driver, it is not necessary to
> maintain them in a header.

Done in next patch.
> 
> 
>>
>> -- 
>> 2.34.1
>>
>> _______________________________________________
>> CoreSight mailing list -- coresight@lists.linaro.org
>> To unsubscribe send an email to coresight-leave@lists.linaro.org


