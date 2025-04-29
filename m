Return-Path: <linux-arm-msm+bounces-56117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD33AA0B54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 14:16:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80E13467823
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 12:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED2A2676FE;
	Tue, 29 Apr 2025 12:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TheRa7my"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42149210F5D
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 12:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745928968; cv=none; b=ei+8aSOp6xW93rXPCq7nRASfL18deHEWWEbXdLElcDpJKH8T/9Yy9QIBKMj1OrjDs02ItI8w+NMM3oVSkzQgN/RAjj7Gpp7VlscMRs+IZoDCTKvBrMW09fca+06k44b26MntQxbfRdNG4wQVL8fyBIS+d229j8yZpPt1GsiiW3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745928968; c=relaxed/simple;
	bh=COQgeNfKJjvwuvOsWE5I+CF+00x3Gj8zrYq55izzgt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qYfcszYLABjTzsCkru6Qims1q3u6Vt/f4HKL5gk5xqcnwTn4JYbgo2Eer3Gl2R7wG4sYneYssTlVlkM8sYdZeyD0GxQi7RYZl2hwOoDEKO7u62wrJ2KGg/2l16lIzQ/C2K6BNdYNRuWIdRg2kCpxvNov3C5cf0bqp47wX2FQE0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TheRa7my; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TA25TP019653
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 12:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n6neZETVNC342qH7kNDFJ+hG
	N9sCBDLkRi5kj+90Mz4=; b=TheRa7my7FVsQXnG9WTVOK/1/f0bFVEaQFpTgwHV
	MKqLclqCxVqMZIPk8S/NSG40+RwsFR6Sx1HdEkn8hhsWj6C7SwY8e4DzFgtffc8Z
	baYT++07plw7XLAhNNlVTpnN8EkzfNLYwNN0qIXhsd//JuPHI8UmulkyUshIppnn
	6WFKMpdPOyH+d3H7riRRUE/tWVrokhSOI3ZjGlw2LZA99ehqfftxO7o6HXyauP2B
	6rkNew9Vkk42c7rAav8CGx0wqvjbaY4lsQOfbiP8s6td7jkBVA0YuX76CLa2/ODC
	VOSi6ainnKow095XNv1QCSLkwIb85LuiwHZiilPYZ3ITkA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468n6jksac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 12:16:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e28d0cc0so977944085a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 05:16:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745928965; x=1746533765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6neZETVNC342qH7kNDFJ+hGN9sCBDLkRi5kj+90Mz4=;
        b=M/M/JSaIwJiuBFiskFvnTqRvzvbbUfTzqDHTcrEDgmjL/PdziJQjFTsYMxy0YBD+Kp
         M+ViUQdB89/LUpuHz7FGhehJuqFKOrsNuJqvrCoQs9rpGKGunWakRHNFOSE+2uGamQ42
         K7hjtzV1yr3M+JxAffb/++/AYO+2SiQxGwDzXj0uRVHy6osKHffL/5yUmxLOiuKR5LpR
         8NVCTnMBM0cGBNairXfbhi/Clyk7il/2TqQRD2WZ7tJHCT+tk1z1PosL02LQrOVtmZlw
         xYAwG1vAKXiMc/nfPuHM5qwBTb54CiJokMeLw67h9A64nwulJkCOofNM4PvPRHL8CErp
         XPqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxij96KXtPOYAC8OoNYdoDqxTM+DHKgFiPCTePix0T7PPLzo1D7hMVXiQk+B7Vl2YiU2uWNzlzBICvEmNB@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6roN7OguQ9UcAIxnYyLO0ym/CzZzpltOrWnPR89CvE5/32miI
	ZFkJ6o1LtmhQhgnKS8eWLiB7J3CUYcDExdeapa/wMc4nfceMqLRobO3EZ7RyA0Y3hZsShl66SBu
	e6sAmzNXfIv6Mrk1s8/oCsPqfdpOCAfsQr5CClpQOnXFKe1ldVDCQYBiqh8t/guo2
X-Gm-Gg: ASbGncsA/2bqtCqyS9JluFZBv6NwJPHfJvE/lWiosMc23kuD08gtbKXNUsm8knf7xBg
	pNUKlvwZzw5ec/ZNl2Dd//9VZ1C/d7SNza42Pj7GIEOoFq7ZDE9TDfvA+I5dYJ4g38MDHnMyBhD
	Ouz2F1YnpL9ySnp6Ly4637aENfjkAccYVnFpufiYPb9wioAbaf3DbvCScaZkdDXVJo++EqkD1i5
	wkVZok1+d4vlHTyDuGfGCa9HoAY8OhXyyMfUm31/DTzjgNheGF1ItpOUDwKT6LoWSRv0hXix4tn
	r5imtjL6dcFjfJEExlWu/NVvoYEeocl8ZCOR4GglDEOekJxo6McJp2lwHGAYW0XC7x7ozUhCnO4
	=
X-Received: by 2002:a05:620a:4104:b0:7c9:5d8f:4d09 with SMTP id af79cd13be357-7cabe60418bmr361510885a.34.1745928964961;
        Tue, 29 Apr 2025 05:16:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEs8uaXttLX5fbQqqhvFbfdQMse8HccybmzieyiB0uxgppwccpl8V+Gy0PEioLWVPPX8E7lww==
X-Received: by 2002:a05:620a:4104:b0:7c9:5d8f:4d09 with SMTP id af79cd13be357-7cabe60418bmr361508285a.34.1745928964607;
        Tue, 29 Apr 2025 05:16:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb8979sm1858087e87.257.2025.04.29.05.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:16:03 -0700 (PDT)
