Return-Path: <linux-arm-msm+bounces-48730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DD592A3E01B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 17:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 154497A9E60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 16:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2123D204598;
	Thu, 20 Feb 2025 16:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CqjJcjLn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F631FECA3
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 16:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740067569; cv=none; b=nwOUcY8HPYDrgwWHs/nmiG1AGAemiYF5TgwVJUOKaA2fjZfx5Jj5gChHxf6Z6qQGc4VW37bURnuZKRZcRDrA0IoqVd3aFo0tlHH6kxr3J/+LPbNAlFpSdnSb6kghDGNp0+CqpRVCHRP/ALYG5RPfu20/K0IdaCGQVrTtanaDL5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740067569; c=relaxed/simple;
	bh=Nf2y1MMpVRCHrg7D1taBIhcNvsvuihqIz6ZQlJvVEx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EtEEVHS8cjtfS7J8EaX61qYm7vhooI4H5X94j9fSo8tHwZaLug+WDCVm5jUCDTqmFuByaTXNOCtQWNU5uWmc1N5Vu2gPkkfoWOHoaut+z+tHdtJT2LNOsOLBfntqC1qmTGhMN7xcQZCIfTnUUd1cUmmSt9gvd2H/zcWD9M5sVx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CqjJcjLn; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3091fecb637so9345121fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 08:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740067564; x=1740672364; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MkkB90jz+wMakqJRXGQ1C6qQcAHn7eE+AZf1sKmMuTw=;
        b=CqjJcjLn2QWgB++PwXinKvFD+FSE7EJFCNTiOfzrufCAGttLjZJaFNuuaqeV7sJwWh
         puGw/FcM40AiFV9M5HNbpIQQr2USkN/hDU29gy3ZxBflrjldLtgeRTt7Ry3t4KUhrEZF
         W1zWNu+t6Bb7niVmBRpWRa7KLReK1O2oS0jMKtw5sZfaFtFpMa+89ISDG+PJhjXuTVKJ
         ++nVSQBYrvQwddi7sr+b8Icn3PLPr4f2QJY8OmL2BVbkVsdVTDtAbAe1zHpXm7sOM+4R
         yXe/kL/R5u7zi1KyIJzvcKmZESqwRXgpEe+9YeK/ibnjIGgU4yjuZAnVYdqcDFW4DM4f
         iSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740067564; x=1740672364;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MkkB90jz+wMakqJRXGQ1C6qQcAHn7eE+AZf1sKmMuTw=;
        b=vOJSBHBzNAKkyiAWningZvhpx4aGaZUEz+iMLsdvr6/kIeGrTb/WKFcKabHBt+XAq5
         aGFRtv02SCs7iRU8d3586hBSUEIvKsyF8L2i1s3fDgJjmG9BddoTXiXw7M05VsrhuUaz
         6KK+7KuhiRRzs9jIA7R1qetCejK/CSQbW/d4IDuapB8zg8Y8qGD98U+tWegQfWkIePdG
         9WlDqQqjEtA950pb9TEq/zJP6zAnQ6OImp2P45uf+bWU0zsuZEL0u0ywIDobc1bGBshk
         cLhs/q7sAdHwux0+0cgst9wmsPspxQY8Tir27bX6a99W7IkDYbyKeY0gKjSrCiUCLeBS
         1SwQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8eAPtcdV4J22ObJm8goblZbPlK10La12t6/SeBPK3ycXWqMq2qsfcFBeYFE9N7X8B7RGI7q6e/qUXDomA@vger.kernel.org
X-Gm-Message-State: AOJu0YxN4Dkwpgg+vHSc9RDmEnW9FIVPLRqMckNPpRXnZ9bz3jWoLh3P
	6ThuTAouE3nu1KqIEOpDj+vkizuqVb3GnBIgXMtnRSQuJbEKNbp0ObwIwZBs72g=
X-Gm-Gg: ASbGnct/lZPANAz8TbUTkJm0+VaHXqfKUdRiksjHiKjPcVwaul6gPFNwuvYexA7+xUv
	rZkamSMzG6vU3F6eEIaMuilPhsBMDbuGNom7iOkxnBDkGhPUTUJB4EwZ19S1DHHPf1g26k1OZFw
	Frp52mIBkWhg5k2k3NGvEdo8AZRtFO7LOP9YTlG0qdxCbs3tM6ij1jkVbIvBuI4UxJ8KTkIVIFZ
	/9TeYTp2OS7EhzpndyOfYdP85XKJC5z2zFBP0qBK/oY0Jf4bY4lrsGNfNS0SzHDr5xwjWdg8Ubo
	bPJmV6HbGkCKUd2wdLjE4n8wEPfnJ65nT6nWVw3WsmCUWKZbS7kVxn7I5eEkorHy9sgRIwU=
