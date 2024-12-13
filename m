Return-Path: <linux-arm-msm+bounces-42077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FC29F1120
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 16:37:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3649E161DD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 15:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694FE1E2611;
	Fri, 13 Dec 2024 15:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U+u0Nmmb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B071DF988
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 15:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734104274; cv=none; b=Q4ayNBjCH0XnKKYYGhRCAJwaCej7KZjuR+mBLFA4cy5gywiUScpIoiTV8B9BttV2ZrRG8Bj1ofXv0lOh8fySpQrQaQFLCXpZJFoIb02bQLSDZ5HGqeDj0bHWPZ6/HzpyYC4NDlWUkCaz31QC2k/Lhim2ckSHiH5FZOfD6RlF2YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734104274; c=relaxed/simple;
	bh=7WerpZcKbqHENodbtNNYWAZ+GnB2HRsJN5G50P5KUOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KmtWzCgYKqH2ASe8UTmimpMx7sAGc+l/a1rvhgc3I0g5/1+M0evYy7zMQ/Ut3Llkstyf0HUndM+MizDs4UofM4yjFISPFxbY0eamMV06aONbRWRf/nWYzW4C0jK+evjzoO/TKQ02umhgYW47HeUoPGxNMeARLH0UY+psi7XVlOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U+u0Nmmb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD81cAE022183
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 15:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IAuh6gAzIOcOgoebHEWrPvAFfOUQNYFpwXM6Ek66GNU=; b=U+u0NmmbKWyZD2Dt
	1lbbcqrilk1jbDbG6Y5HxoXcjGYEZCtn6P+KrzbKcq/7rIfwBeNFKIHdmqTnEJjd
	8i3uPNHsCqggMQbknOnfh4NeeAZylI2cGY03YYOC55Lak07ON8McgVxpKjPLt4+u
	XP/j+jvMrR9mzEEaTMg7UTKnRhpWV0k9rOl70EhrsRXpvn+XmWB4weewT1Lmg+4J
	sbHDYlVxDU2+5iZiE1S9CwjAE5htcXBgRwY6q3Z9DA6bvkbyadmpEsvNg0GBSIAj
	cUuf6mt1YwRak+s7GrsDjGvraa+C9qZOBORDvDJ6/2DDaHmgHMQp/E3WJ/A5IQ8e
	XqFaEg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gh2719wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 15:37:51 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-467a437e5feso2492471cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 07:37:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734104271; x=1734709071;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IAuh6gAzIOcOgoebHEWrPvAFfOUQNYFpwXM6Ek66GNU=;
        b=JsgtVNl2HxFrr+Pvq3yNVA/xiwVqT9kKL7Zr/4PJZR++ENRxt11uly53BIop64awGS
         jBR/Nmut9rfvF0ixoO1I4JfDI1Dyf5GSBAtMuZAursc4yCgOOVfm3MFCXTKC12JdYrDh
         2vGzrTZiTvVLobjGQ4kcq5riII5zSJ0XDfhOKtIclC9MvfT1nS9yrf+ZEOXVi4q8Slvc
         5+ZSYHP8jb6HwUYdSsOrXfEbH6xSy7vWRSW0mCZ9w1YQXQQ0xDliSgHNRrtcuAV+0oDB
         aHiviXIVNLdiZXdqVsWNnFv9giBfQ2qtUIQm4ajfkZ9I99lNfVnIIKkIw+LKOwzrWFZv
         qsiw==
X-Gm-Message-State: AOJu0YxdmNr6D0T5g0bm4YcHmt5LCz/sc2vb8MQIbrdqYltB5PNs/Hrg
	Gy8vhUXctKk2qFIt5htFfb8GEYyELRrhH9uLpZaBZdDCE8Wdg0KMXy7+2D8dDB2feRkX/h1/yTr
	O4fOlcVNO6FfQLT56bYmXo2ogSO2P5p6Pv8jX7tJET3Xa1cjm24ItQZtOWqbTtRtr
X-Gm-Gg: ASbGncta6thwvHSr3NE2YUqj40Y3lBRnDreJCbEmjDsHNsBzOSzeJxewtdEwwbaoumJ
	eIEOInK69Ln/SaEMEyWxc10rF8e2DXpaeFsOJ34KWucerU/vZ/qm+0j75mkzF/z44Mqa5AiLoGs
	UENQHjPl1k8Z7WUCpctup7dXlemvDHttj2u7fsZFuoPpvFBP0Wo+hHtN7rudUrCwA07oCf4KvBY
	yO84kJc+q9CWb8SmFbIFhmrxCnf/qzczzf93SAPGvZinrAsMCPuTBlvouC10d1MB3Hci5ULcQBu
	GpYDtLocEZbK1j9h5b2DaDok0KkquBAUKgGK
X-Received: by 2002:a05:620a:19a6:b0:7b6:ea67:72e0 with SMTP id af79cd13be357-7b6fbee6f78mr152570085a.4.1734104270616;
        Fri, 13 Dec 2024 07:37:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEf/CW5ZuciDywJGCmdtNJG8VLca/dJqdwL5fK5+1TZgYmvE4Jg2xI8dXYsCHD3ZxplcGHEaA==
