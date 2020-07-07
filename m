Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD7422165FA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2020 07:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbgGGFsZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jul 2020 01:48:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727102AbgGGFsZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jul 2020 01:48:25 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE53C061794
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2020 22:48:25 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id f18so45124983wml.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2020 22:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SjkdM1s5wN/IeYuj6seuwDdgW8Gnr8GTUSrkHMUAqEk=;
        b=HYrbHm35UgcK1+WNP12aSmrm1bwDNBMfG3+1KodCnGipjtqPBWeoMEWgGABOcXWQO+
         sj8IMzCvBgYmeNQagjw27kjOUxFEGRLHkm6odIy8HuJ1BYlXYZ0jJuvF3iyEvJPA8H+u
         T8+Ma8h3wg5erQ7agvv8jAUAbMy/UXgAMoZtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SjkdM1s5wN/IeYuj6seuwDdgW8Gnr8GTUSrkHMUAqEk=;
        b=ZmXajYGNnrB5HI9wl77Qf8pW3sqZTCGFfvAlLJ+qZ49AdYIbEQuyZ0ePefTv27e1QX
         wgU37RZCsnkZ09fbaynIJ8sT1rLg+lUGeHP6mGgi3dY630u4Kpaz4zY2nNDbM7LcnraI
         pKniBN7FsUZ6lABbRP2GIbgAHe8KBeQI1tEbSDl/lq2TfNyY00HEq/N5b9ETttZh5jNL
         H7hHvqFNTz+jlvvBBJUESSRKZAJkZztPXpTxISQHAlXk+5q3+0ffzfnBsELnvBTKwY2p
         ypVavrT4Onqilh1lkRsj0T02Ml87d/NcNOyHU1sEGA3ZFIskG8mRAIldvmgDpGS/bnrp
         CnUA==
X-Gm-Message-State: AOAM531fwTVlhRRdHe7MtvvlTPUWtd2fNhbH4H7G7CLjpZl7BBLBdNR9
        TCASUpfUA5JK7f3Okp0kWxkzLQ==
X-Google-Smtp-Source: ABdhPJxrU9gT2ZMrJc+fwc5u0DUDlwZbe+/qQfyyvKpq1vjLTXXjb29FiCQEGyChfGv6bPS2wFWYbg==
X-Received: by 2002:a05:600c:28d:: with SMTP id 13mr2314551wmk.30.1594100903569;
        Mon, 06 Jul 2020 22:48:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 22sm2072561wmb.11.2020.07.06.22.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 22:48:22 -0700 (PDT)
Date:   Tue, 7 Jul 2020 07:48:20 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-arm-msm@vger.kernel.org, linux-pwm@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        patches@opensource.cirrus.com,
        Support Opensource <support.opensource@diasemi.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 17/20] backlight: use backligt_get_brightness()
Message-ID: <20200707054820.GF3278063@phenom.ffwll.local>
References: <20200703184546.144664-1-sam@ravnborg.org>
 <20200703184546.144664-18-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703184546.144664-18-sam@ravnborg.org>
