Return-Path: <linux-arm-msm+bounces-49472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 02028A45C15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 11:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D1A47A6DFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 10:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9AD2673A3;
	Wed, 26 Feb 2025 10:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bIHTaAVG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B47824E01E;
	Wed, 26 Feb 2025 10:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740566674; cv=none; b=goiCuS/CwgYgl5viF3+/ITXkzDQ8lc6ukgWiCWSwEuyd3vhW8wjI1Xn7unCUV3yWkOki3kBv6ifi5FXt179syo6n5PRcvVf0FRukgubk+FhZ7ZO4RnV2iufR7OxB4/7802NHfMuIlFtpMOUzNEl68HQavwWdLQXN+dh4iv9fsU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740566674; c=relaxed/simple;
	bh=a+VLb1uo63X22UpMZnjWuAzAvl+QuCcIaAxbSBtDjDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GpzXyRmtWEwZUx6BWkAbYL5NzLZwP8fETI0eGn7ql1YQdjohSwGV7BC8flDEoWaVleZMVjYz0XPMJgdif+bE+iB1WbYsCVbaMYMja+Va1GnKAgp9KnOnMLAtkMUxAcVd88qsQge0B3Ps2lE90/CRLiL/c6i60BjC79Xfv8QlFH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bIHTaAVG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q9xGdq023826;
	Wed, 26 Feb 2025 10:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RI3j6QNwCd3E9WU+AhkXeYiWCb5d3Rx1nK60VGbwaBM=; b=bIHTaAVGTL5S3YAH
	jlA0utMUcg6yFORPmn1aHaZv1AyuVV8UgMlCRhaFAjeGnY+BTYCN5fdqb8fI7Z/u
	2uPmO4+8knNVjYqU7PmEk+hlZ4lIQol+35kJYjM4CFzWH4HOMjcjR70tQ48r6X+a
	1VDTtewbGaCmwrS5ekpb4/V5ZH+E7OsJvs2A/ByAYfwV740I6m09Ha+OGEIapg0Y
	TSSlfiwJIbe9/ah7F8Rbp6NC3Q2mHjdR37TYUqCwPao2jqOsENehebJAfXBc7LYJ
	aazGkMywkZJJAZVCuG03Lz8ISnj+QZvzrfBZkz64vyvfnhyYSeJZphwSAgJCnUsz
	8a5fJg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prmhnw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 10:44:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51QAiJxp011305
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 10:44:19 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Feb
 2025 02:44:11 -0800
Message-ID: <13cabef8-8e68-412e-a6eb-42d22604f941@quicinc.com>
Date: Wed, 26 Feb 2025 18:44:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] coresight: add coresight Trace NOC driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark
	<james.clark@linaro.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20250221-trace-noc-driver-v1-0-0a23fc643217@quicinc.com>
 <20250221-trace-noc-driver-v1-2-0a23fc643217@quicinc.com>
 <38996ae8-321b-4239-8fe9-b769fdff296c@kernel.org>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <38996ae8-321b-4239-8fe9-b769fdff296c@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ix_23qutW023h22aYfSDWugCTYUvCKNE
X-Proofpoint-ORIG-GUID: ix_23qutW023h22aYfSDWugCTYUvCKNE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 adultscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502260086



On 2/22/2025 6:54 PM, Krzysztof Kozlowski wrote:
> On 21/02/2025 08:40, Yuanfang Zhang wrote:
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
>>  drivers/hwtracing/coresight/Kconfig          |  10 ++
>>  drivers/hwtracing/coresight/Makefile         |   1 +
>>  drivers/hwtracing/coresight/coresight-tnoc.c | 191 +++++++++++++++++++++++++++
>>  drivers/hwtracing/coresight/coresight-tnoc.h |  53 ++++++++
>>  4 files changed, 255 insertions(+)
>>
>> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
>> index 06f0a7594169c5f03ca5f893b7debd294587de78..712b2469e37610e6fc5f15cedb2535bf570f99aa 100644
>> --- a/drivers/hwtracing/coresight/Kconfig
>> +++ b/drivers/hwtracing/coresight/Kconfig
>> @@ -247,4 +247,14 @@ config CORESIGHT_DUMMY
>>  
>>  	  To compile this driver as a module, choose M here: the module will be
>>  	  called coresight-dummy.
>> +
>> +config CORESIGHT_TNOC
>> +	tristate "Coresight Trace Noc driver"
>> +	help
>> +	  This driver provides support for Trace NoC component.
>> +	  Trace NoC is a interconnect that is used to collect trace from
>> +	  various subsystems and transport it QDSS trace sink.It sits in
>> +	  the different tiles of SOC and aggregates the trace local to the
>> +	  tile and transports it another tile or to QDSS trace sink eventually.
>> +
>>  endif
>> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
>> index 4ba478211b318ea5305f9f98dda40a041759f09f..ab1cff8f027495fabe3872d52f8c0877e39f0ea8 100644
>> --- a/drivers/hwtracing/coresight/Makefile
>> +++ b/drivers/hwtracing/coresight/Makefile
>> @@ -51,3 +51,4 @@ coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
>>  		   coresight-cti-sysfs.o
>>  obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
>>  obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
>> +obj-$(CONFIG_CORESIGHT_TNOC) += coresight-tnoc.o
> 
> Why do you keep adding entries to the end instead to some logically
> ordered place?
> 
> Dummy driver, before tpda (obviously tpda should go after tpdm) and now
> this... This is just unnecessarily making simultaneous edits difficult.
> 
sure, add it after funnel/replicator before etm, since it work as a link.

>> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..11b9a7fd1efdc9fff7c1e9666bda14acb41786cb
>> --- /dev/null
>> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
>> @@ -0,0 +1,191 @@
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
> 
> 
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
>> +
>> +	pm_runtime_put(&adev->dev);
>> +
>> +	dev_dbg(drvdata->dev, "Trace Noc initialized\n");
> 
> 
> Drop. There is really no need to tell that function finished.
> 
> Please run standard kernel tools for static analysis, like coccinelle,
> smatch and sparse, and fix reported warnings. Also please check for
> warnings when building with W=1. Most of these commands (checks or W=1
> build) can build specific targets, like some directory, to narrow the
> scope to only your code. The code here looks like it needs a fix. Feel
> free to get in touch if the warning is not clear.
> 
Done.
> 
> Best regards,
> Krzysztof
> 


