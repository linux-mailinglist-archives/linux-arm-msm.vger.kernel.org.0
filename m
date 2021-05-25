Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F053738FBBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 09:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbhEYHc6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 03:32:58 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:8271 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231671AbhEYHc6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 03:32:58 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 25 May 2021 00:31:29 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 25 May 2021 00:31:27 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
  by ironmsg01-blr.qualcomm.com with ESMTP; 25 May 2021 13:00:37 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
        id 542A02145A; Tue, 25 May 2021 13:00:36 +0530 (IST)
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
Subject: [v4 1/4] drm/panel-simple: Add basic DPCD backlight support
Date:   Tue, 25 May 2021 13:00:28 +0530
Message-Id: <1621927831-29471-2-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621927831-29471-1-git-send-email-rajeevny@codeaurora.org>
References: <1621927831-29471-1-git-send-email-rajeevny@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add basic support of panel backlight control over eDP aux channel
using VESA's standard backlight control interface.

Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
---

This patch depends on [1] (drm/panel: panel-simple: Stash DP AUX bus; 
allow using it for DDC) 

Changes in v4:
- New

[1] https://lore.kernel.org/dri-devel/20210524165920.v8.7.I18e60221f6d048d14d6c50a770b15f356fa75092@changeid/

 drivers/gpu/drm/panel/panel-simple.c | 99 ++++++++++++++++++++++++++++++++++--
 1 file changed, 96 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index b09be6e..f9e4e60 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -21,6 +21,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/backlight.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/iopoll.h>
@@ -171,6 +172,19 @@ struct panel_desc {
 
 	/** @connector_type: LVDS, eDP, DSI, DPI, etc. */
 	int connector_type;
+
+	/**
+	 * @uses_dpcd_backlight: Panel supports eDP dpcd backlight control.
+	 *
+	 * Set true, if the panel supports backlight control over eDP AUX channel
+	 * using DPCD registers as per VESA's standard.
+	 */
+	bool uses_dpcd_backlight;
+};
+
+struct edp_backlight {
+	struct backlight_device *dev;
+	struct drm_edp_backlight_info info;
 };
 
 struct panel_simple {
@@ -194,6 +208,8 @@ struct panel_simple {
 
 	struct edid *edid;
 
+	struct edp_backlight *edp_bl;
+
 	struct drm_display_mode override_mode;
 
 	enum drm_panel_orientation orientation;
@@ -330,10 +346,14 @@ static void panel_simple_wait(ktime_t start_ktime, unsigned int min_ms)
 static int panel_simple_disable(struct drm_panel *panel)
 {
 	struct panel_simple *p = to_panel_simple(panel);
+	struct edp_backlight *bl = p->edp_bl;
 
 	if (!p->enabled)
 		return 0;
 
+	if (p->desc->uses_dpcd_backlight && bl)
+		drm_edp_backlight_disable(p->aux, &bl->info);
+
 	if (p->desc->delay.disable)
 		msleep(p->desc->delay.disable);
 
@@ -496,6 +516,7 @@ static int panel_simple_prepare(struct drm_panel *panel)
 static int panel_simple_enable(struct drm_panel *panel)
 {
 	struct panel_simple *p = to_panel_simple(panel);
+	struct edp_backlight *bl = p->edp_bl;
 
 	if (p->enabled)
 		return 0;
@@ -505,6 +526,10 @@ static int panel_simple_enable(struct drm_panel *panel)
 
 	panel_simple_wait(p->prepared_time, p->desc->delay.prepare_to_enable);
 
+	if (p->desc->uses_dpcd_backlight && bl)
+		drm_edp_backlight_enable(p->aux, &bl->info,
+					 bl->dev->props.brightness);
+
 	p->enabled = true;
 
 	return 0;
@@ -565,6 +590,59 @@ static const struct drm_panel_funcs panel_simple_funcs = {
 	.get_timings = panel_simple_get_timings,
 };
 
+static int edp_backlight_update_status(struct backlight_device *bd)
+{
+	struct panel_simple *p = bl_get_data(bd);
+	struct edp_backlight *bl = p->edp_bl;
+
+	if (!p->enabled)
+		return 0;
+
+	return drm_edp_backlight_set_level(p->aux, &bl->info, bd->props.brightness);
+}
+
+static const struct backlight_ops edp_backlight_ops = {
+	.update_status = edp_backlight_update_status,
+};
+
+static int edp_backlight_register(struct device *dev, struct panel_simple *panel)
+{
+	struct edp_backlight *bl;
+	struct backlight_properties props = { 0 };
+	u16 current_level;
+	u8 current_mode;
+	u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE];
+	int ret;
+
+	bl = devm_kzalloc(dev, sizeof(*bl), GFP_KERNEL);
+	if (!bl)
+		return -ENOMEM;
+
+	ret = drm_dp_dpcd_read(panel->aux, DP_EDP_DPCD_REV, edp_dpcd,
+			       EDP_DISPLAY_CTL_CAP_SIZE);
+	if (ret < 0)
+		return ret;
+
+	ret = drm_edp_backlight_init(panel->aux, &bl->info, 0, edp_dpcd,
+				     &current_level, &current_mode);
+	if (ret < 0)
+		return ret;
+
+	props.type = BACKLIGHT_RAW;
+	props.brightness = current_level;
+	props.max_brightness = bl->info.max;
+
+	bl->dev = devm_backlight_device_register(dev, "edp_backlight",
+						dev, panel,
+						&edp_backlight_ops, &props);
+	if (IS_ERR(bl->dev))
+		return PTR_ERR(bl->dev);
+
+	panel->edp_bl = bl;
+
+	return 0;
+}
+
 static struct panel_desc panel_dpi;
 
 static int panel_dpi_probe(struct device *dev,
@@ -796,9 +874,24 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
 
 	drm_panel_init(&panel->base, dev, &panel_simple_funcs, connector_type);
 
-	err = drm_panel_of_backlight(&panel->base);
-	if (err)
-		goto disable_pm_runtime;
+	if (panel->desc->uses_dpcd_backlight) {
+		if (!panel->aux) {
+			dev_err(dev, "edp backlight needs DP aux\n");
+			err = -EINVAL;
+			goto disable_pm_runtime;
+		}
+
+		err = edp_backlight_register(dev, panel);
+		if (err) {
+			dev_err(dev, "failed to register edp backlight %d\n", err);
+			goto disable_pm_runtime;
+		}
+
+	} else {
+		err = drm_panel_of_backlight(&panel->base);
+		if (err)
+			goto disable_pm_runtime;
+	}
 
 	drm_panel_add(&panel->base);
 
-- 
2.7.4

