Return-Path: <linux-arm-msm+bounces-70462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F019CB3241E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 23:23:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9CC7583FDB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 21:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1238338F24;
	Fri, 22 Aug 2025 21:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQS8Om7v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AB33376A1
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 21:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755897759; cv=none; b=ss7VEmeNrbFbZrUEkwB4ZB3EZNsVBUQTZ9wFvGLwVAKyopLGDpUMHORin2PAZonJ+InURuHQrvSNhgXhwHDr6qMul8n1PZ95a36cghRcTXOfou0oTAOf2vlxklnXaAitWLpfAQcA/5hIe0/aNhBHeIW5G0PZ9wOkILbNEvCW0iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755897759; c=relaxed/simple;
	bh=fLNcQx0engoQmdLVWT3nsxi8NHNazUitXj86aoV4nI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UuuptG4JfIfaWt1kWyUgag0zCukKTv4ddff5L1ts+54zoVWwRhOLKGdiuttrSWJC+ODw713i09YgFL6If71w4R3oLo8Ub9zaoKbu6xrIl2TwrHCPU3avuw3ekoxq6H+ug/Ke4EzVsKpwhveJSA7OSWTOiYUf0UGk6hqnX1XSRNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gQS8Om7v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHZqBM025568
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 21:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y04A3Fq2j9qagFY6krypelE5uzKnSvrs/VFzYky1PFg=; b=gQS8Om7vQtOyKzYk
	Fy41yFewp/AE82OFifGiQr6Rq+Zmao8xQeRDTu6nesE1TXyWnBUwaTp8ztldk0Zq
	rImQ6OLSJ9wzj2YrELxsUuD52qRalGZXUN/xiREzUKWV6u8PjB25m3OyML1S5mxg
	Muh8slscn3lggCPC2f7csqm2x/+hSOM4ttZmGEwsFGaVAKTvZ9/90DoMQKI4hoUB
	vfM6GPetebR5W/zyhtoN6HuMrpTiTRBa/b4tz3fEIveYq5j4xs0BmxYnMUQDuxt7
	ycv/Ok91yS8m3KrNuXIRhOHVSsja0cnbvkGEIgg0rKMa45f1j3X1EsecX5fzb2Si
	9gTNTg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48pw3cggkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 21:22:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e2eac3650so6099620b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Aug 2025 14:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755897753; x=1756502553;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y04A3Fq2j9qagFY6krypelE5uzKnSvrs/VFzYky1PFg=;
        b=GlQ5VjmMxzzw0rXLDp767QRSUwjccOAIygvxHw4zXibUqKuxVbDumot2x8703cQJD7
         vPMjl7QyO8XJsf7Qh/D7bKjNM+rWmIzG7W9zgslibqQ0I+7g+9kaaNHv8cJJYgKumTtB
         a50J8coQmasI4Rm56Gq4YCI8Fi9LsSE0/jBueuX7S4U+z8hde3MWQvDwU7ME6SJDHqnV
         KBTj3SKRPR5w7phUl+0A3asXrBIQHOoYF+eSq8G8N7NmKUn1WTMXP+hyLkEsG42TdJq/
         Z+FVz56x9XKnVvu/nQ5t5kgVCN/X6aqzyK61G+TpWcuA0Cg6375eZSBPQEWYPROQPjXH
         +f7Q==
X-Gm-Message-State: AOJu0YxuVy899r7h/C8HgwE4xVI8pY/0dRYW4fAZIySRtgV2IsERqEZk
	Tydnmgwjy7S4Ms6JMa9kGMO6jOdne8rEIro+ElPPSJ+9m4tyPsA/ep91OYp19G5EMyevrtOMKJD
	CbKU8Qh1UiVClWWbqvs3K+tY5kRlEgwysVoli55Q4XA5DNAv4lFr5wi5unjoem2Dd98J3
