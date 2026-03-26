Return-Path: <linux-arm-msm+bounces-100064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKE5OGH3xGmk5QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:07:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 410BA331F19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:07:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5FD08301F6AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 09:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75073B38AD;
	Thu, 26 Mar 2026 09:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SKmBJX+P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YcXEEF1J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8527A3AF64B
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 09:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515888; cv=none; b=LZLhr/CnZeGJsTUbzLaCIRuDo/bdVN2KucArYZXG/tpZoWJurBBj7d/X8GKosQZKptgo6ZcKCQ1TAAyai1QtfUDkjC2krYbBwnq60KjlkUG7GDMq2oB4sO78iLgixb1eGQbpejVwbWivFFUgRgElo9NACO4qDLb898WCwRW0vG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515888; c=relaxed/simple;
	bh=fac5TGGyDbkeV+/QzYj1NXjCY3JKxaVX8LM0LOivLdo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rPuaWy3fWbTGEYK8x/Je92Lt26MuosDU5mcwZuw9lLxpPLHJAI0Dlry7ziHNcHq8In+Ll+Qfr3ykCUM7QygNbxkYB5mLwtoE/TrfAtYoq+Jqn/iN572X/DygjXFAdslTLGaUzIvqM7YuJMN/UgrQQjEJQSCVL+/gN8moaui7/X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SKmBJX+P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YcXEEF1J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q3a28k4015188
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 09:04:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dm7+IkHm6u3Ao2yPOvX+EC3oSpBBKWxXJu32fAZJmu8=; b=SKmBJX+Prt9utq8F
	pulv5S/Dzl0T/M/OhuoOry5fWfak9jVzJzptISTfv1yDKRpOysnUbaZdVRNR4pbv
	syOJd6mQwe1gOwQtfg9l7BuaT6cDuv8Mf63z72uQSgi8tTHpuzZl3elZRLwlRJj0
	Ldt/svGvnK1kgkty3J/la8EfJNJ65zPbMUEWmro+fK/soY0U6VfoTffZOIhkIRe4
	DkFJ/hKvEoYPJ9NyTMcu1HS20B3jIVRg+q0wWHunvHYs4jhvCKnLFgkSlRWrck3b
	0A2q413plVVlGc+v59P1X94X1YwRJG6EIuI1+sL4sASLDEpfg4H0lRFsfxvn603X
	l0GYPw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4w1q9165-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 09:04:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89c471045c9so1777656d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 02:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774515886; x=1775120686; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dm7+IkHm6u3Ao2yPOvX+EC3oSpBBKWxXJu32fAZJmu8=;
        b=YcXEEF1JiXkIYqnvor+xnRWKySFUwjstOjSPXsOJSjiDZPVyFNTPBWO4xXX3gCebwZ
         mHTtiupF58GL4BTxqrws4XcCIg0OEQPlSsAiCVIxEQMxM1yX+yqTFCSyUQoUVWAa3U8U
         N+ARf3oBYYdJX+rm1FItjSlRK1ZOBTJOl0iqnR6NjAKfQDTxAOfAXLciddbXigtE7mEH
         k5s9htbxznqE7LHVUTL0WcE5/ZcWPvzauRnf+6plvDePETa6DsH01UxBGLlNxrStZoYx
         D7TYCmKzqXt9BVzDy93FUBxw1uRPyNVHJhcQHt9OeyPKXZ6cpxa5/7IQNTGmUDD5xtf8
         Xpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515886; x=1775120686;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dm7+IkHm6u3Ao2yPOvX+EC3oSpBBKWxXJu32fAZJmu8=;
        b=d+0g6jl5U0/vVA+Ks39sU5CAlT/MJzopyPChm9VvNG5wu2on8tOQXNx8eAyoHmriTu
         4QojNTedfYJjR2d/8KsAC8GliMetEBTUXUOLyz0nWfDuWb9QmF0JgWfJnx7T6EhNGUBe
         2OIBfoLJ4et+HYawftpx4RvN1/uxM4QAIzYlvZPg/Rv2P+e9q5zSlX3hzaQV44c59P8X
         kkESfT3QwtYVBG97FBK7pXIMEmErNqtK2b3izbhE8cca4E7/NBN1LQaYMiwyL2fpDWVg
         K/nQBQ5Yiz/j4jb7H6nNP25sJeab7eQFIxQDFPeoYWm5FvvHJ2H1CnnCCO5y04D6URKO
         FFjA==
X-Gm-Message-State: AOJu0Yyjjc9ZUM75Udd0lzDzL7jgBtw+z9Fh4NQ7Mc6EhBV2AID0RVS6
	eFlEuIsf0/ffxRZDMj5KgTJ/e3a5hTPKkP2DVw/CMOxrc8Bhxa+vOO/HqWEfwGUJX2CU0Dg98rS
	rWQBFFhjM9b/kKAgdWJad3iWUrhI9bGQKE/nk+QSfnN8M9bFYwpjGDBxIlFQLK+L3OJmZ
X-Gm-Gg: ATEYQzyJtcmbhOuTE15X8sbAx8Y1JEgitfmUC2bHwK/g1HBdmLjmeKqE8aZTOHxoWdG
	eID/j4zGfSxUGWdPSX/gVufYprkFgxGdsyt5NW3AYp/3QQlKqygMiWWwVJ5Jef5wyCVWEGEMbTy
	H8F+zDpdBGf4FSB3gVxfNi/DKJPydhIgwP9pMB32ougxDrIrpkqI9ve/J3072yOLuxTfJGXWyJl
	2FP9cYh5mJtCJPS7WAooLfAlQxOJhtbIU8D4F9KIFNyb6ekvDmg1+NptfF7ySUwXkaoSz6ant+a
	4xadf2cJTrhWXEqYQoCtgjfwMWm+p5bMUlKTZArFW/rxOJPjTgo8G8om42UyT/VOShhaBceeigA
	lTjzycc7ewFSfsvmJChPs92fUzlnk4kAS0ewe69fJSnI+1E2z04SVDoUshJtZ+VjlgRcE/OYSgw
	QioVs=
