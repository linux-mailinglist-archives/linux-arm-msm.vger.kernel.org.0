Return-Path: <linux-arm-msm+bounces-22477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57389905880
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 18:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F23111F217D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 16:20:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE85719309D;
	Wed, 12 Jun 2024 16:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qHAymeww"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17A7188CAC
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 16:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718208976; cv=none; b=r3eQ/XtvTWaCe/MN7ZNQhymOtglspwMsiZILmDf6ixYFKh1spoe80OgIzGz/+5qFcbmFczcXOO0HywsqfikFHt7+4TlCbBg/UVRW9Owpkda1JayKHpSrdgw1qNwwxWs6Hhosn7Z3Men4dgHYVdaXWhRMODn4PGZQL+mSIBBJRno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718208976; c=relaxed/simple;
	bh=BqagLWlqycAbhTFnkhaAyAXMO9chHZNsBtioPnuGa2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FFUq57Wqmo8PoEqXVS8Y+BoMil7Ew8eZUQvvTIVB3cBgpsvl+g/Z9wn7S3Jky46jk//IuC+HARvuwuT/7Sva3IIPDwSOal7Skd7gEa8XZWeedueUFeL5+KoTa8MfQJbBzPMwlFiQlmqdBYlUVg2z47tx8ZJKaToFaEEekShJ8pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qHAymeww; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a6f0dc80ab9so9350666b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 09:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208973; x=1718813773; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=umunyDYCcpIfLhzHvmQwuR6ONiqX1k9YBrp8qSeACL4=;
        b=qHAymeww1jpOy3V0uEKeWL1ZhQMD9phaSBLgbcl9TWCvmNMxBclO1qbodmdGaENI/a
         Nv4AAOxLywmlc+mOkH5vexYvrGFsCiDW6PHG6HVfCZ40dXLwyetpNuzqJvVvAgCAg3kb
         vK388Pahoc1+evh72SJHvsJkOdtIySn0FyG4Jlku0qEs3pET7R/V10nRi6A1KpwJjSzZ
         w6Vus1QgbPEGviUSyYAx6RDPcsb9sqvuxNFZ3fEMZMIQ4uOoc1sweZIfxxzxU07g+h4t
         7tV/gxZGeBVktRNVmnoVof2/Y+X3VClNrW4jkmre1juOfL6sLIK3jNDU9AVItZr4JF2j
         5jwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208973; x=1718813773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=umunyDYCcpIfLhzHvmQwuR6ONiqX1k9YBrp8qSeACL4=;
        b=eIvVYY93p6x3ZUW5N9euLZs4bfFxZVxmrhtw/uUqcWle9izgxEzqgQeFuW3w2DnFBc
         OR4El1Lh/pA25Wpg1SNmQsTfuhgwIRqdffq6k1JfuW61+SG1fzxikBYR+scbkf43KZDn
         tI5XT41NjXqccIT4XIHZSKflB/CbBELrrxBfda8jwQqqGpbmai3oVqFR2H8aPyt5jwrh
         eyOo4nBpqkHrDUoGfYnTAWA73ONs83REevqkwgPY+0cB+XYbTjaUknRrTfASBZHG5UfU
         NPWhmaoj0aFwse2bTQnHWOYwCtGXsTTejeEha6ZF4oTva6EkVOoTuvwBrll+bvZF7rPF
         i+XQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1+LWTV+423hHCCCysMAerKginCJzkD6U7qS4sXx43ZzMYsHp/6VuiQnJlhhJbT+obI65pno11+NA+5FREyXNFkK0gCvwY1HSkapiN7w==
X-Gm-Message-State: AOJu0YyxVKdgUayT2rngBb0r56GAQb7DTsh7RCFF49W27tyslGvtjYdk
	i/9PG4GatKUTGVGLvKPWNVpYeM5foe2IHIaJlA0qDYiFLMtYeD8ldtBkM10uGL4=
X-Google-Smtp-Source: AGHT+IH0GoHifL6jgy5PyEjM8Pi/KiyQ6aZDtaFe9VNNR65uXeOBOYMv+ObkalJZW+YbesSK3YYEAw==
X-Received: by 2002:a17:907:7248:b0:a6e:f997:7d91 with SMTP id a640c23a62f3a-a6f47cc0a2amr171236166b.38.1718208973333;
        Wed, 12 Jun 2024 09:16:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:16:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:33 +0200
