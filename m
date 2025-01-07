Return-Path: <linux-arm-msm+bounces-44125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A5CA03E1A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 12:45:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BFAB1886791
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 11:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98B301E008B;
	Tue,  7 Jan 2025 11:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ODjSry5f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A208A1E571F
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 11:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736250314; cv=none; b=eEdlsjSCRFX4DbF2CpeClE0HMap68EZ4TZ4aSh78kgqQFdfbd3T/mvoLsWkU3jM2Kmkp+FePdf1UNj0FJfZ3FBZGFUrXYZNwstZ3ILtiyOX+rqwgYwl39o7mnicE7wwHcesxp9bFhJVR6HKbMmfAAgr3Z+hgwzvHg8mZGUkut7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736250314; c=relaxed/simple;
	bh=MPxq6J+IQ/Z+0c0BmYlSbAeyJXTFKOsBWKuRvbWUhTo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HqfuTwo05ouxjOxdA//ZOF6Ew7c6tqUO+yoSEdB2cFr3CHu5iiROFahuPHR3mPgqcRoty93qljgqxfKsgAUg0YPbwim2DvWGgU8Ze38+dxUv68sURCZI+/bCWMO20jmd8Uf3nE5YNn4gH2gZEhjHh092rciTihai8AaRWbB9qdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ODjSry5f; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so161031265e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 03:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736250308; x=1736855108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8DYp/vnzFlH6RpHc37f/c4fZkzWjQ91aUbL0p8s/tFc=;
        b=ODjSry5fnqmFW69ZnHSAWof7Sxl120qWw4DyLKsAGMvLusu2V7Tqlv0diYWOyYOt3i
         xgMsHirq4wiElGEHiwQcn8+wvpQMUX8M792GxESyuxZHuP+Rgjqs0j9j57RMB+kq01zb
         H9R78uiHsEUU23wL/qfANvQdOtFD7lc1AFlg49DcCQ5jyY5v7EcZwbTDntGx6SPpE54X
         JWGkYB/aoQcr0LfAoFgybzeptaVQ3rBBaxE8n8HeYHB4Vh6N6SVrCpCfguR4NTRB2AJo
         rXPZOmCFYyGKGkDng8UydrF4pjKN8vLqThR9dQLSsBLf7Cj485oOhTv9gEkzwbuKDLHz
         1LBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736250308; x=1736855108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8DYp/vnzFlH6RpHc37f/c4fZkzWjQ91aUbL0p8s/tFc=;
        b=nU95Vxhc5wbYWp4BxJyWK1aJ1y7yq55Uz6DBCX3cW/E3C1Mo1Lc7BK0IfkW0cdBJjh
         CjlI5uGufsUacYgxMdkNo25Ns6B1uwCyHuqPArQfAeVtatCYWSK74LmVUfCS/VgxXjau
         bmTX1Scm9WtY9jqVAzum9usm0ONllKlLsJc/OFpwyf1wWE3XtW9nZjpL0ZCvUSSgU6Gg
         v59QAJRy5P70pmGGxOg53YqVk/diboKgxftitMlgN+E8DbjFHeOCk0OPyZHBvuVtXwE2
         yuZx2ti+Emu3lgqOjSQJuOMd4tk2fmzQsMXui+8YZXWn/Pn4lGQEFQnC0X78aLm5asxT
         AY9A==
X-Forwarded-Encrypted: i=1; AJvYcCUUZPR8sCPlnfGcaRVMsZrdQVOAcbe+EdgXSkXkt6EFNDr/PIvK8ha76oupHW4f8RqlYjlzZhk++/SFj6q8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz02+smUpbrcCHx0bhDWyXBLel2U7MIA0AxiB0rg1tdpGlo1HMg
	+qDB9RSmEC4Ob8+cikvJB2Xzg/QzAOJuw6HBJqAmQD5X1t9YNeKHix/rEDgfaBc=
X-Gm-Gg: ASbGncvfRapa9DpuLw5zJ3yOUsI3N3KsemDCwvgoJvaok0gbi24Amfk6J7L801xun5u
	0yNq9Nptr4yiJWti12ozzXeBJ1Sn3BxMouRs09Ad8sfLeoTtVx+PHlyCUbqpXYXmc3LyLMGwvX/
	398T9Cgf2G1/Wt4KM7KdCsSYivV4vbEjddlkRumMcSJG/0BhmxQhKLsFNCz8Zvqe511tuc3YPs+
	MLfOep5FDY8bPT+BSc7VssdBth6qIKKD792zXmNuKZAMK0HIgbkPgdMmlDJ3o/xXulagOphpjY=
