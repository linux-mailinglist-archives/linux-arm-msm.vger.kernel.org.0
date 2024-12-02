Return-Path: <linux-arm-msm+bounces-39842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E919DFF5D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 11:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33428B2295A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 10:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E591FC7E7;
	Mon,  2 Dec 2024 10:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EX+y2EBp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33B21FC0E8
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 10:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733136378; cv=none; b=noch96zX0KsPbGdKiJwD39wqWUBB6kPxCVG6QkogBzFu9yoB4RFV2PVFnK416kh1rDgov/KqPpOLL8QVpBewZSoaz9XiJ4wRylXiG5tYqYcIQITiseKBYszNCQFAoDJdZVzmZvZAI79/AhfSO4bdIphaEzajEQw3qktAqk9TI/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733136378; c=relaxed/simple;
	bh=5p8OUOuS/ridzS/kqnWUfKyqUfh+3kPVWpYCu+TMNBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nHRUA2z6QznbosBaGY0nk+l52h5Y/7qLjiQvmmO3OQ/uOgmjM5EUC3gJRCjiuDW2qhvWICO/7Pc6gvoxmIGmBAK8nqX2IIPF/zUT+xA4Ikh2jzYGBybXSn/BoChI1UHsA9vPIBdiNrRHB/ojPWur8pn5ZShAVmxhgBEJNzsaBZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EX+y2EBp; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53dd0cb9ce3so3580933e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 02:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733136375; x=1733741175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sW5g5zNCxuwuA9CkgMzqa+U4e2iYbFVfy38zh54cXVg=;
        b=EX+y2EBp6j6xxOoc1ajD18Heer2Xrvoqq89MXU+9qKOzMADD0SET01AjnLZG49zecW
         CmdSiZRHBmrPDXcl+Wboe2REwFz2l3mIC6kcLXEAtNc3KzKZca7Mh7CpCBhO21YIl77X
         G0qXr3N1+usIEMgOv6pD+If5rB2Pw3n37+lNGZpKaNn+MH6odNX++TjtOkIQbEQTYc7s
         c3klUY/sOoSAB4W2gee21tYNjCH99EDCUogI4ursg+HV6GUskkF2XdxofxurFyfv83zH
         EfYssD46YU3DM8mAQs2q13o6y1VDepIsG1ABHvFDaxf6fdVCmOMF7HFojTveRVAzLIw3
         uBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733136375; x=1733741175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sW5g5zNCxuwuA9CkgMzqa+U4e2iYbFVfy38zh54cXVg=;
        b=vCMc/8lcbE8kxA9SE5TQ4FLTLwY5ue6bKKxjIsmRSoLY3MEB2A/lnVkKv0Ocl7T0KS
         yaEXxpqxtlj7gLv1MnbRPnKm+C+jUxRCkahY7siXcqWYdWdFbJ3uqr42DfFK3SrNjqRD
         iBc07KK9hC9ZmTLAiTr7WzlLo5TpxF6YtE/tmPH9L+ZeMzFPJZnQdLeH/c77A9sdUlLa
         6/mwt95RCkWnzfhO3nbk6YhPqvbLhM1TdyDghIVLgcsn2WSas+YnqveKF3ouXN3jy97c
         /oBxUcHxFr/tGlTRiAnsZrrIXp3O/XOLA1hM95uHF8+y0O3jAZuDkwxwXFXjCCL2G3h6
         BzqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK5xJoMBjCE2NirSHxFNjKu4eZTxdAblexg7tXHa75fUiFfHofn4+uJww9Z0m83FY+yVxtWY9W0vGSmynK@vger.kernel.org
X-Gm-Message-State: AOJu0YwoeBVdXJSMnzmH+Km5fk3kc0XXZ6qC/ZDGo+r+zY0yqbxvCEjr
	zIzlHlnUX9fZ7WsPnVlUI9zFt5SAg9NKHWYI64xj1XGg+2mCvRLg+K3Rrj98quI=
X-Gm-Gg: ASbGnct3eLKnj1eovtGAfEWfOclUciv+BYnptPCqwTO10SzTJJi28EYXmd6QRsmc/ks
	kvFzVtTcvT76rbeLpE5RUG5iqkryW0t+3MSkx2wKa6Wy43IyzFyw6B1L/Kg/D4nziyo0903SN2d
	F4B1Bf/hVYUa+n6HOm1sJDmInG6gZJXmJggYGj+eJT2zr4vgQIOxRFp3pZJh1rkhhM9I8LUB6YK
	IO6kOY1KI4p5+RNRPVHwoW05HquLakP9m5mBiFpJY5qdxawTMQGsd4/0nnYMBj7sDgSNIPkMU57
	iOXpmL3tequ4b939IRfrB1abYL4mxg==
X-Google-Smtp-Source: AGHT+IHSCZMOjWupesy5/0HxHZeda2UBmkbWGoOoF1ozJXCQtPgXFWsr4uPvfC7x0xE42+mBQm6WWA==
X-Received: by 2002:a05:6512:124e:b0:53d:d3bc:cc11 with SMTP id 2adb3069b0e04-53df0112095mr7509493e87.48.1733136374959;
        Mon, 02 Dec 2024 02:46:14 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df644341bsm1424070e87.99.2024.12.02.02.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 02:46:14 -0800 (PST)
