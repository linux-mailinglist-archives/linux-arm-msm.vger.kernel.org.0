Return-Path: <linux-arm-msm+bounces-42862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECDF9F8747
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 22:45:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32CF01890DD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 21:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A66C1C07F4;
	Thu, 19 Dec 2024 21:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bke1bKQH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD7D1D0E2B
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 21:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734644729; cv=none; b=pa4o0JjZSUIRfqM7RaaUPp6ICNAR8lEnYbRjUffQmtv2oqZ0m8vdEQPvebteutTKIYwYw3DwLIunw5+Dgtjzo51Tyo+dXA1xI3ak+dXIW/YCBlXFxykXQh6gKLh15gcRkV1neTSn97I5eGe6pf2u5W/KlltnB7MzzTpEP7z0+TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734644729; c=relaxed/simple;
	bh=Oh4KteXrS6ICRcxSix9e1qp4ILzxIG7MH32cwotWhQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OmG9v7ZiJej31f0NMku56vAkY8nmg8nG7z4U1KjMAythZwTzsErUd4IANnre0phaI9i8lZRsVvpjzzUbILP0RUzgKTeGk1xxD/6aD+lwO/ZugARvp7bYzAX1Fy5wVK+hqhp8np2Intf8Hy1RlvRFAGm4Rj14TCY5lUI1v9EnT/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bke1bKQH; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53e399e3310so1304586e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 13:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734644724; x=1735249524; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZJTcfRutqlaUTKnzrx55J7msIGx8wo0YdU8Xm5ECNAo=;
        b=bke1bKQHLoKySKjSmjNU9eXR2E4RzglI2CQoDdPNBi1CJoPMolvBgOYOhzSF+d3lmr
         qzPdcQbsfwKBxETo+ef/SC2MkHgJyrHNNAEmCC8YZnEGcLU0xUPddaOnrbfkc+D1k28y
         ceOgqPq+xIKik3YfUps476KVn0oNVY5YYmSitrgwHVLMw53giOUKMLA8JTO1XTLoqxV8
         GhcUeSgNkEaUtgXQragXBXZnfm8iUzYRkobLe5KeInLF1D4oFE9kddsxjZGFhnNBRzru
         wCOXRKQgSJbXRjSRwebgvHgo3gHuFxkLNEJ9RsipJueE1Pj6DjpZybL5XY+hp275p5A7
         w9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734644724; x=1735249524;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZJTcfRutqlaUTKnzrx55J7msIGx8wo0YdU8Xm5ECNAo=;
        b=VV4rXwUT7TmF/LmS//CwX265X9wU7/AcPUTfA7Wiss5l0E3HHgK38LmCecrlD8y24m
         qnKLVeIuN6kjGG/q9sIkLr/YuNkn9L36xZR4V7Doj6/KIS7+DFH7V8ZX2+mKkd7MRECL
         krr82j/DSGXGD2xFX69aoGmmCiTabmO/CKC1O8T8fNqV5YXHagSez2ogGFMAzbo6JqXM
         iTVuqG0N+kK+xUujsuFGFaWwZWXQCMozgDRg3F1IVw2aZJBEycbZJZ+UcviNo9vDcgPU
         sL1rZ6k9K3mDLlHf0VwaxZ6xWEW/L8OVD6l1NUCfQ7MjhjM/MOD7ysVgk2MPgha46al9
         TwlA==
X-Forwarded-Encrypted: i=1; AJvYcCWYvZtafFQfK/z/X0Ljbf/RI5ExaFCryAxSK2UO3cvzOc1OYuFwxU3Z8ZFgsp+UrTjjXuCE5GbgevFuAUZF@vger.kernel.org
X-Gm-Message-State: AOJu0YyfDxPYZcB0STWacKc+ynvFwVA3J9gun3fE62jquRaLRL7jrhpQ
	6sqsI96vRrb1Vzy47KtQpTRb1Y2zLzyLbap65s9hHIfH80Be+st6gAC1k/kPEZI=
X-Gm-Gg: ASbGncttfbY5TyUz/ly7RG/d9Ha9pNuUiKzM8R8x3d3JdkFa/XlEliMVTO3p7X2zybn
	KtzDdgv6GwgYgf7DXKT3xNsrjE05zt8GLowZJdk5cIhzO6Oy13CjsDDKHYkLnwYw4VIKzSgJQhs
	SdvxIUWvDmCBemj2HeYVnPTHMzbGirMIzUFRyFR8/byVE+7z3+FWEOuyK0TNxlfda13lij8w8BA
	L2SCscXzanPqG6A6fP0Tn/OA4Vkypm1la9TrHHEJZPkTODjsZ2lcgePBTfJejyWYE/2TEqQbjpF
	Ndo9HDVIGlgbQueLebveZFYwGOBqj+S1lGmx
X-Google-Smtp-Source: AGHT+IECfZo34PvNSYVVnPtNNgkO9WLPh5KUcWRTUkNqE3h3aVJ7oEoB32W+HgdGLQFgl5lIcwqKzA==
X-Received: by 2002:a05:6512:2807:b0:53e:38fd:7514 with SMTP id 2adb3069b0e04-5422956bdaamr71293e87.51.1734644724413;
        Thu, 19 Dec 2024 13:45:24 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832b84sm285319e87.269.2024.12.19.13.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 13:45:23 -0800 (PST)
Date: Thu, 19 Dec 2024 23:45:20 +0200
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
Message-ID: <h6tmbuv26tdv633udphttsydpbvnwownulvglcxktdaxqdhtvw@ereftfs5hiso>
References: <20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com>
 <20241129-add-displayport-support-for-qcs615-platform-v1-5-09a4338d93ef@quicinc.com>
 <CAA8EJpoY8hySQd00yODGeHjSpVZpEBLjF3aBiKGJPUhpr-2mgw@mail.gmail.com>
 <d2a3cd6f-1077-4edb-9f0c-0c940a639050@quicinc.com>
 <zvapsvfftai4fp6vwrn33edqsyuuprq2pxz6spij6j7t4y6xmn@zzgp7gbsivbk>
 <93ddb63c-42da-43c8-9a77-c517ca5d6432@quicinc.com>
 <CAA8EJprAFYD6ykN10-r=JwHM4A4XeDDcZVcVWYp_5A5FP-=RyA@mail.gmail.com>
 <e647d143-dc6e-483d-ac81-2733fb526fc3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e647d143-dc6e-483d-ac81-2733fb526fc3@quicinc.com>

