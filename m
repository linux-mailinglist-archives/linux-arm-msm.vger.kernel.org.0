Return-Path: <linux-arm-msm+bounces-25633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7559192BA3D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 15:00:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC45F1F21C22
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 13:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0C5D16078E;
	Tue,  9 Jul 2024 13:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ThQ6OVCB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C954815F402
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 13:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720530002; cv=none; b=Akl8RtYWegFmpmZgEzIGu4uIIsuI6SqJfbZF475Y6uSGQDyZ+ZHlusPjgI+IR1MGJ8KhK8EwDR16DInrsAIWvyYvssB///FFglfQODXzWUurVuy1COLqF+ZVt0vEuigrK1vb9BVhrrjSQVFwJSOlUdfBUAvbf1RGhs+fy5gGlKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720530002; c=relaxed/simple;
	bh=OijG91pxohtoBoygJEbdOuZXOxwcKuzTYhtA02WrXbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tXMZEtO3lIs5BQ2xz3QhDRspzr0o3eb+Ybc3Lju+zEYjH2JloQjp+71v89MmRNLki7rmNEGpuSQJg+wdNQaCcovxQb9xEYO9UU2l1aiPKEgsNG2r/0nuALR71HFvfMIAwcZh+qdkx++WvKMuuUj3VIyJzLzrBkyJHVOgS8WWNJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ThQ6OVCB; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a77cc73d35fso659238666b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jul 2024 06:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720529999; x=1721134799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQuLEB2qJiap/Sb1rNOVpqnW1WOGzgRU7mgbm+ne3kM=;
        b=ThQ6OVCBIWiUNN2u1Q4J0bSHCd1MAK67tzxAcqC2o6KCKTpjNiOyiyXRm76TFrZTV+
         Wwv+/Ds9Ns7Azt2ozT8KmiSjdNJlhAgiW0dkl1Mm/237pZW1Owe3snUsGezukFxlPj7O
         s3LAJYeYdiPaJTjHC/y4fSaHw+1UFpVx+R1+P8kkOpoSNXjUVr1E9G+H0kAEZrwrZcDF
         TtFUy8yF+IdTGxPxn71r+homkVuX7h75/TB+NIgTC2QHxJ+k5JHKhPFHd47MwLJ+OXr7
         /xGhMiF4hEZShWrM4HFV2/RMb4/09L838/WVgMD3bqD9pH693J+MKW33T0wurgEGutXB
         bNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720529999; x=1721134799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZQuLEB2qJiap/Sb1rNOVpqnW1WOGzgRU7mgbm+ne3kM=;
        b=ooqMxgJrER9nvVUaYoy+jQuWC8WjKhis/V/6oNsTq8PMKqmMNyRcZtXOIq81Lj7Uez
         cGQekjvEZiLnZz3Sjyy9NTHZJnjdNViCOcrK8Szi24WtUzIIQOKwPEqYDG7GNiWdLPwb
         GFniGlDhWZa8A6O+eE8VlK+vuWZdhXxgq6LtXC2ispyIt+7DDUraysnSMG2p9/pmsqnC
         bbDXl3AEgH4scsX5++SWuWz3ZWgnseeXJrLK8efubpnSu+oaM7V7oTHiYdSDHLsgzwBz
         /XTdJrNwTzZtSFRU4tYvXq8XzjGmcaAMHIMSAWayHh/fiPi/MZLqppMaZYkyLJy1nGlW
         o6Fg==
X-Forwarded-Encrypted: i=1; AJvYcCV33hTD8HquOPpVlTwOcwUsvLfBRf2HXDoF6k2IFAp+PfEWIPAVYUzye5bLMbTCKgTJqK46xKHuZqawGueYuCp3HtCZgQT/TJweODcciA==
X-Gm-Message-State: AOJu0YyNfwFpUavaao+AYlYHTYt/tYBRJqRPe6ACL8auHAcLyKh7RBHi
	q/VkWHHsy+O6GNJMogr0g60OEHA0qyI9lJeHleumlmJEm+Cs3MyKUV0KecIqKuc=
X-Google-Smtp-Source: AGHT+IG12HwN3oOxV5hf+vTQSpbBBffLJn47R5BWqdvk7Xi4diWDjFI7QV0oZXZEBE2qrC3e3l9eZg==
X-Received: by 2002:a17:907:72c5:b0:a77:e031:bb86 with SMTP id a640c23a62f3a-a780d205cbemr218452966b.7.1720529998995;
        Tue, 09 Jul 2024 05:59:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6e157bsm76643166b.80.2024.07.09.05.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 05:59:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 09 Jul 2024 14:59:33 +0200
