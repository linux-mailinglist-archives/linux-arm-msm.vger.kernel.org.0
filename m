Return-Path: <linux-arm-msm+bounces-69588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44762B2A979
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 16:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6D96B621D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D5B271A6D;
	Mon, 18 Aug 2025 14:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D/UeaWEp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE10321455
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 14:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755526024; cv=none; b=oHl3ZiTZ8UOXwS1+cLYHR0kt1dA4Uj3Ft2uFsnahM3ebXMZHFeIGeSp7GlIa+KOtAnwfrQRPA2aty28c/lpPcTfF56x8ZOkyaZS33C4gqa8LAjhZSRCNiu2u/KlLIrcK7VFdye1KwEnTVA0FDgwHxTRBcWlykKPcASV9UkFV+oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755526024; c=relaxed/simple;
	bh=iDJR1tfwk7UFUubIp+MA5lVvSTge8acmqtK4SGQWHBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PiMuH+hzyeb9LaQA/4s4c1xBHdF4XyqLLlshBsjBCFk8CG5ut6QW8izpB2jjkC6E5tVIu9/bTZUIfIQEqodr6vMB0OPliGrYvXtlSfJ0qlYcaKJC8W4SP5De4fUqLsq58L0LKMMLfeBwCUSiHzL8v6mvfMG0ZR4hAwQ4p5rgTGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D/UeaWEp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I7eKYv010649
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 14:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	chLwK+SsPQhHTytM+7iGONL6X0o4wGCEiPMrGgw75ts=; b=D/UeaWEpAUWr/gmE
	WZwGHoUPLUcKr79Zd51wp7wQI0dwsdSBaOAHu78btslcr/KrdR/bGGhyK46HZqo+
	d7CcZ88NvoPaijN+ZaCV8SJ4Zoj3k42YheITNwu2EepURGBWsBIFaUTcebUiIHLb
	veAudXcNEk8HxCuQxsDLGlmR4tPaVw/UrcHpJ59RwxUDMnybMAmOYjfuT2tRS3YF
	+Z7W4DKOF2aMyJ98APKMORCikS8re5V3SDR/IIxj1CzopHIGKJgRGXIXnNxACm9e
	Crv+BISMW5jApN6gq6ZqrIOVlOMeklP7vUddhJ/ES0OIpOdFZGY5XWuNmliBTg3v
	RSDmFg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhjyd01q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 14:07:01 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e1fc66de5so4516723b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 07:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755526020; x=1756130820;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=chLwK+SsPQhHTytM+7iGONL6X0o4wGCEiPMrGgw75ts=;
        b=xJlt9dsyUSl2+UdMmHVATetiRtDY/1nRciAjbTX/OKZbArjuKvCmp+EGxOyLOdb320
         zmrkCb/VFnnVjy9Gp/Bh8WrIuWF1JM4CtKh8Q8Wp6udPlNLfpaIr8fWMeB8v6hC7SzZF
         g5qLnT1WZtUC0IAJqD0K0e+aRlnOu10UVBEhTz/TeTtbbnXd67IMNI0mQgfUR31dZMF1
         08owg36S0yyczW2muuDoudxkhtWz5wAckzqk3sNx3yanAtFyYEyckuK28EYFvBmXmSNf
         YLglOBldBhWZeE22sBffVlqOkrvc2Dz0HPhNYt96sGVL15NXd8VL7qX6KVfbQ0NzhI/p
         MQpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq9Nx0qIVRQCf31RQDcZc2HYY0BUGSisOTvSL82k1TvroA9hqNX8WfQrwNx2emCom4J0xpMuPXR5sbWvdk@vger.kernel.org
X-Gm-Message-State: AOJu0YyiqbY7Hz1QS/IFzvj3rUv3OZQLqk15HMVihSV5AVPz7It9U38X
	xsHC37V1VPkSxlAH8a2lFl4c3WT1+WBbmmUPgXysgh8S9vjBN5EkE5OH0svAsEverIXl6+KMkC8
	V5zqXJxGmKhJlTx8gZhfP/+e+KR38fiOgLWhDUFNB1vhIO/UZb54ZJBoNwluql1vG4CIh
X-Gm-Gg: ASbGncv79IMioA1oUfsXKMaqj2Ax9BfHMlvCzSlKa2j8oHFZZl4OD9EzUweBpA+xqLx
	RrrV2dyP9bUFiTwKPNMOBoXEWrWK6qRjYYJNCwd2f3YQCNVoQZzEnUmw3BErIcns/0K0Fg8fJF1
	C2Z9tAJtebee41bW0glJzpcCr0591rvKCni1Jjf1j7wBkWgZYt2TnyJmwYHSYY6Q2X4cOOqA38d
	/HQPJC+XsM2HjuKqgtulIEUOlwaAleqQSBhG4dFL7f+/1iFSj3pQEonTujBH3QZx7bfRPuq2PZD
	EpuNEDUt7FxJL9u9ekTLZTNXMUDziBp8f4HtnLnxl+CeSiIa57/DOWwb/U5YDn6a
