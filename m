Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 952D4661BAD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 01:52:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbjAIAwo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 19:52:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbjAIAwP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 19:52:15 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ABECE007
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 16:52:14 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id f34so10641236lfv.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 16:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31aA5zWUMd54TgNLNIsMPzAd1O1FoOtcnGcHe38DDow=;
        b=VqjLNyAKEZUW6YyvX27A927qPbOVgrUX9OaaZVGNFJHTftdYMmIW7ymgocur5SUajB
         fOB3c89v7i03jziqyUFLMsJaDhbK+itZmJbo8EqpAFSYh1e1pL9oS9B7Xab+Hs1mWe24
         Mc1OTpGXqtwdSIrv1FtOd0d385NuSV3uSGDX4IATH8dWp1HLySip+RdIL0Iood0HAImG
         D+Zjqvy/QHCLEPeS3E9v5elceDtCnlMBweKni0DglwA5981uPQpXeTyG/ePa7fZN+5uT
         vWiJ1mua7e4YFrmIdZoTN8jjhNxM1tXIeHWAbwp92fshrmsFClGTARz3tOpGTvlC+i8i
         MeEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31aA5zWUMd54TgNLNIsMPzAd1O1FoOtcnGcHe38DDow=;
        b=M05iyIjRE1nWrI1plSYIsmrvx9ehs4qP5xFfeKJFN8WMYVVLztQWy7xeaaSKZQ6KGo
         PXBJWrVonzXdUN8UIA3BsyzidokgF+w2yL8c0+/xP9t51eUA938tC8LrHciBpVqfJBOJ
         Cy1BqEfHos+ynmyW2M/9RpFVtJ8hKkd6U0/MKWe6ksEY4hN5U3nRMjCjBZ7olJSAHuxB
         FzcwoJWUaitheDa6No58P4BEvN2aPdSYW8Ul5d/kNhfXWb6xcKvpWW26cqZ5OBvIBmaG
         FpyOQLzRDq2kVK+xrX0nXaQYm+Z4lw0xDFDMMcDq4RbdRHKF5aSljRri54DNO3UQNMqq
         xhXQ==
X-Gm-Message-State: AFqh2kqeKcXU3QNxQlaiDcEYMK/awTEww6Iwx5FACzhSxrBAE/aoVsLs
        Ni1WBIP+NtcpRyH9WLLOs4GNZA==
X-Google-Smtp-Source: AMrXdXubOtRrspJG0nEHoHQd0wXySig1Y9dOHn9tZMOeVTmjXerJ17ZOXE6hnVJUMMFrlGVtCfArqA==
X-Received: by 2002:a05:6512:2985:b0:4b5:4603:64c4 with SMTP id du5-20020a056512298500b004b5460364c4mr17365908lfb.53.1673225532678;
        Sun, 08 Jan 2023 16:52:12 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c25-20020ac25f79000000b00494643db68fsm1317493lfc.81.2023.01.08.16.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 16:52:12 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 3/4] drm/msm/mdss: check for core clk before accessing HW_REV
Date:   Mon,  9 Jan 2023 02:52:08 +0200
Message-Id: <20230109005209.247356-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109005209.247356-1-dmitry.baryshkov@linaro.org>
References: <20230109005209.247356-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rather than checking whether the platform is an mdp5 or dpu platform,
check if the MDP_CLK is provided or not before trying to access HW_REV
(and skip reading the registers if the clock is not provided by the DT).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index c3364f85c148..ce554f2c2e02 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -35,7 +35,6 @@ struct msm_mdss {
 	void __iomem *mmio;
 	struct clk_bulk_data *clocks;
 	size_t num_clocks;
-	bool is_mdp5;
 	struct {
 		unsigned long enabled_mask;
 		struct irq_domain *domain;
@@ -230,6 +229,19 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss,
 	}
 }
 
+static bool msm_mdss_has_clock(struct msm_mdss *msm_mdss, const char *name)
+{
+	unsigned int i;
+
+	for (i = 0; i < msm_mdss->num_clocks; i++) {
+		if (!strcmp(msm_mdss->clocks[i].id, name) &&
+		    msm_mdss->clocks[i].clk)
+			return true;
+	}
+
+	return false;
+}
+
 static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
 	int ret;
@@ -249,10 +261,11 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	}
 
 	/*
-	 * HW_REV requires MDSS_MDP_CLK, which is not enabled by the mdss on
-	 * mdp5 hardware. Skip reading it for now.
+	 * HW_REV requires MDSS_MDP_CLK, which is not used for MDSS device in
+	 * older device trees. Skip accessing registers if the clock is not
+	 * present.
 	 */
-	if (msm_mdss->is_mdp5)
+	if (!msm_mdss_has_clock(msm_mdss, "core"))
 		return 0;
 
 	hw_rev = readl_relaxed(msm_mdss->mmio + HW_REV);
@@ -419,7 +432,6 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
 		return ERR_PTR(ret);
 	}
 	msm_mdss->num_clocks = ret;
-	msm_mdss->is_mdp5 = is_mdp5;
 
 	msm_mdss->dev = &pdev->dev;
 
-- 
2.39.0

