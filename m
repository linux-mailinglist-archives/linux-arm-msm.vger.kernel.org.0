Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAD4766A514
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 22:22:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbjAMVWG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 16:22:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231179AbjAMVVn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 16:21:43 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 985A088DF1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 13:21:41 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id bf43so34847918lfb.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 13:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dgg9JeyhvNXnnFE5cRLXAtppjoki0B7FFUK7wOEpChw=;
        b=CHxywticMRlcAgN0Fcl2ZaydliIr1xwa5MFZ5UdX57qzlSlT5IuOqOxZEQ9RWJWrh7
         J09KqGFy886RAcnWv86r2u1qnKZyQcLC+JUWzWjrqLscL4pYC2UYF/0bIuymKl6iadAT
         zZ1TXDzBLPCCjk4iYYU00Utz5Ph42y0rdebgwM2PL12rHi9RmCdmC79+kWdW8XxwfMek
         uQlYaARCcckrsPKJPp4grMdQInBG3DYwNY7w3Q9anSyR3BC4NmRhADKw5Fair1+GSGQ5
         GRRkNbvEkZDNdO7BXpbldFIYxvkM50npdLtAYc9Pvh9lbG1dnqh83XO1VEJu/r5VLMTu
         9gkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dgg9JeyhvNXnnFE5cRLXAtppjoki0B7FFUK7wOEpChw=;
        b=YfcoXPXyBHHBSHMysRGN8znx60ZZreASca3GXr8Jsqhq5LDOQtFXKrmeBuTlQbc161
         WJRbIMzoKeuzTjruWXK2BMw2OXrOrg2/j4+3XJFAIzivyKw/FlACvX+GpJVV1WUiYKJL
         +Y2KbntMACnSr8XWyclVh+gWMGVQebDy0cT6YcV9t0IosyRakmJFe0YFG+JBcjDDCyY4
         CVYAZE803RN41nGiCy7dv51255DX82JtUK3JE3LOD7ThWVa2fJI08BCIOoPlK1TAJwLr
         Re3U80yMBhPnAM0SRUinKSkAywtVuiZBY6a12ao3lR11+FTVLsNGJi6ylnSL1lHx6v5z
         T0kA==
X-Gm-Message-State: AFqh2krq7QWmjpQrd6xwSaW64t+1072gBxhk6UZAJ42dABEgVzbGIDwk
        4x/HFG10YEq2rRs8q0th6CT6kZxt09u+0nbDn8Vzfw==
X-Google-Smtp-Source: AMrXdXtGpw4seAekxp4RMLdpvZLdYqKiRAOA2pyUu4YZgAM+fX3nqi7fZbPg2j8X3Yl/toz4dlrpEg==
X-Received: by 2002:a05:6512:b88:b0:4cc:93e9:df8e with SMTP id b8-20020a0565120b8800b004cc93e9df8emr5317476lfv.33.1673644899995;
        Fri, 13 Jan 2023 13:21:39 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u11-20020ac243cb000000b004cafa2bfb7dsm4008933lfl.133.2023.01.13.13.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 13:21:39 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH 1/2] phy: qcom-qmp-pcie: fix the regs layout table for sm8450 gen3x1 PHY
Date:   Fri, 13 Jan 2023 23:21:37 +0200
Message-Id: <20230113212138.421583-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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

The sm8450 gen3x1 PHY references the pciephy_v4_regs_layout while the
PHY itself uses v5 regs. While there are only minor differences between
v4 and v5 regs and none of them concerns registers mentions in
regs_layout, switch the PHY to use pciephy_v5_regs_layout to remove
possible confusion.

Fixes: bbe207a1aba1 ("phy: qcom-qmp-pcie: rename regs layout arrays")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 21727e90fad1..0e7aaff2ecfd 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -2164,7 +2164,7 @@ static const struct qmp_phy_cfg sm8450_qmp_gen3x1_pciephy_cfg = {
 	.num_resets		= ARRAY_SIZE(sdm845_pciephy_reset_l),
 	.vreg_list		= qmp_phy_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
-	.regs			= pciephy_v4_regs_layout,
+	.regs			= pciephy_v5_regs_layout,
 
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
 	.phy_status		= PHYSTATUS,
-- 
2.39.0