X-Google-Smtp-Source: AGHT+IEauNgLl5kqicy9UrIj45Wn243Qm+ZUe2iM+RZC6T9kYtNA1803SlJMeuZ9LOeuV65m62C2DQ==
X-Received: by 2002:a05:600c:1f8f:b0:436:30e4:459b with SMTP id 5b1f17b1804b1-4368a8b6a2emr432853665e9.18.1736250307617;
        Tue, 07 Jan 2025 03:45:07 -0800 (PST)
Received: from localhost.localdomain ([2.124.154.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8475cesm49917176f8f.57.2025.01.07.03.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 03:45:07 -0800 (PST)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: srinivas.kandagatla@linaro.org,
	broonie@kernel.org,
	lgirdwood@gmail.com
Cc: krzysztof.kozlowski@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	jdelvare@suse.com,
	linux@roeck-us.net,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH] ASoC: codecs: wsa883x: Implement temperature reading and hwmon
Date: Tue,  7 Jan 2025 11:45:06 +0000
Message-ID: <20250107114506.554589-1-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Read temperature of the amplifier and expose it via hwmon interface, which
will be later used during calibration of speaker protection algorithms.
The method is the same as for wsa884x and therefore this is based on
Krzysztof Kozlowski's approach implemented in commit 6b99dc62d940 ("ASoC:
codecs: wsa884x: Implement temperature reading and hwmon").

Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 195 +++++++++++++++++++++++++++++++++++++
 1 file changed, 195 insertions(+)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 47da5674d7c9..848a68bb4335 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -6,6 +6,7 @@
 #include <linux/bitops.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
+#include <linux/hwmon.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -156,8 +157,28 @@
 #define WSA883X_PA_FSM_ERR_COND         (WSA883X_DIG_CTRL_BASE + 0x0014)
 #define WSA883X_PA_FSM_MSK              (WSA883X_DIG_CTRL_BASE + 0x0015)
 #define WSA883X_PA_FSM_BYP              (WSA883X_DIG_CTRL_BASE + 0x0016)
+#define WSA883X_PA_FSM_BYP_DC_CAL_EN_MASK		0x01
+#define WSA883X_PA_FSM_BYP_DC_CAL_EN_SHIFT		0
+#define WSA883X_PA_FSM_BYP_CLK_WD_EN_MASK		0x02
+#define WSA883X_PA_FSM_BYP_CLK_WD_EN_SHIFT		1
+#define WSA883X_PA_FSM_BYP_BG_EN_MASK			0x04
+#define WSA883X_PA_FSM_BYP_BG_EN_SHIFT			2
+#define WSA883X_PA_FSM_BYP_BOOST_EN_MASK		0x08
+#define WSA883X_PA_FSM_BYP_BOOST_EN_SHIFT		3
+#define WSA883X_PA_FSM_BYP_PA_EN_MASK			0x10
+#define WSA883X_PA_FSM_BYP_PA_EN_SHIFT			4
+#define WSA883X_PA_FSM_BYP_D_UNMUTE_MASK		0x20
+#define WSA883X_PA_FSM_BYP_D_UNMUTE_SHIFT		5
+#define WSA883X_PA_FSM_BYP_SPKR_PROT_EN_MASK		0x40
+#define WSA883X_PA_FSM_BYP_SPKR_PROT_EN_SHIFT		6
+#define WSA883X_PA_FSM_BYP_TSADC_EN_MASK		0x80
+#define WSA883X_PA_FSM_BYP_TSADC_EN_SHIFT		7
 #define WSA883X_PA_FSM_DBG              (WSA883X_DIG_CTRL_BASE + 0x0017)
 #define WSA883X_TADC_VALUE_CTL          (WSA883X_DIG_CTRL_BASE + 0x0020)
+#define WSA883X_TADC_VALUE_CTL_TEMP_VALUE_RD_EN_MASK	0x01
+#define WSA883X_TADC_VALUE_CTL_TEMP_VALUE_RD_EN_SHIFT	0
+#define WSA883X_TADC_VALUE_CTL_VBAT_VALUE_RD_EN_MASK	0x02
+#define WSA883X_TADC_VALUE_CTL_VBAT_VALUE_RD_EN_SHIFT	1
 #define WSA883X_TEMP_DETECT_CTL         (WSA883X_DIG_CTRL_BASE + 0x0021)
 #define WSA883X_TEMP_MSB                (WSA883X_DIG_CTRL_BASE + 0x0022)
 #define WSA883X_TEMP_LSB                (WSA883X_DIG_CTRL_BASE + 0x0023)
@@ -427,6 +448,17 @@
 		SNDRV_PCM_FMTBIT_S24_LE |\
 		SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+/* Two-point trimming for temperature calibration */
+#define WSA883X_T1_TEMP			-10L
+#define WSA883X_T2_TEMP			150L
+
+/*
+ * Device will report senseless data in many cases, so discard any measurements
+ * outside of valid range.
+ */
+#define WSA883X_LOW_TEMP_THRESHOLD	5
+#define WSA883X_HIGH_TEMP_THRESHOLD	45
+
 struct wsa883x_priv {
 	struct regmap *regmap;
 	struct device *dev;
@@ -441,6 +473,13 @@ struct wsa883x_priv {
 	int active_ports;
 	int dev_mode;
 	int comp_offset;
+	/*
+	 * Protects temperature reading code (related to speaker protection) and
+	 * fields: temperature and pa_on.
+	 */
+	struct mutex sp_lock;
+	unsigned int temperature;
+	bool pa_on;
 };
 
 enum {
@@ -1186,6 +1225,10 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
+		mutex_lock(&wsa883x->sp_lock);
+		wsa883x->pa_on = true;
+		mutex_unlock(&wsa883x->sp_lock);
+
 		switch (wsa883x->dev_mode) {
 		case RECEIVER:
 			snd_soc_component_write_field(component, WSA883X_CDC_PATH_MODE,
@@ -1235,6 +1278,9 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
 					      WSA883X_GLOBAL_PA_EN_MASK, 0);
 		snd_soc_component_write_field(component, WSA883X_PDM_WD_CTL,
 					      WSA883X_PDM_EN_MASK, 0);
+		mutex_lock(&wsa883x->sp_lock);
+		wsa883x->pa_on = false;
+		mutex_unlock(&wsa883x->sp_lock);
 		break;
 	}
 	return 0;
@@ -1367,6 +1413,141 @@ static struct snd_soc_dai_driver wsa883x_dais[] = {
 	},
 };
 
+
+static int wsa883x_get_temp(struct wsa883x_priv *wsa883x, long *temp)
+{
+	unsigned int d1_msb = 0, d1_lsb = 0, d2_msb = 0, d2_lsb = 0;
+	unsigned int dmeas_msb = 0, dmeas_lsb = 0;
+	int d1, d2, dmeas;
+	unsigned int mask;
+	int ret, range;
+	long val;
+
+	guard(mutex)(&wsa883x->sp_lock);
+
+	if (wsa883x->pa_on) {
+		/*
+		 * Reading temperature is possible only when Power Amplifier is
+		 * off. Report last cached data.
+		 */
+		*temp = wsa883x->temperature;
+		return 0;
+	}
+
+	ret = pm_runtime_resume_and_get(wsa883x->dev);
+	if (ret < 0)
+		return ret;
+
+	mask = WSA883X_PA_FSM_BYP_DC_CAL_EN_MASK |
+	       WSA883X_PA_FSM_BYP_CLK_WD_EN_MASK |
+	       WSA883X_PA_FSM_BYP_BG_EN_MASK |
+	       WSA883X_PA_FSM_BYP_D_UNMUTE_MASK |
+	       WSA883X_PA_FSM_BYP_SPKR_PROT_EN_MASK |
+	       WSA883X_PA_FSM_BYP_TSADC_EN_MASK;
+
+	/*
+	 * Here and further do not care about read or update failures.
+	 * For example, before turning on Power Amplifier for the first
+	 * time, reading WSA884X_TEMP_DIN_MSB will always return 0.
+	 * Instead, check if returned value is within reasonable
+	 * thresholds.
+	 */
+	regmap_update_bits(wsa883x->regmap, WSA883X_PA_FSM_BYP, mask, mask);
+
+	regmap_update_bits(wsa883x->regmap, WSA883X_TADC_VALUE_CTL,
+			   WSA883X_TADC_VALUE_CTL_TEMP_VALUE_RD_EN_MASK,
+			   FIELD_PREP(WSA883X_TADC_VALUE_CTL_TEMP_VALUE_RD_EN_MASK, 0x0));
+
+	regmap_read(wsa883x->regmap, WSA883X_TEMP_MSB, &dmeas_msb);
+	regmap_read(wsa883x->regmap, WSA883X_TEMP_LSB, &dmeas_lsb);
+
+	regmap_update_bits(wsa883x->regmap, WSA883X_TADC_VALUE_CTL,
+			   WSA883X_TADC_VALUE_CTL_TEMP_VALUE_RD_EN_MASK,
+			   FIELD_PREP(WSA883X_TADC_VALUE_CTL_TEMP_VALUE_RD_EN_MASK, 0x1));
+
+	regmap_read(wsa883x->regmap, WSA883X_OTP_REG_1, &d1_msb);
+	regmap_read(wsa883x->regmap, WSA883X_OTP_REG_2, &d1_lsb);
+	regmap_read(wsa883x->regmap, WSA883X_OTP_REG_3, &d2_msb);
+	regmap_read(wsa883x->regmap, WSA883X_OTP_REG_4, &d2_lsb);
+
+	regmap_update_bits(wsa883x->regmap, WSA883X_PA_FSM_BYP, mask, 0x0);
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
+	val = WSA883X_T1_TEMP + (((dmeas - d1) * (WSA883X_T2_TEMP - WSA883X_T1_TEMP))/(d2 - d1));
+	range = WSA883X_HIGH_TEMP_THRESHOLD - WSA883X_LOW_TEMP_THRESHOLD;
+	if (in_range(val, WSA883X_LOW_TEMP_THRESHOLD, range)) {
+		wsa883x->temperature = val;
+		*temp = val * 1000;
+		ret = 0;
+	} else
+		ret = -EAGAIN;
+
+out:
+	pm_runtime_mark_last_busy(wsa883x->dev);
+	pm_runtime_put_autosuspend(wsa883x->dev);
+
+	return ret;
+}
+
+static umode_t wsa883x_hwmon_is_visible(const void *data,
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
+static int wsa883x_hwmon_read(struct device *dev,
+			      enum hwmon_sensor_types type,
+			      u32 attr, int channel, long *temp)
+{
+	int ret;
+
+	switch (attr) {
+	case hwmon_temp_input:
+		ret = wsa883x_get_temp(dev_get_drvdata(dev), temp);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+		break;
+	}
+
+	return ret;
+}
+
+static const struct hwmon_channel_info *const wsa883x_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	NULL
+};
+
+static const struct hwmon_ops wsa883x_hwmon_ops = {
+	.is_visible	= wsa883x_hwmon_is_visible,
+	.read		= wsa883x_hwmon_read,
+};
+
+static const struct hwmon_chip_info wsa883x_hwmon_chip_info = {
+	.ops	= &wsa883x_hwmon_ops,
+	.info	= wsa883x_hwmon_info,
+};
+
 static int wsa883x_probe(struct sdw_slave *pdev,
 			 const struct sdw_device_id *id)
 {
@@ -1402,6 +1583,7 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	wsa883x->sconfig.bps = 1;
 	wsa883x->sconfig.direction = SDW_DATA_DIR_RX;
 	wsa883x->sconfig.type = SDW_STREAM_PDM;
+	mutex_init(&wsa883x->sp_lock);
 
 	/**
 	 * Port map index starts with 0, however the data port for this codec
@@ -1424,6 +1606,19 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 				    "regmap_init failed\n");
 		goto err;
 	}
+
+	if (IS_REACHABLE(CONFIG_HWMON)) {
+		struct device *hwmon;
+
+		hwmon = devm_hwmon_device_register_with_info(dev, "wsa883x",
+							     wsa883x,
+							     &wsa883x_hwmon_chip_info,
+							     NULL);
+		if (IS_ERR(hwmon))
+			return dev_err_probe(dev, PTR_ERR(hwmon),
+					     "Failed to register hwmon sensor\n");
+	}
+
 	pm_runtime_set_autosuspend_delay(dev, 3000);
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_mark_last_busy(dev);
-- 
2.47.1


