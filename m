Return-Path: <linux-arm-msm+bounces-88375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76070D0E087
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 03:16:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2AB593008E83
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 02:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A60741754;
	Sun, 11 Jan 2026 02:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jw3IG1tc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M+4+mFc/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B55750097C
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 02:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768097766; cv=none; b=NzvGVUIpotdwIRAzk6RMHrYbgILtquZYm6uHv+I5lC2z6nBa3V0T91+KDAnKXIwQ8pL+AJnZ886/rflLDlef3WuE1Ydzcjad1qoZXTbmplIWnRrxUbB04MkvZTYhaktztwuD6yodGfF0kx/E+Xy/+K3AflCn0rjabxAam1q6oeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768097766; c=relaxed/simple;
	bh=pU6X28yJQUVNrxbV7b/7wLNDf+lo11B54Xxly1egIN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sfeebtVPZR+NJUulVeXBLHRCj2OKSvVPNoUZDa6uGWrQdXbasTuMS9U1VWL2er9NfFTqMJPDq/+UhkGH3syg9K9fQfvv43J57Mb6HmQw1JGPJ5YPenagoBE8F1azZsnp6TxCbNQP5U1Ixx1bVrYmI0HvEtRCZ7d3O6yJEJkge/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jw3IG1tc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M+4+mFc/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60B0KHCX1518439
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 02:16:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=36jydPMHIlMPDfo/OD/hFrnZ
	gfzZvIz6poGqp6z9gA4=; b=jw3IG1tcLRfKg06DvfNUnLhqf8YGehdjp+D/RHG1
	8lCFrPN2AKQFg1EkGsEyx8s0lNvm4EJq5jRKI7ppnB81gb6WCnxvjVMmUeyMoiIo
	oav2Vo0yqEQfPiXqbAlkrgESaq3QNLmEwlezRgd3+AHWOyiUvOskCHAliTJXGlb1
	cVejzrilO8hU2NkuspxNVKVTKzfSffTclAxHjiqLBZHewJJlOqFHcAqzx/dgpFjQ
	7x9K2xOLrwt18uePcPAEmp2zWatf25t/kned01i4zKL6P8tl/rOOQHJB+QrTyIra
	gpoMLosK32dQvgezHlBEjU2noaOj0FdJ66/Ts66Fhmrj7Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkebu1kj8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 02:16:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2e19c8558so1302091685a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 18:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768097763; x=1768702563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=36jydPMHIlMPDfo/OD/hFrnZgfzZvIz6poGqp6z9gA4=;
        b=M+4+mFc/bVTYEz44cHv1UoNcvW6EBEPfwCDStJSYUQ6jO/O7oOYKwqG3XFygQ84fD1
         CkxaBDDHR/dETkwL0XEBRv2SznjiWhWJEEvhKQOA5WSxLhJ4c11DZ+PlWS5bmtNzd2U6
         AB2nU05WVMYTZRn3YdEGf2BWwxJd/0MOIyNPWajt4JeKEY+4dE9ALXn+D48gTRJbABda
         97dDdzozUgXL4aR9eN21ufrUX1I+oncD15tvgh16Y+zoy2g1sI0rQ/sxs+e73piiqxGO
         uIsNpvwOMob+PqNBUDYxatyqOLP9+Qhb37JXXsx7pTGTa6VoJgYTCdBH/kQKutjdKlVH
         XA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768097763; x=1768702563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=36jydPMHIlMPDfo/OD/hFrnZgfzZvIz6poGqp6z9gA4=;
        b=FY+zLzByXQIkdNs5Hw5iXW/9cuG9qlO7JXZ1crUUbj6yYluYobrwnid2A6RJkJwio7
         jhedw1nRL8taT+1HDJTaLQRqFMTo6rgANLv/qVwvQdSqVw5mzbTGyU5hhfChmChAITsD
         lJNpgs6Oy9gJvO/xOVYqjsYEWg3WzlaCb12NQDHF25j4TyUtXDsUlNnjnjziq/mCCkCR
         wALNDxF89JEPmWPmCbiRXLLOnJ3/uLqcF8MZ44Vk7320NKzWGjzx/fv3EL/3Y3t15187
         /qv/kycelNsvevHjOVB/qmzdaagyC9aFelkTT4Ia5Fqf7V6Y6LJ2hOxiuwoV5N9/FGjs
         +NKA==
