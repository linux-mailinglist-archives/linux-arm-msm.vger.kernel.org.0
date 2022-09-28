Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF3C95EE9EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 01:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233775AbiI1XKa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 19:10:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233733AbiI1XKZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 19:10:25 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CFE03CBC2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:22 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id c7so15880492ljm.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=MTZUhUnge8vicYCCEwsZVv1DWIlqH6ajZVbgoBJ9ax4=;
        b=jY+22saXJRFVs73re6xtnOYOoV3oYbPElwS2aPyVo6vabjNCElooITCRiImP1WGHzs
         TWbWtX518rGCbZUGNpb9YSI9H3UDNau3Fzgw38Holq3BHjyQlH45f4k6suvSoZOKyH0Q
         QXHZ5SoQVrX2w+nIawBzD/jjJqpeAyj52JypDBqY2RLEbetAfPlFHM1j4ku6FT/vRT5c
         2jKdHgfIVCJAVBWr0cB1xAzG4D01PPzLgiSjIBplVIRxJCm++Nvjsmv4BSflfZ/v7ag2
         IkC8qUJdZmcCMdZgR4FzqMSxgH/BbYVq2nHF9ZtHzRNjyLMeuAomkn6QqnlUsZYGoq2V
         Rc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=MTZUhUnge8vicYCCEwsZVv1DWIlqH6ajZVbgoBJ9ax4=;
        b=34Ed3t6rLijSB5vHTzrKZ4bVzzA6EPt/9Bb0e2VFK+BSpxeCxuJ2u9AEVyTEfYlB7z
         Duw3aAIBrWIv+waFpfatCDeKRDmRXKoF6EXnlKMR+5yL0dXp2YMTeOcu2QFt5Ce7prIT
         urrNKA0+NSotvwPj1BhWz3LsyzSQOvkOK3GxmmFf4eW6FTv/jUdGg/kbJJ4P6GRTnTn9
         qWD46PkLXRi8epRqFU8HYwgFChSBMgUQpqnCb/Azu5uMYkVVhpTInDTBFvRZM8w0ub02
         EWEWMCwd51phrFDzVapiwf+1favQ63O3eYRRvdZ3IrXaa7HGpOZm2lzsx/2Y+GOrPsI7
         wxag==
X-Gm-Message-State: ACrzQf3e0CBEKVdCIj0X+VT530/mPnx/xy7hgBwCGFlqCIayGDF9Z91Z
        Z1DLXSDNtFT4XobHIwJyHjMv2Q==
X-Google-Smtp-Source: AMsMyM4eLo9SMZG7WJNQQ/BByEEW0p/4U7V+U/HSaay4mmNtYgcu0xlKhKBVJCKB5ZI11ucCBMcuIg==
X-Received: by 2002:a05:651c:2397:b0:26d:b451:787d with SMTP id bk23-20020a05651c239700b0026db451787dmr55384ljb.83.1664406620097;
        Wed, 28 Sep 2022 16:10:20 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o16-20020ac24950000000b0049d5733fb3fsm597587lfi.212.2022.09.28.16.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 16:10:19 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 05/18] phy: qcom-qmp-ufs: clean up power-down handling
Date:   Thu, 29 Sep 2022 02:10:01 +0300
Message-Id: <20220928231014.455201-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928231014.455201-1-dmitry.baryshkov@linaro.org>
References: <20220928231014.455201-1-dmitry.baryshkov@linaro.org>
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

From: Johan Hovold <johan+linaro@kernel.org>

Always define the POWER_DOWN_CONTROL register instead of falling back to
the v2 (and v4) offset during power on and power off.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index c08d34ad1313..738ec1e49ec6 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -89,22 +89,26 @@ enum qphy_reg_layout {
 static const unsigned int msm8996_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_START_CTRL]		= 0x00,
 	[QPHY_PCS_READY_STATUS]		= 0x168,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x04,
 };
 
 static const unsigned int sdm845_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_START_CTRL]		= 0x00,
 	[QPHY_PCS_READY_STATUS]		= 0x160,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x04,
 };
 
 static const unsigned int sm6115_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_START_CTRL]		= 0x00,
 	[QPHY_PCS_READY_STATUS]		= 0x168,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x04,
 };
 
 static const unsigned int sm8150_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_START_CTRL]		= QPHY_V4_PCS_UFS_PHY_START,
 	[QPHY_PCS_READY_STATUS]		= QPHY_V4_PCS_UFS_READY_STATUS,
 	[QPHY_SW_RESET]			= QPHY_V4_PCS_UFS_SW_RESET,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= QPHY_V4_PCS_UFS_POWER_DOWN_CONTROL,
 };
 
 static const struct qmp_phy_init_tbl msm8996_ufs_serdes_tbl[] = {
@@ -856,13 +860,8 @@ static int qmp_ufs_com_init(struct qmp_phy *qphy)
 	if (ret)
 		goto err_disable_regulators;
 
-	if (cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL])
-		qphy_setbits(pcs,
-			     cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
-			     cfg->pwrdn_ctrl);
-	else
-		qphy_setbits(pcs, QPHY_V2_PCS_POWER_DOWN_CONTROL,
-			     cfg->pwrdn_ctrl);
+	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
+			cfg->pwrdn_ctrl);
 
 	return 0;
 
@@ -996,13 +995,8 @@ static int qmp_ufs_power_off(struct phy *phy)
 	qphy_clrbits(qphy->pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
 
 	/* Put PHY into POWER DOWN state: active low */
-	if (cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL]) {
-		qphy_clrbits(qphy->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
-			     cfg->pwrdn_ctrl);
-	} else {
-		qphy_clrbits(qphy->pcs, QPHY_V2_PCS_POWER_DOWN_CONTROL,
-				cfg->pwrdn_ctrl);
-	}
+	qphy_clrbits(qphy->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
+			cfg->pwrdn_ctrl);
 
 	return 0;
 }
-- 
2.35.1

