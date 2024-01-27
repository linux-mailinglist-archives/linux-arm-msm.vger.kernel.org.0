Return-Path: <linux-arm-msm+bounces-8582-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F5D83EB4C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jan 2024 06:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2D371F22CF8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jan 2024 05:31:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440AC17BAF;
	Sat, 27 Jan 2024 05:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ipAD1swk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1C117727
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jan 2024 05:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706333513; cv=none; b=p7JMCDb9HuH9STZCUNdXrLFCMCv+nqJqWFouk5w2qbQKqVUIC/JD0neSb5g/Dhhh+Ep9dzfyOndkFDAsuvfmHLzsubIsjbxbyGxdfY9L5GGVslxMMaNjiiyK+VbO+DwUu2lkdCXoRDZGja2Bs48Lsfun3V3mq4aKzoShdaPggaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706333513; c=relaxed/simple;
	bh=19c91pTuDNT3aAo8eQg9b1YjLc7btYnAojtSNVw70tw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hcyjqb8IwDNW1FcgHHH4KVpWwQYT7lcAK9tXfpO3NK1emS08ImXOzswrfABdhI1XgBWXDFC6xVEfW+HGq0IIkhNqS1gLj2gfqtWtgIjKZ1vJ8OvJ4g2vgRK4GB3EhfsinGQ9v1SQ3Eg6+L62P1oYNFN+9/3Rqik7JziQ0hkeWh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ipAD1swk; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5f0629e67f4so12887007b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 21:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706333510; x=1706938310; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rVc4bkitF/keiGdKpESOGKUYPs3Y9nGp0F83tDGG0pg=;
        b=ipAD1swkThsf/RRB7HRIacjQiZUTlKKKRU9kD/Z3tE4/lonx4VV59eLStCGghrWZy1
         G9kY0tUKkEPhkui/0wnmSjTX7D09XlLa5Du79j3AiykxLc8D0k0NCCx/GbEF5Wj/O6iW
         a+h/RhnVTRPQBK46+7qRwd31SsRMGRq4lfUE8RIIlcZ8F+tkB7zWuysXLqaXyFpI60ht
         jufNZec5PskPsPK04qjz7kCAAomNeeD8BXt44oNDRr1rm+dlvtmwuteg6dFjJHLoWoDv
         RA0NcItn4x+cdkWYyYLfk4mZKLDhrzqOZ1cqxtTyKW6PQO3StUaXMWRLC6fyFcl2pgSy
         spww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706333510; x=1706938310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rVc4bkitF/keiGdKpESOGKUYPs3Y9nGp0F83tDGG0pg=;
        b=l9huvRTp4cCQRXxtxfZrcTZ+YtWEA5hXB25ZuB0B7ycvEZG22SiH+HoJfB0t8vEcgE
         HdbtEXFKsn/tRhEcRW5cm+EOMRgsAYN0CYcmPuqlistIpJlV0fkT2rGlTCvhh9TvVBz4
         a4X9WUemWydW6fvCDBykUcMu+NKAZKYHDdIUHMM9kWTqGnW3nVNINBJQCcqqyy6VDBRN
         Ko5mNSn4wAdBxEoBJbkgbv6Qr0Q9vXT3UxbrrsmoadAgTRXSCboFHNB5m6uYJx2Hrsz2
         2GlLLpmpxkg+r1nAzVbnJnZ59Tan5rz72ii9ExJlSqnsWtOjv+UXh7nv9e/sSJGgtzy3
         3CmQ==
X-Gm-Message-State: AOJu0YwHj/E6a31rNXLsfzWLc+77vxhZctvDrRjJdKhgMS41M69mF+Xn
	OI6StE+UajPw43W0CxKWunRL5a8W64lBwxP2r4onuKKcoQi/+1DC9Xg4ZQhMUA3BnclGU874PQI
	BPfCb+4c3cm5gS532Gve1Ci2aZOCcdRY2jcRGXw==
X-Google-Smtp-Source: AGHT+IHEVhWCzP0VCTTFVuphVA0bbYoVfausySofrE3TpTi9XI/p6h9UKgMPkzfj88c1dy6Lxn37GAbp2sjI+6zmWr0=
X-Received: by 2002:a81:a014:0:b0:5ff:af79:42a4 with SMTP id
 x20-20020a81a014000000b005ffaf7942a4mr1146896ywg.0.1706333510058; Fri, 26 Jan
 2024 21:31:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-6-quic_parellan@quicinc.com> <e1a13e45-e87c-4c7b-a5cb-f46d51e66058@linaro.org>
 <1351d4b7-846c-f736-ac17-332291ed8609@quicinc.com> <CAA8EJpq7OB1=e+K16ZywPj_JU8Z7R2=LKDwrAD1ZFnurwHvC+A@mail.gmail.com>
 <961d8e06-1ad1-e6af-4739-3d285a85fec7@quicinc.com>
