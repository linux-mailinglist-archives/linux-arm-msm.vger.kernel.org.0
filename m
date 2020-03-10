Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 793DF1805B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 19:00:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgCJSAQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 14:00:16 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:38876 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726271AbgCJSAQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 14:00:16 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 8E7CC804E7;
        Tue, 10 Mar 2020 19:00:12 +0100 (CET)
Date:   Tue, 10 Mar 2020 19:00:11 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        sean@poorly.run, seanpaul@chromium.org
Subject: Re: [PATCH v4 2/2] drm/panel: add support for rm69299 visionox panel
 driver
Message-ID: <20200310180011.GE3785@ravnborg.org>
References: <20200306103628.8998-1-harigovi@codeaurora.org>
 <20200306103628.8998-3-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200306103628.8998-3-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
        a=LpQP-O61AAAA:8 a=Vd_DeyHlCK5Jz4Cg7z0A:9 a=CjuIK1q_8ugA:10
        a=E9Po1WZjFZOl8hwRPBS3:22 a=pioyyrs4ZptJ924tMmac:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Harigovindan

Thanks for the v4. nice work!

There is one tiny detail to fix.

With this fixed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

On Fri, Mar 06, 2020 at 04:06:28PM +0530, Harigovindan P wrote:
> Add support for Visionox panel driver.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
> 
> Changes in v2:
> 	- Dropping redundant space in Kconfig(Sam Ravnborg).
> 	- Changing structure for include files(Sam Ravnborg).
> 	- Removing backlight related code and functions(Sam Ravnborg).
> 	- Removing repeated printing of error message(Sam Ravnborg).
> 	- Adding drm_connector as an argument for get_modes function.
> Changes in v3:
> 	- Adding arguments for drm_panel_init to support against mainline.
> Changes in v4:
> 	- Removing error messages from regulator_set_load.
> 	- Removing dev struct entry.
> 	- Removing checks.
> 	- Dropping empty comment lines.
> 
>  drivers/gpu/drm/panel/Kconfig                 |   8 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-visionox-rm69299.c    | 322 ++++++++++++++++++
>  3 files changed, 331 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-visionox-rm69299.c
> 
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index ae44ac2ec106..7b696f304a99 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -389,6 +389,14 @@ config DRM_PANEL_TRULY_NT35597_WQXGA
>  	  Say Y here if you want to enable support for Truly NT35597 WQXGA Dual DSI
>  	  Video Mode panel
>  
> +config DRM_PANEL_VISIONOX_RM69299
> +	tristate "Visionox RM69299"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	help
> +	  Say Y here if you want to enable support for Visionox
> +	  RM69299  DSI Video Mode panel.
> +
>  config DRM_PANEL_XINPENG_XPP055C272
>  	tristate "Xinpeng XPP055C272 panel driver"
>  	depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index 7c4d3c581fd4..9f11d067a6b2 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -41,4 +41,5 @@ obj-$(CONFIG_DRM_PANEL_TPO_TD028TTEC1) += panel-tpo-td028ttec1.o
>  obj-$(CONFIG_DRM_PANEL_TPO_TD043MTEA1) += panel-tpo-td043mtea1.o
>  obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += panel-tpo-tpg110.o
>  obj-$(CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA) += panel-truly-nt35597.o
> +obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) += panel-visionox-rm69299.o
>  obj-$(CONFIG_DRM_PANEL_XINPENG_XPP055C272) += panel-xinpeng-xpp055c272.o
> diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> new file mode 100644
> index 000000000000..eb15dca15398
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
> @@ -0,0 +1,322 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/regulator/consumer.h>
Sort alphabetically. Ignore length of line.

> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +
