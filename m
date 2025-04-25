Return-Path: <linux-arm-msm+bounces-55725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56232A9D0DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 20:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C03663AD405
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 18:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7BF31BD9D0;
	Fri, 25 Apr 2025 18:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ccly0v2N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6B42153D5
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 18:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607204; cv=none; b=qEL/3EUSmF0HcdOQDN7UUhIBzF4vssrJjbEUjpH7EBb0v9rcKE/zjFbAgVp7XZ/OklmCQVw8RFy2GoS/5BImyPfBr5BrCvg83iLfuGQs3CMFlgi2Y/XcG9UXJ/i2Ixg+CThh7QsxN6y7QxBZE5JeVx5Y41TzyI/Q2mR45dwkvJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607204; c=relaxed/simple;
	bh=m8U+SaJlJqAcQf4j9rulo89S9cGvVWfX8qZgOZMg1n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lUmvgLFqPcaVjTunmz55wAsLkpoNq7JSsKwqBnW47zPgrUo62DfLC/7NL6434fAg41zUraBXUJt4i5mencte5wAC7crnDlUTshKt52HHIBuGyXNMqhhRhAVSNS2DPuCjVGL2VBTZHZOdyhcwFnzMZK3nUBrTEpYz5Kk50MohzQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ccly0v2N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJrco004021
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 18:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EyI1RYrs4XXWK6Jk0wNG+VY0
	wHQ7kc01RAG4sha1MzY=; b=ccly0v2NJWjBD/RWATeomyvHcfgv2NaRvB99ZMGJ
	Oo24ULU1DzVtNt0YzDnlZN2U7vD2b6/y4zJ7QPS4qHl2Hv3mbL4AtGebIEuBmTWT
	mzxz61C0CPyx0SgzVNPjXDSzL8+cJytICNAA97YlShxCGt5QWkeugqJFf+GDaz9F
	bqXCfPMw9uaktthG38TBXppReKEX/lxueCaWhIayEvIVPesUdzPLCcUAhQeopy6H
	66O2NhkauzuI8TI8ko7HiP22/KUW468Klp+z3nGXHoHAhIVkuFcdayLhVzsbJLou
	n7/8+rGttxuO6pCewEgBhJM1ipURX2WNVLS1jNjZPNNgzg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2a3ps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 18:53:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5d608e703so469976085a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 11:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607201; x=1746212001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EyI1RYrs4XXWK6Jk0wNG+VY0wHQ7kc01RAG4sha1MzY=;
        b=hAE09kK9pGy9EYOHsWc+srlhmd8aZcWcNZeyGlAbzl/daC/A+km5kN0D8PY20yOS9D
         k+x9kZPKRNhsN+K7ZHUkIjE3LrHkUU2/hb+dXNetZs47NJJM72GJjmXCjupZHDBoZ9na
         WxQgRbmG0axW5gUaa3jvkLGHNcu6kE0r+8SSvnU2pONtqLCPTijjHS813bJuQnXdhhiO
         f7q+LQ2UKQWM9C8bZ3JLdSvT+VhwkfblKuUewwh4eZpT3krQ0HqlJs3Tpo9FMIZV9m5m
         RTsFdLb30YEPQBFwCnBbgyippDzOPKxB6ahEVTvOyyGVKiWkBdwWbC263Btco56umCFQ
         ZA8A==
X-Forwarded-Encrypted: i=1; AJvYcCVxPqwPHpot5HHwRT3lC8XUYtCb5tIgbn+s7V8rjsYLyqx1znF5+h4NgROwWsZ4kQAoyoSJPxpBA807kcBh@vger.kernel.org
X-Gm-Message-State: AOJu0YzWXKBQ0T9WT0CQqzmy7B+AoO6FEZD6UVelGJgK/SBDGpdnOm2+
	a6eXz+i4cfQEPqrCUzTzg2I1R46fh+oAFi+siDMHgKkRCJjA5GZQ0I4rb7/EZUWKEHT5tT+9IV7
	tu952VprNWESGkCq6V3+dSwzDgNCYAqL/MRCG1/3RJY9Ges9LD436+/Iz4wB9+aE/