X-Received: by 2002:a05:620a:19a6:b0:7b6:ea67:72e0 with SMTP id af79cd13be357-7b6fbee6f78mr152567485a.4.1734104270201;
        Fri, 13 Dec 2024 07:37:50 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa699618041sm615380666b.81.2024.12.13.07.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 07:37:49 -0800 (PST)
Message-ID: <c2d8f443-5876-4293-8d2b-ecd13eaf8285@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 16:37:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] drm/msm: adreno: find bandwidth index of OPP and
 set it along freq index
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, neil.armstrong@linaro.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
 <20241211-topic-sm8x50-gpu-bw-vote-v5-4-6112f9f785ec@linaro.org>
 <ddf91ba2-cab2-4653-b842-65a8e82b5160@oss.qualcomm.com>
 <2f1c6deb-29f8-4144-b086-743fb0f8495c@linaro.org>
 <80bed70e-7802-4555-a15e-e06fe46214c6@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <80bed70e-7802-4555-a15e-e06fe46214c6@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: t7BrfHTbJvJKMLK0jQyIVXjUUWzi_NEV
X-Proofpoint-GUID: t7BrfHTbJvJKMLK0jQyIVXjUUWzi_NEV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130111

On 13.12.2024 2:12 PM, Akhil P Oommen wrote:
> On 12/13/2024 3:07 AM, Neil Armstrong wrote:
>> On 12/12/2024 21:21, Konrad Dybcio wrote:
>>> On 11.12.2024 9:29 AM, Neil Armstrong wrote:
>>>> The Adreno GPU Management Unit (GMU) can also scale the DDR Bandwidth
>>>> along the Frequency and Power Domain level, until now we left the OPP
>>>> core scale the OPP bandwidth via the interconnect path.
>>>>
>>>> In order to enable bandwidth voting via the GPU Management
>>>> Unit (GMU), when an opp is set by devfreq we also look for
>>>> the corresponding bandwidth index in the previously generated
>>>> bw_table and pass this value along the frequency index to the GMU.
>>>>
>>>> The GMU also takes another vote called AB which is a 16bit quantized
>>>> value of the floor bandwidth against the maximum supported bandwidth.
>>>>
>>>> The AB is calculated with a default 25% of the bandwidth like the
>>>> downstream implementation too inform the GMU firmware the minimal
>>>> quantity of bandwidth we require for this OPP.
>>>>
>>>> Since we now vote for all resources via the GMU, setting the OPP
>>>> is no more needed, so we can completely skip calling
>>>> dev_pm_opp_set_opp() in this situation.
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 39 ++++++++++++++++++++++++
>>>> +++++++++--
>>>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  2 +-
>>>>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c |  6 +++---
>>>>   drivers/gpu/drm/msm/adreno/a6xx_hfi.h |  5 +++++
>>>>   4 files changed, 46 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/
>>>> msm/adreno/a6xx_gmu.c
>>>> index
>>>> 36696d372a42a27b26a018b19e73bc6d8a4a5235..46ae0ec7a16a41d55755ce04fb32404cdba087be 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>>> @@ -110,9 +110,11 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu,
>>>> struct dev_pm_opp *opp,
>>>>                  bool suspended)
>>>>   {
>>>>       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>>> +    const struct a6xx_info *info = adreno_gpu->info->a6xx;
>>>>       struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>>>       struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>>>>       u32 perf_index;
>>>> +    u32 bw_index = 0;
>>>>       unsigned long gpu_freq;
>>>>       int ret = 0;
>>>>   @@ -125,6 +127,37 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu,
>>>> struct dev_pm_opp *opp,
>>>>           if (gpu_freq == gmu->gpu_freqs[perf_index])
>>>>               break;
>>>>   +    /* If enabled, find the corresponding DDR bandwidth index */
>>>> +    if (info->bcms && gmu->nr_gpu_bws > 1) {
>>>
>>> if (gmu->nr_gpu_bws)
>>
>> gmu->nr_gpu_bws == 1 means there's not BW in the OPPs (index 0 is the
>> "off" state)
>>
>>>
>>>> +        unsigned int bw = dev_pm_opp_get_bw(opp, true, 0);
>>>> +
>>>> +        for (bw_index = 0; bw_index < gmu->nr_gpu_bws - 1; bw_index+
>>>> +) {
>>>> +            if (bw == gmu->gpu_bw_table[bw_index])
>>>> +                break;
>>>> +        }
>>>> +
>>>> +        /* Vote AB as a fraction of the max bandwidth */
>>>> +        if (bw) {
>>>
>>> This seems to only be introduced with certain a7xx too.. you should
>>> ping the GMU with HFI_VALUE_GMU_AB_VOTE to check if it's supported
>>
>> Good point
> 
> No no. Doing this will trigger some assert in pre-A750 gmu firmwares. We
> learned it the hard way. No improvisation please. :)

We shouldn't be sending that AB data to firmware that doesn't expect
it either too, though..

Konrad