X-Operating-System: Linux phenom 5.6.0-1-amd64
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 03, 2020 at 08:45:43PM +0200, Sam Ravnborg wrote:
> Introduce the backlight_get_brightness() helper in all
> video/backlight/* drivers.
> This simplifies the code and align the implementation of the
> update_status() operation across the different backlight drivers.
> 
> Some of the drivers gains a little extra functionality by the change
> as they now respect the fb_blank() ioctl.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

This looks really nice!

Since there's a pile more backlight drivers all over the tree, care to
update the gpu/todo.rst entry with a note that conversions should use
backlight_get_brightness?
-Daniel

> ---
>  drivers/video/backlight/88pm860x_bl.c | 13 +------------
>  drivers/video/backlight/adp5520_bl.c  | 10 +---------
>  drivers/video/backlight/adp8860_bl.c  | 10 +---------
>  drivers/video/backlight/adp8870_bl.c  | 10 +---------
>  drivers/video/backlight/bd6107.c      |  7 +------
>  drivers/video/backlight/corgi_lcd.c   |  8 +-------
>  drivers/video/backlight/da903x_bl.c   | 13 +------------
>  drivers/video/backlight/ep93xx_bl.c   |  8 +-------
>  drivers/video/backlight/hp680_bl.c    |  6 +-----
>  drivers/video/backlight/kb3886_bl.c   |  6 +-----
>  drivers/video/backlight/led_bl.c      |  7 +------
>  drivers/video/backlight/lm3533_bl.c   |  8 +-------
>  drivers/video/backlight/locomolcd.c   |  6 +-----
>  drivers/video/backlight/lv5207lp.c    |  7 +------
>  drivers/video/backlight/max8925_bl.c  | 13 +------------
>  drivers/video/backlight/pwm_bl.c      |  7 +------
>  drivers/video/backlight/qcom-wled.c   |  7 +------
>  drivers/video/backlight/tps65217_bl.c | 10 +---------
>  drivers/video/backlight/wm831x_bl.c   | 13 +------------
>  19 files changed, 19 insertions(+), 150 deletions(-)
> 
> diff --git a/drivers/video/backlight/88pm860x_bl.c b/drivers/video/backlight/88pm860x_bl.c
> index 20d96a5ac384..25e409bbb1a2 100644
> --- a/drivers/video/backlight/88pm860x_bl.c
> +++ b/drivers/video/backlight/88pm860x_bl.c
> @@ -121,18 +121,7 @@ static int pm860x_backlight_set(struct backlight_device *bl, int brightness)
>  
>  static int pm860x_backlight_update_status(struct backlight_device *bl)
>  {
> -	int brightness = bl->props.brightness;
> -
> -	if (bl->props.power != FB_BLANK_UNBLANK)
> -		brightness = 0;
> -
> -	if (bl->props.fb_blank != FB_BLANK_UNBLANK)
> -		brightness = 0;
> -
> -	if (bl->props.state & BL_CORE_SUSPENDED)
> -		brightness = 0;
> -
> -	return pm860x_backlight_set(bl, brightness);
> +	return pm860x_backlight_set(bl, backlight_get_brightness(bl));
>  }
>  
>  static int pm860x_backlight_get_brightness(struct backlight_device *bl)
> diff --git a/drivers/video/backlight/adp5520_bl.c b/drivers/video/backlight/adp5520_bl.c
> index 0f63f76723a5..686988c3df3a 100644
> --- a/drivers/video/backlight/adp5520_bl.c
> +++ b/drivers/video/backlight/adp5520_bl.c
> @@ -65,15 +65,7 @@ static int adp5520_bl_set(struct backlight_device *bl, int brightness)
>  
>  static int adp5520_bl_update_status(struct backlight_device *bl)
>  {
> -	int brightness = bl->props.brightness;
> -
> -	if (bl->props.power != FB_BLANK_UNBLANK)
> -		brightness = 0;
> -
> -	if (bl->props.fb_blank != FB_BLANK_UNBLANK)
> -		brightness = 0;
> -
> -	return adp5520_bl_set(bl, brightness);
> +	return adp5520_bl_set(bl, backlight_get_brightness(bl));
>  }
>  
>  static int adp5520_bl_get_brightness(struct backlight_device *bl)
> diff --git a/drivers/video/backlight/adp8860_bl.c b/drivers/video/backlight/adp8860_bl.c
> index 19968104fc47..ddc7f5f0401f 100644
> --- a/drivers/video/backlight/adp8860_bl.c
> +++ b/drivers/video/backlight/adp8860_bl.c
> @@ -361,15 +361,7 @@ static int adp8860_bl_set(struct backlight_device *bl, int brightness)
>  
>  static int adp8860_bl_update_status(struct backlight_device *bl)
>  {
> -	int brightness = bl->props.brightness;
> -
> -	if (bl->props.power != FB_BLANK_UNBLANK)
> -		brightness = 0;
> -
> -	if (bl->props.fb_blank != FB_BLANK_UNBLANK)
> -		brightness = 0;
> -
> -	return adp8860_bl_set(bl, brightness);
> +	return adp8860_bl_set(bl, backlight_get_brightness(bl));
>  }
>  
>  static int adp8860_bl_get_brightness(struct backlight_device *bl)
> diff --git a/drivers/video/backlight/adp8870_bl.c b/drivers/video/backlight/adp8870_bl.c
> index 4c0032010cfe..8b5213a39527 100644
> --- a/drivers/video/backlight/adp8870_bl.c
> +++ b/drivers/video/backlight/adp8870_bl.c
> @@ -399,15 +399,7 @@ static int adp8870_bl_set(struct backlight_device *bl, int brightness)
>  
>  static int adp8870_bl_update_status(struct backlight_device *bl)
>  {
> -	int brightness = bl->props.brightness;
> -
> -	if (bl->props.power != FB_BLANK_UNBLANK)
> -		brightness = 0;
> -
> -	if (bl->props.fb_blank != FB_BLANK_UNBLANK)
> -		brightness = 0;
> -
> -	return adp8870_bl_set(bl, brightness);
> +	return adp8870_bl_set(bl, backlight_get_brightness(bl));
>  }
>  
>  static int adp8870_bl_get_brightness(struct backlight_device *bl)
> diff --git a/drivers/video/backlight/bd6107.c b/drivers/video/backlight/bd6107.c
> index d5d5fb457e78..515184fbe33a 100644
> --- a/drivers/video/backlight/bd6107.c
> +++ b/drivers/video/backlight/bd6107.c
> @@ -82,12 +82,7 @@ static int bd6107_write(struct bd6107 *bd, u8 reg, u8 data)
>  static int bd6107_backlight_update_status(struct backlight_device *backlight)
>  {
>  	struct bd6107 *bd = bl_get_data(backlight);
> -	int brightness = backlight->props.brightness;
> -
> -	if (backlight->props.power != FB_BLANK_UNBLANK ||
> -	    backlight->props.fb_blank != FB_BLANK_UNBLANK ||
> -	    backlight->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
> -		brightness = 0;
> +	int brightness = backlight_get_brightness(backlight);
>  
>  	if (brightness) {
>  		bd6107_write(bd, BD6107_PORTSEL, BD6107_PORTSEL_LEDM(2) |
> diff --git a/drivers/video/backlight/corgi_lcd.c b/drivers/video/backlight/corgi_lcd.c
> index 25ef0cbd7583..33f5d80495e6 100644
> --- a/drivers/video/backlight/corgi_lcd.c
> +++ b/drivers/video/backlight/corgi_lcd.c
> @@ -420,13 +420,7 @@ static int corgi_bl_set_intensity(struct corgi_lcd *lcd, int intensity)
>  static int corgi_bl_update_status(struct backlight_device *bd)
>  {
>  	struct corgi_lcd *lcd = bl_get_data(bd);
> -	int intensity = bd->props.brightness;
> -
> -	if (bd->props.power != FB_BLANK_UNBLANK)
> -		intensity = 0;
> -
> -	if (bd->props.fb_blank != FB_BLANK_UNBLANK)
> -		intensity = 0;
> +	int intensity = backlight_get_brightness(bd);
>  
>  	if (corgibl_flags & CORGIBL_SUSPENDED)
>  		intensity = 0;
> diff --git a/drivers/video/backlight/da903x_bl.c b/drivers/video/backlight/da903x_bl.c
> index 62540e4bdedb..71f21bbc7a9f 100644
> --- a/drivers/video/backlight/da903x_bl.c
> +++ b/drivers/video/backlight/da903x_bl.c
> @@ -77,18 +77,7 @@ static int da903x_backlight_set(struct backlight_device *bl, int brightness)
>  
>  static int da903x_backlight_update_status(struct backlight_device *bl)
>  {
> -	int brightness = bl->props.brightness;
> -
> -	if (bl->props.power != FB_BLANK_UNBLANK)
> -		brightness = 0;
> -
> -	if (bl->props.fb_blank != FB_BLANK_UNBLANK)
> -		brightness = 0;
> -
> -	if (bl->props.state & BL_CORE_SUSPENDED)
> -		brightness = 0;
> -
> -	return da903x_backlight_set(bl, brightness);
> +	return da903x_backlight_set(bl, backlight_get_brightness(bl));
>  }
>  
>  static int da903x_backlight_get_brightness(struct backlight_device *bl)
> diff --git a/drivers/video/backlight/ep93xx_bl.c b/drivers/video/backlight/ep93xx_bl.c
> index 4149e0b2f83c..2387009d452d 100644
> --- a/drivers/video/backlight/ep93xx_bl.c
> +++ b/drivers/video/backlight/ep93xx_bl.c
> @@ -36,13 +36,7 @@ static int ep93xxbl_set(struct backlight_device *bl, int brightness)
>  
>  static int ep93xxbl_update_status(struct backlight_device *bl)
>  {
> -	int brightness = bl->props.brightness;
> -
> -	if (bl->props.power != FB_BLANK_UNBLANK ||
> -	    bl->props.fb_blank != FB_BLANK_UNBLANK)
> -		brightness = 0;
> -
> -	return ep93xxbl_set(bl, brightness);
> +	return ep93xxbl_set(bl, backlight_get_brightness(bl));
>  }
>  
>  static int ep93xxbl_get_brightness(struct backlight_device *bl)
> diff --git a/drivers/video/backlight/hp680_bl.c b/drivers/video/backlight/hp680_bl.c
> index 8ea42b8d9bc8..9123c33def05 100644
> --- a/drivers/video/backlight/hp680_bl.c
> +++ b/drivers/video/backlight/hp680_bl.c
> @@ -33,12 +33,8 @@ static void hp680bl_send_intensity(struct backlight_device *bd)
>  {
>  	unsigned long flags;
>  	u16 v;
> -	int intensity = bd->props.brightness;
> +	int intensity = backlight_get_brightness(bd);
>  
> -	if (bd->props.power != FB_BLANK_UNBLANK)
> -		intensity = 0;
> -	if (bd->props.fb_blank != FB_BLANK_UNBLANK)
> -		intensity = 0;
>  	if (hp680bl_suspended)
>  		intensity = 0;
>  
> diff --git a/drivers/video/backlight/kb3886_bl.c b/drivers/video/backlight/kb3886_bl.c
> index 1dfe13c18925..55794b239cff 100644
> --- a/drivers/video/backlight/kb3886_bl.c
> +++ b/drivers/video/backlight/kb3886_bl.c
> @@ -87,12 +87,8 @@ static const struct dmi_system_id kb3886bl_device_table[] __initconst = {
>  
>  static int kb3886bl_send_intensity(struct backlight_device *bd)
>  {
> -	int intensity = bd->props.brightness;
> +	int intensity = backlight_get_brightness(bd);
>  
> -	if (bd->props.power != FB_BLANK_UNBLANK)
> -		intensity = 0;
> -	if (bd->props.fb_blank != FB_BLANK_UNBLANK)
> -		intensity = 0;
>  	if (kb3886bl_flags & KB3886BL_SUSPENDED)
>  		intensity = 0;
>  
> diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
> index 3f66549997c8..f54d256e2d54 100644
> --- a/drivers/video/backlight/led_bl.c
> +++ b/drivers/video/backlight/led_bl.c
> @@ -54,12 +54,7 @@ static void led_bl_power_off(struct led_bl_data *priv)
>  static int led_bl_update_status(struct backlight_device *bl)
>  {
>  	struct led_bl_data *priv = bl_get_data(bl);
> -	int brightness = bl->props.brightness;
> -
> -	if (bl->props.power != FB_BLANK_UNBLANK ||
> -	    bl->props.fb_blank != FB_BLANK_UNBLANK ||
> -	    bl->props.state & BL_CORE_FBBLANK)
> -		brightness = 0;
> +	int brightness = backlight_get_brightness(bl);
>  
>  	if (brightness > 0)
>  		led_bl_set_brightness(priv, brightness);
> diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
> index ee09d1bd02b9..d07a2bd805fc 100644
> --- a/drivers/video/backlight/lm3533_bl.c
> +++ b/drivers/video/backlight/lm3533_bl.c
> @@ -39,14 +39,8 @@ static inline int lm3533_bl_get_ctrlbank_id(struct lm3533_bl *bl)
>  static int lm3533_bl_update_status(struct backlight_device *bd)
>  {
>  	struct lm3533_bl *bl = bl_get_data(bd);
> -	int brightness = bd->props.brightness;
>  
> -	if (bd->props.power != FB_BLANK_UNBLANK)
> -		brightness = 0;
> -	if (bd->props.fb_blank != FB_BLANK_UNBLANK)
> -		brightness = 0;
> -
> -	return lm3533_ctrlbank_set_brightness(&bl->cb, (u8)brightness);
> +	return lm3533_ctrlbank_set_brightness(&bl->cb, backlight_get_brightness(bd));
>  }
>  
>  static int lm3533_bl_get_brightness(struct backlight_device *bd)
> diff --git a/drivers/video/backlight/locomolcd.c b/drivers/video/backlight/locomolcd.c
> index cdc02e04f89d..297ee2e1ab0b 100644
> --- a/drivers/video/backlight/locomolcd.c
> +++ b/drivers/video/backlight/locomolcd.c
> @@ -111,12 +111,8 @@ static int current_intensity;
>  
>  static int locomolcd_set_intensity(struct backlight_device *bd)
>  {
> -	int intensity = bd->props.brightness;
> +	int intensity = backlight_get_brightness(bd);
>  
> -	if (bd->props.power != FB_BLANK_UNBLANK)
> -		intensity = 0;
> -	if (bd->props.fb_blank != FB_BLANK_UNBLANK)
> -		intensity = 0;
>  	if (locomolcd_flags & LOCOMOLCD_SUSPENDED)
>  		intensity = 0;
>  
> diff --git a/drivers/video/backlight/lv5207lp.c b/drivers/video/backlight/lv5207lp.c
> index c6ad73a784e2..1842ae9a55f8 100644
> --- a/drivers/video/backlight/lv5207lp.c
> +++ b/drivers/video/backlight/lv5207lp.c
> @@ -46,12 +46,7 @@ static int lv5207lp_write(struct lv5207lp *lv, u8 reg, u8 data)
>  static int lv5207lp_backlight_update_status(struct backlight_device *backlight)
>  {
>  	struct lv5207lp *lv = bl_get_data(backlight);
> -	int brightness = backlight->props.brightness;
> -
> -	if (backlight->props.power != FB_BLANK_UNBLANK ||
> -	    backlight->props.fb_blank != FB_BLANK_UNBLANK ||
> -	    backlight->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
> -		brightness = 0;
> +	int brightness = backlight_get_brightness(backlight);
>  
>  	if (brightness) {
>  		lv5207lp_write(lv, LV5207LP_CTRL1,
> diff --git a/drivers/video/backlight/max8925_bl.c b/drivers/video/backlight/max8925_bl.c
> index 97cc260ff9d1..e607ec6fd4bf 100644
> --- a/drivers/video/backlight/max8925_bl.c
> +++ b/drivers/video/backlight/max8925_bl.c
> @@ -64,18 +64,7 @@ static int max8925_backlight_set(struct backlight_device *bl, int brightness)
>  
>  static int max8925_backlight_update_status(struct backlight_device *bl)
>  {
> -	int brightness = bl->props.brightness;
> -
> -	if (bl->props.power != FB_BLANK_UNBLANK)
> -		brightness = 0;
> -
> -	if (bl->props.fb_blank != FB_BLANK_UNBLANK)
> -		brightness = 0;
> -
> -	if (bl->props.state & BL_CORE_SUSPENDED)
> -		brightness = 0;
> -
> -	return max8925_backlight_set(bl, brightness);
> +	return max8925_backlight_set(bl, backlight_get_brightness(bl));
>  }
>  
>  static int max8925_backlight_get_brightness(struct backlight_device *bl)
> diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
> index 82b8d7594701..eff64db2e02e 100644
> --- a/drivers/video/backlight/pwm_bl.c
> +++ b/drivers/video/backlight/pwm_bl.c
> @@ -108,14 +108,9 @@ static int compute_duty_cycle(struct pwm_bl_data *pb, int brightness)
>  static int pwm_backlight_update_status(struct backlight_device *bl)
>  {
>  	struct pwm_bl_data *pb = bl_get_data(bl);
> -	int brightness = bl->props.brightness;
> +	int brightness = backlight_get_brightness(bl);
>  	struct pwm_state state;
>  
> -	if (bl->props.power != FB_BLANK_UNBLANK ||
> -	    bl->props.fb_blank != FB_BLANK_UNBLANK ||
> -	    bl->props.state & BL_CORE_FBBLANK)
> -		brightness = 0;
> -
>  	if (pb->notify)
>  		brightness = pb->notify(pb->dev, brightness);
>  
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 4c8c34b99441..94d3b96244f0 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -433,14 +433,9 @@ static int wled5_ovp_delay(struct wled *wled)
>  static int wled_update_status(struct backlight_device *bl)
>  {
>  	struct wled *wled = bl_get_data(bl);
> -	u16 brightness = bl->props.brightness;
> +	u16 brightness = backlight_get_brightness(bl);
>  	int rc = 0;
>  
> -	if (bl->props.power != FB_BLANK_UNBLANK ||
> -	    bl->props.fb_blank != FB_BLANK_UNBLANK ||
> -	    bl->props.state & BL_CORE_FBBLANK)
> -		brightness = 0;
> -
>  	mutex_lock(&wled->lock);
>  	if (brightness) {
>  		rc = wled->wled_set_brightness(wled, brightness);
> diff --git a/drivers/video/backlight/tps65217_bl.c b/drivers/video/backlight/tps65217_bl.c
> index 762e3feed097..8457166f357f 100644
> --- a/drivers/video/backlight/tps65217_bl.c
> +++ b/drivers/video/backlight/tps65217_bl.c
> @@ -77,15 +77,7 @@ static int tps65217_bl_update_status(struct backlight_device *bl)
>  {
>  	struct tps65217_bl *tps65217_bl = bl_get_data(bl);
>  	int rc;
> -	int brightness = bl->props.brightness;
> -
> -	if (bl->props.state & BL_CORE_SUSPENDED)
> -		brightness = 0;
> -
> -	if ((bl->props.power != FB_BLANK_UNBLANK) ||
> -		(bl->props.fb_blank != FB_BLANK_UNBLANK))
> -		/* framebuffer in low power mode or blanking active */
> -		brightness = 0;
> +	int brightness = backlight_get_brightness(bl);
>  
>  	if (brightness > 0) {
>  		rc = tps65217_reg_write(tps65217_bl->tps,
> diff --git a/drivers/video/backlight/wm831x_bl.c b/drivers/video/backlight/wm831x_bl.c
> index e55977d54c15..c5aaee205bdf 100644
> --- a/drivers/video/backlight/wm831x_bl.c
> +++ b/drivers/video/backlight/wm831x_bl.c
> @@ -91,18 +91,7 @@ static int wm831x_backlight_set(struct backlight_device *bl, int brightness)
>  
>  static int wm831x_backlight_update_status(struct backlight_device *bl)
>  {
> -	int brightness = bl->props.brightness;
> -
> -	if (bl->props.power != FB_BLANK_UNBLANK)
> -		brightness = 0;
> -
> -	if (bl->props.fb_blank != FB_BLANK_UNBLANK)
> -		brightness = 0;
> -
> -	if (bl->props.state & BL_CORE_SUSPENDED)
> -		brightness = 0;
> -
> -	return wm831x_backlight_set(bl, brightness);
> +	return wm831x_backlight_set(bl, backlight_get_brightness(bl));
>  }
>  
>  static int wm831x_backlight_get_brightness(struct backlight_device *bl)
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
