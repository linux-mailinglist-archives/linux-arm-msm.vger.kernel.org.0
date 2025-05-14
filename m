Return-Path: <linux-arm-msm+bounces-57969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C249EAB758C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 21:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6D643A291D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 19:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A720634EC;
	Wed, 14 May 2025 19:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D04WyHYH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06348111BF
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250131; cv=none; b=NPpP3O8TE8A/EKG8pAtxIvZAZRVLSYnsKzO7gRgaTjkcapo5ZtRsHx49xFTsUHNBB9wDB8tsYJr1sXFok0gp4zlmABxFdWzkh2sH6Y8UFzjBA1fj35m5/TtPPmrEdbqo1bYGPB2tTAzyEAbUaSZhcPfCLPwu+xErPktc3NV4dHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250131; c=relaxed/simple;
	bh=nAoSvOHPIz+9ILD3J2jNcNVhNO1TrCbTaIS+TjV9/QA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9SiUN0sdmGqoJ0VVvLYghbIkElbKcRFKUk97QLvruqr6AJF/SM8s9m52cVyh+Sgqo6vxkXU9PeMzHl1vk1DVc/5Qau6FsqrP6ZT59Zfpp5APLWi+FErk/5M1NkHrU9/Y9M+F+rFFbnMzPbGUZQs50+RrTMJKigTJiV9yfgH0Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D04WyHYH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuvg9015135
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=toamc2daXxgjaeXdZ8/hVu4d
	twjcBOGn9eztJcSpD8s=; b=D04WyHYH6rOt2gr9pdDx2ne+EyzhnnIrz2RhMmNR
	HWgLozm4McqxnMD+QFxHQmyCmrsa72oMwPPd7FBSluNW2fbYpsHanPNE1eEEdfmS
	dWWIpM4fnGewdI1lwwylUJ6rIVjJSIu8qu/ZoALlu7bT82UqS2SK64AMgqXu0aje
	lcj6rQnpuq5tK/4LDaBhYkQ1g27iX3yvifSV+SMq73d3ci7qWrklmybHCB9XGZrG
	AqrS0GlTl7PGr7+QGLbkNtLupZFiXkGw9LPkoPLu6j2z8Ow6wLxSS8KRHwR30MSe
	4Hgngi0vpQVHG7PCB2zL1X276gCzSZC6S44q+FQyWV9IWQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr3qr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 19:15:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7cabd21579eso12318585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 12:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250128; x=1747854928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=toamc2daXxgjaeXdZ8/hVu4dtwjcBOGn9eztJcSpD8s=;
        b=mbqzXaIJf0WsLHLPTah0gB/IlGkE93uHVBIfZ5Wy20toX9LQagahqUjv4UvTbQf+YG
         7HNLAng8whwPGiM6xpZgN/SMJKsdGlSiOFGccDDONOS0UImux+KjhPyZRBmkOEMEUUn2
         d99eG63QGu4wMvvcvrYCBLgFtXAukK/BqxTbGw0YWitalfPmxTZ0erKSM2pPdPQF2z4J
         xHV3sSR7t3BYsZccUR83qo2Ioe+pZkENdQ7RC3mY5mRq2eClhRFOapJ8v4bMn6nLpq6c
         yrOZ+0w86C2e0/vmA22+1V2B4sVOlfmxT5a067i8ADfsnEl0xjD8HBGSmbUV115N0RLZ
         XYUA==
X-Forwarded-Encrypted: i=1; AJvYcCWzwLFbojvJy6ZsGEYctzpmEwy9lOckKRDPmRO46HlQOY2N1LdRv0QZkU+8cFAKO0ngnY4eNa4gPk2+mO0u@vger.kernel.org
X-Gm-Message-State: AOJu0YwbEqpcM3jVbdjTuvsOB2HB1hlAESxB/+pFQwwzyCkMHFP/eNm2
	q+rajnVHfC4wGvfewvDRs9MSwAm4RiNyOYCMN1IuWQB8SEHwPutB5q/cIPxIiWMLV+RHE8WPpng
	/t9AGu7lptVjuTt2XO1nHpZVribYrXmKcAJdbqmbSxB53+01l5y9C8T6pXXKJ3yMe
