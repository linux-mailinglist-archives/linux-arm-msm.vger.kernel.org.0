Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD97213F81
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2020 20:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgGCSqZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jul 2020 14:46:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbgGCSqZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jul 2020 14:46:25 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 007C6C061794;
        Fri,  3 Jul 2020 11:46:24 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id m26so19030351lfo.13;
        Fri, 03 Jul 2020 11:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=59JfyX1WPdKVllheyw55/VatnLv0Vnvhrfc5kCXlkEY=;
        b=jxTsAzyZFA3fIkxKASQZ+zaPiQd+OmiSkpJeU3TMQjJDb3pY9Sw/APCodqZpPHQ9Wd
         gIXWXiBY2jBqzM9COUJQVgUKL5wNok38Le9mru51Ne6twHTh4LKY/CpgbTK1DJHm1Z8W
         K6X+tBxWakZKTraZKpVJHEemek9sxWA703UIbmo1utesmV8PgJxj3hfSqnWD5ARoEuSk
         fLxt/+3Dn4io674ITjBIVl77Dj9nJ0YC8VwVT+IgSHPKVdAEoxcI+PpcJCHxMIvayH2E
         XTLT51QJLyqXOoj3jIuSfIlWtxwJEmGyJthxxsxycR3Yyti6a+LOdcQWcldWYLJk240d
         DKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=59JfyX1WPdKVllheyw55/VatnLv0Vnvhrfc5kCXlkEY=;
        b=P/KpgSHIIC+ZzE0Em8ZmILROXsnmLMgouYk/whBVj3ZLM6/iFZLMg7HKoPkdLLiAR5
         7uFxRqbKPPVJL1D808kRrEJaycFPnGkKkXfunNfN94R4tlK5XhF3u9/q9lOqZ1nEYz6L
         HqsQ6cTXea3qLfjPfVhI00Q786GOKh00IiPeZMZZXoWZKHo3exG2zY4iPousiolBIQep
         gW5AVxCwBi/q7CUG5UFOm0XSca6jZeqEju26w4rUp4IEkHyGtoXKD0vZaaR+aagz4n1V
         unE4Ih/PXK9qe8eotSIDhd9j5ONsCDw8xAfsvOdCxuS+YQuRXfY9YKM1IlM3tWYPbXlw
         NN6Q==
X-Gm-Message-State: AOAM533za36newbimTbsYMfQGKonst3MCsLlK5JbDa4tmIhbSlJGiQ+G
        AWbj8X+VOumRjz8FwQNtKRk=
X-Google-Smtp-Source: ABdhPJwY6tHnd7M7fpG9C1mdeyfb6WozR5cvpF5G+nQZYqOAbmOw0Q1/T3JABcLVEWZwCT+HGeHHfQ==
X-Received: by 2002:ac2:46f0:: with SMTP id q16mr23003197lfo.51.1593801983423;
        Fri, 03 Jul 2020 11:46:23 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
        by smtp.gmail.com with ESMTPSA id h22sm4404224ljg.1.2020.07.03.11.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 11:46:22 -0700 (PDT)
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
Subject: [PATCH v4 10/20] backlight: add overview and update existing doc
Date:   Fri,  3 Jul 2020 20:45:36 +0200
Message-Id: <20200703184546.144664-11-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703184546.144664-1-sam@ravnborg.org>
References: <20200703184546.144664-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add overview chapter to backlight.c.
Update existing kernel-doc to follow a more consistent
style and drop kernel-doc for deprecated functions.

v4:
  - Include updated devm_of_find_backlight doc
    (was accidently included in a later patch)

v3:
  - Updated a few editorial details (Daniel)

v2:
  - Sevaral editorial corrections that makes reading
    much easier (Daniel)
  - Spelling fixes (Daniel)
  - updated intro chapter with a little more info

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>
---
 drivers/video/backlight/backlight.c | 143 +++++++++++++++++++---------
 1 file changed, 100 insertions(+), 43 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 7e249aa90b0e..db8717581ec5 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -22,6 +22,47 @@
 #include <asm/backlight.h>
 #endif
 
