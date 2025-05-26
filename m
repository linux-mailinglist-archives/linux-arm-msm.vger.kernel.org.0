Return-Path: <linux-arm-msm+bounces-59421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DE2AC3E14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 12:50:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44BDF3B8E56
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 10:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F061F8BC7;
	Mon, 26 May 2025 10:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aGj5T5na"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F17D1F7075
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 10:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748256608; cv=none; b=jip7yO8iUL5j4KE+uG55chszrmJoCUdI+V4xpEmpD0dn9HLz4JKwXLgf3WFSJrR6ZRBNaEfCG+1zBi+LI+AbnfPnJg6q63eEEtRQBuIFq6ng2pPt8VMUqD/OLTg+/dLssLbFXaZ71rvChqkSszaL3ddp+IroCPj3k6bhrrq0zIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748256608; c=relaxed/simple;
	bh=FX2ZFjqB2aYhVdKNptGSxqmvCuZ9hZy30zaZX4GDw44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mynIV9FCaKq81Kz4sRaRU0a4CRelvh8HEZqEbIUHNMcdmTDSgHKTkkrZ5vCE74MR9QNzjNV1sR2gz6Xegt587OSRK1Ijd5OgbLXa7MBJuL/b1qFlW9VM2E7tkYrt5DlukBqiS4onV7t7Z31r6urKb+gs4QrsA+ukJiux/mgoxP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aGj5T5na; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d4ff56136so3837585e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 03:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748256605; x=1748861405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6OBa2xDaiXmKdEIq6qhKC9jrSr7c++QZFJ/xALZlOQ4=;
        b=aGj5T5nay07zznx8pR8v0dhboSodH1SsYkGEHtkYnkfJ4qIx+jrW9GT2sM2DFG/4HL
         1CqzqPBJ7VMlaQwgVApNUww9d13ZS5PF6eKdgXJnuoCvlG5sDygrKrPwSscwlYUQrcCH
         msEvHED8ep5B77EEEEBImxFegE24jXNQrt5ND2/jn/OlPIhp0Ge/klfhjR+rhHtOtkfF
         /VedZBPyCFCQrvg9YdfaDxwhAkcwM4td2wpKW+2qz6JVQDteTHf6gmoELUWu5Ce0jiob
         KX3HL+oxCxjo04RAS1eVihxFt9ZQVgrZk7LLZUTawZIeI4fZkGvRp7mLf3N74kZMaocC
         yeZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748256605; x=1748861405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6OBa2xDaiXmKdEIq6qhKC9jrSr7c++QZFJ/xALZlOQ4=;
        b=OJSsS3YcqS7vuAx/ge5/HHgMzfP5ICQwJ1Zw5noozzxEasrnX0osAw53BESk2MAmmW
         jrFXFshjz3NiH0e2uAPoGQGmW5pz3yNQMs2h/dqKWRPb4qy7wN++G2RwMl2FbUsot4u3
         L8hjQn0OqVvQ9lj+dbDFioKWZYVjoqz6IdVPhr9SNbnjIjaQJb29NpgWzIo+MC4q0xBz
         Bnm14OftI8EvFlJE9dep7RZaotm36kaSZs4ACh4u+7gpjtLK3r9AQInbF4dTQbrx5IMh
         YXgv66nmwJTBsmaDSSYixdoxpRd2E4OJMODRYTOp76xEqqDxbAge00xN6TIRJs5dgi2B
         mqBA==
X-Forwarded-Encrypted: i=1; AJvYcCVtIxawm4Jf9qF8RS5jdjq3rVRuFXeJ6ZS5ENC1CbdJdn5iYCahzyVeBFrmhNTGEl+/Rb+0APcz/z/7GnUt@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi4mq9DgHwo60IQdKugp4glmd+O1x5HuO3XqEr1DoMql0zNY0+
	jwNh2yThF2NlHPhCx3MtXYtTmHl6jABsZwyvbFM3CEzcrIt3sIJGNpQGbnNfBylIdTc=
