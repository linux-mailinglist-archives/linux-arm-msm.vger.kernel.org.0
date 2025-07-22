Return-Path: <linux-arm-msm+bounces-66123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA5CB0DFC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 17:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E5FF1C809BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 14:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67A42EB5A8;
	Tue, 22 Jul 2025 14:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fvxP2BTG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE762EB5CA
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 14:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753195971; cv=none; b=VPi7cdmqFL9G9vZuPcSdtmuYnIZM+wg8/AwetBTJJf42Ual1kIYBhti5JZZLLPCLZD0mKD89YMmQtAj2l/AEsOePWwn9aluXiRwNMpPGiJmc4xURlvIHWcxc4POVLy6oarrOrE0QBAt/cZVK6iwfTRfBcJ8IbCwupW2B5HX0vYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753195971; c=relaxed/simple;
	bh=s0m4k4vhvlmEm6wl//KcvINRIeeEDvKsYatA7FZ8BJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S8ERlpkVgH2FUqf6i8sHnNpVHVptC2Z5lRWQSoXDUUakaucdKtq763uGptR6cmCvssFFq5eMo6ftRAiu/Uh+b1HHW5YcnlTSr7/W1r1+Uug+QZPP6DzBX6t4mUJp2/6k7bt+hBcJPvihqYca8iC1tmRjtiI+lI2+TQ/vYxLqSzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fvxP2BTG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M9F4pc012705
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 14:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JKfgySS6e/EZJ9CHZwXQOHZ4Nnh1OaO/SrNWrKkQSd8=; b=fvxP2BTG2vlJvOGG
	PublOSHqG307548zzPWYE6pIZE6E79GhiPnSSxeif2V/g5SiIu9r/qyg4VQhN+o7
	+krg7HRQccZS8t/HiuOdrBT4b2ZTRv3vRPViQ83jIBGH+jLDMsofTcjknsaH0usz
	Q4xV9Bx/sEchi0sy9FZ1fFMaLFgzf1MzKyE0q3LwBkl6/VGKd+9Yw9yLkfdylxN7
	C+F4vN/cAJCciQFNNC3LG6OsyAOryVBnQzdjuA3SQC7CQ0beaOGcvamcupBZVnfz
	PeF/LAaQ7KzQXFav3XB4wqge/ks+xi/o+OYtT0BhtWeKnP4ME/nL0IAS+X5aCq8t
	OIWLYw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6m4cm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 14:52:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fd5e07066eso17391036d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753195950; x=1753800750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JKfgySS6e/EZJ9CHZwXQOHZ4Nnh1OaO/SrNWrKkQSd8=;
        b=sTSVzVoPra7G8FVgJ7I+MeTrKoNlkaIjhNbkiIFoR+5tdyPl6jCvMxTObJ7285UJlI
         jtYrb0P/kgI/S9MVOhFpq6q9Y9WCU2eBemR0lBdhC5XDALvl10rI/9hY6Saro0ecxkLx
         uGMaQBMNLgtD8AEd7JOFZUVJFdX0lXz3/m/c2o6I+F5qcrAcMUJba7DbfU7GXkZ61pvn
         eW99bHOpRsZ5U26Qd5xQ/CZBqwgmEfgvHoejvmBTB+IZwmDEm9Oy/4+GJT3SXbOtiZib
         iN9fNyF9L4vJFT1Tkn/pNID2fBu2JkXndl7CFpp8Lk+ijSFIKyNozm5Q3QcEhdyOZji8
         AVcA==
X-Forwarded-Encrypted: i=1; AJvYcCXJDbG/K/l+EJGtE3u1tMiBTyslfVl+H48tLe/+epXSRPGoEySgZTKl7r6KyqAnzo3pF6i3P3QZZhBBPRxQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yww9BLQQ/gsoIZKY7oBF/5Ei6mLU6fKS4jg7gewsTobksaZlBa/
	W+ymUiDQkE2jLUhyptM1Gl7yToY1y3gEWNRZAU3LQyuw6Cfi4uFhJbeNMnRDUY8fGVst5WPuu0r
	emQsaXg4ufMoFD2SKauz/XlnMHcYqdwmUN05Xh5COHQH53qquVi+IC4CqTqLnuoPsDy3o
X-Gm-Gg: ASbGnctRd5Ht++MoCA8iUAopDEAzd7JIaSVstY8GmkNS9OlkvHwY1tilRS6Y4Mo0ICM
	9L7/mf1aJVu9T35D+hEKVbW39Xopg44BMXcfgr2bCzWb+MPgDpG8nVWc5pM+UYQvezMUJyzgazA
	C8GoHN57c03XUV7NXzCRqg5Jsad5g6StnzNa0gy2aYJK73Va5GxRBxeMLmMHyUHRswab4iQ29Ah
	XL1xzAfCdpD2tHCvNIsj4Qrqf3QuwSMMY/yNjl6WbwvnOUD4F+EU93L9gM+hszzz2hzoOmiyPQA
	hoTEFykuA6M20ZxJR4qw+yxKkh+KlerVMVBnrqRUa6Fwa1RuMLnuTnl6xQgtZI/FTNj8uuih32w
	L3ThCclWRSs3WwWvMVztc
