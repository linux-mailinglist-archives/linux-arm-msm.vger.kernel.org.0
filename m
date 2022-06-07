Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 977D7541910
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jun 2022 23:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377457AbiFGVSj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 17:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381070AbiFGVRS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 17:17:18 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 894B414CA21
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 11:58:17 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id j10so29707309lfe.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 11:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yBKwPOiE2yNJ0h72czELiOyk+g2uWrk6+KM2TvTz5JU=;
        b=Yks/q3su0YHCpP1GZiev8M6GFNTj/3QTyI/Ndrs53Y55o0csQ1hVU4LwAIIwQ1IUA8
         +c8piT29CypwfC4legDBxZZwLyPxAueBvOI0cTL5z0ciBVniJGYgb5TnNRKbyMGfkFef
         XGmf76jAhEZHLHskC+nHi6zFOlIsr0+cUZ+SpDHRQYp5FIJSJ3wmAjATYAnfnzc9bqDX
         vWgAtgUYsKGJiCZg31C+DxRgkODuIMf5EC3TfuPT0UrLuxdnGO3oPuZb6oReRe0Yaw50
         mvCNAEHspgbqg1KrOwxjqEXNCUI4/HaVIl0z0fPopLAIINbFd/2k15Q0nTo2443jmeyb
         IMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yBKwPOiE2yNJ0h72czELiOyk+g2uWrk6+KM2TvTz5JU=;
        b=UXP/Agy5zrxTws48NwJjRXScwTItVt7vcjlT9ccQCxwmJn2rsAvh4EjHH88AJUZ7f7
         U8eGmkW4L8+uQpQeVYkkZ1xrSidDGS5koVaM02lYNyUGwOhDmSCQqUN9+20kPX7x66N2
         e5v+yrU4ntbnrVMH/XuP918bXlF8uyw09VggDgyaupNrsBmfCi8qoRIpWY3p47cL+Wh5
         JxUQ97CMKJ2Iei8l4iZSrXldvu2joDIaV0cKvmcyq4YkdyZgoirLHZy6ryntAsliA7vJ
         1X8F31dQT4uQRURsxuk9nO0GvRbg6y4mtL8oo6SHUwil2Qe4+dZ1yxQz5efz5nW/xFDR
         Eo1w==
X-Gm-Message-State: AOAM5334p0Wf+h8J8iuq4aL2tfZUA5FPCxgbD3LgY/4i0EcVumIvWJ0G
        qIr2T1qs9fGrBKUERZp/WrTD7Q==
X-Google-Smtp-Source: ABdhPJy9e5t8nWUlQ5axbawTm+yy688KCIdLqxL6iY8tn6zylCOr28nbh97saNaGf6LTXBhAevBKLw==
X-Received: by 2002:a19:4918:0:b0:478:7e82:86f1 with SMTP id w24-20020a194918000000b004787e8286f1mr54777219lfa.353.1654628295453;
        Tue, 07 Jun 2022 11:58:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d19-20020a2eb053000000b0025587b872cesm1611668ljl.70.2022.06.07.11.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 11:58:15 -0700 (PDT)
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
        freedreno@lists.freedesktop.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH v1 7/7] drm/msm/hdmi: merge platform config for 8974/8084/8994/8996
Date:   Tue,  7 Jun 2022 21:58:06 +0300
Message-Id: <20220607185806.2771739-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607185806.2771739-1-dmitry.baryshkov@linaro.org>
References: <20220607185806.2771739-1-dmitry.baryshkov@linaro.org>
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
index 03d8f97b0cd8..8ae60e97cc94 100644
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