X-Forwarded-Encrypted: i=1; AJvYcCUPaeCO0WjgF9ekhYpZUm75KpGXBmdCC9B2tYAb6IRGUQCiEgH6E80W4wlyZ0FwnhmFxG0Rr2T51oFnXgtw@vger.kernel.org
X-Gm-Message-State: AOJu0YxqHOTVm1paTCWC+fkAbeUceLcIBCc7fdSIgbTx+eRSmo0zpYHv
	BoThTtrbUFGHgytHs7/Jsrbz4rZUI5M+oe9VjxH0G6ole1B5Ql9JEzFMXOTFiHTjRW32sRJx/cz
	Q2NVbETf8yFGbCZf98i7vo8c4xwS+6Wq/HvE8ws+/ZOUmJs1Svee+nBsotP5kaYtVnEd6
X-Gm-Gg: AY/fxX4+/hBuwRiNIJkQ8c35ebZCGlFM4XSX2oG8NtH5K6vjVvdj5Khfq5lpwqaaKiX
	fQmvCOfBaXC40Kn1weKIFqvPsAs6Q3sdYyd9zB8dRzFCb9k+JlOx7woXTr/NC/GoD7ptuYJNJev
	Vcguj/3OHWYLvMuBCufmRY4IMgQv5tuwpYsEQiAOT29TvRleA2naM86yPI0vwFGowqf1/bVGSmd
	TPmR9jiYYVkeM833zTn9l2Wv4f9zq1n8lPx7tNa8jwLGF289QVUANcg7NHu0/1ssyXCtmW9Dekp
	r4p5N+WR8rnHE3aI0EAysvMmXjuK10GVfGWnCkmqGthTJ7veuEGX9zfISrsuu/jCH3USM/aqBIV
	56HXZpXNYvIEItuOzON+n740OJA2OWSLOFdhca3yse2xDTKuKvn7EEc0Dq0R3dY04Tzr7K5Lp02
	z+KhTJEGp4KeS4w7jfd0HhH7g=
X-Received: by 2002:a05:620a:4729:b0:8b9:b84b:4e3f with SMTP id af79cd13be357-8c38940babfmr2056522085a.62.1768097763251;
        Sat, 10 Jan 2026 18:16:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjON8JUr9rP3ckXKrY4koDtuqcBKVzXl5l7P2QrwesMAKpa5V5NKX8AYDkATwzdlygkHvSYA==
X-Received: by 2002:a05:620a:4729:b0:8b9:b84b:4e3f with SMTP id af79cd13be357-8c38940babfmr2056519885a.62.1768097762773;
        Sat, 10 Jan 2026 18:16:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb3a0046sm30552681fa.8.2026.01.10.18.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 18:16:02 -0800 (PST)
Date: Sun, 11 Jan 2026 04:16:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/msm: Fix x2-85 TPL1_DBG_ECO_CNTL1
Message-ID: <r6yx23davlqzcgpjfneml4bur5qsb5qrjh2y6hjo52n34ykb37@ma32n25wxpnl>
References: <20260109153730.130462-1-robin.clark@oss.qualcomm.com>
 <20260109153730.130462-2-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109153730.130462-2-robin.clark@oss.qualcomm.com>
X-Proofpoint-GUID: 46negwOWW7wGv0G1eHZV3F5VUuG_AGQO
X-Proofpoint-ORIG-GUID: 46negwOWW7wGv0G1eHZV3F5VUuG_AGQO
X-Authority-Analysis: v=2.4 cv=LeYxKzfi c=1 sm=1 tr=0 ts=696307e3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=GOW6-3cM_b2aOis-rAcA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDAxOCBTYWx0ZWRfX1lvmC4Zh1Ska
 7YdtavFinuQ0MRJ0n9DIhzXE5FGVxKNbuTXhJjLUeYp08f+y0D427I1/SiqIP+pcAQPFoqAg6nE
 XpbgL52Kk/ATf8GkwGHpsIlr6DPU1m9Q9SPlajAz5Y7dIKBrIf7g/G3MH+yP3ilt0ubahYT28G9
 5y5pebTsLfiEPSSLfMrRMyGGDGeUQjltvRLzk6VN7Z+1jwfZXc//KDU2Y2t9Ql892JPVVS2Bcnh
 v576zIAXpPfTwsEgaZN021UOGNtG8LmPExYQ+yNKmeC3Ua2BO/Kn/fj9vu3u29BHgsGOH+kwKtP
 DJvIia735rmoBsLWdEuUQTVvxKZuL0uwR753Dz545MhvDZMuV85EbCCtuKu0A259+HlD5JySjMP
 EIpZxIf6KDzbGXubBSOzzOp2ONAuth+nNdACR41YfT8//AnlgkCZ2tvH2R9gG5f4YtBw9ng5iKP
 6cXcc77FsOVYr0y0Vpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110018

On Fri, Jan 09, 2026 at 07:37:28AM -0800, Rob Clark wrote:
> We actually need to set b26, just claiming to do so is not enough :-)
> 
> Fixes: 01ff3bf27215 ("drm/msm/a8xx: Add support for Adreno X2-85 GPU")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