In-Reply-To: <961d8e06-1ad1-e6af-4739-3d285a85fec7@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 27 Jan 2024 07:31:38 +0200
Message-ID: <CAA8EJppv1Nv4zbExddPWfhHLeEDd2pPZP+J74jOnYuXKzpANhQ@mail.gmail.com>
Subject: Re: [PATCH 05/17] drm/msm/dp: add an API to indicate if sink supports
 VSC SDP
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Paloma Arellano <quic_parellan@quicinc.com>, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, 
	quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com, 
	marijn.suijten@somainline.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 27 Jan 2024 at 05:57, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 1/26/2024 6:40 PM, Dmitry Baryshkov wrote:
> > On Sat, 27 Jan 2024 at 02:58, Paloma Arellano <quic_parellan@quicinc.com> wrote:
> >>
> >>
> >> On 1/25/2024 1:23 PM, Dmitry Baryshkov wrote:
> >>> On 25/01/2024 21:38, Paloma Arellano wrote:
> >>>> YUV420 format is supported only in the VSC SDP packet and not through
> >>>> MSA. Hence add an API which indicates the sink support which can be used
> >>>> by the rest of the DP programming.
> >>>
> >>> This API ideally should go to drm/display/drm_dp_helper.c
> >> I'm not familiar how other vendors are checking if VSC SDP is supported.
> >> So in moving this API, I'm going to let the other vendors make the
> >> changes themselves.
> >
> > Let me show it for you:
> >
> > bool intel_dp_get_colorimetry_status(struct intel_dp *intel_dp)
> > {
> >          u8 dprx = 0;
> >
> >          if (drm_dp_dpcd_readb(&intel_dp->aux, DP_DPRX_FEATURE_ENUMERATION_LIST,
> >                                &dprx) != 1)
> >                  return false;
> >          return dprx & DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED;
> > }
> >
>
> Even AMD has similar logic:
>
> 6145            stream->use_vsc_sdp_for_colorimetry = false;
> 6146            if (aconnector->dc_sink->sink_signal ==
> SIGNAL_TYPE_DISPLAY_PORT_MST) {
> 6147                    stream->use_vsc_sdp_for_colorimetry =
> 6148                            aconnector->dc_sink->is_vsc_sdp_colorimetry_supported;
> 6149            } else {
> 6150                    if
> (stream->link->dpcd_caps.dprx_feature.bits.VSC_SDP_COLORIMETRY_SUPPORTED)
> 6151                            stream->use_vsc_sdp_for_colorimetry = true;
> 6152            }
>
> But it will be harder to untangle this compared to intel's code.
>
> I am fine with adding an API to drm_dp_helper which indicates presence
> of VSC SDP but I would prefer leaving it to other vendors to use it in
> the way they would like and only keep msm usage in this series.

SGTM

