Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D16543951CE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 May 2021 17:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbhE3P7F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 May 2021 11:59:05 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:35591 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbhE3P7D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 May 2021 11:59:03 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 30 May 2021 08:57:25 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 30 May 2021 08:57:23 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
  by ironmsg02-blr.qualcomm.com with ESMTP; 30 May 2021 21:26:40 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
        id BD8FA21481; Sun, 30 May 2021 21:26:38 +0530 (IST)
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
Subject: [v5 3/5] drm/panel-simple: Support for delays between GPIO & regulator
Date:   Sun, 30 May 2021 21:26:10 +0530
Message-Id: <1622390172-31368-4-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622390172-31368-1-git-send-email-rajeevny@codeaurora.org>
References: <1622390172-31368-1-git-send-email-rajeevny@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some panels datasheets may specify a delay between the enable GPIO and
the regulator. Support this in panel-simple.

Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
---

Changes in v4:
- New

Changes in v5:
- Update description (Douglas)
- Warn if "power_to_enable" or "disable_to_power_off" is non-zero and panel->enable_gpio
  is NULL (Douglas)

 drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 047fad5..e3f5b7e 100644
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
+		dev_warn(dev, "Specify enable_gpio when using disable_to_power_off delay\n");
+	if (!panel->enable_gpio && desc->delay.power_to_enable)
+		dev_warn(dev, "Specify enable_gpio when using power_to_enable delay\n");
+
 	dev_set_drvdata(dev, panel);
 
 	/*
-- 
2.7.4

