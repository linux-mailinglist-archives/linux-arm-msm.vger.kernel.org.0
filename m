Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23CB446C2A3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Dec 2021 19:22:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239597AbhLGSZv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Dec 2021 13:25:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240266AbhLGSZu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Dec 2021 13:25:50 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC135C0617A1
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Dec 2021 10:22:19 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id o13so31234105wrs.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Dec 2021 10:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=08Y7iJI/PLTRM2a75Lt/X18n1ghFVyrjUSIXA87jB1c=;
        b=NaDI0vUgbYnBOYtMUBltHLOUYkBXWIXJLzv1PJ7Qa9rHdOKP9n7wD2RgoiI26BUkdU
         CZEv7LjjD++6EkU7BPSrcm5S5wjFQxbu6pQpfZBClnaei3kVbRcKDTFCdpA2g/elj3oJ
         9KfrkXcOBOAK/G7Zr0zvdI5whTEkEdr8KfEX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=08Y7iJI/PLTRM2a75Lt/X18n1ghFVyrjUSIXA87jB1c=;
        b=YfBWxcl2Dke0v2gGduz5X9MF5qRmd/f1zy0/gj/RFJy9Gdk8Ebj6syomeHZrz1XH6L
         O+msqUjwTWd3ZWv+f3Q2puDKd7Cdiq06U641LS+rt5j4j1LS0ak807AtkE85xyr8MT9O
         JQ3C5ILRvjiH3g0xfdR2lr5uoUiJGwnbErthiZHdPCgm4vG19XO8xW/XBLanH2md10ce
         UTBPPqzJfiLjZ94uzrbw8ZBjjklQ1u+kw3ICF/Rbl4rrCBwJD66nrOXBOkoFOKjV/YyF
         mMn5E0JFEf5019kIDJxSn4d6m9lO/wAFvUlki7NjG+tiy8AKLpsKK0T8+Ou33+TIzT74
         tAGw==
X-Gm-Message-State: AOAM533kq94z6FhUgrPaSakXevIX03NO9mFLsOTz/cEdZf5UTk1b6s4U
        5D+doMPHw5ADnAK/W283X9oqlA==
X-Google-Smtp-Source: ABdhPJxK2mhzgF3YMS/fG40gJ9DDy/bEcttiC7rT6MkCLhX411tsNH3w2Tru9t1nhhNXbQLQaKdz8Q==
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr54445987wrd.362.1638901338335;
        Tue, 07 Dec 2021 10:22:18 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id w4sm421952wrs.88.2021.12.07.10.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 10:22:17 -0800 (PST)
Date:   Tue, 7 Dec 2021 19:22:15 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Arnd Bergmann <arnd@arndb.de>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Chen Feng <puck.chen@hisilicon.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Emma Anholt <emma@anholt.net>,
        Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
        Inki Dae <inki.dae@samsung.com>,
        James Qian Wang <james.qian.wang@arm.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Joerg Roedel <joro@8bytes.org>,
        John Stultz <john.stultz@linaro.org>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-pm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Mark Brown <broonie@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Sandy Huang <hjc@rock-chips.com>,
        Saravana Kannan <saravanak@google.com>,
        Sebastian Reichel <sre@kernel.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Takashi Iwai <tiwai@suse.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Tomas Winkler <tomas.winkler@intel.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        Will Deacon <will@kernel.org>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Yong Wu <yong.wu@mediatek.com>,
        Vitaly Lubart <vitaly.lubart@intel.com>,
        Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4 00/34] component: Make into an aggregate bus