X-Gm-Gg: ASbGnctCJNaFxDuXdLnDPjn3isJ62mlzPEnuEYV6dzUB3lIPTvxxAxiXEkTEi3HL+yL
	NWihNeL5ExXKk1kQPiGAheUdp5AsiBlsLvsryFphXaTL+xAdB1vTqlkED6d5/e+OXoP1r31v0KD
	Rk2PZAYBnxso4RjaizuHw4AYkIZ6sAI15fKdhKNsVdPljE2QCxxnR3zllR+fSTUTwffPEihS3O7
	yVddIYnk5Jl5mDnzO0c1LltgNbF2qnViyZSujP8zO9QJP5mNqQbD2E0+H0w8zE/Zlp8ruBGPLEm
	04csvXlEzCoxwDL9KFkSamE0nXmTnDZEjg+ohPiYnqFS9Z0Q7lOQC2pJv91mdmqK0KnIobtxi8s
	=
X-Received: by 2002:a05:620a:f0b:b0:7cc:c07d:e3d4 with SMTP id af79cd13be357-7cd288557b9mr577861985a.35.1747250127866;
        Wed, 14 May 2025 12:15:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAmx0iWZKMm9tkE65sUZ+0KOPm2/eiRcewpi4kWrjcOrS5/n92vEonleB4k+OU4sB6qDStmg==
X-Received: by 2002:a05:620a:f0b:b0:7cc:c07d:e3d4 with SMTP id af79cd13be357-7cd288557b9mr577857285a.35.1747250127440;
        Wed, 14 May 2025 12:15:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c33b7c1bsm20552461fa.35.2025.05.14.12.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 12:15:26 -0700 (PDT)
Date: Wed, 14 May 2025 22:15:25 +0300
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
Subject: Re: [PATCH RFT v2 08/15] drm/msm/a6xx: Replace '2' with BIT(1) in
 level2_swizzling_dis calc
Message-ID: <vnjkfbxyfpeb5nbu6nnasdcbkiviefi7hu7qtpthz4uu6zwnnc@2u6e5j22ozvx>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-8-09ecbc0a05ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-8-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 3khBMHFBuS9tjo4SYMpsuQauSDSrcyi-
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=6824ebd0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=0v1qzFne9LvPmFAOVWMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: 3khBMHFBuS9tjo4SYMpsuQauSDSrcyi-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NSBTYWx0ZWRfX3g2venwTzlBu
 2U61VrExXXtjQ1ajFt4S8CniBvzjgjH9I8kGp985+tlRyc2MX7/JcKKwa2PETL2xT9MPQmPRR/V
 W8k3lIUNc9GBHUa+IBERZp30tf0ejVMmgF3q1U6vIzB2hS6s60xb6U8+d5oRuqbz6kz8vjtjHRi
 BUp6+x1iR1NyYjx6Bfzf77aigK8Qx4J/GIxQLeLnpIKOwPyvA1jseya6fFyWdEOCb/Rso3ZkRnM
 C5ngKxTjYTn4fItNsNh1MtqDZyZI4z4ROaSWZ+CnpH9XkfrYolMc/cU9yaa2g3hbao4jf5ZKQqn
 oxyBtGYuI8k3SDiPNAO45Tv5OWGmy7Df6tI7ldqy4QReuDzDccqzby5QWmfAiPnRU6zZpd29xgJ
 EWQaTUDrpqgkvZaRYizuin4EZ94dcC66i6Y4oNtLScXDrH1lnYYtiXnlsbFshagJfdKsRm8M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=729
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140175

On Wed, May 14, 2025 at 05:10:28PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> ubwc_swizzle is a bitmask. Check for a bit to make it more obvious.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

