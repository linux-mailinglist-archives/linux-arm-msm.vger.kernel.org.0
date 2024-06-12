Return-Path: <linux-arm-msm+bounces-22460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EC090584A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 18:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C05941F2180C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 16:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E887A181CE3;
	Wed, 12 Jun 2024 16:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rXieSGMI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08094181B87
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 16:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718208949; cv=none; b=HhqEiCQdER3jpCfQZBe3rBZC5Hp4ckYfJocGv0jep6Kek8n+C0hQWk7EAKU5xMrlfWma09bb1gtgGLQM8ZoDO4WsHQn8PcnRAj7C7bE3Q8dJqYw8/vSSl8Inr3oC5wIAG5rxCsa/u+AIpoCmkRpJ3YZ43w7xyd1k1oPKwsewgJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718208949; c=relaxed/simple;
	bh=kmHrZal9uMPsgRPbVS2wX2WDN6jgfyJMmeShmB1SJBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KznuTw9V7PjoV/zaTLGA07hBpOeLNnENYblhBD6lXtMNlrRhMMcQcTfCqAKxCq/s44B64Z37/qDyV+LzzMIZVYhoUFbyDPzx7wGIj7wq4KCXYCqUePdB4QHsMI2bc6L50uvG3Vu7mD3nxNFzluYR0uIblHu5Ybe4MHUt/Z/FqHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rXieSGMI; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a6ef793f4b8so8395966b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 09:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208946; x=1718813746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1vbzfTDLIXVMqmme/hD5kLRfNrGqESO/8cdwhRwG3gw=;
        b=rXieSGMI//3Vtk+BRur0fkH4K/vEdon6AZW716l37ZM+ftlMbQQdxYUGdkHUHjyxpI
         ZOKGD+i8C2F06H+6kUQw1HVroiziVFLrsT1jE+W2Ku8xR5XhB7do9pn0WbkqqNwDrOKm
         gGvaUPcWdrzh8ceLvPPIaJaeJypWeO9nhD2tCIXEvZJ90Bbm/fv+LeUmA3CxlEJ8neBh
         TFaVcS1TB2PKo/WSo6NHZjzTUBmK/zgd+J32ejogNk6Sy0Eg17Z1oKTD9yf8+x3mrfQ0
         axjc9n+oQmgOd9PSI20vb0C7jJ42GXLtbcOVVsc6ODFBE+WwnesiQCGZSJfFjis45QSG
         KsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208946; x=1718813746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vbzfTDLIXVMqmme/hD5kLRfNrGqESO/8cdwhRwG3gw=;
        b=OtkW0jxICEhNk5waBL5sud6rzW1I/qIog89fchtLtqcJN3LvAkXY0v1BuJPkblbDLn
         iJFHAp3AyuMgkud2DHejK+FPj9LbpNowm6oCbQgBEh743knzs4dzHzS1RSDf9ikpQPft
         epXRbB3nNs+CjDjG/eO/1UCOHw1ouMlgq0e4JFrgY+zUUGFWHnmdduNKIg5YWXAxIn5w
         pt0zTw21oWppzwCNC6HgZg7GZ1KiQOaushE8lmzItz/Po0wfehtiqRzx6I5HVJrLH6/r
         ei9p9+yE0negbq2w3V/WaVRw5C/LKUCV4eiJKoqYdyYBchHCADelS8aIEAxg1gJS8Ruw
         ZKQw==
X-Forwarded-Encrypted: i=1; AJvYcCWPQvXUR/5iUhbeXBTkkL0NKAAQN7RZP2QK6Ym85R1+/Hg5By/oAqsaWXDd/lUu8UjGh7j7qQYrUBeCaZCDOBDKiQ5aDIlZVgtuFVwIig==
X-Gm-Message-State: AOJu0Yws+BTV6hEAv10fUpbN3UXUhN4iOEnkwywPSrDKzY859lF9Glma
	zWkmsJ9W+WCwHioFcIz4gwG/o6VwMO16BF9XJ4PlFzbemqx0ILQIDFRYy6Ub7RJe2CvxV2n2Ge1
	P
X-Google-Smtp-Source: AGHT+IGHo7iEHrMc6jZ+1uvhQ5GWbZxNEiTM+xSPoQ25wNo69BzSn1Gz2bKI/JAgaTLz5pYO3KXTWg==
X-Received: by 2002:a17:906:d1d1:b0:a68:cc6f:cb5a with SMTP id a640c23a62f3a-a6f47ff7954mr124721866b.68.1718208946393;
        Wed, 12 Jun 2024 09:15:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:15:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:16 +0200
