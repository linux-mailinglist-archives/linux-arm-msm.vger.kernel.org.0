Return-Path: <linux-arm-msm+bounces-36677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2379B8A92
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 06:34:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 076871C21495
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 05:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7543715748F;
	Fri,  1 Nov 2024 05:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KkUtDJ3f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAEF01547D8
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 05:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730439136; cv=none; b=kWZufVJXHrztGdJI5Up7htmvj3yfZetVwkhrdzBlqlXZEGLlRV/p4+LjZiq35whBUBhGzpk9Lr/uyX3mi8LOVA70GXo9/Z3HSxX9/ihWqkvjv9HoXdJWfQLDOKzmYjoYtv9pvcxaMiSt7zGaAgNVHyKlKydpd/fuxQpSK/OF3Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730439136; c=relaxed/simple;
	bh=ZHVJsBOWOLdJWT9I+Zjsz4dCDe1HVkQDWp1DASajnns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=APiEGorHRos7366KV/HdsAR4zemzLtTEe+/JjvgqfzDt97KeFxPXrD5l58FK/yHtmLY4FYtNaKHQDyCMeZ57qBVqbJfHscYIRwstYZ8DKpfwL/nf3HNP/ZONj0peCktbAKNtJXLZKYYI6XqGdj5G//BptMXtiFweASMRGzqh0E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KkUtDJ3f; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so14281525e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Oct 2024 22:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730439127; x=1731043927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVyiNRnHbOc+8A2vDJ6DgfHKJDPTE9ckoT9ZRDNBo8c=;
        b=KkUtDJ3f9yNWubU/8zQkFKG1VMvMn/wQZNMSaBzn2ngg7A5yGTB60To/evyXD7fho2
         yP8IhIyACVUsdVb+D96WL7OkRp4ZO3RtQDhxmNoyXwQ+RI3EwQNhIKF5nb9Qn3tXak9Z
         633eQ/51Up2hu1i04GEb3fzzex3jItmKocsinMG5TClGE8VlbGrdel4/vIEDh3kXS2Nk
         C7KWw1Weoy7Yq35nljaAOP5C91j12LctoPmlLjctXlad0XctnMl27Lp9UvYCxHy3o/oL
         iQTzGl8yhWUTgbImDk/YjiML5HYgZMGZ9hsOgZZWXcRw9By2PwaUcA+1r62Gul4vaIRr
         dp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730439127; x=1731043927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lVyiNRnHbOc+8A2vDJ6DgfHKJDPTE9ckoT9ZRDNBo8c=;
        b=KUdYPEho7zqCqOPBSwwzwlJsvu5KGGihX9iiSTQKz+qJ8blH7KjZomxcEoZRIArU+b
         1hTtqzutspzXXbLWMujiWyrys/v2TKRAOaUSiKuZUunIb2cGONHP++UC37AvxYSFDGhu
         5oO9fxYGI4C8CK31IKtdckx/NcVBy0I27WmMkc7j1E1iJj1yAxN4BG/AzVUqnFfY6QTn
         bK/6SNpXmqTNlZd7IfNtx73X6IHMw+9BzFnepFDs/DORztra0zmGMfgIjYDtk8rLPT25
         FPp359kvDT1XOxeDRpU0KvblUIFeTHxi7bUKur1xtN52KIdmH6O2m/yQK1UWg8nqa4mc
         JJdw==
X-Forwarded-Encrypted: i=1; AJvYcCU+W841np0YR6eQB/ln85JdvCbEPm/oxohJLs45wo4h3rsyVqD07f3Gxrcu6RvNNMwt1Oupt3TCLSupCK+D@vger.kernel.org
X-Gm-Message-State: AOJu0YyOSLPWsdhjDGALFKbZ9YXDExIgMGLfaYsrX8jE0alWup3LHBqc
	QxIkaYnRY+Iqw00gR8lwG0W0dGiYSueccGc9g0dH8uIRG/hjm8PFn/tE2aNWth0=
X-Google-Smtp-Source: AGHT+IFrjtVQ1s86PexDjqOQLq8pxl598EtyasPq/FGshjw2BO5pXXo5+acwrh0kBI5jAfw4K84Zpg==
X-Received: by 2002:a05:600c:1d15:b0:431:55bf:feb with SMTP id 5b1f17b1804b1-4319ad0899dmr197282235e9.25.1730439126738;
        Thu, 31 Oct 2024 22:32:06 -0700 (PDT)