X-Google-Smtp-Source: AGHT+IGijbQuJnFDPCWe6HgsMNO3D4A6C28HoopGz6paJ7IRT0n3o5ue7K6hTp+dIyALAFK8rj+fHw==
X-Received: by 2002:a05:6512:3dab:b0:545:d72:95e5 with SMTP id 2adb3069b0e04-5452fe2e42cmr8354282e87.7.1740067564235;
        Thu, 20 Feb 2025 08:06:04 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5482a61ac5dsm252e87.212.2025.02.20.08.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 08:06:03 -0800 (PST)
Date: Thu, 20 Feb 2025 18:06:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/5] drm/msm/dsi: Support DSC for dual panel case
Message-ID: <m7brftsrxdikfeumbjkubeeleezka7mwjbchxefqgs4ybtca5n@ge3ay2olagq2>
References: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
 <20250220-dual-dsi-v2-5-6c0038d5a2ef@linaro.org>
 <iibq3orsb7uf44luz2he2auox43ki42m2z4nnderyqlhypvfgo@pwqpvua6vuyo>
 <CABymUCNajuc8WnWgf2JehFYUY-MqxCYmD=By8nY-JppxYHsyNw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCNajuc8WnWgf2JehFYUY-MqxCYmD=By8nY-JppxYHsyNw@mail.gmail.com>

On Thu, Feb 20, 2025 at 11:42:28PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2025年2月20日周四 18:39写道：
> >
> > On Thu, Feb 20, 2025 at 06:07:56PM +0800, Jun Nie wrote:
> > > There is dual DSI case that every DSI link is connected to an independent
> > > panel. In this dual panel case, the frame width for DSC on each link should
> > > be halved to support the usage case.
> >
> > Isn't it the case for the DSI panel utilizing two DSI links?
> 
> The added case here is 2 DSI panel utilizing two DSI links, 1 DSI link
> in each panel.
> I assume default case is 1 panel with 2 DSI link, such as Marijn's case.

