Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DAB2213F96
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2020 20:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbgGCSqk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jul 2020 14:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbgGCSqk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jul 2020 14:46:40 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97D73C061794;
        Fri,  3 Jul 2020 11:46:39 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id f5so22207072ljj.10;
        Fri, 03 Jul 2020 11:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GidHBFAlZuOQ9IgkGlu+gLN1LIBt1hSU/cJfZ8cMxLM=;
        b=cH5Pv4VOo3t8IdF4+PXdzPvsaPyqf4pgIPDb7RTkGSxmXtp6+Th9pAK41px+6ghpPc
         uroPusDDxgJh6BOjLx9XPnmZl3ff3I/lFc7g1gxOE0BbEg8VVgifALnG5O9ou5Wycohi
         yGVXELEwXPuLF2MvSzlfiU4F1nmptJ0xY1ysole+y6XgYmTyz5F/IbiCR/LgGBLLQ37g
         ZFBbEZ5JpMViCzjyn3c/UfRaXvru4OkQ4HFyh0rhxnK+3TGgQKdm2tnpReeQnU2q1X/g
         otNWiDlNo+/pna3X3afh/xNg63jeUiKY6r3zko3ddXVGTrzHookwO3Mfg62Pltltr9uq
         Jpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=GidHBFAlZuOQ9IgkGlu+gLN1LIBt1hSU/cJfZ8cMxLM=;
        b=NJlwQLWK1rwOgWBIz9hGJyY0MDbgIxOlW0+Si/AUNHMpSjoNdrPT9+7JEG3Qt6E+PM
         SSu9BW0UryLZrg/GE0U9KoYG0IINrokh638Q/xB0/A2CwXOwsrCScng3pIrHkcETfrSu
         ZBW5hfNYJsvCGncsYxxH5izGUXSxKcs5ejDAVQTj0C2PBIi6dLqvaf2Po/IBqj8Z7QoV
         zdC3MkvCjOgcJDpIxhRkWvQEsQ+fI833ZwV/ElEAkkFokno2qFJtJaffyI6pMpKzAZcA
         I9ADa5BatS8NFQ03Ilj17S75MW39ld8viMkiC59HWavWOtU5ToYDGkosiB2nfO3IlFWD
         p/4w==
X-Gm-Message-State: AOAM533fHt9Ts/RzZ5MFS7iVi7Pf9+AjqWeIasTCcAvBQaTKZJua87Ch
        ohbzrqO5Gi4AaxyN1r7ALDk=