X-Received: by 2002:a05:6214:21c3:b0:89c:cacb:e8fb with SMTP id 6a1803df08f44-89ccacbee74mr55023536d6.7.1774515885667;
        Thu, 26 Mar 2026 02:04:45 -0700 (PDT)
X-Received: by 2002:a05:6214:21c3:b0:89c:cacb:e8fb with SMTP id 6a1803df08f44-89ccacbee74mr55023176d6.7.1774515885035;
        Thu, 26 Mar 2026 02:04:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b203ef95csm87773966b.52.2026.03.26.02.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:04:44 -0700 (PDT)
Message-ID: <4bd0e8fb-a41b-4d56-88d0-c241d6ab431a@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:04:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/16] drm/msm/a6xx: Switch to preemption safe AO counter
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
 <20260324-a8xx-gpu-batch2-v1-2-fc95b8d9c017@oss.qualcomm.com>
 <deb68834-f384-46d8-81a3-9eff88deaef7@oss.qualcomm.com>
 <cb4543e8-dcdd-434b-85ea-561f341452de@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cb4543e8-dcdd-434b-85ea-561f341452de@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Un6ry6YJaO7N8Ryw9zk8JI201wSIqxC5
X-Authority-Analysis: v=2.4 cv=HvV72kTS c=1 sm=1 tr=0 ts=69c4f6ae cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=5p6duuq3bivipkMi_LoA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2NSBTYWx0ZWRfX2HiJQARvfKBr
 BROjwn1duHja7mYC5w2B4TlOb3qkkyCuoYsylBd/bpxStGYEcVBzgKRG+xVlklikIUdOjQcXML7
 H2IqlW4iFztiqJbZ0KhD1h0dPRcHU4aPQRczWUq1F38Exvt5uJ9LTkDE3NlnwjhoWHxz+MgVnNp
 CJgyOPuibSMYXZZKUOqmbNPgKv7r3Lfc5NR7Zut8IaUlu68fq19pvik+bTT3FIQ4Z/FqdbPaJuT
 M/vl+pjb1ssH9JTFTKlZeSpjbFDEW5fpLn2kyAoM3CG9MN/FqTsewrQG5RhNMiygNG/AdwfkePi
 BgXiXwfvWRSHlTG013hSVXksQTJOtg2LIzmtHoGDMDdupeDPqTbLmFRZTuHXKS8x20blmtJk7FK
 ZCHE8KL4jf/yVCan7vn2v57Hj3cTJY5oYbmj63Zpz4BObc1wMnKoOeq4KzfejBOuV4Of3GyXTRZ
 KRCky8ERT4tCbfz4FzQ==
X-Proofpoint-GUID: Un6ry6YJaO7N8Ryw9zk8JI201wSIqxC5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260065
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100064-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 410BA331F19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 10:46 PM, Akhil P Oommen wrote:
> On 3/24/2026 3:21 PM, Konrad Dybcio wrote:
>> On 3/23/26 9:12 PM, Akhil P Oommen wrote:
>>> CP_ALWAYS_ON_COUNTER is not save-restored during preemption, so it won't
>>> provide accurate data about the 'submit' when preemption is enabled.
>>> Switch to CP_ALWAYS_ON_CONTEXT which is preemption safe.
>>>
>>> Fixes: e7ae83da4a28 ("drm/msm/a6xx: Implement preemption for a7xx targets")
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> index 14d5b5e266f7..93bf2c40bfb9 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> @@ -345,7 +345,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>>  	 * GPU registers so we need to add 0x1a800 to the register value on A630
>>>  	 * to get the right value from PM4.
>>>  	 */
>>> -	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_COUNTER,
>>> +	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_CONTEXT,
>>>  		rbmemptr_stats(ring, index, alwayson_start));
>>>  
>>>  	/* Invalidate CCU depth and color */
>>> @@ -386,7 +386,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>>  
>>>  	get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP(0),
>>>  		rbmemptr_stats(ring, index, cpcycles_end));
>>> -	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_COUNTER,
>>> +	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_CONTEXT,
>>>  		rbmemptr_stats(ring, index, alwayson_end));
>>>  
>>>  	/* Write the fence to the scratch register */
>>> @@ -478,10 +478,10 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>>>  
>>>  	if (adreno_is_a8xx(adreno_gpu)) {
>>>  		rbbm_perfctr_cp0 = REG_A8XX_RBBM_PERFCTR_CP(0);
>>> -		cp_always_on_counter = REG_A8XX_CP_ALWAYS_ON_COUNTER;
>>> +		cp_always_on_counter = REG_A8XX_CP_ALWAYS_ON_CONTEXT;
>>
>> I'm a little worried about mixing the names here - KGSL uses both of
>> these registers (A6XX_KERNEL_PROFILE vs A6XX_KERNEL_PROFILE_CONTEXT)
>> to track different fields of the struct adreno_drawobj_profile_entry
> 
> But this naming aligns with the HW reg spec. So I prefer to use the same.

To make it clear, my confusion comes from:

cp_always_on_counter = REG_A8XX_CP_ALWAYS_ON_CONTEXT
             ^^^^^^^    vs                   ^^^^^^^

i.e. I'm not saying this is wrong, but rather that the local variable
could be renamed as well, to match

Konrad

