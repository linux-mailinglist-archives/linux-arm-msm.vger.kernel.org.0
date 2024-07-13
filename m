Return-Path: <linux-arm-msm+bounces-26073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A099304CC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jul 2024 11:56:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5AAE2831FA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jul 2024 09:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C0849645;
	Sat, 13 Jul 2024 09:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s+oiJkwi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F3E4964C
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jul 2024 09:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720864602; cv=none; b=ELnyHETug6ytkhRh+0p9O0KYrGfXCIpZzmbBDLAY+d2mA4dKZoIpVgQ+sBFkHMQj2mWpHK1y46HRONEystG9LTgO/ex9ZxYokuPSJAvIew0X/8fpubp6h/DHvkNHEBwPfaqxK+QS45E6CT/cNnfvhNboBr7iT4cwH5khVOLKH2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720864602; c=relaxed/simple;
	bh=4LUoIZD2bqOQ9FMrdozx7Sb01W4WeTnNCquj66eoiwg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eDxr06+VbCgMRUqIjiHO6BM42DuhkBtXBBXsHhWddBSw+gFuL8kXEkk78S2n+P6ZlZJsF9HmXHk98gVlSJorTtbFTIgHVfpBpT22qkcnZCkBEkPeRXF0ZLkOCJP7vd9BU/OxKluVPDwQQir/E1fQ9ooQXfzC+8qyEu1UKFdGNPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s+oiJkwi; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-426717a2d12so16534175e9.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jul 2024 02:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720864599; x=1721469399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lunD1jtXUpUDh/B42v7PNILRWCB+xXP6OzCxOL3Idi8=;
        b=s+oiJkwivKTIazbuxzvmD/pt5ddvpERMNQcp8yKWU/uJH3HuXpfK0rv56bP7kpQimz
         SneXXp/VUkgXiKHmb1b1gxYE9RcRFXUWWMlUjHKEfS3UfkMwVs3KucBUK+4w8lBq4tPz
         xxy/hsDj3NSJgJGJuqhptVHg0kbBgxVmN8VXLyB5gIfLg1gPiU0AV0nsefY9MvKlfsui
         VFTUYyNEw0yL4vDi+No6mojEH7t8cAg0cY3QT/kuWmVuDpYvviv1x+WtD1inNVIZXtOO
         ocnmUoDfQ6Bgp2+1sj84tPNcBZcMpMgIutgYjNn9uiQdwT5K2G3XHg+Dz0qjJoDxPaHp
         t69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720864599; x=1721469399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lunD1jtXUpUDh/B42v7PNILRWCB+xXP6OzCxOL3Idi8=;
        b=SIMvSJqNJlLG6AKO6qDOBiHL//YNZI7vZM5vxDJrVIVtl5PN+x1X87opHMndH+LhnO
         1pzFSLBZehhziHn1Eh/wlZYx9b5JUIgsCmCSW5trA+qb28w1EbjydKyX/SEM4uoqZsXu
         UnAENV1717EEG2KAVGtY3ZHjIoA9y5T429eyGvo/F40Epd4D98ni9/2en10gVvojsSw2
         UDBb0q0rcRpUnepFbuRzEG659wwzUy88Hpo6tt66AyCzLnoSfWO62Gm2nvSMRKtlZ2ru
         rI4xOTOCMf8L+2MAbRGyoTAmorHEcupcLY/kObUyqzyISVpaHlvern17hkkyRxS8Xi70
         NMXA==
X-Forwarded-Encrypted: i=1; AJvYcCW/PFIkt30g+5NCOcDvqceCVHUq5SHBPkvQ7vkNfprSNiJ4z+nzzgAGEJoaC3GEEkBRXo1pS1qjqR79AlrnoEhomySNlkPqjfTLe3dVJA==
X-Gm-Message-State: AOJu0Yxq43JeiYXNXIntnCnlqxcztFzM9e6evx7XE6OCM96nXCrE2jcJ
	b/eaaGm0p7OnedGjn/NZell1Tmp2GVOlnyCZmjKGBLGricLQYYfQXAgqdKLr6eU=
X-Google-Smtp-Source: AGHT+IGWOe5Y6BuPPbzoKA2BFouCV6ObjC9SDNC1hzVVGYciWsMSvuicRw1jkiuBLeMvVVAJ3PlYYg==
X-Received: by 2002:a05:600c:4793:b0:426:67f9:a7d8 with SMTP id 5b1f17b1804b1-4279dae2aedmr47392315e9.9.1720864598770;
        Sat, 13 Jul 2024 02:56:38 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dab3c2dsm1003638f8f.1.2024.07.13.02.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jul 2024 02:56:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] ASoC: codecs: wsa884x: Implement temperature reading and hwmon
