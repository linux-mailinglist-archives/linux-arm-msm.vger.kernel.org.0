Return-Path: <linux-arm-msm+bounces-28473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A249518EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 12:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15C3E1C2176F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 10:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 404901AE874;
	Wed, 14 Aug 2024 10:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vis3zw7o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E521AE05C
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 10:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723631763; cv=none; b=kh0+IZx7zNn7YVbeqOIfnJvndqBNXHYXqDupHgzEMwt7lNWI8CRr8X1UALViLsnrLH0ywSk3LyfS3+JHopoOpnlNdks7cfgtkBgkppPnYqf0UQwY20Tuq5of4+9cggzGQhckmh8RxOFWpxZiTqW7UdMvOBhz9L54DyVtYYq4rQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723631763; c=relaxed/simple;
	bh=EFpd5/+dfOnJ8CRGGEqG1pEkOch4M8T0ltcfE8+XutU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MXWwB617VyaJNxfyxwKUHx7CnD7FsEqMMi3JYoI1hyjJ+Wlbmo5ayfaNiSBLZLTHjApnwcE+/27d+4vO5hDKwkyFyt4bKeBnnEiDPAuo5B0dYKEXCHtMYpf31+rWWe+D2NWcjgh6HFWy1TNbasRiEPISGdQtKRK1G6PEfZ437oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vis3zw7o; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52f025ab3a7so3477335e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 03:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723631757; x=1724236557; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yHFYh1Cx+x4Cu70WZybitfJUp7k6hKw0CFTnTWoMGIs=;
        b=vis3zw7orR7E6NlKBj4uNXy29H4kI6N9swAFWb//6hihjzTPvsJrCFojSoV1g61Npf
         JICO3Njp/+TPG6e+/Ug4JPfa/9WMZinfhB4OAIKjQcxYiTT+HlViGfzFJ2jZPniDrvtp
         hTd3++vy3oGusgKLlemZGvSLlbx7PnOZL6WpBgwOsFq9ovrto4pnAHkqIbZeMj8FXuBL
         vAp2VrGUP7VXFW7xYgCX/QS3QADbXOzQ2qzdUYllwR2kJY/AzI1NPZXUNL/+HjDgaYal
         1QSqCNfJrCFeagBl2AIhw5sbAOun5Dd0u++mAy2n/6qCbFgobJd8gWMPWhJ6CvYBKDFx
         S93Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723631757; x=1724236557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHFYh1Cx+x4Cu70WZybitfJUp7k6hKw0CFTnTWoMGIs=;
        b=nw9lpw9BDhW7ywYaDQRSN/rZCDU8msbPim3hKv6dXn8FChANN5Ei5M4cAJz2+tFGwW
         W5A4MQHUz1Uu74zLpvUlsXky7Wd7BBKykGpiYUVELJrgVuXhLZaScZEaa6jqyIQvzpL1
         o2l1KP2KsrYTkppQ4mVOwwO78wxOcEEn02AhS7hTVQywoL8ycHmxTr//WlgcgOrNDjhY
         iTnPMIRe11meSLLF3G6JCEJ2ubE1RJklK6Rm0nuPWQnNZhzu4yai0ficW1+udSApDbBI
         loadLHIn+ILZobQ+fbq5sgP20FEH1SVdZvuTEgYZs92tqRQQ9fexOwwIW1bT+CbKzpu1
         4DTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTSWfNyBeNXk1pzVp1/fm1gyc8tgiXpnhCcwDn++2KWwdt6/QioJTVE1Jx9aS3SNXkXtm5UMl1Kvah2hkvlkhd0WeYsKY26qhL9e/68g==
X-Gm-Message-State: AOJu0YwFYOVNfbkXP8T86uTkhBkLMJUlB0L86Zi7S7vPyF3erhAwBBcC
	OPPH7dDMKn6T7iKgNUngalJhpElaZCptCRJsURqXP06eKP/ReK1HKTDu5Ltft/ajGlqGeogOn8f
	e
X-Google-Smtp-Source: AGHT+IG969TFpPgU1+5jbbATSkjp3FOj4nyLgR0kdKAtRZ/slzlU8orv4hZlF4g3iItwYFiyM8i9Zw==
X-Received: by 2002:a05:6512:10d5:b0:52c:d56f:b2cc with SMTP id 2adb3069b0e04-532edbcc0f5mr1485533e87.58.1723631757096;
        Wed, 14 Aug 2024 03:35:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded3dd4dsm15501835e9.29.2024.08.14.03.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 03:35:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 14 Aug 2024 12:35:37 +0200
