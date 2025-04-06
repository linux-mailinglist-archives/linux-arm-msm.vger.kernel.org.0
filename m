Return-Path: <linux-arm-msm+bounces-53292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39396A7CDFE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 15:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B0D2188B68C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 13:10:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905C3218EBD;
	Sun,  6 Apr 2025 13:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="1GCmSw5I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4A01A5BB8;
	Sun,  6 Apr 2025 13:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743944975; cv=none; b=PVawqgME8vpJQtuEW0rFmXRgqgDd0IBaaaWmOouvkfKhGAZVLSuyRJG9xZG+MNePtJLnkdDdsJAgR99LE7AEx4Qmz+d+jCxZkhJeWADJ+tj42uBLqz1UYPlHfPYZHk5Pxar2Je5xW3rlOQm7Op3Ni9hJnMyzIm/1xs9LmWaw78E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743944975; c=relaxed/simple;
	bh=j7uyoq8Wxtsg+/Pgxp0xlOdDKdR4NmwwxLjvz0Bk9n8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nrU4YB/IqRlT+nNIg799WbIhbEmvJ/ull+ePoX3iAceTarYSlCPtZrVk20XKrfVd2SXQ8DwzzcYuHd1DW5nf3AN3LmaOTe9s7JZwVbG7OoBAOHziMBAXROSZEdV2G9CsKSMuega4YL7Bmr59KaWaJOPu/YdM85mxGI8ziBFj8xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=1GCmSw5I; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1743944609; bh=j7uyoq8Wxtsg+/Pgxp0xlOdDKdR4NmwwxLjvz0Bk9n8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=1GCmSw5IbzeD0XD8iHUMVVhD8SSeZOel1yVB0jCPXpvurKapCipZydpTEfmOhJ5yZ
	 qW/UkQ5aYFN2KHqdhachYKdLbKhIPE2+gm/4gwfQdgMu0JoBfUBdAYea/Z7NVPGFZA
	 ZgWocgjR5xVoymRdUs+/zTcK0QO9HTXFzx0Pyu5k=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sun, 06 Apr 2025 15:03:16 +0200