Date: Mon, 2 Dec 2024 12:46:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Xiangxu Yin <quic_xiangxuy@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, quic_lliu6@quicinc.com, quic_fangez@quicinc.com, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 5/8] drm/msm/dp: Add support for lane mapping
 configuration
Message-ID: <zvapsvfftai4fp6vwrn33edqsyuuprq2pxz6spij6j7t4y6xmn@zzgp7gbsivbk>
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-5-09a4338d93ef@quicinc.com>
 <CAA8EJpoY8hySQd00yODGeHjSpVZpEBLjF3aBiKGJPUhpr-2mgw@mail.gmail.com>
 <d2a3cd6f-1077-4edb-9f0c-0c940a639050@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2a3cd6f-1077-4edb-9f0c-0c940a639050@quicinc.com>

On Mon, Dec 02, 2024 at 04:40:05PM +0800, Xiangxu Yin wrote:
> 
> 
> On 11/29/2024 9:50 PM, Dmitry Baryshkov wrote:
> > On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
> >>
> >> Add the ability to configure lane mapping for the DP controller. This is
> >> required when the platform's lane mapping does not follow the default
> >> order (0, 1, 2, 3). The mapping rules are now configurable via the
> >> `data-lane` property in the devicetree. This property defines the
> >> logical-to-physical lane mapping sequence, ensuring correct lane
> >> assignment for non-default configurations.
> >>
> >> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
> >> ---
> >>  drivers/gpu/drm/msm/dp/dp_catalog.c | 11 +++++------
> >>  drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
> >>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  2 +-
> >>  drivers/gpu/drm/msm/dp/dp_panel.c   | 13 ++++++++++---
> >>  drivers/gpu/drm/msm/dp/dp_panel.h   |  3 +++
> >>  5 files changed, 20 insertions(+), 11 deletions(-)
> >>

> >> @@ -461,6 +460,7 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
> >>         struct msm_dp_panel_private *panel;
> >>         struct device_node *of_node;
> >>         int cnt;
> >> +       u32 lane_map[DP_MAX_NUM_DP_LANES] = {0, 1, 2, 3};
> >>
> >>         panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
> >>         of_node = panel->dev->of_node;
> >> @@ -474,10 +474,17 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
> >>                 cnt = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
> >>         }
> >>
> >> -       if (cnt > 0)
> >> +       if (cnt > 0) {
> >> +               struct device_node *endpoint;
> >> +
> >>                 msm_dp_panel->max_dp_lanes = cnt;
> >> -       else
> >> +               endpoint = of_graph_get_endpoint_by_regs(of_node, 1, -1);
> >> +               of_property_read_u32_array(endpoint, "data-lanes", lane_map, cnt);
> >> +       } else {
> >>                 msm_dp_panel->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
> >> +       }
> > 
> > Why? This sounds more like dp_catalog or (after the refactoring at
> > [1]) dp_ctrl. But not the dp_panel.
> > 
> > [1] https://patchwork.freedesktop.org/project/freedreno/series/?ordering=-last_updated
> > 
> We are used the same prop 'data-lanes = <3 2 0 1>' in mdss_dp_out to keep similar behaviour with dsi_host_parse_lane_data.
> From the modules used, catalog seems more appropriate, but since the max_dp_lanes is parsed at dp_panel, it has been placed here.
> Should lane_map parsing in msm_dp_catalog_get, and keep max_dp_lanes parsing at the dp_panel?

msm_dp_catalog_get() is going to be removed. Since the functions that
are going to use it are in dp_ctrl module, I thought that dp_ctrl.c is
the best place. A better option might be to move max_dp_lanes and
max_dp_link_rate to dp_link.c as those are link params. Then
lane_mapping also logically becomes a part of dp_link module.

But now I have a more important question (triggered by Krishna's email
about SAR2130P's USB): if the lanes are swapped, does USB 3 work on that
platform? Or is it being demoted to USB 2 with nobody noticing that?

If lanes 0/1 and 2/3 are swapped, shouldn't it be handled in the QMP
PHY, where we handle lanes and orientation switching?

> >> +
> >> +       memcpy(msm_dp_panel->lane_map, lane_map, msm_dp_panel->max_dp_lanes * sizeof(u32));
> >>
> >>         msm_dp_panel->max_dp_link_rate = msm_dp_panel_link_frequencies(of_node);
> >>         if (!msm_dp_panel->max_dp_link_rate)
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> >> index 0e944db3adf2f187f313664fe80cf540ec7a19f2..7603b92c32902bd3d4485539bd6308537ff75a2c 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> >> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> >> @@ -11,6 +11,8 @@
> >>  #include "dp_aux.h"
> >>  #include "dp_link.h"
> >>
> >> +#define DP_MAX_NUM_DP_LANES    4
> >> +
> >>  struct edid;
> >>
> >>  struct msm_dp_display_mode {
> >> @@ -46,6 +48,7 @@ struct msm_dp_panel {
> >>         bool video_test;
> >>         bool vsc_sdp_supported;
> >>
> >> +       u32 lane_map[DP_MAX_NUM_DP_LANES];
> >>         u32 max_dp_lanes;
> >>         u32 max_dp_link_rate;
> >>
> >>
> >> --
> >> 2.25.1
> >>
> > 
> > 
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry

