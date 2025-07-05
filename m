Return-Path: <linux-arm-msm+bounces-63813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F10AF9FF6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 14:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A26017F6A1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 12:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC112561D4;
	Sat,  5 Jul 2025 12:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="YivIFP33"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331F7251791;
	Sat,  5 Jul 2025 12:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751717614; cv=none; b=H1Sda0h8KF6V/Ww9wj/lT2jlXa+CjwmYTnJIEuReWsGcjmLwozNlZv2KqpKIpAMgoJJJbn2hauJngdGlT75tXZ0ri2x2oOFvf02aX15TBye0PHg/5jNDtMExgIEHT7Z7KfTJsHKPWpNwLlMusSfs2M0I+gLbm/50/xYxysQkTTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751717614; c=relaxed/simple;
	bh=BJB4RVt/O7kRzpaz/CbQjaEb6lDEEuaHz7Yjg+71KzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fBJofEfOtKGLZ0tuB7R2Etmnm4CAKaxD1HYkARYKeDdl9KKCkYOqKf141O8UnYyLcKo8YuAt3a3xciu8kP2Ou/8BEApORSwfO2OyO3sy6Je2HaEmV2J/RnHhtLPgY2BQLe0h9eI57MRnPquep6aWADLjYf8M/fmYobtyWOEVtAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=YivIFP33; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1751716995; bh=BJB4RVt/O7kRzpaz/CbQjaEb6lDEEuaHz7Yjg+71KzE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YivIFP33ADyIJ+gGVd0qbuB/hdGLFYmFTA+aY8F4XhWHm8GJK3XrI+ilj6V9d60hM
	 CjeOfrX4MONfUnIEar/42ovRQWFeXbLSgKjjH32jfks6frvJDkTWpFPA2x7KOcx7fq
	 r+XnE5qw8kduDwJPwBesAQym0j3Tys5oErs79VMY=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sat, 05 Jul 2025 14:03:06 +0200
