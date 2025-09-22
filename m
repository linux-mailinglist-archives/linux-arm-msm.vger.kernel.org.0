Return-Path: <linux-arm-msm+bounces-74483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC4DB93A31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 01:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63FE97A57C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 23:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB242DA775;
	Mon, 22 Sep 2025 23:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RsOPHmQd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CD6286883
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 23:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758585032; cv=none; b=kapvk+YtgkW6JkUb1hGIA0RAQt4g+R3vUnprkEerkgy3czMgeEwFbM9dWbd9qeGK8KfMQA843Dvw7edVZK2ZV5ApYQQUnhf3d4p6bm6EPyCizr0HKfIJXhfaWBHaIwgYkPdMjqF/ZQycxSPvzu17jEW8nNCEE93utpsG3uo3Ejk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758585032; c=relaxed/simple;
	bh=+eQG3Ga4/T2VozUewF1Au5/Jh3XqjTII/FxJPKybY0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nNDLoFAyddNBZXYYHfpPzmoR/w/QxcohqSE6OWA49A/IPFQikQ7J6zEIwCe8ucj1Pkgv/dRzosOosuemchJSSe1lk1G5hugvdYBg9M1fK3MO+kpyW2kMyLg29JQnl+tqDqLWSNHUc6IupIASyWn/vv/c8XVnunB4uulv3VsrmTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RsOPHmQd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58MG4iRM015502
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 23:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=akMAt+oUQPKktf6eCkzkJKDk
	y5jxsD9+xpwyL5NmVEo=; b=RsOPHmQdKbQ3dBaKvEywzLEP+FiPkKnG3iD4rNA4
	OIWMW57/5T42PZ7wMGPXSNSjQ4GRdI9T2kZeIbOas3NxKhb6RhAieuW3NKJKRrs0
	qFa7w0HOMc1f6g6DY8+HKvOVXMxyBYvuhKPhQEzOL5Wrb9Qi1Hb7+JQGpBZpnSO/
	kAri0Q2HXXQkg6F3TRzjQBpFSftZMF4VrnfoXpPdn+w7BRF8ielQCAErj2ZkgPx4
	l088QfuGTuEDub7g1i2pVXsYZp/apHuxYuzWl/9VHYu/09B1HI+X98xOBoUQX4C4
	MmM/JJAZrwTSD9sRYpB22vgcFoXHjlErEtsntgYh77u4Tw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1feetn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 23:50:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-773e990bda0so101607726d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 16:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758585028; x=1759189828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akMAt+oUQPKktf6eCkzkJKDky5jxsD9+xpwyL5NmVEo=;
        b=v/bDDbT9dnPu3Q0OojkqH9AnjuEbwjKiCDAzlDVYSeGkekLz+fQ/AkhX2lju8GqG35
         Py3E9l3pkTXxBbqF6JU9/Klx+wXX6t51ikmupus+PUBBNXKjVJQtRCclKDvnUAM6+niw
         81qoxJV5xy1weJ1640TkbU6zxyz1ruLhbQwY72vmNByhkVJ+Edc15T1XJZQdMM3gzFxt
         vW86HKXPLKEsDHHz52uRAtpQFzArOEUduv4W117sDggY/lgzySwNdVYDEpV3aLli4eFD
         s6shIli7t17bhUe27ZT99AMQhN9AekSNb0DTTYITb898y/KWjFXarlzbktNOxgW8d/7m
         Ln1g==
X-Forwarded-Encrypted: i=1; AJvYcCX4dd1iyXP5PuI3jfsXmUL2v8Y+Ef4h1ZH2aMsqsxqbkj8NZaHM/mxbf/GAN/eybknA/bJT/tg12nk9No4f@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5ZRSXnNWF69osu6ZQIqhDvYWLG94JK6eingX1g3jQkjCxDzTa
	hVdUBqIbhqNFdpSbyOROiwYuF+wtNkPBOQ7Um1qnUnnKscX2RLdmUl7oHdPhfBNz765aoL+yVv4
	r45PMef6ceGS5FJ0vuvk676/jevNut8xLujKx5UcvQP9LhEk2+RJFWHihAO2zGMZb5yWv
