Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D164413B5A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 22:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231166AbhIUUai (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 16:30:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbhIUUah (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 16:30:37 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10A17C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 13:29:08 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id p29so2321221lfa.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 13:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FPis9r9zcC9+O/1eDmdpR2bxSLvXsQSGe1tYlEENTuE=;
        b=tldoUdOLvyNmHxoO4aPS7q0KgVZOAIE5kIOo1LJ8tj1Tt52ECnoI3RZVO5A5bJCHBf
         pcTr/ozLTo7d5SdN46yDskVgTa5cyPuBGxEnd3i1Qr+v+9Lwaiar7qIxDXMtqHU4m+vo
         J1jbIdstJJBv5dFqIqi90MFU1JQIs1Szcx6kRd1ypk9L6bxP4vHuTBP5GTGEl4xZuJZ0
         YzE3RvIONfL81wQOVuypcF9cYvXpIceZOUI4M4JwGQR/u003U1BwIrZ7MgiUUfH1rMGA
         TYZvMgjFIrsfGKwshcRpEFBgdj4IiWJZEWORq9N1lqjUKQsdp3OfVj5kWGg7Fk0Ahtby
         Bwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FPis9r9zcC9+O/1eDmdpR2bxSLvXsQSGe1tYlEENTuE=;
        b=xHenlakEHCsx5Q8iXHxeZQjXGTgXTv8tGZYVTSntFqXSHSC61n7xgwauE4ru8q+JbG
         CzSj0y7tXjSOQg2CVxUGMRYKxjrYeEfuSzoIPuLRmMFKpXwAzvscdnSWCZOG8XRxfYk0
         BXRmn1OhgtnhWLFUNVb08oegq2x79SgZAsFkEow2vx6XtehSUaSKWfdDt+YxNrPod8Zx
         HqcasRmBPlyCIwQ2zls5wmsjTWIhnG1KhhAEAGhx9fnW4ykwk222+AXcyW9zJrn5Swjt
         Rj7KtvVZokyfuBPZ09zSZXD8EdN2Q1qF8G6uQjxCoSht8tKbJ8PSvaw6XOxxAyWaZ5hB
         WDxA==
X-Gm-Message-State: AOAM533XNbupBzEVgnCWg/QLkwLmllrGXREg04elmdhSwAo3TaepwmwS
        jwufohdxlc8YATkSKyS1HjGnXA==
X-Google-Smtp-Source: ABdhPJwXXFw48l+GgeLT7V7MOmsZ64W9Q4Ja+OmP3fe3HQBAnTBrAn7lqplhGQSFQhWINeBwCHjw/A==
X-Received: by 2002:a2e:1508:: with SMTP id s8mr30108486ljd.47.1632256146409;
        Tue, 21 Sep 2021 13:29:06 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u2sm2244899lji.82.2021.09.21.13.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 13:29:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        David Heidelberg <david@ixit.cz>
Subject: [PATCH v2] drm/msm/dsi: do not enable irq handler before powering up the host
Date:   Tue, 21 Sep 2021 23:29:05 +0300
Message-Id: <20210921202905.1890215-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DSI host might be left in some state by the bootloader. If this
state generates an IRQ, it might hang the system by holding the
interrupt line before the driver sets up the DSI host to the known
state.

Move the request_irq into msm_dsi_host_init and pass IRQF_NO_AUTOEN to
it. Call enable/disable_irq from msm_dsi_host_power_on/_off() functions,
so that we can be sure that the interrupt is delivered when the host is
in the known state.

Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 38 +++++++++++++++++-------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e269df285136..b47708305f5c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1898,6 +1898,23 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 		return ret;
 	}
 
+	msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
+	if (msm_host->irq < 0) {
+		ret = msm_host->irq;
+		dev_err(&pdev->dev, "failed to get irq: %d\n", ret);
+		return ret;
+	}
+
+	/* do not autoenable, will be enabled later, in msm_dsi_host_power_on */
+	ret = devm_request_irq(&pdev->dev, msm_host->irq, dsi_host_irq,
+			IRQF_TRIGGER_HIGH | IRQF_ONESHOT | IRQF_NO_AUTOEN,
+			"dsi_isr", msm_host);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to request IRQ%u: %d\n",
+				msm_host->irq, ret);
+		return ret;
+	}
+
 	init_completion(&msm_host->dma_comp);
 	init_completion(&msm_host->video_comp);
 	mutex_init(&msm_host->dev_mutex);
@@ -1941,25 +1958,8 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
-	struct platform_device *pdev = msm_host->pdev;
 	int ret;
 
-	msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
-	if (msm_host->irq < 0) {
-		ret = msm_host->irq;
-		DRM_DEV_ERROR(dev->dev, "failed to get irq: %d\n", ret);
-		return ret;
-	}
-
-	ret = devm_request_irq(&pdev->dev, msm_host->irq,
-			dsi_host_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
-			"dsi_isr", msm_host);
-	if (ret < 0) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to request IRQ%u: %d\n",
-				msm_host->irq, ret);
-		return ret;
-	}
-
 	msm_host->dev = dev;
 	ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
 	if (ret) {
@@ -2413,6 +2413,8 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
 	if (msm_host->disp_en_gpio)
 		gpiod_set_value(msm_host->disp_en_gpio, 1);
 
+	enable_irq(msm_host->irq);
+
 	msm_host->power_on = true;
 	mutex_unlock(&msm_host->dev_mutex);
 
@@ -2439,6 +2441,8 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
 		goto unlock_ret;
 	}
 
+	disable_irq(msm_host->irq);
+
 	dsi_ctrl_config(msm_host, false, NULL, NULL);
 
 	if (msm_host->disp_en_gpio)
-- 
2.30.2

