Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF555EE9ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 01:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233492AbiI1XK2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 19:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234173AbiI1XKV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 19:10:21 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6725331EC0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:19 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id p5so15907208ljc.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=uzlJbr25Ee5CeDIpRbVJDePj8Z9TkKFdQtXGeZSLKLE=;
        b=Uws+GwmhptcEvrXeqilYpIlR/CdYY9hkSTSqJiCtyPb1QZB0Tob8GbXOXZ9lOZEvjG
         VUfHESMLRceHCD/YlMo175CYhx3TqPZxZLEyw7CxD6s8XPZfV1rnTOHPbOi6T6uIxCTF
         lsjZn2hWVh6al8i/+pr1QRHkiDT46gcB75mCoVAlxCpaxHCpUshJiHz87kLBMH/0J0tT
         pWUBqrAFIZLyfiA7NUrl1yfXf17CKbWf3VjLhtViZnf9yUfcrP6N8GD1evpVcfhXYNKZ
         vkeLQofljuL1V0F6CPzi+NYZxfct4FMmDQpO3mSt6sj78LeMAeIqjTYmMUG4EC+KWyHG
         fcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=uzlJbr25Ee5CeDIpRbVJDePj8Z9TkKFdQtXGeZSLKLE=;
        b=unDIDgMrB/NSCKCV7z0oG48ihFprWnP5D1aq4kUH8FM2Tu0VjweD2cmjzPsWEp0IUS
         10b3VT8o4MDrOFZUddOpX8Qd58mmEHiJH9gJJ91gKNWBfuSlrQhL+HY6GGboB058zpC8
         i7IuxI1GRfpFTA6omIozUltdqcNGz/Wi29J7OnTEEC0J73dSwE/GSF5B5jJZrKRBiTl4
         GuEzZNUdOPg3kV7SFs9ybGtdIGlSV+9hAoLYCLTL4fYEs3dymLJO+evIYheznk6/2rc1
         a7CXgXmCSJrYAZgiVRbE+qglx02RPcEKfa3aEMxmcopQUH3M5VoFy9hAmOkJUPgWiwU/
         zKNw==
X-Gm-Message-State: ACrzQf1WgzJaZQXrDaF5BaepLVXmfaVwdKDONTT+SG2F0TdeOk2UxINO
        AqVyG3hIxLEE+HX+QmWHj1Escg==
X-Google-Smtp-Source: AMsMyM5o7OoWwx/Z0QVU+dJ8WuavAWLGAleTG44s72WWihEn7UjHUMlP5Q3gQtBH1J+TtNVLc15NXQ==
X-Received: by 2002:a2e:b693:0:b0:26c:3ddc:4175 with SMTP id l19-20020a2eb693000000b0026c3ddc4175mr60186ljo.486.1664406617770;
        Wed, 28 Sep 2022 16:10:17 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o16-20020ac24950000000b0049d5733fb3fsm597587lfi.212.2022.09.28.16.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 16:10:17 -0700 (PDT)
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
Subject: [PATCH 02/18] phy: qcom-qmp-pcie: clean up power-down handling
Date:   Thu, 29 Sep 2022 02:09:58 +0300
Message-Id: <20220928231014.455201-3-dmitry.baryshkov@linaro.org>
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
the v2 offset during power on and power off.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
[DB: also updated pciephy_regs_layout]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 7710e4dee39c..015f17a11439 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -97,18 +97,21 @@ static const unsigned int pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_SW_RESET]			= 0x00,
 	[QPHY_START_CTRL]		= 0x08,
 	[QPHY_PCS_STATUS]		= 0x174,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x04,
 };
 
 static const unsigned int sdm845_qmp_pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_SW_RESET]			= 0x00,
 	[QPHY_START_CTRL]		= 0x08,
 	[QPHY_PCS_STATUS]		= 0x174,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x04,
 };
 
 static const unsigned int sdm845_qhp_pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_SW_RESET]			= 0x00,
 	[QPHY_START_CTRL]		= 0x08,
 	[QPHY_PCS_STATUS]		= 0x2ac,
+	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x04,
 };
 
 static const unsigned int sm8250_pcie_regs_layout[QPHY_LAYOUT_SIZE] = {
@@ -1885,13 +1888,8 @@ static int qmp_pcie_init(struct phy *phy)
 	if (ret)
 		goto err_assert_reset;
 
-	if (cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL])
-		qphy_setbits(pcs,
-				cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
-				cfg->pwrdn_ctrl);
-	else
-		qphy_setbits(pcs, QPHY_V2_PCS_POWER_DOWN_CONTROL,
-				cfg->pwrdn_ctrl);
+	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
+			cfg->pwrdn_ctrl);
 
 	return 0;
 
@@ -2014,13 +2012,8 @@ static int qmp_pcie_power_off(struct phy *phy)
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

