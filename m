Return-Path: <linux-arm-msm+bounces-82113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A45C64708
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 14:45:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 684F94F190F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 13:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06BC4331A59;
	Mon, 17 Nov 2025 13:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FXri2I17";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J5GlrdCk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F707330335
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 13:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763386780; cv=none; b=NGwl9PHgGehmIzYo/xGvN0gTOFu1yvXAeFdxc2Z8fuBWqOFhjZUW4ws44KCd9LWELh0Kp1AOiV5TKoKHG4uz4y/q2+YCqo61LAY2c/R2KfPEnqUIsOM5Bp7t8xJ0Bv+19auWuRSmj5obF3hNce8jX9NroRcWHF3Vbo6+vNRgDO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763386780; c=relaxed/simple;
	bh=STyUNrgPy5MX60kiSf508nIIDJhx7HAE7WF0gtnU+pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lZ09O5KAN0bqSAEWPB0AZN0lB0mzObqL/pNQQlMiD8ItKJxeeVR+Y5aeNnF7xcbF3YzkYwa8UfmkJV5PA0WMnFL9KIWQ2LeMlKku+/O+O2PxJOPaA3qqvCM+v/SopYe4LxrkrjynD/sxK4Jd5jdx7qZJ+RFAvXtdQWAfPjbABqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FXri2I17; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J5GlrdCk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AHB62i84107441
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 13:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	madWQ8LNSH0zkc6V66UGGR8dYDx8zrt7q0Rlr0n4JSQ=; b=FXri2I17p8o0uSsa
	l756g/4+5dAWAWNQ2+yzKFFJbeFnX0OcY8nt2wrOHncflCEMfcadsVQ2P/SGy6vU
	mnTGiW9+xjiI68V8h3X1XOZiKREAQ1IW+YZN/tpNOiDE6iH7RUbYUmWu37x131c2
	FUwZ08Su9AnYFu1SV54el7jvH6d2bRVuahSmGzJmColFRy+6eTuC+wnbzu5Va8eQ
	/10TW+AX8HjDcurmhOD8OdqtjPP9YQYhXZJXao5nl8PjL4VLYlLQg96hurZQRVNW
	J6EKZ7BoLRVTrkqHXF7PxgMMKlLkfYNjj79g5HIJKS21gSqgSuOJKF5R2xigR3/b
	u7gqZg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag2hp8d5u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 13:39:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed6a906c52so11041771cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 05:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763386777; x=1763991577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=madWQ8LNSH0zkc6V66UGGR8dYDx8zrt7q0Rlr0n4JSQ=;
        b=J5GlrdCkwt8Jq1dPkbZUGIXyaWkR3JTAk1MxQQQNrj3QlyNIpJyHPcf4seYSRFB5Bf
         1EiX3u3ytPXnyaGsZ0aIjIPL28/Auk0sjztmzyn7LOFUy9dcrzjMG9CLNulpdNSETtIS
         AtTAWwKzrI9lixA79Yd24wiJLSvnlEatUMsXEmYmN8WWeZdoglN91TizPII35kpc/+51
         ez36nmU/mRkPoSiCw5ITygoS7keIM+G2FPR1hIE8WQXfFI0kyPZ2f1U/4EqS/yy7uHzc
         yKwYN/cyNfDoh7RtSfz46IlAdBZ5zQtnICg6hmWSNizhZRf+7fBOThedx7pHeBgWxUmm
         6bcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763386777; x=1763991577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=madWQ8LNSH0zkc6V66UGGR8dYDx8zrt7q0Rlr0n4JSQ=;
        b=DOs8lV2SHRrquDjx/AbcYqM2sQw3yKl5091AO+09411YvgL/2RsVZUIWVOeteyeWOf
         LcfFr7H0GjIJgvcQTjMba692zE5UFa2SCf6FV+uuMB26oj3MAsWf+ss45sfZVHxXUvyN
         un4rOOiTF0Jfx7yat6rdIFQjwtnHudFNDUMiingEv9u6CdSQGGuk+RkVlajqCPsRnGVW
         EqaytAVq5Uy0uvBUzDLkPa1SqIqSnAt6KNUlAg8vciWyUzmEVHi3BQNneClhQj8Z3S9O
         atKSGb5P99Wu2QVy/VphSzlGqiSPQF3QnrhhCkBnLVzHqOhN7Kx06ID6KccODL7lH3FR
         enIg==
