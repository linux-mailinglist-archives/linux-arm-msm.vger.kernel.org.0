Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79C3635F91D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Apr 2021 18:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349582AbhDNQlv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Apr 2021 12:41:51 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:22640 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234299AbhDNQlu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Apr 2021 12:41:50 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 14 Apr 2021 09:41:29 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Apr 2021 09:41:27 -0700
X-QCInternal: smtphost
Received: from rajeevny-linux.qualcomm.com ([10.204.66.121])
  by ironmsg01-blr.qualcomm.com with ESMTP; 14 Apr 2021 22:11:05 +0530
Received: by rajeevny-linux.qualcomm.com (Postfix, from userid 2363605)
        id 10F2B21351; Wed, 14 Apr 2021 22:11:04 +0530 (IST)
From:   Rajeev Nandan <rajeevny@codeaurora.org>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     Rajeev Nandan <rajeevny@codeaurora.org>,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, mkrishn@codeaurora.org,
        kalyan_t@codeaurora.org, hoegsberg@chromium.org,
        abhinavk@codeaurora.org, seanpaul@chromium.org
Subject: [v1 1/3] drm/dp: Add DisplayPort aux backlight control support
Date:   Wed, 14 Apr 2021 22:09:48 +0530
Message-Id: <1618418390-15055-2-git-send-email-rajeevny@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618418390-15055-1-git-send-email-rajeevny@codeaurora.org>
References: <1618418390-15055-1-git-send-email-rajeevny@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add panel backlight control using DPCD registers on the DisplayPort aux
channel.

Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
---
 drivers/gpu/drm/Kconfig                |   8 ++
 drivers/gpu/drm/Makefile               |   1 +
 drivers/gpu/drm/drm_dp_aux_backlight.c | 191 +++++++++++++++++++++++++++++++++
 include/drm/drm_dp_aux_backlight.h     |  29 +++++
 4 files changed, 229 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_dp_aux_backlight.c
 create mode 100644 include/drm/drm_dp_aux_backlight.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 85b79a7f..01f8a48 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -177,6 +177,14 @@ config DRM_DP_CEC
 	  Note: not all adapters support this feature, and even for those
 	  that do support this they often do not hook up the CEC pin.
 
+config DRM_DP_AUX_BACKLIGHT
+	bool "Enable DisplayPort aux backlight control support"
+	depends on DRM
+	select DRM_KMS_HELPER
+	help
+	  Choose this option if you want to use panel backlight control
+	  using DPCD registers on the DisplayPort aux channel.
+
 config DRM_TTM
 	tristate
 	depends on DRM && MMU
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 926adef..e41e40f 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -53,6 +53,7 @@ drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
 drm_kms_helper-$(CONFIG_DRM_KMS_CMA_HELPER) += drm_fb_cma_helper.o
 drm_kms_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
 drm_kms_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
+drm_kms_helper-$(CONFIG_DRM_DP_AUX_BACKLIGHT) += drm_dp_aux_backlight.o
 
 obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
 obj-$(CONFIG_DRM_DEBUG_SELFTEST) += selftests/
