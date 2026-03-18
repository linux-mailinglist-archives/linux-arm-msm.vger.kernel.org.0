Return-Path: <linux-arm-msm+bounces-98532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4C6aEFHJumm6bwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 16:48:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 965352BE916
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 16:48:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 080DB3092AD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 15:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234043C4540;
	Wed, 18 Mar 2026 15:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KdNDQzyX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YJxi5154"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F272F3C1995
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 15:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773847421; cv=none; b=q0j6DFGpe/S1D6uk5/Rl3Cnx20PyhURnHHTu/NgZNIpQDwbpvtEG3ISWGsjejSsqusjhs1bN9aXAspGukf2m6IhtEWAgCHfKQP49vQDPLbTYercDlvroeS3UbjuzAB7ngcx4REFuLOc/wBgwyS8G5neuksDUZIyPVNBqmXus8Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773847421; c=relaxed/simple;
	bh=nyGI4+9DiFqErY1b1tYw46YrKLjBB/AKU+zCpVNHgPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oBo8/57t6M4LpR/wAwwVGVNnpb8onCNyrAjKLkSKNzmAI+05ZIv5eLIIP+GdjJ3S6Y+/NUnsiVvcXlMf1xjyk+JWPzTWEbnffVyYt0qr+D8IEKt3ZhP8cL7+UpELRRnwJ8OztuOT1PU7BB6pymHZGGiw68cuDwmZ0AA4/sgOSYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KdNDQzyX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YJxi5154; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62IFJoa3084743
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 15:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mNyh1HiW46Rs6Ltcp49U0a5W
	xhwi8i0oKhGbe83Lvh0=; b=KdNDQzyXDHAAGIHwEy6D//NK//nVTQk0wmD2AFFO
	Xk+EH/ONgDerwM34G/X/r2onD63AiAxprWQ+vu8NuIQXvLtLzg8LuOsm4TnsDqK8
	WhxOrO5kRbi/tZSh6GEFVn6hj1K+30d1v6O/4CEawscRTNrrb7Uvs/AjtC5rzg6q
	Egyu5BDOIo64RikheSQgVqryII4MToPRpbUn3t4VwY+4mpKsedS7qW7xl/5chF8v
	ajn8X2Fp0KuUZ7kWaEfiQFkAhvwcJx+z0UKgdlHmknstNEzzegFadmJwUdlXiypo
	0ljFxTpAi3i6loY88/1umyk4GTYLN3kbyQBspJOLbUDIAg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cykqetv9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 15:23:35 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-60270015488so13309607137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 08:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773847415; x=1774452215; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mNyh1HiW46Rs6Ltcp49U0a5Wxhwi8i0oKhGbe83Lvh0=;
        b=YJxi5154Is7TVhc7gYRk330w30B2KUkEFsl2fufTDLumrFXcdnyfPC9VGkKZpHvrrg
         FjEi5murPoYXtAvstejlrN/6MVLpd2o6A5I6YHCtIpnGKvgy6dDF3gmKAcYt56z1ndov
         cJcqxJAwIhs4LLk5l18ezS37WHZhp2YETg7c9u0QBg109GVVm7WH8v81RNF9eYKo1pZ5
         EdR8YPToWTio5UdFB901QxbamiV7BRj0T8tljMrdllR3Zc218dCMx6Q4/SF6CaIU1V6S
         kMb28jPi67PvtIiUQ9VLBsk9xzwg2UbnwYx5MRgHDOhEV8Cwou5OeIqTU9Mwk/Mnyh3E
         Z2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773847415; x=1774452215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mNyh1HiW46Rs6Ltcp49U0a5Wxhwi8i0oKhGbe83Lvh0=;
        b=gmMu8nE+0kuWGIjZ/CPJYwRtXsounvg9PVPfLIVbDTiE28PKzumXylQcm4xPqGrH6Z
         lX/C52K1KpcHGR9OoW7i5ZMs327eYk5AvfrQ9BvCP+l6fs1C40unlG+UQAWKvrHcBi55
         JSUaGYxJ4tV5/FVthsirxJql0RdiNtGZjcV72PJT7Fd5S/94HIzApGuYX9+jWs78dQnP
         jEqBhwmTle8JVbskVXDTZwIidyZP9GA3VFKHSFzffNK3rWCvI8Q9tygk6xqR7HEkzIF+
         hoe0A275zdSZeOwJNwIOmojyXQkFjNjdy9M1zl3ZyI8U/TfI6uYSZpuc89Db16cUSCwj
         0Cbg==
X-Forwarded-Encrypted: i=1; AJvYcCXNELsAHDlWNNNZJl08iL4kl0y4TgcLGNciXITh9Hopbtd4skeL346rtCRi4jm1V48POe8TXGjuoB2mzmRB@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2ibL5kXA2Xxop6nOuyyOMxhkQU3dPTDzBYs2CGWP1mE+8ZL6h
	HHFw4ljccnYso0mpn83jC/n0YDyOV4KSfVOpKV7K7xUa7FxDXR6hDNwdsjG2chb0MRIv1JDI/k/
	nnviUM5vR3c6lppb891GCehKfwLdwU4q899xVK5qmIemffxY3mQZNrSdkDMoCciuvJTaL
