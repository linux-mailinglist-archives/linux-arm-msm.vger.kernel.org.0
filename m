Return-Path: <linux-arm-msm+bounces-55352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 064C9A9A8CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F7E6925CE1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F111B221FC2;
	Thu, 24 Apr 2025 09:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L20d0vEn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7095F221267
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487589; cv=none; b=FQhu87NusSlqZsjxngnscPqzJOGy41aku+i+y2LbXNl8GKvdsrHp3a83z7+zP1ow4R9rNfSad4u2dHIwx3TVzyklhGI8jBjk3cBlUeZOduuhmxXK+D9duLnbeHDLHevs1HO6zBEb/fmewKyu7Lt5a5O/U5A56scchakrZjUDLy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487589; c=relaxed/simple;
	bh=uLu5qq+fu6nJOObQPQvzr891FiZ0IVNq6dpcmUuw9EE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q5tQRFig5wSkBxQ9SUNGasvCV3qtsbUlqREbWD3u/th2+BkL4qoBbXiqPztS+tHs/jsYAd2GR7XVLyEUwoEuUlDaNUzk1vRp8k/WGjkEhwpgfuyFH5Fc5SUvtl+Qvbs2AD8aT0iY1iDpwszcxyTiwUdQKIgLwG88uePETBi5GVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L20d0vEn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0GlKs019260
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4dGjO56yZ5rnlYsrCbSawbQj
	IoRYwOqdiOvRK7aRuDw=; b=L20d0vEn2+o/Mnh5N8rHWG+UItlv3JpyyEfm3y5y
	L5NTKIamb1n0+cI1PM6aPf1kpqx+p5BsI007OV/mAyj2ITqZ0BMP71qCMEQ3C6En
	V99lBkho+oJ1v0pw2rbpXCjiPNL4WP/ChzZGyyWmc8jXyl7xX04yLUz8ugdnee28
	W+8RYTUeMeqeKemcceYT9eAxUQQPN9kpNRLM3ZWgfysOWQjDoOfY1Nt7kb4iuzNS
	ZuUDFQCWPHTcrtFq6/7eWYZv2Qu8yvDu26VmxYVI63Y2QhDwikInXLVrZNfe32t/
	/F46b1emKn/0xgBJXOYiX27VfPn8cXXOuISwlts4wFdm4A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1504s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:39:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5d608e703so153439385a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 02:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487586; x=1746092386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dGjO56yZ5rnlYsrCbSawbQjIoRYwOqdiOvRK7aRuDw=;
        b=UdKSkav0kG+pYQ+zpLncRIpwWos1qLx/SrmlZnW4c3cr1BAVaal60PxDTKc8cy/hO9
         4wmDaiDQlm9MinnbalI70mTdPaKTYjLrFvouyMia5kGcjCeVyP9pF1ZeB0RrdyEAFDMD
         K8Yr7fXhjArKk4L4dZsPymbWTbg4rmUvtslYLDJDKNOa+GVD/vpYoQWibLW+T49lVP3T
         lKg/SZ+05fF6T0Z3v24dpR793q4TmXtnYzb/Hj9k9aPYvZ+U28Qkoxl/HNbsULCN8tQ8
         KAaGg3nU042JSsn+mXewnNELH4Hzki1VJnrCcDEmQyKT27rjJhzFUmZOPSbNzGRsBRMB
         nLhw==
X-Forwarded-Encrypted: i=1; AJvYcCWP+EUMEPIzHTf0lP54AwZ2DpMq5qP+0ZkOotBl1qZIqblPbxtPZwbZHTrll10scqsmqs+ZlQTPZC2qBSwz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1Lqbbwp7k8gWkpKPHX5q3PZsyfvy4RAV0HobIQgZeQ1SnJd9n
	26Bctuf8apvbanCMID6ghr1nl0LnVtbwCe3s+aMea0L8aTTCk6jijlquGRAAi0GMnfuJ9xI/awO
	QMYXyK3z07iPJVwydQi+RMIf5+HCwzsdHc/dydTXKjAh2NOgfQLaK1PPgTwrjh4Qb
