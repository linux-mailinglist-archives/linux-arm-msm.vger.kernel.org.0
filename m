Return-Path: <linux-arm-msm+bounces-52085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A21A6A5AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 13:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D2983BB52D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 11:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA42021D5BF;
	Thu, 20 Mar 2025 11:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PVIzrMu7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963C2221D8D
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 11:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742471811; cv=none; b=EH2+STuNOgb46qPER2CTC9JMJYMsO/s7swsZIANnFqGcahd5z2OvNUWdnCGHQHGaMAuTlLVerK6gc/uVjSNha8aZkxzSsvLYz0uTu5VK99HLLdStmnkdUI3g2Kh7IxTCU6IlpoJxPYFm2LsPj29hY1yXK7C8a3oln9We1zLK7iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742471811; c=relaxed/simple;
	bh=yvgNHVdkiZ8LiJlUU/iGsobFDA0gqtsqkmq/p5wyTQg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ss2uSEp7JzGpefl/yRXHc8lW5xuhIeWPDIlj9T0+X6zjO74ybUrT2CmZ5h81ga2NGAv7ptxxv6sIpGkj+zk8mmb12RH1YrmJmnrzom+j2TgPtnPof/XB8JxnxcJyLfEkoNokUjWWC3jX4ZA0IVdnyJ9KfYn4tlwZzGVn5QCZRPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PVIzrMu7; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso1179642f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Mar 2025 04:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742471806; x=1743076606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vraKEqmcC/E7mmNCeKg6kwjdUWZP5NoZV1Iu308lBD0=;
        b=PVIzrMu71ZkkDjkAySx4/AAhB81SdXbz9TqvQso67v1lMDiNCXE7EL/4pabF96WGRy
         Q28fXiIFAvVk2vip5QTblswP7zek0CyN1+Pjc0d3vVdwbd86kKyML+FFq/dWENjeppA4
         8oYsH0tgHsBj7Zj7Lths77PdNqvPAc6bpR2pQPzmja4BVF41U8ac10c16ZT9NZIUII+d
         +C0LSMZ8c6c34aPbliBnAR9H00RAktAC7G6yzyPa63EtwZggp8QOG7Ywp6YJIJ9TOVSD
         ZvZkccu8csGfJCVYOLzAKQApsEzlu4JxmDQZMjink/hPVempLpyWN0Ks9vOtHwK4RjgV
         tGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742471806; x=1743076606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vraKEqmcC/E7mmNCeKg6kwjdUWZP5NoZV1Iu308lBD0=;
        b=q4GKGm5m5sX9CvVdJSjQXwFOQh4/B5+CyAuMEItL7jgOwzpgU5/9tKaU34i6jECQ83
         OEIc8HgyQd6Qp1Reg+xOlzVvwyqMPCTQsvlcDZBIVXCdiGkGiRmcmtExaK8Ikmbrh53c
         tDGIa6+FIDSmNnIZi/EGINZnrwT8/Q5kAhHsqAZOCaNr7VnKZcLDC3oNtO5/yhmrOPzW
         oof5/mBhTlSkonaAxtNqYDhxoENdFsqsznaf59EcLO8ojLuXe1GleKwkPRj2Eu1b9D2N
         CYKRTRr3cjsT425tSegwLY1wlOY53jdOS7MAEWg5OZGxQ2bPqlCn7Vmm16xoITIobV7T
         idtQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9eRVQFK7ALTSis3fo4TrPZ5RtTgjHj5TnX2GbybHQpJMgo6ZOc9lIMwHZmD71FQMF8dgi9BqLJxxDmcb0@vger.kernel.org
X-Gm-Message-State: AOJu0YzUXgW4YZRNRDPcP9MLCZEgbdGL9Eq/nX3SqCA17abLziYaOGc1
	UoKqgfvljkJwXEPecbkcAFKdIB1UfZV9ZGVbgSaYrzha5OWJBjvAjY4fV3g3PlE=
X-Gm-Gg: ASbGncslix4Y6ZDWTPOQUSJov9RCfsMzXWUWrdrvfWARXghdzaEseboT7JvzQU4akCM
	26AWd2ue/74vZF061imbl8ixw1DAccjM72BMy1ojtXm/H40vfCEwwEmpfoi4qp8BAneozb8t7uc
	OOXVd91B43b+7dufVRvN/CySV7TgEJTFViMGWTEs7XYPO4/HABXF69FRr8QqAvnCr5dOxMqKb2t
	eSthTocex1GM/q4dg5JRlEv6x2nBS76OCKI3ZhpFkk9do4t05OqlsUQtHQPM9T+Ux2IVBB0dJ3o
	Fp0AT5g3EjFUmcwKJkzciPTn8iA1wYdRJvjwzaa/lCNug+J97N3/ScfLF+5jj4GrM435iw==