>
>
>
> >
> >>>
> >>>>
> >>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> >>>> ---
> >>>>    drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
> >>>>    drivers/gpu/drm/msm/dp/dp_panel.c   | 35 +++++++++++++++++++++++++----
> >>>>    drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
> >>>>    3 files changed, 34 insertions(+), 5 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> b/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> index ddac55f45a722..f6b3b6ca242f8 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> >>>> @@ -1617,7 +1617,8 @@ void dp_bridge_mode_set(struct drm_bridge
> >>>> *drm_bridge,
> >>>>            !!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
> >>>>          dp_display->dp_mode.out_fmt_is_yuv_420 =
> >>>> - drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode);
> >>>> + drm_mode_is_420_only(&dp->connector->display_info, adjusted_mode) &&
> >>>> +        dp_panel_vsc_sdp_supported(dp_display->panel);
> >>>>          /* populate wide_bus_support to different layers */
> >>>>        dp_display->ctrl->wide_bus_en =
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c
> >>>> b/drivers/gpu/drm/msm/dp/dp_panel.c
> >>>> index 127f6af995cd1..af7820b6d35ec 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> >>>> @@ -17,6 +17,9 @@ struct dp_panel_private {
> >>>>        struct dp_link *link;
> >>>>        struct dp_catalog *catalog;
> >>>>        bool panel_on;
> >>>> +    bool vsc_supported;
> >>>> +    u8 major;
> >>>> +    u8 minor;
> >>>>    };
> >>>>      static void dp_panel_read_psr_cap(struct dp_panel_private *panel)
> >>>> @@ -43,9 +46,10 @@ static void dp_panel_read_psr_cap(struct
> >>>> dp_panel_private *panel)
> >>>>    static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
> >>>>    {
> >>>>        int rc;
> >>>> +    ssize_t rlen;
> >>>>        struct dp_panel_private *panel;
> >>>>        struct dp_link_info *link_info;
> >>>> -    u8 *dpcd, major, minor;
> >>>> +    u8 *dpcd, rx_feature;
> >>>>          panel = container_of(dp_panel, struct dp_panel_private,
> >>>> dp_panel);
> >>>>        dpcd = dp_panel->dpcd;
> >>>> @@ -53,10 +57,19 @@ static int dp_panel_read_dpcd(struct dp_panel
> >>>> *dp_panel)
> >>>>        if (rc)
> >>>>            return rc;
> >>>>    +    rlen = drm_dp_dpcd_read(panel->aux,
> >>>> DP_DPRX_FEATURE_ENUMERATION_LIST, &rx_feature, 1);
> >>>> +    if (rlen != 1) {
> >>>> +        panel->vsc_supported = false;
> >>>> +        pr_debug("failed to read DP_DPRX_FEATURE_ENUMERATION_LIST\n");
> >>>> +    } else {
> >>>> +        panel->vsc_supported = !!(rx_feature &
> >>>> DP_VSC_SDP_EXT_FOR_COLORIMETRY_SUPPORTED);
> >>>> +        pr_debug("vsc=%d\n", panel->vsc_supported);
> >>>> +    }
> >>>> +
> >>>>        link_info = &dp_panel->link_info;
> >>>>        link_info->revision = dpcd[DP_DPCD_REV];
> >>>> -    major = (link_info->revision >> 4) & 0x0f;
> >>>> -    minor = link_info->revision & 0x0f;
> >>>> +    panel->major = (link_info->revision >> 4) & 0x0f;
> >>>> +    panel->minor = link_info->revision & 0x0f;
> >>>>          link_info->rate = drm_dp_max_link_rate(dpcd);
> >>>>        link_info->num_lanes = drm_dp_max_lane_count(dpcd);
> >>>> @@ -69,7 +82,7 @@ static int dp_panel_read_dpcd(struct dp_panel
> >>>> *dp_panel)
> >>>>        if (link_info->rate > dp_panel->max_dp_link_rate)
> >>>>            link_info->rate = dp_panel->max_dp_link_rate;
> >>>>    -    drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", major, minor);
> >>>> +    drm_dbg_dp(panel->drm_dev, "version: %d.%d\n", panel->major,
> >>>> panel->minor);
> >>>>        drm_dbg_dp(panel->drm_dev, "link_rate=%d\n", link_info->rate);
> >>>>        drm_dbg_dp(panel->drm_dev, "lane_count=%d\n",
> >>>> link_info->num_lanes);
> >>>>    @@ -280,6 +293,20 @@ void dp_panel_tpg_config(struct dp_panel
> >>>> *dp_panel, bool enable)
> >>>>        dp_catalog_panel_tpg_enable(catalog,
> >>>> &panel->dp_panel.dp_mode.drm_mode);
> >>>>    }
> >>>>    +bool dp_panel_vsc_sdp_supported(struct dp_panel *dp_panel)
> >>>> +{
> >>>> +    struct dp_panel_private *panel;
> >>>> +
> >>>> +    if (!dp_panel) {
> >>>> +        pr_err("invalid input\n");
> >>>> +        return false;
> >>>> +    }
> >>>> +
> >>>> +    panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
> >>>> +
> >>>> +    return panel->major >= 1 && panel->minor >= 3 &&
> >>>> panel->vsc_supported;
> >
> > Anyway, this check is incorrect. Please compare the whole revision
> > against DP_DPCD_REV_13 instead of doing a maj/min comparison.
> >
> >>>> +}
> >>>> +
> >>>>    void dp_panel_dump_regs(struct dp_panel *dp_panel)
> >>>>    {
> >>>>        struct dp_catalog *catalog;
> >>>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h
> >>>> b/drivers/gpu/drm/msm/dp/dp_panel.h
> >>>> index 6ec68be9f2366..590eca5ce304b 100644
> >>>> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> >>>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> >>>> @@ -66,6 +66,7 @@ int dp_panel_get_modes(struct dp_panel *dp_panel,
> >>>>            struct drm_connector *connector);
> >>>>    void dp_panel_handle_sink_request(struct dp_panel *dp_panel);
> >>>>    void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable);
> >>>> +bool dp_panel_vsc_sdp_supported(struct dp_panel *dp_panel);
> >>>>      /**
> >>>>     * is_link_rate_valid() - validates the link rate
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry

