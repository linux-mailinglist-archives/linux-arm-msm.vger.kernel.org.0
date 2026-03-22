Return-Path: <linux-arm-msm+bounces-99063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEJiEGw2wGmUEwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 19:35:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 211882EA514
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 19:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDC363009F9C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 18:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D893933D4EE;
	Sun, 22 Mar 2026 18:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AfJK85Sn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YtAw7+4v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC552F9D98
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 18:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774204516; cv=none; b=tw39WhzJR4VZvKnjwswn9gL5tIA5kuqCfkgL3cxFMhPvbhwnBKuwyf7zkY8FzjJ4LN7gUwIed0Tg3ETwQ19VN2v9SPLvHjOoprSZXcS1gwZnnQu3po/vdvQhND/ePjQ391erpkqBhfrV7yF7tJt/RwK18TIU3VpBtXHApt36otc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774204516; c=relaxed/simple;
	bh=TyeRG2bM4P7NVg+IpZ6bwBYOCOq1ek7+TAiDJyUIIY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2giHnpPsrH7flnvkLuD37fXz32b0ZP3Sjcq36h7l/2ShP2R68OxIMCNxPp0b6+DJHidImDWMbMsJmwG+mWJvVArNtAAT9TKf+CnVXiCWb1WBV/D3xZcXU6dbd/2v+GjOI9JptJI1cbeo5/KfMkz2qGWBm/M6CSe3FDOhGDI5JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AfJK85Sn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YtAw7+4v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62M7k4kp3685978
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 18:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2whQYxYAX/vh03tBzskqkZaS
	QYQOGqrmyV5jVACuwOQ=; b=AfJK85SnNB3K5U+auyc2KNB+nT15vTgA7QaWfzg5
	vITwwXww3qQaBEOd+MXt4d+GdLb4yIy4+SJlU6nxQeMxHHV25YFteiRFdsP/TL+u
	/l45C+vBLdRFXLLE2wUVl4LkY/C3JA/GNHqsXmdMeo25aYg0LwzrcTJjxeWMsGn5
	z3LSI1lgOZm1eKcCLFV9oPKuHxxrh9jtyVWc4WZJ5YmBw54dp4mrOwpw5OZEayr6
	AD6k6rGdz1PR12xq7kEWJicqzJ9xP2NK+TWUagsQ2hvdp4wLYRKQ/RfYIQQer+j6
	vzCaj6YA05T6XGg8BNgn+W3/lyz5U4PNJLRK4sBbSBpLYQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1kq5tsf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 18:35:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4031b86dso190153991cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 11:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774204514; x=1774809314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2whQYxYAX/vh03tBzskqkZaSQYQOGqrmyV5jVACuwOQ=;
        b=YtAw7+4vg5uuS+L1d9Hx4dcHnSYRia5d/KCHYGiQU7UyhDNuhMk6df539qiBQvZhpb
         3lsuK3H7HQK3FoupmEFW/a359+47c/Ogi3X3+pBSw/4spRtgO99fkdF3kpA4xDbxJ3nd
         WPz8c06iiLSljL25VEs5vUKSeLXG5QuGZKpHqRZLKLj28RmGoTpzVAJjb5/uXKDYgmbq
         I32NoABpQ5mqsT/4vzPdG37DYShpQkYpZd9/WHf4T78S0rFgVY7Dw/4nZZ+EnIRzHgQy
         nWTh7+ySX4E7LY6JtFPgVXNWgCtyJ0bC2oIDwekC/6Zy2+8HuzN+80NPe7c/T+Uv5aTC
         luJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774204514; x=1774809314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2whQYxYAX/vh03tBzskqkZaSQYQOGqrmyV5jVACuwOQ=;
        b=em8l7jm7YbhKdCiKyWZBHg+2vrxxD2qyyCwdswkpv1IZmokb8I2ufvBd6KUwdPROK1
         aCQ9IRn8EtDyHMOjJBrHvjWpEhqRD9eq4ooXk5meBnwVvnSuLU8qI19B7z+1z5PZQlqE
         aEz2CUGEZ/4n6RnZhGBQBFuIZ7e3JkZeEnq5Pn74102gtla56VUVufCENcv2uBF2PSN+
         gdEZxjaIIwk4jLYSwvVOYI/via4E3Po7/PTqZ5d0FxLOd1+tDWQzKeb7Gu0zJVMY6m5k
         p3iPNnnkqHaBIIDR9sw8bFbQ3VAd1Q3ewyB0vXCbrF/z+31mRHoZKIge/24UEL/H7fcr
         UrNg==
