Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8D17B6554
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2019 16:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbfIROB1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Sep 2019 10:01:27 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54524 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbfIROB1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Sep 2019 10:01:27 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 87FE728D029
Subject: Re: [PATCH RESEND 00/14] Next round of associating ddc adapters with
 connectors
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, Anthony Koo <Anthony.Koo@amd.com>,
        Emil Velikov <emil.velikov@collabora.com>,
        linux-samsung-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        David Francis <David.Francis@amd.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
        Jonas Karlman <jonas@kwiboo.se>, Leo Li <sunpeng.li@amd.com>,
        linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        Mamta Shukla <mamtashukla555@gmail.com>,
        linux-mediatek@lists.infradead.org, Jyri Sarha <jsarha@ti.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sean Paul <sean@poorly.run>,
        linux-arm-kernel@lists.infradead.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        amd-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
        Todor Tomov <todor.tomov@linaro.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Shawn Guo <shawnguo@kernel.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <cover.1566845537.git.andrzej.p@collabora.com>
Message-ID: <0799e830-400d-4ced-7108-c8fcfd5ef8c0@collabora.com>
Date:   Wed, 18 Sep 2019 16:01:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1566845537.git.andrzej.p@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi All,

A gentle ping.

Andrzej

W dniu 26.08.2019 o 21:25, Andrzej Pietrasiewicz pisze:
> I'm resending the patches which have somehow got lost: one patch
> from Geert and 13 patches from me.
> 
> Geert's patch updates the error message to reflect the actually
> called function's name.
> 
> Most of patches from me have their Acked-by and Reviewed-by tags
> and deal with providing a ddc symlink in connector's sysfs directory.
> 
> Rebased onto drm-misc-next as of 26th August.
> 
> Andrzej Pietrasiewicz (13):
>    drm/radeon: Provide ddc symlink in connector sysfs directory
>    drm/amdgpu: Provide ddc symlink in dm connector's sysfs directory
>    drm/exynos: Provide ddc symlink in connector's sysfs
>    drm: rockchip: Provide ddc symlink in rk3066_hdmi sysfs directory
>    drm: rockchip: Provide ddc symlink in inno_hdmi sysfs directory
>    drm/msm/hdmi: Provide ddc symlink in hdmi connector sysfs directory
>    drm/mediatek: Provide ddc symlink in hdmi connector sysfs directory
>    drm/tegra: Provide ddc symlink in output connector sysfs directory
>    drm/vc4: Provide ddc symlink in connector sysfs directory
>    drm: zte: Provide ddc symlink in hdmi connector sysfs directory
>    drm: zte: Provide ddc symlink in vga connector sysfs directory
>    drm/tilcdc: Provide ddc symlink in connector sysfs directory
>    drm/i915: Provide ddc symlink in hdmi connector sysfs directory
> 
> Geert Uytterhoeven (1):
>    drm/bridge: ti-tfp410: Update drm_connector_init_with_ddc() error
>      message
> 
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   5 +-
>   drivers/gpu/drm/bridge/ti-tfp410.c            |   3 +-
>   drivers/gpu/drm/exynos/exynos_hdmi.c          |   6 +-
>   drivers/gpu/drm/i915/display/intel_hdmi.c     |  12 +-
>   drivers/gpu/drm/mediatek/mtk_hdmi.c           |   7 +-
>   drivers/gpu/drm/msm/hdmi/hdmi_connector.c     |   6 +-
>   drivers/gpu/drm/radeon/radeon_connectors.c    | 143 +++++++++++++-----
>   drivers/gpu/drm/rockchip/inno_hdmi.c          |   6 +-
>   drivers/gpu/drm/rockchip/rk3066_hdmi.c        |   7 +-
>   drivers/gpu/drm/tegra/hdmi.c                  |   7 +-
>   drivers/gpu/drm/tegra/sor.c                   |   7 +-
>   drivers/gpu/drm/tilcdc/tilcdc_tfp410.c        |   6 +-
>   drivers/gpu/drm/vc4/vc4_hdmi.c                |  12 +-
>   drivers/gpu/drm/zte/zx_hdmi.c                 |   6 +-
>   drivers/gpu/drm/zte/zx_vga.c                  |   6 +-
>   15 files changed, 168 insertions(+), 71 deletions(-)
> 