Subject: [PATCH 2/3] ASoC: codecs: Add aw8898 amplifier driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-aw8898-v1-2-58a2d554693f@lucaweiss.eu>
References: <20250406-aw8898-v1-0-58a2d554693f@lucaweiss.eu>
In-Reply-To: <20250406-aw8898-v1-0-58a2d554693f@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Weidong Wang <wangweidong.a@awinic.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=17715; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=j7uyoq8Wxtsg+/Pgxp0xlOdDKdR4NmwwxLjvz0Bk9n8=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBn8nufTNVq7IATjZZl/nUDK5QaB0HAJSRvFME5z
 WmO2KiL5BuJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ/J7nwAKCRBy2EO4nU3X
 VnJbEACiZnN/JDLKz9AYdTdwtPGhtd9+NierugLqMRI/bimXCkoCgtU9GiJmWeU36jwjwYx0Y9f
 ibv11F2WNLyyhBBol5PhRlbLee56c8jbbPQUCS3UWIaQJ17tOXjOuhO8sNbJCTjuCN+f+TwbvlY
 iGOo5SytCrKMGILsuKRlxrnmc+GHP/6KzbKJaQNiE9XuPM6v8SQx2raTwuiWTXEtqvRD/7vI8re
 qI/6KicwK+qp/yc7r3KCRzt1eWrZUD80PU/5w3opshyhw2c6+udhPS3VlMD69Ika1taA2oMIrVb
 wPrMrrMCoHuILsw6PEo5Gl9oTx02AfmZTVle7lsgqhpcTy7Hyji4Yajoq4xrffiokZmAIwe6kwp
 JNtnCXfKZeAMXhxtq6nDElJktwhF7Al9/p7V0TxPBqENtVOD3Zik9+fLZ/LaYVFuaPIlATP86r1
 I1x4XBiK2m9vFJOGhqre8dw6dtzjUYlXekPt4TDPCE5ikXkj5HBopxRBjxva5CbYPmzPLtEGbKl
 Q9y8XLe+RC2/2dZuqw8Gzhon+WCSwd7wKB5c8etCSiQWPPFpCC4DszAD0n2RdR0FBQAQTNUjHqs
 40Ec1FhLV80F4sc5akXwLqZ9O0d6ORYMqTFT3Wzx88xunistG7grr/VRwClLWdd66bJIZnSzwuL
 G9gD3D8GP5Ivsug==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add a driver for the AW8898 Audio Amplifier.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 sound/soc/codecs/Kconfig          |  10 +
 sound/soc/codecs/Makefile         |   1 +
 sound/soc/codecs/snd-soc-aw8898.c | 583 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 594 insertions(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 40bb7a1d44bcfa4c386f2eba0f475efeeedf1bdb..8351853d3c21522b91639ddfe862613e2cde5be3 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -61,6 +61,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_AW88166
 	imply SND_SOC_AW88261
 	imply SND_SOC_AW88399
+	imply SND_SOC_AW8898
 	imply SND_SOC_BT_SCO
 	imply SND_SOC_BD28623
 	imply SND_SOC_CHV3_CODEC
@@ -739,6 +740,15 @@ config SND_SOC_AW88399
 	  digital Smart K audio amplifier and SKTune speaker
 	  protection algorithms.
 
+config SND_SOC_AW8898
+	tristate "Awinic AW8898 Audio Amplifier"
+	depends on I2C
+	select REGMAP_I2C
+	select GPIOLIB
+	help
+	  Enable support for the Awinic AW8898 audio amplifier with I2C
+	  control.
+
 config SND_SOC_BD28623
 	tristate "ROHM BD28623 CODEC"
 	help
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 10f726066b6c63736a4f533cf992c8e55a02036d..04691deb218262e2352d21d8bb231613ad1655d7 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -474,6 +474,7 @@ obj-$(CONFIG_SND_SOC_AW88395)	+=snd-soc-aw88395.o
 obj-$(CONFIG_SND_SOC_AW88166)	+=snd-soc-aw88166.o
 obj-$(CONFIG_SND_SOC_AW88261)	+=snd-soc-aw88261.o
 obj-$(CONFIG_SND_SOC_AW88399)	+= snd-soc-aw88399.o
+obj-$(CONFIG_SND_SOC_AW8898)	+= snd-soc-aw8898.o
 obj-$(CONFIG_SND_SOC_BD28623)	+= snd-soc-bd28623.o
 obj-$(CONFIG_SND_SOC_BT_SCO)	+= snd-soc-bt-sco.o
 obj-$(CONFIG_SND_SOC_CHV3_CODEC) += snd-soc-chv3-codec.o
diff --git a/sound/soc/codecs/snd-soc-aw8898.c b/sound/soc/codecs/snd-soc-aw8898.c
new file mode 100644
index 0000000000000000000000000000000000000000..204c39709f17e904f656cb6a945e6dfd969d1569
--- /dev/null
+++ b/sound/soc/codecs/snd-soc-aw8898.c
@@ -0,0 +1,583 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2018 AWINIC Technology CO., LTD
+ * Author: Nick Li <liweilei@awinic.com.cn>
+ *
+ * Copyright (c) 2025 Luca Weiss <luca@lucaweiss.eu>
+ */
+
+#include <linux/device.h>
+#include <linux/firmware.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/tlv.h>
+
+/* Chip ID */
+#define AW8898_ID				0x00
+#define AW8898_CHIP_ID				0x1702
+
+/* System Status */
+#define AW8898_SYSST				0x01
+#define AW8898_SYSST_PLLS			GENMASK(0, 0)
+
+/* System Control */
+#define AW8898_SYSCTRL				0x04
+#define AW8898_SYSCTRL_MODE_MASK		GENMASK(7, 7)
+#define AW8898_SYSCTRL_RCV_MODE			(1)
+#define AW8898_SYSCTRL_SPK_MODE			(0)
+#define AW8898_SYSCTRL_PW_MASK			GENMASK(0, 0)
+#define AW8898_SYSCTRL_PW_PDN			(1)
+#define AW8898_SYSCTRL_PW_ACTIVE		(0)
+
+/* I2S Interface Control */
+#define AW8898_I2SCTRL				0x05
+#define AW8898_I2SCTRL_FMS_MASK			GENMASK(7, 6)
+#define AW8898_I2SCTRL_FMS_32BIT		(3)
+#define AW8898_I2SCTRL_FMS_24BIT		(2)
+#define AW8898_I2SCTRL_FMS_20BIT		(1)
+#define AW8898_I2SCTRL_FMS_16BIT		(0)
+#define AW8898_I2SCTRL_SR_MASK			GENMASK(3, 0)
+#define AW8898_I2SCTRL_SR_48K			(8)
+#define AW8898_I2SCTRL_SR_44P1K			(7)
+#define AW8898_I2SCTRL_SR_32K			(6)
+#define AW8898_I2SCTRL_SR_16K			(3)
+#define AW8898_I2SCTRL_SR_8K			(0)
+
+/* PWM Control */
+#define AW8898_PWMCTRL				0x08
+#define AW8898_PWMCTRL_HMUTE_MASK		GENMASK(0, 0)
+#define AW8898_PWMCTRL_HMUTE_ENABLE		(1)
+#define AW8898_PWMCTRL_HMUTE_DISABLE		(0)
+
+/* Hardware AGC Configuration 7 */
+#define AW8898_HAGCCFG7				0x0f
+#define AW8898_HAGCCFG7_VOL_REG_SHIFT		(8) /* bits 15-8 */
+#define AW8898_VOLUME_MAX			(255)
+#define AW8898_VOLUME_MIN			(0)
+
+#define AW8898_MAX_REGISTER			0xff
+
+#define AW8898_CFG_NAME				"aw8898_cfg.bin"
+
+#define AW8898_NUM_SUPPLIES	3
+static const char *aw8898_supply_names[AW8898_NUM_SUPPLIES] = {
+	"vdd",		/* Battery power */
+	"vddio",	/* Digital IO power */
+	"dvdd",		/* Digital power */
+};
+
+static const char * const aw8898_dev_mode_text[] = {
+	"Speaker",
+	"Receiver",
+};
+
+enum aw8898_mode {
+	AW8898_SPEAKER,
+	AW8898_RECEIVER,
+};
+
+static const struct soc_enum aw8898_dev_mode_enum =
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(aw8898_dev_mode_text), aw8898_dev_mode_text);
+
+struct aw8898 {
+	struct snd_soc_component *component;
+	struct regmap *regmap;
+	struct i2c_client *client;
+	struct mutex cfg_lock;
+	struct gpio_desc *reset;
+	struct regulator_bulk_data supplies[AW8898_NUM_SUPPLIES];
+	enum aw8898_mode dev_mode;
+	bool cfg_loaded;
+};
+
+struct aw8898_cfg {
+	int len;
+	struct {
+		__le16 addr;
+		__le16 val;
+	} __packed data[];
+};
+
+static void aw8898_set_mute(struct aw8898 *aw8898, bool mute)
+{
+	unsigned int val = AW8898_PWMCTRL_HMUTE_DISABLE;
+
+	if (mute)
+		val = AW8898_PWMCTRL_HMUTE_ENABLE;
+
+	regmap_update_bits(aw8898->regmap, AW8898_PWMCTRL,
+			   AW8898_PWMCTRL_HMUTE_MASK,
+			   FIELD_PREP(AW8898_PWMCTRL_HMUTE_MASK, val));
+}
+
+static void aw8898_set_power(struct aw8898 *aw8898, bool on)
+{
+	unsigned int val = AW8898_SYSCTRL_PW_PDN;
+
+	if (on)
+		val = AW8898_SYSCTRL_PW_ACTIVE;
+
+	regmap_update_bits(aw8898->regmap, AW8898_SYSCTRL,
+			   AW8898_SYSCTRL_PW_MASK,
+			   FIELD_PREP(AW8898_SYSCTRL_PW_MASK, val));
+}
+
+static void aw8898_update_dev_mode(struct aw8898 *aw8898)
+{
+	unsigned int mode = AW8898_SYSCTRL_SPK_MODE;
+
+	if (aw8898->dev_mode == AW8898_RECEIVER)
+		mode = AW8898_SYSCTRL_RCV_MODE;
+
+	regmap_update_bits(aw8898->regmap, AW8898_SYSCTRL,
+			   AW8898_SYSCTRL_MODE_MASK,
+			   FIELD_PREP(AW8898_SYSCTRL_MODE_MASK, mode));
+}
+
+static void aw8898_start(struct aw8898 *aw8898)
+{
+	unsigned int val;
+	int err;
+
+	aw8898_set_power(aw8898, true);
+
+	fsleep(2000);
+
+	err = regmap_read_poll_timeout(aw8898->regmap, AW8898_SYSST,
+				       val, val & AW8898_SYSST_PLLS,
+				       2000, 1 * USEC_PER_SEC);
+	if (err) {
+		dev_err(&aw8898->client->dev, "iis signal check error: %d\n", err);
+		aw8898_set_power(aw8898, false);
+		return;
+	}
+
+	aw8898_set_mute(aw8898, false);
+}
+
+static void aw8898_stop(struct aw8898 *aw8898)
+{
+	aw8898_set_mute(aw8898, true);
+	aw8898_set_power(aw8898, false);
+}
+
+static void aw8898_cfg_write(struct aw8898 *aw8898,
+			      struct aw8898_cfg *aw8898_cfg)
+{
+	for (int i = 0; i < aw8898_cfg->len; i++) {
+		unsigned int addr = __le32_to_cpu(aw8898_cfg->data[i].addr);
+		unsigned int val = __le32_to_cpu(aw8898_cfg->data[i].val);
+
+		dev_dbg(&aw8898->client->dev, "cfg reg = 0x%04x, val = 0x%04x\n", addr, val);
+		regmap_write(aw8898->regmap, addr, val);
+	}
+}
+
+static void aw8898_fw_loaded(const struct firmware *fw, void *context)
+{
+	struct aw8898 *aw8898 = context;
+	struct aw8898_cfg *aw8898_cfg;
+
+	if (!fw) {
+		dev_err(&aw8898->client->dev, "Failed to load firmware\n");
+		return;
+	}
+
+	dev_dbg(&aw8898->client->dev, "Loaded %s - size: %zu\n", AW8898_CFG_NAME, fw->size);
+
+	if (fw->size % 4 != 0) {
+		dev_err(&aw8898->client->dev, "Invalid firmware size %zu\n", fw->size);
+		release_firmware(fw);
+		return;
+	}
+
+	aw8898_cfg = kzalloc(sizeof(int) + fw->size, GFP_KERNEL);
+	if (!aw8898_cfg) {
+		release_firmware(fw);
+		return;
+	}
+
+	aw8898_cfg->len = fw->size / 4;
+	memcpy(aw8898_cfg->data, fw->data, fw->size);
+
+	release_firmware(fw);
+
+	aw8898_cfg_write(aw8898, aw8898_cfg);
+
+	kfree(aw8898_cfg);
+
+	aw8898->cfg_loaded = true;
+
+	aw8898_update_dev_mode(aw8898);
+	aw8898_start(aw8898);
+}
+
+static void aw8898_cold_start(struct aw8898 *aw8898)
+{
+	int err;
+
+	err = request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT,
+				      AW8898_CFG_NAME, &aw8898->client->dev, GFP_KERNEL,
+				      aw8898, aw8898_fw_loaded);
+	if (err)
+		dev_err(&aw8898->client->dev, "Firmware load request failed: %d\n", err);
+}
+
+static int aw8898_dev_mode_get(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct aw8898 *aw8898 = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.enumerated.item[0] = aw8898->dev_mode;
+
+	return 0;
+}
+
+static int aw8898_dev_mode_put(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct aw8898 *aw8898 = snd_soc_component_get_drvdata(component);
+
+	if (aw8898->dev_mode == ucontrol->value.enumerated.item[0])
+		return 0;
+
+	aw8898->dev_mode = ucontrol->value.enumerated.item[0];
+
+	aw8898_update_dev_mode(aw8898);
+
+	return 1;
+}
+
+/*
+ * -127.5 dB min, 0.5 dB steps, no mute
+ * Note: The official datasheet claims to be able to attenuate between 0 dB and
+ * -96 dB with 0.5 dB/step, but the register values are 0-255 so this doesn't
+ * really line up. It's a best guess.
+ */
+static const DECLARE_TLV_DB_SCALE(vol_tlv, -12750, 50, 0);
+
+static struct snd_kcontrol_new aw8898_controls[] = {
+	SOC_ENUM_EXT("Amp Mode", aw8898_dev_mode_enum,
+		     aw8898_dev_mode_get, aw8898_dev_mode_put),
+	SOC_SINGLE_RANGE_TLV("RX Volume", AW8898_HAGCCFG7,
+			     AW8898_HAGCCFG7_VOL_REG_SHIFT,
+			     AW8898_VOLUME_MIN, AW8898_VOLUME_MAX, 1, vol_tlv),
+};
+
+static int aw8898_startup(struct snd_pcm_substream *substream,
+			  struct snd_soc_dai *dai)
+{
+	struct aw8898 *aw8898 = snd_soc_component_get_drvdata(dai->component);
+
+	aw8898_set_power(aw8898, true);
+
+	return 0;
+}
+
+static int aw8898_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct snd_soc_component *component = dai->component;
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		if ((fmt & SND_SOC_DAIFMT_MASTER_MASK)
+				!= SND_SOC_DAIFMT_CBC_CFC) {
+			dev_err(component->dev, "Invalid codec master mode: %d\n",
+				fmt & SND_SOC_DAIFMT_MASTER_MASK);
+			return -EINVAL;
+		}
+		break;
+	default:
+		dev_err(component->dev, "Unsupported DAI format %d\n",
+			fmt & SND_SOC_DAIFMT_FORMAT_MASK);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int aw8898_hw_params(struct snd_pcm_substream *substream,
+			    struct snd_pcm_hw_params *params,
+			    struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct aw8898 *aw8898 = snd_soc_component_get_drvdata(dai->component);
+	unsigned int val;
+
+	switch (params_rate(params)) {
+	case 8000:
+		val = AW8898_I2SCTRL_SR_8K;
+		break;
+	case 16000:
+		val = AW8898_I2SCTRL_SR_16K;
+		break;
+	case 32000:
+		val = AW8898_I2SCTRL_SR_32K;
+		break;
+	case 44100:
+		val = AW8898_I2SCTRL_SR_44P1K;
+		break;
+	case 48000:
+		val = AW8898_I2SCTRL_SR_48K;
+		break;
+	default:
+		dev_err(component->dev, "Unsupported sample rate: %d\n",
+			params_rate(params));
+		return -EINVAL;
+	}
+
+	regmap_update_bits(aw8898->regmap, AW8898_I2SCTRL,
+			   AW8898_I2SCTRL_SR_MASK,
+			   FIELD_PREP(AW8898_I2SCTRL_SR_MASK, val));
+
+	switch (params_width(params)) {
+	case 16:
+		val = AW8898_I2SCTRL_FMS_16BIT;
+		break;
+	case 20:
+		val = AW8898_I2SCTRL_FMS_20BIT;
+		break;
+	case 24:
+		val = AW8898_I2SCTRL_FMS_24BIT;
+		break;
+	case 32:
+		val = AW8898_I2SCTRL_FMS_32BIT;
+		break;
+	default:
+		dev_err(component->dev, "Unsupported sample size: %d\n",
+			params_width(params));
+		return -EINVAL;
+	}
+
+	regmap_update_bits(aw8898->regmap, AW8898_I2SCTRL,
+			   AW8898_I2SCTRL_FMS_MASK,
+			   FIELD_PREP(AW8898_I2SCTRL_FMS_MASK, val));
+
+	return 0;
+}
+
+static int aw8898_mute(struct snd_soc_dai *dai, int mute, int stream)
+{
+	struct aw8898 *aw8898 = snd_soc_component_get_drvdata(dai->component);
+
+	mutex_lock(&aw8898->cfg_lock);
+
+	if (mute) {
+		aw8898_stop(aw8898);
+	} else {
+		if (!aw8898->cfg_loaded) {
+			aw8898_cold_start(aw8898);
+		} else {
+			aw8898_update_dev_mode(aw8898);
+			aw8898_start(aw8898);
+		}
+	}
+
+	mutex_unlock(&aw8898->cfg_lock);
+
+	return 0;
+}
+
+static void aw8898_shutdown(struct snd_pcm_substream *substream,
+			    struct snd_soc_dai *dai)
+{
+	struct aw8898 *aw8898 = snd_soc_component_get_drvdata(dai->component);
+
+	aw8898_set_power(aw8898, false);
+}
+
+static const struct snd_soc_dai_ops aw8898_dai_ops = {
+	.startup	= aw8898_startup,
+	.set_fmt	= aw8898_set_fmt,
+	.hw_params	= aw8898_hw_params,
+	.mute_stream	= aw8898_mute,
+	.shutdown	= aw8898_shutdown,
+};
+
+#define AW8898_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
+			SNDRV_PCM_FMTBIT_S24_LE | \
+			SNDRV_PCM_FMTBIT_S32_LE)
+
+static struct snd_soc_dai_driver aw8898_dai[] = {
+	{
+		.name = "aw8898-amplifier",
+		.playback = {
+			.stream_name = "Playback",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000_48000,
+			.formats = AW8898_FORMATS,
+		},
+		.capture = {
+			.stream_name = "Capture",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000_48000,
+			.formats = AW8898_FORMATS,
+		},
+		.ops = &aw8898_dai_ops,
+		.symmetric_rate = 1,
+		.symmetric_channels = 1,
+		.symmetric_sample_bits = 1,
+	},
+};
+
+static int aw8898_component_probe(struct snd_soc_component *component)
+{
+	struct aw8898 *aw8898 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	aw8898->component = component;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(aw8898->supplies),
+				    aw8898->supplies);
+	if (ret) {
+		dev_err(component->dev, "Failed to enable supplies: %d\n",
+			ret);
+		return ret;
+	}
+
+	snd_soc_add_component_controls(component, aw8898_controls,
+				       ARRAY_SIZE(aw8898_controls));
+
+	return 0;
+}
+
+static void aw8898_component_remove(struct snd_soc_component *component)
+{
+	struct aw8898 *aw8898 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	ret = regulator_bulk_disable(ARRAY_SIZE(aw8898->supplies),
+				     aw8898->supplies);
+	if (ret)
+		dev_err(component->dev, "Failed to disable supplies: %d\n",
+			ret);
+};
+
+static const struct snd_soc_component_driver soc_component_dev_aw8898 = {
+	.probe = aw8898_component_probe,
+	.remove = aw8898_component_remove,
+};
+
+static const struct regmap_config aw8898_regmap = {
+	.reg_bits = 8,
+	.val_bits = 16,
+
+	.max_register = AW8898_MAX_REGISTER,
+	.cache_type = REGCACHE_RBTREE,
+};
+
+static void aw8898_reset(struct aw8898 *aw8898)
+{
+	gpiod_set_value_cansleep(aw8898->reset, 1);
+	fsleep(1000);
+	gpiod_set_value_cansleep(aw8898->reset, 0);
+	fsleep(1000);
+}
+
+static int aw8898_check_chipid(struct aw8898 *aw8898)
+{
+	unsigned int reg;
+	int ret;
+
+	ret = regmap_read(aw8898->regmap, AW8898_ID, &reg);
+	if (ret < 0) {
+		dev_err(&aw8898->client->dev,
+			"Failed to read register AW8898_ID: %d\n", ret);
+		return ret;
+	}
+
+	dev_dbg(&aw8898->client->dev, "Read chip ID 0x%x\n", reg);
+
+	if (reg != AW8898_CHIP_ID) {
+		dev_err(&aw8898->client->dev, "Unexpected chip ID: 0x%x\n",
+			reg);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int aw8898_probe(struct i2c_client *client)
+{
+	struct aw8898 *aw8898;
+	int ret;
+
+	aw8898 = devm_kzalloc(&client->dev, sizeof(*aw8898), GFP_KERNEL);
+	if (!aw8898)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, aw8898);
+	aw8898->client = client;
+
+	aw8898->regmap = devm_regmap_init_i2c(client, &aw8898_regmap);
+	if (IS_ERR(aw8898->regmap))
+		return dev_err_probe(&client->dev, PTR_ERR(aw8898->regmap),
+				     "Failed to allocate register map\n");
+
+	ret = devm_mutex_init(&client->dev, &aw8898->cfg_lock);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to init mutex\n");
+
+	for (int i = 0; i < ARRAY_SIZE(aw8898->supplies); i++)
+		aw8898->supplies[i].supply = aw8898_supply_names[i];
+
+	ret = devm_regulator_bulk_get(&client->dev, ARRAY_SIZE(aw8898->supplies),
+				      aw8898->supplies);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to get regulators\n");
+
+	aw8898->reset = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(aw8898->reset))
+		return dev_err_probe(&client->dev, PTR_ERR(aw8898->reset),
+				     "Failed to get reset GPIO\n");
+
+	aw8898_reset(aw8898);
+
+	ret = aw8898_check_chipid(aw8898);
+	if (ret)
+		return dev_err_probe(&client->dev, ret, "Chip ID check failed\n");
+
+	dev_set_drvdata(&client->dev, aw8898);
+
+	ret = devm_snd_soc_register_component(&client->dev, &soc_component_dev_aw8898,
+					      aw8898_dai, ARRAY_SIZE(aw8898_dai));
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret, "Failed to register component\n");
+
+	return 0;
+}
+
+static const struct i2c_device_id aw8898_id[] = {
+	{ "aw8898" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(i2c, aw8898_id);
+
+static const struct of_device_id aw8898_of_match[] = {
+	{ .compatible = "awinic,aw8898" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, aw8898_of_match);
+
+static struct i2c_driver aw8898_driver = {
+	.driver = {
+		.name = "aw8898",
+		.of_match_table = of_match_ptr(aw8898_of_match),
+	},
+	.probe = aw8898_probe,
+	.id_table = aw8898_id,
+};
+
+module_i2c_driver(aw8898_driver);
+
+MODULE_DESCRIPTION("AW8898 Audio amplifier driver");
+MODULE_LICENSE("GPL");

-- 
2.49.0


