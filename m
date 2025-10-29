Return-Path: <linux-arm-msm+bounces-79459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FB8C1A8C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 14:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0DFF15809C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 13:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9FC33B6CB;
	Wed, 29 Oct 2025 12:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HKofYOB7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V+5Q77YL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B720E33B6CA
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 12:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761742508; cv=none; b=D4MA8ptPdTYkFFvczssOFeEUzE+49Z4+oQvOpjPxtV4RI6SSpS98UAD+162GOdEGnyVyKhwRuNVAS/kB/d9FXFB6u2JBxo5dI9ZXwg21ps/vAubqYztfHprlt6YH0FsvEmyKMyYVEx/Oir9FUeGcv1lFxxwEtJwXGtGx7ee5itk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761742508; c=relaxed/simple;
	bh=HyoARy+zaEu6g8ygPPdG3fCeS5+0hsuR3Ettdx7LNno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pPwK5d2W6pbuyN+nVJGmDGTThPBXNZLAHFkeWI3oS8ZceDcrcpp+IT6TpwWcz/uGTqO1XnziWKnD9J+k/KvCqXMKbmfHzu3d2Xwer+jDj3cjeWYhWICzrzlG7Y+h5MMaHef3O+TFpyp26cnzQR8Uty/VaXtt67c7wWTKL1XduNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HKofYOB7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V+5Q77YL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T93B9H4155409
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 12:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J4w3ZbI2OAPqEJy2jBs+oscQ5kTp/np7X7EtBXJimWg=; b=HKofYOB79DDRPjmC
	MrQhyy8bKVJqkfgNHuWJIvDJCzMlndFgdRM7RVQv3FqpCvrUdkHiHdjqDonTOR+B
	KJS6ZcJDRbL1m4ko1PWJ0mBvQw4ftfzVSxPHa53CAZB645G1X+qdb27tMIaMMW6u
	VgY2/Mfr9oCpdcV8QVr+w7qqBv2cL8sj23hOsstUEbuZTb4Jn1rdcNDFa67craFr
	FcMSZYmc8rM+a9r3PAGKWLoG3yv+hB2yFVoHcbQocYjM0iCaBZSyQpANuLkgHaHc
	fDX4arQ/uVNraavIt2//9SEn9QNqjjBEoKuuuS55ZD5VXqK1XO7zSXVF0N7fQC2N
	YUq8Wg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3fy0rnur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 12:55:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ecf9548410so110498961cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 05:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761742505; x=1762347305; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J4w3ZbI2OAPqEJy2jBs+oscQ5kTp/np7X7EtBXJimWg=;
        b=V+5Q77YLuW0K+MTkXw/auYI4M/hcj0+/+pYYH/pD+/icu36BnDvnripAaRpkul1jJD
         nJhBdOmqmcWwZf1UZoudLiONi3I/f6REXhS64SI8LzRSCvfrREnpgzWHSJORX4udlCdn
         e9u0gBjDaqBB2DHQyQSv+Z4FGIXP9U+MB8Niuf6N6e83m/JGwLEkonBB4oQhvmHqJWMM
         J3NsrleKPxzbYIFsxxBPc8HmBCWDx6ZKvz3KWqfaR7EOckeKIZwwJTOubB8WQtxkbzVn
         NeChR5fvsvxXbgR+5D2SnMsw6mfo4EByQy95agdBHMD99grAyMuK49hHjNB9s7E6wpo8
         hKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761742505; x=1762347305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J4w3ZbI2OAPqEJy2jBs+oscQ5kTp/np7X7EtBXJimWg=;
        b=feACFb3/gJrqVjO+ArDWnZiQc51z+ym7t6S0qZ+egXLRdXd1yJzwIa0vUgdcIYO0A/
         SNYn0h1q3MhX5M8O+NJ15DDasv4ZxeVzPw5m0uhn+FDlTHkfTq+6hf0WRzOcEKoU1HM8
         nz61NKIt4J4l/YR8bUOyT9vHc8xLmVKcudMTxOJ+8eDI701rhlsNHndzd3Gvh4Ag5TH9
         5jIfwO0kEzQ6ZVg60+ARl27U/5lVWccY7/eAA3/GTaP6Z2H0LLdwa975ojKN0HGpnhNI
         sg8gGszeQXg36Q6erGcmAdERDaPwuS/rJLvESGFIpBwvK1l7IPX3JN4SVQMWEHkekxwb
         M+SQ==