diff --git a/drivers/gpu/drm/drm_dp_aux_backlight.c b/drivers/gpu/drm/drm_dp_aux_backlight.c
new file mode 100644
index 0000000..2fc4ffb
--- /dev/null
+++ b/drivers/gpu/drm/drm_dp_aux_backlight.c
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/backlight.h>
+#include <linux/err.h>
+#include <drm/drm_dp_aux_backlight.h>
+#include <drm/drm_dp_helper.h>
+#include <drm/drm_print.h>
+
+static int drm_dp_aux_brightness_set(struct backlight_device *bd)
+{
+	struct drm_dp_aux_backlight *pdata = bl_get_data(bd);
+	u16 brightness = bd->props.brightness;
+	u8 val[2] = { 0x0 };
+	int ret = 0;
+
+	if (!pdata->enabled)
+		return 0;
+
+	if (bd->props.power != FB_BLANK_UNBLANK ||
+	    bd->props.fb_blank != FB_BLANK_UNBLANK ||
+	    bd->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
+		brightness = 0;
+
+	val[0] = brightness >> 8;
+	val[1] = brightness & 0xff;
+	ret = drm_dp_dpcd_write(pdata->aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB,
+				val, sizeof(val));
+	if (ret < 0)
+		return ret;
+
+	return ret;
+}
+
+static int drm_dp_aux_brightness_get(struct backlight_device *bd)
+{
+	struct drm_dp_aux_backlight *pdata = bl_get_data(bd);
+	u8 val[2] = { 0x0 };
+	int ret = 0;
+
+	if (!pdata->enabled)
+		return 0;
+
+	if (bd->props.power != FB_BLANK_UNBLANK ||
+	    bd->props.fb_blank != FB_BLANK_UNBLANK ||
+	    bd->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
+		return 0;
+
+	ret = drm_dp_dpcd_read(pdata->aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB,
+			       &val, sizeof(val));
+	if (ret < 0)
+		return ret;
+
+	return (val[0] << 8 | val[1]);
+}
+
+static const struct backlight_ops aux_bl_ops = {
+	.update_status = drm_dp_aux_brightness_set,
+	.get_brightness = drm_dp_aux_brightness_get,
+};
+
+/**
+ * drm_dp_aux_backlight_enable() - Enable DP aux backlight
+ * @aux_bl: the DP aux backlight to enable
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int drm_dp_aux_backlight_enable(struct drm_dp_aux_backlight *aux_bl)
+{
+	u8 val = 0;
+	int ret;
+
+	if (!aux_bl)
+		return -EINVAL;
+
+	if (aux_bl->enabled)
+		return 0;
+
+	/* Set backlight control mode */
+	ret = drm_dp_dpcd_readb(aux_bl->aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER,
+				&val);
+	if (ret < 0)
+		return ret;
+
+	val &= ~DP_EDP_BACKLIGHT_CONTROL_MODE_MASK;
+	val |= DP_EDP_BACKLIGHT_CONTROL_MODE_DPCD;
+	ret = drm_dp_dpcd_writeb(aux_bl->aux, DP_EDP_BACKLIGHT_MODE_SET_REGISTER,
+				 val);
+	if (ret < 0)
+		return ret;
+
+	/* Enable backlight */
+	ret = drm_dp_dpcd_readb(aux_bl->aux, DP_EDP_DISPLAY_CONTROL_REGISTER,
+				&val);
+	if (ret < 0)
+		return ret;
+
+	val |= DP_EDP_BACKLIGHT_ENABLE;
+	ret = drm_dp_dpcd_writeb(aux_bl->aux, DP_EDP_DISPLAY_CONTROL_REGISTER,
+				 val);
+	if (ret < 0)
+		return ret;
+
+	ret = backlight_enable(aux_bl->bd);
+	if (ret < 0)
+		DRM_DEV_INFO(aux_bl->dev, "failed to enable backlight: %d\n",
+			     ret);
+
+	aux_bl->enabled = true;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_dp_aux_backlight_enable);
+
+/**
+ * drm_dp_aux_backlight_disable() - Disable DP aux backlight
+ * @aux_bl: the DP aux backlight to disable
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int drm_dp_aux_backlight_disable(struct drm_dp_aux_backlight *aux_bl)
+{
+	u8 val = 0;
+	int ret;
+
+	if (!aux_bl)
+		return -EINVAL;
+
+	if (!aux_bl->enabled)
+		return 0;
+
+	ret = backlight_disable(aux_bl->bd);
+	if (ret < 0)
+		DRM_DEV_INFO(aux_bl->dev, "failed to disable backlight: %d\n",
+			     ret);
+
+	ret = drm_dp_dpcd_readb(aux_bl->aux, DP_EDP_DISPLAY_CONTROL_REGISTER,
+				&val);
+	if (ret < 0)
+		return ret;
+
+	val &= ~DP_EDP_BACKLIGHT_ENABLE;
+	ret = drm_dp_dpcd_writeb(aux_bl->aux, DP_EDP_DISPLAY_CONTROL_REGISTER,
+				 val);
+	if (ret < 0)
+		return ret;
+
+	aux_bl->enabled = false;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_dp_aux_backlight_disable);
+
+/**
+ * drm_dp_aux_backlight_register() - register a DP aux backlight device
+ * @name: the name of the backlight device
+ * @aux_bl: the DP aux backlight to register
+ *
+ * Creates and registers a new backlight device that uses DPCD registers
+ * on the DisplayPort aux channel to control the brightness of the panel.
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int drm_dp_aux_backlight_register(const char *name,
+				struct drm_dp_aux_backlight *aux_bl)
+{
+	struct backlight_properties bl_props = { 0 };
+	int max_brightness;
+	int ret = 0;
+
+	if (!name || !aux_bl || !aux_bl->aux)
+		return -EINVAL;
+
+	max_brightness = 0xffff;
+
+	bl_props.type = BACKLIGHT_RAW;
+	bl_props.brightness = max_brightness;
+	bl_props.max_brightness = max_brightness;
+	aux_bl->bd = devm_backlight_device_register(aux_bl->dev, name,
+						  aux_bl->dev, aux_bl,
+						  &aux_bl_ops, &bl_props);
+	if (IS_ERR(aux_bl->bd)) {
+		ret = PTR_ERR(aux_bl->bd);
+		DRM_DEV_ERROR(aux_bl->dev,
+			      "failed to register backlight (%d)\n", ret);
+		aux_bl->bd = NULL;
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_dp_aux_backlight_register);
diff --git a/include/drm/drm_dp_aux_backlight.h b/include/drm/drm_dp_aux_backlight.h
new file mode 100644
index 0000000..23cc554
--- /dev/null
+++ b/include/drm/drm_dp_aux_backlight.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _DRM_DP_AUX_BACKLIGHT_H_
+#define _DRM_DP_AUX_BACKLIGHT_H_
+
+#include <linux/backlight.h>
+#include <drm/drm_dp_helper.h>
+
+/**
+ * struct drm_dp_aux_backlight - DisplayPort aux backlight
+ * @dev: the device to register
+ * @aux: the DisplayPort aux channel
+ * @bd: the backlight device
+ * @enabled: true if backlight is enabled else false.
+ */
+struct drm_dp_aux_backlight {
+	struct device *dev;
+	struct drm_dp_aux *aux;
+	struct backlight_device *bd;
+	bool enabled;
+};
+
+int drm_dp_aux_backlight_enable(struct drm_dp_aux_backlight *aux_bl);
+int drm_dp_aux_backlight_disable(struct drm_dp_aux_backlight *aux_bl);
+
+int drm_dp_aux_backlight_register(const char *name,
+				struct drm_dp_aux_backlight *aux_bl);
+
+#endif /* _DRM_DP_AUX_BACKLIGHT_H_ */
-- 
2.7.4

