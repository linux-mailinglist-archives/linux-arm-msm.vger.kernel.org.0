Return-Path: <linux-arm-msm+bounces-78505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5BBC00129
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 11:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8C2CD4F5A98
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 09:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6AD22F5A03;
	Thu, 23 Oct 2025 09:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oNw875Nr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA8C2F49ED
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 09:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761210183; cv=none; b=Um0860uRTHlpBmT+lOQe79XG2rXVuVFHYgLPvWCu3Enx3ZsS3lTsxQ4gnb42z4KKXMRxrG4nPn7uHW9frqi9YqdDt3pOpvebJpLUVm0rKl1SMTmj01wi6HafI7bN+9xTDF1bPa7PG5PdoMKUJzSzZafVXBkme4GQIQ5f7LKWdB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761210183; c=relaxed/simple;
	bh=jXxdH9C9VRkWHmRxwJrP71pcIAmNs6ZOMX71pm29Z44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sx4fTrJXyzLEvoctA9SAdYWAs8zcEsceFE4YgEpKFnZ20lnV584JpbSvdLspgKbo9g8gGcSuxa12onxgd30SUXRAL82It6m1Sa2QWmgm/fWsakfYPY/TTDFL03toYTfmX7mPHMKCdR5eh4nk1F7K2Nv1a62/ejtJkDC+SU8lHdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oNw875Nr; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4285645fdfbso93772f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 02:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761210179; x=1761814979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ajwFUpC7vS5vEhz6078UzbCI957Tmu1QENJG9qhlY0=;
        b=oNw875NrTmF+mqKnbDrMWz3M6AjwUmEAa500NqdCqaunoYEbw1WtqzM9Vg02QfJW3q
         qyzIBDbfKOEzuLZcVmaUTOFq6Ms1CDfSqfxJx6ph8hyb9tHewqBSljIJtuST+S4iYX7f
         9QUCgq0gIL5HSzzIc0Jn5+FVZZfPKez1+nL607rnF/ORBiv4u7Vu2JPLBrwVMuwvAXHK
         8Kz1IjMTE+o1k2RwpdFlssOHq1Lje0rKCU7D7begJPRL79R2G8sc/RW3WYiiDkmJEjht
         8JJskEbKVBjuERnxseRpMYJ1mWSXyESBRJi6Ya2ML9+1yvJ6NRm+w8im2o3JF3n+675Y
         3U/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761210179; x=1761814979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ajwFUpC7vS5vEhz6078UzbCI957Tmu1QENJG9qhlY0=;
        b=JpcXkg7dSo33UKWzpTqhhw0adLpUvagUyAcMZHNr2qdqsRgDYukAC3kctbHi7SMlo0
         oNQfw5VzDIduFlObTOOSZ9ZwooIHDcYkqUPEFgd94SMTbRNonJHNRCQSg/cUBKz9P2dY
         Qhl4+7moFiNxkzlLecu3tvWkNx+Wb9AGUMoF0+DToKRf8NF8gGNxZZAyqiiPhV6tuALQ
         HBhE7yEh2iDPSFcifxHTUJoAjq1ypknFrPoxTW6Pwi51ptcV1SsJOjcnZq1aGWUk/36i
         +3NwvziFa3hlT9UIqQo6Cz2C34csgv5/2doTtGDO3YLfOZVAcq2VKe7H34X7D722+zp9
         kTkg==
X-Forwarded-Encrypted: i=1; AJvYcCX9xxbMjbDXtCKDJWUUnYRjfn8W0muOEgi1Lzi3InauvJl7aYDzv8siRT+1KzbEB31ZkF796RLB5dUsHVsl@vger.kernel.org
X-Gm-Message-State: AOJu0YyZPD+UqJsvS11Cg50STz7iUhVuHZiMQX4VTYXRP1go5vzpWcr2
	ARLISDxikldMlvKINJT8kuRwyl11SXO9/jR1DMNHi+jQTyGeH9lszmJEd2FKHO73wpg=