X-Gm-Gg: ATEYQzwHOrlNN5EV57BzQMMnF/C2RNmdiyQOAqHcN9QuSnqdhxGorKizZBLE+BfNS7N
	v8090s4SSYlZy1R7KmsZU/8Hf0DuZV0H/glizhezv8XViAuc6RfLxc83UaxpuYoEuecITlIija9
	el+sHAjelvDvAS6gXy6ldAAYh07sN+sFkVdXiu2n8EXgktgYn78ruq/NJgWs2yUyNIRduCnpvWN
	9R3LcDSrFgGe3rYgb91YSny4OdDuKGqHGaszZnNGh0a6ftdL+Iz6yNOwHb7X7bCJjiNNHuVmrSo
	HWpKzPRPIKgYnwHZS8f30Zr3rWkXMG9vQtc31XURFVRbi2QO+6PiSLu+ViwUtQV2YaSoEMYcBLQ
	B3fOeoWMRkrpXUtj45yQQ4cBgajt3deLeKgugfAx8ScWvDcR68dhal21f8glSIBlDWlqajI6sHH
	xH6rsuvLnZRceMS8H1VDTMRmfQ4cZKtXLjBxg=
X-Received: by 2002:a05:6102:ccf:b0:5ef:248b:d533 with SMTP id ada2fe7eead31-6027d39aee1mr1818878137.31.1773847414621;
        Wed, 18 Mar 2026 08:23:34 -0700 (PDT)
X-Received: by 2002:a05:6102:ccf:b0:5ef:248b:d533 with SMTP id ada2fe7eead31-6027d39aee1mr1818864137.31.1773847414167;
        Wed, 18 Mar 2026 08:23:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd54bc645sm6008871fa.30.2026.03.18.08.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:23:33 -0700 (PDT)
Date: Wed, 18 Mar 2026 17:23:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/msm/dpu: fix video mode DSC INTF timing width
 for non 8 bit panels
Message-ID: <ioc5si2r46kio3l46dcfgvnaytago4hdlqlzagerwc2vc2oqv5@sovdeki4ws7g>
References: <20260318-dsi-rgb101010-support-v1-0-6021eb79e796@pm.me>
 <20260318-dsi-rgb101010-support-v1-3-6021eb79e796@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-dsi-rgb101010-support-v1-3-6021eb79e796@pm.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDEzMSBTYWx0ZWRfXx10QSeOWpwPK
 zpmoiaeAKqmZPvPWxlH1/hB1+3o3aYpMlZPzXNNKaTD2xgoIyNK+Dal0KHgntbmejdD4CkMi7S6
 A6XQAPPf/SYzw9bznEkUbQQy0jevcb/D3FdcTABixK6jOy1EM/UMkInhL6cM5b3OskFFa+J6ldP
 m8CdiN2RMPuV44pzlJI72CLxltWijsneQ0FYB4DdNsCE2b9oE3WyqBMW4iygZS+zs5mvhA+KHTm
 fOtjkO/U1hzWR0gco5AR7X+Ok+ax6WgDOJjwcq2xOBgIrLzWVSUGIV6mPYCwqdg4kh0iL6AVbv8
 HkQkdotIDct38wU29SrmGxZQOEKX5Lak6+6j0RUV7Kp1oHbEDxPOIQ04iA99JpJr3247cx6IR2a
 eXRpMHwwYcc2rcEhCNBB0fqWFXrg6X5aO1R5YtE4YkvXsejMR8Oam65ft/vkyGShMHqcwGGC42/
 nGj8c1bjAEO6I+Y6aZg==
X-Authority-Analysis: v=2.4 cv=Cd4FJbrl c=1 sm=1 tr=0 ts=69bac377 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=2B9XaqMHzECM89MvOLQA:9
 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: KxXw0z0l4gXG3w5gWkK0glj7ewoQ70IY
X-Proofpoint-GUID: KxXw0z0l4gXG3w5gWkK0glj7ewoQ70IY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180131
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98532-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pm.me:email,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 965352BE916
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 09:41:09AM +0000, Alexander Koskovich wrote:
> Using bits_per_component * 3 as the divisor for the compressed INTF
> timing width produces constant FIFO errors for panels such as the BOE
> BF068MWM-TD0 which is a 10 bit panel.
> 
> The downstream driver calculates the compressed timing width by
> dividing the total compressed bytes per line by 3 which does not depend
> on bits_per_component. Switch the divisor to 24 to match downstream.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 0ba777bda253..9b046a0e77aa 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -122,19 +122,21 @@ static void drm_mode_to_intf_timing_params(
>  	}
>  
>  	/*
> -	 * for DSI, if compression is enabled, then divide the horizonal active
> -	 * timing parameters by compression ratio. bits of 3 components(R/G/B)
> -	 * is compressed into bits of 1 pixel.
> +	 * For DSI, if DSC is enabled, use a fixed divisor of 24 rather than
> +	 * bits_per_component * 3 when calculating the compressed timing width.
> +	 *
> +	 * This matches the downstream driver and is required for panels with
> +	 * bits_per_component != 8.
>  	 */
>  	if (phys_enc->hw_intf->cap->type != INTF_DP && timing->compression_en) {
>  		struct drm_dsc_config *dsc =
>  		       dpu_encoder_get_dsc_config(phys_enc->parent);
> +
>  		/*
>  		 * TODO: replace drm_dsc_get_bpp_int with logic to handle
>  		 * fractional part if there is fraction
>  		 */
> -		timing->width = timing->width * drm_dsc_get_bpp_int(dsc) /
> -				(dsc->bits_per_component * 3);
> +		timing->width = timing->width * drm_dsc_get_bpp_int(dsc) / 24;
>  		timing->xres = timing->width;
>  	}
>  }

It's already a third patch touching this part of code. I hope Marijn can
comment here.

-- 
With best wishes
Dmitry