Subject: [PATCH v2 2/3] ASoC: codecs: Add Awinic AW8898 amplifier driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-aw8898-v2-2-9c3adb1fc1a2@lucaweiss.eu>
References: <20250705-aw8898-v2-0-9c3adb1fc1a2@lucaweiss.eu>
In-Reply-To: <20250705-aw8898-v2-0-9c3adb1fc1a2@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=17495; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=BJB4RVt/O7kRzpaz/CbQjaEb6lDEEuaHz7Yjg+71KzE=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoaRSA70bvTcG/eI1ZPLNI/84nfhs8nlhmAEi5j
 l+q/6idJDOJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaGkUgAAKCRBy2EO4nU3X
 Vk/BD/9jsy5anR30EndOwPbdQxYuquK4KVJT7cHOZ+RpOjakQt1LaIeGaF5+/KNIELbmGfUKCsr
 UiAVSXiDPJepmAWzvPr1F0FuF/fVMXkH6kTsVhqQML2MHX5xNWJAQNxeoM/ovhGS6fz0l85rY8N
 dW01WDzmh9SBzPtu2K1g37UDKhKomAYAqCGfaKs8/ZiWriMeqDDREIiskecHyBBYU8sUnPvDLqR
 CKi7ahVYcUQpnFMhE6elk+b9Bdo9DmLGbCU9nDrzqurVcpghzkIsG4muWisliTqCWjb33EDzW05
 iEj2DnB+B3gmCRfSB6XZ4Std/829mMmHCz1S7CGmdf1NW2d4rthGo5f1D+TndkJ74e0rRElxPIU
 3yc1mCiyFoBTRmHEeitt39y/iYElLMx7F8L2kT/gGzeJgWgGIJ/IIsBmVwB3tLoQ3q4XLzI/XB3
 OdOwKWETpt5XXyex1a3+8zXxn1F5rtHD8sugTxw/k4aSdxT1fq9z8HgQjW9NJmz80s1XWGMoS81
 pFcadUrbee92bSuabSJI/YmCioH0gPr5l1ZZLfutSdO394q75LKM6LejpkGze5ynUsRHOSMIiQU
 01aquZcDSt2iC9Y/Ctz4g5YjclxVp4lnOMMIcF8DkuQLqD/mntxc0xP3Xe8w9r8ZUoLhhQgjf7D
 oU92fo9rgMihUeA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add a driver for the AW8898 Audio Amplifier.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 sound/soc/codecs/Kconfig          |  10 +
 sound/soc/codecs/Makefile         |   1 +
 sound/soc/codecs/snd-soc-aw8898.c | 561 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 572 insertions(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 6d7e4725d89cd33647770e4f2c4e81445b8335ce..18b0d356fdd2a085ce3adaded671ae639e925718 100644
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
@@ -744,6 +745,15 @@ config SND_SOC_AW88399
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
index a68c3d192a1b6ccec513c6bc447c29be532ea70c..1006b7c3d94e3be3402e3c6b1d81eecfe828f94e 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -481,6 +481,7 @@ obj-$(CONFIG_SND_SOC_AW88395)	+=snd-soc-aw88395.o
 obj-$(CONFIG_SND_SOC_AW88166)	+=snd-soc-aw88166.o
 obj-$(CONFIG_SND_SOC_AW88261)	+=snd-soc-aw88261.o
 obj-$(CONFIG_SND_SOC_AW88399)	+= snd-soc-aw88399.o
+obj-$(CONFIG_SND_SOC_AW8898)	+= snd-soc-aw8898.o
 obj-$(CONFIG_SND_SOC_BD28623)	+= snd-soc-bd28623.o
 obj-$(CONFIG_SND_SOC_BT_SCO)	+= snd-soc-bt-sco.o
 obj-$(CONFIG_SND_SOC_CHV3_CODEC) += snd-soc-chv3-codec.o
diff --git a/sound/soc/codecs/snd-soc-aw8898.c b/sound/soc/codecs/snd-soc-aw8898.c
new file mode 100644
index 0000000000000000000000000000000000000000..6d60719777de9017a5419ec548a586352e86b60b
--- /dev/null
+++ b/sound/soc/codecs/snd-soc-aw8898.c
@@ -0,0 +1,561 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+//
+// Copyright (c) 2018 AWINIC Technology CO., LTD
+// Author: Nick Li <liweilei@awinic.com.cn>
+//
+// Copyright (c) 2025 Luca Weiss <luca@lucaweiss.eu>
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
+	if (ucontrol->value.enumerated.item[0] > 1)
+		return -EINVAL;
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
+static int aw8898_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct snd_soc_component *component = dai->component;
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		if ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK)
+				!= SND_SOC_DAIFMT_CBC_CFC) {
+			dev_err(component->dev, "Invalid codec master mode: %d\n",
+				fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK);
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
+	unsigned int val = AW8898_PWMCTRL_HMUTE_DISABLE;
+
+	if (mute)
+		val = AW8898_PWMCTRL_HMUTE_ENABLE;
+
+	regmap_update_bits(aw8898->regmap, AW8898_PWMCTRL,
+			   AW8898_PWMCTRL_HMUTE_MASK,
+			   FIELD_PREP(AW8898_PWMCTRL_HMUTE_MASK, val));
+
+	return 0;
+}
+
+static int aw8898_startup(struct snd_pcm_substream *substream,
+               struct snd_soc_dai *dai)
+{
+	struct aw8898 *aw8898 = snd_soc_component_get_drvdata(dai->component);
+	unsigned int val;
+	int err;
+
+	err = regmap_read_poll_timeout(aw8898->regmap, AW8898_SYSST,
+				       val, val & AW8898_SYSST_PLLS,
+				       2000, 1 * USEC_PER_SEC);
+	if (err) {
+		dev_err(&aw8898->client->dev, "iis signal check error: %d\n", err);
+		aw8898_set_power(aw8898, false);
+		return err;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops aw8898_dai_ops = {
+	.startup	= aw8898_startup,
+	.set_fmt	= aw8898_set_fmt,
+	.hw_params	= aw8898_hw_params,
+	.mute_stream	= aw8898_mute,
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
+
+	aw8898->component = component;
+
+	return 0;
+}
+
+static int aw8898_drv_event(struct snd_soc_dapm_widget *w,
+				struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct aw8898 *aw8898 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		aw8898_set_power(aw8898, true);
+
+		if (!aw8898->cfg_loaded)
+			aw8898_cold_start(aw8898);
+
+		ret = 0;
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		aw8898_set_power(aw8898, false);
+		ret = 0;
+		break;
+	default:
+		dev_err(component->dev, "%s: invalid event %d\n", __func__, event);
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static const struct snd_soc_dapm_widget aw8898_dapm_widgets[] = {
+	SND_SOC_DAPM_INPUT("IN"),
+	SND_SOC_DAPM_PGA_E("SPK PA", SND_SOC_NOPM, 0, 0, NULL, 0, aw8898_drv_event,
+			       SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_OUTPUT("OUT"),
+};
+
+static const struct snd_soc_dapm_route aw8898_dapm_routes[] = {
+	{ "SPK PA", NULL, "IN" },
+	{ "OUT", NULL, "SPK PA" },
+};
+
+static const struct snd_soc_component_driver soc_component_dev_aw8898 = {
+	.probe			= aw8898_component_probe,
+	.dapm_widgets		= aw8898_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(aw8898_dapm_widgets),
+	.dapm_routes		= aw8898_dapm_routes,
+	.num_dapm_routes	= ARRAY_SIZE(aw8898_dapm_routes),
+	.controls		= aw8898_controls,
+	.num_controls		= ARRAY_SIZE(aw8898_controls),
+};
+
+static const struct regmap_config aw8898_regmap = {
+	.reg_bits = 8,
+	.val_bits = 16,
+
+	.max_register = AW8898_MAX_REGISTER,
+	.cache_type = REGCACHE_MAPLE,
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
+	for (int i = 0; i < ARRAY_SIZE(aw8898->supplies); i++)
+		aw8898->supplies[i].supply = aw8898_supply_names[i];
+
+	ret = devm_regulator_bulk_get(&client->dev, ARRAY_SIZE(aw8898->supplies),
+				      aw8898->supplies);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to get regulators\n");
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(aw8898->supplies),
+				    aw8898->supplies);
+	if (ret) {
+		dev_err(&client->dev, "Failed to enable supplies: %d\n",
+			ret);
+		return ret;
+	}
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
+		.of_match_table = aw8898_of_match,
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
2.50.0