X-Gm-Gg: ASbGncvkrhtOKM3+L5RcgTPxp5C6N7+2+1gTqKo7YXtZ2gFp6LIRTjq45ICnL77D5DI
	wQYybfuw+NcMUNdlgal3GSo+pUh3U3VwmWkvNKJYYtpTQG1S6ymlnolr4nZT/x7JB5U+LXNCzHd
	1kPvqVA3KZyfu0AyYRkTcEGoiPvUz24XrQNFZ9vYllJc4/xMq6IkiOrDhzUUQi4s1g3C9x2chXx
	wFAHYm6vjkutDzL4ZSBM4XiRAsDzlavyEJ+9b1WO6GqL1/jE6YQI9XgUJPhgo/piH1lDFwBjq4n
	aGnQQsFfF3JQiOaVkVI+vsyFf19CqSa+mkgKiHoFKr0+is4iPzhZ6LL+UAUf6BIZQCikl7bZ2Gi
	H/M2WM/7+W2wgOBTt2fdYWAPatXdgBhPmiRxQm+GBFtVc/ilubobZ4z0nC/mcR0KF+nm0zxEplS
	XeKp4Q5Ttvgo1gS12FvtrJlDnKl2I=
X-Google-Smtp-Source: AGHT+IFIDJeI7KdMoHZzpPuK/TfFYTJzUBOwoSONQ4K1+PSV8rXTrleDHFGEfjcVdzkdeAHs/hDY7w==
X-Received: by 2002:a05:600c:138c:b0:46f:ab96:58e9 with SMTP id 5b1f17b1804b1-475d04bbd06mr766395e9.0.1761210179390;
        Thu, 23 Oct 2025 02:02:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-474949e0a3csm57557415e9.0.2025.10.23.02.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 02:02:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 23 Oct 2025 11:02:50 +0200
Subject: [PATCH RFC 1/2] ASoC: codecs: pm4125: Fix potential conflict when
 probing two devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-asoc-regmap-irq-chip-v1-1-17ad32680913@linaro.org>
References: <20251023-asoc-regmap-irq-chip-v1-0-17ad32680913@linaro.org>
In-Reply-To: <20251023-asoc-regmap-irq-chip-v1-0-17ad32680913@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2978;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=jXxdH9C9VRkWHmRxwJrP71pcIAmNs6ZOMX71pm29Z44=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBo+e8+tMXWrX40+I3SxPj9c5jdiNmGgPS6Wu2OJ
 ojjRX1HrRqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaPnvPgAKCRDBN2bmhouD
 14gSD/9d54lBZMgKOcrwvwcPhtrFnzb25RJBzD70oFTlEftG+qpo5Dcr6hMHQ68dQimu9mlv7wi
 UcxlcQkt85UrKwX4CSS4n7QXK0s3blKwxFWecGDqkrWVRO/lole8wizQYYWvUzKKZueo/qB7HBH
 8UTiHMH4lN6Xfk3whgscRQS2hRwS8PnuzBNainoRwuvvxRxbSrjjG8TRw7YBQnAsLQxf7FdaDLP
 vSEe+q78IYZd+hnisL5mpaUeXcIJT+e6PcMs2u5lTjkLqHxF23fhUZyYMNWi4tKNQMV9tfhWhnp
 NhS8ipeA71FzIZ26PeP9tT+K3HtPjuIYgQiduipQYnXJ5svH0Q7s7Oj9Xc8iE3/HuYUyV6YQkSW
 jBxC4b8ENFatXretxqy7Y0OqUxIYVF2taG7qHBaKdP1LpfqCh9TGcqS8yqOX+jLFwyEzps09T2a
 I4/vsvws40jZuRBMycUNJLuXMlg4NWttnhM/bX17Ep9hNcPH1jK7Qrd6ItdstarkknGd2Befai4
 RruvEEmttA0cgJogE9PxdwUoIWdYJsiHhlYEh1oDHrjnWEspRW/dqw3Q0Ka8tJHUfqn7eOlbbtg
 VfgHy/XT6Pyr8Z6nvhr1Ar4JDirygaIMex/X0LznAijWk4KW+idr8B1+eWLeL/MKh7SWNIL4aY/
 cN0cP8KhVKqZo4g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Qualcomm PM4125 codec is always a single device on the board, however