Date: Tue, 29 Apr 2025 15:16:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] drm/msm/dpu: drop TE2 definitions
Message-ID: <iabwfwus4ze3jwekayyfgwhu5bdoerebp3sehisc7rfeic63xh@552zbik6uvmm>
References: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
 <20250301-dpu-fix-catalog-v2-4-498271be8b50@linaro.org>
 <628f3361-6795-4e69-aac2-f9f3200eb6fe@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <628f3361-6795-4e69-aac2-f9f3200eb6fe@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA5MSBTYWx0ZWRfXyNicA5DnZBDf CpIY/IfqXASRcscALIOSjFLz358S5mDZOU95U8Z9oFpEOre8MAVOYQaKxMnC3qlrSDal0khgCId /5b1L4TnjIB/MZxPAkQD/PWZ4yxcxZE7gZ2PgTVYzuN5RVvCZs7da4Jt+onV5CWdfU12r9u09HB
 cBNht5TGMzgrU3KIyVLbHvXRCtlLAPDoyMA3KouYHShCrGgjedL5ncWzBcM9cCvkE3lO2iNqIkG qrNXLlhsIKNbSc0Va1oK1BDP/g2ma8C98Fk4undu1Atfxwaf4FlUpnDQKs5q0prFUVIr/UlObaw hX+o8V0mzUqz3gqJ3GnzpQMVmeu4pnIckg6t4A28CJi9h93mFtRLKBnlHVpjG+E46gODjxb0THu
 kjrJhK5cmnLK+bDnpwk21ub617UQkfmFQZAgZdJOuaa1AmhCCer6rfFQRtWGmc+f/7dIoyjU
X-Proofpoint-GUID: aBJlU3RGDaJNcAG4_jzmJdbpA4UWp2uL
X-Proofpoint-ORIG-GUID: aBJlU3RGDaJNcAG4_jzmJdbpA4UWp2uL
X-Authority-Analysis: v=2.4 cv=C8fpyRP+ c=1 sm=1 tr=0 ts=6810c306 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=0er1AAXFZ9cMRBjTt-wA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290091

On Mon, Apr 28, 2025 at 06:33:05PM -0700, Abhinav Kumar wrote:
> 
> 
> On 3/1/2025 1:24 AM, Dmitry Baryshkov wrote:
> > Neither DPU driver nor vendor SDE driver do not use TE2 definitions
> > (and, in case of SDE driver, never did). Semantics of the TE2 feature
> > bit and .te2 sblk are not completely clear. Drop these bits from the
> > catalog with the possibility of reintroducing them later if we need to
> > support ppsplit.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h |  8 ++++----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h |  8 ++++----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h  |  8 ++++----
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h  |  4 ++--
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  |  8 ++++----
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 17 -----------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          |  6 +-----
> >   7 files changed, 19 insertions(+), 40 deletions(-)
> > 
> 
> <snip>
> 
> > @@ -465,22 +459,11 @@ static const struct dpu_dspp_sub_blks sdm845_dspp_sblk = {
> >   /*************************************************************
> >    * PINGPONG sub blocks config
> >    *************************************************************/
> > -static const struct dpu_pingpong_sub_blks msm8996_pp_sblk_te = {
> > -	.te2 = {.name = "te2", .base = 0x2000, .len = 0x0,
> > -		.version = 0x1},
> > -};
> >   static const struct dpu_pingpong_sub_blks msm8996_pp_sblk = {
> >   	/* No dither block */
> >   };
> > -static const struct dpu_pingpong_sub_blks sdm845_pp_sblk_te = {
> > -	.te2 = {.name = "te2", .base = 0x2000, .len = 0x0,
> > -		.version = 0x1},
> > -	.dither = {.name = "dither", .base = 0x30e0,
> > -		.len = 0x20, .version = 0x10000},
> > -};
> > -
> 
> Agreed about TE2. I do not see even te2 sub-block programming in
> dpu_hw_pingpong but why do we also need to drop dither?

sdm845_pp_sblk has the dither block. If you scroll the original patch,
you'd see PPs being switched to that sblk definition.

> 
> That one is being used in dpu_hw_pp_setup_dither().
> 
> >   static const struct dpu_pingpong_sub_blks sdm845_pp_sblk = {
> >   	.dither = {.name = "dither", .base = 0x30e0,
> >   		.len = 0x20, .version = 0x10000},
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > index 4cea19e1a20380c56ae014f2d33a6884a72e0ca0..07b50e23ee954b96e7e6bd684dc12823f99d630b 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> > @@ -115,7 +115,6 @@ enum {
> >   /**
> >    * PINGPONG sub-blocks
> > - * @DPU_PINGPONG_TE2        Additional tear check block for split pipes
> >    * @DPU_PINGPONG_SPLIT      PP block supports split fifo
> >    * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
> >    * @DPU_PINGPONG_DITHER     Dither blocks
> > @@ -123,8 +122,7 @@ enum {
> >    * @DPU_PINGPONG_MAX
> >    */
> >   enum {
> > -	DPU_PINGPONG_TE2 = 0x1,
> > -	DPU_PINGPONG_SPLIT,
> > +	DPU_PINGPONG_SPLIT = 0x1,
> >   	DPU_PINGPONG_SLAVE,
> >   	DPU_PINGPONG_DITHER,
> >   	DPU_PINGPONG_DSC,
> > @@ -404,8 +402,6 @@ struct dpu_dspp_sub_blks {
> >   };
> >   struct dpu_pingpong_sub_blks {
> > -	struct dpu_pp_blk te;
> > -	struct dpu_pp_blk te2;
> >   	struct dpu_pp_blk dither;
> >   };
> > 
> 

-- 
With best wishes
Dmitry

