Return-Path: <linux-arm-msm+bounces-22613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C148907948
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 19:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9B97281A28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 17:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D3E814A093;
	Thu, 13 Jun 2024 17:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aWA0Zdot"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC17E145B26
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 17:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718298312; cv=none; b=e+mWH7Ad0BNgUoMul3AWIY/5tuxoR0fXvf7wJVo0gf8NaFZ8/M71XVUFHXYV/LzwnFW+DFVmF0qHW3yHA3x0U5Bz/iVEcZ8NuD1DEC8+2oVPO2kIjnWCzOzkjDKvkfJrz5qnkNE0i5C03VYPlJmhU9fhdeF8TS3I+d/fXHl34Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718298312; c=relaxed/simple;
	bh=8wuA6F0zaRzQk3cvli/KQmN8/4cLG5ABY/Oy6ljx7TU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ig7NnktbRduanQ+nCpnJDyqpJXIG8F+R3GxOiE/5KA+sUQyaJ3LZddBTeVB+GWGFVusL2sa1rSD2dAs0rYZvpI91o1PuAgbIYqNgmttvViTkFpqH5LmO5dv4c03SXNw++WYQ15VSmluD1kfr4/67aTXN47WadJLgWi6gac3vnl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aWA0Zdot; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52bc335e49aso1544465e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 10:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718298309; x=1718903109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bDBT/sNckBgTFLiIqNy+vm4wL9NYZa3PNlS10+vGIeE=;
        b=aWA0ZdotefTqx3k25qEM8WkTxa490QaPhmTScIzdkXEZbTOz/a9Vm6PO7uIQdKxLvP
         YXZLX/qM7JtUx728YI/xgXXQRfwCnRBMNNvOYCa6ml/6AOD+m1u9uQWISLOqfb+JVmbl
         y2sozNwc3yL+uC3+gZiKQ9CBpWmz5OfszI/QBC1fzyvkMz4Vwta1fTLBOeG2nuhsiU+4
         LyDsdWcMAR671NZDUY2KDiOXZZgxklgNOxCx+Qs2iV5i8JG4HpW3ZUGnJL6zvi7hJNLE
         L1kRD7VtW9qJzoKQI6ZIkYmdZOAGVP0cXAQuxdx8CBocK8PoXHszyg5jOCYJ+WmeqmsW
         3NWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718298309; x=1718903109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDBT/sNckBgTFLiIqNy+vm4wL9NYZa3PNlS10+vGIeE=;
        b=ITegXDtiltZFM6rbZQ+ZVCbvmtJ3ckFscnRxcq6TDjiGxuPVzlXnDEwD2K3Ra3qFE/
         TbOw0ivkcFLZYjKYjeYcS3Xp4lbb8KAQpQnn/d9lxnyEbBkj+ZK0PQ08Lzwb2wga7ALN
         xm6nmauzPYgJwBKvZ3Q+B16L+H2L8a60ITSwviUQD7rThoYI8b7Sk9VkSDQYBUnpr1y/
         EOM3b9nIuHxSRDg+GL1ufF7sDkM0XjqkdQ3eCu5WzCaFaNxRpvSUGPJ7xEP9mo9ZiK5J
         1qEBn2UTMhk2F3FdifWTL1X4DxJTSHbCzMUD8+9afWys/9q4/hJiFcT9LGu5lN3gw+WR
         pKaQ==
X-Gm-Message-State: AOJu0YyLZg/zI7OkRHG6c53SC4fA5OdTurYJ1NJCAhY9pNW3XQRKNltI
	ArhjtUfbO+bzKoZcPUB3LyFaJ8YmUyJg5PlG5ix+G58KWf+xVVv/lWr4m+5v1F0=
X-Google-Smtp-Source: AGHT+IF3u0zTEf6YJSx8I+IBZB75h0u5mc9lem1qDWQwJKAX1JsvumkmJrvM+w+VktBP4riqCeErFw==
X-Received: by 2002:ac2:598d:0:b0:52c:8ea2:9a82 with SMTP id 2adb3069b0e04-52ca6e6b2b3mr235417e87.35.1718298309048;
        Thu, 13 Jun 2024 10:05:09 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2825733sm287312e87.60.2024.06.13.10.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 10:05:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 20:05:06 +0300
