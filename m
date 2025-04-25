Return-Path: <linux-arm-msm+bounces-55762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C62C3A9D2CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 22:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 202639A6A18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 20:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E8D219303;
	Fri, 25 Apr 2025 20:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="exEJJvoB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38323190692;
	Fri, 25 Apr 2025 20:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745612313; cv=none; b=C0/QlOh4djP7bTipiDNsjvcDErbGMCr5MJPOFWGo7b9r6jLEKTpmsj9uT2Kkiglw0QNnz1wuqHO1BDqfdofsEYmZIb+eBd0iipE4VOqKHfQp7I1PtWL+LLPROx7hi6hxpbJEfYmKEarFzxQOcbelVwi4jyrGpJgV/XWHIJS2Iw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745612313; c=relaxed/simple;
	bh=gvYAN089JCt6WwSt7YZcbJ1WRkxTh2ktUaEg1PoBk/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Xc6bETlJSMtfs0vKaO9NDmFsWKSS7NMIypJ5MkXrOfSIPuZhhxCLhHC+csfDZWEGnYSkTUJh08CAM8eOOgXIu97t+OsAGtFYk2wqb0A4UFvKeLbi8v/IL5wOVecO/IVzJpm5tUwoxPVK+GdskpjcJ/UF3HjpkIiPSrTrMRzUXrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=exEJJvoB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJplt031925;
	Fri, 25 Apr 2025 20:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jJYqZXzdF32jhKcPVa2dqOGh8Ls4BKAg3Edx1wDdRiE=; b=exEJJvoBx9UTm2hv
	Nr6IUOjoRsfdIFkhPpq5kNUatEYpOq6ehwJ0YgLU9lITU8iHhNbmllmYHnz18Lpq
	/16i2kAoDUy1aV4r5ZXlpZ1cMH6feQCAfy1TcLGGjncoMTK6auKzdBCU9SdgerdB
	PRf85x+83y4m+iMvXYXHqLl8uk4Ab/2eK5laKGlNd5H6VvDaz0RsPoCDM3M07+T6
	yiUkpw4w+yd2cr+ILTDglFUYEpTl0YArRBctsQdyXWtsGohF11kzr6Pbrgty/+tP
	SSFOuTAx1PKTeCVAk/dZQokGlJUc+Bjuq8a9bNWDxrZ0PrBbCQcITiXf9QTXgn69
	YZKHzA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgya6ca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 20:18:23 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53PKIM7a020914
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 20:18:22 GMT
Received: from [10.134.71.99] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Apr
 2025 13:18:22 -0700
Message-ID: <a5975b9d-fc0e-4db6-8f61-b6ae6f3f17fe@quicinc.com>
Date: Fri, 25 Apr 2025 13:18:21 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/msm/dpu: enable SmartDMA on SM8150
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250308-dpu-rework-vig-masks-v1-0-f1b5d101ae0b@linaro.org>
 <20250308-dpu-rework-vig-masks-v1-1-f1b5d101ae0b@linaro.org>
 <bf242898-bf47-4235-9086-745bd4f05acf@quicinc.com>
 <c62wafi73jwdf7qz5a7gp3xqhqg27aifn5ollr7dmufeaeyldr@rbzbtpbfenkc>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <c62wafi73jwdf7qz5a7gp3xqhqg27aifn5ollr7dmufeaeyldr@rbzbtpbfenkc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0NCBTYWx0ZWRfX7XF499v8vR3I XEKEdy0bt8hD4F95LcvpzqL7ulOQjiXWc0xgIJOt8vYG0NSRpslXz37JcDmrJtXW3UNY9vQ7kVY ZuQ/K9abOX6ptoA+i1lxY33RJYqPP0P+yEIoLYOR7PcPrQHBZBkPhQlbqRUGbThYv1h7F3lr9ZU
 enOiOZe7tcbEC50KXmnPuGFPIOuRxnYtVaBC5GpU+kNldgyuS8MmKhom62YmvdaMVPlltXDnxnv rsPx3HI/LivdcCZ9pG+N6JIM6A+OU6aDXicr7KUj1iIpS8zPKxZKxUjqgqNL0Yp77cKNLZ9PCa5 ud7Y+1DeGyxbYMZDWpQ9z+orm6HTgZVGpuVga853QMRPyO/3R76NgfpDLQq3GMLbTMLIT0RAPxz
 VxjfNH9ptxsuWONE9QxdfiIfXt2Zkbpb32O0MIMjGg+Wco/iV/48l6oGoCetwoG+s6O9V7ZK
X-Proofpoint-GUID: 6Cnef_pjvbNS2j5_wTmyn5xSX_7DXKXp
X-Proofpoint-ORIG-GUID: 6Cnef_pjvbNS2j5_wTmyn5xSX_7DXKXp
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680bee0f cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=ep-ZKmNeXLTrS1u6wGwA:9
 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250144



On 4/25/2025 11:53 AM, Dmitry Baryshkov wrote:
> On Fri, Apr 25, 2025 at 11:26:20AM -0700, Jessica Zhang wrote:
>>
>>
>> On 3/7/2025 9:38 PM, Dmitry Baryshkov wrote:
>>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> Reworking of the catalog dropped the SmartDMA feature bit on the SM8150
>>> platform. Renable SmartDMA support on this SoC.
>>>
>>> Fixes: 460c410f02e4 ("drm/msm/dpu: duplicate sdm845 catalog entries")
>>
>> Hi Dmitry,
>>
>> The code LGTM, but was just wondering why there's a fixes tag for the first
>> two patches but not for the other catalog changes.
>>
>> Is there some context I'm missing with regards to this?
> 
> As I wrote in the commit message, SmartDMA for these two platforms was
> enabled previously, but then it got disabled by the mistake in the
> commit 460c410f02e4 ("drm/msm/dpu: duplicate sdm845 catalog entries").
> For the rest of the platforms SmartDMA supoprt was never enabled, so
> no need for Fixes tags.

Ah, sorry I missed that sdm845_sspp has the SDMA feature flag.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

> 
>>
>> Thanks,
>>
>> Jessica Zhang
>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 16 ++++++++--------
>>>    1 file changed, 8 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>>> index 23188290001ffb45563a9953a9f710bacb4dac89..fe4de5b31644de33b77a882fa21a18f48ecd1790 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>>> @@ -76,7 +76,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
>>>    	{
>>>    		.name = "sspp_0", .id = SSPP_VIG0,
>>>    		.base = 0x4000, .len = 0x1f0,
>>> -		.features = VIG_SDM845_MASK,
>>> +		.features = VIG_SDM845_MASK_SDMA,
>>>    		.sblk = &dpu_vig_sblk_qseed3_1_4,
>>>    		.xin_id = 0,
>>>    		.type = SSPP_TYPE_VIG,
>>> @@ -84,7 +84,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
>>>    	}, {
>>>    		.name = "sspp_1", .id = SSPP_VIG1,
>>>    		.base = 0x6000, .len = 0x1f0,
>>> -		.features = VIG_SDM845_MASK,
>>> +		.features = VIG_SDM845_MASK_SDMA,
>>>    		.sblk = &dpu_vig_sblk_qseed3_1_4,
>>>    		.xin_id = 4,
>>>    		.type = SSPP_TYPE_VIG,
>>> @@ -92,7 +92,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
>>>    	}, {
>>>    		.name = "sspp_2", .id = SSPP_VIG2,
>>>    		.base = 0x8000, .len = 0x1f0,
>>> -		.features = VIG_SDM845_MASK,
>>> +		.features = VIG_SDM845_MASK_SDMA,
>>>    		.sblk = &dpu_vig_sblk_qseed3_1_4,
>>>    		.xin_id = 8,
>>>    		.type = SSPP_TYPE_VIG,
>>> @@ -100,7 +100,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
>>>    	}, {
>>>    		.name = "sspp_3", .id = SSPP_VIG3,
>>>    		.base = 0xa000, .len = 0x1f0,
>>> -		.features = VIG_SDM845_MASK,
>>> +		.features = VIG_SDM845_MASK_SDMA,
>>>    		.sblk = &dpu_vig_sblk_qseed3_1_4,
>>>    		.xin_id = 12,
>>>    		.type = SSPP_TYPE_VIG,
>>> @@ -108,7 +108,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
>>>    	}, {
>>>    		.name = "sspp_8", .id = SSPP_DMA0,
>>>    		.base = 0x24000, .len = 0x1f0,
>>> -		.features = DMA_SDM845_MASK,
>>> +		.features = DMA_SDM845_MASK_SDMA,
>>>    		.sblk = &dpu_dma_sblk,
>>>    		.xin_id = 1,
>>>    		.type = SSPP_TYPE_DMA,
>>> @@ -116,7 +116,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
>>>    	}, {
>>>    		.name = "sspp_9", .id = SSPP_DMA1,
>>>    		.base = 0x26000, .len = 0x1f0,
>>> -		.features = DMA_SDM845_MASK,
>>> +		.features = DMA_SDM845_MASK_SDMA,
>>>    		.sblk = &dpu_dma_sblk,
>>>    		.xin_id = 5,
>>>    		.type = SSPP_TYPE_DMA,
>>> @@ -124,7 +124,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
>>>    	}, {
>>>    		.name = "sspp_10", .id = SSPP_DMA2,
>>>    		.base = 0x28000, .len = 0x1f0,
>>> -		.features = DMA_CURSOR_SDM845_MASK,
>>> +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
>>>    		.sblk = &dpu_dma_sblk,
>>>    		.xin_id = 9,
>>>    		.type = SSPP_TYPE_DMA,
>>> @@ -132,7 +132,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
>>>    	}, {
>>>    		.name = "sspp_11", .id = SSPP_DMA3,
>>>    		.base = 0x2a000, .len = 0x1f0,
>>> -		.features = DMA_CURSOR_SDM845_MASK,
>>> +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
>>>    		.sblk = &dpu_dma_sblk,
>>>    		.xin_id = 13,
>>>    		.type = SSPP_TYPE_DMA,
>>>
>>
> 


