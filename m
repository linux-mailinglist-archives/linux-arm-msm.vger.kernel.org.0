Return-Path: <linux-arm-msm+bounces-55726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FA0A9D0F2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 21:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6C0E9A8322
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53329219A63;
	Fri, 25 Apr 2025 19:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EcEM6FEY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2D7216399
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607625; cv=none; b=MPaI3YazK45+LKJ+RIPm6nu768gRJYsSr8VN+UwfvrpZWTsq0T1Ujo8gCGFEhYiyGhqFttQL0b9PG1pP87CE3qFbyTEk5oDkozC0Ja8teqP0K3IHp8PjnH/qoGLopq5flsBLI+EUEFNkXul/SczBmCsJQX3OnFpQboehIdWo+kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607625; c=relaxed/simple;
	bh=8eEeoNBuVrR/ztDvPzSdjZW+Env88fQ2lTVMpmvhASQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gen4NXvt4HkpzAzAV0wrYCq0R6YVYpZDwDWbY7k77076WxH/MgoaROP5/Y0cnrOJDgaKRYLWbro06pOLpHBUu/lbkyOpUP+kJC9BM83TFAR+O6UONEXvWPKyJ03bFcf4C9YQom5MHpfZOemEbmHy9v8kyacZA11QNoeWf34nrVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EcEM6FEY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqim003979
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Kynr/LDxnO/0j5Svx4zTYeWD
	nbMxvk+4kjf7vw9ZD38=; b=EcEM6FEY80+DfBnp4YVx0uTH1I7C6OPuUN7ZxNBA
	1YT2X9/TsEMyD64lUtkGaWlM/+O9u8z9tH4LRi2J0YJGfl7LbDUOG6JWvagwzL4C
	5vbl6FBsYroOz37qdb4KEZl4QwXPKBEjdrJ5net3wxdGWIWgUl4WM5XYTeNd04kg
	za3H4oi//SMeeYVQMJAzSAHVQY7atWWUoZbNOD8bPRM3MMjbmrp6hZu/PO8SC8eq
	/+9Pus2z7vzqsiquXVVav9ry4EXLUpj8IbkAEdabFcerzs9/0AIhql7DC7MpQUcs
	AbaUB7v7LVjd4hx3Ybgmq01ywrB1ljPiCP/Z66la7/ItKw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2a454-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:00:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8feffbe08so67021856d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 12:00:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607621; x=1746212421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kynr/LDxnO/0j5Svx4zTYeWDnbMxvk+4kjf7vw9ZD38=;
        b=kGtPwpRX+tJJT5SyxGJmUpM0CKLShRqvpWpERNI2m+JT+v1QJe53ycbhEkDaAcf++Q
         rqS+cjyRmk/yDdUfv3ChA9B2k7HuQLL1EpbNMFsoWQzylsEo/TLOrl21TIKVHxLM24f/
         2cF+sb2uKh0JBysf4GubdiwrGYjnUpH9y/ukfjJKjdyqt0jWX0gZyDM5nUhbDK0QsEZT
         iueiBaiqiGmzhkTWqCfqmuvq4zw6Csnzv7K0o3+6Ak/uTnWN1NGlWsUIQK/PBpkxXFRJ
         ykKf4Z7WxEXkUwgJgQvFIKWu+LcY40wvpCuyDKqYvLKzgL/Ndex4pfo2Laj72/Ir7Oej
         /PTA==
X-Forwarded-Encrypted: i=1; AJvYcCVOm02fGndiZuEjs0VXwpONtN87DeRR15b5KkgkIeBIRF//UbQz9YIO7vyDnbXm2HOJYDpamIza0UDk7Vxi@vger.kernel.org
X-Gm-Message-State: AOJu0YzKv8ZlzliGORNX4FXUZwpPSd0mOf3ACIoXqDj1iTIuQcw9+7fQ
	ShmTeQ8O5RD7x0NDXswqvA3ULmIiADH3s6mRdbIT57ov09r5yC+0zKejDKC4fFHsP0MiY4z9PI0
	z2LKRl1JHOUQxDCcAdPQ4ykWkUQweNtb1F18pT0/i7i4M543Rk5GxNLdJIiuhmNRj