Received: from localhost.localdomain ([2.222.231.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d6852fdsm46960505e9.34.2024.10.31.22.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 22:32:06 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: broonie@kernel.org,
	konradybcio@kernel.org,
	konrad.dybcio@oss.qualcomm.com,
	andersson@kernel.org,
	srinivas.kandagatla@linaro.org
Cc: tiwai@suse.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 07/10] ASoC: codecs: add wsa881x-i2c amplifier codec driver
Date: Fri,  1 Nov 2024 05:31:51 +0000
Message-ID: <20241101053154.497550-8-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241101053154.497550-1-alexey.klimov@linaro.org>
References: <20241101053154.497550-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support to analog mode of WSA8810/WSA8815 Class-D Smart Speaker
family of amplifiers. Such amplifiers is primarily interfaced with
SoundWire but they also support analog mode which is configurable
by setting one of the pins to high/low. In such case the WSA881X
amplifier is configurable only using i2c.

To have stereo two WSA881X amplifiers are required but mono
configurations are also possible.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/codecs/Kconfig          |   11 +
 sound/soc/codecs/Makefile         |    2 +
 sound/soc/codecs/wsa881x-common.h |   19 +
 sound/soc/codecs/wsa881x-i2c.c    | 1454 +++++++++++++++++++++++++++++
 4 files changed, 1486 insertions(+)
 create mode 100644 sound/soc/codecs/wsa881x-i2c.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index b8ea8cf73d63..3d7868977262 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -350,6 +350,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_WM9712
 	imply SND_SOC_WM9713
 	imply SND_SOC_WSA881X
+	imply SND_SOC_WSA881X_I2C
 	imply SND_SOC_WSA883X
 	imply SND_SOC_WSA884X
 	imply SND_SOC_ZL38060
@@ -2484,6 +2485,16 @@ config SND_SOC_WSA881X
 	  This enables support for Qualcomm WSA8810/WSA8815 Class-D
 	  Smart Speaker Amplifier.
 
+config SND_SOC_WSA881X_I2C
+	tristate "WSA881X Codec - Analog mode"
+	depends on I2C
+	select REGMAP_I2C
+	select SND_SOC_WSA881X_COMMON
+	help
+	  This enables support for Qualcomm WSA8810/WSA8815 Class-D Smart
+	  Speaker Amplifier that works in analog mode and configurable
+	  via I2C.
+
 config SND_SOC_WSA883X
 	tristate "WSA883X Codec"
 	depends on SOUNDWIRE
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index bc1498cedf08..682bdf63abea 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -399,6 +399,7 @@ snd-soc-wm9713-y := wm9713.o
 snd-soc-wm-hubs-y := wm_hubs.o
 snd-soc-wsa881x-y := wsa881x.o
 snd-soc-wsa881x-common-y := wsa881x-common.o
+snd-soc-wsa881x-i2c-y := wsa881x-i2c.o
 snd-soc-wsa883x-y := wsa883x.o
 snd-soc-wsa884x-y := wsa884x.o
 snd-soc-zl38060-y := zl38060.o
@@ -821,6 +822,7 @@ obj-$(CONFIG_SND_SOC_WM_ADSP)	+= snd-soc-wm-adsp.o
 obj-$(CONFIG_SND_SOC_WM_HUBS)	+= snd-soc-wm-hubs.o
 obj-$(CONFIG_SND_SOC_WSA881X)	+= snd-soc-wsa881x.o
 obj-$(CONFIG_SND_SOC_WSA881X_COMMON)	+= snd-soc-wsa881x-common.o
+obj-$(CONFIG_SND_SOC_WSA881X_I2C)	+= snd-soc-wsa881x-i2c.o
 obj-$(CONFIG_SND_SOC_WSA883X)	+= snd-soc-wsa883x.o
 obj-$(CONFIG_SND_SOC_WSA884X)	+= snd-soc-wsa884x.o
 obj-$(CONFIG_SND_SOC_ZL38060)	+= snd-soc-zl38060.o
diff --git a/sound/soc/codecs/wsa881x-common.h b/sound/soc/codecs/wsa881x-common.h
index cf8643e1f7f7..1b9c20cd3807 100644
--- a/sound/soc/codecs/wsa881x-common.h
+++ b/sound/soc/codecs/wsa881x-common.h
@@ -2,6 +2,7 @@
 #ifndef __WSA881x_COMMON_H__
 #define __WSA881x_COMMON_H__
 
+#include <linux/i2c.h>
 #include <linux/soundwire/sdw.h>
 #include <sound/soc.h>
 
@@ -193,6 +194,24 @@ struct wsa881x_priv {
 	bool port_enable[WSA881X_MAX_SWR_PORTS];
 #endif
 
+#if IS_ENABLED(CONFIG_SND_SOC_WSA881X_I2C)
+	/* i2c interace for analog mode */
+	struct regmap *regmap_analog;
+	/* First client is for digital part, the second is for analog part */
+	struct i2c_client *client[2];
+	struct snd_soc_component *component;
+	struct snd_soc_dai_driver *dai_driver;
+	struct snd_soc_component_driver *driver;
+	struct gpio_desc *mclk_pin;
+	struct clk *wsa_mclk;
+	bool boost_enable;
+	int spk_pa_gain;
+	struct i2c_msg xfer_msg[2];
+	bool regmap_flag;
+	bool wsa_active;
+	int index;
+	int version;
+#endif
 	struct gpio_desc *sd_n;
 	/*
 	 * Logical state for SD_N GPIO: high for shutdown, low for enable.
diff --git a/sound/soc/codecs/wsa881x-i2c.c b/sound/soc/codecs/wsa881x-i2c.c
new file mode 100644
index 000000000000..74fa85306ad9
--- /dev/null
+++ b/sound/soc/codecs/wsa881x-i2c.c
@@ -0,0 +1,1454 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2015-2016, 2018-2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2024, Linaro Limited
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/of_gpio.h>
+#include <linux/platform_device.h>
+#include <linux/device.h>
+#include <linux/printk.h>
+#include <linux/bitops.h>
+#include <linux/regulator/consumer.h>
+#include <linux/pm_runtime.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/gpio.h>
+#include <linux/regmap.h>
+#include "wsa881x-common.h"
+
+#define I2C_ANALOG_OFFSET		0x36
+#define SPK_GAIN_12DB			4
+
+#define WSA881X_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
+			SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
+			SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_192000 |\
+			SNDRV_PCM_RATE_384000)
+/* Fractional Rates */
+#define WSA881X_FRAC_RATES (SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_88200 |\
+				SNDRV_PCM_RATE_176400 | SNDRV_PCM_RATE_352800)
+
+#define WSA881X_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
+			SNDRV_PCM_FMTBIT_S24_LE |\
+			SNDRV_PCM_FMTBIT_S24_3LE | SNDRV_PCM_FMTBIT_S32_LE)
+
+#define WSA881X_I2C_DRV_NAME	"wsa881x_i2c_codec"
+
+#define WSA881X_I2C_SPK0_SLAVE0_ADDR	0x0E
+#define WSA881X_I2C_SPK0_SLAVE1_ADDR	0x44
+#define WSA881X_I2C_SPK1_SLAVE0_ADDR	0x0F
+#define WSA881X_I2C_SPK1_SLAVE1_ADDR	0x45
+#define WSA881X_I2C_SPK0_SLAVE0		0
+#define WSA881X_I2C_SPK1_SLAVE0		1
+
+#define MAX_WSA881X_DEVICE		2
+#define WSA881X_DIGITAL_SLAVE		0
+#define WSA881X_ANALOG_SLAVE		1
+
+enum {
+	WSA881X_1_X = 0,
+	WSA881X_2_0,
+};
+
+#define WSA881X_IS_2_0(ver)		((ver == WSA881X_2_0) ? 1 : 0)
+
+struct reg_default wsa881x_ana_reg_defaults[] = {
+	{WSA881X_CHIP_ID0, 0x00},
+	{WSA881X_CHIP_ID1, 0x00},
+	{WSA881X_CHIP_ID2, 0x00},
+	{WSA881X_CHIP_ID3, 0x02},
+	{WSA881X_BUS_ID, 0x00},
+	{WSA881X_CDC_RST_CTL, 0x00},
+	{WSA881X_CDC_TOP_CLK_CTL, 0x03},
+	{WSA881X_CDC_ANA_CLK_CTL, 0x00},
+	{WSA881X_CDC_DIG_CLK_CTL, 0x00},
+	{WSA881X_CLOCK_CONFIG, 0x00},
+	{WSA881X_ANA_CTL, 0x08},
+	{WSA881X_SWR_RESET_EN, 0x00},
+	{WSA881X_TEMP_DETECT_CTL, 0x01},
+	{WSA881X_TEMP_MSB, 0x00},
+	{WSA881X_TEMP_LSB, 0x00},
+	{WSA881X_TEMP_CONFIG0, 0x00},
+	{WSA881X_TEMP_CONFIG1, 0x00},
+	{WSA881X_CDC_CLIP_CTL, 0x03},
+	{WSA881X_SDM_PDM9_LSB, 0x00},
+	{WSA881X_SDM_PDM9_MSB, 0x00},
+	{WSA881X_CDC_RX_CTL, 0x7E},
+	{WSA881X_DEM_BYPASS_DATA0, 0x00},
+	{WSA881X_DEM_BYPASS_DATA1, 0x00},
+	{WSA881X_DEM_BYPASS_DATA2, 0x00},
+	{WSA881X_DEM_BYPASS_DATA3, 0x00},
+	{WSA881X_OTP_CTRL0, 0x00},
+	{WSA881X_OTP_CTRL1, 0x00},
+	{WSA881X_HDRIVE_CTL_GROUP1, 0x00},
+	{WSA881X_INTR_MODE, 0x00},
+	{WSA881X_INTR_MASK, 0x1F},
+	{WSA881X_INTR_STATUS, 0x00},
+	{WSA881X_INTR_CLEAR, 0x00},
+	{WSA881X_INTR_LEVEL, 0x00},
+	{WSA881X_INTR_SET, 0x00},
+	{WSA881X_INTR_TEST, 0x00},
+	{WSA881X_PDM_TEST_MODE, 0x00},
+	{WSA881X_ATE_TEST_MODE, 0x00},
+	{WSA881X_PIN_CTL_MODE, 0x00},
+	{WSA881X_PIN_CTL_OE, 0x00},
+	{WSA881X_PIN_WDATA_IOPAD, 0x00},
+	{WSA881X_PIN_STATUS, 0x00},
+	{WSA881X_DIG_DEBUG_MODE, 0x00},
+	{WSA881X_DIG_DEBUG_SEL, 0x00},
+	{WSA881X_DIG_DEBUG_EN, 0x00},
+	{WSA881X_SWR_HM_TEST1, 0x08},
+	{WSA881X_SWR_HM_TEST2, 0x00},
+	{WSA881X_TEMP_DETECT_DBG_CTL, 0x00},
+	{WSA881X_TEMP_DEBUG_MSB, 0x00},
+	{WSA881X_TEMP_DEBUG_LSB, 0x00},
+	{WSA881X_SAMPLE_EDGE_SEL, 0x0C},
+	{WSA881X_SPARE_0, 0x00},
+	{WSA881X_SPARE_1, 0x00},
+	{WSA881X_SPARE_2, 0x00},
+	{WSA881X_OTP_REG_0, 0x01},
+	{WSA881X_OTP_REG_1, 0xFF},
+	{WSA881X_OTP_REG_2, 0xC0},
+	{WSA881X_OTP_REG_3, 0xFF},
+	{WSA881X_OTP_REG_4, 0xC0},
+	{WSA881X_OTP_REG_5, 0xFF},
+	{WSA881X_OTP_REG_6, 0xFF},
+	{WSA881X_OTP_REG_7, 0xFF},
+	{WSA881X_OTP_REG_8, 0xFF},
+	{WSA881X_OTP_REG_9, 0xFF},
+	{WSA881X_OTP_REG_10, 0xFF},
+	{WSA881X_OTP_REG_11, 0xFF},
+	{WSA881X_OTP_REG_12, 0xFF},
+	{WSA881X_OTP_REG_13, 0xFF},
+	{WSA881X_OTP_REG_14, 0xFF},
+	{WSA881X_OTP_REG_15, 0xFF},
+	{WSA881X_OTP_REG_16, 0xFF},
+	{WSA881X_OTP_REG_17, 0xFF},
+	{WSA881X_OTP_REG_18, 0xFF},
+	{WSA881X_OTP_REG_19, 0xFF},
+	{WSA881X_OTP_REG_20, 0xFF},
+	{WSA881X_OTP_REG_21, 0xFF},
+	{WSA881X_OTP_REG_22, 0xFF},
+	{WSA881X_OTP_REG_23, 0xFF},
+	{WSA881X_OTP_REG_24, 0x03},
+	{WSA881X_OTP_REG_25, 0x01},
+	{WSA881X_OTP_REG_26, 0x03},
+	{WSA881X_OTP_REG_27, 0x11},
+	{WSA881X_OTP_REG_28, 0xFF},
+	{WSA881X_OTP_REG_29, 0xFF},
+	{WSA881X_OTP_REG_30, 0xFF},
+	{WSA881X_OTP_REG_31, 0xFF},
+	{WSA881X_OTP_REG_63, 0x40},
+	/* WSA881x Analog registers */
+	{WSA881X_BIAS_REF_CTRL, 0x6C},
+	{WSA881X_BIAS_TEST, 0x16},
+	{WSA881X_BIAS_BIAS, 0xF0},
+	{WSA881X_TEMP_OP, 0x00},
+	{WSA881X_TEMP_IREF_CTRL, 0x56},
+	{WSA881X_TEMP_ISENS_CTRL, 0x47},
+	{WSA881X_TEMP_CLK_CTRL, 0x87},
+	{WSA881X_TEMP_TEST, 0x00},
+	{WSA881X_TEMP_BIAS, 0x51},
+	{WSA881X_TEMP_ADC_CTRL, 0x00},
+	{WSA881X_TEMP_DOUT_MSB, 0x00},
+	{WSA881X_TEMP_DOUT_LSB, 0x00},
+	{WSA881X_ADC_EN_MODU_V, 0x00},
+	{WSA881X_ADC_EN_MODU_I, 0x00},
+	{WSA881X_ADC_EN_DET_TEST_V, 0x00},
+	{WSA881X_ADC_EN_DET_TEST_I, 0x00},
+	{WSA881X_ADC_SEL_IBIAS, 0x25},
+	{WSA881X_ADC_EN_SEL_IBIAS, 0x10},
+	{WSA881X_SPKR_DRV_EN, 0x74},
+	{WSA881X_SPKR_DRV_GAIN, 0x01},
+	{WSA881X_SPKR_DAC_CTL, 0x40},
+	{WSA881X_SPKR_DRV_DBG, 0x15},
+	{WSA881X_SPKR_PWRSTG_DBG, 0x00},
+	{WSA881X_SPKR_OCP_CTL, 0xD4},
+	{WSA881X_SPKR_CLIP_CTL, 0x90},
+	{WSA881X_SPKR_BBM_CTL, 0x00},
+	{WSA881X_SPKR_MISC_CTL1, 0x80},
+	{WSA881X_SPKR_MISC_CTL2, 0x00},
+	{WSA881X_SPKR_BIAS_INT, 0x56},
+	{WSA881X_SPKR_PA_INT, 0x54},
+	{WSA881X_SPKR_BIAS_CAL, 0xAC},
+	{WSA881X_SPKR_BIAS_PSRR, 0x54},
+	{WSA881X_SPKR_STATUS1, 0x00},
+	{WSA881X_SPKR_STATUS2, 0x00},
+	{WSA881X_BOOST_EN_CTL, 0x18},
+	{WSA881X_BOOST_CURRENT_LIMIT, 0x7A},
+	{WSA881X_BOOST_PS_CTL, 0xC0},
+	{WSA881X_BOOST_PRESET_OUT1, 0x77},
+	{WSA881X_BOOST_PRESET_OUT2, 0x70},
+	{WSA881X_BOOST_FORCE_OUT, 0x0E},
+	{WSA881X_BOOST_LDO_PROG, 0x16},
+	{WSA881X_BOOST_SLOPE_COMP_ISENSE_FB, 0x71},
+	{WSA881X_BOOST_RON_CTL, 0x0F},
+	{WSA881X_BOOST_LOOP_STABILITY, 0xAD},
+	{WSA881X_BOOST_ZX_CTL, 0x34},
+	{WSA881X_BOOST_START_CTL, 0x23},
+	{WSA881X_BOOST_MISC1_CTL, 0x80},
+	{WSA881X_BOOST_MISC2_CTL, 0x00},
+	{WSA881X_BOOST_MISC3_CTL, 0x00},
+	{WSA881X_BOOST_ATEST_CTL, 0x00},
+	{WSA881X_SPKR_PROT_FE_GAIN, 0x46},
+	{WSA881X_SPKR_PROT_FE_CM_LDO_SET, 0x3B},
+	{WSA881X_SPKR_PROT_FE_ISENSE_BIAS_SET1, 0x8D},
+	{WSA881X_SPKR_PROT_FE_ISENSE_BIAS_SET2, 0x8D},
+	{WSA881X_SPKR_PROT_ATEST1, 0x01},
+	{WSA881X_SPKR_PROT_ATEST2, 0x00},
+	{WSA881X_SPKR_PROT_FE_VSENSE_VCM, 0x8D},
+	{WSA881X_SPKR_PROT_FE_VSENSE_BIAS_SET1, 0x4D},
+	{WSA881X_BONGO_RESRV_REG1, 0x00},
+	{WSA881X_BONGO_RESRV_REG2, 0x00},
+	{WSA881X_SPKR_PROT_SAR, 0x00},
+	{WSA881X_SPKR_STATUS3, 0x00},
+};
+
+struct reg_default wsa881x_ana_reg_defaults_0[] = {
+	{WSA881X_CHIP_ID0, 0x00},
+	{WSA881X_CHIP_ID1, 0x00},
+	{WSA881X_CHIP_ID2, 0x00},
+	{WSA881X_CHIP_ID3, 0x02},
+	{WSA881X_BUS_ID, 0x00},
+	{WSA881X_CDC_RST_CTL, 0x00},
+	{WSA881X_CDC_TOP_CLK_CTL, 0x03},
+	{WSA881X_CDC_ANA_CLK_CTL, 0x00},
+	{WSA881X_CDC_DIG_CLK_CTL, 0x00},
+	{WSA881X_CLOCK_CONFIG, 0x00},
+	{WSA881X_ANA_CTL, 0x08},
+	{WSA881X_SWR_RESET_EN, 0x00},
+	{WSA881X_TEMP_DETECT_CTL, 0x01},
+	{WSA881X_TEMP_MSB, 0x00},
+	{WSA881X_TEMP_LSB, 0x00},
+	{WSA881X_TEMP_CONFIG0, 0x00},
+	{WSA881X_TEMP_CONFIG1, 0x00},
+	{WSA881X_CDC_CLIP_CTL, 0x03},
+	{WSA881X_SDM_PDM9_LSB, 0x00},
+	{WSA881X_SDM_PDM9_MSB, 0x00},
+	{WSA881X_CDC_RX_CTL, 0x7E},
+	{WSA881X_DEM_BYPASS_DATA0, 0x00},
+	{WSA881X_DEM_BYPASS_DATA1, 0x00},
+	{WSA881X_DEM_BYPASS_DATA2, 0x00},
+	{WSA881X_DEM_BYPASS_DATA3, 0x00},
+	{WSA881X_OTP_CTRL0, 0x00},
+	{WSA881X_OTP_CTRL1, 0x00},
+	{WSA881X_HDRIVE_CTL_GROUP1, 0x00},
+	{WSA881X_INTR_MODE, 0x00},
+	{WSA881X_INTR_MASK, 0x1F},
+	{WSA881X_INTR_STATUS, 0x00},
+	{WSA881X_INTR_CLEAR, 0x00},
+	{WSA881X_INTR_LEVEL, 0x00},
+	{WSA881X_INTR_SET, 0x00},
+	{WSA881X_INTR_TEST, 0x00},
+	{WSA881X_PDM_TEST_MODE, 0x00},
+	{WSA881X_ATE_TEST_MODE, 0x00},
+	{WSA881X_PIN_CTL_MODE, 0x00},
+	{WSA881X_PIN_CTL_OE, 0x00},
+	{WSA881X_PIN_WDATA_IOPAD, 0x00},
+	{WSA881X_PIN_STATUS, 0x00},
+	{WSA881X_DIG_DEBUG_MODE, 0x00},
+	{WSA881X_DIG_DEBUG_SEL, 0x00},
+	{WSA881X_DIG_DEBUG_EN, 0x00},
+	{WSA881X_SWR_HM_TEST1, 0x08},
+	{WSA881X_SWR_HM_TEST2, 0x00},
+	{WSA881X_TEMP_DETECT_DBG_CTL, 0x00},
+	{WSA881X_TEMP_DEBUG_MSB, 0x00},
+	{WSA881X_TEMP_DEBUG_LSB, 0x00},
+	{WSA881X_SAMPLE_EDGE_SEL, 0x0C},
+	{WSA881X_SPARE_0, 0x00},
+	{WSA881X_SPARE_1, 0x00},
+	{WSA881X_SPARE_2, 0x00},
+	{WSA881X_OTP_REG_0, 0x01},
+	{WSA881X_OTP_REG_1, 0xFF},
+	{WSA881X_OTP_REG_2, 0xC0},
+	{WSA881X_OTP_REG_3, 0xFF},
+	{WSA881X_OTP_REG_4, 0xC0},
+	{WSA881X_OTP_REG_5, 0xFF},
+	{WSA881X_OTP_REG_6, 0xFF},
+	{WSA881X_OTP_REG_7, 0xFF},
+	{WSA881X_OTP_REG_8, 0xFF},
+	{WSA881X_OTP_REG_9, 0xFF},
+	{WSA881X_OTP_REG_10, 0xFF},
+	{WSA881X_OTP_REG_11, 0xFF},
+	{WSA881X_OTP_REG_12, 0xFF},
+	{WSA881X_OTP_REG_13, 0xFF},
+	{WSA881X_OTP_REG_14, 0xFF},
+	{WSA881X_OTP_REG_15, 0xFF},
+	{WSA881X_OTP_REG_16, 0xFF},
+	{WSA881X_OTP_REG_17, 0xFF},
+	{WSA881X_OTP_REG_18, 0xFF},
+	{WSA881X_OTP_REG_19, 0xFF},
+	{WSA881X_OTP_REG_20, 0xFF},
+	{WSA881X_OTP_REG_21, 0xFF},
+	{WSA881X_OTP_REG_22, 0xFF},
+	{WSA881X_OTP_REG_23, 0xFF},
+	{WSA881X_OTP_REG_24, 0x03},
+	{WSA881X_OTP_REG_25, 0x01},
+	{WSA881X_OTP_REG_26, 0x03},
+	{WSA881X_OTP_REG_27, 0x11},
+	{WSA881X_OTP_REG_28, 0xFF},
+	{WSA881X_OTP_REG_29, 0xFF},
+	{WSA881X_OTP_REG_30, 0xFF},
+	{WSA881X_OTP_REG_31, 0xFF},
+	{WSA881X_OTP_REG_63, 0x40},
+};
+
+struct reg_default wsa881x_ana_reg_defaults_1[] = {
+	{WSA881X_BIAS_REF_CTRL - WSA881X_ANALOG_BASE, 0x6C},
+	{WSA881X_BIAS_TEST - WSA881X_ANALOG_BASE, 0x16},
+	{WSA881X_BIAS_BIAS - WSA881X_ANALOG_BASE, 0xF0},
+	{WSA881X_TEMP_OP - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_TEMP_IREF_CTRL - WSA881X_ANALOG_BASE, 0x56},
+	{WSA881X_TEMP_ISENS_CTRL - WSA881X_ANALOG_BASE, 0x47},
+	{WSA881X_TEMP_CLK_CTRL - WSA881X_ANALOG_BASE, 0x87},
+	{WSA881X_TEMP_TEST - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_TEMP_BIAS - WSA881X_ANALOG_BASE, 0x51},
+	{WSA881X_TEMP_ADC_CTRL - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_TEMP_DOUT_MSB - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_TEMP_DOUT_LSB - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_ADC_EN_MODU_V - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_ADC_EN_MODU_I - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_ADC_EN_DET_TEST_V - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_ADC_EN_DET_TEST_I - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_ADC_SEL_IBIAS - WSA881X_ANALOG_BASE, 0x25},
+	{WSA881X_ADC_EN_SEL_IBIAS - WSA881X_ANALOG_BASE, 0x10},
+	{WSA881X_SPKR_DRV_EN - WSA881X_ANALOG_BASE, 0x74},
+	{WSA881X_SPKR_DRV_GAIN - WSA881X_ANALOG_BASE, 0x01},
+	{WSA881X_SPKR_DAC_CTL - WSA881X_ANALOG_BASE, 0x40},
+	{WSA881X_SPKR_DRV_DBG - WSA881X_ANALOG_BASE, 0x15},
+	{WSA881X_SPKR_PWRSTG_DBG - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_SPKR_OCP_CTL - WSA881X_ANALOG_BASE, 0xD4},
+	{WSA881X_SPKR_CLIP_CTL - WSA881X_ANALOG_BASE, 0x90},
+	{WSA881X_SPKR_BBM_CTL - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_SPKR_MISC_CTL1 - WSA881X_ANALOG_BASE, 0x80},
+	{WSA881X_SPKR_MISC_CTL2 - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_SPKR_BIAS_INT - WSA881X_ANALOG_BASE, 0x56},
+	{WSA881X_SPKR_PA_INT - WSA881X_ANALOG_BASE, 0x54},
+	{WSA881X_SPKR_BIAS_CAL - WSA881X_ANALOG_BASE, 0xAC},
+	{WSA881X_SPKR_BIAS_PSRR - WSA881X_ANALOG_BASE, 0x54},
+	{WSA881X_SPKR_STATUS1 - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_SPKR_STATUS2 - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_BOOST_EN_CTL - WSA881X_ANALOG_BASE, 0x18},
+	{WSA881X_BOOST_CURRENT_LIMIT - WSA881X_ANALOG_BASE, 0x7A},
+	{WSA881X_BOOST_PS_CTL - WSA881X_ANALOG_BASE, 0xC0},
+	{WSA881X_BOOST_PRESET_OUT1 - WSA881X_ANALOG_BASE, 0x77},
+	{WSA881X_BOOST_PRESET_OUT2 - WSA881X_ANALOG_BASE, 0x70},
+	{WSA881X_BOOST_FORCE_OUT - WSA881X_ANALOG_BASE, 0x0E},
+	{WSA881X_BOOST_LDO_PROG - WSA881X_ANALOG_BASE, 0x16},
+	{WSA881X_BOOST_SLOPE_COMP_ISENSE_FB - WSA881X_ANALOG_BASE, 0x71},
+	{WSA881X_BOOST_RON_CTL - WSA881X_ANALOG_BASE, 0x0F},
+	{WSA881X_BOOST_LOOP_STABILITY - WSA881X_ANALOG_BASE, 0xAD},
+	{WSA881X_BOOST_ZX_CTL - WSA881X_ANALOG_BASE, 0x34},
+	{WSA881X_BOOST_START_CTL - WSA881X_ANALOG_BASE, 0x23},
+	{WSA881X_BOOST_MISC1_CTL - WSA881X_ANALOG_BASE, 0x80},
+	{WSA881X_BOOST_MISC2_CTL - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_BOOST_MISC3_CTL - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_BOOST_ATEST_CTL - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_SPKR_PROT_FE_GAIN - WSA881X_ANALOG_BASE, 0x46},
+	{WSA881X_SPKR_PROT_FE_CM_LDO_SET - WSA881X_ANALOG_BASE, 0x3B},
+	{WSA881X_SPKR_PROT_FE_ISENSE_BIAS_SET1 - WSA881X_ANALOG_BASE, 0x8D},
+	{WSA881X_SPKR_PROT_FE_ISENSE_BIAS_SET2 - WSA881X_ANALOG_BASE, 0x8D},
+	{WSA881X_SPKR_PROT_ATEST1 - WSA881X_ANALOG_BASE, 0x01},
+	{WSA881X_SPKR_PROT_ATEST2 - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_SPKR_PROT_FE_VSENSE_VCM - WSA881X_ANALOG_BASE, 0x8D},
+	{WSA881X_SPKR_PROT_FE_VSENSE_BIAS_SET1 - WSA881X_ANALOG_BASE, 0x4D},
+	{WSA881X_BONGO_RESRV_REG1 - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_BONGO_RESRV_REG2 - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_SPKR_PROT_SAR - WSA881X_ANALOG_BASE, 0x00},
+	{WSA881X_SPKR_STATUS3 - WSA881X_ANALOG_BASE, 0x00},
+};
+
+static const struct reg_sequence wsa881x_rev_2_0_dig[] = {
+	{WSA881X_RESET_CTL, 0x00},
+	{WSA881X_TADC_VALUE_CTL, 0x01},
+	{WSA881X_INTR_MASK, 0x1B},
+	{WSA881X_IOPAD_CTL, 0x00},
+	{WSA881X_OTP_REG_28, 0x3F},
+	{WSA881X_OTP_REG_29, 0x3F},
+	{WSA881X_OTP_REG_30, 0x01},
+	{WSA881X_OTP_REG_31, 0x01},
+};
+
+static const struct reg_sequence wsa881x_rev_2_0_ana[] = {
+	{WSA881X_TEMP_ADC_CTRL, 0x03},
+	{WSA881X_ADC_SEL_IBIAS, 0x45},
+	{WSA881X_SPKR_DRV_GAIN, 0xC1},
+	{WSA881X_SPKR_DAC_CTL, 0x42},
+	{WSA881X_SPKR_BBM_CTL, 0x02},
+	{WSA881X_SPKR_MISC_CTL1, 0x40},
+	{WSA881X_SPKR_MISC_CTL2, 0x07},
+	{WSA881X_SPKR_BIAS_INT, 0x5F},
+	{WSA881X_SPKR_BIAS_PSRR, 0x44},
+	{WSA881X_BOOST_PS_CTL, 0xA0},
+	{WSA881X_BOOST_PRESET_OUT1, 0xB7},
+	{WSA881X_BOOST_LOOP_STABILITY, 0x8D},
+	{WSA881X_SPKR_PROT_ATEST2, 0x02},
+	{WSA881X_BONGO_RESRV_REG1, 0x5E},
+	{WSA881X_BONGO_RESRV_REG2, 0x07},
+};
+
+struct reg_default wsa881x_rev_2_0_regmap_ana[] = {
+	{WSA881X_TEMP_ADC_CTRL - WSA881X_ANALOG_BASE, 0x03},
+	{WSA881X_ADC_SEL_IBIAS - WSA881X_ANALOG_BASE, 0x45},
+	{WSA881X_SPKR_DRV_GAIN - WSA881X_ANALOG_BASE, 0xC1},
+	{WSA881X_SPKR_DAC_CTL - WSA881X_ANALOG_BASE, 0x42},
+	{WSA881X_SPKR_BBM_CTL - WSA881X_ANALOG_BASE, 0x02},
+	{WSA881X_SPKR_MISC_CTL1 - WSA881X_ANALOG_BASE, 0x40},
+	{WSA881X_SPKR_MISC_CTL2 - WSA881X_ANALOG_BASE, 0x07},
+	{WSA881X_SPKR_BIAS_INT - WSA881X_ANALOG_BASE, 0x5F},
+	{WSA881X_SPKR_BIAS_PSRR - WSA881X_ANALOG_BASE, 0x44},
+	{WSA881X_BOOST_PS_CTL - WSA881X_ANALOG_BASE, 0xA0},
+	{WSA881X_BOOST_PRESET_OUT1 - WSA881X_ANALOG_BASE, 0xB7},
+	{WSA881X_BOOST_LOOP_STABILITY - WSA881X_ANALOG_BASE, 0x8D},
+	{WSA881X_SPKR_PROT_ATEST2 - WSA881X_ANALOG_BASE, 0x02},
+	{WSA881X_BONGO_RESRV_REG1 - WSA881X_ANALOG_BASE, 0x5E},
+	{WSA881X_BONGO_RESRV_REG2 - WSA881X_ANALOG_BASE, 0x07},
+};
+
+/**
+ * wsa881x_update_reg_defaults_2_0 - update default values of regs for v2.0
+ *
+ * wsa881x v2.0 has different default values for certain analog and digital
+ * registers compared to v1.x. Therefore, update the values of these registers
+ * with the values from tables defined above for v2.0.
+ */
+static void wsa881x_update_reg_defaults_2_0(void)
+{
+	int i, j;
+
+	for (i = 0; i < ARRAY_SIZE(wsa881x_rev_2_0_dig); i++) {
+		for (j = 0; j < ARRAY_SIZE(wsa881x_ana_reg_defaults); j++)
+			if (wsa881x_ana_reg_defaults[j].reg ==
+						wsa881x_rev_2_0_dig[i].reg)
+				wsa881x_ana_reg_defaults[j].def =
+						wsa881x_rev_2_0_dig[i].def;
+	}
+	for (i = 0; i < ARRAY_SIZE(wsa881x_rev_2_0_ana); i++) {
+		for (j = 0; j < ARRAY_SIZE(wsa881x_ana_reg_defaults); j++)
+			if (wsa881x_ana_reg_defaults[j].reg ==
+						wsa881x_rev_2_0_ana[i].reg)
+				wsa881x_ana_reg_defaults[j].def =
+						wsa881x_rev_2_0_ana[i].def;
+	}
+}
+
+/**
+ * wsa881x_update_regmap_2_0 - update regmap framework with new tables
+ * @regmap: pointer to wsa881x regmap structure
+ * @flag: indicates digital or analog wsa881x slave
+ *
+ * wsa881x v2.0 has some new registers for both analog and digital slaves.
+ * Update the regmap framework with all the new registers.
+ */
+static void wsa881x_update_regmap_2_0(struct regmap *regmap, int flag)
+{
+	u16 ret;
+
+	switch (flag) {
+	case WSA881X_DIGITAL_SLAVE:
+		ret = regmap_register_patch(regmap, wsa881x_rev_2_0_dig,
+					ARRAY_SIZE(wsa881x_rev_2_0_dig));
+		break;
+	case WSA881X_ANALOG_SLAVE:
+		ret = regmap_register_patch(regmap, wsa881x_rev_2_0_ana,
+					ARRAY_SIZE(wsa881x_rev_2_0_ana));
+		break;
+	default:
+		pr_debug("%s: unknown version", __func__);
+		ret = -EINVAL;
+		break;
+	}
+	if (ret)
+		pr_err("%s: failed to update regmap defaults ret=%d\n",
+			__func__, ret);
+}
+
+const struct regmap_config wsa881x_ana_regmap_config[] = {
+	{
+		.reg_bits = 8,
+		.val_bits = 8,
+		.cache_type = REGCACHE_NONE,
+		.reg_defaults = wsa881x_ana_reg_defaults_0,
+		.num_reg_defaults = ARRAY_SIZE(wsa881x_ana_reg_defaults_0),
+		.max_register = WSA881X_SPKR_STATUS3,
+		.volatile_reg = wsa881x_volatile_register,
+		.readable_reg = wsa881x_readable_register,
+		.reg_format_endian = REGMAP_ENDIAN_NATIVE,
+		.val_format_endian = REGMAP_ENDIAN_NATIVE,
+	},
+	{
+		.reg_bits = 8,
+		.val_bits = 8,
+		.cache_type = REGCACHE_NONE,
+		.reg_defaults = wsa881x_ana_reg_defaults_1,
+		.num_reg_defaults = ARRAY_SIZE(wsa881x_ana_reg_defaults_1),
+		.max_register = WSA881X_SPKR_STATUS3,
+		.volatile_reg = wsa881x_volatile_register,
+		.readable_reg = wsa881x_readable_register,
+		.reg_format_endian = REGMAP_ENDIAN_NATIVE,
+		.val_format_endian = REGMAP_ENDIAN_NATIVE,
+	}
+};
+
+static const struct i2c_device_id wsa881x_i2c_id[];
+
+static void wsa881x_reset(struct wsa881x_priv *pdata, bool enable);
+static int wsa881x_startup(struct wsa881x_priv *pdata);
+static void wsa881x_shutdown(struct wsa881x_priv *pdata);
+
+static int delay_array_msec[] = {10, 20, 30, 40, 50};
+
+static const char * const wsa881x_spk_pa_gain_text[] = {
+"POS_13P5_DB", "POS_12_DB", "POS_10P5_DB", "POS_9_DB", "POS_7P5_DB",
+"POS_6_DB", "POS_4P5_DB", "POS_3_DB", "POS_1P5_DB", "POS_0_DB"};
+
+static const struct soc_enum wsa881x_spk_pa_gain_enum[] = {
+		SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(wsa881x_spk_pa_gain_text),
+				    wsa881x_spk_pa_gain_text),
+};
+
+static int wsa881x_spk_pa_gain_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+			snd_soc_kcontrol_component(kcontrol);
+	struct wsa881x_priv *wsa881x =
+			snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = wsa881x->spk_pa_gain;
+
+	dev_dbg(component->dev, "spk_pa_gain = %ld\n",
+		ucontrol->value.integer.value[0]);
+	return 0;
+}
+
+static int wsa881x_spk_pa_gain_put(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+			snd_soc_kcontrol_component(kcontrol);
+	struct wsa881x_priv *wsa881x =
+			snd_soc_component_get_drvdata(component);
+
+	if (ucontrol->value.integer.value[0] < 0 ||
+		ucontrol->value.integer.value[0] > 0xC) {
+		dev_err(component->dev, "unsupported gain val %ld\n",
+			ucontrol->value.integer.value[0]);
+		return -EINVAL;
+	}
+	wsa881x->spk_pa_gain = ucontrol->value.integer.value[0];
+	dev_dbg(component->dev, "ucontrol->value.integer.value[0] = %ld\n",
+		ucontrol->value.integer.value[0]);
+	return 0;
+}
+
+/* Helpers to figure out which regmap or client contains the register */
+static struct regmap *find_regmap(struct wsa881x_priv *wsa881x, u16 reg)
+{
+	if (reg >= WSA881X_ANALOG_BASE)
+		return wsa881x->regmap_analog;
+	else
+		return wsa881x->regmap;
+}
+
+static int find_client_index(u16 reg)
+{
+	if (reg >= WSA881X_ANALOG_BASE)
+		return WSA881X_ANALOG_SLAVE;
+	else
+		return WSA881X_DIGITAL_SLAVE;
+}
+
+static int wsa881x_i2c_write_device(struct wsa881x_priv *wsa881x,
+				    unsigned int reg, unsigned int val)
+{
+	struct regmap *wsa881x_regmap;
+	struct i2c_msg *msg;
+	int bytes = 1;
+	int ret, i, index;
+	u8 reg_addr = 0;
+	u8 data[2];
+
+	if (wsa881x->regmap_flag) {
+		wsa881x_regmap = find_regmap(wsa881x, reg);
+		ret = regmap_write(wsa881x_regmap, reg, val);
+		for (i = 0; ret && i < ARRAY_SIZE(delay_array_msec); i++) {
+			dev_err_ratelimited(wsa881x->dev,
+					    "failed writing reg=%x-retry(%d)\n",
+					    reg, i);
+			/* retry after delay of increasing order */
+			msleep(delay_array_msec[i]);
+			ret = regmap_write(wsa881x_regmap, reg, val);
+		}
+		if (ret)
+			dev_err_ratelimited(wsa881x->dev,
+					    "failed writing reg=%x ret=%d\n",
+					    reg, ret);
+		else
+			dev_dbg(wsa881x->dev, "wrote reg=%x val=%x\n",
+				reg, val);
+	} else {
+		index = find_client_index(reg);
+		reg_addr = (u8)reg;
+		msg = &wsa881x->xfer_msg[0];
+		msg->addr = wsa881x->client[index]->addr;
+		msg->len = bytes + 1;
+		msg->flags = 0;
+		data[0] = reg;
+		data[1] = (u8)val;
+		msg->buf = data;
+
+		ret = i2c_transfer(wsa881x->client[index]->adapter,
+				   wsa881x->xfer_msg, 1);
+		/* Try again if the write fails */
+		if (ret != 1) {
+			ret = i2c_transfer(wsa881x->client[index]->adapter,
+					   wsa881x->xfer_msg, 1);
+			if (ret != 1) {
+				dev_err_ratelimited(wsa881x->dev,
+						    "failed i2c transfer\n");
+				return ret;
+			}
+		}
+		dev_dbg(wsa881x->dev, "wrote reg=%x val=%x\n", reg, data[1]);
+	}
+	return ret;
+}
+
+static int wsa881x_i2c_read_device(struct wsa881x_priv *wsa881x,
+				   unsigned int reg)
+{
+	struct regmap *wsa881x_regmap;
+	struct i2c_msg *msg;
+	unsigned int val;
+	int ret, i, index;
+	u8 reg_addr = 0;
+	u8 dest[5] = {0};
+
+	if (wsa881x->regmap_flag) {
+
+		wsa881x_regmap = find_regmap(wsa881x, reg);
+		if (!wsa881x_regmap) {
+			dev_err_ratelimited(wsa881x->dev,
+					    "invalid register to read\n");
+			return -EINVAL;
+		}
+		ret = regmap_read(wsa881x_regmap, reg, &val);
+		for (i = 0; ret && i < ARRAY_SIZE(delay_array_msec); i++) {
+			dev_err_ratelimited(wsa881x->dev,
+					    "failed to read reg=%x-retry(%d)\n",
+					    reg, i);
+			/* retry after delay of increasing order */
+			msleep(delay_array_msec[i]);
+			ret = regmap_read(wsa881x_regmap, reg, &val);
+		}
+		if (ret) {
+			dev_err_ratelimited(wsa881x->dev,
+					    "failed to read reg=%x ret=%d\n",
+					    reg, ret);
+			return ret;
+		}
+		dev_dbg(wsa881x->dev, "read success, reg=%x val=%x\n",
+			reg, val);
+	} else {
+		index = find_client_index(reg);
+		reg_addr = (u8)reg;
+		msg = &wsa881x->xfer_msg[0];
+		msg->addr = wsa881x->client[index]->addr;
+		msg->len = 1;
+		msg->flags = 0;
+		msg->buf = &reg_addr;
+
+		msg = &wsa881x->xfer_msg[1];
+		msg->addr = wsa881x->client[index]->addr;
+		msg->len = 1;
+		msg->flags = I2C_M_RD;
+		msg->buf = dest;
+
+		ret = i2c_transfer(wsa881x->client[index]->adapter,
+				   wsa881x->xfer_msg, 2);
+		/* Try again if read fails first time */
+		if (ret != 2) {
+			ret = i2c_transfer(wsa881x->client[index]->adapter,
+					   wsa881x->xfer_msg, 2);
+			if (ret != 2) {
+				dev_err_ratelimited(wsa881x->dev,
+						    "failed to read reg=%d\n",
+						    reg);
+				return ret;
+			}
+		}
+		val = dest[0];
+	}
+	return val;
+}
+
+static unsigned int wsa881x_i2c_read(struct snd_soc_component *component,
+				     unsigned int reg)
+{
+	struct wsa881x_priv *wsa881x;
+
+	wsa881x = snd_soc_component_get_drvdata(component);
+	if (!wsa881x->wsa_active)
+		return 0;
+
+	return wsa881x_i2c_read_device(wsa881x, reg);
+}
+
+static int wsa881x_i2c_write(struct snd_soc_component *component,
+			     unsigned int reg, unsigned int val)
+{
+	struct wsa881x_priv *wsa881x;
+
+	wsa881x = snd_soc_component_get_drvdata(component);
+	if (!wsa881x->wsa_active)
+		return 0;
+
+	return wsa881x_i2c_write_device(wsa881x, reg, val);
+}
+
+static int wsa881x_i2c_get_client_index(struct i2c_client *client,
+					int *wsa881x_index)
+{
+	int ret = 0;
+
+	switch (client->addr) {
+	case WSA881X_I2C_SPK0_SLAVE0_ADDR:
+	case WSA881X_I2C_SPK0_SLAVE1_ADDR:
+		*wsa881x_index = WSA881X_I2C_SPK0_SLAVE0;
+	break;
+	case WSA881X_I2C_SPK1_SLAVE0_ADDR:
+	case WSA881X_I2C_SPK1_SLAVE1_ADDR:
+		*wsa881x_index = WSA881X_I2C_SPK1_SLAVE0;
+	break;
+	default:
+		ret = -EINVAL;
+	break;
+	}
+	return ret;
+}
+
+static int wsa881x_boost_ctrl(struct snd_soc_component *component, bool enable)
+{
+	struct wsa881x_priv *wsa881x =
+			snd_soc_component_get_drvdata(component);
+
+	if (enable) {
+		if (!WSA881X_IS_2_0(wsa881x->version)) {
+			snd_soc_component_update_bits(component,
+						WSA881X_ANA_CTL, 0x01, 0x01);
+			snd_soc_component_update_bits(component,
+						WSA881X_ANA_CTL, 0x04, 0x04);
+			snd_soc_component_update_bits(component,
+						WSA881X_BOOST_PS_CTL,
+						0x40, 0x00);
+			snd_soc_component_update_bits(component,
+						WSA881X_BOOST_PRESET_OUT1,
+						0xF0, 0xB0);
+			snd_soc_component_update_bits(component,
+						WSA881X_BOOST_ZX_CTL,
+						0x20, 0x00);
+			snd_soc_component_update_bits(component,
+						WSA881X_BOOST_EN_CTL,
+						0x80, 0x80);
+		} else {
+			snd_soc_component_update_bits(component,
+						WSA881X_BOOST_LOOP_STABILITY,
+						0x03, 0x03);
+			snd_soc_component_update_bits(component,
+						WSA881X_BOOST_MISC2_CTL,
+						0xFF, 0x14);
+			snd_soc_component_update_bits(component,
+						WSA881X_BOOST_START_CTL,
+						0x80, 0x80);
+			snd_soc_component_update_bits(component,
+						WSA881X_BOOST_START_CTL,
+						0x03, 0x00);
+			snd_soc_component_update_bits(component,
+					WSA881X_BOOST_SLOPE_COMP_ISENSE_FB,
+					0x0C, 0x04);
+			snd_soc_component_update_bits(component,
+					WSA881X_BOOST_SLOPE_COMP_ISENSE_FB,
+					0x03, 0x00);
+			if (snd_soc_component_read(component, WSA881X_OTP_REG_0))
+				snd_soc_component_update_bits(component,
+					WSA881X_BOOST_PRESET_OUT1,
+					0xF0, 0x70);
+			else
+				snd_soc_component_update_bits(component,
+					WSA881X_BOOST_PRESET_OUT1,
+					0xF0, 0xB0);
+			snd_soc_component_update_bits(component,
+						WSA881X_ANA_CTL, 0x03, 0x01);
+			snd_soc_component_update_bits(component,
+						WSA881X_SPKR_DRV_EN,
+						0x08, 0x08);
+			snd_soc_component_update_bits(component,
+						WSA881X_ANA_CTL, 0x04, 0x04);
+			snd_soc_component_update_bits(component,
+						WSA881X_BOOST_CURRENT_LIMIT,
+						0x0F, 0x08);
+			snd_soc_component_update_bits(component,
+						WSA881X_BOOST_EN_CTL,
+						0x80, 0x80);
+		}
+		/* For WSA8810, start-up time is 1500us as per qcrg sequence */
+		usleep_range(1500, 1510);
+	} else {
+		/* ENSURE: Class-D amp is shutdown. CLK is still on */
+		snd_soc_component_update_bits(component, WSA881X_BOOST_EN_CTL,
+					      0x80, 0x00);
+		/* boost settle time is 1500us as per qcrg sequence */
+		usleep_range(1500, 1510);
+	}
+	return 0;
+}
+
+static void wsa881x_bandgap_ctrl(struct snd_soc_component *component,
+				 bool enable)
+{
+	dev_dbg(component->dev, "%s: enable:%d\n", __func__, enable);
+
+	if (enable) {
+		snd_soc_component_update_bits(component, WSA881X_TEMP_OP,
+					      0x08, 0x08);
+		/* 400usec sleep is needed as per HW requirement */
+		usleep_range(400, 410);
+		snd_soc_component_update_bits(component, WSA881X_TEMP_OP,
+					      0x04, 0x04);
+	} else {
+		snd_soc_component_update_bits(component, WSA881X_TEMP_OP,
+					      0x04, 0x00);
+		snd_soc_component_update_bits(component, WSA881X_TEMP_OP,
+					      0x08, 0x00);
+	}
+}
+
+static void wsa881x_clk_ctrl(struct snd_soc_component *component, bool enable)
+{
+	struct wsa881x_priv *wsa881x =
+				snd_soc_component_get_drvdata(component);
+
+	dev_dbg(component->dev, "%s:ss enable:%d\n", __func__, enable);
+
+	if (enable) {
+		snd_soc_component_write(component,
+					WSA881X_CDC_RST_CTL, 0x02);
+		snd_soc_component_write(component,
+					WSA881X_CDC_RST_CTL, 0x03);
+		snd_soc_component_write(component,
+					WSA881X_CLOCK_CONFIG, 0x01);
+
+		snd_soc_component_write(component,
+					WSA881X_CDC_DIG_CLK_CTL, 0x01);
+		snd_soc_component_write(component,
+					WSA881X_CDC_ANA_CLK_CTL, 0x01);
+	} else {
+		snd_soc_component_write(component,
+					WSA881X_CDC_ANA_CLK_CTL, 0x00);
+		snd_soc_component_write(component,
+					WSA881X_CDC_DIG_CLK_CTL, 0x00);
+		if (WSA881X_IS_2_0(wsa881x->version))
+			snd_soc_component_update_bits(component,
+					WSA881X_CDC_TOP_CLK_CTL, 0x01, 0x00);
+	}
+}
+
+static int wsa881x_rdac_ctrl(struct snd_soc_component *component, bool enable)
+{
+	struct wsa881x_priv *wsa881x =
+				snd_soc_component_get_drvdata(component);
+
+	dev_dbg(component->dev, "%s: enable:%d\n", __func__, enable);
+	if (enable) {
+		snd_soc_component_update_bits(component,
+					WSA881X_ANA_CTL, 0x08, 0x00);
+		snd_soc_component_update_bits(component,
+					WSA881X_SPKR_DRV_GAIN, 0x08, 0x08);
+		snd_soc_component_update_bits(component,
+					WSA881X_SPKR_DAC_CTL, 0x20, 0x20);
+		snd_soc_component_update_bits(component,
+					WSA881X_SPKR_DAC_CTL, 0x20, 0x00);
+		snd_soc_component_update_bits(component,
+					WSA881X_SPKR_DAC_CTL, 0x40, 0x40);
+		snd_soc_component_update_bits(component,
+					WSA881X_SPKR_DAC_CTL, 0x80, 0x80);
+		if (WSA881X_IS_2_0(wsa881x->version)) {
+			snd_soc_component_update_bits(component,
+					WSA881X_SPKR_BIAS_CAL, 0x01, 0x01);
+			snd_soc_component_update_bits(component,
+					WSA881X_SPKR_OCP_CTL, 0x30, 0x30);
+			snd_soc_component_update_bits(component,
+					WSA881X_SPKR_OCP_CTL, 0x0C, 0x00);
+		}
+		snd_soc_component_update_bits(component,
+					WSA881X_SPKR_DRV_GAIN, 0xF0, 0x40);
+		snd_soc_component_update_bits(component,
+					WSA881X_SPKR_MISC_CTL1, 0x01, 0x01);
+	} else {
+		/* Ensure class-D amp is off */
+		snd_soc_component_update_bits(component,
+					WSA881X_SPKR_DAC_CTL, 0x80, 0x00);
+	}
+	return 0;
+}
+
+static int wsa881x_spkr_pa_ctrl(struct snd_soc_component *component,
+				bool enable)
+{
+	struct wsa881x_priv *wsa881x =
+				snd_soc_component_get_drvdata(component);
+
+	dev_dbg(component->dev, "%s:enable:%d\n", __func__, enable);
+	if (enable) {
+		/*
+		 * Ensure: Boost is enabled and stable, Analog input is up
+		 * and outputting silence
+		 */
+		if (!WSA881X_IS_2_0(wsa881x->version)) {
+			snd_soc_component_update_bits(component,
+						WSA881X_ADC_EN_DET_TEST_I,
+						0xFF, 0x01);
+			snd_soc_component_update_bits(component,
+						WSA881X_ADC_EN_MODU_V,
+						0x02, 0x02);
+			snd_soc_component_update_bits(component,
+						WSA881X_ADC_EN_DET_TEST_V,
+						0xFF, 0x10);
+			snd_soc_component_update_bits(component,
+						WSA881X_SPKR_PWRSTG_DBG,
+						0xA0, 0xA0);
+			snd_soc_component_update_bits(component,
+						WSA881X_SPKR_DRV_EN,
+						0x80, 0x80);
+			usleep_range(700, 710);
+			snd_soc_component_update_bits(component,
+						WSA881X_SPKR_PWRSTG_DBG,
+						0x00, 0x00);
+			snd_soc_component_update_bits(component,
+						WSA881X_ADC_EN_DET_TEST_V,
+						0xFF, 0x00);
+			snd_soc_component_update_bits(component,
+						WSA881X_ADC_EN_MODU_V,
+						0x02, 0x00);
+			snd_soc_component_update_bits(component,
+						WSA881X_ADC_EN_DET_TEST_I,
+						0xFF, 0x00);
+		} else
+			snd_soc_component_update_bits(component,
+					WSA881X_SPKR_DRV_EN, 0x80, 0x80);
+		/* add 1000us delay as per qcrg */
+		usleep_range(1000, 1010);
+		snd_soc_component_update_bits(component,
+					WSA881X_SPKR_DRV_EN, 0x01, 0x01);
+		if (WSA881X_IS_2_0(wsa881x->version))
+			snd_soc_component_update_bits(component,
+						WSA881X_SPKR_BIAS_CAL,
+						0x01, 0x00);
+		usleep_range(1000, 1010);
+		snd_soc_component_update_bits(component,
+					WSA881X_SPKR_DRV_GAIN,
+					0xF0, (wsa881x->spk_pa_gain << 4));
+	} else {
+		/*
+		 * Ensure: Boost is still on, Stream from Analog input and
+		 * Speaker Protection has been stopped and input is at 0V
+		 */
+		if (WSA881X_IS_2_0(wsa881x->version)) {
+			snd_soc_component_update_bits(component,
+						WSA881X_SPKR_BIAS_CAL,
+						0x01, 0x01);
+			usleep_range(1000, 1010);
+			snd_soc_component_update_bits(component,
+						WSA881X_SPKR_BIAS_CAL,
+						0x01, 0x00);
+			msleep(20);
+			snd_soc_component_update_bits(component,
+						WSA881X_ANA_CTL, 0x03, 0x00);
+			usleep_range(200, 210);
+		}
+		snd_soc_component_update_bits(component,
+					WSA881X_SPKR_DRV_EN, 0x80, 0x00);
+	}
+	return 0;
+}
+
+static int wsa881x_get_boost(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+
+	struct snd_soc_component *component =
+					snd_soc_kcontrol_component(kcontrol);
+	struct wsa881x_priv *wsa881x =
+				snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = wsa881x->boost_enable;
+	return 0;
+}
+
+static int wsa881x_set_boost(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+					snd_soc_kcontrol_component(kcontrol);
+	struct wsa881x_priv *wsa881x =
+				snd_soc_component_get_drvdata(component);
+	int value = ucontrol->value.integer.value[0];
+
+	dev_dbg(component->dev, "Boost enable current %d, new %d\n",
+		wsa881x->boost_enable, value);
+
+	wsa881x->boost_enable = value;
+	return 0;
+}
+
+static const struct snd_kcontrol_new wsa881x_snd_controls[] = {
+	SOC_SINGLE_EXT("BOOST Switch", SND_SOC_NOPM, 0, 1, 0,
+		wsa881x_get_boost, wsa881x_set_boost),
+
+	SOC_ENUM_EXT("WSA_SPK PA Gain", wsa881x_spk_pa_gain_enum[0],
+		wsa881x_spk_pa_gain_get, wsa881x_spk_pa_gain_put),
+};
+
+static const char * const rdac_text[] = {
+	"ZERO", "Switch",
+};
+
+static const struct soc_enum rdac_enum =
+	SOC_ENUM_SINGLE(SND_SOC_NOPM, 0, ARRAY_SIZE(rdac_text), rdac_text);
+
+static const struct snd_kcontrol_new rdac_mux[] = {
+	SOC_DAPM_ENUM("RDAC", rdac_enum)
+};
+
+static int wsa881x_rdac_event(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+					snd_soc_dapm_to_component(w->dapm);
+	struct wsa881x_priv *wsa881x =
+				snd_soc_component_get_drvdata(component);
+	int ret = 0;
+
+	dev_dbg(component->dev, "%s: %s %d boost %d\n",
+		 __func__, w->name, event, wsa881x->boost_enable);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		ret = wsa881x_startup(wsa881x);
+		if (ret) {
+			dev_err(component->dev,
+				"wsa startup failed ret: %d", ret);
+			return ret;
+		}
+		wsa881x_clk_ctrl(component, true);
+		snd_soc_component_update_bits(component, WSA881X_SPKR_DAC_CTL,
+					      0x02, 0x02);
+		if (!WSA881X_IS_2_0(wsa881x->version))
+			snd_soc_component_update_bits(component,
+						WSA881X_BIAS_REF_CTRL,
+						0x0F, 0x08);
+		wsa881x_bandgap_ctrl(component, true);
+		if (!WSA881X_IS_2_0(wsa881x->version))
+			snd_soc_component_update_bits(component,
+						      WSA881X_SPKR_BBM_CTL,
+						      0x02, 0x02);
+		snd_soc_component_update_bits(component, WSA881X_SPKR_MISC_CTL1,
+					      0xC0, 0x80);
+		snd_soc_component_update_bits(component, WSA881X_SPKR_MISC_CTL1,
+					      0x06, 0x06);
+		if (!WSA881X_IS_2_0(wsa881x->version)) {
+			snd_soc_component_update_bits(component,
+					WSA881X_SPKR_MISC_CTL2,
+					0x04, 0x04);
+			snd_soc_component_update_bits(component,
+					WSA881X_SPKR_BIAS_INT,
+					0x09, 0x09);
+		}
+		snd_soc_component_update_bits(component, WSA881X_SPKR_PA_INT,
+					      0xF0, 0x20);
+		if (WSA881X_IS_2_0(wsa881x->version))
+			snd_soc_component_update_bits(component,
+					WSA881X_SPKR_PA_INT,
+					0x0E, 0x0E);
+		if (wsa881x->boost_enable)
+			wsa881x_boost_ctrl(component, true);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		wsa881x_rdac_ctrl(component, true);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		wsa881x_rdac_ctrl(component, false);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		if (wsa881x->boost_enable)
+			wsa881x_boost_ctrl(component, false);
+		wsa881x_clk_ctrl(component, false);
+		wsa881x_bandgap_ctrl(component, false);
+		wsa881x_shutdown(wsa881x);
+
+		break;
+	default:
+		dev_err(component->dev, "invalid event:%d\n", event);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int wsa881x_spkr_pa_event(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component =
+					snd_soc_dapm_to_component(w->dapm);
+
+	dev_dbg(component->dev, "%s: %s %d\n", __func__, w->name, event);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		snd_soc_component_update_bits(component, WSA881X_SPKR_OCP_CTL,
+					      0xC0, 0x80);
+		break;
+	case SND_SOC_DAPM_POST_PMU:
+		wsa881x_spkr_pa_ctrl(component, true);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		wsa881x_spkr_pa_ctrl(component, false);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		snd_soc_component_update_bits(component, WSA881X_SPKR_OCP_CTL,
+					      0xC0, 0xC0);
+		break;
+	default:
+		dev_err(component->dev, "invalid event:%d\n", event);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget wsa881x_dapm_widgets[] = {
+	SND_SOC_DAPM_INPUT("WSA_IN"),
+
+	SND_SOC_DAPM_DAC_E("RDAC Analog", NULL, SND_SOC_NOPM, 0, 0,
+		wsa881x_rdac_event,
+		SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+		SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX("WSA_RDAC", SND_SOC_NOPM, 0, 0,
+		rdac_mux),
+
+	SND_SOC_DAPM_PGA_S("WSA_SPKR PGA", 1, SND_SOC_NOPM, 0, 0,
+			wsa881x_spkr_pa_event,
+			SND_SOC_DAPM_PRE_PMU |
+			SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD |
+			SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_OUTPUT("WSA_SPKR"),
+};
+
+static const struct snd_soc_dapm_route wsa881x_audio_map[] = {
+	{"WSA_RDAC", "Switch", "WSA_IN"},
+	{"RDAC Analog", NULL, "WSA_RDAC"},
+	{"WSA_SPKR PGA", NULL, "RDAC Analog"},
+	{"WSA_SPKR", NULL, "WSA_SPKR PGA"},
+};
+
+static int wsa881x_startup(struct wsa881x_priv *wsa881x)
+{
+	int ret;
+
+	gpiod_direction_output(wsa881x->mclk_pin, 1);
+	ret = clk_prepare_enable(wsa881x->wsa_mclk);
+	if (ret) {
+		dev_err(wsa881x->dev, "MCLK enable failed\n");
+		return ret;
+	}
+	clk_set_rate(wsa881x->wsa_mclk, 9600000);
+
+	wsa881x_reset(wsa881x, true);
+	return 0;
+}
+
+static void wsa881x_shutdown(struct wsa881x_priv *wsa881x)
+{
+	wsa881x_reset(wsa881x, false);
+
+	if (__clk_is_enabled(wsa881x->wsa_mclk))
+		clk_disable_unprepare(wsa881x->wsa_mclk);
+}
+
+static int wsa881x_probe(struct snd_soc_component *component)
+{
+	struct wsa881x_priv *wsa881x = snd_soc_component_get_drvdata(component);
+
+	wsa881x->component = component;
+	wsa881x->spk_pa_gain = SPK_GAIN_12DB;
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops wsa881x_dai_ops = {
+	.set_stream = wsa881x_set_stream,
+	.mute_stream = wsa881x_digital_mute,
+	.mute_unmute_on_trigger = true,
+};
+
+static const struct snd_soc_component_driver soc_codec_dev_wsa881x = {
+	.probe = wsa881x_probe,
+	.read = wsa881x_i2c_read,
+	.write = wsa881x_i2c_write,
+	.controls = wsa881x_snd_controls,
+	.num_controls = ARRAY_SIZE(wsa881x_snd_controls),
+	.dapm_widgets = wsa881x_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(wsa881x_dapm_widgets),
+	.dapm_routes = wsa881x_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(wsa881x_audio_map),
+};
+
+static struct snd_soc_dai_driver wsa_dai[] = {
+	{
+		.name = "wsa_rx0",
+		.id = 0,
+		.playback = {
+			.stream_name = "",
+			.rates = WSA881X_RATES | WSA881X_FRAC_RATES,
+			.formats = WSA881X_FORMATS,
+			.rate_max = 384000,
+			.rate_min = 8000,
+			.channels_min = 1,
+			.channels_max = 1,
+		},
+		.ops = &wsa881x_dai_ops,
+	},
+};
+
+static void wsa881x_reset(struct wsa881x_priv *wsa881x, bool enable)
+{
+	if (enable) {
+		wsa881x->wsa_active = true;
+		wsa881x_init_common(wsa881x);
+
+	} else
+		wsa881x->wsa_active = false;
+}
+
+static int check_wsa881x_presence(struct wsa881x_priv *wsa881x)
+{
+	struct i2c_client *client = wsa881x->client[WSA881X_DIGITAL_SLAVE];
+	int ret;
+
+	ret = wsa881x_i2c_read_device(wsa881x, WSA881X_CDC_RST_CTL);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to read from addr=%x\n",
+			client->addr);
+		return ret;
+	}
+
+	ret = wsa881x_i2c_write_device(wsa881x, WSA881X_CDC_RST_CTL, 0x01);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed write addr=%x reg:0x5 val:0x1\n",
+			client->addr);
+		return ret;
+	}
+
+	/* allow 20ms before trigger next write to verify wsa881x presence */
+	msleep(20);
+	ret = wsa881x_i2c_write_device(wsa881x, WSA881X_CDC_RST_CTL, 0x00);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed write addr=%x reg:0x5 val:0x0\n",
+			client->addr);
+		return ret;
+	}
+	return ret;
+}
+
+static int wsa881x_i2c_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct wsa881x_priv *wsa881x;
+	int wsa881x_index = 0;
+	int ret;
+
+	ret = wsa881x_probe_common(&wsa881x, dev);
+	if (ret)
+		return ret;
+
+	ret = wsa881x_i2c_get_client_index(client, &wsa881x_index);
+	if (ret) {
+		dev_err(dev, "get codec I2C client failed\n");
+		return ret;
+	}
+	wsa881x->index = wsa881x_index;
+
+	wsa881x->mclk_pin = devm_gpiod_get(dev, "mclk",
+					   GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	if (IS_ERR(wsa881x->mclk_pin))
+		dev_err_probe(dev, PTR_ERR(wsa881x->mclk_pin),
+			      "MCLK GPIO not found\n");
+
+	wsa881x->wsa_mclk = devm_clk_get(&client->dev, "wsa_mclk");
+	if (IS_ERR(wsa881x->wsa_mclk))
+		return dev_err_probe(dev, PTR_ERR(wsa881x->wsa_mclk),
+				     "failed to get wsa_mclk\n");
+	clk_set_rate(wsa881x->wsa_mclk, 9600000);
+
+	wsa881x->regmap = devm_regmap_init_i2c(client,
+			&wsa881x_ana_regmap_config[WSA881X_DIGITAL_SLAVE]);
+	if (IS_ERR(wsa881x->regmap)) {
+		dev_err(dev, "digital regmap init failed %d\n", ret);
+		return PTR_ERR(wsa881x->regmap);
+	}
+	regcache_cache_bypass(wsa881x->regmap, true);
+
+	wsa881x_reset(wsa881x, true);
+
+	wsa881x->client[WSA881X_DIGITAL_SLAVE] = client;
+	ret = check_wsa881x_presence(wsa881x);
+	if (ret < 0) {
+		dev_err(&client->dev,
+			"failed to ping wsa with addr:%x, ret = %d\n",
+			client->addr, ret);
+		return -ENODEV;
+	}
+
+	wsa881x->version = wsa881x_i2c_read_device(wsa881x, WSA881X_CHIP_ID1);
+	if (wsa881x->version == WSA881X_2_0) {
+		wsa881x_update_reg_defaults_2_0();
+		wsa881x_update_regmap_2_0(wsa881x->regmap,
+					  WSA881X_DIGITAL_SLAVE);
+	}
+
+	dev_dbg(dev, "i2c addr=%x, index = %d\n", client->addr, wsa881x_index);
+	/*
+	 * If we reached this point, then device is present and we're good to
+	 * go to initialise analog part of codec
+	 */
+	wsa881x->client[WSA881X_ANALOG_SLAVE] =
+		devm_i2c_new_dummy_device(&client->dev, client->adapter,
+					  client->addr + I2C_ANALOG_OFFSET);
+	if (IS_ERR(wsa881x->client[WSA881X_ANALOG_SLAVE])) {
+		dev_err(dev,
+			"failed to register i2c device for analog part\n");
+		return PTR_ERR(wsa881x->client[WSA881X_ANALOG_SLAVE]);
+	}
+
+	wsa881x->regmap_analog = devm_regmap_init_i2c(wsa881x->client[1],
+			&wsa881x_ana_regmap_config[WSA881X_ANALOG_SLAVE]);
+	if (IS_ERR(wsa881x->regmap_analog)) {
+		dev_err(dev, "analog regmap init failed %d\n", ret);
+		return PTR_ERR(wsa881x->regmap_analog);
+	}
+	regcache_cache_bypass(wsa881x->regmap_analog, true);
+	wsa881x->client[WSA881X_ANALOG_SLAVE]->dev.platform_data = wsa881x;
+	i2c_set_clientdata(wsa881x->client[WSA881X_ANALOG_SLAVE], wsa881x);
+	wsa881x->regmap_flag = true;
+	if (wsa881x->version == WSA881X_2_0)
+		wsa881x_update_regmap_2_0(wsa881x->regmap_analog,
+					  WSA881X_ANALOG_SLAVE);
+	/* finished initialising analog part */
+
+	wsa881x->driver = devm_kzalloc(dev, sizeof(*wsa881x->driver),
+				       GFP_KERNEL);
+	if (!wsa881x->driver)
+		return -ENOMEM;
+
+	memcpy(wsa881x->driver, &soc_codec_dev_wsa881x,
+	       sizeof(*wsa881x->driver));
+	wsa881x->dai_driver = devm_kzalloc(dev,
+					   sizeof(struct snd_soc_dai_driver),
+					   GFP_KERNEL);
+	if (!wsa881x->dai_driver)
+		return -ENOMEM;
+	memcpy(wsa881x->dai_driver, wsa_dai, sizeof(struct snd_soc_dai_driver));
+
+	wsa881x->driver->name = devm_kasprintf(dev, GFP_KERNEL,
+					       "wsa-codec%d", wsa881x_index);
+	if (!wsa881x->driver->name)
+		return -ENOMEM;
+
+	wsa881x->dai_driver->name = devm_kasprintf(dev, GFP_KERNEL,
+						   "wsa_rx%d", wsa881x_index);
+	if (!wsa881x->dai_driver->name)
+		return -ENOMEM;
+
+	wsa881x->dai_driver->playback.stream_name = devm_kasprintf(dev,
+			GFP_KERNEL, "WSA881X_AIF%d Playback", wsa881x_index);
+	if (!wsa881x->dai_driver->playback.stream_name)
+		return -ENOMEM;
+
+	return devm_snd_soc_register_component(dev,
+					       wsa881x->driver,
+					       wsa881x->dai_driver,
+					       ARRAY_SIZE(wsa_dai));
+}
+
+static int __maybe_unused wsa881x_i2c_suspend(struct device *dev)
+{
+	struct wsa881x_priv *wsa881x = dev_get_drvdata(dev);
+
+	gpiod_direction_output(wsa881x->sd_n, wsa881x->sd_n_val);
+	return 0;
+}
+
+static int __maybe_unused wsa881x_i2c_resume(struct device *dev)
+{
+	struct wsa881x_priv *wsa881x = dev_get_drvdata(dev);
+
+	gpiod_direction_output(wsa881x->sd_n, !wsa881x->sd_n_val);
+	return 0;
+}
+
+static const struct dev_pm_ops wsa881x_i2c_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(wsa881x_i2c_suspend, wsa881x_i2c_resume)
+};
+
+static const struct i2c_device_id wsa881x_i2c_id[] = {
+	{"wsa881x-i2c-dev", WSA881X_I2C_SPK0_SLAVE0_ADDR},
+	{"wsa881x-i2c-dev", WSA881X_I2C_SPK1_SLAVE0_ADDR},
+	{}
+};
+
+MODULE_DEVICE_TABLE(i2c, wsa881x_i2c_id);
+
+static const struct of_device_id wsa881x_i2c_driver_table[] = {
+	{.compatible = "qcom,qrb4210-wsa881x-i2c-codec"},
+	{}
+};
+MODULE_DEVICE_TABLE(of, wsa881x_i2c_driver_table);
+
+static struct i2c_driver wsa881x_codec_driver = {
+	.driver = {
+		.name = "wsa881x-i2c-codec",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+		.pm = &wsa881x_i2c_pm_ops,
+		.of_match_table = wsa881x_i2c_driver_table,
+	},
+	.id_table = wsa881x_i2c_id,
+	.probe = wsa881x_i2c_probe,
+};
+
+static int __init wsa881x_codec_init(void)
+{
+	return i2c_add_driver(&wsa881x_codec_driver);
+}
+module_init(wsa881x_codec_init);
+
+static void __exit wsa881x_codec_exit(void)
+{
+	i2c_del_driver(&wsa881x_codec_driver);
+}
+
+module_exit(wsa881x_codec_exit);
+
+MODULE_DESCRIPTION("WSA881x Codec driver");
+MODULE_LICENSE("GPL");
-- 
2.45.2


