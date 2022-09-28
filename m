Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BE835EE9EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 01:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232938AbiI1XKa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 19:10:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234253AbiI1XKV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 19:10:21 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 293B3186D3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:20 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id k10so22571268lfm.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=pGT763Ruuj1rRpQ5GP5KiZ/2Tu//UxTgarC85JTTSvY=;
        b=NAiVgohJYXoSq1Rk+IPUues5TnQU+fkoJ57Zj+/Ssh5abLT4TxRNQncb8tzMkqTg6N
         r4whax2KDu//QcbvRzMjgvtuoLhGBD3kXf0fy09Ve1CDBclW2XIQYg/2O2CZmSk20G9j
         RuQRbVA2QeGmLvjzGIrntZHLz05hjKoUFmbCl1HReer5hyNOxQGfHZEMW+rkRjUvGUlD
         tSOP4u1ZQEflDbjA9bEJ4IPckFf6PTe9bzEN3CtDGYszUGkX1Ua79mg48ECATQmvsGBk
         cF3WstoCQpR0SFh/ds1zAIcy5nkqhmv1U3fzbCrAoYypNj73KoGZ2BLotQIK67NvcSMl
         cGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=pGT763Ruuj1rRpQ5GP5KiZ/2Tu//UxTgarC85JTTSvY=;
        b=DL+32eSXKsZfHQzH3ghEsqB9OWXJ8XM9ld1sXElIIO0qIxdYTYU97Pc4vzJ2u2dksr
         rGo/20EIwUVYRRtJLztCZqq1ITISoAJWfeSuVhDlywO1C6pRUha4pf6aQZG+BECllYg7
         n9vqLi8z1u7OKFqooPs160zpa8BPPfSmtUUwoYNn92amAMhDsZNjqALDEEP88bN+ie98
         1FJLZvftjB3/CEw/h25+flj7SKFZ92JRcxzH4gniJGA6BJChO6sy3o98hMwMCWzGJ4qN
         iRCcwdH6AsxidD8dEdyJX2MHPgIVm853N+cjg4QP/PEyvew1MzvC3m/mBQ3TgvkY5NwN
         NC5Q==
X-Gm-Message-State: ACrzQf0b15pdhhjhBfcipUoyjywC4SocBY7hQc6cPc6I3REV2EuJu4Nr
        EITwmlaalOTHgJjXNW//J4u4ew==
X-Google-Smtp-Source: AMsMyM6xq/f0k7XGHDfsNpgbaa6xiOL7J5ZVdWD3/ZUKaZEVqiwrO2ck2qTcgR2Po/drVeKbXX/6mA==
X-Received: by 2002:a05:6512:39c3:b0:49f:dee8:c100 with SMTP id k3-20020a05651239c300b0049fdee8c100mr134986lfu.168.1664406618525;
        Wed, 28 Sep 2022 16:10:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o16-20020ac24950000000b0049d5733fb3fsm597587lfi.212.2022.09.28.16.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 16:10:18 -0700 (PDT)
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
Subject: [PATCH 03/18] phy: qcom-qmp-pcie-msm8996: clean up power-down handling
Date:   Thu, 29 Sep 2022 02:09:59 +0300
Message-Id: <20220928231014.455201-4-dmitry.baryshkov@linaro.org>
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

This driver uses v2 registers only so drop the unnecessary
POWER_DOWN_CONTROL override.

Note that this register is already hard-coded when powering on the PHY.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
index 461f0b5d464a..a5ebd77d5905 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie-msm8996.c
@@ -91,7 +91,6 @@ enum qphy_reg_layout {
 	QPHY_SW_RESET,
 	QPHY_START_CTRL,
 	QPHY_PCS_STATUS,
-	QPHY_PCS_POWER_DOWN_CONTROL,
 	/* Keep last to ensure regs_layout arrays are properly initialized */
 	QPHY_LAYOUT_SIZE
 };
@@ -591,13 +590,8 @@ static int qmp_pcie_msm8996_power_off(struct phy *phy)
 	qphy_clrbits(qphy->pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
 
 	/* Put PHY into POWER DOWN state: active low */
-	if (cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL]) {
-		qphy_clrbits(qphy->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
-			     cfg->pwrdn_ctrl);
-	} else {
-		qphy_clrbits(qphy->pcs, QPHY_V2_PCS_POWER_DOWN_CONTROL,
-				cfg->pwrdn_ctrl);
-	}
+	qphy_clrbits(qphy->pcs, QPHY_V2_PCS_POWER_DOWN_CONTROL,
+			cfg->pwrdn_ctrl);
 
 	return 0;
 }
-- 
2.35.1