Date: Sat, 13 Jul 2024 11:56:35 +0200
Message-ID: <20240713095635.23201-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Read temperature of the speaker and expose it via hwmon interface, which
will be later used during calibration of speaker protection algorithms.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Add missing dependency on HWMON for y!=m builds (kernel test robot
   report: undefined reference to
   `devm_hwmon_device_register_with_info').
---
 sound/soc/codecs/Kconfig   |   1 +
 sound/soc/codecs/wsa884x.c | 197 +++++++++++++++++++++++++++++++++++++
 2 files changed, 198 insertions(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 97bb69c9848d..09a0b209bc2f 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2447,6 +2447,7 @@ config SND_SOC_WSA883X
 config SND_SOC_WSA884X
 	tristate "WSA884X Codec"
 	depends on SOUNDWIRE
+	depends on HWMON || !HWMON
 	select REGMAP_SOUNDWIRE
 	help
 	  This enables support for Qualcomm WSA8840/WSA8845/WSA8845H Class-D
diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index 7b19df9c1728..5f4acd66f942 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -5,11 +5,14 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
+#include <linux/hwmon.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
@@ -301,8 +304,28 @@
 #define WSA884X_PA_FSM_MSK1		(WSA884X_DIG_CTRL0_BASE + 0x3b)
 #define WSA884X_PA_FSM_BYP_CTL		(WSA884X_DIG_CTRL0_BASE + 0x3c)
 #define WSA884X_PA_FSM_BYP0		(WSA884X_DIG_CTRL0_BASE + 0x3d)
+#define WSA884X_PA_FSM_BYP0_DC_CAL_EN_MASK		0x01
+#define WSA884X_PA_FSM_BYP0_DC_CAL_EN_SHIFT		0
+#define WSA884X_PA_FSM_BYP0_CLK_WD_EN_MASK		0x02
+#define WSA884X_PA_FSM_BYP0_CLK_WD_EN_SHIFT		1
+#define WSA884X_PA_FSM_BYP0_BG_EN_MASK			0x04
+#define WSA884X_PA_FSM_BYP0_BG_EN_SHIFT			2
+#define WSA884X_PA_FSM_BYP0_BOOST_EN_MASK		0x08
+#define WSA884X_PA_FSM_BYP0_BOOST_EN_SHIFT		3
+#define WSA884X_PA_FSM_BYP0_PA_EN_MASK			0x10
+#define WSA884X_PA_FSM_BYP0_PA_EN_SHIFT			4
+#define WSA884X_PA_FSM_BYP0_D_UNMUTE_MASK		0x20
+#define WSA884X_PA_FSM_BYP0_D_UNMUTE_SHIFT		5
+#define WSA884X_PA_FSM_BYP0_SPKR_PROT_EN_MASK		0x40
+#define WSA884X_PA_FSM_BYP0_SPKR_PROT_EN_SHIFT		6
+#define WSA884X_PA_FSM_BYP0_TSADC_EN_MASK		0x80
+#define WSA884X_PA_FSM_BYP0_TSADC_EN_SHIFT		7
 #define WSA884X_PA_FSM_BYP1		(WSA884X_DIG_CTRL0_BASE + 0x3e)
 #define WSA884X_TADC_VALUE_CTL		(WSA884X_DIG_CTRL0_BASE + 0x50)
+#define WSA884X_TADC_VALUE_CTL_TEMP_VALUE_RD_EN_MASK	0x01
+#define WSA884X_TADC_VALUE_CTL_TEMP_VALUE_RD_EN_SHIFT	0
+#define WSA884X_TADC_VALUE_CTL_VBAT_VALUE_RD_EN_MASK	0x02
+#define WSA884X_TADC_VALUE_CTL_VBAT_VALUE_RD_EN_SHIFT	1
 #define WSA884X_TEMP_DETECT_CTL		(WSA884X_DIG_CTRL0_BASE + 0x51)
 #define WSA884X_TEMP_DIN_MSB		(WSA884X_DIG_CTRL0_BASE + 0x52)
 #define WSA884X_TEMP_DIN_LSB		(WSA884X_DIG_CTRL0_BASE + 0x53)
@@ -691,6 +714,17 @@
 		SNDRV_PCM_FMTBIT_S24_LE |\
 		SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+/* Two-point trimming for temperature calibration */
+#define WSA884X_T1_TEMP			-10L
+#define WSA884X_T2_TEMP			150L
+
+/*
+ * Device will report senseless data in many cases, so discard any measurements
+ * outside of valid range.
+ */
+#define WSA884X_LOW_TEMP_THRESHOLD	5
+#define WSA884X_HIGH_TEMP_THRESHOLD	45
+
 struct wsa884x_priv {
 	struct regmap *regmap;
 	struct device *dev;
@@ -706,6 +740,13 @@ struct wsa884x_priv {
 	int active_ports;
 	int dev_mode;
 	bool hw_init;
+	/*
+	 * Protects temperature reading code (related to speaker protection) and
+	 * fields: temperature and pa_on.
+	 */
+	struct mutex sp_lock;
+	unsigned int temperature;
+	bool pa_on;
 };
 
 enum {
@@ -1650,6 +1691,10 @@ static int wsa884x_spkr_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
+		mutex_lock(&wsa884x->sp_lock);
+		wsa884x->pa_on = true;
+		mutex_unlock(&wsa884x->sp_lock);
+
 		wsa884x_spkr_post_pmu(component, wsa884x);
 
 		snd_soc_component_write_field(component, WSA884X_PDM_WD_CTL,
@@ -1661,6 +1706,10 @@ static int wsa884x_spkr_event(struct snd_soc_dapm_widget *w,
 		snd_soc_component_write_field(component, WSA884X_PDM_WD_CTL,
 					      WSA884X_PDM_WD_CTL_PDM_WD_EN_MASK,
 					      0x0);
+
+		mutex_lock(&wsa884x->sp_lock);
+		wsa884x->pa_on = false;
+		mutex_unlock(&wsa884x->sp_lock);
 		break;
 	}
 
@@ -1800,6 +1849,144 @@ static struct snd_soc_dai_driver wsa884x_dais[] = {
 	},
 };
 
+static int wsa884x_get_temp(struct wsa884x_priv *wsa884x, long *temp)
+{
+	unsigned int d1_msb = 0, d1_lsb = 0, d2_msb = 0, d2_lsb = 0;
+	unsigned int dmeas_msb = 0, dmeas_lsb = 0;
+	int d1, d2, dmeas;
+	unsigned int mask;
+	long val;
+	int ret;
+
+	guard(mutex)(&wsa884x->sp_lock);
+
+	if (wsa884x->pa_on) {
+		/*
+		 * Reading temperature is possible only when Power Amplifier is
+		 * off. Report last cached data.
+		 */
+		*temp = wsa884x->temperature;
+		return 0;
+	}
+
+	ret = pm_runtime_resume_and_get(wsa884x->dev);
+	if (ret < 0)
+		return ret;
+
+	mask = WSA884X_PA_FSM_BYP0_DC_CAL_EN_MASK |
+	       WSA884X_PA_FSM_BYP0_CLK_WD_EN_MASK |
+	       WSA884X_PA_FSM_BYP0_BG_EN_MASK |
+	       WSA884X_PA_FSM_BYP0_D_UNMUTE_MASK |
+	       WSA884X_PA_FSM_BYP0_SPKR_PROT_EN_MASK |
+	       WSA884X_PA_FSM_BYP0_TSADC_EN_MASK;
+	/*
+	 * Here and further do not care about read or update failures.
+	 * For example, before turning on Power Amplifier for the first
+	 * time, reading WSA884X_TEMP_DIN_MSB will always return 0.
+	 * Instead, check if returned value is within reasonable
+	 * thresholds.
+	 */
+	regmap_update_bits(wsa884x->regmap, WSA884X_PA_FSM_BYP0, mask, mask);
+
+	regmap_update_bits(wsa884x->regmap, WSA884X_TADC_VALUE_CTL,
+			   WSA884X_TADC_VALUE_CTL_TEMP_VALUE_RD_EN_MASK,
+			   FIELD_PREP(WSA884X_TADC_VALUE_CTL_TEMP_VALUE_RD_EN_MASK, 0x0));
+
+	regmap_read(wsa884x->regmap, WSA884X_TEMP_DIN_MSB, &dmeas_msb);
+	regmap_read(wsa884x->regmap, WSA884X_TEMP_DIN_LSB, &dmeas_lsb);
+
+	regmap_update_bits(wsa884x->regmap, WSA884X_TADC_VALUE_CTL,
+			   WSA884X_TADC_VALUE_CTL_TEMP_VALUE_RD_EN_MASK,
+			   FIELD_PREP(WSA884X_TADC_VALUE_CTL_TEMP_VALUE_RD_EN_MASK, 0x1));
+
+	regmap_read(wsa884x->regmap, WSA884X_OTP_REG_1, &d1_msb);
+	regmap_read(wsa884x->regmap, WSA884X_OTP_REG_2, &d1_lsb);
+	regmap_read(wsa884x->regmap, WSA884X_OTP_REG_3, &d2_msb);
+	regmap_read(wsa884x->regmap, WSA884X_OTP_REG_4, &d2_lsb);
+
+	regmap_update_bits(wsa884x->regmap, WSA884X_PA_FSM_BYP0, mask, 0x0);
+
+	dmeas = (((dmeas_msb & 0xff) << 0x8) | (dmeas_lsb & 0xff)) >> 0x6;
+	d1 = (((d1_msb & 0xff) << 0x8) | (d1_lsb & 0xff)) >> 0x6;
+	d2 = (((d2_msb & 0xff) << 0x8) | (d2_lsb & 0xff)) >> 0x6;
+
+	if (d1 == d2) {
+		/* Incorrect data in OTP? */
+		ret = -EINVAL;
+		goto out;
+	}
+
+	val = WSA884X_T1_TEMP + (((dmeas - d1) * (WSA884X_T2_TEMP - WSA884X_T1_TEMP))/(d2 - d1));
+
+	dev_dbg(wsa884x->dev, "Measured temp %ld (dmeas=%d, d1=%d, d2=%d)\n",
+		val, dmeas, d1, d2);
+
+	if ((val > WSA884X_LOW_TEMP_THRESHOLD) &&
+	    (val < WSA884X_HIGH_TEMP_THRESHOLD)) {
+		wsa884x->temperature = val;
+		*temp = val;
+		ret = 0;
+	} else {
+		ret = -EAGAIN;
+	}
+
+out:
+	pm_runtime_mark_last_busy(wsa884x->dev);
+	pm_runtime_put_autosuspend(wsa884x->dev);
+
+	return ret;
+}
+
+static umode_t wsa884x_hwmon_is_visible(const void *data,
+					enum hwmon_sensor_types type, u32 attr,
+					int channel)
+{
+	if (type != hwmon_temp)
+		return 0;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		return 0444;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int wsa884x_hwmon_read(struct device *dev,
+			      enum hwmon_sensor_types type,
+			      u32 attr, int channel, long *temp)
+{
+	int ret;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		ret = wsa884x_get_temp(dev_get_drvdata(dev), temp);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+	return ret;
+}
+
+static const struct hwmon_channel_info *const wsa884x_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	NULL
+};
+
+static const struct hwmon_ops wsa884x_hwmon_ops = {
+	.is_visible	= wsa884x_hwmon_is_visible,
+	.read		= wsa884x_hwmon_read,
+};
+
+static const struct hwmon_chip_info wsa884x_hwmon_chip_info = {
+	.ops	= &wsa884x_hwmon_ops,
+	.info	= wsa884x_hwmon_info,
+};
+
 static void wsa884x_reset_powerdown(void *data)
 {
 	struct wsa884x_priv *wsa884x = data;
@@ -1849,6 +2036,7 @@ static int wsa884x_probe(struct sdw_slave *pdev,
 {
 	struct device *dev = &pdev->dev;
 	struct wsa884x_priv *wsa884x;
+	struct device *hwmon;
 	unsigned int i;
 	int ret;
 
@@ -1856,6 +2044,8 @@ static int wsa884x_probe(struct sdw_slave *pdev,
 	if (!wsa884x)
 		return -ENOMEM;
 
+	mutex_init(&wsa884x->sp_lock);
+
 	for (i = 0; i < WSA884X_SUPPLIES_NUM; i++)
 		wsa884x->supplies[i].supply = wsa884x_supply_name[i];
 
@@ -1913,6 +2103,13 @@ static int wsa884x_probe(struct sdw_slave *pdev,
 	regcache_cache_only(wsa884x->regmap, true);
 	wsa884x->hw_init = true;
 
+	hwmon = devm_hwmon_device_register_with_info(dev, "wsa884x", wsa884x,
+						     &wsa884x_hwmon_chip_info,
+						     NULL);
+	if (IS_ERR(hwmon))
+		return dev_err_probe(dev, PTR_ERR(hwmon),
+				     "Failed to register hwmon sensor\n");
+
 	pm_runtime_set_autosuspend_delay(dev, 3000);
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_mark_last_busy(dev);
-- 
2.43.0


