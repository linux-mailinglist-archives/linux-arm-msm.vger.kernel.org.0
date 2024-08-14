Return-Path: <linux-arm-msm+bounces-28477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB539518F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 12:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51EFC1C212A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 10:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31451B0137;
	Wed, 14 Aug 2024 10:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w8mPtlUR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFFF1B011E
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 10:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723631768; cv=none; b=jIQBtUe63S5bXkxwvw+/cO+L+9PYkgElKzV5HflDgwHUqe08Ack5mqhF2et2jS8kYT7kIlI2C0bYJ1w3QTe836yHfmPaKQovovXOM5soMBAzxgg/TwznC18keB62dT5Fc+CvwQCGju9fR0jWvl52+Db753iAoHrTZeqMT0s72gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723631768; c=relaxed/simple;
	bh=VJma9HGhkE1TDrQ1OhGJk9qHK29VLxq1nCdewcEacTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T/1i2ZW/YqPrhCKF9n2V7b1zL8dceL6ojHvF0fB9CXzTI7EL50WloUvOVL4k/4R4TbJR1g9XJNKNi+ZMiGr5YCOrjc3oS9FuLPtlh/4flORuz2I0gTOBSAQvO83Uypy9r/zqvGKgMXPFr1HEUwk5CqkDZUv1TfKW2JRJBAwK3mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w8mPtlUR; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4266f3e0df8so44996315e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 03:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723631765; x=1724236565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F1XB3SobLk7VZ//KTQh7GEC/+D2L+CRxij+/IGHYnPA=;
        b=w8mPtlURxtRtJO+WWaeRVchA9VeITd0+NtY2+2bk2oFF/dpmyAXt+DL9U6u0XDi4BM
         RITGc1A3lUe55Qj/RW2JvXvfcm8MBQwH607P6it1ektqZc9BkaALt1lxXuZdq7M1AM2n
         W6o/tq/VobR3+N2QvKy7MQUTxk626EVKGmitDC0DYTF0+NP7Ox1g5zcNTBgnxQn2ZJqU
         aclWBXOzoQINRrXODewQnk2rxBwmXS93q/Bw0d/ABiU/AU0Fe7xA8V5Ud2jcGgOEG7co
         gNQq0gLxu+37AN2iVRo0fKpby8TeqGw9D2Jb5LLnA+CrmTUcdx9V3eeZQi62u4C7oaEO
         Ahgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723631765; x=1724236565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F1XB3SobLk7VZ//KTQh7GEC/+D2L+CRxij+/IGHYnPA=;
        b=hi9jZQoQEOleijaX8RVtiwl/U8SoE0UdNNHqsi/XfqwV5+hotn8OqWgjn2izIdx840
         iGFkGmMj5r9fWYOWU5azKX6Cx1GQwLZ1zzhmXVBNCr4fPc3T5yv3iYi+kboxnjJywXds
         NTPfnefTY+QbvYlJObKpwyLDbQqYQTHjfbUyWkIe/hOs/GCzEL+xVTRimtMOc/BEhhVF
         QKHIMQYeYiZeq2B+/FxqjQY58D7EPbVWD0TOKjU36t61rLnwrDe9FUZ/BuBlFKPx3zmn
         5jM5NJ8XPGkQ6eyDboUXpiRXjPna5YS6nSvAPwyeDwCIWGXL/UDh+jEjjc9ZnngGuUh3
         lnjA==
X-Forwarded-Encrypted: i=1; AJvYcCXr8+iMc3wULjjZHjGN3iJdd9sfOmpQPwQg9jNYbqVue1TPPNGbP4nqqFlDsnGlsxNzeZ7/w0+4a/y+6I+ym5SRPasahvIJKhwjXZiTPg==
X-Gm-Message-State: AOJu0YxzC80bshda9VXnJXmnXGaRlAyx/0lZjrVbWtysmvlUKj06aRV3
	Oj3aRdM8Cbn30m5MT6aUc2/8s6pXzrd6zKrigCNCi1PT+VdaOsMnmK8owzDQoJotBYvU6XsJCgv
	G