On Thu, Dec 19, 2024 at 06:36:38PM +0800, Xiangxu Yin wrote:
> 
> 
> On 12/5/2024 7:40 PM, Dmitry Baryshkov wrote:
> > On Thu, 5 Dec 2024 at 13:28, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 12/2/2024 6:46 PM, Dmitry Baryshkov wrote:
> >>> On Mon, Dec 02, 2024 at 04:40:05PM +0800, Xiangxu Yin wrote:
> >>>>
> >>>>
> >>>> On 11/29/2024 9:50 PM, Dmitry Baryshkov wrote:
> >>>>> On Fri, 29 Nov 2024 at 09:59, Xiangxu Yin <quic_xiangxuy@quicinc.com> wrote:
> >>>>>>
> >>>>>> Add the ability to configure lane mapping for the DP controller. This is
> >>>>>> required when the platform's lane mapping does not follow the default
> >>>>>> order (0, 1, 2, 3). The mapping rules are now configurable via the
> >>>>>> `data-lane` property in the devicetree. This property defines the
> >>>>>> logical-to-physical lane mapping sequence, ensuring correct lane
> >>>>>> assignment for non-default configurations.
> >>>>>>
> >>>>>> Signed-off-by: Xiangxu Yin <quic_xiangxuy@quicinc.com>
> >>>>>> ---
> >>>>>>  drivers/gpu/drm/msm/dp/dp_catalog.c | 11 +++++------
> >>>>>>  drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
> >>>>>>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  2 +-
> >>>>>>  drivers/gpu/drm/msm/dp/dp_panel.c   | 13 ++++++++++---
> >>>>>>  drivers/gpu/drm/msm/dp/dp_panel.h   |  3 +++
> >>>>>>  5 files changed, 20 insertions(+), 11 deletions(-)
> >>>>>>
> >>>
> >>>>>> @@ -461,6 +460,7 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
> >>>>>>         struct msm_dp_panel_private *panel;
> >>>>>>         struct device_node *of_node;
> >>>>>>         int cnt;
> >>>>>> +       u32 lane_map[DP_MAX_NUM_DP_LANES] = {0, 1, 2, 3};
> >>>>>>
> >>>>>>         panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
> >>>>>>         of_node = panel->dev->of_node;
> >>>>>> @@ -474,10 +474,17 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
> >>>>>>                 cnt = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
> >>>>>>         }
> >>>>>>
> >>>>>> -       if (cnt > 0)
> >>>>>> +       if (cnt > 0) {
> >>>>>> +               struct device_node *endpoint;
> >>>>>> +
> >>>>>>                 msm_dp_panel->max_dp_lanes = cnt;
> >>>>>> -       else
> >>>>>> +               endpoint = of_graph_get_endpoint_by_regs(of_node, 1, -1);
> >>>>>> +               of_property_read_u32_array(endpoint, "data-lanes", lane_map, cnt);
> >>>>>> +       } else {
> >>>>>>                 msm_dp_panel->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
> >>>>>> +       }
> >>>>>
> >>>>> Why? This sounds more like dp_catalog or (after the refactoring at
> >>>>> [1]) dp_ctrl. But not the dp_panel.
> >>>>>
> >>>>> [1] https://patchwork.freedesktop.org/project/freedreno/series/?ordering=-last_updated
> >>>>>
> >>>> We are used the same prop 'data-lanes = <3 2 0 1>' in mdss_dp_out to keep similar behaviour with dsi_host_parse_lane_data.
> >>>> From the modules used, catalog seems more appropriate, but since the max_dp_lanes is parsed at dp_panel, it has been placed here.
> >>>> Should lane_map parsing in msm_dp_catalog_get, and keep max_dp_lanes parsing at the dp_panel?
> >>>
> >>> msm_dp_catalog_get() is going to be removed. Since the functions that
> >>> are going to use it are in dp_ctrl module, I thought that dp_ctrl.c is
> >>> the best place. A better option might be to move max_dp_lanes and
> >>> max_dp_link_rate to dp_link.c as those are link params. Then
> >>> lane_mapping also logically becomes a part of dp_link module.
> >>>
> >>> But now I have a more important question (triggered by Krishna's email
> >>> about SAR2130P's USB): if the lanes are swapped, does USB 3 work on that
> >>> platform? Or is it being demoted to USB 2 with nobody noticing that?
> >>>
> >>> If lanes 0/1 and 2/3 are swapped, shouldn't it be handled in the QMP
> >>> PHY, where we handle lanes and orientation switching?
> >>>
> >> I have checked the DP hardware programming guide and also discussed it with Krishna.
> >>
> >> According to the HPG section '3.4.2 PN and Lane Swap: PHY supports PN swap for mainlink and AUX, but it doesn't support lane swap feature.'
> >>
> >> The lane swap mainly refers to the logical to physical mapping between the DP controller and the DP PHY. The PHY handles polarity inversion, and the lane map does not affect USB behavior.
> >>
> >> On the QCS615 platform, we have also tested when DP works with lane swap, other USB 3.0 ports can works normally at super speed.
> > 
> > "Other USB 3.0 ports"? What does that mean? Please correct me if I'm
> > wrong, you should have a USB+DP combo port that is being managed with
> > combo PHY. Does USB 3 work on that port?
> > 
> > In other words, where the order of lanes is actually inverted? Between
> > DP and combo PHY? Within combo PHY? Between the PHY and the pinout?
> > Granted that SM6150 was supported in msm-4.14 could you possibly point
> > out a corresponding commit or a set of commits from that kernel?
> > 
> For "Other USB 3.0 ports", as replied in USBC driver, USB3 primary phy works for other four USB type-A port.

So if that's the USB3 primary, then why do you mention here at all? We
are taling about the secondary USB3 + DP.

> The REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING mapping determines how logical lanes (0, 1, 2, 3) map to physical lanes sent to the PHY.
> This ensures alignment with hardware requirements.
> The PHY’s polarity inversion only adjusts signal polarity and doesn’t affect lane mapping.
> Both DP ctrl and PHY lane related config will not affect USB phy.

Probably we misundersand each other. The DP PHY should have orientation
switch register, which controls whether 2-lane DP uses lanes 0/1 or 2/3.
Can you use that register?

Also, could you _please_ answer the question that I have asked? Is the
order of lanes inverted between the DP controller and DP PHY? Or between
DP PHY and the DP connector? If one uses USB3 signals coming from this
port (yes, on the other board, not on the Ride), would they also need to
switch the order of USB3 lanes? If one uses a DP-over-USB-C, are DP
lanes are swapped?

> Without extra Type-C mapping, the DP controller’s mapping indirectly decides how signals are transmitted through Type-C.
> Mapping ensures proper data transmission and compatibility across interfaces.
> 
> We only found sm6150 need this lane mapping config, 
> For msm 4.14, please refer these links,
> https://android.googlesource.com/kernel/msm/+/af03eef7d4c3cbd1fe26c67d4f1915b05d0c1488/arch/arm64/boot/dts/qcom/sm6150-sde.dtsi (qcom,logical2physical-lane-map)
> https://android.googlesource.com/kernel/msm/+/af03eef7d4c3cbd1fe26c67d4f1915b05d0c1488/drivers/gpu/drm/msm/dp/dp_parser.c (dp_parser_misc)
> https://android.googlesource.com/kernel/msm/+/af03eef7d4c3cbd1fe26c67d4f1915b05d0c1488/drivers/gpu/drm/msm/dp/dp_catalog_v200.c (dp_catalog_ctrl_lane_mapping_v200)
> 
> If need process orientation info like dp_catalog_ctrl_lane_mapping_v200, 
> then 
> if implement in DP phy, then we need config dp_link register in PHY,
> if implement in DP link, then we need pass orientation info to DP driver, perhaps we could add a new attribute to the phy_configure_opts_dp structure to pass this.
> Do you have any suggestions?

Does SW_PORTSEL_VAL affect the DP lanes on this platform?

> 
> >>
> >> Additionally, if it were placed on the PHY side, the PHY would need access to dp_link’s domain which can access REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING.
> > 
> > I was thinking about inverting the SW_PORTSEL_VAL bit.
> > 
> >> Therefore, we believe that the  max_dp_link_rate,max_dp_lanes and lane_map move to dp_link side is better.
> >>
> >>>>>> +
> >>>>>> +       memcpy(msm_dp_panel->lane_map, lane_map, msm_dp_panel->max_dp_lanes * sizeof(u32));
> >>>>>>
> >>>>>>         msm_dp_panel->max_dp_link_rate = msm_dp_panel_link_frequencies(of_node);
> >>>>>>         if (!msm_dp_panel->max_dp_link_rate)
> >>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> >>>>>> index 0e944db3adf2f187f313664fe80cf540ec7a19f2..7603b92c32902bd3d4485539bd6308537ff75a2c 100644
> >>>>>> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> >>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> >>>>>> @@ -11,6 +11,8 @@
> >>>>>>  #include "dp_aux.h"
> >>>>>>  #include "dp_link.h"
> >>>>>>
> >>>>>> +#define DP_MAX_NUM_DP_LANES    4
> >>>>>> +
> >>>>>>  struct edid;
> >>>>>>
> >>>>>>  struct msm_dp_display_mode {
> >>>>>> @@ -46,6 +48,7 @@ struct msm_dp_panel {
> >>>>>>         bool video_test;
> >>>>>>         bool vsc_sdp_supported;
> >>>>>>
> >>>>>> +       u32 lane_map[DP_MAX_NUM_DP_LANES];
> >>>>>>         u32 max_dp_lanes;
> >>>>>>         u32 max_dp_link_rate;
> >>>>>>
> >>>>>>
> >>>>>> --
> >>>>>> 2.25.1
> >>>>>>
> >>>>>
> >>>>>
> >>>>
> >>>>
> >>>> --
> >>>> linux-phy mailing list
> >>>> linux-phy@lists.infradead.org
> >>>> https://lists.infradead.org/mailman/listinfo/linux-phy
> >>>
> >>
> > 
> > 
> 

-- 
With best wishes
Dmitry

