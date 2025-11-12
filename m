Return-Path: <linux-arm-msm+bounces-81328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 297F6C50688
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 04:11:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E80C1890E3C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 03:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50BBB2D321A;
	Wed, 12 Nov 2025 03:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q4DgKhqr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="an+HWy3U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094FA2D0C70
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 03:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762917071; cv=none; b=aayllmhxh6cP0jc7FWi8l3qsjz/k3mrFMFm3ebp4G0Qlkxxy1q/PCxTFx0X6erikPwWkRoVwTk31gCqdIM+sNnhzoMknE2qAoy44Ywl8WUSNVbKmlGAb+2qu8XCUN1Brw+L5MRiZK4MMJAbZCO3lzBAByw/nnhs54NLlXhu9VEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762917071; c=relaxed/simple;
	bh=AV0Z2T9JPirL6wq3Vadyyil08SHO4pnprBGlFCMpNMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Up8sYT1yuBfU1EqjsRjx+R1TWtkmnIDFyMcbyYTn8ztvWP/oWTvpZN3pUPVHND25M3SogKHb24JyoAXvsyjvE4xRxps0HZ4+oKAxnLWABCwRcqOzu04eG3xRlnA+sdvG57KYyqugVNybIxTESoLfOuwJOw6lsob+E5HHUgYW9Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q4DgKhqr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=an+HWy3U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ABLm4Rf3503482
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 03:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=00ACHchLfutlq+B8BDOIqE1L
	m9BQZ2lNkQP02UwVyvw=; b=Q4DgKhqrcjY5+51/DkQlwsuO2iP0rzo3aC4ps3LT
	CMSJ4TIhtz+ILDjF3JCFSbUOsN1STRSYsyvCgstcaf4QiqulRAx0GjK31ROtuvrp
	ZM1K3SEmoMidZJmaaYq0SNhpvIrKM3qqs2WqoMJc7Opzky14Xms5kW6S/c9MfpAh
	iREiw0FatuVYUU358i6X2XXWI5yl1VS05eaKzQWvJRYlEra2myykslWFbZKJK9TK
	fALm9vHfTpF/LOQm0pO/bHpsRq8fqjrrrtkeeSSfMVPxuGgAiZ2S5dqnvbXAm1S3
	m8OiRLPl52Yk1Z5Xq2RIC+Q58wg/sZDkbNWYtCXrm2dkEA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acdcc0pm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 03:11:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed6ff3de05so11312301cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 19:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762917062; x=1763521862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=00ACHchLfutlq+B8BDOIqE1Lm9BQZ2lNkQP02UwVyvw=;
        b=an+HWy3UGxOW50NNuN/EvwRRksq8jaQTpzyRYYTcbu5Jc/3obtrfc0IXZcZkXpVzft
         C/V3qjlPWJQvHuDwS4+OsD7QqBI//5wnZSil6u51TzpvuMpl4+8evJdRb/I+HV5Rfs2u
         EMODGYrHnJFotpk/62nxFiMQ1DF6QXbXK5U5MQQRy294TBx4NbmIAprTm2cWmCMO4mDE
         DU5f3UApIWRvNAHD3PWD2IWwz7xGhjyM4iSWWExf+4w5W9GDtNPFbCro2NmfgSblCpug
         o3RIhw5uM7MFIU7ScL0Fcf2BrZAL+cr+p4ffbNXinWHBKNTmG4PwQy5HfedKRQyghEtG
         hfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762917062; x=1763521862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=00ACHchLfutlq+B8BDOIqE1Lm9BQZ2lNkQP02UwVyvw=;
        b=A8+24zSQQsEjO6daTg0K96Jj7DI4EcP76SqfM1rEJd2nP2AWOzuYzIeoC78fIIuYP6
         Mh2BgLG9W3/fMkubkNVU9kXLHMEDmgATwqVcHcyvbk1icdP8BGZFAZdUBkAzbLqMyS6x
         EP9gEKyiChroMnZjSeoZ8VU/nNwxk0YKqi60SeHSPI0VhfzxHmyaqjPuwE8sPnPo+ZIw
         0HTXCt1i9uW/yhQVAbQFsKBO64Rr8Jgvobt1V5Q2uUVE5/3i4Iy0ohbYjqN/7svlTj9v
         b8x0uYU22Qr8nOB5ykvfIkNP7+LQ8Ur4E5hbuCVILObUmPtpSHgYOoHSROKZcmSQBeAD
         h5Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVPWIz5Wb1zS/CxLysH17yPb/mDY8+qSg8msAzZYB9hxaPrRZoL5nNgqwVQQn1HGBiHNrWTboij7S672/lk@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi1zGokKqYrj0yTGupf6Ym9JQbucy7ryiXxEfThqLlfXYDG15/
	z2DSylRqKKhQWosZZyDlA3/A1Mdz1rC7tvzY2oOFkwKRFKUrpC0TnPoS/F4mULM4f12DgL3oXke
	OMw/3fPHs7IDViVoTl0KNIT2NjlO7UdL9SYdDkZKj2rMShCIiHcweNnfoJhsrQJo3M7gf