X-Received: by 2002:a05:6a00:14cc:b0:736:4e14:8ec5 with SMTP id d2e1a72fcca58-76e438f0ec5mr15651411b3a.11.1755526019874;
        Mon, 18 Aug 2025 07:06:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaW5O7M2POFlUVEtIHKn+I++/iHZWm/6mA4hEC46cPlJZweEv7D5U88CqdrtLREpBxLoXmhw==
X-Received: by 2002:a05:6a00:14cc:b0:736:4e14:8ec5 with SMTP id d2e1a72fcca58-76e438f0ec5mr15651177b3a.11.1755526017550;
        Mon, 18 Aug 2025 07:06:57 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.229.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e45588c05sm7492056b3a.82.2025.08.18.07.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 07:06:57 -0700 (PDT)
Message-ID: <9f94c6d7-7b39-455c-83d1-81c694672775@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 19:36:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: skip re-emitting IBs for unusable VMs
To: rob.clark@oss.qualcomm.com, Antonino Maniscalco <antomani103@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250813-unusable_fix_b4-v1-1-3218d166b8a8@gmail.com>
 <272d2a39-19ce-4ac5-b3c6-3e3d6d9985c5@oss.qualcomm.com>
 <CACSVV00Yo=cZxUztB5Jf7153bsnnuATrh3L1utw4SrOQmYERug@mail.gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACSVV00Yo=cZxUztB5Jf7153bsnnuATrh3L1utw4SrOQmYERug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1un3279t_rnk_etQ6DyNVett1kFfVpJZ
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68a33385 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=9Q8gPALlkHEzzDxkdHlyxw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=1QxSUWC4Tu4TNCmoOX8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 1un3279t_rnk_etQ6DyNVett1kFfVpJZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyOCBTYWx0ZWRfX0R8l4P8FWeL/
 GM/CQ7zXcvoTgbZJC2tFWP8NOB9bt0gVrYl+ukTewqrXAUjF4oxfAAvyw0mifpVJE93sle4WqTB
 dKQMUFL3/5Wee2y2jjF+qJyZhEAusTsX1hHcP8fFCCRtEX8WrloexIWRALBukfW8MRC2l8iUPKW
 Ja3wUPbZUuVrdCBfzd0b3kUmATY18uH+jRPyGvNmFUuN1Rtt8F4R7qEhBztvBm4EZbrIa9LoOFI
 WBEWnHYiEB+2pgwH7y3VCXgNC8A55yp4Fp8H5aFbZ4O0nLaDPCRdej98Wl3rb5Ylg5zBoXOkaSr
 PWEZA+XyHtPJN0NqK939Q38C5lh5dU7d2pENyuW7xBMRjW7qbYk7el8+dgbuSlykcX0TikdtLpV
 526m9ojv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160028

On 8/18/2025 6:48 PM, Rob Clark wrote:
> On Mon, Aug 18, 2025 at 5:10 AM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> On 8/13/2025 6:34 PM, Antonino Maniscalco wrote:
>>> When a VM is marked as an usuable we disallow new submissions from it,
>>> however submissions that where already scheduled on the ring would still
>>> be re-sent.
>>>
>>> Since this can lead to further hangs, avoid emitting the actual IBs.
>>>
>>> Fixes: 6a4d287a1ae6 ("drm/msm: Mark VM as unusable on GPU hangs")
>>> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
>>> ---
>>>  drivers/gpu/drm/msm/msm_gpu.c | 9 ++++++++-
>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
>>> index c317b25a8162edba0d594f61427eac4440871b73..e6cd85c810bd2314c8bba53644a622464713b7f2 100644
>>> --- a/drivers/gpu/drm/msm/msm_gpu.c
>>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
>>> @@ -553,8 +553,15 @@ static void recover_worker(struct kthread_work *work)
>>>                       unsigned long flags;
>>>
>>>                       spin_lock_irqsave(&ring->submit_lock, flags);
>>> -                     list_for_each_entry(submit, &ring->submits, node)
>>> +                     list_for_each_entry(submit, &ring->submits, node) {
>>> +                             /*
>>> +                              * If the submit uses an unusable vm make sure
>>> +                              * we don't actually run it
>>> +                              */
>>> +                             if (to_msm_vm(submit->vm)->unusable)
>>> +                                     submit->nr_cmds = 0;
>>
>> Just curious, why not just retire this submit here?
> 
> Because then you'd end up with submits retiring out of order (ie.
> fences on the same timeline signaling out of order)

Yeah, that makes sense.

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> 
> BR,
> -R
> 
>> -Akhil
>>
>>>                               gpu->funcs->submit(gpu, submit);
>>> +                     }
>>>                       spin_unlock_irqrestore(&ring->submit_lock, flags);
>>>               }
>>>       }
>>>
>>> ---
>>> base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
>>> change-id: 20250813-unusable_fix_b4-10bde6f3b756
>>>
>>> Best regards,
>>