X-Forwarded-Encrypted: i=1; AJvYcCUL6eY5hllFJDag7l1PdOKkPXoFXBwV5gGZF4n98KJc95TjrhFEwYu8Qj2Lr8QEEytjZWim5QzS/gC2zLbD@vger.kernel.org
X-Gm-Message-State: AOJu0YxBAHPRy9OCZI8n4/9f884wTXRPaujYe7rE5zw8ofKlgngWSAj1
	DK3kHdDzyUhRoeTtrnk2F0Q85yaWnEPyR7v+wzCBrLh1Mkvo/pEAa9hfG1iYZpnOuCuZanRn/Rg
	lOg8Ev4suCcHJUb1Ooj8DCipBaOIHeX2fXxC2x+1uGjcAwvnu1I9e9TYGoAiblktHkbWx
X-Gm-Gg: ASbGnctpTeBGPcywkZ+FJrLKQrn/c8kSA9Ej2qCbd2E48j8FCzsJcMhIafHuGIIr6QF
	FkrFvxFxx0PQLlTqJnz9LuyEZgydR4n3pLoEx4CWlM3eiIcQcTf2WqT6A5NIUKNvp6DIld0qNTS
	s7a0CMb0pVO9u89mYIIwlS3kuMXcKYRYXcL62dHqNy1YsrEGLKtZCF+U145x8UeKTxvR5GC6X/z
	QXQC8CTZvdPfwWzNeLl33jBLHN1FKrC0+8tIKtUFgfSIFEo7iSBCPpreDoJHXXO2+WGYQyYWEGW
	MOfdOphpglUQad0aaW5BcT5fGlqfB0B6DmovU4J2wle1QmseEkvi9UM/cx/SDYYqJ7RfQBSrAjN
	qIxKSH9UbSvsLEVjhGqs16wLedwLOXGJqwQVXBTyW+7vbl3gfh73VZcIevmGAu3/AF8sTlyEiuW
	2o4A==
X-Received: by 2002:ac8:5a06:0:b0:4eb:e283:9262 with SMTP id d75a77b69052e-4ed15cbebacmr29370141cf.80.1761742504629;
        Wed, 29 Oct 2025 05:55:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxslv20fwVgpGvpGJEMS8kwxnz2RASBMAJ2XDPGmssEtxmx4kx5GR2gBhhKrvYn5P5AhoSQw==
X-Received: by 2002:ac8:5a06:0:b0:4eb:e283:9262 with SMTP id d75a77b69052e-4ed15cbebacmr29369591cf.80.1761742503843;
        Wed, 29 Oct 2025 05:55:03 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::4c9? (2001-14ba-a0c3-3a00--4c9.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::4c9])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f6974esm3921720e87.73.2025.10.29.05.55.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 05:55:02 -0700 (PDT)
Message-ID: <58b5fc9e-890c-4b89-97fa-5d1638cffd3d@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 14:55:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/dpu: Filter modes based on adjusted mode clock
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250506-filter-modes-v2-1-c20a0b7aa241@oss.qualcomm.com>
 <6381550a-4c1a-429d-b6c1-8c7ae77bf325@linaro.org>
 <da56lghirjcwesz4usdlfpttwcmvoql2h6bvjommoyfskjdkgk@hrlgx4ukt4aa>
 <09cbf40d-6536-4bda-94d6-5b45a5746962@linaro.org>
 <w4lwl34mtd7xv7it72nvomv6te2bcybisvirfdwzdazzqisd73@fvyusj6m5cb2>
 <ed323916-f0e4-4669-935c-6fc8ae6a9490@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <ed323916-f0e4-4669-935c-6fc8ae6a9490@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VJLQXtPX c=1 sm=1 tr=0 ts=69020ea9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=GO5XCE9Gkcx8_P09yrYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=d3PnA9EDa4IxuAV0gXij:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: en8wvbLWvco-5GyPOfq4AqwnkQ8_Dlfb
