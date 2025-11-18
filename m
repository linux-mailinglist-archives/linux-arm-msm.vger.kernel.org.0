Return-Path: <linux-arm-msm+bounces-82320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7A5C69CEC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:05:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 589442CFB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED700339701;
	Tue, 18 Nov 2025 13:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ix8yE514";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jXY2XmnS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5641E35E523
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 13:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763474270; cv=none; b=TaTM6lfGqEKvCEfUjS19B5W5vY/Rslt2MkcDpOdIj2c5hZ4USf6AQvNiP8eJNknJtnrFfJny5viV3Nue+qpPecsa3coY2Vt9DfTyz5yRtEeWy0F8LRuAqtLE0rJa554+bK1qTDXjoJHKAmEuQi6C8vIcJe3UwnVuLzqLu7uQiRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763474270; c=relaxed/simple;
	bh=NZ0Q/brn3O9BKQ64Vl+FV9aGut1RxgP6wKNxGKfbRv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jd0I3VS8LfKp4UuHCBR5pyPFOsrNCWG4NgMTn6b5YpcgaokL4WTldKM/HwT9Pch97ymX4P2ztZ3HWRImg6rSCLyIJ42xFZY8F4d2ChFaTVPDVFZK7H/x5GGOcvDIARMVOM8CsIwL9sgCGlO6kUoY/WJHSqZYCESFWHsjnzCLZ8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ix8yE514; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jXY2XmnS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIATLbE375768
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 13:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NzVfNIUSnLL+Bi/4PwxQw0ffMQDRUvRuB9HLEZtIbwo=; b=Ix8yE514CE4ylJ3o
	Gy2BAVuEO8mDuL6cTd5yKcLWig8ZKEQymgpgWdOTuCgiBDJOEvjTJ66axuvWksz3
	+87pow3Yg/sRpQWG0tsz4OEqAp5kW/F8PmM51axJFvD2PpBoI7g/cUHnh6xHSV8a
	lFuGlYaVoBWLJqASP6dfpMGcF+jTJPlmfDqWbMRsU1RUzZET2HdsMPwD5168tOUd
	Ml8yDrHMApl8TpswPs/kk56kW0y+kFqs7nUtyBBbvlbbB95uXG/Q0U4bfeHnYCoA
	eqJwtjgH5n1RDQYie+YjOgmksRxIZyJ2hop9LSiHvo818c7n4Qc2ih2eYnPZP+y7
	CM3qJQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag76nkac2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 13:57:48 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso5752188a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 05:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763474267; x=1764079067; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NzVfNIUSnLL+Bi/4PwxQw0ffMQDRUvRuB9HLEZtIbwo=;
        b=jXY2XmnSS7jwGH2nh1Pv443Wo0r+xrKgOGUytESU+75RBIX5jswxOdYMETnyuOYVLQ
         1L7rOhPSt9XT2Ey/B2VOjqiy4WidZ4AIi+KOuMXNWp3Mp00o/fDY+q5tiOjf730GgVA0
         BiBfFqLRLHvHmwpOb7tkV11C9WCrW8xGfJqmtxD1spOlLKiRBmJ0/xxCrjdZSja158P6
         SvAsnLI+d5Pl/WCuI1y+xUUJ7h4SHhXdm0YZptdyHDj2kRkDihQbuRHNEwi9X9DVZMMs
         P7uDbFiRjLyvSvDQboWP+nQSKZU9WPDMfmeO17UoHH6M0hzggP/Hzk4Q28X0/n+3JQZt
         nKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763474267; x=1764079067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NzVfNIUSnLL+Bi/4PwxQw0ffMQDRUvRuB9HLEZtIbwo=;
        b=X/ZUNXCXGW22UyMyyCf5p4op17GLxgIoPG4af/yNGbUZNoIQqik9lgDbqOrvq+L4A+
         DKo6htjVWdufhAQ4NDYpV2oI2Rhrn24BBwn8vHfWKROmOHV7AdCYCVr6FeCY1lltyLSv
         vFuNHiwnA91GI6hF+6fpjS1Kc07jZdsg1c3oZWCIQIKg5XotFGusUEZYNGHhrXVgHgsp
         x3pUFtDv4QitO2GS6V7GgOKLStQ8cyOXT5YlSxF/GL9FxyAHt4lYNBQ8tfqboehDWMhG
         /7U+ZGTfRlUeGAg06SQuwODriSG60buUmPQ5tkaXghgTBPY2rlyeySWMRw30TaqpP9ae
         vnfg==
X-Forwarded-Encrypted: i=1; AJvYcCXXZxIMffV0QA/Vk3Hl1sr3yKKqkHskIvhYIGl7QjiTQrhf3zHeRQLMAWZAsMQRw596uqLJGnuplLG+Uc+C@vger.kernel.org
X-Gm-Message-State: AOJu0YxpcbOU4OprXz0Sx/JE8+FZWZsGzUC1cVwU/+GtQxdVU2mTg+wG
	0WtAnMutLR56EhK/Lk0DqGEdW724HkAd2LzBC83q3OcFEMOUvzI2ifVv5TC6Tw0oNDL6jLXSyVT
	3GoxJkTgcymM54RDyTbAdyxnxsATH6NoaMqOc2bdCNlYrVdfn2by70qb5dSKSo6klXNg1