X-Gm-Gg: ASbGnctPGOsu0cFzJdg5xnPxaQSMSl39MAvgpKkMgPWh8z5ajCnMa4LAN/4n0miO7o+
	7xtdQWZzg/Ve3Ccg2QykdtNEWPIbMh3onmcBDUVUCMJyz2QehwI22qY5wgIqz9VFh4yPoXdUF/J
	xSw3tpsiOcoO3Af3QXYFcxN49qMhM9Bs10VrORcxfwVUKxdhF0aj9F1jBOPS6RumyVOUSPnhPCF
	dzXwm69clHn89nHfRiOF8Qx8zC2n9EgSUacIQUw0eyoVkSKS8vfauSdAU+YsxQVEaEHKU7LL6iv
	DqMgD3iOEVdlnxhn8NCgaw6YYhFoxwsheuyVVTYBkMUkY0EeLXlzmkvtStbQiOuAS2XerDGyjzY
	Atx2ELw==
X-Google-Smtp-Source: AGHT+IFSOavn4OiSrSRdrm9EzdjRM1GrZSVArSnm26/rNTPuIKZdeK4R3ePwvsxF952fDQYtmip+zg==
X-Received: by 2002:a05:600c:314f:b0:43d:fa58:81d2 with SMTP id 5b1f17b1804b1-44c939c15b7mr24735485e9.9.1748256605290;
        Mon, 26 May 2025 03:50:05 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d4b68sm236337215e9.23.2025.05.26.03.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 03:50:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 26 May 2025 12:49:51 +0200
Subject: [PATCH 2/6] ASoC: codecs: wcd938x: Simplify with
 devm_regulator_bulk_get_enable()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-b4-asoc-wcd9395-vdd-px-v1-2-64d3cb60313b@linaro.org>
References: <20250526-b4-asoc-wcd9395-vdd-px-v1-0-64d3cb60313b@linaro.org>
In-Reply-To: <20250526-b4-asoc-wcd9395-vdd-px-v1-0-64d3cb60313b@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3617;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=FX2ZFjqB2aYhVdKNptGSxqmvCuZ9hZy30zaZX4GDw44=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNEdT4SZiF025Slz7VB0w5N98QbFUA1zL2sYW3
 aTRyW0ou9iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDRHUwAKCRDBN2bmhouD
 1ymHEACD9dNrF5rGR+clcwGAMbhlbQKPvqR1x/XZrLX52FjAlS2Xm+SHUaHY6J38Y1vQaabhg5V
 URL5gaSkQEKGg20/QEZyFE7HPlWPhuPxqFsESzHfDQ+AqqCdsm1MkJbYnSeRfQ6q4A4UpqT6KwT
 iXPD0s8LES8fbpHLe3sEX0FE2RTmScWPBwbXo38Y8wFaJK8UcawkOQyFGL2jVbTknNi5pF0N1pz
 40cSXezzh1ajx+7A/UcyvtN/Ki/AJLdMCF0Wzf1o/OEo/UUVoscDYExfZvCX3CwrSe6gohL+7/v
 0u15LRbO7Iyp44OdB5jbq4WyNTrpYf8StE6rUsa2hGPC2Cxj6r3jd1GIjhkj+tC5HbPamB4jyRn
 4g59xkDysKF7f4H4QJNrshH/AcQxwniurhYatLxTvbCL3x6EOwOwk1gbWz8MoX9Cl03ANV6zZ3o
 +2p6vN4E4i76zujMGBu7yM4gcbD9zEbKpwErt/v6TFD1N/UsHoU7uvzFagpMe7p8DHUVB07NAKa
 TbQ76qbV9ELcZVifL/uKPCrDKJs9IQrWUfj81j2ZWfiVeFZel1/QWQKFs/mVoFE6Z1a/SvK9uHK
 Ydbmsi87xMe+U989Gd4w6tOeyVjraXep06d6AfR8fE+q4b2OpnpViziFW3lkXProDFir1gUakys
 STMQ5yoE0ABiFTw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Drop separate regulator get and enable in probe() path with
devm_regulator_bulk_get_enable(), which simplifies cleanup paths and
device remove().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 35 +++++++++--------------------------
 1 file changed, 9 insertions(+), 26 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index b72dcd9d01720f44550d6e438498a2e7eab6dc1a..72c36c6138e1f0e33d5acb3972aa26f7d2dd9b22 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -26,7 +26,6 @@
 #include "wcd938x.h"
 
 #define WCD938X_MAX_MICBIAS		(4)