Subject: [PATCH 20/23] ASoC: codecs: wcd939x: Constify static data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-asoc-wcd9xxx-wide-cleanups-v1-20-0d15885b2a06@linaro.org>
References: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
In-Reply-To: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1698;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=BqagLWlqycAbhTFnkhaAyAXMO9chHZNsBtioPnuGa2g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmouQc/YqbV6MVhWmi+gk/pR5ijNN2hgvhgM
 dfchoPH4x+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJqAAKCRDBN2bmhouD
 14J8D/4zatHrqm6oR4UtKKGG9K+NcNpYMFRJHkjHL60E/Kh9xLd8cK81n2EJmH/BliM4jnGx0NX
 pjaQ5YkAyW7xcBOgr9WqTajad/7lf+5XbhA+i/3Ql/DmhTkIWWF/83zjMrPJPL7qAzgNEAxqFur
 f1gvfWMzEByI651UXn0kcGXs2TKU70U0e1+NKlIx17EmGsTJNsPl6RdrBpbcoiPD1b7EsxyV6Pk
 1bceyltMIHOFEeHChT9Ps1OqOhEl6zNHIuWv4NVgOBnSrxF4Me95EwSXKsyXlYTWGZGhH+hHeeC
 rZyfj0SyX9xUUU9jVKyV2eQJMNoCEOaQjc0d5nYiplkIIfxia7VAE5wG7wwAhGEPW3RPg3jtBE7
 robLipydkTxV3DDWf0RqucD13vO3rJz+A4PmGt9dcSKTsEDzm7mqBzl7M81dNQ8iqbpDdvo6p9e
 pAW5neRHNUjddj9bF/ns2ZwjbQJ6BXRMxTtNCVT0ACyh9bDnyYdxSzlaYfdOTw4NwmZDgk0fylW
 oac9ZhZkz+dgAUq+4m0A6GHR4/ZyCrA6F4WKUlmspmbazH+vW+P5EgQZ48cS7CZkOvF0pq9c9Sq
 S4jvDRRJPLRZEWnLdJH/zQD8WlCuBdESd/LqUwpdSF0YIqGqrSq45w072hZZCJjPUSbILiGYmnc
 Xs4jHbcM/06U0uA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver does not modify few static data (MBHC reg fields, IRQ chip), so
make them const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd939x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 72d8a6a35052..1f94f49f9829 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -220,7 +220,7 @@ static const SNDRV_CTL_TLVD_DECLARE_DB_MINMAX(ear_pa_gain, 600, -1800);
 static const DECLARE_TLV_DB_SCALE(line_gain, 0, 7, 1);
 static const DECLARE_TLV_DB_SCALE(analog_gain, 0, 25, 1);
 
-static struct wcd_mbhc_field wcd_mbhc_fields[WCD_MBHC_REG_FUNC_MAX] = {
+static const struct wcd_mbhc_field wcd_mbhc_fields[WCD_MBHC_REG_FUNC_MAX] = {
 	WCD_MBHC_FIELD(WCD_MBHC_L_DET_EN, WCD939X_ANA_MBHC_MECH, 0x80),
 	WCD_MBHC_FIELD(WCD_MBHC_GND_DET_EN, WCD939X_ANA_MBHC_MECH, 0x40),
 	WCD_MBHC_FIELD(WCD_MBHC_MECH_DETECTION_TYPE, WCD939X_ANA_MBHC_MECH, 0x20),
@@ -291,7 +291,7 @@ static const struct regmap_irq wcd939x_irqs[WCD939X_NUM_IRQS] = {
 	REGMAP_IRQ_REG(WCD939X_IRQ_HPHR_SURGE_DET_INT, 2, 0x08),
 };
 
-static struct regmap_irq_chip wcd939x_regmap_irq_chip = {
+static const struct regmap_irq_chip wcd939x_regmap_irq_chip = {
 	.name = "wcd939x",
 	.irqs = wcd939x_irqs,
 	.num_irqs = ARRAY_SIZE(wcd939x_irqs),
@@ -2957,7 +2957,7 @@ static irqreturn_t wcd939x_wd_handle_irq(int irq, void *data)
  *     \- regmap_irq_thread()
  *         \- handle_nested_irq(i)
  */
-static struct irq_chip wcd_irq_chip = {
+static const struct irq_chip wcd_irq_chip = {
 	.name = "WCD939x",
 };
 

-- 
2.43.0


