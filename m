Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC143AD971
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jun 2021 12:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231474AbhFSKna (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Jun 2021 06:43:30 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:64758 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230430AbhFSKn3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Jun 2021 06:43:29 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 19 Jun 2021 03:41:18 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 19 Jun 2021 03:41:16 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
  by ironmsg01-blr.qualcomm.com with ESMTP; 19 Jun 2021 16:10:37 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
        id E2C0321507; Sat, 19 Jun 2021 16:10:36 +0530 (IST)
From:   Rajeev Nandan <rajeevny@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Rajeev Nandan <rajeevny@codeaurora.org>,
        linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
        sam@ravnborg.org, robdclark@gmail.com, dianders@chromium.org,
        lyude@redhat.com, jani.nikula@intel.com, robh@kernel.org,
        laurent.pinchart@ideasonboard.com, a.hajda@samsung.com,
        daniel.thompson@linaro.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, seanpaul@chromium.org,
        kalyan_t@codeaurora.org, mkrishn@codeaurora.org
Subject: [v7 3/5] drm/panel-simple: Support for delays between GPIO & regulator
Date:   Sat, 19 Jun 2021 16:10:28 +0530
Message-Id: <1624099230-20899-4-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624099230-20899-1-git-send-email-rajeevny@codeaurora.org>
References: <1624099230-20899-1-git-send-email-rajeevny@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some panels datasheets may specify a delay between the enable GPIO and
the regulator. Support this in panel-simple.

Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v6)

Changes in v4:
- New

Changes in v5:
- Update description (Douglas)
- Warn if "power_to_enable" or "disable_to_power_off" is non-zero and panel->enable_gpio
  is NULL (Douglas)

Changes in v6:
- Update warning message to make it more meaningful. (Douglas)

 drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 26555ec..86e5a45 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -133,6 +133,22 @@ struct panel_desc {
 		unsigned int prepare_to_enable;
 
 		/**
+		 * @delay.power_to_enable: Time for the power to enable the display on.
+		 *
+		 * The time (in milliseconds) to wait after powering up the display
+		 * before asserting its enable pin.
+		 */
+		unsigned int power_to_enable;
+
+		/**
+		 * @delay.disable_to_power_off: Time for the disable to power the display off.
+		 *
+		 * The time (in milliseconds) to wait before powering off the display
+		 * after deasserting its enable pin.
+		 */
+		unsigned int disable_to_power_off;
+
+		/**
 		 * @delay.enable: Time for the panel to display a valid frame.
 		 *
 		 * The time (in milliseconds) that it takes for the panel to
@@ -347,6 +363,10 @@ static int panel_simple_suspend(struct device *dev)
 	struct panel_simple *p = dev_get_drvdata(dev);
 
 	gpiod_set_value_cansleep(p->enable_gpio, 0);
+
+	if (p->desc->delay.disable_to_power_off)
+		msleep(p->desc->delay.disable_to_power_off);
+
 	regulator_disable(p->supply);
 	p->unprepared_time = ktime_get();
 
@@ -407,6 +427,9 @@ static int panel_simple_prepare_once(struct panel_simple *p)
 		return err;
 	}
 
+	if (p->desc->delay.power_to_enable)
+		msleep(p->desc->delay.power_to_enable);
+
 	gpiod_set_value_cansleep(p->enable_gpio, 1);
 
 	delay = p->desc->delay.prepare;
@@ -782,6 +805,11 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
 		break;
 	}
 
+	if (!panel->enable_gpio && desc->delay.disable_to_power_off)
+		dev_warn(dev, "Need a delay after disabling panel GPIO, but a GPIO wasn't provided\n");
+	if (!panel->enable_gpio && desc->delay.power_to_enable)
+		dev_warn(dev, "Need a delay before enabling panel GPIO, but a GPIO wasn't provided\n");
+
 	dev_set_drvdata(dev, panel);
 
 	/*
-- 
2.7.4

