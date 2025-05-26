Return-Path: <linux-arm-msm+bounces-59420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CDAAC3E12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 12:50:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 447DC7A62FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 10:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB2C31F866B;
	Mon, 26 May 2025 10:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oFuxcXNc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12B51F5423
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 10:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748256607; cv=none; b=q2UUNCs4OXw+XC8yeRSIj56jyA+RVoATjJHZdfVCF7/vj0lK5hUvNzmPRc+6jo9RZ2r+bc4Ar31ATsn60TdasELgcpEwQxHxd6Msh2XWwJ4U8noAEqNT01irE0L3ytoSAuVkd99n3UtlhAmccTW3XhQ2OegdErpq38p5sSNrxMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748256607; c=relaxed/simple;
	bh=XGChspJP5I3LQLqq5KcsHIKk69mbsIBA6WisBz3c/1c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LVQ5VgDGz70bMTyNxLnV+2qz2DxmUBwg+StnpgHDyhCYL4IinHxV+VHTF7AAsI76DArw9duyC/KD06r55sT/wYHEpcOtwhxb+gHTzAmxyNFjbTAtTCxTewukKfXweHJ3aBU/cK5IssJ6ELK0EKADGatVq3OL0fzF8NSKHpmIfMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oFuxcXNc; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d72b749dcso3633255e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 03:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748256604; x=1748861404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qFXCm+Uh4tsObSJSuPLxOgv+0sGR9msvlsEdl0EYMLI=;
        b=oFuxcXNcc/xdNE57fPwx+5yg/aFrR2NQLLRslgRt6M0ulVYPUPHySHyqOvMmWw4PRG
         GTVcAz2luafG934MDWPjedSuhmHS6tCZExIOgo/7ZwuVLYRluv6wH8I3gAinhfPEhQgS
         hgcpIioEYfLdTUunBvnUrAGUUbuloGhYGdGLyNUvO6rJeMq+k+vJiBvSaUthEbTVhwL3
         JAPcMNKme9JXoWqxAExUx8OJ9EYb8lyYuvBkV+wfVmeSWNVzZJkIv8iV7nejvKQKfYUf
         /ouSCb1TDWo/+IJzx70BDPJE/2qm4i7tBmuDLfEfQ7zRTrbrxYcorm4YYf53S6cAddNU
         jInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748256604; x=1748861404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFXCm+Uh4tsObSJSuPLxOgv+0sGR9msvlsEdl0EYMLI=;
        b=pFOpiXadQ/9Fd8sMNg5lzElcS5c1Ro3QU2Y7EMdypxQ+lD+TVUZs96PFlVJCCQnsrP
         rcES4S+I9i96yqStAQhQPEeT+a1Mf2as8zMGvf2w3deH5De2VGM5ujvKXVs3CD+nx46A
         5Ags1IUhIZxJJR6/jdnkOeN9O3qq6RTY9uefQml3EegOehmpDIhSx+g+ewJy9ddZJ7qu
         4L2ZiyJd4UACgAFIbqZsQ0BNXqhauVKfpHfPyhklFZuNV6Y9pZviz6pZKm/r8AzOThAm
         +CBg/7pknjrrxe8pvzXAA6RYSRWlLg+SQ4dVB/BQK4lofbUra+RLuT0R5nWRYE9kL37n
         94SQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcoV7S8yZD4kZEhWm0KeM47kr8lP1NSrlURzBs6qkXOSiPw5zMX0/361/vt1f413PmxCc1HV22rPaQGoIR@vger.kernel.org
X-Gm-Message-State: AOJu0YyWsZd7XPOTDTIfC/83yhCQJws9wcdqbx7nF78yOUSdEuQMltgR
	F6MUxR5YObFxiScVD234Zq6Pl/N3/M6WRb1W3HRI+kz8NuZ+8wWvCBqp9Qwo8abg8U8=