-#define WCD938X_MAX_SUPPLY		(4)
 #define WCD938X_MBHC_MAX_BUTTONS	(8)
 #define TX_ADC_MAX			(4)
 
@@ -161,7 +160,6 @@ struct wcd938x_priv {
 	struct irq_domain *virq;
 	struct regmap_irq_chip *wcd_regmap_irq_chip;
 	struct regmap_irq_chip_data *irq_chip;
-	struct regulator_bulk_data supplies[WCD938X_MAX_SUPPLY];
 	struct snd_soc_jack *jack;
 	unsigned long status_mask;
 	s32 micb_ref[WCD938X_MAX_MICBIAS];
@@ -188,6 +186,10 @@ struct wcd938x_priv {
 	bool mux_setup_done;
 };
 
+static const char * const wcd938x_supplies[] = {
+	"vdd-rxtx", "vdd-io", "vdd-buck", "vdd-mic-bias",
+};
+
 static const SNDRV_CTL_TLVD_DECLARE_DB_MINMAX(ear_pa_gain, 600, -1800);
 static const DECLARE_TLV_DB_SCALE(line_gain, -3000, 150, 0);
 static const SNDRV_CTL_TLVD_DECLARE_DB_MINMAX(analog_gain, 0, 3000);
@@ -3293,20 +3295,10 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
 
 	cfg->swap_gnd_mic = wcd938x_swap_gnd_mic;
 
-	wcd938x->supplies[0].supply = "vdd-rxtx";
-	wcd938x->supplies[1].supply = "vdd-io";
-	wcd938x->supplies[2].supply = "vdd-buck";
-	wcd938x->supplies[3].supply = "vdd-mic-bias";
-
-	ret = regulator_bulk_get(dev, WCD938X_MAX_SUPPLY, wcd938x->supplies);
+	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(wcd938x_supplies),
+					     wcd938x_supplies);
 	if (ret)
-		return dev_err_probe(dev, ret, "Failed to get supplies\n");
-
-	ret = regulator_bulk_enable(WCD938X_MAX_SUPPLY, wcd938x->supplies);
-	if (ret) {
-		regulator_bulk_free(WCD938X_MAX_SUPPLY, wcd938x->supplies);
-		return dev_err_probe(dev, ret, "Failed to enable supplies\n");
-	}
+		return dev_err_probe(dev, ret, "Failed to get and enable supplies\n");
 
 	wcd938x_dt_parse_micbias_info(dev, wcd938x);
 
@@ -3570,13 +3562,13 @@ static int wcd938x_probe(struct platform_device *pdev)
 
 	ret = wcd938x_add_slave_components(wcd938x, dev, &match);
 	if (ret)
-		goto err_disable_regulators;
+		return ret;
 
 	wcd938x_reset(wcd938x);
 
 	ret = component_master_add_with_match(dev, &wcd938x_comp_ops, match);
 	if (ret)
-		goto err_disable_regulators;
+		return ret;
 
 	pm_runtime_set_autosuspend_delay(dev, 1000);
 	pm_runtime_use_autosuspend(dev);
@@ -3586,12 +3578,6 @@ static int wcd938x_probe(struct platform_device *pdev)
 	pm_runtime_idle(dev);
 
 	return 0;
-
-err_disable_regulators:
-	regulator_bulk_disable(WCD938X_MAX_SUPPLY, wcd938x->supplies);
-	regulator_bulk_free(WCD938X_MAX_SUPPLY, wcd938x->supplies);
-
-	return ret;
 }
 
 static void wcd938x_remove(struct platform_device *pdev)
@@ -3607,9 +3593,6 @@ static void wcd938x_remove(struct platform_device *pdev)
 
 	if (wcd938x->us_euro_mux && wcd938x->mux_setup_done)
 		mux_control_deselect(wcd938x->us_euro_mux);
-
-	regulator_bulk_disable(WCD938X_MAX_SUPPLY, wcd938x->supplies);
-	regulator_bulk_free(WCD938X_MAX_SUPPLY, wcd938x->supplies);
 }
 
 #if defined(CONFIG_OF)

-- 
2.45.2


