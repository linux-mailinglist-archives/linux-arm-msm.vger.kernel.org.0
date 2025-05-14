Return-Path: <linux-arm-msm+bounces-57968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12373AB7586
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C74AF16BBBE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C47028D8C4;
	Wed, 14 May 2025 19:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BmK1PI8Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D725E27C172
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250103; cv=none; b=OHqR04lkOxbkWTNq/mVHKoSnyPTxDV5I8b3fBWSzTDRy9/vUnIdty3OZpNAJAEvseJtwc8WphDhqNPPRAEvIU1v4dGeqjpTSgLMrDCbAzvFFzP2gEmST+u+A9vHWO7zbJ9VV4y/vtC6vCaavOBNxoHfT8gpGD+mMRpzntFe61QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250103; c=relaxed/simple;
	bh=iiULBkW+A+3L2DbNYgvzwu4y/DM2eJd7Yutv/4OpIGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONxFKt0/pfaa1tq+8l0BWRpotQTF6m1dfNTKNaRR2Rc2FWCcu9l4a3S1j3KdMJ+4fjAX2g6kSPcmEYImUKDh0b+8Mgn/K7C9qJKN/yjBNJpoAxkaaWnWIwHw7dVhQ4eEyFYW/SMvJWHzTklDXVH+gSfAYEWuPjDzENmyMx2ztYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BmK1PI8Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAufco002705
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vh7H0yLxNzQIQl3kX5HeQXht
	XXVVGd4YVC324hHcq88=; b=BmK1PI8YpbDEFywyps9bUzBkXATRBOuoq1qk0J1k
	8HDMFeHYixJV+zUoheAkidxTdW0/TLoprYNSVsRGQJEmYwU4d1vXhwCu+jdaixZI
	dVxajHBskTn4upXzTrA+83Spo8PMXNqtD6qHolFpKpxBOy0NZgvww0Sn7Rm8OLYK
	BpHt9A/2Hq9236dbMEJgGIpKjDIRETNPf01wt7MYN14GwzxjrM7FIce2JgKf9lHB
	/+WJmtdtlKHPxUj72Au/adN37tYcYIlaMomwVITGXokwF3THnN+VLoWScIcaWxVs
	B9nNh+S+BPhhfbrDNVa6J1tZ84TaQUaPMt15S4ZODgi7aw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpbtrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:15:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5d608e6f5so24967785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 12:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250099; x=1747854899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vh7H0yLxNzQIQl3kX5HeQXhtXXVVGd4YVC324hHcq88=;
        b=laxPS74vuR9lNlr9qBz+KgViks7vmodOFHa/jMHrbpVz/0AOwTR+ogCT5TKuh+mcdG
         tZfXCmrFunm/Wc7NiXr43pOGXIZath2aUouhm5L12FCuUh8fQFPj+Z5gXHbifS05z04N
         ya9HE5p+ziyyhhunzFMqaSC3jGW/r2irzoXKNzl37d6IgPh8g2AHdPdnb0S+TeQoJOkg
         vDl6LUs/JtKnbNBhPc+oOddyHKcqdGpnp7usBVNtdgG07thvDd+F32W0jPsd3sMifamO
         /ivqRmParAKe54zCy66sh/RObvrKEXyi+xMrUA0nURIwafAPCOJ9txrlt7whueaHADY9
         nD2w==
X-Forwarded-Encrypted: i=1; AJvYcCXl6tnYOn4RYuIGWG1+xxj/rOqzmz2LqQD5jG2vXL3BNZ5bPnYJ7VyohRdyeud1tFLkCZNqpwii+Jkc5BZY@vger.kernel.org
X-Gm-Message-State: AOJu0YxkWqxHqICnyn6LNt1wVx4YkvbwWRdOVwjZnUSxYKbtXCcSz36l
	1YME6R7FR7JpuvGaqogOxco3v5via2MI7qwRnNhjLuYfvUKffQyMjbDd5E4Ydce4V9swwAju4cM
	tw7/IzntYr3lUwhF5b39lyMgp76OwW5oxjSe9g2bDg0aKl78adqTR+UGpjZYOpMa5