+/**
+ * DOC: overview
+ *
+ * The backlight core supports implementing backlight drivers.
+ *
+ * A backlight driver registers a driver using
+ * devm_backlight_device_register(). The properties of the backlight
+ * driver such as type and max_brightness must be specified.
+ * When the core detect changes in for example brightness or power state
+ * the update_status() operation is called. The backlight driver shall
+ * implement this operation and use it to adjust backlight.
+ *
+ * Several sysfs attributes are provided by the backlight core::
+ *
+ * - brightness         R/W, set the requested brightness level
+ * - actual_brighness   RO, the brightness level used by the HW
+ * - max_brightness     RO, the maximum  brightness level supported
+ *
+ * See Documentation/ABI/stable/sysfs-class-backlight for the full list.
+ *
+ * The backlight can be adjusted using the sysfs interface, and
+ * the backlight driver may also support adjusting backlight using
+ * a hot-key or some other platfrom or firmware specific way.
+ *
+ * The driver must implement the get_brightness() operation if
+ * the HW do not support all the levels that can be specified in
+ * brightness, thus providing user-space access to the actual level
+ * via the actual_brightness attribute.
+ *
+ * When the backlight changes this is reported to user-space using
+ * an uevent connected to the actual_brightness attribute.
+ * When brightness is set by platform specific means, for example
+ * a hot-key to adjust backlight, the driver must notify the backlight
+ * core that brightness has changed using backlight_force_update().
+ *
+ * The backlight driver core receives notifications from fbdev and
+ * if the event is FB_EVENT_BLANK and if the value of blank, from the
+ * FBIOBLANK ioclt, results in a change in the backlight state the
+ * update_status() operation is called.
+ */
+
 static struct list_head backlight_dev_list;
 static struct mutex backlight_dev_list_mutex;
 static struct blocking_notifier_head backlight_notifier;
@@ -40,9 +81,17 @@ static const char *const backlight_scale_types[] = {
 
 #if defined(CONFIG_FB) || (defined(CONFIG_FB_MODULE) && \
 			   defined(CONFIG_BACKLIGHT_CLASS_DEVICE_MODULE))
-/* This callback gets called when something important happens inside a
- * framebuffer driver. We're looking if that important event is blanking,
- * and if it is and necessary, we're switching backlight power as well ...
+/*
+ * fb_notifier_callback
+ *
+ * This callback gets called when something important happens inside a
+ * framebuffer driver. The backlight core only cares about FB_BLANK_UNBLANK
+ * which is reported to the driver using backlight_update_status()
+ * as a state change.
+ *
+ * There may be several fbdev's connected to the backlight device,
+ * in which case they are kept track of. A state change is only reported
+ * if there is a change in backlight for the specified fbdev.
  */
 static int fb_notifier_callback(struct notifier_block *self,
 				unsigned long event, void *data)