X-Proofpoint-ORIG-GUID: en8wvbLWvco-5GyPOfq4AqwnkQ8_Dlfb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA5OCBTYWx0ZWRfX/OlOZdab73og
 CN/EqnnDLO3Jkwt02ye0/cPCayCKvu4PaoYT4buUvN0Yc4vdZok0JQWqEEfQrA3y3fXlxHM04xi
 6Io0at9duVaGgc0TQ9fMZeNzAoW8j9OeelSSHB+foEPGrCK95o1zfzCk2D3uPk/bcnTiVkxyUMV
 Plmr6F/yn66s1CPwA6K5aJP10ALHF9VQr7JdPM50rspaPS/Fqz/TeO375yNolqbN58yXQzi0+De
 C7Mbr9FLII29eqZDU4mOfoStKcJmY2NwGm5uveeZSA9o7PvzDRWk/lNZNqf/iJCE2y058cOBaA4
 zEL0+N1MO1FwLifz9sgp6ohgsT87+xRUXsmMgUl3/XBCOhZo07otnQqdX/53nIGR0uAE1ttPKFc
 zlV/XG9lndXhaNXmFGpTsnIiJywmOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_05,2025-10-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290098

On 29/10/2025 14:49, Neil Armstrong wrote:
> On 10/29/25 13:30, Dmitry Baryshkov wrote:
>> On Wed, Oct 29, 2025 at 10:40:25AM +0100, Neil Armstrong wrote:
>>> On 10/28/25 20:52, Dmitry Baryshkov wrote:
>>>> On Tue, Oct 28, 2025 at 09:42:57AM +0100, neil.armstrong@linaro.org 
>>>> wrote:
>>>>> On 5/7/25 03:38, Jessica Zhang wrote:
>>>>>> Filter out modes that have a clock rate greater than the max core 
>>>>>> clock
>>>>>> rate when adjusted for the perf clock factor
>>>>>>
>>>>>> This is especially important for chipsets such as QCS615 that have 
>>>>>> lower
>>>>>> limits for the MDP max core clock.
>>>>>>
>>>>>> Since the core CRTC clock is at least the mode clock (adjusted for 
>>>>>> the
>>>>>> perf clock factor) [1], the modes supported by the driver should 
>>>>>> be less
>>>>>> than the max core clock rate.
>>>>>>
>>>>>> [1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/ 
>>>>>> drm/msm/disp/dpu1/dpu_core_perf.c#L83
>>>>>>
>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>>>>> ---
>>>>>> Changes in v2:
>>>>>> - *crtc_clock -> *mode_clock (Dmitry)
>>>>>> - Changed adjusted_mode_clk check to use multiplication (Dmitry)
>>>>>> - Switch from quic_* email to OSS email
>>>>>> - Link to v1: https://lore.kernel.org/lkml/20241212-filter-mode- 
>>>>>> clock-v1-1-f4441988d6aa@quicinc.com/
>>>>>> ---
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 35 +++++++++++ 
>>>>>> +++++++---------
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  3 +++
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 12 +++++++++
>>>>>>     3 files changed, 39 insertions(+), 11 deletions(-)
>>>>>>
>>>>>
>>>>> This test doesn't take in account if the mode is for a bonded DSI 
>>>>> mode, which
>>>>> is the same mode on 2 interfaces doubled, but it's valid since we 
>>>>> could literally
>>>>> set both modes separately. In bonded DSI this mode_clk must be 
>>>>> again divided bv 2
>>>>> in addition to the fix:
>>>>> https://lore.kernel.org/linux-arm-msm/20250923-modeclk-fix- 
>>>>> v2-1-01fcd0b2465a@oss.qualcomm.com/
>>>>
>>>>   From the docs:
>>>>
>>>>            * Since this function is both called from the check phase 
>>>> of an atomic
>>>>            * commit, and the mode validation in the probe paths it 
>>>> is not allowed
>>>>            * to look at anything else but the passed-in mode, and 
>>>> validate it
>>>>            * against configuration-invariant hardware constraints. 
>>>> Any further
>>>>            * limits which depend upon the configuration can only be 
>>>> checked in
>>>>            * @mode_fixup or @atomic_check.
>>>>
>>>> Additionally, I don't think it is correct to divide mode_clk by two. In
>>>> the end, the DPU processes the mode in a single pass, so the perf
>>>> constrains applies as is, without additional dividers.
>>>
>>> Sorry but this is not correct, the current check means nothing. If you
>>> enable 2 separate DSI outputs or enable then in bonded mode, the DPU
>>> processes it the same so the bonded doubled mode should be valid.
>>>
>>> The difference between separate or bonded DSI DPU-wise is only the
>>> synchronisation of vsyncs between interfaces.
>>
>> I think there is some sort of confusion. It might be on my side. Please
>> correct me if I'm wrong.
>>
>> Each CRTC requires certain MDP clock rate to function: to process pixel
>> data, for scanout, etc. This is captured in dpu_core_perf.c. The patch
>> in question verifies that the mode can actually be set, that MDP can
>> function at the required clock rate. Otherwise we end up in a situation
>> when the driver lists a particular mode, but then the atomic_check
>> rejects that mode.
> 
> A CRTC will be associated to 1 or multiple LMs, the LM is the actual block
> you want to check for frequency. Speaking of CRTC means nothing for the 
> DPU.
> 
> We should basically run a lightweight version of dpu_rm_reserve() in 
> mode_valid,
> and check against all the assigned blocks to see if we can handle the mode.
> 
> But is it worth it ? What did the original patch solve exactly ?
> 
> Do we have formal proof about which max clock frequency a complete HW 
> setup is able to support ?
> 
>>
>> With that in mind, there is a difference between independent and bonded
>> DSI panels: bonded panels use single CRTC, while independent panels use
>> two different CRTCs. As such (again, please correct me if I'm wrong),
>> we need 2x MDP clock for a single CRTC.
> 
> Any mode can use 1 or multiple LMs, in independent or bonded DSI. As I
> said the bonded DSI with a 2x mode will lead to __exactly__ the same setup
> as 2 independed DSI displays. And in bonded mode, you'll always have 2 LMs.
> 
>>
>>> So this check against the max frequency means nothing and should be
>>> removed, but we should solely rely on the bandwidth calculation instead.
>>
>> We need both. If you have a particular usecase which fails, lets discuss
>> it:
>>
>> - 2 DSI panels, resolution WxH, N Hz, the mode uses l LMs, m DSC units
>>    and foo bar baz to output.
>>
>> - The dpu_crtc_mode_valid() calculates the clock ABC, which is more than
>>    the max value of DEF
>>
>> - The actual modesetting results in a clock GHI, which is less than DEF
> 
> I don't understand what you need,

I have been asking for exact W, H, N, l, m, etc. numbers.

> in the current form the mode_valid will
> accept the 2 DSI displays as independent, while using them as bonded will
> use the exact same HW setup (resolution WxH, N Hz, the mode uses l LMs, 
> m DSC units)
> but the mode_valid with rejects it.

Which clock rate is being returned by _dpu_core_perf_calc_clk() while 
setting up two independent outputs and when setting up a single bonded 
output?
Which clock rate is being used by dpu_crtc_mode_valid() to reject the mode?

> 
> Neil
> 
>>
>>>
>>> Neil
>>>
>>>>
>>>>
>>>>> I'm trying to find a correct way to handle that, I have tried that:
>>>>> ===========================><========================================
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/ 
>>>>> gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>> index 48c3aef1cfc2..6aa5db1996e3 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>
>>>
>>
> 


-- 
With best wishes
Dmitry