Subject: [PATCH 01/11] usb: dwc3: st: use scoped device node handling to
 simplify error paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-b4-cleanup-h-of-node-put-usb-v1-1-95481b9682bc@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3220;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=EFpd5/+dfOnJ8CRGGEqG1pEkOch4M8T0ltcfE8+XutU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvIh/KTrLZD7u68/muOtkJgyWPEAQfePrGpnM9
 QQAGl427iCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZryIfwAKCRDBN2bmhouD
 1zo4D/oCOGQPygqo0iW6HAtrAzZlIUOaNfwcp9iCj/Ano/8e5IrnUGFyuT7eMCpLXYpDrma27st
 DnqxrqJQ8RjjlTsb9TqjTs9CNh80OFAVvSi4sJmRZVfJbjXPp6zcO2X/ws1VvUhNYAQfh86Egy4
 Rp+3kJrzjTKMSZxPgGGPQNhT7CFoEFtViM16h6JqCOgCzg/nN1FedbckC9IZ2Wz7wRbP/XV8QQ6
 jyB5IyrboscOby2kvjZVXDcjZnFYqeCiNIp2xKxzh3++K4wU+py49dy+rI0wxtieuO1dFxHEU1K
 CO1q0FgG2e1q32wsr8tVFDX7NamjBQCFRKprLzATS2vJvtljz3VBq2pMr8lMwoC1JZ7w3BPTPgs
 XUjoiT0heBfbAFkM++5xexqBtarVug08K6eUMQwylhKiOe9ohfxkYKIZTWpvMbb+S07gItrAoWv
 UkQDT3LqXC88GJsXovIX4dzhF6moMmJTezJ9kXjFqAqJvDRKH0DN97YHAJzBgvzoW5qxijKeygY
 jSNFmJ6pXUrMcvs/db3Xijh3MP2wOpqE7I3VvVMTaZ5pJVIOvzE4XjODMfUqMDDrLQzSBuWz9lJ
 wFx7OSOPbUbZ92fyD0g12BeZlZ3RC61RBI88KT3P+kt/FtcWtui9H7XbQjMvviKXgHKTGUcgUB6
 Bk0KetBjwiweuGw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.  Scoped/cleanup.h coding style
expects variable declaration with initialization, so the
of_get_compatible_child() call has to be moved earlier, before any goto
jumps happen.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This depends on my earlier fix:
https://lore.kernel.org/all/20240814093957.37940-2-krzysztof.kozlowski@linaro.org/
---
 drivers/usb/dwc3/dwc3-st.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-st.c b/drivers/usb/dwc3/dwc3-st.c
index c8c7cd0c1796..98f43d7082d7 100644
--- a/drivers/usb/dwc3/dwc3-st.c
+++ b/drivers/usb/dwc3/dwc3-st.c
@@ -14,6 +14,7 @@
  * Inspired by dwc3-omap.c and dwc3-exynos.c.
  */
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -197,7 +198,7 @@ static int st_dwc3_probe(struct platform_device *pdev)
 	struct st_dwc3 *dwc3_data;
 	struct resource *res;
 	struct device *dev = &pdev->dev;
-	struct device_node *node = dev->of_node, *child;
+	struct device_node *node = dev->of_node;
 	struct platform_device *child_pdev;
 	struct regmap *regmap;
 	int ret;
@@ -227,6 +228,13 @@ static int st_dwc3_probe(struct platform_device *pdev)
 	dev_vdbg(&pdev->dev, "glue-logic addr 0x%pK, syscfg-reg offset 0x%x\n",
 		 dwc3_data->glue_base, dwc3_data->syscfg_reg_off);
 
+	struct device_node *child __free(device_node) = of_get_compatible_child(node,
+										"snps,dwc3");
+	if (!child) {
+		dev_err(&pdev->dev, "failed to find dwc3 core node\n");
+		return -ENODEV;
+	}
+
 	dwc3_data->rstc_pwrdn =
 		devm_reset_control_get_exclusive(dev, "powerdown");
 	if (IS_ERR(dwc3_data->rstc_pwrdn)) {
@@ -248,18 +256,11 @@ static int st_dwc3_probe(struct platform_device *pdev)
 	/* Manage SoftReset */
 	reset_control_deassert(dwc3_data->rstc_rst);
 
-	child = of_get_compatible_child(node, "snps,dwc3");
-	if (!child) {
-		dev_err(&pdev->dev, "failed to find dwc3 core node\n");
-		ret = -ENODEV;
-		goto err_node_put;
-	}
-
 	/* Allocate and initialize the core */
 	ret = of_platform_populate(node, NULL, NULL, dev);
 	if (ret) {
 		dev_err(dev, "failed to add dwc3 core\n");
-		goto err_node_put;
+		goto undo_softreset;
 	}
 
 	child_pdev = of_find_device_by_node(child);
@@ -270,7 +271,6 @@ static int st_dwc3_probe(struct platform_device *pdev)
 	}
 
 	dwc3_data->dr_mode = usb_get_dr_mode(&child_pdev->dev);
-	of_node_put(child);
 	platform_device_put(child_pdev);
 
 	/*
@@ -282,8 +282,7 @@ static int st_dwc3_probe(struct platform_device *pdev)
 	ret = st_dwc3_drd_init(dwc3_data);
 	if (ret) {
 		dev_err(dev, "drd initialisation failed\n");
-		of_platform_depopulate(dev);
-		goto undo_softreset;
+		goto depopulate;
 	}
 
 	/* ST glue logic init */
@@ -294,8 +293,6 @@ static int st_dwc3_probe(struct platform_device *pdev)
 
 depopulate:
 	of_platform_depopulate(dev);
-err_node_put:
-	of_node_put(child);
 undo_softreset:
 	reset_control_assert(dwc3_data->rstc_rst);
 undo_powerdown:

-- 
2.43.0


