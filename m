Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C36B3369510
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 16:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239383AbhDWOuK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 10:50:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242394AbhDWOuK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 10:50:10 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEF0EC061756
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 07:49:33 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id u80so15814270oia.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 07:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kV2WFxJ0pxB6j6lJcjOav5TocdO0gpgto1tS47Na98M=;
        b=v93PQtGqLr4sd5pjgvzTucAT7fRNDJiJKjzh7ULgud/8FfAuqIbqkHYX5t+TTGA9Uz
         dxddBXsskOp4rSd3FKwnZ9L9HgtYTENGrXTp8qpRiZkI26kAG8EXoYTgEife5xecd0FU
         UdM1FDSollaYSfEQJAssYc7EFRrKXaMuOMfez93uuOCyQzfjLmzKuwXycjqEASGZawyF
         L6nRVjYaBNmPBt5j6BBK9EbSSJDcnHW9C7ectEPsAwLMPRT5xtsUAOyliOCOCO9hiHo7
         SjfSnP2OqrNDVZvXQyr3AoO2hF/rROuOwA4dZRCCShMS6WEk3tcqcc3qowxFeE/Lvx/7
         irdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kV2WFxJ0pxB6j6lJcjOav5TocdO0gpgto1tS47Na98M=;
        b=EvDdalQ+BGpsjNDIJ8h21KZBlsPo2+Mit5r1sBPw6TYZpePF6xygtqaYm9crI36rpl
         zOenHjpv7j5fKS8vJmtxaca2m4WlnsGrACqtcliUzbLI3/UooTZO/27CX6XYuztvRhp4
         F2N1262x1TaGCDfgcLyqmt882wDS9RCghpnvluYhqhCY52AvDG9/iuVWlgOWGcs2e55D
         Ize9E5BN+wa/l5y/Mf/PDutobMYSiTu7eSOeQSax9X2LxwucmJJXaWUyE99WFzz5sp4X
         Kv/B08nCXSTB+MMxY+HEmlGEDy/ghvzqTr5OQGwB2s67+Lh5KqDw95x/RmhtTwkMdTPW
         9icQ==
X-Gm-Message-State: AOAM532/uCmbMvM5N0T3eJdBMU+oRpZMdcn78tmK2plXJXNY/qb6JSmp
        dz0vAuE7K3KtWXJKJg+VVNVk5Q==
X-Google-Smtp-Source: ABdhPJza24M45LdRra5lfSTymv+xaKIXGnc51ftTWwNA37cg04E0OjGlhNqS0AHQmD5FHFQm7XO8/A==
X-Received: by 2002:aca:b845:: with SMTP id i66mr3151456oif.152.1619189373188;
        Fri, 23 Apr 2021 07:49:33 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c65sm1294573oia.47.2021.04.23.07.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:49:32 -0700 (PDT)
Date:   Fri, 23 Apr 2021 09:49:30 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>, robdclark@chromium.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, Linus W <linus.walleij@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 15/27] drm/bridge: ti-sn65dsi86: Break GPIO and
 MIPI-to-eDP bridge into sub-drivers
Message-ID: <YILeemCMbU9FXLx4@builder.lan>
References: <20210416223950.3586967-1-dianders@chromium.org>
 <20210416153909.v4.15.I3e68fa38c4ccbdbdf145cad2b01e83a1e5eac302@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416153909.v4.15.I3e68fa38c4ccbdbdf145cad2b01e83a1e5eac302@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 16 Apr 17:39 CDT 2021, Douglas Anderson wrote:

