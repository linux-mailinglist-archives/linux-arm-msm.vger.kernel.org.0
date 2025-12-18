Return-Path: <linux-arm-msm+bounces-85702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FC6CCC25A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 14:59:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB61E309C2D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 13:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633A5345CA4;
	Thu, 18 Dec 2025 13:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UYvXeSl4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hTYnMvj1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1BAE3451C6
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 13:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766066063; cv=none; b=hwNa0TKWUP1ylwpazh8a546WAuz4TmRBo6kO7zqzTj9C3dzqVeVWDXcqbh8JbTkh7zegTr/FpRV3XWwW2Na+llNcx8uzeawPVDfNa1WRify6SBzEfi4aeC/uGhA+2tP3+MXFeYDmMS8vBMbpOa0YiP43x9T7b5rnW6bzZSt6294=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766066063; c=relaxed/simple;
	bh=C2r38V0186zCgV3wn8MPljqqx2DvRXHdoL95mnqxr5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gnQJm9/JhwDvbzLDPMKGMevj/VijUaLpiHyWjJ00oqLxhzJ4IivLUnAIN/REaBN/lj7GrMPvof4J9fYKpx19wbx/3q+5junByeYSmeDCMbH1XSv1pko2tN+/cZkHpgXMaJVF3WkhC5XvDslrGU3B5bofuLkKi4bkIq9xNdSSKcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UYvXeSl4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hTYnMvj1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI9PemZ4191394
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 13:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W95ZWbyv7ZebtdgUzuyg7nH2Tc3tRPvsWhfTYozeQfw=; b=UYvXeSl453Yk6zLA
	jOQcGjMzy/fA2El17C1UCC6hhj+fRd1tGT/MWGnn+JN6Ynj24yZ/pGgeMLP4x5e8
	IqZ7P5nYS3WDizMrsxZQFzs8/ZxGsSGZ9+MQaCYkiBfFu9eg7vbZoomuk+nI+ZHT
	pOo6KzDXbo3zqcqH2uwtE0ejXfnm9Wnf9STe6kA4Oy9dMwL1bidJVU7zbwoQP3oW
	mlO0mHkZedxB33Q/BVnf3EV/3z74nnSns0SXNWVgqhyByMxGiz4hvJgOGIqQwDm/
	75rWZju3j5z3L/3pjLO8AgwhuXLGWwp3GOXFFFTBWvk07o+61jsQJW1mayffC6Tg
	/Ugemg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b47pkj6by-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 13:54:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1e17aa706so3321081cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 05:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766066058; x=1766670858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W95ZWbyv7ZebtdgUzuyg7nH2Tc3tRPvsWhfTYozeQfw=;
        b=hTYnMvj12fS5wh4MdfwidFoB4MPdiIHuB2vSrcGnleNMqan0bFINgU4cC9sCz57YLz
         8c5omNgz6C4+HDHpRbVB/3moBx7KhdMhFH4U51rVk3WEpMh83TBNiyrkNi9/2uyMS0eC
         xGr3PvfrNnSX9a43XKcKNR9EB/y8rT9rRbO4+1iJgl6tH5oivvIfqsrOTGxnM9og45Jc
         z8li7lggqKtTDHB6bhu3BQIeOI7VvlCrN5E3RSO10gPLrS8aA4LilTXIq3bcIdbrKPCS
         z8GhfTLYs3Z+QCBz7BCXD1kJq62XBQ4i7s2m7UrFWRU3a3urwS6EvMTewM4Idp8AzuBg
         bQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766066058; x=1766670858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W95ZWbyv7ZebtdgUzuyg7nH2Tc3tRPvsWhfTYozeQfw=;
        b=pioOU6WOnqcbwrfklNOL5bbANAihfM8TzA7fIBRh9tisH8tM86IBXYaFarojdIknvJ
         +spm8Nu+Gzr6Mrtott4Jm9mW+uiAUAPs6MUPDEyuRk5OTd55La7iRXL7rg17niAjzJL1
         xnjRQFJw/1wguP/Tac6NaD8MhbygwLw40IUyL178oOrAJ3LVNU7w48wxZ02WgmrmDa2W
         v5AlQAYaqoHk4K5Pao+w+XbA/Q81SBAFryBZdEWZGrpWi9U/f4fSSNL1RNmCx3LyybdY
         f0KNERqcDRFG2epC+8DmC68wTc4McZ54rDw6A1XDlcwoUOfMT4nK2o626rIcf2P1KtWS
         1Lkw==
X-Forwarded-Encrypted: i=1; AJvYcCXUbF6HfaZEqH5rRVx2J5dsssfYcK1LVzx2NfWGrCy60RZrMJVR1xaugNBX5VZIOKEinvK+/P6cBQMWc2DK@vger.kernel.org
X-Gm-Message-State: AOJu0YwoqrqmYL3K1k/l81z5bAyLm+CKA82pzDodME/dPj5iO/wOpC54
	UdjqotzVSL7ErSQQK3juo+usppTJIJfibzsQ7JKOX62sq7vwbdF4atEwYjcHXLKAlHeDHaTjA0k
	/y2mKW57pwRnt1x6u1u7CvAWrtnhQeU1QEJpKHPEzI93WgXuoPj96/OevbswYeLDetvVg
X-Gm-Gg: AY/fxX6Z4Am7E9El2dKF76Da3MyFN9r+1DKll3lHzsuhpqvX4QbhWI3ytD292oie/+Z
	gsYtndP8gXtRWeqIMYes7SM5EwMa8HCIgmhJ5H107MW+TTseWejkNetbtz9k3z9529IhMSwfnD5
	xHnXvEf8hf4gQ1I+fW35Ll3SJ46CmrYuWKB5GYhedd49Pu+J75bCKc9IZd1MbmvNCBW80X0uEDZ
	9LcXYXiikC2rfahlDpleDGDBr5nlLeDR5atCOhHdM97OrTrr9UJgzWnBkHA8ohbv6g+5aXygXoh
	v4cZyGQbS498YU1pkGGQJ2XpI33Gh8EPdXFTwN1teXFHJ1NQWttygXtFb8VN4CrEW2T3vPx7uya
	os8WUdvT81Y45m5BC9fp+xjj2jIAFyjUhmfHVB7/AyqOypZGZbaVS4TYW9nqVUzUk2Q==
X-Received: by 2002:a05:622a:341:b0:4ec:f9c2:c1ec with SMTP id d75a77b69052e-4f361152409mr20233111cf.9.1766066057876;
        Thu, 18 Dec 2025 05:54:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBlqC2m/dbjcpakq5xyRubRns6wW9qQ+MVm+nu5mEbtTBjt6LW/ckyVfsGNqX0AxDXLnM9sA==
X-Received: by 2002:a05:622a:341:b0:4ec:f9c2:c1ec with SMTP id d75a77b69052e-4f361152409mr20232751cf.9.1766066057380;
        Thu, 18 Dec 2025 05:54:17 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8022f93e99sm237087366b.2.2025.12.18.05.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 05:54:16 -0800 (PST)
Message-ID: <92f0e801-032f-4c8a-8bb4-ecb3af48af0a@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 14:54:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Alexey Minnekhanov <alexeymin@postmarketos.org>,
        "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Paul Sajna <sajattack@postmarketos.org>,
        barnabas.czeman@mainlining.org
References: <20251211-mdp5-drop-dpu3-v1-1-0a0186d92757@oss.qualcomm.com>
 <8e1d33ff-d902-4ae9-9162-e00d17a5e6d1@postmarketos.org>
 <dcapydafye2v6owrkehngivqlucjcx6aa3sszszflh3ocm7dpq@qsajm2qkc52d>
 <24f29ff0-99d0-4175-a6c9-f402ce99f645@oss.qualcomm.com>
 <7dcs7n4pbdhmm4ujgqnek4setujzqxhkdsf3tuf4ggymajj3rj@xzapix7ujzr6>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7dcs7n4pbdhmm4ujgqnek4setujzqxhkdsf3tuf4ggymajj3rj@xzapix7ujzr6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dqsMi8MxO2j-jG6BkaoTPVu7J8x3ceya
X-Authority-Analysis: v=2.4 cv=Md9hep/f c=1 sm=1 tr=0 ts=6944078a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=sMkN4vr61ZO4f_miHF8A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDExNSBTYWx0ZWRfX4Y9gKNuCsF/Z
 PQESGR2I5V79zLNtCtUJ41cOn64vxcJI2BFqPxnf2zCv4S7WTKNVa98sH9l4i4NRiHjKj7LUpMC
 xqj7Ar9j1THyEGoYbbiWTrT4JOCbJUMU5utXnfiTfT9HrNITqoTpzw/sDnv3clqiGSepoLwZKrG
 jgOic7I5hQj1DCoNiyCja2WgtaAAnkj6yrqeIwWgok5pckUR4BGlIexp0JdoTCUdcwlsF+Dh5E9
 JrjsuvNNZevsEjG+i2V4POqSCIVCkuMRxOR3UUwMnvgWmP/zCUTRv+keQfJE8JhU2aFlWX6hrzw
 F2g2IW/a6+JgRgSnHeMXybDPRC/wf2RJNyqd++SzOcZWWgDFzimvwGr0vFoQwnU227RY8j5oyBF
 kShUqDRLaqQcwNCw2fF6XvJYLcZhtA==
X-Proofpoint-GUID: dqsMi8MxO2j-jG6BkaoTPVu7J8x3ceya
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180115