X-Gm-Gg: ASbGncuC9+YKKuccbX/Du5bGXCEkt7UP6N97fRwsh1l38iOVQe54xtVVo07A4sgJ9uE
	CMTi5TVyae/LZlcDd4nQWmtR6jXwKnqpfHWx1owHkU4SzO9vqnWM3OrxRXUvR8+4C/d5pVFBsOO
	shGH3mlM0OkYuxJPxsdqiSkEfsciYaIlIAjtxfTMN8u5Gf+UlYhuNSVOZR86l3M2OSKW2CLMHb2
	iYQPm5JFnHYULNC03FVMxYUr06xBawlVQeYjTDQP/knhpy9S2cmh4XpuyESC+WNzxcq7PSbjYzN
	uGsvSbeHc7a2J4bRpdH54FPV52+3ZuWEBnS23mo5QaPdX3PtZFjKHqntEPufnsg=
X-Received: by 2002:a05:6a00:2991:b0:770:374c:6c60 with SMTP id d2e1a72fcca58-770375bb1b7mr3749745b3a.12.1755897752687;
        Fri, 22 Aug 2025 14:22:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqSDDQ1Oqep4mXvYQ0f5AHY2NlHaFudfMAfAYS8IQDadWgR54tO2EW+TnIYNX89ov0/SlHQg==
X-Received: by 2002:a05:6a00:2991:b0:770:374c:6c60 with SMTP id d2e1a72fcca58-770375bb1b7mr3749726b3a.12.1755897752210;
        Fri, 22 Aug 2025 14:22:32 -0700 (PDT)
Received: from [192.168.1.6] ([106.222.235.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401af16bsm767687b3a.54.2025.08.22.14.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 14:22:31 -0700 (PDT)
Message-ID: <73ba625b-604d-44e7-a73b-9f727ec46917@oss.qualcomm.com>
Date: Sat, 23 Aug 2025 02:52:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: make sure to not queue up recovery more than
 once
To: Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250821-recovery-fix-v1-1-abfc518ba0a5@gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250821-recovery-fix-v1-1-abfc518ba0a5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MSBTYWx0ZWRfX/3SNMXMfaap6
 BKoTk9fUEjZuik4q9BpEUzt4euOmMpYcLTFtSSGTL5L1P1S12oD9Speg4ZHklpKNUnENP0UWfWg
 yJZVkrZ9FLCVq9v6SH0GY3l6RSgn7p7TidqbhIIIxbmV2x1ZiaVbBe0aWjc4O+Y4IUU5U+K96Nn
 C2qPhsHSj35oWK7JGyCHxWCnuWbP2Ij2F7a5fqBk6Ggy/JDVjKZFKl1/aOTPW8cYFrc3O8yWfXZ
 t109oC5lyc3M66KG0+X4UoiO3mL0T6IEM8XjwG7yh/KbUhK16k0B1OCYCVMnlfX9ABhVTEo2I5z
 20vA4fOvHuouFVG91wXqIwS7omm/hz2omv/nxaJhhYQgdLOyi19qeA238mPKw4kcSl/8huPDIVA
 ZWBXSHqh
X-Authority-Analysis: v=2.4 cv=EJ4G00ZC c=1 sm=1 tr=0 ts=68a8df9a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=YJRzWv9GHcPC3W2cS631hg==:17
 a=xRKJ3yPZld0_iGqN:21 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=F5irVdaa_9mHTkytiuEA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: cTu8tHSKm-Su2SmvJH6doADsYD5CaBe4
X-Proofpoint-GUID: cTu8tHSKm-Su2SmvJH6doADsYD5CaBe4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_05,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508220161

On 8/21/2025 6:36 PM, Antonino Maniscalco wrote:
> If two fault IRQs arrive in short succession recovery work will be
> queued up twice.
> 
> When recovery runs a second time it may end up killing an unrelated
> context.
> 
> Prevent this by masking off interrupts when triggering recovery.
> 
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 45dd5fd1c2bfcb0a01b71a326c7d95b0f9496d99..f8992a68df7fb77362273206859e696c1a52e02f 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1727,6 +1727,9 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
>  	/* Turn off the hangcheck timer to keep it from bothering us */
>  	timer_delete(&gpu->hangcheck_timer);
>  
> +	/* Turn off interrupts to avoid triggering recovery again */
> +	gpu_write(gpu, REG_A6XX_RBBM_INT_0_MASK, 0);
> +
>  	kthread_queue_work(gpu->worker, &gpu->recover_work);
>  }
>  
> 
> ---
> base-commit: ba0f4c4c0f9d0f90300578fc8d081f43be281a71
> change-id: 20250821-recovery-fix-350c07a92f97
> 
> Best regards,


