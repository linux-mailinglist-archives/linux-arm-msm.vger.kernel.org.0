Return-Path: <linux-arm-msm+bounces-76481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBF5BC65C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 20:51:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8EAE34EA1F7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 18:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EB828CF66;
	Wed,  8 Oct 2025 18:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pm35HvVw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DAD2BDC27
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 18:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759949462; cv=none; b=jCAXFuHH9ytLccIFL84xZLpPR5VeSSQdk0IsHs/mYVrjKia82AxjLWExTdkHQ4AX1MRlZBk5375bin8deYKmkP6v/k7v0wSGaVkeMK9ZkgzslQSr7UFvG7gTnMIDoJP8D5mzWcqOIx6+8kI5blpS3pl4YPu/uAfW5fqOYk9mllg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759949462; c=relaxed/simple;
	bh=Uwtcwj4f82dR/Xb31dkLDXy2J2UiBKZZOdOAbbwHbIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jiEgJRo7AJ5iFFdjbQbcYQR8OtjIXhbAkxdEXABrcDkgNBgHgbWrACpK49yRhGpqWJBxLeEn2R48+G5xFmrQ2S2Ah7D2FbcBaVWLyNgoOH8JDmYmqJt/G3IPooVTuDK9wgePqY/K5E7Gjq4zNUUMDI3iH/tzX2J+kJAu+OYh6iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pm35HvVw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5IxZ004508
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 18:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uITwFPVVtm5HGcZZqlMQJExGS43mnTAbnaIunuo1244=; b=pm35HvVwKYtocXkC
	KgBjxl7KJX/a84PN3g7r4RKb4r25FiSljFfF0+W+PA8oUpzKh7i19OAwbJAeQwCr
	uK4H5eZoRKU5++bwJFddNVJd+ffIZEZTvGMqtUvedUt4Vtp77DThSZmodrglKARL
	FQetzyS0hXMvZCfYIRLI51jKH9BSPfL7W9Yfsl94SY1qy7SGCRajgJyFEJcZboHR
	993RwCxyAeMkuFZlhjJtL5Bu7ESP8uLnmbefsmT9ZbgN3gS6r3Br47WlCrPpyOMn
	yDv33Tiwo6b3L3xKLwUMFrw2332qL/ViUXzWVX0/lNZsOsx3odEH5pHneOK2jail
	wvpZ8g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4kr8wu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 18:50:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4d8b8c3591fso4384231cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 11:50:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759949457; x=1760554257;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uITwFPVVtm5HGcZZqlMQJExGS43mnTAbnaIunuo1244=;
        b=Uhh0ykG47md37TsXTKEBNVWhgPITrR5yS8MBp8vpfB1c/ma9f2Lw40QRUZcRpJNxWz
         4HRzNrR23tgdBLH0x/TwwaEfBSNuS+0S2kiJwDY5id67gCeHIInPX733/pAA46ADFz/M
         idb4Do/6tBm16crJ6QlqE9M6pndfgjEk+mB5ob5EK8IS/CIPWzhxQcqUNlxTp4d0vwGa
         +/2arzoRThGhmzz5cwZ20wF5Cp82oqTUkVSJdRkTwVYx66QTacUJI0B8KFmbyeRY/c/J
         ui/1IF574bI6xG+yBzE10zKZ6FCUH8ynI4YSakv+GfSIEKsqX/cqgWxARBc3McHQhqBs
         8pZg==
X-Forwarded-Encrypted: i=1; AJvYcCWaYz1X8XBeLgHdaRLh3xn3gc2uME/iiT+YRx2UhjmFeO/dgHlP8tYF73AUwR/ZQxqDNrcSRdAZggXvP3T0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo9y/14v8+6c8mffsG9w5LzYRAWrRiLa0M1ii3GupbcNOBoHzn
	MoZPqhYH6iGyx8ob2VX85gHnfKzbrJjzscM8SjCHpuy4ZLryzQwnh4q5pnPSBhJjZn/SLV2sZVm
	qd8gwbfE3IbMfuirTHxDw9Vk9qreeTWL+nO3SD9MxseFndcXxdlNinX/4M+X6WpJ0dQxL
X-Gm-Gg: ASbGncv8vzwzasEoKzvqOZA8HTn60LgElreDbFabSlpORDpHpVlhqQmMWsAfTZe8hSL
	z0jNZu1EvoiN5/R4zsUlzFpDnsijzEXLD2rgGbai0+D1NBs6y6pQAaQXNipwCeduxA9jAm9F6QZ
	+KAYQbfBlYCUq6tRo1Q+ZMsLNbl2bDfjuScIBAjoP06Z7mOBavBOFXBIB+ZgVEckVN6YjAxV7ul
	ayylSU5HS1vRJnKKNCvD22DefZJSZfGCHhJN9Si5b2vT1kg2eI1hNt00Aw7/V007+5lYQaQEF8S
	yy/S0C3U/+orTNTDvCZ9tefnA9+A4wz1kvs/CD2KiT6eD1nSLh8ntm2SW7TXpc+YsYwn6sbjtUf
	a+R/g15zxR9H6DCnoq/14O/xvwwoQr9jooQy1aMEKM37MBSX5zVjnYSzwzg==