On 12/18/25 2:49 PM, Dmitry Baryshkov wrote:
> On Thu, Dec 18, 2025 at 12:23:49PM +0100, Konrad Dybcio wrote:
>> On 12/17/25 5:34 PM, Dmitry Baryshkov wrote:
>>> On Wed, Dec 17, 2025 at 06:05:31PM +0300, Alexey Minnekhanov wrote:
>>>> On 11.12.2025 04:25, Dmitry Baryshkov wrote:
>>>>> Currently MDP5 3.x (MSM8998, SDM630 and SDM660) platforms are support
>>>>> by both DPU and MDP5 drivers. Support for them in the DPU driver is
>>>>> mature enough, so it's no longer sensible to keep them enabled in the
>>>>> MDP5 driver. Not to mention that MSM8998 never used an MDP5 compatible
>>>>> string. Drop support for the MDP5 3.x genration inside the MDP5
>>>>> driver and migrate those to the DPU driver only.
>>>>>
>>>>> Note: this will break if one uses the DT generated before v6.3 as they
>>>>> had only the generic, "qcom,mdp5" compatible string for SDM630 and
>>>>> SDM660. However granted that we had two LTS releases inbetween I don't
>>>>> think it is an issue.
>>>>>
>>>>
>>>> I've retested DPU driver on our downstream release based on 6.18 (by
>>>> using msm.prefer_mdp5=false kernel cmdline parameter) on all devices
>>>> at my disposal, and I can confirm DPU driver working fine an all SDM660,
>>>> SDM636 ones, but not on SDM630. Some logs from sdm630-sony-nile-pioneer
>>>> (Sony Xperia XA2):
>>>
>>> Unfortunately I only have SDM660 and video DSI usecase here. BTW: is
>>> your SDM636 / SDM660 using CMD or video panel?
>>>
>>>>
>>>> [    2.356546] msm_dpu c901000.display-controller: bound c994000.dsi (ops
>>>> dsi_ops [msm])
>>>> [    2.357328] adreno 5000000.gpu: GPU speedbin fuse 146 (0x92), mapped to
>>>> opp-supp-hw 0x4
>>>> [    2.364802] msm_dpu c901000.display-controller: bound 5000000.gpu (ops
>>>> a3xx_ops [msm])
>>>> [    2.444649] [drm:dpu_kms_hw_init:1173] dpu hardware revision:0x30030000
>>>> [    2.449793] [drm] Initialized msm 1.13.0 for c901000.display-controller
>>>> on minor 1
>>>> ...
>>>> [    2.911900] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:654] [dpu
>>>> error]enc33 intf1 ctl start interrupt wait failed
>>>> [    2.911916] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait for
>>>> commit done returned -22
>>>> ...
>>>> [    3.176171] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:654] [dpu
>>>> error]enc33 intf1 ctl start interrupt wait failed
>>>> [    3.176367] [drm:dpu_kms_wait_for_commit_done:525] [dpu error]wait for
>>>> commit done returned -22
>>>>
>>>> Which results in horrendous ~3-5 fps in shell.
>>>>
>>>> The block "enc33 intf1 ctl start interrupt wait failed" + "wait for
>>>> commit done returned -22" is repeated few times per second whenever
>>>> the display is turned on, and stops when it's turned off.
>>>>
>>>> Meanwhile it is working fine using MDP5 driver (msm.prefer_mdp5=true).
>>>
>>> It's interesting. Would you please capture the devcoredump for the
>>> platform? There will be a lot of blocks, I'm interested in INTF_1, CTL
>>> and top_0.
>>>
>>> Also, as a debugging check, would you mind patching
>>> dpu_encoder_phys_cmd_wait_for_commit_done() so that it always calls
>>> dpu_encoder_phys_cmd_wait_for_tx_complete()? I will check if there are
>>> any differences for CTL_START and similar registers, but it will take
>>> some time.
>>>
>>>> Well, as fine as possible considering [1], using several FD_MESA_DEBUG
>>>> tricks to work around GPU issues.
>>>>
>>>> P.S. I have not yet tested MSM8998, but I can try if required
>>>
>>> As far as I remember, MDP5 on MSM8998 has never been wired (as in never
>>> committed to the DTSI). Angelo has enabled and Freebox people have
>>> tested DPU on MSM8998, but I think it was limited to video / HDMI
>>> usecases.
>>
>> I think we poked at both, back in the day (tm) and DPU worked on msm8998-
>> sony-maple (sharp,ls055d1sx04 cmd mode panel) with the funny CMD mode hack
>> (due to a register field not existing on <845?)
>>
>> https://github.com/SoMainline/linux/commit/14e0517e2fd5eee116a32db624b09856c60fa022
> 
> Ok, so my guess was correct and CTL_START is not present there. Checking
> the regmaps, there is no intr_start too. Let me cook the patchset.

FWIW it's not something I came up with.. But I can't fully recall the
original finder. Maybe it was one of the MSM8996/MSM8998/SDM845-mainline
contributors? It was difficult to find, so I'd like to credit the author
but I'm afraid I can't find it..

Konrad

