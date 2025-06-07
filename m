Return-Path: <linux-arm-msm+bounces-60534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF54AD0FB6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 22:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFAEF7A4474
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 20:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611B71F30CC;
	Sat,  7 Jun 2025 20:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+ICdV7y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BD81E766F
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jun 2025 20:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749327555; cv=none; b=IcK/tNucP7ncl1URzT8ZA5/pBJp9SGtrEvCmQCdWphW+SV3XZUHfYFchOuboDfHRqGsoJB3dG0gGT8ytNlxoqDShDtCqDu0r5HcAT0imib2wqXmffwWSSKoJimWAI+IwLf3G9lOWwuvwyj6L2I/IrhEOo02HAQFCdFmIzA//QNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749327555; c=relaxed/simple;
	bh=LqaiD3h73Pusyxp613jVddK06xmzdmcXJ+BxzbrwAAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ikYfjaW7log1Gq78jxavvDsRITqFhVWitFSRxfhKxN8NnQL0BhFgCKkEG+OtVuDH4IdzpdiBMT19dvMnWDvb0Nj+Ae4wxCC4qjgEMpRWUz+b8kE5vMvFuhKYiMAP6v0P+EhkR1m/1HjTmcG0MjVzVu71kDTGcMdFBKFR7WlW7vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+ICdV7y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55791NkL018015
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Jun 2025 20:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+LZCE2lVP4Etx3mj3qZLnJKJ
	eAE2MEJSQmr2c9HqiBU=; b=c+ICdV7yh6lsdtbj/364JpFL8Ly3RcVUVErFbsPD
	hfBKc5I5XvX9XctKDmAnL+BIklvI8WJgPojzot91KDYdMhZyYWkqMdvkYbJ1MxW0
	VKSo/p+VUoBhvgW0np7pM1glaGEAKpmU6oMdmKSVWuKV4/EOIfo3qXBZalaByiLr
	jDmVo15YqOZdISVJSii+y4k6HS1EImIvsXNg31akJH91WyrWYp36hQhB04yeyFTE
	HspwzeIEfAJjTvUvN7JMZiL9qIm1FPLL5Twa6u6TBBIzFk4negcEnM+Eq8gR8x4E
	dTrZ86YtU0r+ozKxqtNuV/NZdrG3+pKFViDxsMNyk/So6Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqc8xcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 20:19:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d38c5c3130so98774385a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 13:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749327552; x=1749932352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+LZCE2lVP4Etx3mj3qZLnJKJeAE2MEJSQmr2c9HqiBU=;
        b=EiY2hDlMmNJ6waZofHnasc4wzUYRVIyPxBmr735ZAsLxGVAQz/yBlmVn1MRY8z8KeW
         TShU4lp4QSJz5lKCT2A0NVSIxCGs7aIGFktfZXqDnpzWsjNmpscqxKI4Ejjy4iG8ZiIc
         0fCKepltMfT0io3bApZs+2VG/uD4swNEu7GAXV0JPfKmkGP6TCo7exCibzF1QRhJOnbt
         5LbBcBK7IkVQRtp2Xh+oHsSWHaQDACGDzV34KoDFKkSuXDkTC3wJm728e53WoO4P50lR
         CLxQY5ys6J2qu3SaT+/M3y2zpYyrRL0vXOuRny2/bZEpcDv6weUQsxO30xEJbSmjvh8e
         whvA==
X-Forwarded-Encrypted: i=1; AJvYcCWy2ekDpJKi+yWxVPH3KmdQHlMPsIt5VHev/Kfk9apXhBY7dS5zwgApBcKpWfdn2BmAgHM76TnoBN5Gogmt@vger.kernel.org
X-Gm-Message-State: AOJu0YwgpLJ2lAfJfGVgJoFTRPup6RhOS4yp3y1ffVWbUfodTJR1n14l
	jCTpahlHp36kfT2mYrx9ZItr/AIa4/lqlPPkhfS3N0DE+hbz0hinQGKk8rxAKqBwuD0+wfX3oJj
	wBC5Se1csLscFZsIdRYXtEWCY54AKGnvo3qd2nvgpPAf2lQStDeg8BRS4rA4mCPqx8cP8
