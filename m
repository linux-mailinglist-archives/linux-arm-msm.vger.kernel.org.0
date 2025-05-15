Return-Path: <linux-arm-msm+bounces-58021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B9CAB7A82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 02:21:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2640C17A423
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 00:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79BB88F66;
	Thu, 15 May 2025 00:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kLulVig3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C076B33E1
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 00:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747268488; cv=none; b=qdhkP9EhmBVtrwWNIAr4bdV7eeLn081P+7LJ29y+uWl8Ez3wZpmUYfEB2Ytma1dfnKk2mGLdoHhrAG0F2Lz+OyP0MyklZyf/+QAHOMEiKPBaCvwX91GVqIMbyrfuLHLHxJuyctdvzD9EXID45aGmwF+73QUfBpbVla7lg93y1iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747268488; c=relaxed/simple;
	bh=MHGclyAX35xo0Oi1MTvmAyO8ClYxGP9jyCf99e7/ITw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZueB8bIEyhzd3K3wzgy0xG00Err2ML5ExoVeAoqraIbpKr/0Efi3B0M2DruwM/n58fomM6jfOpUY08LIUXVggH1VIxly35Qs6w9Yrotnw4ZFeaCV7A1oH6O1ywlny93WvhzB7fY5082imc4dUGl5L25/xwEtkY4vEa6xv5F2A6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kLulVig3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EIG9PA003115
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 00:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=u3T4zfjmzH1nVAi6lbmvTDJy
	/YQD5ld+KCby8V6tPYA=; b=kLulVig3aJALtC/8rTwm3evvJXj75+9Wr3w/d3d8
	yvl4wCstpHvGIEko0hndxmmeIsduyCUaOSFzl6FSZhyYPcco2xp3tGr34VUggFU2
	FFjTJOERazcfZ6pWqe5ZaC2BkKuBQePD49aE89xbVK6F3hRIarvGlReZ9dF0pf1l
	5+joO9xHjgqZ5cyi51kNzvA96cs0YNrABgqzj7Dz3ffxIGl3nCKFFG/G5TSmNNvJ
	oZiZ8JwOlZOPWdOTzDthUxhzLx+rPiaEXk5G6xYGA1f3R7+D9/SJHP3refOz6GUv
	RnQQfMHRoQwYcGyFUGlcuqFe/mt7GKSC8+j8WTyghmayRQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcrccg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 00:21:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54e7922a1so80678385a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 May 2025 17:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747268484; x=1747873284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3T4zfjmzH1nVAi6lbmvTDJy/YQD5ld+KCby8V6tPYA=;
        b=oQ1msXxSh9ZIOlYRKl5hRwn+jyKnDh3RwhLjEy3A6CsjFvbBu93uxszDPuefU25iZs
         AXWgBcHLhKoB5Vi3M9VQtClcRRFZmaucefBSOWFoTNDvzvzehCvKJm4g++YsR2vY0sUb
         cbOCjWP9D+Ii4xiRq2JGaS/JB6BRmjACycySHvYb7N7SSUJvkv+cJGTPBmNek0gLt/P/
         ryGt8EajbJCRZ4HyI6a2JQ7No53GGVIW5dR/gkzDRSx5PWUqHElIUsGx1/j5JAv4sm+2
         PcqzB/ngt/1Pm525UUUurAH5rQbuP0i35QYsfX5vsbBRvg/9Xk6OKDUVHP4YXxtjdtAH
         daRw==
X-Forwarded-Encrypted: i=1; AJvYcCVjM9x/xtNTvIN1GXCWEGqiMTKl9rRAB+MxIKH+T9rRNLOPGuDuJ+dJ2nG50Snd0iSxPcfyT7IsXiJ6vm2Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yzee11E7vkqR/GAXK5ml5wKaMzdWz0m4kowDwiq8RtIU6El08BY
	5dTalNTgJpHt4Xc40AGP0nZli8AxTzmgFhxE5U5Z0vTD/JU4uK9lPPhaR16R5fXy/sevkcRm9RC
	MnN3P+LUwor2kSZdcyqFRL6ZciXrMTAlfmxe+25xe8LKDPEJ78N4dpamY+cKQXGCo
