Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85CA74BB61F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Feb 2022 11:04:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233303AbiBRKEc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Feb 2022 05:04:32 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232739AbiBRKEb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Feb 2022 05:04:31 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74B77366A7
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 02:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645178654; x=1676714654;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=stdZieqOPeTYM4fZPShDTH9sPVJsu1F9iRmFq4q1S1Y=;
  b=NwOCgmaw9Ft0ylpdKWqDHE0Iyn2XoP0msp8vjTlmn3ry+StpF0N1SVgW
   j9pxtLChGPRzG4DPw5FMm/eG+1PXCIDzdf9XGqYZWzaGTcAPtqqQMe5tE
   qB2SgN/lTSO/Fg5ZJkwUZsr/OyVoygBL54o9bnYXSlRfUn7l+VvaDcL2j
   AbzwLEbafleJWei8zc6+Ps7m/5OT5BJHjtNfEQbl6YISkw2GQYr8dJzZF
   kfxZ8yYaDT1knJfw7gu1IM35Ls+qYTibWXRhwUa9CkTaGTOfj/TZMqtiY
   5ax7E1TV2nq7U9nYpIs6B6UscSNikNY50I03/RK7jGYFkO3X/4IGUaWRy
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="231734057"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; 
   d="scan'208";a="231734057"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2022 02:04:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; 
   d="scan'208";a="682442318"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
  by fmsmga001.fm.intel.com with SMTP; 18 Feb 2022 02:04:04 -0800
Received: by stinkbox (sSMTP sendmail emulation); Fri, 18 Feb 2022 12:04:03 +0200
From:   Ville Syrjala <ville.syrjala@linux.intel.com>
To:     dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        amd-gfx@lists.freedesktop.org,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Aurabindo Pillai <aurabindo.pillai@amd.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Emma Anholt <emma@anholt.net>, freedreno@lists.freedesktop.org,
        Harry Wentland <harry.wentland@amd.com>,
        =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Leo Li <sunpeng.li@amd.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Nikola Cornij <nikola.cornij@amd.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <robdclark@gmail.com>,
        Robert Foss <robert.foss@linaro.org>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Sandy Huang <hjc@rock-chips.com>, Sean Paul <sean@poorly.run>,
        Thierry Reding <thierry.reding@gmail.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>
Subject: [PATCH 00/22] drm: Review of mode copies
Date:   Fri, 18 Feb 2022 12:03:41 +0200
Message-Id: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

I might be taking this a bit too far, but the lack of
consistency in our methods to copy drm_display_mode
structs around is bugging me.

The main worry is the embedded list head, which if
clobbered could lead to list corruption. I'd also
prefer to make sure even the valid list heads don't
propagate between copies since that makes no sense.

While going through some of the code I also spotted
some very weird on stack copies being made for no
reason at all. I elimininated a few of them here,
but there could certainly be more lurking in the
shadows.

Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Chen Feng <puck.chen@hisilicon.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Emma Anholt <emma@anholt.net>
Cc: freedreno@lists.freedesktop.org
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jyri Sarha <jyri.sarha@iki.fi>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Nikola Cornij <nikola.cornij@amd.com>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Tian Tao <tiantao6@hisilicon.com>
Cc: Tomi Valkeinen <tomba@kernel.org>
Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>

Ville Syrjälä (22):
  drm: Add drm_mode_init()
  drm/amdgpu: Remove pointless on stack mode copies
  drm/amdgpu: Use drm_mode_init() for on-stack modes
  drm/amdgpu: Use drm_mode_copy()
  drm/radeon: Use drm_mode_copy()
  drm/bridge: Use drm_mode_copy()
  drm/gma500: Use drm_mode_copy()
  drm/hisilicon: Use drm_mode_init() for on-stack modes
  drm/imx: Use drm_mode_duplicate()
  drm/msm: Nuke weird on stack mode copy
  drm/msm: Use drm_mode_init() for on-stack modes
  drm/msm: Use drm_mode_copy()
  drm/mtk: Use drm_mode_init() for on-stack modes
  drm/rockchip: Use drm_mode_copy()
  drm/sti: Use drm_mode_copy()
  drm/tilcdc: Use drm_mode_copy()
  drm/vc4: Use drm_mode_copy()
  drm/i915: Use drm_mode_init() for on-stack modes
  drm/i915: Use drm_mode_copy()
  drm/panel: Use drm_mode_duplicate()
  drm: Use drm_mode_init() for on-stack modes
  drm: Use drm_mode_copy()

 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |  4 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 41 ++++++++++---------
 drivers/gpu/drm/bridge/nwl-dsi.c              |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  2 +-
 drivers/gpu/drm/bridge/tc358767.c             |  2 +-
 drivers/gpu/drm/drm_crtc_helper.c             | 12 +++---
 drivers/gpu/drm/drm_edid.c                    |  8 +++-
 drivers/gpu/drm/drm_modes.c                   | 21 +++++++++-
 drivers/gpu/drm/drm_vblank.c                  |  2 +-
 drivers/gpu/drm/gma500/oaktrail_crtc.c        |  8 +---
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c  |  2 +-
 drivers/gpu/drm/i915/display/intel_display.c  | 20 +++++----
 drivers/gpu/drm/imx/imx-ldb.c                 |  3 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |  2 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  2 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  9 ++--
 drivers/gpu/drm/msm/dp/dp_display.c           |  2 +-
 drivers/gpu/drm/msm/dp/dp_drm.c               | 10 ++---
 drivers/gpu/drm/panel/panel-truly-nt35597.c   |  3 +-
 .../gpu/drm/panel/panel-visionox-rm69299.c    |  4 +-
 drivers/gpu/drm/radeon/radeon_connectors.c    |  4 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c        |  2 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c          |  2 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c        |  2 +-
 drivers/gpu/drm/sti/sti_dvo.c                 |  2 +-
 drivers/gpu/drm/sti/sti_hda.c                 |  2 +-
 drivers/gpu/drm/sti/sti_hdmi.c                |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c          |  2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                |  5 +--
 include/drm/drm_modes.h                       |  2 +
 30 files changed, 105 insertions(+), 79 deletions(-)

-- 
2.34.1