X-Received: by 2002:ac8:6f0c:0:b0:4e2:f1b3:3465 with SMTP id d75a77b69052e-4e6ead76f15mr74281691cf.38.1759949457196;
        Wed, 08 Oct 2025 11:50:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUO4IzyC2eM+Rm083vlD0OKO2yWrQqJ+L80WsUVjuOU8S6+ZWJh0vpPqNVGqSnwQ0XcRPA2Q==
X-Received: by 2002:ac8:6f0c:0:b0:4e2:f1b3:3465 with SMTP id d75a77b69052e-4e6ead76f15mr74280941cf.38.1759949456598;
        Wed, 08 Oct 2025 11:50:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f39d509bsm22551021fa.12.2025.10.08.11.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 11:50:55 -0700 (PDT)
Date: Wed, 8 Oct 2025 21:50:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        amd-gfx@lists.freedesktop.org, linux-mips@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 15/16] drm/atomic: Remove state argument to
 drm_atomic_private_obj_init
Message-ID: <wy7atek2mqkfg2nkawobibq7abt3w6g5wiu4d25nkctkxwkce4@mffhmrlfrqdy>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
 <20251008-drm-private-obj-reset-v1-15-805ab43ae65a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251008-drm-private-obj-reset-v1-15-805ab43ae65a@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX/R+gc+c2rg5j
 ooWHS63uSRcyz1+S62a5LpdDeTYdQUtf9gt9dqvwGs6LC7grof49QS5ssFeSeawp40ngyZGyjx8
 b13OL3KbNmrNFhMe3ccLDNQS1evzvIpgtLMbf25wmF3TMHcGYIsGGs6ELjaUS8ts1gc8+BpiXDV
 3UWgW+JUE1uxkVSAJw0d93Zh5NycEudqUjv0QxwUNkILD3NtizUlIYlhCKLCtqXY0uqjGhwfo1B
 mNXZea99VtfjHg42l2ssg8HDMC2Qxeq4rnUVSCJ0NJPhsmv41urGKauNfzFX69HicLGlGNpnQOl
 /ce6oyxOdywUyL5OXFiFhqW8HrIkYNUBFKq+k//DgGB348ugZ4qecQTLiH/WpQydlzTA2O9wLWh
 ctdqUv2lZBTJUlYCwe77cO8TbghN5Q==
X-Proofpoint-GUID: th-C8Go6XbB23rmlQadIw0rasRhVRlV0
X-Proofpoint-ORIG-GUID: th-C8Go6XbB23rmlQadIw0rasRhVRlV0
X-Authority-Analysis: v=2.4 cv=SJxPlevH c=1 sm=1 tr=0 ts=68e6b292 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=QyXUC8HyAAAA:8
 a=KKAkSRfTAAAA:8 a=ER_8r6IbAAAA:8 a=P1BnusSwAAAA:8 a=pGLkceISAAAA:8
 a=Ikd4Dj_1AAAA:8 a=RF00TdSWAAAA:8 a=V2sgnzSHAAAA:8 a=EUspDBNiAAAA:8
 a=tVI0ZWmoAAAA:8 a=e5mUnYsNAAAA:8 a=4fa6rhvZphqvzmXW0hwA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=cvBusfyB2V15izCimMoJ:22 a=9LHmKk7ezEChjTCyhBa9:22 a=D0XLA9XvdZm18NrgonBM:22
 a=_nx8FpPT0le-2JWwMI5O:22 a=Z31ocT7rh6aUJxSkT1EX:22 a=-BPWgnxRz2uhmvdm1NTO:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On Wed, Oct 08, 2025 at 02:04:13PM +0200, Maxime Ripard wrote:
> Now that all drm_private_objs users have been converted to use reset
> instead of the old ad-hoc initialization, we can remove the state
> parameter from drm_private_obj_init and the fallback code.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> 
> ---
> 
> To: Liviu Dudau <liviu.dudau@arm.com>
> To: Andrzej Hajda <andrzej.hajda@intel.com>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Robert Foss <rfoss@kernel.org>
> To: Paul Cercueil <paul@crapouillou.net>
> To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> To: Thierry Reding <thierry.reding@gmail.com>
> To: Mikko Perttunen <mperttunen@nvidia.com>
> To: Jonathan Hunter <jonathanh@nvidia.com>
> To: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Rodrigo Siqueira <siqueira@igalia.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: "Maíra Canal" <mcanal@igalia.com>
> Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c       |  1 -
>  drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c | 16 ++++++++--------
>  drivers/gpu/drm/display/drm_dp_mst_topology.c           |  1 -
>  drivers/gpu/drm/display/drm_dp_tunnel.c                 |  2 +-
>  drivers/gpu/drm/drm_atomic.c                            | 17 ++---------------
>  drivers/gpu/drm/drm_bridge.c                            |  1 -
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c               |  2 +-
>  drivers/gpu/drm/ingenic/ingenic-ipu.c                   |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c                 |  1 -
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c                |  1 -
>  drivers/gpu/drm/omapdrm/omap_drv.c                      |  2 +-
>  drivers/gpu/drm/tegra/hub.c                             |  2 +-
>  drivers/gpu/drm/vc4/vc4_kms.c                           |  4 +---
>  include/drm/drm_atomic.h                                |  1 -
>  14 files changed, 16 insertions(+), 37 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