X-Google-Smtp-Source: AGHT+IGvPqYatEOZ7s/DtVYkxePfO1souYepItqxJFiXynLgFOg2g71i6mfZpTyGlVEIP1XfsEl3lQ==
X-Received: by 2002:a05:6000:1f8e:b0:391:2eaf:eca1 with SMTP id ffacd0b85a97d-39979556712mr2649359f8f.2.1742471805708;
        Thu, 20 Mar 2025 04:56:45 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c888117csm23257857f8f.44.2025.03.20.04.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 04:56:45 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: peda@axentia.se,
	broonie@kernel.org,
	andersson@kernel.org,
	krzk+dt@kernel.org
Cc: ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com,
	zhoubinbin@loongson.cn,
	paulha@opensource.cirrus.com,
	lgirdwood@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 4/5] ASoC: codecs: wcd938x: add mux control support for hp audio mux
Date: Thu, 20 Mar 2025 11:56:32 +0000
Message-Id: <20250320115633.4248-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
References: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On some platforms to minimise pop and click during switching between
CTIA and OMTP headset an additional HiFi mux is used. Most common
case is that this switch is switched on by default, but on some
platforms this needs a regulator enable.

move to using mux control to enable both regulator and handle gpios,
deprecate the usage of gpio.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/Kconfig   |  2 ++
 sound/soc/codecs/wcd938x.c | 38 ++++++++++++++++++++++++++++++--------
 2 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index ee35f3aa5521..b04076282c8b 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -2226,6 +2226,8 @@ config SND_SOC_WCD938X
 	tristate
 	depends on SOUNDWIRE || !SOUNDWIRE
 	select SND_SOC_WCD_CLASSH
+	select MULTIPLEXER
+	imply MUX_GPIO
 
 config SND_SOC_WCD938X_SDW
 	tristate "WCD9380/WCD9385 Codec - SDW"
diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index f2a4f3262bdb..b7a235eef6ba 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -19,6 +19,7 @@
 #include <linux/regmap.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
+#include <linux/mux/consumer.h>
 #include <linux/regulator/consumer.h>
 
 #include "wcd-clsh-v2.h"
@@ -178,6 +179,8 @@ struct wcd938x_priv {
 	int variant;
 	int reset_gpio;
 	struct gpio_desc *us_euro_gpio;
+	struct mux_control *us_euro_mux;
+	u32 mux_state;
 	u32 micb1_mv;
 	u32 micb2_mv;
 	u32 micb3_mv;
@@ -3243,9 +3246,16 @@ static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component, bool activ
 
 	wcd938x = snd_soc_component_get_drvdata(component);
 
-	value = gpiod_get_value(wcd938x->us_euro_gpio);
+	if (!wcd938x->us_euro_mux) {
+		value = gpiod_get_value(wcd938x->us_euro_gpio);
 
-	gpiod_set_value(wcd938x->us_euro_gpio, !value);
+		gpiod_set_value(wcd938x->us_euro_gpio, !value);
+	} else {
+		mux_control_deselect(wcd938x->us_euro_mux);
+		wcd938x->mux_state = !wcd938x->mux_state;
+		if (mux_control_select(wcd938x->us_euro_mux, wcd938x->mux_state))
+			dev_err(component->dev, "Unable to select us/euro mux state\n");
+	}
 
 	return true;
 }
@@ -3261,14 +3271,23 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
 		return dev_err_probe(dev, wcd938x->reset_gpio,
 				     "Failed to get reset gpio\n");
 
-	wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro",
-						GPIOD_OUT_LOW);
-	if (IS_ERR(wcd938x->us_euro_gpio))
-		return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
-				     "us-euro swap Control GPIO not found\n");
+	wcd938x->us_euro_mux = devm_mux_control_get(dev, NULL);
+	if (IS_ERR(wcd938x->us_euro_mux)) {
+		if (PTR_ERR(wcd938x->us_euro_mux) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+
+		/* mux is optional and now fallback to using gpio */
+		wcd938x->us_euro_mux = NULL;
+		wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro", GPIOD_OUT_LOW);
+		if (IS_ERR(wcd938x->us_euro_gpio))
+			return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
+					     "us-euro swap Control GPIO not found\n");
+	} else {
+		if (mux_control_select(wcd938x->us_euro_mux, wcd938x->mux_state))
+			dev_err(dev, "Unable to select us/euro mux state\n");
+	}
 
 	cfg->swap_gnd_mic = wcd938x_swap_gnd_mic;
-
 	wcd938x->supplies[0].supply = "vdd-rxtx";
 	wcd938x->supplies[1].supply = "vdd-io";
 	wcd938x->supplies[2].supply = "vdd-buck";
@@ -3581,6 +3600,9 @@ static void wcd938x_remove(struct platform_device *pdev)
 	pm_runtime_set_suspended(dev);
 	pm_runtime_dont_use_autosuspend(dev);
 
+	if (wcd938x->us_euro_mux)
+		mux_control_deselect(wcd938x->us_euro_mux);
+
 	regulator_bulk_disable(WCD938X_MAX_SUPPLY, wcd938x->supplies);
 	regulator_bulk_free(WCD938X_MAX_SUPPLY, wcd938x->supplies);
 }
-- 
2.39.5