nothing stops board designers to have two of them, thus same device
driver could probe twice.

Device driver is not ready for that case, because it allocates
statically 'struct regmap_irq_chip' as non-const and stores during
component bind in 'irq_drv_data' member a pointer to per-probe state
container ('struct pm4125_priv').

Second component bind would overwrite the 'irq_drv_data' from previous
device probe, so interrupts would be executed in wrong context.

The fix makes use of currently unused 'struct pm4125_priv' member
'pm4125_regmap_irq_chip', but renames it to a shorter name.

Fixes: 8ad529484937 ("ASoC: codecs: add new pm4125 audio codec driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not tested on hardware
---
 sound/soc/codecs/pm4125.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/pm4125.c b/sound/soc/codecs/pm4125.c
index e8d00d85106e..410b2fa5246e 100644
--- a/sound/soc/codecs/pm4125.c
+++ b/sound/soc/codecs/pm4125.c
@@ -70,7 +70,7 @@ struct pm4125_priv {
 	struct wcd_mbhc_config mbhc_cfg;
 	struct wcd_mbhc_intr intr_ids;
 	struct irq_domain *virq;
-	const struct regmap_irq_chip *pm4125_regmap_irq_chip;
+	const struct regmap_irq_chip *chip_desc;
 	struct regmap_irq_chip_data *irq_chip;
 	struct snd_soc_jack *jack;
 	unsigned long status_mask;
@@ -179,7 +179,7 @@ static const u32 pm4125_config_regs[] = {
 	PM4125_DIG_SWR_INTR_LEVEL_0,
 };
 
-static struct regmap_irq_chip pm4125_regmap_irq_chip = {
+static const struct regmap_irq_chip pm4125_regmap_irq_chip = {
 	.name = "pm4125",
 	.irqs = pm4125_irqs,
 	.num_irqs = ARRAY_SIZE(pm4125_irqs),
@@ -1320,10 +1320,8 @@ static int pm4125_irq_init(struct pm4125_priv *pm4125, struct device *dev)
 		return -EINVAL;
 	}
 
-	pm4125_regmap_irq_chip.irq_drv_data = pm4125;
-
 	return devm_regmap_add_irq_chip(dev, pm4125->regmap, irq_create_mapping(pm4125->virq, 0),
-					IRQF_ONESHOT, 0, &pm4125_regmap_irq_chip,
+					IRQF_ONESHOT, 0, pm4125->chip_desc,
 					&pm4125->irq_chip);
 }
 
@@ -1695,6 +1693,7 @@ static int pm4125_probe(struct platform_device *pdev)
 {
 	struct component_match *match = NULL;
 	struct device *dev = &pdev->dev;
+	struct regmap_irq_chip *chip_desc;
 	struct pm4125_priv *pm4125;
 	struct wcd_mbhc_config *cfg;
 	int ret;
@@ -1705,6 +1704,14 @@ static int pm4125_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, pm4125);
 
+	chip_desc = devm_kmemdup(dev, &pm4125_regmap_irq_chip,
+				 sizeof(pm4125_regmap_irq_chip),
+				 GFP_KERNEL);
+	if (!chip_desc)
+		return -ENOMEM;
+	chip_desc->irq_drv_data = pm4125;
+	pm4125->chip_desc = chip_desc;
+
 	ret = devm_regulator_bulk_get_enable(dev, ARRAY_SIZE(pm4125_power_supplies),
 					     pm4125_power_supplies);
 	if (ret)

-- 
2.48.1