X-Gm-Gg: ASbGnctbhg8yZFB5aL6FLuYGBom/vRXkwP6rNsrl5YFpJu74QFrwRtGBx8ecEt9YEsm
	Pl1tuCFKHl7ZOO01Tk1caKRZjnmANyJgWaJF4VIEew9pA/LbOK0Q4Z4Pf7XeSPFFf4JT2m1hogy
	zddPX/19gc3QUyK2NlugHfZFTEi7nYWraCRSy7BEUl+B9nnD9Md2VIv//EI5Meq2+LGBVnsdp4S
	gpY/lYziavkgY8XdFWm+0zosx9TRPSK+bG2GuowBya5tQ1awI0knY3i1SKgsXWEVaPy68YLbFOf
	Rm8wqOvYQ2lS8lAHKg7gYcMdz6rd5JZOumLS+RvOKmCz/HfmhGZ00iH/9t+lBdxvh3O9K5gQ7Tz
	bctdHEJkfzQdwaltEFwzuvPGFB/0EOan/kvEEq50D4dPTieuZI6VE
X-Received: by 2002:a05:6214:1c0c:b0:782:1086:f659 with SMTP id 6a1803df08f44-7e707846c97mr7811366d6.26.1758585028070;
        Mon, 22 Sep 2025 16:50:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8SQsuqffPmbCFgiG+W9BrKws9UQB4tVnyo8wnkCaikEbrcZDprsLMa2pYefWv8Aef414ssQ==
X-Received: by 2002:a05:6214:1c0c:b0:782:1086:f659 with SMTP id 6a1803df08f44-7e707846c97mr7811116d6.26.1758585027602;
        Mon, 22 Sep 2025 16:50:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57b5da082b0sm2121692e87.54.2025.09.22.16.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 16:50:26 -0700 (PDT)
Date: Tue, 23 Sep 2025 02:50:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH] drm/msm/dpu: Don't adjust mode clock if 3d merge is
 supported
Message-ID: <cjoxzwkvzjv7pqelcxcepafanauxjt7p5b3qevjdr5bsomifce@i67l2hzavctj>
References: <20250922-modeclk-fix-v1-1-a9b8faec74f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922-modeclk-fix-v1-1-a9b8faec74f8@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: sFNMKKxBnKFy8yn9nrm6xnuV8Lalu-yK
X-Proofpoint-GUID: sFNMKKxBnKFy8yn9nrm6xnuV8Lalu-yK
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d1e0c5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Gz_hOIZ2IhTx4crym2oA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX2uIE7ZV5gCmE
 fdMBJRYsmKQPl2mIew2Df2cOjFu3CUnYT8M+ZbR0L4D5lOcz7+lrGIuxMsGLllwrwXqRz7/lI6F
 HGpWAUk1hunj3YSEWbGFwBwHdJpTwk5bLvQot92glG80WUNi/esgPv9TAID0Es1l/6n28yJl/lu
 14m6CzUNfGXXwqPjqMFt6vwumwlKWEMy/nCZ+e6+I+2o0ApY6HSZVsMxgd+QNwLR4H5prwZ5Loq
 yhvRgFRjdLUieVo/ZRXT4JJnjwLLqRVcygBIfJiR4Uz3TQIb3qiTqwCNlXXQg2B5h753RQooCyX
 BnsS4CkH8T/6l4QMbQc1gJxvCsW3ANe1f7a7Wu9MHlyNKkfOuk2oTO4bICghZwBpJmNtva2Zj46
 +c73hnh9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_05,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

On Mon, Sep 22, 2025 at 04:32:39PM -0700, Jessica Zhang wrote:
> Since 3D merge allows for higher mode clocks to be supported across
> multiple layer mixers, filter modes based on adjusted mode clocks
> only if 3D merge isn't supported.
> 
> Reported-by: Abel Vesa <abel.vesa@linaro.org>
> Fixes: 62b7d6835288 ("drm/msm/dpu: Filter modes based on adjusted mode clock")
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 4b970a59deaf..5ac51863a189 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1549,7 +1549,8 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
>  	 * The given mode, adjusted for the perf clock factor, should not exceed
>  	 * the max core clock rate
>  	 */
> -	if (dpu_kms->perf.max_core_clk_rate < adjusted_mode_clk * 1000)
> +	if (!dpu_kms->catalog->caps->has_3d_merge &&

Well, not quite. If 3D merge is available, we should allow 2x of the
clock, instead of skipping the check completely. I don't think that we
should allow 8k or 16k just because the platform has 3D Mux.

> +	    dpu_kms->perf.max_core_clk_rate < adjusted_mode_clk * 1000)
>  		return MODE_CLOCK_HIGH;
>  
>  	/*
> 
> ---
> base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
> change-id: 20250922-modeclk-fix-a870375d9960
> 
> Best regards,
> --  
> Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

