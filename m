Return-Path: <linux-arm-msm+bounces-20062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5708C9CEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 14:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D55CE282597
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 12:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923785579A;
	Mon, 20 May 2024 12:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qo47LazL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B553654BEB
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 12:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716207172; cv=none; b=i1tltSCTNQM1e82DaYLPxfENxkPiqHo94gZn1hfqTqGCqPF46K2EUbcQylqya3f3dtdOyw+3MIrye8Dii3YY2tKgxBh8qMg0J9kjKVebrBOS5lTLQdOvES0IyO58YsSn/oyqnCdqcDlOx3SMvKU4eGRPyHJDz1vTNGOqP95Kd8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716207172; c=relaxed/simple;
	bh=rKkxO/lH6VpF+CCryG3++2dVVJ5mwyRiM1XPXMMRWI0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nSoeBk3NSmaTYXFhF44fpe2sKZfjy2vF6DXeeVFFL/KDEprc6ZDUpUxdkhDrATrYhbPzf9e0n2ejo4QY0dIvqMw3OldGeps5NSuOMzLyzvAPhPoMOwXEJfS0fq0i/mx5puo1Nb3SeMwOxVtxQLdapHIuO7Wa2TLoW3IqHzV0iq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qo47LazL; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5231efd80f2so4546708e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 05:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716207169; x=1716811969; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ysfCdKt8g8bGfjsoWFvFbNI8t+pMGg62WwygxK0izmw=;
        b=Qo47LazLnJBTWtidJhCNxcRkeqPJuQhOFaznbLXTNoBu4bRznkIM/87ldxkLgzejBk
         MR8+oA6UfBCuzI90zvsQxeBhY90RHoSVpvUrWMbTSK9sddOrDOFBkp38qvml4Njd7iNy
         JoViB2CkRAW8dqc7JIN5zdtb9luMWBRJw4KI9bcxWF7T5A3eOzdb5TSDZSEB19y9lHV2
         BtDVc8Bm7+OSUqktHRmTpFMabu5+KzQm7X3dXa1HDU7mVlDwTDNmYoIujOZLcGWX8Vvg
         j7lfNAOXYWoJSxZKnPpJHd/M8nWWWciC+dZL5lbqMhXvriFDdJt6INJObKh0HGC83noR
         s2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716207169; x=1716811969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ysfCdKt8g8bGfjsoWFvFbNI8t+pMGg62WwygxK0izmw=;
        b=Ovp9XcGwp1a6AbnNkWYOZEvHV8gz7D76Ex1kI2Ww/AuLd9/c+Z/e9EtqFV3I9rgcSi
         5+DDUsNk9pOvSbagLk9pGFFqEJQI7IuA9HYQlzwEKGAO1e5dA59ToTOLB4XwZzX0epZo
         qgx8jSOyHbASGT3yu9YDejsbxb3oLowVpMxrQ5ZuR7xtWHeKympy2+2vVzENbkPes8Um
         kj6MrMs1Dxeh93eWrr+m7aNLhIsG53mK5ten4zvmTrOXs9UHJESxJsNsfWl8KGHSuspq
         d859knq/tDmifRbTbSUZOQ4Y12L2kqxe7O1Bz1OX2V/p7gCZXC1+ks/GTGMprzBEYIKd
         IOVw==
X-Gm-Message-State: AOJu0YzmMaU9uBnBZHtv7birODDQmh8yXDBCTMKFZGzD4+PecqkWFZ6L
	sQkHQ0armgVJFCYSE1J3TSAuJB/59Dc2xIFomn8EB6MUtrySKmOG3tcONUV8eAA=
X-Google-Smtp-Source: AGHT+IHomdlhT0R7x+VWgORURBT++pY/a+92GrLNJK5gnD81Lb5FGu542a+qfIiNe6AtTazsYvEvFw==
X-Received: by 2002:ac2:4c19:0:b0:518:ae8f:b573 with SMTP id 2adb3069b0e04-52210275e37mr16875901e87.61.1716207168910;
        Mon, 20 May 2024 05:12:48 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad6c0sm4273682e87.30.2024.05.20.05.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 05:12:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 20 May 2024 15:12:45 +0300
Subject: [PATCH 3/7] drm/msm/dsi: drop unused GPIOs handling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240520-dpu-handle-te-signal-v1-3-f273b42a089c@linaro.org>
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
In-Reply-To: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
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
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2856;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=rKkxO/lH6VpF+CCryG3++2dVVJ5mwyRiM1XPXMMRWI0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmSz48whrcH+G+Y7A7SrCydEtSWnF9KCJNWrmEg
 kKKqYPwNQOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZks+PAAKCRCLPIo+Aiko
 1eQpB/94158/wJyOWfLDV0Z6d6SXbqHQElNXHbY5O9n2TVdDk3LZpRgff/s6AQy7qFOEzDRawi5
 TJIONXw4zoHGvBQL1mgGl2FYLp2dHnzmPUyIKnKP4Q9tJpOq68pMl/bwKC4rIhgPX0BN1Ttdozj
 qWzaKfy4SEtVOXY+dT+PO6oYWu/WRpK+OVvxfRUA4Mk95NM+bJfIp5McDKEk+E++yfDswn+lQ5m
 M/4nHKLRZZf/azIu0L8WfUMeFO1ieZGCdyGiV4tZTQ2E3VHrX4V+TDo4ucqZWhKQh4laJk/czYi
 h6fnsgwg/OEDhqveD8XUerJduuRxDXme4HxmqzuAwqMrroQ1
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Neither disp-enable-gpios nor disp-te-gpios are defined in the schema.
None of the board DT files use those GPIO pins. Drop them from the
driver.

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