X-Received: by 2002:a05:620a:2714:b0:7d2:89c2:eddb with SMTP id af79cd13be357-7e342a5dc6amr1310280185a.2.1753195949458;
        Tue, 22 Jul 2025 07:52:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuJgUU9V6/qKb7uv3smvtN8wrkQjr3Ocrb0xAp9swHWKZD9GzivTqkf1QkinncRE8s3a+Xow==
X-Received: by 2002:a05:620a:2714:b0:7d2:89c2:eddb with SMTP id af79cd13be357-7e342a5dc6amr1310275285a.2.1753195948053;
        Tue, 22 Jul 2025 07:52:28 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c8f5d06dsm6945128a12.33.2025.07.22.07.52.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 07:52:27 -0700 (PDT)
Message-ID: <30442713-2990-490a-b076-93c3cfc3901d@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 16:52:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] drm/msm/adreno: Add fenced regwrite support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-7-9347aa5bcbd6@oss.qualcomm.com>
 <tyjkwrdmsj7k7tkqqxdd65l5v5jxugr5me3ivg5onn3hbffkwp@7uhsbzolqiyd>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tyjkwrdmsj7k7tkqqxdd65l5v5jxugr5me3ivg5onn3hbffkwp@7uhsbzolqiyd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=687fa5bf cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=5dKzzWTJmYxMyaayncUA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: aM1MsUtD0MkhrZ2dnmeU79rLcB2zSvp6
X-Proofpoint-GUID: aM1MsUtD0MkhrZ2dnmeU79rLcB2zSvp6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEyNCBTYWx0ZWRfX6+BvBMFsbbh5
 FIV2Kt3zBvF/9WdyZTmDYT+cwtXcNPc4v/Hj/zi/Yp+QJFTrY2o5qQc/XxHeC+KKHJ027Qowkp8
 cjO1jBdL3KK2FrrerKll4XsJhqznIe5oRxV2vTmVIUCuxrjTXfo/F0yz5kU4jS88gt69lsO/EQ6
 tgIyD36ieb3FNtDiCSJpCe5OCM16rjyRNF4KjsDdZpJ9nChV18BbqsFCrFgBlzqeSgLvhizrY4T
 E+4zBOM2/AjPfpaW1DTtP9dkaQnlDJpQ4CYidtpEyF4Jb+miwXuaRfXyIFWLBTa3FEfzNAU1SYm
 MAUiiDtHmfLFCnZUnmKpbys1j0C4TbXDLcdkn+yPNQT0Ewe2tmhd1f8Gp0IsjH5SAe5xFrlWrJl
 E+ICHAcgI0JsQDF96ZNlQR963NHvso6c576lQEw/HuQNXHkpTSoa30FiJoEkC5GpGrDLs0Ev
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220124

On 7/22/25 3:39 PM, Dmitry Baryshkov wrote:
> On Sun, Jul 20, 2025 at 05:46:08PM +0530, Akhil P Oommen wrote:
>> There are some special registers which are accessible even when GX power
>> domain is collapsed during an IFPC sleep. Accessing these registers
>> wakes up GPU from power collapse and allow programming these registers
>> without additional handshake with GMU. This patch adds support for this
>> special register write sequence.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 63 ++++++++++++++++++++++++++++++-
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 +++++-----
>>  3 files changed, 73 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 491fde0083a202bec7c6b3bca88d0e5a717a6560..8c004fc3abd2896d467a9728b34e99e4ed944dc4 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -16,6 +16,67 @@
>>  
>>  #define GPU_PAS_ID 13
>>  
>> +static bool fence_status_check(struct msm_gpu *gpu, u32 offset, u32 value, u32 status, u32 mask)
>> +{
>> +	/* Success if !writedropped0/1 */
>> +	if (!(status & mask))
>> +		return true;
>> +
>> +	udelay(10);
> 
> Why do we need udelay() here? Why can't we use interval setting inside
> gmu_poll_timeout()?

Similarly here:

[...]

>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>> +		return 0;
>> +
>> +	dev_err_ratelimited(gmu->dev, "delay in fenced register write (0x%x)\n",
>> +			offset);
>> +
>> +	/* Try again for another 1ms before failing */
>> +	gpu_write(gpu, offset, value);
>> +	if (!gmu_poll_timeout(gmu, REG_A6XX_GMU_AHB_FENCE_STATUS, status,
>> +			fence_status_check(gpu, offset, value, status, mask), 0, 1000))
>> +		return 0;
>> +
>> +	dev_err_ratelimited(gmu->dev, "fenced register write (0x%x) fail\n",
>> +			offset);

We may want to combine the two, so as not to worry the user too much..

If it's going to fail, I would assume it's going to fail both checks
(unless e.g. the bus is so congested a single write can't go through
to a sleepy GPU across 2 miliseconds, but that's another issue)

Konrad