X-Gm-Gg: ASbGnctyo7I37e0CNvtqNuBrNg+etqpfH9+EOW4ORBo/FORJalESyHZr05cNUrCWCmj
	iUTpRt9Rom7ORxQQmXn7O1Md5H5kunZ5XF0/F9u10x8UoSUGHhi2SLP9J30rItSLsi+dQR/FSM6
	6jgi/QCWCOPflyh6Lpm+2ySPF0kAYIsg7wr+E5Ef4Y7zryjvi38XrqxzV3a18fw6hTqegyhioNz
	JrRYZcShQsA1muo7fxXmDqfmETa4Y0vewnl+ubvL7yMInGqcaXA1vOVTvKL91hd+cayuzBbQTgn
	EJagg0rAE2JyPOO4XKpm2T1TJKjkywk0HCYyQm7FE2Ab8dJ/rjV8M4ZCqoYt24UQGDgSem0Wag8
	uxg8C7uBJ/AlsQbYoCm9pkQ==
X-Received: by 2002:a05:6a20:4315:b0:34e:4352:6c65 with SMTP id adf61e73a8af0-35ba229d49emr17831550637.38.1763474266324;
        Tue, 18 Nov 2025 05:57:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqQweym02veXOx11FsV5HRruhgX6qp3xUFZXeCsTWnKmjWpJgtrfqH5Z+hC1UT51q4UkoBCg==
X-Received: by 2002:a05:6a20:4315:b0:34e:4352:6c65 with SMTP id adf61e73a8af0-35ba229d49emr17831508637.38.1763474265862;
        Tue, 18 Nov 2025 05:57:45 -0800 (PST)
Received: from [10.204.104.20] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250d195fsm16600843b3a.18.2025.11.18.05.57.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 05:57:45 -0800 (PST)
Message-ID: <c97ee966-5864-4be5-9e6e-afc8a93dab5a@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 19:27:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: check state before dereferencing in
 a6xx_show
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: alok.a.tiwarilinux@gmail.com, jordan@cosmicpenguin.net,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, simona@ffwll.ch, airlied@gmail.com,
        marijn.suijten@somainline.org, robin.clark@oss.qualcomm.com,
        sean@poorly.run, konradybcio@kernel.org, lumag@kernel.org,
        abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com
References: <20251117132516.18834-1-alok.a.tiwari@oracle.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251117132516.18834-1-alok.a.tiwari@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExMSBTYWx0ZWRfXx8fi2xv5M6jd
 YxD0Ap3CmAmrj4KL169bM38vKn2Wn0sKN6tHcl0KqK+WxS5/G+SSLYhNyzEbF+ufklzYjzPSMBo
 JqLeVCRnxO+LhipNW77u/BKpWlu/b2YcV8s79jc/Xl1XijyirVw9uZTdJTZKXke9Trc7raIZcnT
 M2M1c75IzBXV6zsEfCE+GaIsVIsE5+o9PSF1HNuEWSBrQPYoqGUAH4uQzlPMSKrCWveI8uYBSQN
 Ni0piWC10eTolzoK223ZHie7xjXonmY9TnjwKd8I/5w3KVHOwceu6HVB5cjuH1UDYSw1J0k0TeT
 MPRPbgiToL8qjmHGJ3iGZD/R/QX+6MsAWthxJUzn9bbFOj3SXpOjEEbh9Bzj14z5MaMgvNJL5xb
 kIX4bfT5hBsROfiOygNM0pWQzKI3tA==
X-Proofpoint-GUID: -SXnW4duZCy1Xc6omxwR-IqTij_ht7G4
X-Proofpoint-ORIG-GUID: -SXnW4duZCy1Xc6omxwR-IqTij_ht7G4
X-Authority-Analysis: v=2.4 cv=a4I9NESF c=1 sm=1 tr=0 ts=691c7b5c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8 a=73rUxmhrSfcUVL-5kvkA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180111

On 11/17/2025 6:55 PM, Alok Tiwari wrote:
> Currently, a6xx_show() dereferences state before checking whether it is
> NULL or an error pointer.This can lead to invalid memory access if state
> is invalid.
> 
> Move the IS_ERR_OR_NULL(state) check to the top of the function before
> any use of state.
> 
> Fixes: 1707add81551 ("drm/msm/a6xx: Add a6xx gpu state")
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 4c7f3c642f6a..e408e1d84ade 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -1976,14 +1976,14 @@ static void a6xx_show_debugbus(struct a6xx_gpu_state *a6xx_state,
>  void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
>  		struct drm_printer *p)
>  {
> +	if (IS_ERR_OR_NULL(state))
> +		return;
> +
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a6xx_gpu_state *a6xx_state = container_of(state,
>  			struct a6xx_gpu_state, base);

Are you saying that this container_of does a dereference?
I don't think so.

-Akhil.

>  	int i;
>  
> -	if (IS_ERR_OR_NULL(state))
> -		return;
> -
>  	drm_printf(p, "gpu-initialized: %d\n", a6xx_state->gpu_initialized);
>  
>  	adreno_show(gpu, state, p);