Subject: [PATCH v2 3/8] drm/msm/dsi: drop unused GPIOs handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-dpu-handle-te-signal-v2-3-67a0116b5366@linaro.org>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
In-Reply-To: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2912;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=8wuA6F0zaRzQk3cvli/KQmN8/4cLG5ABY/Oy6ljx7TU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmaybBJV9O81Oecm/R1DlGgCx31s7ucMntxxY4E
 o3T/OvfWhyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmsmwQAKCRCLPIo+Aiko
 1VKNB/926H76xiXl0BdvywppPDqR+MHSVLaffZghsfW+XfUFDR/1N8nC3NUgmAprkSD+vVcPeGo
 zWdznmpnbKtTLKr6MDtZ+gU+gQ9GcJd1D/u2CLeNm6/LsnkxKSkVSmqlHpE735LWUZbZBwHDOJh
 7Chr0/nGenMcMJRa8SKA58JOg3GwDMoVljcUHTL0sXbEvMZctyH/UydHdCmjQejNcXAjQvBOHT6
 HqX7xyAftWdkeAHmZMCE6b0KCP5qhMbP2B4zXLfE87pA5wKRNailS94Nt99KHnDtR/PmQBHZ0JU
 rOs6JOjfYjeTtIMagjmznygNV5eA3UOe6D2JRfWdURWd761O
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Neither disp-enable-gpios nor disp-te-gpios are defined in the schema.
None of the board DT files use those GPIO pins. Drop them from the
driver.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 37 -------------------------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index a50f4dda5941..c4d72562c95a 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -7,7 +7,6 @@
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/err.h>
-#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
@@ -130,9 +129,6 @@ struct msm_dsi_host {
 
 	unsigned long src_clk_rate;
 
-	struct gpio_desc *disp_en_gpio;
-	struct gpio_desc *te_gpio;
-
 	const struct msm_dsi_cfg_handler *cfg_hnd;
 
 	struct completion dma_comp;
@@ -1613,28 +1609,6 @@ static irqreturn_t dsi_host_irq(int irq, void *ptr)
 	return IRQ_HANDLED;
 }
 
-static int dsi_host_init_panel_gpios(struct msm_dsi_host *msm_host,
-			struct device *panel_device)
-{
-	msm_host->disp_en_gpio = devm_gpiod_get_optional(panel_device,
-							 "disp-enable",
-							 GPIOD_OUT_LOW);
-	if (IS_ERR(msm_host->disp_en_gpio)) {
-		DBG("cannot get disp-enable-gpios %ld",
-				PTR_ERR(msm_host->disp_en_gpio));
-		return PTR_ERR(msm_host->disp_en_gpio);
-	}
-
-	msm_host->te_gpio = devm_gpiod_get_optional(panel_device, "disp-te",
-								GPIOD_IN);
-	if (IS_ERR(msm_host->te_gpio)) {
-		DBG("cannot get disp-te-gpios %ld", PTR_ERR(msm_host->te_gpio));
-		return PTR_ERR(msm_host->te_gpio);
-	}
-
-	return 0;
-}
-
 static int dsi_host_attach(struct mipi_dsi_host *host,
 					struct mipi_dsi_device *dsi)
 {
@@ -1651,11 +1625,6 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 	if (dsi->dsc)
 		msm_host->dsc = dsi->dsc;
 
-	/* Some gpios defined in panel DT need to be controlled by host */
-	ret = dsi_host_init_panel_gpios(msm_host, &dsi->dev);
-	if (ret)
-		return ret;
-
 	ret = dsi_dev_attach(msm_host->pdev);
 	if (ret)
 		return ret;
@@ -2422,9 +2391,6 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
 	dsi_sw_reset(msm_host);
 	dsi_ctrl_enable(msm_host, phy_shared_timings, phy);
 
-	if (msm_host->disp_en_gpio)
-		gpiod_set_value(msm_host->disp_en_gpio, 1);
-
 	msm_host->power_on = true;
 	mutex_unlock(&msm_host->dev_mutex);
 
@@ -2454,9 +2420,6 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
 
 	dsi_ctrl_disable(msm_host);
 
-	if (msm_host->disp_en_gpio)
-		gpiod_set_value(msm_host->disp_en_gpio, 0);
-
 	pinctrl_pm_select_sleep_state(&msm_host->pdev->dev);
 
 	cfg_hnd->ops->link_clk_disable(msm_host);

-- 
2.39.2


