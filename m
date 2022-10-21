Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30BF3607EF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Oct 2022 21:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiJUTTt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Oct 2022 15:19:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbiJUTTs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Oct 2022 15:19:48 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 914321208A
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 12:19:43 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id b1so6813222lfs.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 12:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A6qrVW7szpWlABctHry/L+0EpnC89Tpj5bvIwAk95eE=;
        b=lLnnsT0w4AoiJm92CNTUEtAWXAQoEtgyFFBO5xHVqKvIjJ2TxHcVTnnTD/8shypepc
         LVzJBLfMrtFveIryhbT6HWK14+HSjXxTlpGWa0qbbaoCjQqVqEango0z7Sn6tPb+A+Rx
         EWU0qngS5o56OwHzUPyAJIAXVsnqI1uK6YrO+VCU/IIJFSIcbhPywr5cZzv5+tagHDTT
         IuFBAfpdaq9xCOtMubrMNK3IoycmLoCPvDJ/sKZQpkjErvHBttUzKnjMOE/DdaVUN/hX
         gNyVashGyu9hbKwkNj9Oxn+y41eoX5RYpWYtc5+m7Dj3dvbJIwYkV/6Kfq+MsfGRH6AA
         0Ulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A6qrVW7szpWlABctHry/L+0EpnC89Tpj5bvIwAk95eE=;
        b=yabuFggLkABzboIhCgm8SAIC7HTSfQ8jAVHFRzbB5O0rpn7wSHmcnB0BKcFOIIc3nZ
         0/gBlUGyEvRncMRYa6Y8WLu62JR+JsTxBz5etEehJ08YTaEW/WkinX2pt20NpHy+0tgX
         F3DLLZhE7ITSaFXSEyuEcQV5kf5ZRRPNvjQIjBzT8uBrkcHiJPAh8yVStYV3TYTJStF3
         Bv2eU3zlh5b6bPS5gs5QpfpbhgXmGPiGD6QVwSm8DLB9sCUlVif3uMBVvTIx2AklxqGC
         sn8VD54NMTNgxZ8nMFoPAQrXPRD1tdEllIUmFAQexLTV23LflsLsP7FNJKKqfjcBOxKG
         xD2w==
X-Gm-Message-State: ACrzQf2Tb8QH+Su5KcYiVV3kUvGEsvUB1W/cMJlOHd9Wghb1XBI8J0w+
        ek+hyIgTjmkCKhNQ49UCCwJVAw==
X-Google-Smtp-Source: AMsMyM6Ojiyh1OkDvuDhHZjKXFu9XN0xeygEEMuNyGLTj4Y0dxhg82nUX17KwPwlqGIDH3mV4+Yjpg==
X-Received: by 2002:a05:6512:3a4:b0:4a4:6db7:2d6b with SMTP id v4-20020a05651203a400b004a46db72d6bmr6955419lfp.403.1666379981935;
        Fri, 21 Oct 2022 12:19:41 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d25-20020a2eb059000000b0026e00df2ed0sm3518337ljl.30.2022.10.21.12.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 12:19:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-pwm@vger.kernel.org
Subject: [PATCH] led: qcom-lpg: Fix sleeping in atomic
Date:   Fri, 21 Oct 2022 22:19:40 +0300
Message-Id: <20221021191940.2422408-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

lpg_brighness_set() function can sleep, while led's brightness_set()
callback must be non-blocking. Change LPG driver to use
brightness_set_blocking() instead.

