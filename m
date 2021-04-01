Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 026F6351A18
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 20:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234982AbhDAR6M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 13:58:12 -0400
Received: from mga11.intel.com ([192.55.52.93]:15100 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236526AbhDARys (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 13:54:48 -0400
IronPort-SDR: VbTwa833wtDfiYnYgPXW1eJ3ghvP3244r5/ispRtPtRBkx7Ud0dpGdEdRRiXD4j8zwpukZou+l
 Jz5cLs3aNSgw==
X-IronPort-AV: E=McAfee;i="6000,8403,9941"; a="188983926"
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; 
   d="scan'208";a="188983926"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2021 06:31:28 -0700
IronPort-SDR: 5tvB92jiRMGNLabXybckCSLFFBmaAQU7vUD+qPiiyyb+IZu2wKXYLWG2p2afaEIA03ZnIMWo2v
 zWr4SP+SYDZg==
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; 
   d="scan'208";a="419204532"
Received: from shergane-mobl.ger.corp.intel.com (HELO localhost) ([10.252.41.188])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2021 06:31:08 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?Q?K=C3=B6n?= =?utf-8?Q?ig?= 
        <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Harry Wentland <harry.wentland@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Ben Skeggs <bskeggs@redhat.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Oleg Vasilev <oleg.vasilev@intel.com>,
        Mikita Lipski <mikita.lipski@amd.com>,
        Eryk Brol <eryk.brol@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        "Jerry \(Fangzhi\) Zuo" <Jerry.Zuo@amd.com>,
        Chris Park <Chris.Park@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>, Joe Perches <joe@perches.com>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Swapnil Jakhade <sjakhade@cadence.com>,
        Yuti Amonkar <yamonkar@cadence.com>,
        Jyri Sarha <jsarha@ti.com>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Imre Deak <imre.deak@intel.com>,
        Matt Roper <matthew.d.roper@intel.com>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list\:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list\:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        "open list\:DRM DRIVERS FOR NVIDIA TEGRA" 
        <linux-tegra@vger.kernel.org>,
        "moderated list\:ARM\/ZYNQ ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 05/20] drm/dp: Add backpointer to drm_device in drm_dp_aux
In-Reply-To: <20210326203807.105754-6-lyude@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210326203807.105754-1-lyude@redhat.com> <20210326203807.105754-6-lyude@redhat.com>
Date:   Thu, 01 Apr 2021 16:31:05 +0300
Message-ID: <87eefum8rq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 26 Mar 2021, Lyude Paul <lyude@redhat.com> wrote:
>   * The @dev field should be set to a pointer to the device that implements the
> - * AUX channel.
> + * AUX channel. As well, the @drm_dev field should be set to the &drm_device
> + * that will be using this AUX channel as early as possible. For many graphics
> + * drivers this should happen before drm_dp_aux_init(), however it's perfectly
> + * fine to set this field later so long as it's assigned before calling
> + * drm_dp_aux_register().

Perhaps add a follow-up patch to actually ensure this is the case in
drm_dp_aux_register()?

>   *
>   * The @name field may be used to specify the name of the I2C adapter. If set to
>   * %NULL, dev_name() of @dev will be used.
> @@ -1877,6 +1883,7 @@ struct drm_dp_aux {
>  	const char *name;
>  	struct i2c_adapter ddc;
>  	struct device *dev;
> +	struct drm_device *drm_dev;

Bikeshed, I would probably have called it just drm for brevity, but no
strong feelings.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
