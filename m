Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 185624D8F5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Mar 2022 23:12:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245502AbiCNWNR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Mar 2022 18:13:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242461AbiCNWNQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Mar 2022 18:13:16 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 008D23C72D
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Mar 2022 15:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647295926; x=1678831926;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=TmF4FvJhy8r4L46VPu1Ph2AwpXhixIyOHXK6V+ZN30g=;
  b=ctMmG9QpJDihurcd/VXfdsPESxxo4Qew2LYDIcLXOMgD44czDm3GPZSr
   QhumwLrjvNoEJ3qGkQlYOZS6rwHQ7I2w4WRmMQh1wVBWMpv/snfGIK3Ik
   KRWjhen0V0OZRGD/Yh1kQE8X0y0I3JQzr2CkJ7pnlgO09HJMSHFVczKLb
   3Jib3F/A93xvF5m5ZW9Q/VYvOklCZ7dc6R/z9Z0mRLWGkBaEYGtrVMII2
   mqsE1GPgWcA8CYfw5jJq64DyE66G43glbzKNHdOZNuTxZ/1msJJLgJoAv
   el8oEjWxxJy8NdTsLGydrXp0qD5PecxjKWche2BqiLTiC41Xi4BKdssE+
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="319378231"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; 
   d="scan'208";a="319378231"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 15:11:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; 
   d="scan'208";a="556641142"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
  by orsmga008.jf.intel.com with SMTP; 14 Mar 2022 15:11:44 -0700
Received: by stinkbox (sSMTP sendmail emulation); Tue, 15 Mar 2022 00:11:43 +0200
Date:   Tue, 15 Mar 2022 00:11:43 +0200
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
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
        Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
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
Subject: Re: [PATCH 00/22] drm: Review of mode copies
Message-ID: <Yi+9n0eGn3rNKb4X@intel.com>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
X-Patchwork-Hint: comment
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 18, 2022 at 12:03:41PM +0200, Ville Syrjala wrote:
>   drm: Add drm_mode_init()
>   drm/bridge: Use drm_mode_copy()
>   drm/imx: Use drm_mode_duplicate()
>   drm/panel: Use drm_mode_duplicate()
>   drm/vc4: Use drm_mode_copy()
These have been pushed to drm-misc-next.

>   drm/amdgpu: Remove pointless on stack mode copies
>   drm/amdgpu: Use drm_mode_init() for on-stack modes
>   drm/amdgpu: Use drm_mode_copy()
amdgpu ones are reviewed, but I'll leave them for the
AMD folks to push to whichever tree they prefer.


The rest are still in need of review:
>   drm/radeon: Use drm_mode_copy()
>   drm/gma500: Use drm_mode_copy()
>   drm/hisilicon: Use drm_mode_init() for on-stack modes
>   drm/msm: Nuke weird on stack mode copy
>   drm/msm: Use drm_mode_init() for on-stack modes
>   drm/msm: Use drm_mode_copy()
>   drm/mtk: Use drm_mode_init() for on-stack modes
>   drm/rockchip: Use drm_mode_copy()
>   drm/sti: Use drm_mode_copy()
>   drm/tilcdc: Use drm_mode_copy()
>   drm/i915: Use drm_mode_init() for on-stack modes
>   drm/i915: Use drm_mode_copy()
>   drm: Use drm_mode_init() for on-stack modes
>   drm: Use drm_mode_copy()

-- 
Ville Syrjälä
Intel