X-Gm-Gg: ASbGncuqV69UMkKwaNpt50ozI383OTxuzhWH0MuAV16shs/oF/LDzdBr3r42nOf1XsM
	pwuWFTJmdqJvL70b/GjMrL0iL+4P9G+SzR/GxZ6ciS3IY82PkfKoPnrLfj3rcdXAMapQaKRpuSH
	wvF4itLeOml8ssboc3/kQydilZtAp9OL3lkAOp05ixl75xEGQV3zSuIn8uP1G70dm6eTi/2EQa2
	13AbOgcx0ju4M448G4U7FP4lm89ljHHdDciJstAcQmUv7K1pO1re16JAqDm9Bm+abd+xtg14ZMg
	LcAyfdBGhGQfEBEXCdZlzKRsE8Rsh37tPWMki2vMu+9sybhaiEVKNqhOmflJW9/zczKk/aEQFlU
	=
X-Received: by 2002:a05:620a:1787:b0:7c5:47c6:b886 with SMTP id af79cd13be357-7d2298ec4bbmr1259268485a.43.1749327551594;
        Sat, 07 Jun 2025 13:19:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+d6uXzqI+QKh9+yYdZeeNWVpfa+xj5aUq7v0Dfdn1I02Yq8fqqA/F3CQ3tC5opeAiWOy/Vw==
X-Received: by 2002:a05:620a:1787:b0:7c5:47c6:b886 with SMTP id af79cd13be357-7d2298ec4bbmr1259265985a.43.1749327551269;
        Sat, 07 Jun 2025 13:19:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b351d0sm5691611fa.41.2025.06.07.13.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 13:19:10 -0700 (PDT)
Date: Sat, 7 Jun 2025 23:19:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: wctrl@proton.me
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH] ARM: dts: qcom: msm8960: use macros for interrupts
Message-ID: <v5jlfknzt2zcadnkokfea6amc4gtowg4intmofdtaj2gzajfo3@4ygrclrtselh>
References: <20250606-msm8960-irq-macros-v1-1-03e573ba26d6@proton.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606-msm8960-irq-macros-v1-1-03e573ba26d6@proton.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDE0OCBTYWx0ZWRfX9sK0ktjBYe2L
 nUBZT7JUEbZ5B+wSkuLauET5pcGh6hvBI4YhiSbtU2s/lj/SB4Pqute2u+EvlgR4xMOAAEUN+yJ
 B5kpD3RNF0a615De6hElOJM5X0ndJl7/daAyp4pl9/7s2vY+EK8KSzhwNimw5lUgdnttx6MawuQ
 fs/zvSyGjBImgPBNk3hGHhh9B7T4g7I479HqSAPiGq7HOVfhCONbomHMN+WrOKyKba1ISungYQy
 hW5qMOX232O1H6MEnWbxwRrqdR4g4bDqyt3MN+u8BEjZzLpMLg3hqFL3nqf75HQ5JEe3509dbET
 +cuK7sY14OqeZC6kWbKR97+RmEEnNoY7lywCCROjOdgP4ruOw7QLy1cb0kW78A92zrLXCf48a4h
 b0xzyylhFGdzAGwu3ObDMqwC79hi72tWHexT0FgV12vuAx1naYRYmg9n2LfqfDL2PVIfT0ej
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=68449ec1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=MzN8uu8svZ0T6_zCNRoA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: mrSOj-XJgFTkFKjRGRqYEtvF5esgnE7S
X-Proofpoint-ORIG-GUID: mrSOj-XJgFTkFKjRGRqYEtvF5esgnE7S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_09,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=555
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506070148

On Fri, Jun 06, 2025 at 02:03:51PM +0300, Max Shevchenko via B4 Relay wrote:
> From: Max Shevchenko <wctrl@proton.me>
> 
> Replace the raw values with macros. No changes to the output
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---
> Replace the raw values with macros. No changes to the output
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