X-Gm-Gg: ASbGncsroMZxZa9DgGKaMC7sAe8gjQ7GT6EkNXwkgCIvFdCr9oIpW6khxazb9TrYTRw
	LUCWvuRsKzhAi8/E80GZs4nT8tw8fPFxXrBhwLqgvIlYHmS/VDSoQnlIgRTfXVkclgji7xUAJqX
	eRCowSyRBzUYfJtCk34HI4ogucxc5t9yoW0Lk/Qw/jOGiiJaPZkTt3GYvI8noGrb3r1CaNcHj86
	1W3B2CF1tqlA3Fov9RM+pBydeZaT7sjwjMJjbq0eWQghM5HjkrTN8MI4yhBGiQWin5RkjS6kdb/
	7bRyUUlwivDZn+9o9ivVqaVymyobQFS8QHfoWbccB9oGGeU2MbWbnB0fx+l3cNPS5K8wzXBPbb+
	amnxKkEeLFnUYqcTub4kL3HHppSP+J9fpLGq+Lgivp8F2iws7maEW1wHtNJCBkR0maIISLgFV7G
	YlUigAsq4+aDrU
X-Received: by 2002:a05:622a:164a:b0:4ec:f035:d60 with SMTP id d75a77b69052e-4eddbc94284mr22754201cf.5.1762917061947;
        Tue, 11 Nov 2025 19:11:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHnOBMPhkPCNfg5ipaCCLNaPK7WC6Q06oJen91Q3TPaT/TxRDl+cFPsN144s3cBJGkhCwOVjA==
X-Received: by 2002:a05:622a:164a:b0:4ec:f035:d60 with SMTP id d75a77b69052e-4eddbc94284mr22753961cf.5.1762917061417;
        Tue, 11 Nov 2025 19:11:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a0b77aasm5397404e87.69.2025.11.11.19.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 19:11:00 -0800 (PST)
Date: Wed, 12 Nov 2025 05:10:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 3/3] dmaengine: qcom: bam_dma: convert tasklet to a
 workqueue
Message-ID: <oipix2ljawizmc4yhortgquua7jxtss5bj7y4mqln6o6ppipc6@khk4u2yymyay>
References: <20251106-qcom-bam-dma-refactor-v1-0-0e2baaf3d81a@linaro.org>
 <20251106-qcom-bam-dma-refactor-v1-3-0e2baaf3d81a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-qcom-bam-dma-refactor-v1-3-0e2baaf3d81a@linaro.org>
X-Proofpoint-GUID: pniV516inGt5xBfbGrXlKOXflu4msWNI
X-Proofpoint-ORIG-GUID: pniV516inGt5xBfbGrXlKOXflu4msWNI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDAyMiBTYWx0ZWRfXxcV+rCtPJbVJ
 J0SnUMiki4IKTmLksyUlKGJkrADSIg2shYvEISlsFlAKCbewcU3PCvAiVcsdh1ijicMCu/wnU6Q
 /b8t/8V0TpUo0Fp3G215jUuGj9nPBvncIve08NE/QWSB0gXjbmzK/JH/Likzl5SWMCb9ucwMA2r
 se7mQkFC+ciSDG2QhYGmT8jboohVgMs76dfVXrii603jS+JFO7u3oHMQQnwShGq5ML2ofYJmGYw
 nm0q5lERBz0w55tN6ZUlM4YAm+T3QO5OX5TT7u9EyOajW73a4s4RGy8fy5fPZ/dGWrpKpnSI0qi
 No6JOtxFxVWqKpg/qFsMLNWtFSWr926+fFp3nms1iIFF9VB2ClQs5iKfl4rWTpGaizRGYL/RVG3
 RAHcI/vCihf0wj6KJUviGb9L7cuo1w==
X-Authority-Analysis: v=2.4 cv=L/0QguT8 c=1 sm=1 tr=0 ts=6913fac7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=_VgC3mAVlmbt8rz3gmwA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_01,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120022

On Thu, Nov 06, 2025 at 04:44:52PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> There is nothing in the interrupt handling that requires us to run in
> atomic context so convert the tasklet to a workqueue.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/dma/qcom/bam_dma.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