X-Gm-Gg: ASbGnctWSglPtMPbzzubchNyN9scA6OGpGhZzb6CZLRL99wIEdFyDSyFSGgs+HPqned
	kJggYnMamPIWGNq6ySby4u2kX//wDsQss4mxVSWQ92qV4habVxZtXQD7raCIBNBXr9uXwIFscCb
	klxrT1oHbiUuROWiiYcT2Fjx5RKRpzI7VD55ZF8idcLe+iT2ITXS4PGcoDQFjcicWvCej2+51E+
	N0Z54psEnETn312Qs91gScQ4lVUvGEF4AqT+jutT4tIJXGMfK6YM1tGLNCV55HX6tT9CDJMrO5V
	dMWqKd57pQlubzJrQYucNe/uMRZXkPWrdjQzU+9unxneDehkXYeJc8IynZmn9UDkBdmatxc=
X-Google-Smtp-Source: AGHT+IHYHftMvEfeiSKYWstcFFrN43xpqYIuFKIcRUyEfc0gwSeBaOs0vjH9Mu5CZOZZ/7pihewLcw==
X-Received: by 2002:a05:600c:314f:b0:43d:fa58:81d2 with SMTP id 5b1f17b1804b1-44c939c15b7mr24735175e9.9.1748256604027;
        Mon, 26 May 2025 03:50:04 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d4b68sm236337215e9.23.2025.05.26.03.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 03:50:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 26 May 2025 12:49:50 +0200
Subject: [PATCH 1/6] ASoC: codecs: wcd937x: Simplify with
 devm_regulator_bulk_get_enable()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-b4-asoc-wcd9395-vdd-px-v1-1-64d3cb60313b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3852;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=XGChspJP5I3LQLqq5KcsHIKk69mbsIBA6WisBz3c/1c=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNEdSNq1JlnADTyFmOYOva9S2yE0qZLeRmm4Ke
 fgfaCsJr2OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDRHUgAKCRDBN2bmhouD
 11J6D/9AQADKnL5YeUoI8wafKTT22RpydZbuOjd0qKPDS3tzMmFKm1DhAr6ZUeFLfGbusE3Y2wC
 OC/4r9LWc7yKKAF2cZpQtQC9/s1FTB1g9rUrreSKKH+1X11uoJsfgJva2VN0rkUIm97G3MuguE4
 U3GxzF/ExBW/ES5cCfThYZ8ABKxHrp2CdcLYu6ofFKKyd+epTFjI/196h+CVSdZVkFEHnxlUfz8
 dHqpAz5wbGvwooH9fSME3CpZTqMxLzjYjfSJVet4lfLPR2Oyxps6KTUYnCiEAJeSZ9dMIywnNhF
 s6B3uvNgPd1Cr36Rve/zTIuY8MlIqjAxLLt1+X5c5qtn8Kz+j7gAaUSoLiaDxu9H+bAVVKk0Svl
 CkKVahcAvhU9RmDpmi9zYdaSkZSqoEuUd80vCw7PoM1F8321hBSdDK3rgH0gKMQu6rFbRSrhPP7
 4o3xlPkhL2yOS5UPmMXU/aCAMSpc+XTSk0otabTcgJFgbeZIVbcpuaFhM2/PlNb3l7QTzu9Dq+h
 7g6aWxVKofxbKpQsr4yqVJuGiXMhQEV5vCW1iGtqBfRXgkce8fdULzZ6nxXNN+5AfdJjiqa+1tH
 WE4R+OgaBl2oNLDuku6bU5Y3UNJfIdV0pTO6z12Gk3rvYHIW5yhkbSXw4Vdu2fBkP28Ko6v5stA
 vO5g48qsQ9i2FwA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Drop separate regulator get and enable in probe() path with