X-Gm-Gg: ASbGnctMLhm+cOhR37kGk7Mf5Bqz7pjHijYRdUM0mFgX2LT+RUp1axy+bMCS1H8El0C
	5NbfefV1rz1HWfGrhWjrqjZkYT3dg3QsgzHmKhudPnH3zqUNtDYZS8MR8bHUoHSpq+CIEFBlDot
	y2dewpz1fpdPO0cBuQSUJUfSSRLcNJci7KD7wdc6xdijxiOQpesu2VNQb0ZT42umYOZoxhnGVKG
	6YW/MJgLBuBvwBoyTd7uebZqR+hRJ0Lz3ReBTDLAr6kBg4W8k7BcgDhdhncziQW8kvmpoIWpuzV
	XwwYmVZI7SO9Vc/Nbp0O3HrkMF5WEl8JynkRwkoXjBExVFZiw9rc63BOUcazMIc+jviF2F3uZ0o
	=
X-Received: by 2002:a05:620a:438e:b0:7c5:53ab:a74c with SMTP id af79cd13be357-7c956e7a968mr299385985a.10.1745487586727;
        Thu, 24 Apr 2025 02:39:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8jnKxL7E7dGye9CmktSI0DSfoKsAN0FjpOYzJxhooQSxBRnV8KWWUfkIDlgbYRG+Pw0Rmdw==
X-Received: by 2002:a05:620a:438e:b0:7c5:53ab:a74c with SMTP id af79cd13be357-7c956e7a968mr299383785a.10.1745487586416;
        Thu, 24 Apr 2025 02:39:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb7f1asm169674e87.237.2025.04.24.02.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:39:45 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:39:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: Fix PINGROUP defination for sm8750
Message-ID: <r542y5lcoymvykl5fdayjocvysrvzli6xlhcqjrwlpszucmaoa@ewwbbpynggnl>
References: <20250424-pinctrl_sm8750-v1-1-b070790ccbce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424-pinctrl_sm8750-v1-1-b070790ccbce@oss.qualcomm.com>
X-Proofpoint-GUID: AY0DCWTWFRwP40M1W7588GJRllNzUfMB
X-Authority-Analysis: v=2.4 cv=OY6YDgTY c=1 sm=1 tr=0 ts=680a06e3 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=hy4lFNwNYWihUDc_pIEA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: AY0DCWTWFRwP40M1W7588GJRllNzUfMB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX4Es25UrSMUOr j+wnnrh7acnliepxXC8pLgmnCWP/SWjhuikLEUuZlPIvbeW0nRQSjg/LQdWaOxy7wBOJF/WAGK9 yHwsp+0lAIguftgGJj3vDfgW9N3xq9Vtb9kGBO9HZ+Jghv/J85ulrM8IHd6UCMtv2dRhdSoAIGB
 iFTF61Xi/0Vsuo7k8x/xBYY0Skg3zdlqZMwhHe9mYENHwJUNxj2vrcZubti0of3scnjsX0Oicpb awk5tKMlOZQXlLF0RJCcmNotEci1kwCs/IIbiXZx5Fivg2DN1mv5PUW9jW6Xrmf1N/MNqc8UfRV LPMPikgL/2n5MBjw8iP9zqQVAMaG/1nu1Ock2a92DxU26Cuy0IgVDwgQ+3YpaSaplMG1YgvL9I5
 5DyR2UYGI2pOw/1N0vDIqFseJYpdRyEOgUD5/gRVt5Ht36YTOzQCshQmM8lESU1xESiJvNuJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=628 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

On Thu, Apr 24, 2025 at 10:17:10AM +0530, Maulik Shah wrote:
> On newer SoCs intr_target_bit position is at 8 instead of 5. Fix it.
> 
> Also add missing intr_wakeup_present_bit and intr_wakeup_enable_bit which
> enables forwarding of GPIO interrupts to parent PDC interrupt controller.
> 
> Fixes: afe9803e3b82 ("pinctrl: qcom: Add sm8750 pinctrl driver")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-sm8750.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