So it should be halved in your case, but not in Marijn's case? I can
suspect that if you are describing two DSI panels as a single instance,
you should also adjust drm_dsc_config accordingly (on the panel's side?)

Maybe drm_dsc_config.pic_width and drm_dsc_config.pic_height should be
set on the panel's side? But then, how will that function for the DSI
panels or bridges which can change the mode?

> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/dsi/dsi.h         |  3 ++-
> > >  drivers/gpu/drm/msm/dsi/dsi_host.c    | 13 +++++++++----
> > >  drivers/gpu/drm/msm/dsi/dsi_manager.c | 10 ++++++++--
> > >  3 files changed, 19 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> > > index 35b90c462f637111159b204269ce908614a21586..5a8978bed9f4ca897b418ced60194042d9dd8d05 100644
> > > --- a/drivers/gpu/drm/msm/dsi/dsi.h
> > > +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> > > @@ -74,7 +74,8 @@ void msm_dsi_host_enable_irq(struct mipi_dsi_host *host);
> > >  void msm_dsi_host_disable_irq(struct mipi_dsi_host *host);
> > >  int msm_dsi_host_power_on(struct mipi_dsi_host *host,
> > >                       struct msm_dsi_phy_shared_timings *phy_shared_timings,
> > > -                     bool is_bonded_dsi, struct msm_dsi_phy *phy);
> > > +                     bool is_bonded_dsi, bool is_dual_panel,
> > > +                     struct msm_dsi_phy *phy);
> > >  int msm_dsi_host_power_off(struct mipi_dsi_host *host);
> > >  int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
> > >                                 const struct drm_display_mode *mode);
> > > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > index 976c5d82a2efa0fc51657b8534675890be7c33a6..752a97f7181c30dade0a7745492bf16649b3197b 100644
> > > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > @@ -902,7 +902,8 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
> > >       }
> > >  }
> > >
> > > -static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> > > +static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi,
> > > +                          bool is_dual_panel)
> > >  {
> > >       struct drm_display_mode *mode = msm_host->mode;
> > >       u32 hs_start = 0, vs_start = 0; /* take sync start as 0 */
> > > @@ -947,7 +948,10 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> > >                       return;
> > >               }
> > >
> > > -             dsc->pic_width = mode->hdisplay;
> > > +             if (is_dual_panel)
> > > +                     dsc->pic_width = hdisplay;
> > > +             else
> > > +                     dsc->pic_width = mode->hdisplay;
> > >               dsc->pic_height = mode->vdisplay;
> > >               DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
> > >
> > > @@ -2369,7 +2373,8 @@ static void msm_dsi_sfpb_config(struct msm_dsi_host *msm_host, bool enable)
> > >
> > >  int msm_dsi_host_power_on(struct mipi_dsi_host *host,
> > >                       struct msm_dsi_phy_shared_timings *phy_shared_timings,
> > > -                     bool is_bonded_dsi, struct msm_dsi_phy *phy)
> > > +                     bool is_bonded_dsi, bool is_dual_panel,
> > > +                     struct msm_dsi_phy *phy)
> > >  {
> > >       struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> > >       const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
> > > @@ -2412,7 +2417,7 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
> > >               goto fail_disable_clk;
> > >       }
> > >
> > > -     dsi_timing_setup(msm_host, is_bonded_dsi);
> > > +     dsi_timing_setup(msm_host, is_bonded_dsi, is_dual_panel);
> > >       dsi_sw_reset(msm_host);
> > >       dsi_ctrl_enable(msm_host, phy_shared_timings, phy);
> > >
> > > diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > index be13bf682a9601484c9c14e8419563f37c2281ee..158b6cc907cb39cc3b182d3088b793d322a3527c 100644
> > > --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > @@ -24,6 +24,7 @@ struct msm_dsi_manager {
> > >       struct msm_dsi *dsi[DSI_MAX];
> > >
> > >       bool is_bonded_dsi;
> > > +     bool is_dual_panel;
> > >       bool is_sync_needed;
> > >       int master_dsi_link_id;
> > >  };
> > > @@ -31,6 +32,7 @@ struct msm_dsi_manager {
> > >  static struct msm_dsi_manager msm_dsim_glb;
> > >
> > >  #define IS_BONDED_DSI()              (msm_dsim_glb.is_bonded_dsi)
> > > +#define IS_DUAL_PANEL()              (msm_dsim_glb.is_dual_panel)
> > >  #define IS_SYNC_NEEDED()     (msm_dsim_glb.is_sync_needed)
> > >  #define IS_MASTER_DSI_LINK(id)       (msm_dsim_glb.master_dsi_link_id == id)
> > >
> > > @@ -55,6 +57,7 @@ static int dsi_mgr_parse_of(struct device_node *np, int id)
> > >               msm_dsim->is_bonded_dsi = of_property_read_bool(np, "qcom,dual-dsi-mode");
> > >
> > >       if (msm_dsim->is_bonded_dsi) {
> > > +             msm_dsim->is_dual_panel = of_property_read_bool(np, "qcom,dual-panel");
> > >               if (of_property_read_bool(np, "qcom,master-dsi"))
> > >                       msm_dsim->master_dsi_link_id = id;
> > >               if (!msm_dsim->is_sync_needed)
> > > @@ -214,6 +217,7 @@ static int dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
> > >       struct mipi_dsi_host *host = msm_dsi->host;
> > >       struct msm_dsi_phy_shared_timings phy_shared_timings[DSI_MAX];
> > >       bool is_bonded_dsi = IS_BONDED_DSI();
> > > +     bool is_dual_panel = IS_DUAL_PANEL();
> > >       int ret;
> > >
> > >       DBG("id=%d", id);
> > > @@ -222,7 +226,8 @@ static int dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
> > >       if (ret)
> > >               goto phy_en_fail;
> > >
> > > -     ret = msm_dsi_host_power_on(host, &phy_shared_timings[id], is_bonded_dsi, msm_dsi->phy);
> > > +     ret = msm_dsi_host_power_on(host, &phy_shared_timings[id],
> > > +                                 is_bonded_dsi, is_dual_panel, msm_dsi->phy);
> > >       if (ret) {
> > >               pr_err("%s: power on host %d failed, %d\n", __func__, id, ret);
> > >               goto host_on_fail;
> > > @@ -230,7 +235,8 @@ static int dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
> > >
> > >       if (is_bonded_dsi && msm_dsi1) {
> > >               ret = msm_dsi_host_power_on(msm_dsi1->host,
> > > -                             &phy_shared_timings[DSI_1], is_bonded_dsi, msm_dsi1->phy);
> > > +                             &phy_shared_timings[DSI_1], is_bonded_dsi,
> > > +                             is_dual_panel, msm_dsi1->phy);
> > >               if (ret) {
> > >                       pr_err("%s: power on host1 failed, %d\n",
> > >                                                       __func__, ret);
> > >
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