X-Forwarded-Encrypted: i=1; AJvYcCXATD87nlbA1KoZrtVxKvoSu/ygQQCTM6kufhUfn8iskx74O/EUC2EMUsEZhoPwDnjzF9TSgRoMV6ZveZoW@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd6DhDww3KzeANF9iJDtsKORXIljWs+ci6e9d9iEiKVjMUvQBF
	VK/8lud+pRIGA1jq6qqzzAhE2QaW//4FvrraQBI75fWIUsuNVGZodbzAUutofLQhpgeUeBb0ZRM
	0b1ewrpEeoCo4Z1+0L+8J2R+xPJnV0dd/BfE24+OQCHTop4aBpi+fOSujlTfn5yRSVRIW
X-Gm-Gg: ATEYQzwzziCsCtxf38mLMJBofMoHpbmSvTJf6NzRCBQdCg+82lkBV70Hlt9DMcNf/nq
	yjavIW/gDD4AFkw1qIh+rwN5wMEJJvWSLexFFgTT6O1WzvojGcNK5Ozkoo1fg9NF7BLwkuL8MwW
	2lz+1m/MMXAw9J0gwc66e4WaVg6pnqQJV6KSeDoqrgzLEjCkNIV1TJmJNkxCEd1pjf6l+Z+G1d/
	05I+3BCsIqQVAgQaE+jZRmBlxW3jmP3AKEthWnFz/q0JOs77849CNlOjvqLI4alAzSkZc7ros6z
	/uAwoVsckY+ow7cLdVjkLkhyRjcn71eXQ4ddWBM+jvnA9Y2rTmZHomWYy1lA1HDXZUBPsrd+4kL
	pHhkgIk+H+jDIeLfnSLLn+6WgaqYqDocWyqhMLKDnwM89bCTOsqDAtninyylDVl0e9vjjqJzC01
	q/VqH5Mc0BDKBokJ3rAgywTmzRl7lFbeT8zqE=
X-Received: by 2002:ac8:5a8b:0:b0:50b:5243:d679 with SMTP id d75a77b69052e-50b5243d749mr60019321cf.46.1774204513598;
        Sun, 22 Mar 2026 11:35:13 -0700 (PDT)
X-Received: by 2002:ac8:5a8b:0:b0:50b:5243:d679 with SMTP id d75a77b69052e-50b5243d749mr60018991cf.46.1774204513130;
        Sun, 22 Mar 2026 11:35:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2851ac54fsm1971244e87.29.2026.03.22.11.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 11:35:11 -0700 (PDT)
Date: Sun, 22 Mar 2026 20:35:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] drm/msm/dpu: calculate data_width like downstream
Message-ID: <5fu22a3qcg3zn4qq2bt3j5teyzeihzitompenvdb3y72qa2tuh@vvvz5nrlfgtf>
References: <20260322-fix-data-width-calc-v1-1-128880f5a067@pm.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322-fix-data-width-calc-v1-1-128880f5a067@pm.me>
X-Authority-Analysis: v=2.4 cv=GNoF0+NK c=1 sm=1 tr=0 ts=69c03662 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=polRaJZFt_3Xv9GgdtEA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIyMDE2MSBTYWx0ZWRfX98pZUj4Abyot
 tKPTj8cWL6O/WB4brDQNOjcG3/rC6w8YDiL0bLlAQVZ2wQcR/LD8o3mg5+0vfvd01AL4X5GOLQe
 4LliosTqJF+XkmvPY4QBjCB/k1eN8v+xrdoiwDsVFlX5YZOIuxokvkIDRomgbJ9d8bBjQpj6jhQ
 mat0F1d4mcBcuJOR8XUh84m2ddit9/FD4Gs4WUKHpg/JGNEKfDChavkeQ8NR1Drk7f5CYpta6TN
 pZJo/F+E0MXLJOFQBS3vY+rg14TPZaudOJz4kN0MAO1BaXkWotMrDexjhgml/skopjlnI5AGDAD
 YNsRHnMw/21y7+au1K5xi+cqjHMh63rsDkNBraM7HTU7iZvj/xuig16yY19ahbO+02FJkUiIe4X
 MuaNyy2qXCJCN2ZLJUIO0szegDLK7s507LXF2uzZM1C/kbiVgRpKn6kbgpDZ7nzp4yilFriB0Mq
 KK68sBZHqpQ9eGhnbzw==