Message-ID: <Ya+mV/zuRVVIGVy1@phenom.ffwll.local>
Mail-Followup-To: Stephen Boyd <swboyd@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Arnd Bergmann <arnd@arndb.de>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Chen Feng <puck.chen@hisilicon.com>, Chen-Yu Tsai <wens@csie.org>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Emma Anholt <emma@anholt.net>,
        Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
        Inki Dae <inki.dae@samsung.com>,
        James Qian Wang <james.qian.wang@arm.com>,
        Jaroslav Kysela <perex@perex.cz>, Joerg Roedel <joro@8bytes.org>,
        John Stultz <john.stultz@linaro.org>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-pm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Sandy Huang <hjc@rock-chips.com>,
        Saravana Kannan <saravanak@google.com>,
        Sebastian Reichel <sre@kernel.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Takashi Iwai <tiwai@suse.com>, Tian Tao <tiantao6@hisilicon.com>,
        Tomas Winkler <tomas.winkler@intel.com>,
        Tomi Valkeinen <tomba@kernel.org>, Will Deacon <will@kernel.org>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Yong Wu <yong.wu@mediatek.com>,
        Vitaly Lubart <vitaly.lubart@intel.com>,
        Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20211202222732.2453851-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211202222732.2453851-1-swboyd@chromium.org>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 02, 2021 at 02:26:58PM -0800, Stephen Boyd wrote:
> This series is from discussion we had on reordering the device lists for
> drm shutdown paths[1]. I've introduced an 'aggregate' bus that we put
> the aggregate device onto and then we probe the aggregate device once
> all the components are probed and call component_add(). The probe/remove
> hooks are where the bind/unbind calls go, and then a shutdown hook is
> added that can be used to shutdown the drm display pipeline at the right
> time.
> 
> This works for me on my sc7180 board. I no longer get a warning from i2c
> at shutdown that we're trying to make an i2c transaction after the i2c
> bus has been shutdown. There's more work to do on the msm drm driver to
> extract component device resources like clks, regulators, etc. out of
> the component bind function into the driver probe but I wanted to move
> everything over now in other component drivers before tackling that
> problem.
> 
> Tested-by tags would be appreciated, and Acked-by/Reviewed-by tags too.

Thanks for pushing this forward. Unfortunately I'm completely burried and
it's just not improving, so merge plan:

- please get Greg KH to ack the bus/driver core stuff

- please get one of the drm-misc committers we have from Google's Chromeos
  team (there should be a few by now) to review&push this.

Otherwise I fear this might get stuck and I'd really like to avoid that.

Cheers, Daniel