X-Gm-Gg: ASbGncuiMGKHpm2ECPAmHfi7rhGAMC0riPcb9QJOZ2JF5Fs9u0fET4f3vMxhGjiOeGF
	mCDHWNtX9pgQZK8io0TE6DLowx1iJ30D8wRwTRYyp/OHL0xSuMwxqHQrbiroW1KGhhCP3sIQyRb
	d0j+mQSU2n3xCsku4I41UNoM1oh8rLZGFyA/NmEjapPU8DNvd8pzinOXE+WXtYsnDiSjVaV8J48
	9qCKRERf9Y2KXtS0bsQSdzACWDTHkpb+haOCtRUrIjvB1mv15CgrZnbfzINp2deA7C9Ds65/nka
	AxBPj57a/57FWmKmciukXLRhcPBFrjfVnivHv6DIJXsh/BuAXGeLeKYCwgxCdf1sArnMNeueDe4
	=
X-Received: by 2002:a05:620a:29d2:b0:7c5:d7c4:576e with SMTP id af79cd13be357-7cd3c6997d6mr59894285a.31.1747268484544;
        Wed, 14 May 2025 17:21:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxthZgaaCEtgMWvPOufQHVkJCtJIfpyoMQ85ENiwc8/TTy112uu3WYn6gbXoDll+GJBh5MXA==
X-Received: by 2002:a05:620a:29d2:b0:7c5:d7c4:576e with SMTP id af79cd13be357-7cd3c6997d6mr59891585a.31.1747268484206;
        Wed, 14 May 2025 17:21:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fcbfsm2419532e87.50.2025.05.14.17.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 17:21:23 -0700 (PDT)
Date: Thu, 15 May 2025 03:21:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] drm/msm/dpu: Add max pingpong and dsc width to HW
 catalog
Message-ID: <txn2anohfbrymaseeo55slmzimstietsrmhx3mhigw4fcx3ow4@b42b3n53et6l>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-2-c8ba0d9bb858@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-max-mixer-width-v1-2-c8ba0d9bb858@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: amYMux24IgDy9L50v7ZYNKUaucC6CCxc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDAwMSBTYWx0ZWRfX0dGfZLhBP8Gh
 oCuBWfk5iKx0HoGJbU0/1cL0Fxc8DfTZhFgRa3X1D0wKEj1/Q3UT/ttZqAr1l6zpqTgtRZsFM3r
 GZUYWp3xPYo+LxMyJSm+aRGFxJdPjzAYEAj7TaU+gQDNy2DB2m1XnYB9w0s+umQfpxvfjk5LuNX
 Spy+RR/Y1eND5YQXLo/ZlXZkczv7aM1mqtNzU7F+QizLmk14kVttbXy8dy27qxKpN3rWxUszV2H
 ttpEc5Q8txiAezo+p8h2C+A75aqksmV3bkygHEZJHXvq7u0qXjGYACLJGjU26qkHaxeoTgO5ZFV
 0AOjlKfrEdMhnk7d9i9cZdq25WaXHkAQZFIoxZwFpQvrnO7aKjqheiPCu7BgLG6S9AEHdxDckgh
 FgHQxzShNK5bnT7eCfRf1HR/UsrPDzwq9BVTWqpyJvXkUeUzbzOS5uWFBSCadW7bR4Y1hfRy
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68253385 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=XNzoCkbmTKmYsmvQHroA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: amYMux24IgDy9L50v7ZYNKUaucC6CCxc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_05,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=959 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150001

On Wed, May 14, 2025 at 04:52:30PM -0700, Jessica Zhang wrote:
> Add max_dsc_encoder_width to dpu_caps struct and max_linewidth to
> dpu_pingpong_cfg for all chipsets within the HW catalog.
> 
> Note: The max supported PINGPONG width was 4096 but increased to 5120
> after DPU 6.x. In addition, DPU 8.x+ increases the max supported width
> of PINGPONG_0 specifically to 8960.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 11 +++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  |  4 ++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  |  4 ++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   |  4 ++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   |  4 ++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   |  6 ++++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  |  6 ++++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   |  4 ++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   |  3 +++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   |  6 ++++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  7 +++++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  5 +++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  7 +++++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  9 +++++++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  9 +++++++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  9 +++++++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  9 +++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 10 ++++++++++

This needs to be rebased on top of linux-next, otherwise you've missed
dpu_9_1_sar2130p.h .

-- 
With best wishes
Dmitry