Subject: [PATCH 03/12] thermal/drivers/broadcom: simplify with
 dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-thermal-probe-v1-3-241644e2b6e0@linaro.org>
References: <20240709-thermal-probe-v1-0-241644e2b6e0@linaro.org>
In-Reply-To: <20240709-thermal-probe-v1-0-241644e2b6e0@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1540;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=OijG91pxohtoBoygJEbdOuZXOxwcKuzTYhtA02WrXbo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmjTQ+KcwZ4sIM/T90SNpy8ww/f8bdoOXoppWYY
 mXI1iMiuJyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZo00PgAKCRDBN2bmhouD
 11OsEACJOyTM86nzWmM/BzFwLdVuJV/2DH6g3mQPuq2GGBnXAHIMRtvUbz2BP+ih2B6JC8Z6/ur
 MAqux6dSBfcoOc+MU7XWRZ8uYvum/gL3re3U8jXbimRlx+2qzMFt1QZO88NV8rnN9iFaGdUoGxA
 MtO/FNAhuo5iQ5bgcJXLIYeQBgIXar4vzUAU5OypZWh1/naZF/rC491zwxSB07ys/oc8TWYQcB1
 xyk+Mi2rQbIUEdv70pZWZEFrAfY8iRHbe3V2Q7/XO/ngND0r1sjspA8ptXvbLPU2ZRH0XG+8E5U
 mrpTjT0VbZKQRIEGfrocUnzk0r9ZrFIQ8dPu2BArl8Xu2lBTBy1zPN/i6Rmptn6QtHxFx4BF/8t
 Q1o6AIE2BeICgCJgNma++YwfzknPOw7zuAIVopKN97TYGzsmfvZHWOofylss/QYBxPGEb0o7VPZ
 so/S7+rrIjTjTfssg/m9s4ezQ0yM8TMcKi6Oj7dxoXqoiwj41Ikh8FtHyWxKVc1vZZX2H/sTTOi
 5Hfl+SAR4qF1wMxUm/NEAhOvcAau0T+nAEtOmJaLkQyZZdcMJU/w7CD4KXry2rFhqXFWgPo9e6e
 leIa/cg0ozwCwDxSTE3/5jvoXJnlI7A4IAFWeuaXAD3HxJFqxHzTJO04YY6LaRB77Gs69KI98sW
 aVSnrWo/wvreT8w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Error handling in probe() can be a bit simpler with dev_err_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/broadcom/bcm2835_thermal.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/thermal/broadcom/bcm2835_thermal.c b/drivers/thermal/broadcom/bcm2835_thermal.c
index 38fb0c8cd55e..5ad87eb3f578 100644
--- a/drivers/thermal/broadcom/bcm2835_thermal.c
+++ b/drivers/thermal/broadcom/bcm2835_thermal.c
@@ -186,12 +186,8 @@ static int bcm2835_thermal_probe(struct platform_device *pdev)
 	}
 
 	data->clk = devm_clk_get_enabled(dev, NULL);
-	if (IS_ERR(data->clk)) {
-		err = PTR_ERR(data->clk);
-		if (err != -EPROBE_DEFER)
-			dev_err(dev, "Could not get clk: %d\n", err);
-		return err;
-	}
+	if (IS_ERR(data->clk))
+		return dev_err_probe(dev, PTR_ERR(data->clk), "Could not get clk\n");
 
 	rate = clk_get_rate(data->clk);
 	if ((rate < 1920000) || (rate > 5000000))
@@ -201,11 +197,8 @@ static int bcm2835_thermal_probe(struct platform_device *pdev)
 
 	/* register of thermal sensor and get info from DT */
 	tz = devm_thermal_of_zone_register(dev, 0, data, &bcm2835_thermal_ops);
-	if (IS_ERR(tz)) {
-		err = PTR_ERR(tz);
-		dev_err(dev, "Failed to register the thermal device: %d\n", err);
-		return err;
-	}
+	if (IS_ERR(tz))
+		return dev_err_probe(dev, PTR_ERR(tz), "Failed to register the thermal device\n");
 
 	/*
 	 * right now the FW does set up the HW-block, so we are not

-- 
2.43.0