devm_regulator_bulk_get_enable(), which simplifies cleanup paths and
device remove().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd937x.c | 31 +++++++++----------------------
 sound/soc/codecs/wcd937x.h |  1 -
 2 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index b9df58b86ce953427e01ffb8c7eb7e52f9c2392a..92765a8693fbf87e2ba53fef75657ffb1b5fdb8f 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -90,7 +90,6 @@ struct wcd937x_priv {
 	struct irq_domain *virq;
 	struct regmap_irq_chip *wcd_regmap_irq_chip;
 	struct regmap_irq_chip_data *irq_chip;
-	struct regulator_bulk_data supplies[WCD937X_MAX_BULK_SUPPLY];
 	struct snd_soc_jack *jack;
 	unsigned long status_mask;
 	s32 micb_ref[WCD937X_MAX_MICBIAS];
@@ -113,6 +112,10 @@ struct wcd937x_priv {
 	atomic_t ana_clk_count;
 };
 
+static const char * const wcd937x_supplies[] = {
+	"vdd-rxtx", "vdd-px", "vdd-mic-bias", "vdd-buck",
+};
+
 static const SNDRV_CTL_TLVD_DECLARE_DB_MINMAX(ear_pa_gain, 600, -1800);
 static const DECLARE_TLV_DB_SCALE(line_gain, 0, 7, 1);
 static const DECLARE_TLV_DB_SCALE(analog_gain, 0, 25, 1);
@@ -2934,18 +2937,10 @@ static int wcd937x_probe(struct platform_device *pdev)
 	cfg = &wcd937x->mbhc_cfg;
 	cfg->swap_gnd_mic = wcd937x_swap_gnd_mic;
 
-	wcd937x->supplies[0].supply = "vdd-rxtx";
-	wcd937x->supplies[1].supply = "vdd-px";
-	wcd937x->supplies[2].supply = "vdd-mic-bias";
-	wcd937x->supplies[3].supply = "vdd-buck";
-
-	ret = devm_regulator_bulk_get(dev, WCD937X_MAX_BULK_SUPPLY, wcd937x->supplies);
+	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(wcd937x_supplies),
+					     wcd937x_supplies);
 	if (ret)
-		return dev_err_probe(dev, ret, "Failed to get supplies\n");
-
-	ret = regulator_bulk_enable(WCD937X_MAX_BULK_SUPPLY, wcd937x->supplies);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to enable supplies\n");
+		return dev_err_probe(dev, ret, "Failed to get and enable supplies\n");
 
 	wcd937x_dt_parse_micbias_info(dev, wcd937x);
 
@@ -2962,13 +2957,13 @@ static int wcd937x_probe(struct platform_device *pdev)
 
 	ret = wcd937x_add_slave_components(wcd937x, dev, &match);
 	if (ret)
-		goto err_disable_regulators;
+		return ret;
 
 	wcd937x_reset(wcd937x);
 
 	ret = component_master_add_with_match(dev, &wcd937x_comp_ops, match);
 	if (ret)
-		goto err_disable_regulators;
+		return ret;
 
 	pm_runtime_set_autosuspend_delay(dev, 1000);
 	pm_runtime_use_autosuspend(dev);
@@ -2978,25 +2973,17 @@ static int wcd937x_probe(struct platform_device *pdev)
 	pm_runtime_idle(dev);
 
 	return 0;
-
-err_disable_regulators:
-	regulator_bulk_disable(WCD937X_MAX_BULK_SUPPLY, wcd937x->supplies);
-
-	return ret;
 }
 
 static void wcd937x_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct wcd937x_priv *wcd937x = dev_get_drvdata(dev);
 
 	component_master_del(&pdev->dev, &wcd937x_comp_ops);
 
 	pm_runtime_disable(dev);
 	pm_runtime_set_suspended(dev);
 	pm_runtime_dont_use_autosuspend(dev);
-
-	regulator_bulk_disable(WCD937X_MAX_BULK_SUPPLY, wcd937x->supplies);
 }
 
 #if defined(CONFIG_OF)
diff --git a/sound/soc/codecs/wcd937x.h b/sound/soc/codecs/wcd937x.h
index 4ef57c496c37c555c8684d65249c53f6a8b645a1..3ab21bb5846e2c85520d67e7dc248d4e7715dba5 100644
--- a/sound/soc/codecs/wcd937x.h
+++ b/sound/soc/codecs/wcd937x.h
@@ -487,7 +487,6 @@
 #define WCD937X_MAX_REGISTER			(WCD937X_DIGITAL_EFUSE_REG_31)
 
 #define WCD937X_MAX_MICBIAS			3
-#define WCD937X_MAX_BULK_SUPPLY			4
 #define WCD937X_MAX_SWR_CH_IDS			15
 #define WCD937X_SWRM_CH_MASK(ch_idx)		BIT(ch_idx - 1)
 

-- 
2.45.2


