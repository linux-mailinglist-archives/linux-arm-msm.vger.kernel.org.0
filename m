Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECCD41377E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 18:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231875AbhIUQYb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 12:24:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231738AbhIUQYa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 12:24:30 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28ED6C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 09:23:02 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id i4so84236450lfv.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Sep 2021 09:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eZxXiK/igoFZEqHLXFTBpMKSnJsFZcbyROjm+cR8HWM=;
        b=YmYjwO0jEb52u3Hn99lxS9rdHaIDmjXLWGx0oAW1T8SPbmWAlvkpd6GhP0JY7R/XLh
         yLVAXMKqeiRFTsoiMhKsbiUROl5bgalCYjrd/SU0+nn5bxKWS2xBoL8vk2wlEQ+WM53S
         zzLNJGHuXux45DBtlgioxB/37/g1Q1D1xrtlmUDzyDwha/vCSUB7oCTYPqM8g9iSFipL
         88gjDDN8ogIH5+mSR5DJ2YWWtwMHH40a72qypvB1cyXNPpnwJJHTgHEZn5kyXMFUExu9
         Mv7F7Ahl+7I6imf9d1RlZjkL7war+NxzPJJDep6ZSRgyUHioTg+pyr0ZwKgAjePwlPEi
         JhzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eZxXiK/igoFZEqHLXFTBpMKSnJsFZcbyROjm+cR8HWM=;
        b=vZAiC/Qh0dWgkkTe68nXH43hg48Az9GvD+LGGcdx667UNkqn/VSXFFqUBrJdAOErc1
         zOi0ApLRfwokbVmyg8zP5MlRQq+U3hsIt6VXstyQptjfqqgXyQ/uwRhd3+LwjRyqUdEt
         Fuqq+pisLnXb/UoknRmYglmkvL/SgV10t25mjpdYg4nyyWO6BSwt6xOrewXP9dmrbbzV
         tN94/KLkpbixe+J2ua3lD6DHpPEja8r5NoxLAMzLdBpGDVR1hiE5HZQzlUrdIgcsr5/v
         wSaUO21PdV0Vg5Df3fiCVgNgu6X5dEVPf3rqWL/u5B/Li3E2QsyPcKff48ySA6vK+7Pr
         m0bg==
X-Gm-Message-State: AOAM532MiOlhb9GLASXlwMmVdBNqUfJJ0OSbqzm9IC/Iglajei+DRwW2
        1H2wp6VKWGDXE3NHlYpjQHX1sA==
X-Google-Smtp-Source: ABdhPJzTRtDkvxjwVw3Lwwct57gIcSM3sLoNOcbn4HI4ZvhAQagf467vxob+9Vsac/I1/i9H3+pPkg==
X-Received: by 2002:a2e:f01:: with SMTP id 1mr23190390ljp.204.1632241379786;
        Tue, 21 Sep 2021 09:22:59 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w5sm1558553lfu.48.2021.09.21.09.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 09:22:59 -0700 (PDT)
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
Subject: [PATCH] drm/msm/dsi: do not install irq handler before power up the host
Date:   Tue, 21 Sep 2021 19:22:58 +0300
Message-Id: <20210921162258.1858223-1-dmitry.baryshkov@linaro.org>
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

Move the request/free_irq calls into msm_dsi_host_power_on/_off calls,
so that we can be sure that the interrupt is delivered when the host is
in the known state.

Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e269df285136..cd842347a6b1 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1951,15 +1951,6 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
 		return ret;
 	}
 
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
@@ -2413,6 +2404,16 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
 	if (msm_host->disp_en_gpio)
 		gpiod_set_value(msm_host->disp_en_gpio, 1);
 
+	ret = devm_request_irq(&msm_host->pdev->dev, msm_host->irq,
+			dsi_host_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+			"dsi_isr", msm_host);
+	if (ret < 0) {
+		DRM_DEV_ERROR(&msm_host->pdev->dev, "failed to request IRQ%u: %d\n",
+				msm_host->irq, ret);
+		return ret;
+	}
+
+
 	msm_host->power_on = true;
 	mutex_unlock(&msm_host->dev_mutex);
 
@@ -2439,6 +2440,8 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
 		goto unlock_ret;
 	}
 
+	devm_free_irq(&msm_host->pdev->dev, msm_host->irq, msm_host);
+
 	dsi_ctrl_config(msm_host, false, NULL, NULL);
 
 	if (msm_host->disp_en_gpio)
-- 
2.30.2