X-Google-Smtp-Source: ABdhPJwKqYjOuzWjxnodfOMC8+BTrkFzfGQyxI7l5FfsjU8wRGpDokt/PoeXmxzANG0oGFPvPiL1Ag==
X-Received: by 2002:a2e:8043:: with SMTP id p3mr14027545ljg.469.1593801997946;
        Fri, 03 Jul 2020 11:46:37 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
        by smtp.gmail.com with ESMTPSA id h22sm4404224ljg.1.2020.07.03.11.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 11:46:37 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
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
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v4 17/20] backlight: use backligt_get_brightness()
Date:   Fri,  3 Jul 2020 20:45:43 +0200
Message-Id: <20200703184546.144664-18-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703184546.144664-1-sam@ravnborg.org>
References: <20200703184546.144664-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce the backlight_get_brightness() helper in all
video/backlight/* drivers.
This simplifies the code and align the implementation of the
update_status() operation across the different backlight drivers.

Some of the drivers gains a little extra functionality by the change
as they now respect the fb_blank() ioctl.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/video/backlight/88pm860x_bl.c | 13 +------------
 drivers/video/backlight/adp5520_bl.c  | 10 +---------
 drivers/video/backlight/adp8860_bl.c  | 10 +---------
 drivers/video/backlight/adp8870_bl.c  | 10 +---------
 drivers/video/backlight/bd6107.c      |  7 +------
 drivers/video/backlight/corgi_lcd.c   |  8 +-------
 drivers/video/backlight/da903x_bl.c   | 13 +------------
 drivers/video/backlight/ep93xx_bl.c   |  8 +-------
 drivers/video/backlight/hp680_bl.c    |  6 +-----
 drivers/video/backlight/kb3886_bl.c   |  6 +-----
 drivers/video/backlight/led_bl.c      |  7 +------
 drivers/video/backlight/lm3533_bl.c   |  8 +-------
 drivers/video/backlight/locomolcd.c   |  6 +-----
 drivers/video/backlight/lv5207lp.c    |  7 +------
 drivers/video/backlight/max8925_bl.c  | 13 +------------
 drivers/video/backlight/pwm_bl.c      |  7 +------
 drivers/video/backlight/qcom-wled.c   |  7 +------
 drivers/video/backlight/tps65217_bl.c | 10 +---------
 drivers/video/backlight/wm831x_bl.c   | 13 +------------
 19 files changed, 19 insertions(+), 150 deletions(-)

diff --git a/drivers/video/backlight/88pm860x_bl.c b/drivers/video/backlight/88pm860x_bl.c
index 20d96a5ac384..25e409bbb1a2 100644
--- a/drivers/video/backlight/88pm860x_bl.c
+++ b/drivers/video/backlight/88pm860x_bl.c
@@ -121,18 +121,7 @@ static int pm860x_backlight_set(struct backlight_device *bl, int brightness)
 
 static int pm860x_backlight_update_status(struct backlight_device *bl)
 {
-	int brightness = bl->props.brightness;
-
-	if (bl->props.power != FB_BLANK_UNBLANK)
-		brightness = 0;
-
-	if (bl->props.fb_blank != FB_BLANK_UNBLANK)
-		brightness = 0;
-
-	if (bl->props.state & BL_CORE_SUSPENDED)
-		brightness = 0;
-
-	return pm860x_backlight_set(bl, brightness);
+	return pm860x_backlight_set(bl, backlight_get_brightness(bl));
 }
 
 static int pm860x_backlight_get_brightness(struct backlight_device *bl)
diff --git a/drivers/video/backlight/adp5520_bl.c b/drivers/video/backlight/adp5520_bl.c
index 0f63f76723a5..686988c3df3a 100644
--- a/drivers/video/backlight/adp5520_bl.c
+++ b/drivers/video/backlight/adp5520_bl.c
@@ -65,15 +65,7 @@ static int adp5520_bl_set(struct backlight_device *bl, int brightness)
 
 static int adp5520_bl_update_status(struct backlight_device *bl)
 {
-	int brightness = bl->props.brightness;
-
-	if (bl->props.power != FB_BLANK_UNBLANK)
-		brightness = 0;
-
-	if (bl->props.fb_blank != FB_BLANK_UNBLANK)
-		brightness = 0;
-
-	return adp5520_bl_set(bl, brightness);
+	return adp5520_bl_set(bl, backlight_get_brightness(bl));
 }
 
 static int adp5520_bl_get_brightness(struct backlight_device *bl)
diff --git a/drivers/video/backlight/adp8860_bl.c b/drivers/video/backlight/adp8860_bl.c
index 19968104fc47..ddc7f5f0401f 100644
--- a/drivers/video/backlight/adp8860_bl.c
+++ b/drivers/video/backlight/adp8860_bl.c
@@ -361,15 +361,7 @@ static int adp8860_bl_set(struct backlight_device *bl, int brightness)
 
 static int adp8860_bl_update_status(struct backlight_device *bl)
 {
-	int brightness = bl->props.brightness;
-
-	if (bl->props.power != FB_BLANK_UNBLANK)
-		brightness = 0;
-
-	if (bl->props.fb_blank != FB_BLANK_UNBLANK)
-		brightness = 0;
-
-	return adp8860_bl_set(bl, brightness);
+	return adp8860_bl_set(bl, backlight_get_brightness(bl));
 }
 
 static int adp8860_bl_get_brightness(struct backlight_device *bl)
diff --git a/drivers/video/backlight/adp8870_bl.c b/drivers/video/backlight/adp8870_bl.c
index 4c0032010cfe..8b5213a39527 100644
--- a/drivers/video/backlight/adp8870_bl.c
+++ b/drivers/video/backlight/adp8870_bl.c
@@ -399,15 +399,7 @@ static int adp8870_bl_set(struct backlight_device *bl, int brightness)
 
 static int adp8870_bl_update_status(struct backlight_device *bl)
 {
-	int brightness = bl->props.brightness;
-
-	if (bl->props.power != FB_BLANK_UNBLANK)
-		brightness = 0;
-
-	if (bl->props.fb_blank != FB_BLANK_UNBLANK)
-		brightness = 0;
-
-	return adp8870_bl_set(bl, brightness);
+	return adp8870_bl_set(bl, backlight_get_brightness(bl));
 }
 
 static int adp8870_bl_get_brightness(struct backlight_device *bl)
diff --git a/drivers/video/backlight/bd6107.c b/drivers/video/backlight/bd6107.c
index d5d5fb457e78..515184fbe33a 100644
--- a/drivers/video/backlight/bd6107.c
+++ b/drivers/video/backlight/bd6107.c
@@ -82,12 +82,7 @@ static int bd6107_write(struct bd6107 *bd, u8 reg, u8 data)
 static int bd6107_backlight_update_status(struct backlight_device *backlight)
 {
 	struct bd6107 *bd = bl_get_data(backlight);
-	int brightness = backlight->props.brightness;
-
-	if (backlight->props.power != FB_BLANK_UNBLANK ||
-	    backlight->props.fb_blank != FB_BLANK_UNBLANK ||
-	    backlight->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
-		brightness = 0;
+	int brightness = backlight_get_brightness(backlight);
 
 	if (brightness) {
 		bd6107_write(bd, BD6107_PORTSEL, BD6107_PORTSEL_LEDM(2) |
diff --git a/drivers/video/backlight/corgi_lcd.c b/drivers/video/backlight/corgi_lcd.c
index 25ef0cbd7583..33f5d80495e6 100644
--- a/drivers/video/backlight/corgi_lcd.c
+++ b/drivers/video/backlight/corgi_lcd.c
@@ -420,13 +420,7 @@ static int corgi_bl_set_intensity(struct corgi_lcd *lcd, int intensity)
 static int corgi_bl_update_status(struct backlight_device *bd)
 {
 	struct corgi_lcd *lcd = bl_get_data(bd);
-	int intensity = bd->props.brightness;
-
-	if (bd->props.power != FB_BLANK_UNBLANK)
-		intensity = 0;
-
-	if (bd->props.fb_blank != FB_BLANK_UNBLANK)
-		intensity = 0;
+	int intensity = backlight_get_brightness(bd);
 
 	if (corgibl_flags & CORGIBL_SUSPENDED)
 		intensity = 0;
diff --git a/drivers/video/backlight/da903x_bl.c b/drivers/video/backlight/da903x_bl.c
index 62540e4bdedb..71f21bbc7a9f 100644
--- a/drivers/video/backlight/da903x_bl.c
+++ b/drivers/video/backlight/da903x_bl.c
@@ -77,18 +77,7 @@ static int da903x_backlight_set(struct backlight_device *bl, int brightness)
 
 static int da903x_backlight_update_status(struct backlight_device *bl)
 {
-	int brightness = bl->props.brightness;
-
-	if (bl->props.power != FB_BLANK_UNBLANK)
-		brightness = 0;
-
-	if (bl->props.fb_blank != FB_BLANK_UNBLANK)
-		brightness = 0;
-
-	if (bl->props.state & BL_CORE_SUSPENDED)
-		brightness = 0;
-
-	return da903x_backlight_set(bl, brightness);
+	return da903x_backlight_set(bl, backlight_get_brightness(bl));
 }
 
 static int da903x_backlight_get_brightness(struct backlight_device *bl)
diff --git a/drivers/video/backlight/ep93xx_bl.c b/drivers/video/backlight/ep93xx_bl.c
index 4149e0b2f83c..2387009d452d 100644
--- a/drivers/video/backlight/ep93xx_bl.c
+++ b/drivers/video/backlight/ep93xx_bl.c
@@ -36,13 +36,7 @@ static int ep93xxbl_set(struct backlight_device *bl, int brightness)
 
 static int ep93xxbl_update_status(struct backlight_device *bl)
 {
-	int brightness = bl->props.brightness;
-
-	if (bl->props.power != FB_BLANK_UNBLANK ||
-	    bl->props.fb_blank != FB_BLANK_UNBLANK)
-		brightness = 0;
-
-	return ep93xxbl_set(bl, brightness);
+	return ep93xxbl_set(bl, backlight_get_brightness(bl));
 }
 
 static int ep93xxbl_get_brightness(struct backlight_device *bl)
diff --git a/drivers/video/backlight/hp680_bl.c b/drivers/video/backlight/hp680_bl.c
index 8ea42b8d9bc8..9123c33def05 100644
--- a/drivers/video/backlight/hp680_bl.c
+++ b/drivers/video/backlight/hp680_bl.c
@@ -33,12 +33,8 @@ static void hp680bl_send_intensity(struct backlight_device *bd)
 {
 	unsigned long flags;
 	u16 v;
-	int intensity = bd->props.brightness;
+	int intensity = backlight_get_brightness(bd);
 
-	if (bd->props.power != FB_BLANK_UNBLANK)
-		intensity = 0;
-	if (bd->props.fb_blank != FB_BLANK_UNBLANK)
-		intensity = 0;
 	if (hp680bl_suspended)
 		intensity = 0;
 
diff --git a/drivers/video/backlight/kb3886_bl.c b/drivers/video/backlight/kb3886_bl.c
index 1dfe13c18925..55794b239cff 100644
--- a/drivers/video/backlight/kb3886_bl.c
+++ b/drivers/video/backlight/kb3886_bl.c
@@ -87,12 +87,8 @@ static const struct dmi_system_id kb3886bl_device_table[] __initconst = {
 
 static int kb3886bl_send_intensity(struct backlight_device *bd)
 {
-	int intensity = bd->props.brightness;
+	int intensity = backlight_get_brightness(bd);
 
-	if (bd->props.power != FB_BLANK_UNBLANK)
-		intensity = 0;
-	if (bd->props.fb_blank != FB_BLANK_UNBLANK)
-		intensity = 0;
 	if (kb3886bl_flags & KB3886BL_SUSPENDED)
 		intensity = 0;
 
diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
index 3f66549997c8..f54d256e2d54 100644
--- a/drivers/video/backlight/led_bl.c
+++ b/drivers/video/backlight/led_bl.c
@@ -54,12 +54,7 @@ static void led_bl_power_off(struct led_bl_data *priv)
 static int led_bl_update_status(struct backlight_device *bl)
 {
 	struct led_bl_data *priv = bl_get_data(bl);
-	int brightness = bl->props.brightness;
-
-	if (bl->props.power != FB_BLANK_UNBLANK ||
-	    bl->props.fb_blank != FB_BLANK_UNBLANK ||
-	    bl->props.state & BL_CORE_FBBLANK)
-		brightness = 0;
+	int brightness = backlight_get_brightness(bl);
 
 	if (brightness > 0)
 		led_bl_set_brightness(priv, brightness);
diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index ee09d1bd02b9..d07a2bd805fc 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -39,14 +39,8 @@ static inline int lm3533_bl_get_ctrlbank_id(struct lm3533_bl *bl)
 static int lm3533_bl_update_status(struct backlight_device *bd)
 {
 	struct lm3533_bl *bl = bl_get_data(bd);
-	int brightness = bd->props.brightness;
 
-	if (bd->props.power != FB_BLANK_UNBLANK)
-		brightness = 0;
-	if (bd->props.fb_blank != FB_BLANK_UNBLANK)
-		brightness = 0;
-
-	return lm3533_ctrlbank_set_brightness(&bl->cb, (u8)brightness);
+	return lm3533_ctrlbank_set_brightness(&bl->cb, backlight_get_brightness(bd));
 }
 
 static int lm3533_bl_get_brightness(struct backlight_device *bd)
diff --git a/drivers/video/backlight/locomolcd.c b/drivers/video/backlight/locomolcd.c
index cdc02e04f89d..297ee2e1ab0b 100644
--- a/drivers/video/backlight/locomolcd.c
+++ b/drivers/video/backlight/locomolcd.c
@@ -111,12 +111,8 @@ static int current_intensity;
 
 static int locomolcd_set_intensity(struct backlight_device *bd)
 {
-	int intensity = bd->props.brightness;
+	int intensity = backlight_get_brightness(bd);
 
-	if (bd->props.power != FB_BLANK_UNBLANK)
-		intensity = 0;
-	if (bd->props.fb_blank != FB_BLANK_UNBLANK)
-		intensity = 0;
 	if (locomolcd_flags & LOCOMOLCD_SUSPENDED)
 		intensity = 0;
 
diff --git a/drivers/video/backlight/lv5207lp.c b/drivers/video/backlight/lv5207lp.c
index c6ad73a784e2..1842ae9a55f8 100644
--- a/drivers/video/backlight/lv5207lp.c
+++ b/drivers/video/backlight/lv5207lp.c
@@ -46,12 +46,7 @@ static int lv5207lp_write(struct lv5207lp *lv, u8 reg, u8 data)
 static int lv5207lp_backlight_update_status(struct backlight_device *backlight)
 {
 	struct lv5207lp *lv = bl_get_data(backlight);
-	int brightness = backlight->props.brightness;
-
-	if (backlight->props.power != FB_BLANK_UNBLANK ||
-	    backlight->props.fb_blank != FB_BLANK_UNBLANK ||
-	    backlight->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
-		brightness = 0;
+	int brightness = backlight_get_brightness(backlight);
 
 	if (brightness) {
 		lv5207lp_write(lv, LV5207LP_CTRL1,
diff --git a/drivers/video/backlight/max8925_bl.c b/drivers/video/backlight/max8925_bl.c
index 97cc260ff9d1..e607ec6fd4bf 100644
--- a/drivers/video/backlight/max8925_bl.c
+++ b/drivers/video/backlight/max8925_bl.c
@@ -64,18 +64,7 @@ static int max8925_backlight_set(struct backlight_device *bl, int brightness)
 
 static int max8925_backlight_update_status(struct backlight_device *bl)
 {
-	int brightness = bl->props.brightness;
-
-	if (bl->props.power != FB_BLANK_UNBLANK)
-		brightness = 0;
-
-	if (bl->props.fb_blank != FB_BLANK_UNBLANK)
-		brightness = 0;
-
-	if (bl->props.state & BL_CORE_SUSPENDED)
-		brightness = 0;
-
-	return max8925_backlight_set(bl, brightness);
+	return max8925_backlight_set(bl, backlight_get_brightness(bl));
 }
 
 static int max8925_backlight_get_brightness(struct backlight_device *bl)
diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
index 82b8d7594701..eff64db2e02e 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -108,14 +108,9 @@ static int compute_duty_cycle(struct pwm_bl_data *pb, int brightness)
 static int pwm_backlight_update_status(struct backlight_device *bl)
 {
 	struct pwm_bl_data *pb = bl_get_data(bl);
-	int brightness = bl->props.brightness;
+	int brightness = backlight_get_brightness(bl);
 	struct pwm_state state;
 
-	if (bl->props.power != FB_BLANK_UNBLANK ||
-	    bl->props.fb_blank != FB_BLANK_UNBLANK ||
-	    bl->props.state & BL_CORE_FBBLANK)
-		brightness = 0;
-
 	if (pb->notify)
 		brightness = pb->notify(pb->dev, brightness);
 
diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 4c8c34b99441..94d3b96244f0 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -433,14 +433,9 @@ static int wled5_ovp_delay(struct wled *wled)
 static int wled_update_status(struct backlight_device *bl)
 {
 	struct wled *wled = bl_get_data(bl);
-	u16 brightness = bl->props.brightness;
+	u16 brightness = backlight_get_brightness(bl);
 	int rc = 0;
 
-	if (bl->props.power != FB_BLANK_UNBLANK ||
-	    bl->props.fb_blank != FB_BLANK_UNBLANK ||
-	    bl->props.state & BL_CORE_FBBLANK)
-		brightness = 0;
-
 	mutex_lock(&wled->lock);
 	if (brightness) {
 		rc = wled->wled_set_brightness(wled, brightness);
diff --git a/drivers/video/backlight/tps65217_bl.c b/drivers/video/backlight/tps65217_bl.c
index 762e3feed097..8457166f357f 100644
--- a/drivers/video/backlight/tps65217_bl.c
+++ b/drivers/video/backlight/tps65217_bl.c
@@ -77,15 +77,7 @@ static int tps65217_bl_update_status(struct backlight_device *bl)
 {
 	struct tps65217_bl *tps65217_bl = bl_get_data(bl);
 	int rc;
-	int brightness = bl->props.brightness;
-
-	if (bl->props.state & BL_CORE_SUSPENDED)
-		brightness = 0;
-
-	if ((bl->props.power != FB_BLANK_UNBLANK) ||
-		(bl->props.fb_blank != FB_BLANK_UNBLANK))
-		/* framebuffer in low power mode or blanking active */
-		brightness = 0;
+	int brightness = backlight_get_brightness(bl);
 
 	if (brightness > 0) {
 		rc = tps65217_reg_write(tps65217_bl->tps,
diff --git a/drivers/video/backlight/wm831x_bl.c b/drivers/video/backlight/wm831x_bl.c
index e55977d54c15..c5aaee205bdf 100644
--- a/drivers/video/backlight/wm831x_bl.c
+++ b/drivers/video/backlight/wm831x_bl.c
@@ -91,18 +91,7 @@ static int wm831x_backlight_set(struct backlight_device *bl, int brightness)
 
 static int wm831x_backlight_update_status(struct backlight_device *bl)
 {
-	int brightness = bl->props.brightness;
-
-	if (bl->props.power != FB_BLANK_UNBLANK)
-		brightness = 0;
-
-	if (bl->props.fb_blank != FB_BLANK_UNBLANK)
-		brightness = 0;
-
-	if (bl->props.state & BL_CORE_SUSPENDED)
-		brightness = 0;
-
-	return wm831x_backlight_set(bl, brightness);
+	return wm831x_backlight_set(bl, backlight_get_brightness(bl));
 }
 
 static int wm831x_backlight_get_brightness(struct backlight_device *bl)
-- 
2.25.1

