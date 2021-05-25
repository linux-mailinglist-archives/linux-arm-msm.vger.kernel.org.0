Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FCB238FBCC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 09:31:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231710AbhEYHdG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 03:33:06 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:8271 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231721AbhEYHdC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 03:33:02 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 25 May 2021 00:31:32 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 25 May 2021 00:31:31 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
  by ironmsg01-blr.qualcomm.com with ESMTP; 25 May 2021 13:00:38 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
        id 68E8D21467; Tue, 25 May 2021 13:00:37 +0530 (IST)
From:   Rajeev Nandan <rajeevny@codeaurora.org>
To:     y@qualcomm.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     Rajeev Nandan <rajeevny@codeaurora.org>,
        linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
        sam@ravnborg.org, robdclark@gmail.com, dianders@chromium.org,
        lyude@redhat.com, jani.nikula@intel.com, robh@kernel.org,
        laurent.pinchart@ideasonboard.com, a.hajda@samsung.com,
        daniel.thompson@linaro.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, seanpaul@chromium.org,
        kalyan_t@codeaurora.org, mkrishn@codeaurora.org
Subject: [v4 2/4] drm/panel-simple: Support for delays between GPIO & regulator
Date:   Tue, 25 May 2021 13:00:29 +0530
Message-Id: <1621927831-29471-3-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621927831-29471-1-git-send-email-rajeevny@codeaurora.org>
References: <1621927831-29471-1-git-send-email-rajeevny@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some panels datasheets may specify a delay between the enable GPIO and
the regulator. Support this in panel-simple.

Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
---

Changes in v4:
- New

 drivers/gpu/drm/panel/panel-simple.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index f9e4e60..caed71b 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -134,6 +134,22 @@ struct panel_desc {
 		unsigned int prepare_to_enable;
 
 		/**
+		 * @delay.power_to_enable: Time for the power to enable the display on.
+		 *
+		 * The time (in milliseconds) that it takes for the panel to
+		 * turn the display on.
+		 */
+		unsigned int power_to_enable;
+
+		/**
+		 * @delay.disable_to_power_off: Time for the disable to power the display off.
+		 *
+		 * The time (in milliseconds) that it takes for the panel to
+		 * turn the display off.
+		 */
+		unsigned int disable_to_power_off;
+
+		/**
 		 * @delay.enable: Time for the panel to display a valid frame.
 		 *
 		 * The time (in milliseconds) that it takes for the panel to
@@ -367,6 +383,10 @@ static int panel_simple_suspend(struct device *dev)
 	struct panel_simple *p = dev_get_drvdata(dev);
 
 	gpiod_set_value_cansleep(p->enable_gpio, 0);
+
+	if (p->desc->delay.disable_to_power_off)
+		msleep(p->desc->delay.disable_to_power_off);
+
 	regulator_disable(p->supply);
 	p->unprepared_time = ktime_get();
 
@@ -427,6 +447,9 @@ static int panel_simple_prepare_once(struct panel_simple *p)
 		return err;
 	}
 
+	if (p->desc->delay.power_to_enable)
+		msleep(p->desc->delay.power_to_enable);
+
 	gpiod_set_value_cansleep(p->enable_gpio, 1);
 
 	delay = p->desc->delay.prepare;
-- 
2.7.4

