Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38EF7542FED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 14:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238696AbiFHMHu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 08:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238714AbiFHMHp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 08:07:45 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A3341D1060
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 05:07:36 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id a29so4389271lfk.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 05:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nWbp37l6qMVWqU1MI1wAwLjMWJ/9NoPZ7BFFc/dS17o=;
        b=W352pZ9uwwqTyUYzKspeDxpFa9JgGekJNoMxQ7pmUZ7l/p80RV+Ryr94k0lmvB1qwu
         rxUQA/N2fIMnMcYDMMcp1hYwVsar3595xrtL0S3bkxfsIMZMkwFaiGDqkFdEHr65t7A7
         HDjMfBcU3UiYD2ctQ90WqQCEnzXYWceRV/Ccz3yxxgtlO3IRGem3syoItABwbsuLZeoZ
         JHpwOVGSSjz1WuvME7liMYnDHUEdia6JYqj8SvOvIvErvWHaF8u8HltJqPF8u8kQu20f
         o8tEDaTWHDvkqLFLmDEVqxmyOhiYqNunMVAG2kqXezfZkX2SV/7gUJl5p3yHoXFq0WnQ
         7Slw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nWbp37l6qMVWqU1MI1wAwLjMWJ/9NoPZ7BFFc/dS17o=;
        b=CAm/hVoYT7ReQBWC/yWH/JKZjLxVLaJXz2XD2nWmEoasVKV8jgJjX4qW8wagnvVwDq
         f7CXvvcAtYQ4rbThYokQrv9DMRlB8TvSYhlZ7nI7yYQgw0XIfvqJEvm+0Veru7aoCgB0
         Vk/5LWf3Ast69hQ3QaVbNCzjbxaPJ3Ea2ibjtdUr6rSEglkHXXfEYgd0d2nWQW75P7LE
         BaFc/PNB/2XAsgHv37n4JQw8ONuDExEny2JOArHJH18nae+ejfeEJPXX226Ef6fHFh6I
         65j6JA+kFzGkaXaRg7MJwFWYP2aNuSQIenD3XzZu3VItPxFnPlGodgwdV9eG6yJa2vNc
         wubA==
X-Gm-Message-State: AOAM533ZKMV8TGwB28GlhqZce2vADIsHrZZqefbZz9oe+dCKg5cD7NM4
        7V32VEEo3pnmwX1bUhLS3E7t2g==
X-Google-Smtp-Source: ABdhPJywThmG5UQP/hMKt/YeXsy3uQeZ4OTnQen1exape5w/rd16un0mDKKLSFaIaUKX36jU6pW4FQ==
X-Received: by 2002:a05:6512:3f11:b0:478:9795:4a45 with SMTP id y17-20020a0565123f1100b0047897954a45mr49913632lfa.491.1654690055910;
        Wed, 08 Jun 2022 05:07:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 4-20020ac25f04000000b0047b0f2d7650sm52049lfq.271.2022.06.08.05.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 05:07:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 10/12] drm/msm/hdmi: merge platform config for 8974/8084/8994/8996
Date:   Wed,  8 Jun 2022 15:07:21 +0300
Message-Id: <20220608120723.2987843-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since there is no more difference between the HDMI platform data
between MSM8974/APQ8084/MSM8994/MSM8996, merge these configs into a
single entry.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 27 +++------------------------
 1 file changed, 3 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index bc6ec6aa2cb9..a718e0ebf6cd 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -375,27 +375,6 @@ static struct hdmi_platform_config hdmi_tx_8974_config = {
 		.hpd_freq      = hpd_clk_freq_8x74,
 };
 
-static struct hdmi_platform_config hdmi_tx_8084_config = {
-		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(pwr_clk, 8x74),
-		HDMI_CFG(hpd_clk, 8x74),
-		.hpd_freq      = hpd_clk_freq_8x74,
-};
-
-static struct hdmi_platform_config hdmi_tx_8994_config = {
-		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(pwr_clk, 8x74),
-		HDMI_CFG(hpd_clk, 8x74),
-		.hpd_freq      = hpd_clk_freq_8x74,
-};
-
-static struct hdmi_platform_config hdmi_tx_8996_config = {
-		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(pwr_clk, 8x74),
-		HDMI_CFG(hpd_clk, 8x74),
-		.hpd_freq      = hpd_clk_freq_8x74,
-};
-
 /*
  * HDMI audio codec callbacks
  */
@@ -577,9 +556,9 @@ static int msm_hdmi_dev_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id msm_hdmi_dt_match[] = {
-	{ .compatible = "qcom,hdmi-tx-8996", .data = &hdmi_tx_8996_config },
-	{ .compatible = "qcom,hdmi-tx-8994", .data = &hdmi_tx_8994_config },
-	{ .compatible = "qcom,hdmi-tx-8084", .data = &hdmi_tx_8084_config },
+	{ .compatible = "qcom,hdmi-tx-8996", .data = &hdmi_tx_8974_config },
+	{ .compatible = "qcom,hdmi-tx-8994", .data = &hdmi_tx_8974_config },
+	{ .compatible = "qcom,hdmi-tx-8084", .data = &hdmi_tx_8974_config },
 	{ .compatible = "qcom,hdmi-tx-8974", .data = &hdmi_tx_8974_config },
 	{ .compatible = "qcom,hdmi-tx-8960", .data = &hdmi_tx_8960_config },
 	{ .compatible = "qcom,hdmi-tx-8660", .data = &hdmi_tx_8660_config },
-- 
2.35.1

