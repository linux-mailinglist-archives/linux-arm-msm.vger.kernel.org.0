Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2712E74438D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 22:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232686AbjF3Uzj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 16:55:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230364AbjF3Uzh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 16:55:37 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92F423C29
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 13:55:35 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b6a675743dso36651641fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 13:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688158534; x=1690750534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spDliwbSiPrfNZvz8h02XqOoID4DkHsdeHUu2zyR/ik=;
        b=j3IuBNMk9Yjp0yTmrD0kYFSZi5mzZss08Oib2yD7B+QuwRzb4wNOsv+d//0CN2QGav
         hEzzh4RdHExPsWJZc1/hFduMg8URVOOwiAIL00CvawtTD62wSOEhjZXIWZsloanFHdYn
         hTHBArrwvHszVtixHo15exV3KbpNlbyLjrfjp+kju9TIhu7XZb3QLmB0k9fQd3gZ0MvR
         fFZIOJLvL11R9TDxruSN9OiEF4MNEz2KbmmbatMH7lFRQ0/3y7iSjyA7b9doW54h6bm/
         QPnlDpajMcQOzyHcsXwDbuNfxnhGTDh2qDYzoSxbTMxf14/z3CCc/YO/Ja0sk4ttFeCt
         SYIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688158534; x=1690750534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spDliwbSiPrfNZvz8h02XqOoID4DkHsdeHUu2zyR/ik=;
        b=g7QL/WIXjGz+cR6K87pc0IzD30DcZv3Wlgn22qAuYdYvPhmJuvVmvHUQ9eLc1wK2EJ
         fS0fAtidkcvxizVv1XywE3nctBZm1zcvdUFExBPZK5a7REUqTNtV4y9Oyrinf1u65OLk
         Ljh6xjKuFnJDoNZv22zAN3mevzvX+PXlfylfIDoZbtUAy0rpmN5zlzKcLBBQsKHplWe7
         H3tJQ3TtqmdwWYPEeqPODg8A9r1lKsjvh7kVnnBiPfdIp/FV4+vh7JifoyxJYR0y4RwA
         P+Xhc7C5X+WkG7Ix87KS/H1TvaHSWnGtTzUH+XuXE2INkkNP6dI/MznCOOs3XzxnryB7
         xoLw==
X-Gm-Message-State: ABy/qLY6FlCR9CTsx/XxDzkOzK5QEXU7AL4SBorFZTqKfZFGJgu9s/Ku
        5zTGXCpsPqH1SIkBaGx87BVe6J94lZxRGskFJoQ=
X-Google-Smtp-Source: APBJJlGIKTn13PzHl07hwXKe0Li+OD/9Lq05+8g5RfE691wopZdfhaXVx46Iqbhc28QEPLdCZW2x2g==
X-Received: by 2002:a05:6512:3696:b0:4f3:982a:8be1 with SMTP id d22-20020a056512369600b004f3982a8be1mr3175282lfs.69.1688158533938;
        Fri, 30 Jun 2023 13:55:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z11-20020ac25deb000000b004fb75943aa0sm2252168lfq.196.2023.06.30.13.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 13:55:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 13/15] drm/msm/hdmi: drop hpd-gpios support
Date:   Fri, 30 Jun 2023 23:55:21 +0300
Message-Id: <20230630205523.76823-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
References: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Supporting simultaneous check of native HPD and the external GPIO proved
to be less stable than just native HPD. Drop the hpd-gpios support,
leaving just the native HPD support. In case the native HPD doesn't work
the user is urged to switch to specifying the HPD property to the
hdmi-connector device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c     | 14 ++------
 drivers/gpu/drm/msm/hdmi/hdmi.h     |  2 --
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c | 53 +++--------------------------
 3 files changed, 7 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 195e1ac90c5a..598c8284f125 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -478,17 +478,9 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(hdmi->extp_clk),
 				     "failed to get extp clock\n");
 
-	hdmi->hpd_gpiod = devm_gpiod_get_optional(&pdev->dev, "hpd", GPIOD_IN);
-	/* This will catch e.g. -EPROBE_DEFER */
-	if (IS_ERR(hdmi->hpd_gpiod))
-		return dev_err_probe(dev, PTR_ERR(hdmi->hpd_gpiod),
-				     "failed to get hpd gpio\n");
-
-	if (!hdmi->hpd_gpiod)
-		DBG("failed to get HPD gpio");
-
-	if (hdmi->hpd_gpiod)
-		gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
+	if (of_find_property(dev->of_node, "hpd-gpios", NULL) ||
+	    of_find_property(dev->of_node, "hpd-gpio", NULL))
+		dev_warn(dev, "hpd-gpios is not supported anymore, please migrate to the hdmi-connector\n");
 
 	ret = msm_hdmi_get_phy(hdmi);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index acfd99d2876a..252d617939d4 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -52,8 +52,6 @@ struct hdmi {
 	struct clk_bulk_data *pwr_clks;
 	struct clk *extp_clk;
 
-	struct gpio_desc *hpd_gpiod;
-
 	struct hdmi_phy *phy;
 	struct device *phy_dev;
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 4167ba5a3b03..f3d6cc184999 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -69,9 +69,6 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	int ret;
 	unsigned long flags;
 
-	if (hdmi->hpd_gpiod)
-		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);
-
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
 		return ret;
@@ -145,8 +142,11 @@ void msm_hdmi_hpd_irq(struct drm_bridge *bridge)
 	}
 }
 
-static enum drm_connector_status detect_reg(struct hdmi *hdmi)
+enum drm_connector_status msm_hdmi_bridge_detect(
+		struct drm_bridge *bridge)
 {
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	uint32_t hpd_int_status = 0;
 	int ret;
 
@@ -162,48 +162,3 @@ static enum drm_connector_status detect_reg(struct hdmi *hdmi)
 	return (hpd_int_status & HDMI_HPD_INT_STATUS_CABLE_DETECTED) ?
 			connector_status_connected : connector_status_disconnected;
 }
-
-#define HPD_GPIO_INDEX	2
-static enum drm_connector_status detect_gpio(struct hdmi *hdmi)
-{
-	return gpiod_get_value(hdmi->hpd_gpiod) ?
-			connector_status_connected :
-			connector_status_disconnected;
-}
-
-enum drm_connector_status msm_hdmi_bridge_detect(
-		struct drm_bridge *bridge)
-{
-	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
-	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	enum drm_connector_status stat_gpio, stat_reg;
-	int retry = 20;
-
-	/*
-	 * some platforms may not have hpd gpio. Rely only on the status
-	 * provided by REG_HDMI_HPD_INT_STATUS in this case.
-	 */
-	if (!hdmi->hpd_gpiod)
-		return detect_reg(hdmi);
-
-	do {
-		stat_gpio = detect_gpio(hdmi);
-		stat_reg  = detect_reg(hdmi);
-
-		if (stat_gpio == stat_reg)
-			break;
-
-		mdelay(10);
-	} while (--retry);
-
-	/* the status we get from reading gpio seems to be more reliable,
-	 * so trust that one the most if we didn't manage to get hdmi and
-	 * gpio status to agree:
-	 */
-	if (stat_gpio != stat_reg) {
-		DBG("HDMI_HPD_INT_STATUS tells us: %d", stat_reg);
-		DBG("hpd gpio tells us: %d", stat_gpio);
-	}
-
-	return stat_gpio;
-}
-- 
2.39.2