Subject: [PATCH 03/23] ASoC: codecs: wcd9335: Constify static data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-asoc-wcd9xxx-wide-cleanups-v1-3-0d15885b2a06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1876;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=kmHrZal9uMPsgRPbVS2wX2WDN6jgfyJMmeShmB1SJBo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmZZugs/rmJyBKWN4qJvPQc9RXY0qGtUACXg
 e9KokazjtaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJmQAKCRDBN2bmhouD
 15pqD/wMYa35jKtzWSHg52wUZoc1riTh2ujENos0BMiZu0FIaRg1JHLUX9u+s5tb1WCAuJGpaOh
 aiARbNbjZ9qYYcz3BKViBe+ns4Z3KTeM23gOwUQZjpP17RhK1xE+Aq6ZBDOh78f3g8Ep6043Cdn
 Lo1bcFH9zmhz/6N90k9YPHHZfAH9cck5rEcd/f85v7YPrcwJl2fr+pgtYjA/pUl6kmCyltlAsVu
 hZpF2g6ZqDlDwHtsijkaVGuAZaylrm/Ev1FnHmvFE0GfUnNhqZeWN+FsBrByL57TNbePY+fS5oz
 8o1zf5dAJz/w97D7G74N+gViSe5x5a3Lkn//301EZJw02AOpG61fGOup9XKrQGMi3ujkAIY3xR2
 wQhuVesGfuWhKiQyQsALwEps4XlMviu8Zq2aHnAqZIfqrUjrp8hcaSL7wNavN9w3XA+/MTE7K7C
 EdnoWbbYMQ7DIcOE4bLRsT0j26y65+yqABu8wJZFqhBgQkVYWabWd+PnLClFdOUnQkXYI+IfQSX
 aWoYKP0xNNp2MnxJ6HUJFRY+yt30OxePV7UnpK+Gr7rIXQeLwHiUkZKM54dXZAJAxmJCeSDtqyJ
 Jn7yR+/oI3gH6kY1IfuGjU/0wi7BHO8W2XL//goRWEMIyg3Q1SinEM2akpRIkDxo4tVvnfcWkJ6
 mo5QlXMSHSiDF8A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver does not modify few static data (arrays with sample rates,
interrupt description, regmap config), so make them const for code
safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd9335.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 60e7704e48d2..c5ac2d46e556 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -394,13 +394,13 @@ struct interp_sample_rate {
 	int rate_val;
 };
 
-static struct interp_sample_rate int_mix_rate_val[] = {
+static const struct interp_sample_rate int_mix_rate_val[] = {
 	{48000, 0x4},	/* 48K */
 	{96000, 0x5},	/* 96K */
 	{192000, 0x6},	/* 192K */
 };
 
-static struct interp_sample_rate int_prim_rate_val[] = {
+static const struct interp_sample_rate int_prim_rate_val[] = {
 	{8000, 0x0},	/* 8K */
 	{16000, 0x1},	/* 16K */
 	{24000, -EINVAL},/* 24K */
@@ -4023,7 +4023,7 @@ static irqreturn_t wcd9335_slimbus_irq(int irq, void *data)
 	return ret;
 }
 
-static struct wcd9335_irq wcd9335_irqs[] = {
+static const struct wcd9335_irq wcd9335_irqs[] = {
 	{
 		.irq = WCD9335_IRQ_SLIMBUS,
 		.handler = wcd9335_slimbus_irq,
@@ -4960,7 +4960,7 @@ static bool wcd9335_is_volatile_register(struct device *dev, unsigned int reg)
 	}
 }
 
-static struct regmap_config wcd9335_regmap_config = {
+static const struct regmap_config wcd9335_regmap_config = {
 	.reg_bits = 16,
 	.val_bits = 8,
 	.cache_type = REGCACHE_MAPLE,
@@ -4984,7 +4984,7 @@ static const struct regmap_range_cfg wcd9335_ifc_ranges[] = {
 	},
 };
 
-static struct regmap_config wcd9335_ifc_regmap_config = {
+static const struct regmap_config wcd9335_ifc_regmap_config = {
 	.reg_bits = 16,
 	.val_bits = 8,
 	.can_multi_write = true,

-- 
2.43.0


