Return-Path: <linux-arm-msm+bounces-44201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 034E8A049AF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 19:55:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8C231670F4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 18:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E171F190E;
	Tue,  7 Jan 2025 18:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ed9V2840"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690CF41C6A;
	Tue,  7 Jan 2025 18:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736276148; cv=none; b=CfWPUhnHBgEt13+q1pH+kxOvnRdM0n6ImKFFnXSD04X9qM1CzUdOwlkLZMMFHRub6SOyNhViXVcendJUXguQxDdvWEBwrmGzRWxAzq7YzkdWdQsZYOuUryVEIVpz18gcrxE8EsP0qiGt0MHj65c+jcL1RbPI9jn7PmpEp/PerOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736276148; c=relaxed/simple;
	bh=BiH6nCQHtex4rc+BQ8EI6b3gwXKQmiFYTIQt05JOWVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=t0vnGeRv/SOGqnkRawvVVu2xesaYjReE83gyjYJ5zXpyU7RDwSfFTmmerdFietr67g9ljpKyCZSa6AsrPgg+MxRfS6vNuuyA3OJ3nNEDsj8QXIhwww/fzAisa1eKFthIzYkdqt9kAt9wCFUAfey0JMn618iOCJSJTEiSn5l3Oy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ed9V2840; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507A8Pvk023187;
	Tue, 7 Jan 2025 18:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MnB4R6DpJxceRTTXuWVWKyFW3MtkLh7BTThyJ0FukU0=; b=ed9V2840gBYRVav2
	Ru0lYcbWoSr/BbvHicNaBxafI/sR+znSzwHUCF/1acdUrKWBKaBsxRW8LeQeJXnW
	Mi4ZwQFNdPQD0nviR3WRGMWjVCWRSZqLLiZaWD1fZ+u0P0HSYPLQV29R4JuJu9/W
	eQZaPt/QKaw+dmAJdMebkHy91s7eFI67Tqj48uMMmogd8NlMopHxAuLkxscnp7mf
	HrSqWN5aalu2munSMtIelT0NoiEmK0gAfJrtnjZbWbOxUa9fSL+pByfVfzh99hud
	KIINWkUvUQkfgcWki8nQXzO76giwhW17gIrNoTvBV1U1meURJ/6bRXAbLQ3PAVND
	UtJGlg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44128nsayk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 18:55:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 507ItbMw003082
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 18:55:37 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 Jan 2025
 10:55:36 -0800
Message-ID: <24a9ef31-6a41-4a7a-9a4f-793d3e6ff559@quicinc.com>
Date: Tue, 7 Jan 2025 10:55:36 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] drm/msm/dpu: enable CDM for all supported platforms
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn
 Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
 <92ba142e-0793-4a47-a8b4-115050114132@quicinc.com>
 <t2pun2bz73aq426jokjlyeweknln74ygf5xj44tnmsoxowvnku@qtxqjruhfkju>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <t2pun2bz73aq426jokjlyeweknln74ygf5xj44tnmsoxowvnku@qtxqjruhfkju>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 57z7Y6R_DSJf01rW-a2efZ8Z-0ckTiU7
X-Proofpoint-ORIG-GUID: 57z7Y6R_DSJf01rW-a2efZ8Z-0ckTiU7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=739
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070155



On 1/7/2025 3:48 AM, Dmitry Baryshkov wrote:
> On Mon, Jan 06, 2025 at 07:17:40PM -0800, Abhinav Kumar wrote:
>>
>>
>> On 12/23/2024 8:25 PM, Dmitry Baryshkov wrote:
>>> Enable CDM block on all the platforms where it is supposed to be
>>> present. Notably, from the platforms being supported by the DPU driver
>>> it is not enabled for SM6115 (DPU 6.3), QCM2290 (DPU 6.5) and SM6375
>>> (DPU 6.9)
>>>
>>
>> Thanks for enabling it, but can you also explain on which of these has
>> validation already been done and on which ones you need Tested-by from the
>> community?
> 
> Actually none :D It is purely based on your CDM support and existing
> vendor DT trees. Maybe we should spend some time validating it.
> 

Ok. Let me continue the code review. Lets get back to the test status 
closer to the merge window and take a call. Even covering majority of 
the chipsets will be a win.

I can certainly signup for sa8775p, as I will be active on that platform 
in the upcoming weeks.

>>
>> Is it fair to assume that changes (3) and (4) were sent out separately and
>> not squashed into (2) because they are pending validation?
> 
> No, it's because I don't have DT (and so I didn't have reference) for
> SC8280XP or X Elite.
> 

Got it. Will take a look.

>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>> Dmitry Baryshkov (4):
>>>         drm/msm/dpu: rename CDM block definition
>>>         drm/msm/dpu: enable CDM_0 for all DPUs which are known to have it
>>>         drm/msm/dpu: enable CDM_0 for SC8280XP platform
>>>         drm/msm/dpu: enable CDM_0 for X Elite platform
>>>
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h   | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 2 +-
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 2 +-
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 2 +-
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 +
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 2 +-
>>>    26 files changed, 26 insertions(+), 4 deletions(-)
>>> ---
>>> base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
>>> change-id: 20241215-dpu-add-cdm-0b5b9283ffa8
>>>
>>> Best regards,
> 