X-Gm-Gg: ASbGncuvnGYYKfw76F+qRj140dJ6d5Rfbb/vKBhxzWdBpAuPA7Ae9FNeI+rEyn6P2ek
	iucO2ojQ2VPUIvtIUuKxwk1YRG/M+X4HY1oO9oNTst3ou0kM0fv3qH9ZguCFjzl9DbaT8zVq0Pd
	kRuVXStojqZ7lLBqfnPtnhQSQEw8RPVt/Za7HLznTG+ST3+EdH8t+ARi6cfWk6ZzC4/NgvFgHBl
	GBcZFaXQV8RTxE8JYNek0ZE7r5TYo7fJp8cRnywvluvhT1E1auD8dbH7QgxRCSO7ZAAC6pFulqp
	p8esvJSltVsrEMPaJAkkugANZgQ3C5BjYzTANBTXnptlqm3t/HK6emJJmi8t6lMDcgGs3aKaQtc
	=
X-Received: by 2002:a05:620a:3954:b0:7ca:f039:7365 with SMTP id af79cd13be357-7cd287f8e29mr760419985a.8.1747250099356;
        Wed, 14 May 2025 12:14:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW1uLW0kicqfgbHoNdFUn95rpD1RDFnA/XLJvVUD+FX4xES0n5KnnFI6QYVl2bk5Get+Fxgw==
X-Received: by 2002:a05:620a:3954:b0:7ca:f039:7365 with SMTP id af79cd13be357-7cd287f8e29mr760414185a.8.1747250098844;
        Wed, 14 May 2025 12:14:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64bee73sm2349244e87.162.2025.05.14.12.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:14:58 -0700 (PDT)
Date: Wed, 14 May 2025 22:14:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v2 07/15] drm/msm/a6xx: Resolve the meaning of
 UBWC_MODE
Message-ID: <xzmvy6ulog67b5ibzg5gm37rvxerbwszoq3qr47kapj2rbjeuf@wr25nsuasa4d>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-7-09ecbc0a05ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-7-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-GUID: xmUks_cLscOuxgvhyNlSVVJ0kiodDWA1
X-Proofpoint-ORIG-GUID: xmUks_cLscOuxgvhyNlSVVJ0kiodDWA1
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=6824ebb4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=yx7l2LZIIY2QNE-vfc0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NSBTYWx0ZWRfX7zsVqcop/ZY+
 +7vEe3URrNTqY7qpXoLX3LauoVCxIMIvZTPjuSEwxRUhOOrwreysdp0HtEvZ8oPPf+h7OG3fWJp
 hQk+2kHn5ZAQhmv70wXlh6bgsTuMwibQ5WudEZCgQBb6yzt1CIg3eF1hiEtX1gaFahQ6lN4LLYh
 8zuBpxRBHeG+c4QBTN8AaN5X9jfY6Oy9aYj5rtAI8rtYHWHwGtXaDYyINqfXTUe+eYWbKakEVd1
 OHu+TNsndt7XDzZgx0XM+nBzWDvaDBTI9T2sSJNo5aou6S55hlTb/A9pm9nTIHHdvyAQ2IiGlvO
 FRUiSjuyvvsvrqyxfjJ3fR6T+j7BDDhJYoQIueaMsvVixaVwet2i1GAJK4gsLnzSc7ZTQtAGkUI
 KKjJKNyGep+Hof6IeMRkuiHVW1W19au2+n+7cT3Di2VwntHVNJu2Ieu10O69FmUr6NG32/8h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140175

On Wed, May 14, 2025 at 05:10:27PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> This bit is set iff the UBWC version is 1.0. That notably does not
> include QCM2290's "no UBWC".
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index e7c89f9c7d89798699848743843eed6a58b94bd3..6af4e70c1b936a30c1934dd49f2889be13c9780d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -669,10 +669,10 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>  	 */
>  	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
>  	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
> +	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);

I'd really prefer if the function came in this patch rather than being
added at some earlier point. I understand that you want to simplify
cross-tree merging, but I think we should also simplify reviewing.

>  	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
>  	u32 hbb_hi = hbb >> 2;
>  	u32 hbb_lo = hbb & 3;
> -	u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
>  	u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
>  
>  	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
> 
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry

