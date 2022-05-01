Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37554516798
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 May 2022 21:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354165AbiEAT7u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 May 2022 15:59:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354255AbiEAT7t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 May 2022 15:59:49 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2986D101F8
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 May 2022 12:56:23 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 4so16263093ljw.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 May 2022 12:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5DlnFpstvVMz8ogimO7x7gnGg9U0guhBg0Tjc/KXhlQ=;
        b=b7jWpei29YU5OfV5sSEGuU3Lr3PRYKjuI+fR0O/yy8nmUmSq2gX+O3I6GcLmfKpjiM
         Ou9HAly9xpOn3meBlDcW9Jp56KR01IEPWRX+mHDVUW55eS0v+znn+ixCjyow/aifjPO1
         8va8Mxg7HXRvjQAjmkrCbVNfGriyhbNrVPYmiKUYccQCrO+hHsWOFYAqXTfCIfaYE10T
         zZEbyLyYfkIYNkoajMJWTBt/Gx9MP82Rp6mCnjOcyX8mnHm9X7VFBGo+KJt7JRixj1kT
         6nfNfL28U+N0pgTbJBDQ6VFmjfe1ooUqd794GES90X5she3pVOQE7BtniwVldTOYu8/T
         FCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5DlnFpstvVMz8ogimO7x7gnGg9U0guhBg0Tjc/KXhlQ=;
        b=k0JnHhSgcUz/aSFq952y2rI3xMniqdvzik8yQ1eqAR1xBt9XW9j8feiIPE39CKU3Ni
         iBsbrq98KDQOhENHX4/GqY5xqQecw2ovWwqZyxrvArgrXAbwQowo1TUDd4gNUb/msz/8
         dcvKdOMZM5z/TaXtiOkVUfaXMSNI/1WyzGp+PxSA2hZSjdfANtJ6mqpbKJpZFxksK/tG
         SJS8xKfsJGDILv99WIvQ1Es47I0B1Xm3mnsjqYpzbHB5hdTucJSmZqpQhUh6b7w8o3lX
         xN+wNn38V8ZH40kbza5p8CPCxo8HsXu2Ll8WEC/c/FU79+iixISeWcWpQHio74WEy5MS
         bJUg==
X-Gm-Message-State: AOAM532qgX8X2KM0+yRp+eOb/g5kcly2z5lDRhagft7amkvoF45LyUnE
        wdvXz/eRwTTm8+hBDY0u7TFG8g==
X-Google-Smtp-Source: ABdhPJxTR22A6LrOaxFBr0FK9ToieYi7wenTTj8MjU1NRUjDGzWYFvz2eYLWRTSLSXUg6hgIi9XVgA==
X-Received: by 2002:a05:651c:890:b0:248:5819:b949 with SMTP id d16-20020a05651c089000b002485819b949mr6188460ljq.476.1651434981563;
        Sun, 01 May 2022 12:56:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p3-20020a19f003000000b0047255d211b7sm517580lfc.230.2022.05.01.12.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 12:56:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dsi: pll_7nm:  remove unsupported dividers for DSI pixel clock
Date:   Sun,  1 May 2022 22:56:20 +0300
Message-Id: <20220501195620.4135080-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Remove dividers that are not recommended for DSI DPHY mode when setting
up the clock tree for the DSI pixel clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 6e506feb111f..66ed1919a1db 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -586,7 +586,7 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
 static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provided_clocks)
 {
 	char clk_name[32], parent[32], vco_name[32];
-	char parent2[32], parent3[32], parent4[32];
+	char parent2[32];
 	struct clk_init_data vco_init = {
 		.parent_data = &(const struct clk_parent_data) {
 			.fw_name = "ref",
@@ -687,15 +687,13 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
 		snprintf(clk_name, 32, "dsi%d_pclk_mux", pll_7nm->phy->id);
 		snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->phy->id);
 		snprintf(parent2, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->phy->id);
-		snprintf(parent3, 32, "dsi%d_pll_out_div_clk", pll_7nm->phy->id);
-		snprintf(parent4, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->phy->id);
 
 		hw = devm_clk_hw_register_mux(dev, clk_name,
 					((const char *[]){
-					parent, parent2, parent3, parent4
-					}), 4, 0, pll_7nm->phy->base +
+					parent, parent2,
+					}), 2, 0, pll_7nm->phy->base +
 					REG_DSI_7nm_PHY_CMN_CLK_CFG1,
-					0, 2, 0, NULL);
+					0, 1, 0, NULL);
 		if (IS_ERR(hw)) {
 			ret = PTR_ERR(hw);
 			goto fail;
-- 
2.35.1