BUG: sleeping function called from invalid context at kernel/locking/mutex.c:580
in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 0, name: swapper/0
preempt_count: 101, expected: 0
INFO: lockdep is turned off.
CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W          6.1.0-rc1-00014-gbe99b089c6fc-dirty #85
Hardware name: Qualcomm Technologies, Inc. DB820c (DT)
Call trace:
 dump_backtrace.part.0+0xe4/0xf0
 show_stack+0x18/0x40
 dump_stack_lvl+0x88/0xb4
 dump_stack+0x18/0x34
 __might_resched+0x170/0x254
 __might_sleep+0x48/0x9c
 __mutex_lock+0x4c/0x400
 mutex_lock_nested+0x2c/0x40
 lpg_brightness_single_set+0x40/0x90
 led_set_brightness_nosleep+0x34/0x60
 led_heartbeat_function+0x80/0x170
 call_timer_fn+0xb8/0x340
 __run_timers.part.0+0x20c/0x254
 run_timer_softirq+0x3c/0x7c
 _stext+0x14c/0x578
 ____do_softirq+0x10/0x20
 call_on_irq_stack+0x2c/0x5c
 do_softirq_own_stack+0x1c/0x30
 __irq_exit_rcu+0x164/0x170
 irq_exit_rcu+0x10/0x40
 el1_interrupt+0x38/0x50
 el1h_64_irq_handler+0x18/0x2c
 el1h_64_irq+0x64/0x68
 cpuidle_enter_state+0xc8/0x380
 cpuidle_enter+0x38/0x50
 do_idle+0x244/0x2d0
 cpu_startup_entry+0x24/0x30
 rest_init+0x128/0x1a0
 arch_post_acpi_subsys_init+0x0/0x18
 start_kernel+0x6f4/0x734
 __primary_switched+0xbc/0xc4

Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 02f51cc61837..c1a56259226f 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -602,8 +602,8 @@ static void lpg_brightness_set(struct lpg_led *led, struct led_classdev *cdev,
 		lpg_lut_sync(lpg, lut_mask);
 }
 
-static void lpg_brightness_single_set(struct led_classdev *cdev,
-				      enum led_brightness value)
+static int lpg_brightness_single_set(struct led_classdev *cdev,
+				     enum led_brightness value)
 {
 	struct lpg_led *led = container_of(cdev, struct lpg_led, cdev);
 	struct mc_subled info;
@@ -614,10 +614,12 @@ static void lpg_brightness_single_set(struct led_classdev *cdev,
 	lpg_brightness_set(led, cdev, &info);
 
 	mutex_unlock(&led->lpg->lock);
+
+	return 0;
 }
 
-static void lpg_brightness_mc_set(struct led_classdev *cdev,
-				  enum led_brightness value)
+static int lpg_brightness_mc_set(struct led_classdev *cdev,
+				 enum led_brightness value)
 {
 	struct led_classdev_mc *mc = lcdev_to_mccdev(cdev);
 	struct lpg_led *led = container_of(mc, struct lpg_led, mcdev);
@@ -628,6 +630,8 @@ static void lpg_brightness_mc_set(struct led_classdev *cdev,
 	lpg_brightness_set(led, cdev, mc->subled_info);
 
 	mutex_unlock(&led->lpg->lock);
+
+	return 0;
 }
 
 static int lpg_blink_set(struct lpg_led *led,
@@ -1118,7 +1122,7 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
 		led->mcdev.num_colors = num_channels;
 
 		cdev = &led->mcdev.led_cdev;
-		cdev->brightness_set = lpg_brightness_mc_set;
+		cdev->brightness_set_blocking = lpg_brightness_mc_set;
 		cdev->blink_set = lpg_blink_mc_set;
 
 		/* Register pattern accessors only if we have a LUT block */
@@ -1132,7 +1136,7 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
 			return ret;
 
 		cdev = &led->cdev;
-		cdev->brightness_set = lpg_brightness_single_set;
+		cdev->brightness_set_blocking = lpg_brightness_single_set;
 		cdev->blink_set = lpg_blink_single_set;
 
 		/* Register pattern accessors only if we have a LUT block */
@@ -1151,7 +1155,7 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
 	else
 		cdev->brightness = LED_OFF;
 
-	cdev->brightness_set(cdev, cdev->brightness);
+	cdev->brightness_set_blocking(cdev, cdev->brightness);
 
 	init_data.fwnode = of_fwnode_handle(np);
 
-- 
2.35.1