X-Gm-Gg: ASbGncumJQaNa+PmXzYocldsE8bF+E9BL+iLXm/CveHzsRdgomt1Dp3r3xgDoRg04II
	5H6GT0vHtq2xs4GQewm9y+bvoZf/4nxnDjh9dawLIZTJF+XJjVFhDASWecdbmYP8HKH3PZ/Ek8l
	sWcNToYhDC+7sjf6gm926l/Id0Sxgr3VXgjOJ/I8wcVpozxlrE1biHHIHIh0L6FELq/ojQLWzru
	dB6R0RnrgIE/1bNRy8VDPa9W8rO7lXv0TpCJzmcuR/Vmbf4KB1774uZXEIYbr9mXNOiJ902IwnD
	quAHKegZC/40i9kJkNDMa+n+4S+x6eeBvdyED4QtDY2vVkh2He6KcKvTd/IkYP5/2Lf0zD6keCU
	=
X-Received: by 2002:a05:620a:414e:b0:7c5:5e9f:eb30 with SMTP id af79cd13be357-7c96687307fmr83995785a.15.1745607201024;
        Fri, 25 Apr 2025 11:53:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzpHwv43BxegR84WM3cKeKkomXnTuNqjngSJPB2sfsV1ntCPBMFR2CHLVVFpG3qFUcYD6E9g==
X-Received: by 2002:a05:620a:414e:b0:7c5:5e9f:eb30 with SMTP id af79cd13be357-7c96687307fmr83991685a.15.1745607200558;
        Fri, 25 Apr 2025 11:53:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb8cabsm690134e87.258.2025.04.25.11.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 11:53:19 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:53:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] drm/msm/dpu: enable SmartDMA on SM8150
Message-ID: <c62wafi73jwdf7qz5a7gp3xqhqg27aifn5ollr7dmufeaeyldr@rbzbtpbfenkc>
References: <20250308-dpu-rework-vig-masks-v1-0-f1b5d101ae0b@linaro.org>
 <20250308-dpu-rework-vig-masks-v1-1-f1b5d101ae0b@linaro.org>
 <bf242898-bf47-4235-9086-745bd4f05acf@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf242898-bf47-4235-9086-745bd4f05acf@quicinc.com>
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=680bda22 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=jGqEa9bayqSivQyTaeQA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Y_bqoKOvjSc_RAVyXpyKXA0tBSSYTtK0
X-Proofpoint-ORIG-GUID: Y_bqoKOvjSc_RAVyXpyKXA0tBSSYTtK0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNCBTYWx0ZWRfX9Mj6VzLz3LPC urJcWuGO58bgnYEGwd+sSSLmSx6JyiJxonb5ViohX08/E0k7yFbC87Ne/MCOFHGl1sI9i8lXiZP W79XABRn4yg3n29OJuOYUptpb8YlvGdHz7pSU932ERkrLr/b2lc2ong0FVlQ3FMB5er5BRipMOZ
 8yB1QbuhEJtiodQB08R3B2Av/0vaqd9hKP2QdLObNW86xtN5H0ueOyC+u5F9x6v0zGCKOqTdGhV KaaCtronH/YDOEe3uqRggc65Y0sXct5RVMfnt6Typ7FMQqUx6WTJBbvTMO2MpM+Xqq4VGjMpZYE rkWuLQgyzfi2x+dhuJ1oL7R6uJL1kSWJTk0gprULZ4CEqPWGdN6vOTB5aCWXL4QzQwt/Ihr6slR
 u1JItFFDLwBv1iWbnmqEcdAZXEIyLsgYNUPNo1h5qHrEuSBUbICmBKB2QXzUOZj8pPRD9odB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250134

