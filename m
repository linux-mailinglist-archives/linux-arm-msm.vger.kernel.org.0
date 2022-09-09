Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 689E45B38C5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 15:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbiIINUU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 09:20:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbiIINUS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 09:20:18 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D6985F7ED
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 06:20:16 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id y29so1791236ljq.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 06:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=em1iMz9Ryn69lAbyqnPUyMJ8hWxDsU/s62VVW2GYYt0=;
        b=REuDz7DMRiW5wABhl0JqQ/5R+KnNYf1nJ1z5zFvfWQy5UAeds1UVPHB9xRz2mCNpaw
         pe0kEFj43iG7V1ZV6c7uVxXD8U+EvQ5SZS3gtIBx8N7GxnxLFJYeC0U2nWvOUPBwT62p
         2Wi40KByuV/tfM718iO1rxrwQMwwfFaOrzBt2BUdsYkv86YMAdtFesaz+OQYViu2ptJS
         4ddOWffRcrx1wqZfXp8l49E+VmUL44LXQJBhpxQynXjl6HnA7BviVMA6oA+1rEnbOqnn
         EAac3LXPgRyC8tTCn/82/LqrdecqVYZQhePEmSCTNUPzoCvKAm92YuNdNSNzjzOu2CcF
         KKXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=em1iMz9Ryn69lAbyqnPUyMJ8hWxDsU/s62VVW2GYYt0=;
        b=K0oBEkQSpT+4X7j4is02B7bi7RSM16TY8UkuzPa8RLf2d5R9jH9DfRkSClMmm4h+tZ
         SkuAWwkIA3B0eg7EDJan+9gvv39cffdmMpKpP4quAH+pSux0pEJykhFSgXl6E1OVlxWe
         8K5AJiUDW/XWRXJrJoL7mok1274UK9uqy08kw/2Yhi7ITTv32D/Gr//l6UXqe4L/zRgq
         6J+F2GTHyQpihMHVS6I9HM0/jsjT2DpOOTGW+sYkDIyf0PEcHUJsOvXEhBgtUqK3oIQG
         utwDuCrbclhWW+WEJYHiCvyGnRsVe4gnenVNsy6S53DEPVBnRzEV9+azhc4x4Au1er/W
         g3qA==
X-Gm-Message-State: ACgBeo0Penalyb5+c4QkEOp/A5AEPLPvBsYtgMk4S9SAqbl/OA94+vlH
        Q4jhwKS9q0+eRo++8ofYGCwedQ==
X-Google-Smtp-Source: AA6agR4kWFPWbWXMl17g4rhRlcM8PGb4uJi9blQLcd4LCHuCk74fJzGlU9hn80Pozqd0mpqFWLIX9g==
X-Received: by 2002:a2e:bc06:0:b0:266:23b7:283d with SMTP id b6-20020a2ebc06000000b0026623b7283dmr4225886ljf.151.1662729614960;
        Fri, 09 Sep 2022 06:20:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v10-20020a056512348a00b00498ff4ae746sm71729lfr.294.2022.09.09.06.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 06:20:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
        Kishon Vijay Abraham I <kishon@ti.com>
Subject: [PATCH 4/6] drm/msm/hdmi: make hdmi_phy_8960 OF clk provider
Date:   Fri,  9 Sep 2022 16:20:08 +0300
Message-Id: <20220909132010.3814817-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220909132010.3814817-1-dmitry.baryshkov@linaro.org>
References: <20220909132010.3814817-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On MSM8960 the HDMI PHY provides the PLL clock to the MMCC. As we are
preparing to convert the MSM8960 to use DT clocks properties (rather
than global clock names), register the OF clock provider.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
index c3e7ff45e52a..cb35a297afbd 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
@@ -422,8 +422,7 @@ int msm_hdmi_pll_8960_init(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct hdmi_pll_8960 *pll;
-	struct clk *clk;
-	int i;
+	int i, ret;
 
 	/* sanity check: */
 	for (i = 0; i < (ARRAY_SIZE(freqtbl) - 1); i++)
@@ -443,10 +442,16 @@ int msm_hdmi_pll_8960_init(struct platform_device *pdev)
 	pll->pdev = pdev;
 	pll->clk_hw.init = &pll_init;
 
-	clk = devm_clk_register(dev, &pll->clk_hw);
-	if (IS_ERR(clk)) {
+	ret = devm_clk_hw_register(dev, &pll->clk_hw);
+	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "failed to register pll clock\n");
-		return -EINVAL;
+		return ret;
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &pll->clk_hw);
+	if (ret) {
+		DRM_DEV_ERROR(dev, "%s: failed to register clk provider: %d\n", __func__, ret);
+		return ret;
 	}
 
 	return 0;
-- 
2.35.1

