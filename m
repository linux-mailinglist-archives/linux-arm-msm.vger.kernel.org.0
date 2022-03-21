Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 310914E336E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Mar 2022 23:56:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231142AbiCUWzH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Mar 2022 18:55:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230273AbiCUWys (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Mar 2022 18:54:48 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A2D749923
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Mar 2022 15:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647902290; x=1679438290;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=NGivaWeKRY3MksBC8EwXE84CdRJB3qnQz8+tE0sTF7w=;
  b=V2uKyly29TUd6NiBZrWGoI9vbBqYVpbAZRQ/uouzOEEyT1w4TkNv/lRl
   rJMWqhcC55qYoYwsk587CZj0kruglwvamOY+XgXrQqPGkotWE8Nlj1uZr
   YGMbbPRI92J4Yn8fBuJXxJkERGQXglwzP+Fp826pWRTP8ykiPn+OWdBLu
   9TxZWRKl/DzxCV4fUo5vk+fut7zUg4zswBMni4uesv/jR98TLZlS6//ei
   joBjv6qZIVAR0RcpLAsSDibJYWWjUfen7wAmIkanLG4hPPeTld3/NRnEf
   +ZJwQmVRn7MHOpj6U+nEMPKCaFx0tpXD3fB8HoR/Q1qDcySmHXf9RBtsh
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10293"; a="257855459"
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; 
   d="scan'208";a="257855459"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2022 15:38:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,199,1643702400"; 
   d="scan'208";a="560073382"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.61])
  by orsmga008.jf.intel.com with SMTP; 21 Mar 2022 15:37:58 -0700
Received: by stinkbox (sSMTP sendmail emulation); Tue, 22 Mar 2022 00:37:57 +0200
Date:   Tue, 22 Mar 2022 00:37:57 +0200
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
        Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
        Emma Anholt <emma@anholt.net>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        linux-rockchip@lists.infradead.org,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Aurabindo Pillai <aurabindo.pillai@amd.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>, Leo Li <sunpeng.li@amd.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Maxime Ripard <mripard@kernel.org>,
        Nikola Cornij <nikola.cornij@amd.com>,
        John Stultz <john.stultz@linaro.org>,
        Sean Paul <sean@poorly.run>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Tomi Valkeinen <tomba@kernel.org>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Sandy Huang <hjc@rock-chips.com>,
        Robert Foss <robert.foss@linaro.org>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alex Deucher <alexander.deucher@amd.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 00/22] drm: Review of mode copies
Message-ID: <Yjj+RSVBWk6UO2C7@intel.com>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <Yi+9n0eGn3rNKb4X@intel.com>
 <CADnq5_NS07TPBWSnETRhjzqtX_oUuCu86ewurFT3MJO=PcLAuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_NS07TPBWSnETRhjzqtX_oUuCu86ewurFT3MJO=PcLAuQ@mail.gmail.com>
X-Patchwork-Hint: comment
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 15, 2022 at 02:52:38PM -0400, Alex Deucher wrote:
> On Mon, Mar 14, 2022 at 6:12 PM Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
> >
> > On Fri, Feb 18, 2022 at 12:03:41PM +0200, Ville Syrjala wrote:
> > >   drm: Add drm_mode_init()
> > >   drm/bridge: Use drm_mode_copy()
> > >   drm/imx: Use drm_mode_duplicate()
> > >   drm/panel: Use drm_mode_duplicate()
> > >   drm/vc4: Use drm_mode_copy()
> > These have been pushed to drm-misc-next.
> >
> > >   drm/amdgpu: Remove pointless on stack mode copies
> > >   drm/amdgpu: Use drm_mode_init() for on-stack modes
> > >   drm/amdgpu: Use drm_mode_copy()
> > amdgpu ones are reviewed, but I'll leave them for the
> > AMD folks to push to whichever tree they prefer.
> 
> I pulled patches 2, 4, 5 into my tree.

Thanks.

> For 3, I'm happy to have it
> land via drm-misc with the rest of the mode_init changes if you'd
> prefer.

Either way works for me. I don't yet have reviews yet for
the other drivers, so I'll proably hold off for a bit more
at least. And the i915 patch I'll be merging via drm-intel.

> > >   drm/radeon: Use drm_mode_copy()
> > >   drm/gma500: Use drm_mode_copy()
> > >   drm/tilcdc: Use drm_mode_copy()
> > >   drm/i915: Use drm_mode_copy()

Those are now all in.

Which leaves us with these stragglers:
> > >   drm/hisilicon: Use drm_mode_init() for on-stack modes
> > >   drm/msm: Nuke weird on stack mode copy
> > >   drm/msm: Use drm_mode_init() for on-stack modes
> > >   drm/msm: Use drm_mode_copy()
> > >   drm/mtk: Use drm_mode_init() for on-stack modes
> > >   drm/rockchip: Use drm_mode_copy()
> > >   drm/sti: Use drm_mode_copy()
> > >   drm: Use drm_mode_init() for on-stack modes
> > >   drm: Use drm_mode_copy()

-- 
Ville Syrjälä
Intel