X-Gm-Gg: ASbGncvWi6nioPMqjvoqgz39UWiWvm09nVkidgvGPKyXegLmyBETPuOfT3JZISn6P3L
	o8KFhFdeJh8/QdOTNw5Lmnm9i+ZilhvAsEmb69YpokDo3pCp41o5Wzb6d8B9pXjomdyzV0AjlpS
	kFB33iua2QPh53qfG8nGIM4QZDcQ8dmyeZnDSfU9EuCkDny+OdezCDt5faD334H6yfs2+p9K1iN
	Aq8MllTrH3yGRYJcjlJRpBehJY3v+N43oTFldt/PYm8i+XcdC2YvtwdvdTMOZTltzpX/zLldwkQ
	UfvV/tVZ5BI7A/0I6ynp1TxOtVqaU5dMNmLZEshX7b6jmW7QoETMA8UtXS1hzrYh59cBvQyRMwU
	=
X-Received: by 2002:a05:6214:1d05:b0:6ed:1158:428b with SMTP id 6a1803df08f44-6f4d1f90d04mr10767716d6.36.1745607608469;
        Fri, 25 Apr 2025 12:00:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFV/zQcAEoUhIcUkNwJorB5dQ/+HT+EzchzBf22nnLbvROjpmuT256JVRjN9I2KxR7k9bllog==
X-Received: by 2002:a05:6214:1d05:b0:6ed:1158:428b with SMTP id 6a1803df08f44-6f4d1f90d04mr10760926d6.36.1745607604984;
        Fri, 25 Apr 2025 12:00:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3a67csm694856e87.80.2025.04.25.12.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:00:04 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:00:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] drm/msm/dpu: enable SmartDMA on SC8280XP
Message-ID: <6kgxzonjqfmup7xvpddlk76w7zcnpf6c6x7isqy6plxk5los5z@hznswxtjoz4r>
References: <20250308-dpu-rework-vig-masks-v1-0-f1b5d101ae0b@linaro.org>
 <20250308-dpu-rework-vig-masks-v1-3-f1b5d101ae0b@linaro.org>
 <aae55674-1ef1-4cf8-b1ef-e2b67c086b77@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aae55674-1ef1-4cf8-b1ef-e2b67c086b77@quicinc.com>
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680bdbc6 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=lXfSKzHXarEsLVuZBnEA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: mzAdWUNnzDUL3_NM2GfLiYVFh5gZBxOC
X-Proofpoint-ORIG-GUID: mzAdWUNnzDUL3_NM2GfLiYVFh5gZBxOC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNSBTYWx0ZWRfX3WBvxmgnK+oc ujJuBomhGS+mnTYI5eawYpLwcQLnCO7Uxi8VjM8aVXZQoF/w7nuzDvCqgfsxQlmNVdAZ6R5WlH6 NQhmFhtqzzcPjEiFLaZ2USqfLIKqAbXvn7zeRnFgsM3M9/1aZ34bA0+TGrTkAGNJzd7wgIp9yPa
 bYOCI3IRnbOUt/VwMmFqphgpC2tRAtI8m5UmZQbRBpVjtxA0biT8YUcM45B1BtIEoXxNMcHPrDS ubh03iotxuKcmLxt61qwrwtqtMnZy2VE0H13LFX02lNVcTm3rX4RloRxrCfYeOJM6qKekfcTIhh NhB68uliOJRCfo5nQOvTU6bv84Xn+MIeK3OrRGDQFzu38OF3zHoH+Vu1yHdQpDwYI13LtOmXvCb
 JmvGTWCR8ZbgJdP0eyUBkky2SQuIjrjGaAT90Bv8H/pRGLOENN5ig6J/iyua/ysIAGu4m84J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250135