X-Google-Smtp-Source: AGHT+IHu+Ec7SMXK44CW15aI6wvbF/SSdZgsQigQTDfjf8g51hhj14oMtIh5VGN/FNCI7LDZHb/OkA==
X-Received: by 2002:a05:600c:310b:b0:426:8ee5:5d24 with SMTP id 5b1f17b1804b1-429dd23ce9dmr18887445e9.20.1723631765087;
        Wed, 14 Aug 2024 03:36:05 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded3dd4dsm15501835e9.29.2024.08.14.03.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 03:36:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 14 Aug 2024 12:35:41 +0200
Subject: [PATCH 05/11] usb: dwc3: imx8mp: simplify with dev_err_probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-b4-cleanup-h-of-node-put-usb-v1-5-95481b9682bc@linaro.org>
References: <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
In-Reply-To: <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Michal Simek <michal.simek@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1324;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=VJma9HGhkE1TDrQ1OhGJk9qHK29VLxq1nCdewcEacTo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvIiDZ4bAv7tVf6yyVs5Q8BDE0c30I/4lsc928
 qm+fK7AL+6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZryIgwAKCRDBN2bmhouD
 10D4D/oDgQvQBKScmFFH4ftXAiif3buhyX1tYwq/1dglDmk1dpS2Uom5hsUFuODAKTVkrgvS8I9
 9ZBDxcK8lwLHgJsGEvv7wnENJ1ayzimyIU0FehRqrXwrvNKSkqVQUeJCECcCtIjs6mIbjSA49+n
 r+CKLXBd83EI5dLRl6jKhXrdyOSaZFAETUaHs2oZEf5vSG5js1KedY3wHxpRz/vbtkJaM5o1VK2
 rP7MGvnPiaGhY6B7mEHEprCBBbNEPTqejUKyZUIwzg12xUfWw2x9RdMHURMyQrMJlrBiZIzlKGw
 bOW2gDzy2qWW9Q5/u/RBds4vyXhp47ojbXo11hHockv6+sHDUKg3wsMqQeDWC5uw8Vwo8VgPFZi
 N5BuVPl7VNp6CC0jCtVFpQqsumutnnByaPeMLryUa6ooemCfTAZ9OT/qIftpGHI3MCjKWsWgWP8
 bKPy00IeGa7lFrjxYTtmDXmU27lo+tenGJyMdkO0NKuokFBi+4MgN9qo0cgmq8kQHNgGJAiTTXr
 A8qNtA04wUCvA7LBJYNyKQ1shog4fKrmVFGCZC8BdJNppG+sv0cNfDqAyq/idx6WHUL10VgRpRV
 +ax2dAU4fStY6PNV3LDjgL9lJjsoZC7ezHq+HxOJ+OHph0VyuqOSvKxXRxf3+Z+iyPpQRNCrm5W
 NR5sGcdIZ1Dozow==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use dev_err_probe() to make the error paths a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/dwc3/dwc3-imx8mp.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-imx8mp.c b/drivers/usb/dwc3/dwc3-imx8mp.c
index 8c91e595d3b9..869b5e7c15ed 100644
--- a/drivers/usb/dwc3/dwc3-imx8mp.c
+++ b/drivers/usb/dwc3/dwc3-imx8mp.c
@@ -179,18 +179,14 @@ static int dwc3_imx8mp_probe(struct platform_device *pdev)
 	}
 
 	dwc3_imx->hsio_clk = devm_clk_get_enabled(dev, "hsio");
-	if (IS_ERR(dwc3_imx->hsio_clk)) {
-		err = PTR_ERR(dwc3_imx->hsio_clk);
-		dev_err(dev, "Failed to get hsio clk, err=%d\n", err);
-		return err;
-	}
+	if (IS_ERR(dwc3_imx->hsio_clk))
+		return dev_err_probe(dev, PTR_ERR(dwc3_imx->hsio_clk),
+				     "Failed to get hsio clk\n");
 
 	dwc3_imx->suspend_clk = devm_clk_get_enabled(dev, "suspend");
-	if (IS_ERR(dwc3_imx->suspend_clk)) {
-		err = PTR_ERR(dwc3_imx->suspend_clk);
-		dev_err(dev, "Failed to get suspend clk, err=%d\n", err);
-		return err;
-	}
+	if (IS_ERR(dwc3_imx->suspend_clk))
+		return dev_err_probe(dev, PTR_ERR(dwc3_imx->suspend_clk),
+				     "Failed to get suspend clk\n");
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)

-- 
2.43.0