> 
> Changes since v3 (https://lore.kernel.org/r/20211026000044.885195-1-swboyd@chromium.org):
>  - Picked up tags
>  - Rebased to v5.16-rc2
>  - Updated component.c for a few new patches there
>  - Dropped a conversion patch
>  - Added a conversion patch
> 
> Changes since v2 (https://lore.kernel.org/r/20211006193819.2654854-1-swboyd@chromium.org):
>  - Picked up acks
>  - Fixed build warnings/errors
>  - Reworked patch series to rename 'master' in a different patch
> 
> Changes since v1 (https://lore.kernel.org/r/20210520002519.3538432-1-swboyd@chromium.org):
>  - Use devlink to connect components to the aggregate device
>  - Don't set the registering device as a parent of the aggregate device
>  - New patch for bind_component/unbind_component ops that takes the
>    aggregate device
>  - Convert all drivers in the tree to use the aggregate driver approach
>  - Allow one aggregate driver to be used for multiple aggregate devices
> 
> [1] https://lore.kernel.org/r/20210508074118.1621729-1-swboyd@chromium.org
> 
> 
> Stephen Boyd (34):
>   component: Introduce struct aggregate_device
>   component: Remove most references to 'master'
>   component: Introduce the aggregate bus_type
>   component: Move struct aggregate_device out to header file
>   component: Add {bind,unbind}_component() ops that take aggregate
>     device
>   drm/of: Add a drm_of_aggregate_probe() API
>   drm/msm: Migrate to aggregate driver
>   drm/komeda: Migrate to aggregate driver
>   drm/arm/hdlcd: Migrate to aggregate driver
>   drm/malidp: Migrate to aggregate driver
>   drm/armada: Migrate to aggregate driver
>   drm/etnaviv: Migrate to aggregate driver
>   drm/kirin: Migrate to aggregate driver
>   drm/exynos: Migrate to aggregate driver
>   drm/imx: Migrate to aggregate driver
>   drm/ingenic: Migrate to aggregate driver
>   drm/mcde: Migrate to aggregate driver
>   drm/mediatek: Migrate to aggregate driver
>   drm/meson: Migrate to aggregate driver
>   drm/omap: Migrate to aggregate driver
>   drm/rockchip: Migrate to aggregate driver
>   drm/sti: Migrate to aggregate driver
>   drm/sun4i: Migrate to aggregate driver
>   drm/tilcdc: Migrate to aggregate driver
>   drm/vc4: Migrate to aggregate driver
>   iommu/mtk: Migrate to aggregate driver
>   mei: Migrate to aggregate driver
>   power: supply: ab8500: Migrate to aggregate driver
>   fbdev: omap2: Migrate to aggregate driver
>   sound: hdac: Migrate to aggregate driver
>   ASoC: codecs: wcd938x: Migrate to aggregate driver
>   mei: pxp: Migrate to aggregate driver
>   component: Get rid of drm_of_component_probe()
>   component: Remove component_master_ops and friends
> 
>  drivers/base/component.c                      | 544 ++++++++++--------
>  .../gpu/drm/arm/display/komeda/komeda_drv.c   |  20 +-
>  drivers/gpu/drm/arm/hdlcd_drv.c               |  21 +-
>  drivers/gpu/drm/arm/malidp_drv.c              |  21 +-
>  drivers/gpu/drm/armada/armada_drv.c           |  23 +-
>  drivers/gpu/drm/drm_drv.c                     |   2 +-
>  drivers/gpu/drm/drm_of.c                      |  18 +-
>  drivers/gpu/drm/etnaviv/etnaviv_drv.c         |  20 +-
>  drivers/gpu/drm/exynos/exynos_drm_drv.c       |  21 +-
>  .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  20 +-
>  drivers/gpu/drm/imx/imx-drm-core.c            |  20 +-
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  25 +-
>  drivers/gpu/drm/mcde/mcde_drv.c               |  23 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  20 +-
>  drivers/gpu/drm/meson/meson_drv.c             |  21 +-
>  drivers/gpu/drm/msm/msm_drv.c                 |  46 +-
>  drivers/gpu/drm/omapdrm/dss/dss.c             |  20 +-
>  drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  20 +-
>  drivers/gpu/drm/sti/sti_drv.c                 |  20 +-
>  drivers/gpu/drm/sun4i/sun4i_drv.c             |  26 +-
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c           |  28 +-
>  drivers/gpu/drm/vc4/vc4_drv.c                 |  20 +-
>  drivers/iommu/mtk_iommu.c                     |  14 +-
>  drivers/iommu/mtk_iommu.h                     |   6 +-
>  drivers/iommu/mtk_iommu_v1.c                  |  14 +-
>  drivers/misc/mei/hdcp/mei_hdcp.c              |  22 +-
>  drivers/misc/mei/pxp/mei_pxp.c                |  22 +-
>  drivers/power/supply/ab8500_charger.c         |  22 +-
>  drivers/video/fbdev/omap2/omapfb/dss/dss.c    |  20 +-
>  include/drm/drm_of.h                          |  10 +-
>  include/linux/component.h                     |  92 ++-
>  sound/hda/hdac_component.c                    |  21 +-
>  sound/soc/codecs/wcd938x.c                    |  20 +-
>  33 files changed, 772 insertions(+), 490 deletions(-)
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: Chen Feng <puck.chen@hisilicon.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Emma Anholt <emma@anholt.net>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Heiko St�bner" <heiko@sntech.de>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: James Qian Wang (Arm Technology China) <james.qian.wang@arm.com>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: John Stultz <john.stultz@linaro.org>
> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: Jyri Sarha <jyri.sarha@iki.fi>
> Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: <linux-fbdev@vger.kernel.org>
> Cc: <linux-omap@vger.kernel.org>
> Cc: <linux-pm@vger.kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Tian Tao <tiantao6@hisilicon.com>
> Cc: Tomas Winkler <tomas.winkler@intel.com>
> Cc: Tomi Valkeinen <tomba@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Xinliang Liu <xinliang.liu@linaro.org>
> Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> Cc: Yong Wu <yong.wu@mediatek.com>
> Cc: Vitaly Lubart <vitaly.lubart@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> 
> base-commit: 136057256686de39cc3a07c2e39ef6bc43003ff6
> -- 
> https://chromeos.dev
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
