Return-Path: <linux-arm-msm+bounces-40933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6782F9E8906
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 02:44:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EDF41885C94
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 01:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2427121364;
	Mon,  9 Dec 2024 01:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CRdQVIiV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B9B17741;
	Mon,  9 Dec 2024 01:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733708694; cv=none; b=UKlIbfALHb3N+E1sotX7HSHOaiIb04P+dOYcA99CpLIVFlAIbA7M3rLOu0RT1oANOwsXHVGpK7yOh60baiK16p0BUKj2bO2SaLWI4r3V+KVP3MxejJic9XlKX/XLzAhl+Jq0qXYsVr+JdsnbRsZ8ucBBGwbJWTJhLnDN3pT4uPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733708694; c=relaxed/simple;
	bh=a+3NWevTMSLdvyul6UXKHhoFsx7DeZhvWJAsNvUVMjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nktbuuiO2q6dhQlE0vISOzOiNehVElEc4+7Rlkc3YZ8DbbCpQ1W3xBGUocXY1KYCwPyV0+pe+IE8j2BdRHVIM9uH54QgLir6lsuaqs3UzhrlWV9G0hdDvufVADJ1xJyEkW/FYdXH0IjQs8ytEfir29+6jqp6z3gRNNlsE77pvUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CRdQVIiV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9017xs012697;
	Mon, 9 Dec 2024 01:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mONfncm9hTek7jcougy3xSCm6rv4bmG3B6zaPol5p8s=; b=CRdQVIiVJoyJvgfP
	sNwJrCXjY0zLONqgfds4bqv3EyyGmMjgD45okpHdukbx7fb/MH9gXYxIcu0vHCgE
	aeDkX90GyuwF1jPUR6M3EUuKD3VdqsFPKG7WmXXi1JcgtP7fcncdYF08ZZO6HN64
	r/bvWnBERBZ4xPHX50JSRRhexDQ2+eNk6ni/dyM7j/gRou9MLLBI7M5anFUPhAdV
	7ZYXBzbSOO0zabPL1Y7qvJFG150maTpp4OiMs/Cq2skBSQLpNHssfpC3Z6L1Jnjm
	7ly3FVDqjZW6GfZn4scPciwGlimNLoIqBUDwrB8M56pB+P+0KhXS9q1fkqZo0Iog
	2MgtFA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ceetk03m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 01:44:29 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B91iSBn020361
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 01:44:28 GMT
Received: from [10.64.16.151] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 8 Dec 2024
 17:44:22 -0800
Message-ID: <afd00fdf-af62-46b5-9131-ed360a93e094@quicinc.com>
Date: Mon, 9 Dec 2024 09:44:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] drm/msm/dpu: Add SM6150 support
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark
	<robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Sean
 Paul" <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, "Li
 Liu" <quic_lliu6@quicinc.com>,
        Xiangxu Yin <quic_xiangxuy@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-5-35252e3a51fe@quicinc.com>
 <c1b2fe04-e43e-4ab7-b0f8-2bb2ce6e1313@quicinc.com>
Content-Language: en-US
From: fange zhang <quic_fangez@quicinc.com>
In-Reply-To: <c1b2fe04-e43e-4ab7-b0f8-2bb2ce6e1313@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FwBFuB_mvjA8on_c0eMLzgSptP0zqSaY
X-Proofpoint-ORIG-GUID: FwBFuB_mvjA8on_c0eMLzgSptP0zqSaY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090012



On 2024/12/7 4:17, Abhinav Kumar wrote:
> 
> 
> On 11/22/2024 1:56 AM, Fange Zhang wrote:
>> From: Li Liu <quic_lliu6@quicinc.com>
>>
>> Add definitions for the display hardware used on the Qualcomm SM6150
>> platform.
>>
>> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
>> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
>> ---
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h | 263 +++++++++++ 
>> ++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>>   4 files changed, 266 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/ 
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
>> new file mode 100644
>> index 
>> 0000000000000000000000000000000000000000..e8b7f694b885d69a9bbfaa85b0faf0c7af677a75
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
>> @@ -0,0 +1,263 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights 
>> reserved.
>> + */
>> +
>> +#ifndef _DPU_5_3_SM6150_H
>> +#define _DPU_5_3_SM6150_H
>> +
>> +
> 
> <snip>
> 
>> +static const struct dpu_sspp_cfg sm6150_sspp[] = {
>> +    {
>> +        .name = "sspp_0", .id = SSPP_VIG0,
>> +        .base = 0x4000, .len = 0x1f0,
>> +        .features = VIG_SDM845_MASK,
> 
> This is not correct. Smartdma is supported on this chipset on both Vig 
> and DMA SSPPs.
> 
> Please use VIG_SDM845_MASK_SDMA and DMA_SDM845_MASK_SDMA respectively.
Got it, will replace them in next patch
> 
> 
>> +        .sblk = &dpu_vig_sblk_qseed3_2_4,
>> +        .xin_id = 0,
>> +        .type = SSPP_TYPE_VIG,
>> +        .clk_ctrl = DPU_CLK_CTRL_VIG0,
>> +    }, {
>> +        .name = "sspp_8", .id = SSPP_DMA0,
>> +        .base = 0x24000, .len = 0x1f0,
>> +        .features = DMA_SDM845_MASK,
>> +        .sblk = &dpu_dma_sblk,
>> +        .xin_id = 1,
>> +        .type = SSPP_TYPE_DMA,
>> +        .clk_ctrl = DPU_CLK_CTRL_DMA0,
>> +    }, {
>> +        .name = "sspp_9", .id = SSPP_DMA1,
>> +        .base = 0x26000, .len = 0x1f0,
>> +        .features = DMA_SDM845_MASK,
>> +        .sblk = &dpu_dma_sblk,
>> +        .xin_id = 5,
>> +        .type = SSPP_TYPE_DMA,
>> +        .clk_ctrl = DPU_CLK_CTRL_DMA1,
>> +    }, {
>> +        .name = "sspp_10", .id = SSPP_DMA2,
>> +        .base = 0x28000, .len = 0x1f0,
>> +        .features = DMA_CURSOR_SDM845_MASK_SDMA,
>> +        .sblk = &dpu_dma_sblk,
>> +        .xin_id = 9,
>> +        .type = SSPP_TYPE_DMA,
>> +        .clk_ctrl = DPU_CLK_CTRL_DMA2,
>> +    }, {
>> +        .name = "sspp_11", .id = SSPP_DMA3,
>> +        .base = 0x2a000, .len = 0x1f0,
>> +        .features = DMA_CURSOR_SDM845_MASK_SDMA,
>> +        .sblk = &dpu_dma_sblk,
>> +        .xin_id = 13,
>> +        .type = SSPP_TYPE_DMA,
>> +        .clk_ctrl = DPU_CLK_CTRL_DMA3,
>> +    },
>> +};
>> +
> 
> <snip>


