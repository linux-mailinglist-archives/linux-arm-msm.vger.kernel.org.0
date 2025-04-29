Return-Path: <linux-arm-msm+bounces-56164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B228AAA1A9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 20:28:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 280E118892FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 18:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31E4B253F2B;
	Tue, 29 Apr 2025 18:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kVELap5K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78044253959;
	Tue, 29 Apr 2025 18:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745951315; cv=none; b=JqCqFJMW8Ntzsb4DYru3wbLutIQ9HfZ71yO+jO4o8fvDJGG3QsoOSZenZ3tQSfXOwVJiD4DxxtTMZOsjlHvR9eLCt4ANVCdnnxPqsa972/e9oFs7HqmmhLcHn1YDCsAQrZcBX6dkTbe8JfMKuvtYPfjRZ2aDJgQqNZmEAI2/PTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745951315; c=relaxed/simple;
	bh=rVlyHHBmvxzN6Yhvxe2/pnmAc6udljIbbCM/oGG0CY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=aW5XS+GB7qs39tucLGvrskT/8ULfYL+0juNcl2wx//PEO+/V/wlbAivLLhgJURNb2PqNEUNRhMiW1jfJCnFKqeARG8civK98FB5jz8OgJvboNkLMjvr5FJj1xwmNGVrC5kNvM1+NP58quu3G4Qag6r0x4HJDSrFDVM5v9DcN8UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kVELap5K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9rPe2015584;
	Tue, 29 Apr 2025 18:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KHrirrwEEhP7dVGPE5PTtRGopr7invnnEA+2AoG5Z+Q=; b=kVELap5KcmN5MELI
	UdPuDSDs7tUZ0vtFJFH4YeHUceQkGfrrhPIIZwYxh/89OV0P2shmjTKhDgWxv00M
	1PGhH3ZdA1DpRT+SZoehljrlHfNkBoupSwsnSD79tKrLD43crZuwNzWqkeH3Q7fT
	Y34UsYLEGHHFMwtI0ENeLmeGpQWTvodYaGR0Wiznq+CXlERm3oRO+BXsGyxMfUSW
	LuuezjZLvAPIpJbeXtZQQuAu3O/M7V87cjwpIpyiaaY8ukJaOei8PkN/gTa+KnY7
	N6m6H9k2lvfD5iaRUYawmakyjZdirlxLvhZ5ZO3NPe/65otqXRxF8btnAtRZCUx3
	Is1hJA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qjwwhdj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 18:28:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53TIRgNK003705
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 18:27:42 GMT
Received: from [10.110.114.218] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 29 Apr
 2025 11:27:41 -0700
Message-ID: <c430aabe-cdf1-431b-b86e-e0b7939a21da@quicinc.com>
Date: Tue, 29 Apr 2025 11:27:40 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] drm/msm/dpu: drop TE2 definitions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?=
	<barnabas.czeman@mainlining.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
 <20250301-dpu-fix-catalog-v2-4-498271be8b50@linaro.org>
 <628f3361-6795-4e69-aac2-f9f3200eb6fe@quicinc.com>
 <iabwfwus4ze3jwekayyfgwhu5bdoerebp3sehisc7rfeic63xh@552zbik6uvmm>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <iabwfwus4ze3jwekayyfgwhu5bdoerebp3sehisc7rfeic63xh@552zbik6uvmm>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _6Z3lfSm-YiEN5UEX7BjNWzFEBognFCT
X-Proofpoint-GUID: _6Z3lfSm-YiEN5UEX7BjNWzFEBognFCT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDEzNiBTYWx0ZWRfX56TIBUNIWWnC DJUR3s6RNxVY5NDwUo2XPgLfnqmA0UZv6xC55rQPWAgcyOXDFKSLUJ8rCVW+Cv8v5lbdSWuSYV0 S2g4fHNRZFUEAAJFxO7ja0ML7XFFY/821a9OnDt9dke5eqQ86XB7x1IzdGIaKQ1xJmXBfdlfXnt
 f5xqgM58bjPRcNmbwTs51WtTrx7ayMWsAzAYFLtZw9RYBO5WP5OTc+Cub8aFn9o+W4mDZioebdU 9hA9aGGo3zX/AAfEK0iqU3VInvsRV50Y3lm5NGSDc0zglNzVnSyX2v1ZZpR72FrWRWs3ZCps5yg ZFj+MTijlpB0FJOnDCN//6+pq/dh8MfT9cwO1LsFbOg+ZVjMSQ9OMz3Esg3dOnlv7oZvsVO4kmi
 IP22KfTlnEcd/uuUl0X6bmpEFAevvEid6duY/DggXy5JdSjj3RSAJ/z8vi9YHQTnVfhQIOCw
X-Authority-Analysis: v=2.4 cv=c/urQQ9l c=1 sm=1 tr=0 ts=68111a3d cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=JL4gRZoSgvqUWVuLL9IA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_07,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=883
 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290136



On 4/29/2025 5:16 AM, Dmitry Baryshkov wrote:
> On Mon, Apr 28, 2025 at 06:33:05PM -0700, Abhinav Kumar wrote:
>>
>>
>> On 3/1/2025 1:24 AM, Dmitry Baryshkov wrote:
>>> Neither DPU driver nor vendor SDE driver do not use TE2 definitions
>>> (and, in case of SDE driver, never did). Semantics of the TE2 feature
>>> bit and .te2 sblk are not completely clear. Drop these bits from the
>>> catalog with the possibility of reintroducing them later if we need to
>>> support ppsplit.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h |  8 ++++----
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h |  8 ++++----
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h  |  8 ++++----
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h  |  4 ++--
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  |  8 ++++----
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 17 -----------------
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          |  6 +-----
>>>    7 files changed, 19 insertions(+), 40 deletions(-)
>>>
>>
>> <snip>
>>
>>> @@ -465,22 +459,11 @@ static const struct dpu_dspp_sub_blks sdm845_dspp_sblk = {
>>>    /*************************************************************
>>>     * PINGPONG sub blocks config
>>>     *************************************************************/
>>> -static const struct dpu_pingpong_sub_blks msm8996_pp_sblk_te = {
>>> -	.te2 = {.name = "te2", .base = 0x2000, .len = 0x0,
>>> -		.version = 0x1},
>>> -};
>>>    static const struct dpu_pingpong_sub_blks msm8996_pp_sblk = {
>>>    	/* No dither block */
>>>    };
>>> -static const struct dpu_pingpong_sub_blks sdm845_pp_sblk_te = {
>>> -	.te2 = {.name = "te2", .base = 0x2000, .len = 0x0,
>>> -		.version = 0x1},
>>> -	.dither = {.name = "dither", .base = 0x30e0,
>>> -		.len = 0x20, .version = 0x10000},
>>> -};
>>> -
>>
>> Agreed about TE2. I do not see even te2 sub-block programming in
>> dpu_hw_pingpong but why do we also need to drop dither?
> 
> sdm845_pp_sblk has the dither block. If you scroll the original patch,
> you'd see PPs being switched to that sblk definition.
> 

Ack,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>