On Fri, Apr 25, 2025 at 11:34:18AM -0700, Jessica Zhang wrote:
> 
> 
> On 3/7/2025 9:38 PM, Dmitry Baryshkov wrote:
> > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > 
> > In order to support more versatile configuration of the display pipes on
> > SC8280XP, enable SmartDMA for this platform.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Hi Dmitry,
> 
> Seems like Abhinav's signed-off-by is missing for the patches that list him
> as author.
> 

Good point. I don't remember, why these patches mark him as an author,
but lack SoB. Googling doesn't point out any previous patches. I think
the easiest way to fix the issue would be for Abhinav to respond with
the SoB. Another option would be for me to reset the author.

> Thanks,
> 
> Jessica Zhang
> 
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 16 ++++++++--------
> >   1 file changed, 8 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> > index fcee1c3665f88a9defca4fec38dd76d56c97297e..923afc202f5195fa15bcfc1e141fc44134c965e4 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> > @@ -74,7 +74,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> >   	{
> >   		.name = "sspp_0", .id = SSPP_VIG0,
> >   		.base = 0x4000, .len = 0x2ac,
> > -		.features = VIG_SDM845_MASK,
> > +		.features = VIG_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_vig_sblk_qseed3_3_0,
> >   		.xin_id = 0,
> >   		.type = SSPP_TYPE_VIG,
> > @@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> >   	}, {
> >   		.name = "sspp_1", .id = SSPP_VIG1,
> >   		.base = 0x6000, .len = 0x2ac,
> > -		.features = VIG_SDM845_MASK,
> > +		.features = VIG_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_vig_sblk_qseed3_3_0,
> >   		.xin_id = 4,
> >   		.type = SSPP_TYPE_VIG,
> > @@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> >   	}, {
> >   		.name = "sspp_2", .id = SSPP_VIG2,
> >   		.base = 0x8000, .len = 0x2ac,
> > -		.features = VIG_SDM845_MASK,
> > +		.features = VIG_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_vig_sblk_qseed3_3_0,
> >   		.xin_id = 8,
> >   		.type = SSPP_TYPE_VIG,
> > @@ -98,7 +98,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> >   	}, {
> >   		.name = "sspp_3", .id = SSPP_VIG3,
> >   		.base = 0xa000, .len = 0x2ac,
> > -		.features = VIG_SDM845_MASK,
> > +		.features = VIG_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_vig_sblk_qseed3_3_0,
> >   		.xin_id = 12,
> >   		.type = SSPP_TYPE_VIG,
> > @@ -106,7 +106,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> >   	}, {
> >   		.name = "sspp_8", .id = SSPP_DMA0,
> >   		.base = 0x24000, .len = 0x2ac,
> > -		.features = DMA_SDM845_MASK,
> > +		.features = DMA_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_dma_sblk,
> >   		.xin_id = 1,
> >   		.type = SSPP_TYPE_DMA,
> > @@ -114,7 +114,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> >   	}, {
> >   		.name = "sspp_9", .id = SSPP_DMA1,
> >   		.base = 0x26000, .len = 0x2ac,
> > -		.features = DMA_SDM845_MASK,
> > +		.features = DMA_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_dma_sblk,
> >   		.xin_id = 5,
> >   		.type = SSPP_TYPE_DMA,
> > @@ -122,7 +122,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> >   	}, {
> >   		.name = "sspp_10", .id = SSPP_DMA2,
> >   		.base = 0x28000, .len = 0x2ac,
> > -		.features = DMA_CURSOR_SDM845_MASK,
> > +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_dma_sblk,
> >   		.xin_id = 9,
> >   		.type = SSPP_TYPE_DMA,
> > @@ -130,7 +130,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> >   	}, {
> >   		.name = "sspp_11", .id = SSPP_DMA3,
> >   		.base = 0x2a000, .len = 0x2ac,
> > -		.features = DMA_CURSOR_SDM845_MASK,
> > +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_dma_sblk,
> >   		.xin_id = 13,
> >   		.type = SSPP_TYPE_DMA,
> > 
> 

-- 
With best wishes
Dmitry