> Let's use the newly minted aux bus to break up the driver into sub
> drivers. We're not doing a full breakup here: all the code is still in
> the same file and remains largely untouched. The big goal here of
> using sub-drivers is to allow part of our code to finish probing even
> if some other code needs to defer. This can solve some chicken-and-egg
> problems. Specifically:
> - In commit 48834e6084f1 ("drm/panel-simple: Support hpd-gpios for
>   delaying prepare()") we had to add a bit of a hack to simpel-panel
>   to support HPD showing up late. We can get rid of that hack now
>   since the GPIO part of our driver can finish probing early.
> - We have a desire to expose our DDC bus to simple-panel (and perhaps
>   to a backlight driver?). That will end up with the same
>   chicken-and-egg problem. A future patch to move this to a sub-driver
>   will fix it.
> - If/when we support the PWM functionality present in the bridge chip
>   for a backlight we'll end up with another chicken-and-egg
>   problem. If we allow the PWM to be a sub-driver too then it solves
>   this problem.

I rebased my pwm_chip patch ontop of this and it works like a charm!

> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> (no changes since v1)
> 
>  drivers/gpu/drm/bridge/Kconfig        |   1 +
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 211 +++++++++++++++++++-------
>  2 files changed, 158 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 22a467abd3e9..6868050961a2 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -267,6 +267,7 @@ config DRM_TI_SN65DSI86
>  	select REGMAP_I2C
>  	select DRM_PANEL
>  	select DRM_MIPI_DSI
> +	select AUXILIARY_BUS
>  	help
>  	  Texas Instruments SN65DSI86 DSI to eDP Bridge driver
>  
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 57bc489a0412..44edcf6f5744 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -4,6 +4,7 @@
>   * datasheet: https://www.ti.com/lit/ds/symlink/sn65dsi86.pdf
>   */
>  
> +#include <linux/auxiliary_bus.h>
>  #include <linux/bits.h>
>  #include <linux/clk.h>
>  #include <linux/debugfs.h>
> @@ -113,7 +114,10 @@
>  
>  /**
>   * struct ti_sn65dsi86 - Platform data for ti-sn65dsi86 driver.
> - * @dev:          Pointer to our device.
> + * @bridge_aux:   AUX-bus sub device for MIPI-to-eDP bridge functionality.
> + * @gpio_aux:     AUX-bus sub device for GPIO controller functionality.
> + *
> + * @dev:          Pointer to the top level (i2c) device.
>   * @regmap:       Regmap for accessing i2c.
>   * @aux:          Our aux channel.
>   * @bridge:       Our bridge.
> @@ -140,6 +144,9 @@
>   *                each other's read-modify-write.
>   */
>  struct ti_sn65dsi86 {
> +	struct auxiliary_device		bridge_aux;
> +	struct auxiliary_device		gpio_aux;
> +
>  	struct device			*dev;
>  	struct regmap			*regmap;
>  	struct drm_dp_aux		aux;
> @@ -1135,8 +1142,10 @@ static const char * const ti_sn_bridge_gpio_names[SN_NUM_GPIOS] = {
>  	"GPIO1", "GPIO2", "GPIO3", "GPIO4"
>  };
>  
> -static int ti_sn_setup_gpio_controller(struct ti_sn65dsi86 *pdata)
> +static int ti_sn_gpio_probe(struct auxiliary_device *adev,
> +			    const struct auxiliary_device_id *id)
>  {
> +	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
>  	int ret;
>  
>  	/* Only init if someone is going to use us as a GPIO controller */
> @@ -1158,19 +1167,27 @@ static int ti_sn_setup_gpio_controller(struct ti_sn65dsi86 *pdata)
>  	pdata->gchip.names = ti_sn_bridge_gpio_names;
>  	pdata->gchip.ngpio = SN_NUM_GPIOS;
>  	pdata->gchip.base = -1;
> -	ret = devm_gpiochip_add_data(pdata->dev, &pdata->gchip, pdata);
> +	ret = devm_gpiochip_add_data(&adev->dev, &pdata->gchip, pdata);
>  	if (ret)
>  		dev_err(pdata->dev, "can't add gpio chip\n");
>  
>  	return ret;
>  }
>  
> -#else
> +static const struct auxiliary_device_id ti_sn_gpio_id_table[] = {
> +	{ .name = "ti_sn65dsi86.gpio", },
> +	{},
> +};
> +
> +MODULE_DEVICE_TABLE(auxiliary, ti_sn_gpio_id_table);

The MODULE_DEVICE_TABLE will ensure that the driver will be autoloaded
if this auxiliary compatible is requested, but it's only ever going to
be triggered by the already loaded driver.

So you can omit this.

>  
> -static inline int ti_sn_setup_gpio_controller(struct ti_sn65dsi86 *pdata)
> -{
> -	return 0;
> -}
> +static struct auxiliary_driver ti_sn_gpio_driver = {
> +	.name = "gpio",
> +	.probe = ti_sn_gpio_probe,
> +	.id_table = ti_sn_gpio_id_table,
> +};
> +
> +module_auxiliary_driver(ti_sn_gpio_driver);

You may only have a single module_driver() per driver. Compiling the
driver as a module will result in a spew of errors because init_module()
and cleanup_module() are defined multiple times.

As such I believe you have to roll your own init/exit. I did the
following for my testing:

====8<-----------------

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 62904dfdee0a..fe3317bc85be 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1218,8 +1218,6 @@ static struct auxiliary_driver ti_sn_gpio_driver = {
 	.id_table = ti_sn_gpio_id_table,
 };
 
-module_auxiliary_driver(ti_sn_gpio_driver);
-
 #endif
 
 static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
@@ -1329,8 +1327,6 @@ static struct auxiliary_driver ti_sn_bridge_driver = {
 	.id_table = ti_sn_bridge_id_table,
 };
 
-module_auxiliary_driver(ti_sn_bridge_driver);
-
 static void ti_sn65dsi86_runtime_disable(void *data)
 {
 	pm_runtime_disable(data);
@@ -1432,8 +1428,6 @@ static struct auxiliary_driver ti_sn_aux_driver = {
 	.id_table = ti_sn_aux_id_table,
 };
 
-module_auxiliary_driver(ti_sn_aux_driver);
-
 static int ti_sn65dsi86_probe(struct i2c_client *client,
 			      const struct i2c_device_id *id)
 {
@@ -1535,7 +1529,32 @@ static struct i2c_driver ti_sn65dsi86_driver = {
 	.probe = ti_sn65dsi86_probe,
 	.id_table = ti_sn65dsi86_id,
 };
-module_i2c_driver(ti_sn65dsi86_driver);
+
+static int ti_sn65dsi86_init(void)
+{
+#if defined(CONFIG_OF_GPIO)
+	auxiliary_driver_register(&ti_sn_gpio_driver);
+#endif
+	auxiliary_driver_register(&ti_sn_bridge_driver);
+	auxiliary_driver_register(&ti_sn_aux_driver);
+
+	i2c_add_driver(&ti_sn65dsi86_driver);
+
+	return 0;
+}
+module_init(ti_sn65dsi86_init);
+
+static void ti_sn65dsi86_exit(void)
+{
+	i2c_del_driver(&ti_sn65dsi86_driver);
+
+#if defined(CONFIG_OF_GPIO)
+	auxiliary_driver_unregister(&ti_sn_gpio_driver);
+#endif
+	auxiliary_driver_unregister(&ti_sn_bridge_driver);
+	auxiliary_driver_unregister(&ti_sn_aux_driver);
+}
+module_exit(ti_sn65dsi86_exit);
 
 MODULE_AUTHOR("Sandeep Panda <spanda@codeaurora.org>");
 MODULE_DESCRIPTION("sn65dsi86 DSI to eDP bridge driver");

8<-----------------

The rest looks good!

Regards,
Bjorn