X-Forwarded-Encrypted: i=1; AJvYcCWSPVKu5dhXRAWgLi0uNcR89IlNG3Cto6q+WVnwUB9Sti2dBazgLXPBzTyLGuxi2GM3XLQyNFyyrvHEMXx3@vger.kernel.org
X-Gm-Message-State: AOJu0YxANGn2KcNelCTCiLc+84RnxPZ6g46GLh+ucaohWAmElSkxq3Lr
	ApGE1VU3ruB9gkiSC60Xo6w7nZdLhjk/PAQmmWESmXkzyzxGy47kPsk4LKmYK62A9zPiQNR57O/
	tjPIkhYPX4FCFvJusYGRPn5WIA4RRDPwldTpHmJIbslsQ3n5ilXc6/nsAq9ZEGqaHPWF3+VvvWR
	yR
X-Gm-Gg: ASbGnctksHPRPryLxAvA1woWNuOzxqW4Rxa0LVvLg518rDT8cVfI5V+TUmsawK+fEki
	9HJjuB1PRXnjrIQr/X0vg4wN79BokjxknG15qIQC7p7QMr6Y2iiOvmcgIxSvP7zlI8bBlihGBgz
	Owvsz61RR02hnGWfzAIsYRRoHNF4BUu1lKpdU1XyHaXrfxaw96q+NLqGmVh6dMRqd/Ar1QIsFoa
	spzkuAepQhVIY5Jj6+XnANxys5nts3/tMyxae4kan0taYJ3MEP1T7MO1w75Z1B9B24+3ocXV+Gb
	Z6cl9VVvcFpQRG0ECDKFDHfEU4nAys7pSIf/nrHNxfupd4zZ+Wb5IUowL/hepXyYPz5ThTBzzW9
	TGUKqpXeAWE6abX8XiQRTKQXuR+1/fh1ZuBy7RshJdsoWIFpIgk4VwXaO
X-Received: by 2002:a05:622a:8e01:b0:4ee:1588:6186 with SMTP id d75a77b69052e-4ee1588686emr42287391cf.11.1763386776975;
        Mon, 17 Nov 2025 05:39:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGT8ylpMPqKnQUlh0IndGHgSMmDdm1g/UFqOcl+Eqo38NWcx4OZT9FwONF6B4ZL7MlT4U9B4w==
X-Received: by 2002:a05:622a:8e01:b0:4ee:1588:6186 with SMTP id d75a77b69052e-4ee1588686emr42286991cf.11.1763386776246;
        Mon, 17 Nov 2025 05:39:36 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3d6f5bsm10176335a12.6.2025.11.17.05.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 05:39:35 -0800 (PST)
Message-ID: <d49d449b-7bbb-46fc-8e10-f04649d852f2@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 14:39:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: disable gamma correction unit on SC7180
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Federico Amedeo Izzo <federico@izzo.pro>
References: <20251115-dpu-fix-gc-v1-1-0a4fd718208d@oss.qualcomm.com>
 <6457c60a-2ede-4df8-ad82-d974690eba89@oss.qualcomm.com>
 <CAO9ioeUfZQVy7VFUp8FEVHN2_uL0ZB9jbkuexWY4D12YN_O3Jw@mail.gmail.com>
 <8541a10d-99ca-43d2-bafa-8e33bba01382@oss.qualcomm.com>
 <CAO9ioeVT_1qGedvdACkE4pqbsP8VReeArbe=-zaH-SHfhi3pkQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAO9ioeVT_1qGedvdACkE4pqbsP8VReeArbe=-zaH-SHfhi3pkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FDYPc-bZ_QDVL-9hxW3RiPBeZ-0p12Vi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDExNSBTYWx0ZWRfX0j3fMAJyMQvg
 JZYO33CSl0u5lDD6mwCDCwOr9u9OBSmEegCxgH4IOeXOIYWCI0AST4hmE7xkonDBTrCkQZwyB7b
 G4d1VMZ9Yb5abQJnH0HXIZSAw7jDfEQqh02XaMlFmSpYz4GekLkUkj3y4QZGxeDZobmyg+BclIv
 HG2WWOHWJnSGWoom2lL5jNP7o/aojF6BrFwCM2gG9gWEsj65GJ0EkemPyEVddQKryXsKRlt7L4G
 sIOjloOu/00jNE8XIlgxqhGvZgGhJHDcAHaLVJ2MoDLowlquMpJ5U1PUw9LuhcpvpjW+PqD2VTy
 eb3YukS3sPvxxYjIneffpWNQ/+Y/O6ztcVPk515VVxumcelXxjVCQCYaw0HsL+ZkWgsinnZBPF/
 5/z4798hxc4GVKB6ApWn+2cvwK4bzw==
X-Proofpoint-ORIG-GUID: FDYPc-bZ_QDVL-9hxW3RiPBeZ-0p12Vi
X-Authority-Analysis: v=2.4 cv=Y5L1cxeN c=1 sm=1 tr=0 ts=691b2599 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=emW-11kZ4ehC4T1iGCQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_03,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170115

On 11/17/25 2:16 PM, Dmitry Baryshkov wrote:
> On Mon, 17 Nov 2025 at 14:10, Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 11/17/25 12:51 PM, Dmitry Baryshkov wrote:
>>> On Mon, 17 Nov 2025 at 13:25, Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 11/15/25 4:08 AM, Dmitry Baryshkov wrote:
>>>>> IGT reported test failures with Gamma correction block on SC7180.
>>>>> Disable GC subblock on SC7180 until we trage the issue.
>>>>>
>>>>> Cc: Federico Amedeo Izzo <federico@izzo.pro>
>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>>> ---
>>>>> Most likely I will squash this into the GC patch
>>>>> ---
>>>>
>>>> Peeking at downstream, 7180 and 845 should have the exact same GC
>>>> (v1.8).. it seems like there's an attempt to program it through
>>>> REGDMA instead of regular reg access. Not sure if it's actually
>>>> necessary or just an optimization
>>>
>>> I think it's mostly an optimization.
>>>
>>>> What tests are exactly failing? I couldn't track it down on FDO GL
>>>
>>> See [1] and other failed SC7180 jobs from the same pipeline. I haven't
>>> triaged it yet, but I assume this might be related to platform
>>> resources (it has only 2 LM blocks and only 1 DSPP).
>>> Another possibility is that maybe we need higher CFG bus bandwidth
>>> when writing LUT registers.
>>>
>>> [1] https://gitlab.freedesktop.org/drm/msm/-/jobs/87878393
>>
>> igt.kms_color@gamma.log fails, we get an ENAVAIL (-119) (which doesn't
>> seem like a good return value for this error but anyway..), dmesg says
>>
>> 05:42:13.199: [   75.472174] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu error]failed to get dspp on lm 0
>> 05:42:13.199: [   75.481487] [drm:_dpu_rm_make_reservation] [dpu error]unable to find appropriate mixers
>> 05:42:13.199: [   75.490235] [drm:dpu_rm_reserve] [dpu error]failed to reserve hw resources: -119
>>
>> which comes from:
>>
>> idx = lm_cfg->dspp - DSPP_0;
>> if (idx < 0 || idx >= ARRAY_SIZE(rm->dspp_blks)) {
>>         // misleading error message, it's not LM%d, but DSPP%d
>>         DPU_ERROR("failed to get dspp on lm %d\n", lm_cfg->dspp);
>>         return false;
>> }
>>
>> which comes from:
>>
>> static const struct dpu_lm_cfg sc7180_lm[] = {
>>         {
>>                 .name = "lm_0", .id = LM_0,
>>                 .base = 0x44000, .len = 0x320,
>>                 .features = MIXER_MSM8998_MASK,
>>                 .sblk = &sc7180_lm_sblk,
>>                 .lm_pair = LM_1,
>>                 .pingpong = PINGPONG_0,
>>                 .dspp = DSPP_0,
>>         }, {
>>                 .name = "lm_1", .id = LM_1,
>>                 .base = 0x45000, .len = 0x320,
>>                 .features = MIXER_MSM8998_MASK,
>>                 .sblk = &sc7180_lm_sblk,
>>                 .lm_pair = LM_0,
>>                 .pingpong = PINGPONG_1,
>>                 // no dspp here, errors out
>>         },
>> };
>>
>> would simply binding .dspp = DSPP_0 to the other one just work here?
> 
> Only LM_0 can use DSPP_0, that part is not flexible.

OK that makes sense

> 
>> Also, would that mean we can only have gamma control on a single active
>> LM at a time?
> 
> We can only control gamma on LM_0 on this platform.
> 
> BTW, the other log is more interesting:
> 
> [3] https://gitlab.freedesktop.org/drm/msm/-/jobs/87895515/viewer

I wonder if we need to take a closer look at this hunk:

/* Disable 8-bit rounding mode */
gc_lut->flags = 0;

also, IGT tests XRGB8888 - any chance the X is getting mistakenly
(un)modified?

Konrad