@@ -318,12 +367,15 @@ static struct attribute *bl_device_attrs[] = {
 ATTRIBUTE_GROUPS(bl_device);
 
 /**
- * backlight_force_update - tell the backlight subsystem that hardware state
- *   has changed
+ * backlight_force_update - force an update due to a hardware change
  * @bd: the backlight device to update
+ * @reason: the method used for the backlight update
  *
  * Updates the internal state of the backlight in response to a hardware event,
- * and generate a uevent to notify userspace
+ * and generates an uevent to notify userspace. A backlight driver shall call
+ * backlight_force_update() when the backlight is changed using, for example,
+ * a hot-key. The updated brightness is read using get_brightness() and the
+ * brightness value is reported using an uevent.
  */
 void backlight_force_update(struct backlight_device *bd,
 			    enum backlight_update_reason reason)
@@ -336,19 +388,7 @@ void backlight_force_update(struct backlight_device *bd,
 }
 EXPORT_SYMBOL(backlight_force_update);
 
-/**
- * backlight_device_register - create and register a new object of
- *   backlight_device class.
- * @name: the name of the new object(must be the same as the name of the
- *   respective framebuffer device).
- * @parent: a pointer to the parent device
- * @devdata: an optional pointer to be stored for private driver use. The
- *   methods may retrieve it by using bl_get_data(bd).
- * @ops: the backlight operations structure.
- *
- * Creates and registers new backlight device. Returns either an
- * ERR_PTR() or a pointer to the newly allocated device.
- */
+/* deprecated - use devm_backlight_device_register() */
 struct backlight_device *backlight_device_register(const char *name,
 	struct device *parent, void *devdata, const struct backlight_ops *ops,
 	const struct backlight_properties *props)
@@ -415,6 +455,15 @@ struct backlight_device *backlight_device_register(const char *name,
 }
 EXPORT_SYMBOL(backlight_device_register);
 
+/** backlight_device_get_by_type - find first backlight device of a type
+ * @type: the type of backlight device
+ *
+ * Look up the first backlight device of the specified type
+ *
+ * RETURNS:
+ *
+ * Pointer to backlight device if any was found. Otherwise NULL.
+ */
 struct backlight_device *backlight_device_get_by_type(enum backlight_type type)
 {
 	bool found = false;
@@ -454,12 +503,7 @@ struct backlight_device *backlight_device_get_by_name(const char *name)
 }
 EXPORT_SYMBOL(backlight_device_get_by_name);
 
-/**
- * backlight_device_unregister - unregisters a backlight device object.
- * @bd: the backlight device object to be unregistered and freed.
- *
- * Unregisters a previously registered via backlight_device_register object.
- */
+/* deprecated - use devm_backlight_device_unregister() */
 void backlight_device_unregister(struct backlight_device *bd)
 {
 	if (!bd)
@@ -507,10 +551,12 @@ static int devm_backlight_device_match(struct device *dev, void *res,
  * backlight_register_notifier - get notified of backlight (un)registration
  * @nb: notifier block with the notifier to call on backlight (un)registration
  *
- * @return 0 on success, otherwise a negative error code
- *
  * Register a notifier to get notified when backlight devices get registered
  * or unregistered.
+ *
+ * RETURNS:
+ *
+ * 0 on success, otherwise a negative error code
  */
 int backlight_register_notifier(struct notifier_block *nb)
 {
@@ -522,10 +568,12 @@ EXPORT_SYMBOL(backlight_register_notifier);
  * backlight_unregister_notifier - unregister a backlight notifier
  * @nb: notifier block to unregister
  *
- * @return 0 on success, otherwise a negative error code
- *
  * Register a notifier to get notified when backlight devices get registered
  * or unregistered.
+ *
+ * RETURNS:
+ *
+ * 0 on success, otherwise a negative error code
  */
 int backlight_unregister_notifier(struct notifier_block *nb)
 {
@@ -534,20 +582,22 @@ int backlight_unregister_notifier(struct notifier_block *nb)
 EXPORT_SYMBOL(backlight_unregister_notifier);
 
 /**
- * devm_backlight_device_register - resource managed backlight_device_register()
+ * devm_backlight_device_register - register a new backlight device
  * @dev: the device to register
  * @name: the name of the device
- * @parent: a pointer to the parent device
+ * @parent: a pointer to the parent device (often the same as @dev)
  * @devdata: an optional pointer to be stored for private driver use
  * @ops: the backlight operations structure
  * @props: the backlight properties
  *
- * @return a struct backlight on success, or an ERR_PTR on error
+ * Creates and registers new backlight device. When a backlight device
+ * is registered the configuration must be specified in the @props
+ * parameter. See description of &backlight_properties.
  *
- * Managed backlight_device_register(). The backlight_device returned
- * from this function are automatically freed on driver detach.
- * See backlight_device_register() for more information.
- */
+ * RETURNS:
+ *
+ * struct backlight on success, or an ERR_PTR on error
+*/
 struct backlight_device *devm_backlight_device_register(struct device *dev,
 	const char *name, struct device *parent, void *devdata,
 	const struct backlight_ops *ops,
@@ -574,13 +624,13 @@ struct backlight_device *devm_backlight_device_register(struct device *dev,
 EXPORT_SYMBOL(devm_backlight_device_register);
 
 /**
- * devm_backlight_device_unregister - resource managed backlight_device_unregister()
+ * devm_backlight_device_unregister - unregister backlight device
  * @dev: the device to unregister
  * @bd: the backlight device to unregister
  *
- * Deallocated a backlight allocated with devm_backlight_device_register().
+ * Deallocates a backlight allocated with devm_backlight_device_register().
  * Normally this function will not need to be called and the resource management
- * code will ensure that the resource is freed.
+ * code will ensure that the resources are freed.
  */
 void devm_backlight_device_unregister(struct device *dev,
 				struct backlight_device *bd)
@@ -671,12 +721,19 @@ static void devm_backlight_release(void *data)
 }
 
 /**
- * devm_of_find_backlight - Resource-managed of_find_backlight()
- * @dev: Device
+ * devm_of_find_backlight - find backlight for a device
+ * @dev: the device
  *
- * Device managed version of of_find_backlight().
- * The reference on the backlight device is automatically
+ * This function looks for a property named 'backlight' on the DT node
+ * connected to @dev and looks up the backlight device. The lookup is
+ * device managed so the reference to the backlight device is automatically
  * dropped on driver detach.
+ *
+ * RETURNS:
+ *
+ * A pointer to the backlight device if found.
+ * Error pointer -EPROBE_DEFER if the DT property is set, but no backlight
+ * device is found. NULL if there's no backlight property.
  */
 struct backlight_device *devm_of_find_backlight(struct device *dev)
 {
-- 
2.25.1