On Fri, Apr 25, 2025 at 11:26:20AM -0700, Jessica Zhang wrote:
> 
> 
> On 3/7/2025 9:38 PM, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Reworking of the catalog dropped the SmartDMA feature bit on the SM8150
> > platform. Renable SmartDMA support on this SoC.
> > 
> > Fixes: 460c410f02e4 ("drm/msm/dpu: duplicate sdm845 catalog entries")
> 
> Hi Dmitry,
> 
> The code LGTM, but was just wondering why there's a fixes tag for the first
> two patches but not for the other catalog changes.
> 
> Is there some context I'm missing with regards to this?

As I wrote in the commit message, SmartDMA for these two platforms was
enabled previously, but then it got disabled by the mistake in the
commit 460c410f02e4 ("drm/msm/dpu: duplicate sdm845 catalog entries").
For the rest of the platforms SmartDMA supoprt was never enabled, so
no need for Fixes tags.

> 
> Thanks,
> 
> Jessica Zhang
> 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 16 ++++++++--------
> >   1 file changed, 8 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > index 23188290001ffb45563a9953a9f710bacb4dac89..fe4de5b31644de33b77a882fa21a18f48ecd1790 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> > @@ -76,7 +76,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	{
> >   		.name = "sspp_0", .id = SSPP_VIG0,
> >   		.base = 0x4000, .len = 0x1f0,
> > -		.features = VIG_SDM845_MASK,
> > +		.features = VIG_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_vig_sblk_qseed3_1_4,
> >   		.xin_id = 0,
> >   		.type = SSPP_TYPE_VIG,
> > @@ -84,7 +84,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	}, {
> >   		.name = "sspp_1", .id = SSPP_VIG1,
> >   		.base = 0x6000, .len = 0x1f0,
> > -		.features = VIG_SDM845_MASK,
> > +		.features = VIG_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_vig_sblk_qseed3_1_4,
> >   		.xin_id = 4,
> >   		.type = SSPP_TYPE_VIG,
> > @@ -92,7 +92,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	}, {
> >   		.name = "sspp_2", .id = SSPP_VIG2,
> >   		.base = 0x8000, .len = 0x1f0,
> > -		.features = VIG_SDM845_MASK,
> > +		.features = VIG_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_vig_sblk_qseed3_1_4,
> >   		.xin_id = 8,
> >   		.type = SSPP_TYPE_VIG,
> > @@ -100,7 +100,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	}, {
> >   		.name = "sspp_3", .id = SSPP_VIG3,
> >   		.base = 0xa000, .len = 0x1f0,
> > -		.features = VIG_SDM845_MASK,
> > +		.features = VIG_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_vig_sblk_qseed3_1_4,
> >   		.xin_id = 12,
> >   		.type = SSPP_TYPE_VIG,
> > @@ -108,7 +108,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	}, {
> >   		.name = "sspp_8", .id = SSPP_DMA0,
> >   		.base = 0x24000, .len = 0x1f0,
> > -		.features = DMA_SDM845_MASK,
> > +		.features = DMA_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_dma_sblk,
> >   		.xin_id = 1,
> >   		.type = SSPP_TYPE_DMA,
> > @@ -116,7 +116,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	}, {
> >   		.name = "sspp_9", .id = SSPP_DMA1,
> >   		.base = 0x26000, .len = 0x1f0,
> > -		.features = DMA_SDM845_MASK,
> > +		.features = DMA_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_dma_sblk,
> >   		.xin_id = 5,
> >   		.type = SSPP_TYPE_DMA,
> > @@ -124,7 +124,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	}, {
> >   		.name = "sspp_10", .id = SSPP_DMA2,
> >   		.base = 0x28000, .len = 0x1f0,
> > -		.features = DMA_CURSOR_SDM845_MASK,
> > +		.features = DMA_CURSOR_SDM845_MASK_SDMA,
> >   		.sblk = &dpu_dma_sblk,
> >   		.xin_id = 9,
> >   		.type = SSPP_TYPE_DMA,
> > @@ -132,7 +132,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
> >   	}, {
> >   		.name = "sspp_11", .id = SSPP_DMA3,
> >   		.base = 0x2a000, .len = 0x1f0,
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