X-Proofpoint-ORIG-GUID: scyArin1cluSd5b13ZBdyxvLeLfuJB5J
X-Proofpoint-GUID: scyArin1cluSd5b13ZBdyxvLeLfuJB5J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_05,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603220161
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99063-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,marek.ca,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 211882EA514
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 22, 2026 at 02:31:13PM +0000, Alexander Koskovich wrote:
> Derive INTF data_width from dce_bytes_per_line rather than
> timing->width when DSC is enabled. Use DIV_ROUND_UP to avoid
> rounding errors.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
> This patch changes the data_width calculation to match downstream,
> and avoids needing to change the divisor for timing->width to /24.
> 
> However I am not sure if this is a correct approach, but at least
> with this I get the same values for data_width as downstream now:
> 
> data_width w/ no widebus
> before: 288
> after: 360
> 
> data_with w/ widebus
> before: 144
> after: 180
> 
> This was tested with the BOE BF068MWM-TD0 on the Nothing Phone (3a),
> it would be greatly appreciated if someone from QCOM could weigh in
> on if this is a correct approach.
> 
> Tested with kmscube and getting 120FPS, also note that this was
> tested with a few other changes:
> 
> (drm/msm/dsi: fix hdisplay calculation when programming dsi registers)

This is a part of msm-fixes

> (drm/msm/dsi: fix pclk rate calculation for bonded dsi)

This is a part of msm-fixes

> (drm/msm/dsi: fix bits_per_pclk)
> (drm/msm/dsi: fix hdisplay calculation for CMD mode panel)

Okay, let's pick these two. I assume we've had enough of testing. I hope
Marijn can also r-b those.

> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 23 +++++++++++++++++-----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  1 +
>  3 files changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 0ba777bda253..ba810f26ea30 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -10,6 +10,7 @@
>  #include "dpu_formats.h"
>  #include "dpu_trace.h"
>  #include "disp/msm_disp_snapshot.h"
> +#include "msm_dsc_helper.h"
>  
>  #include <drm/display/drm_dsc_helper.h>
>  #include <drm/drm_managed.h>
> @@ -136,6 +137,7 @@ static void drm_mode_to_intf_timing_params(
>  		timing->width = timing->width * drm_dsc_get_bpp_int(dsc) /
>  				(dsc->bits_per_component * 3);
>  		timing->xres = timing->width;
> +		timing->dce_bytes_per_line = msm_dsc_get_bytes_per_line(dsc);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 7e620f590984..de6b5b0f70c4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -173,13 +173,26 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
>  	data_width = p->width;
>  
>  	/*
> -	 * If widebus is enabled, data is valid for only half the active window
> -	 * since the data rate is doubled in this mode. But for the compression
> -	 * mode in DP case, the p->width is already adjusted in
> -	 * drm_mode_to_intf_timing_params()

Please keep the DP comment. We need to fix the assymmetry between DSI
and DP, but that needs DP DSC support first.


With that in place, the patch LGTM.

> +	 * If widebus is disabled:
> +	 * For uncompressed stream, the data is valid for the entire active
> +	 * window period.
> +	 * For compressed stream, data is valid for a shorter time period
> +	 * inside the active window depending on the compression ratio.
> +	 *
> +	 * If widebus is enabled:
> +	 * For uncompressed stream, data is valid for only half the active
> +	 * window, since the data rate is doubled in this mode.
> +	 * For compressed stream, data validity window needs to be adjusted for
> +	 * compression ratio and then further halved.
>  	 */
> -	if (p->wide_bus_en && !dp_intf)
> +	if (p->compression_en && !dp_intf) {
> +		if (p->wide_bus_en)
> +			data_width = DIV_ROUND_UP(p->dce_bytes_per_line, 6);
> +		else
> +			data_width = DIV_ROUND_UP(p->dce_bytes_per_line, 3);

I was concerned about DPU < 5.0, but data_width is only used for
HCTL-related timings, which means DPU 5.0+. I'll look at restructuring
the code.

> +	} else if (p->wide_bus_en && !dp_intf) {
>  		data_width = p->width >> 1;
> +	}
>  
>  	/* TODO: handle DSC+DP case, we only handle DSC+DSI case so far */
>  	if (p->compression_en && !dp_intf &&
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index f6ef2c21b66d..badd26305fc9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -35,6 +35,7 @@ struct dpu_hw_intf_timing_params {
>  
>  	bool wide_bus_en;
>  	bool compression_en;
> +	u32 dce_bytes_per_line;
>  };
>  
>  struct dpu_hw_intf_prog_fetch {
> 
> ---
> base-commit: f338e77383789c0cae23ca3d48adcc5e9e137e3c
> change-id: 20260322-fix-data-width-calc-c44287df08b8
> 
> Best regards,
> -- 
> Alexander Koskovich <akoskovich@pm.me>
> 
> 

-- 
With best wishes
Dmitry

