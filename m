Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E18275B0269
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 13:08:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbiIGLH7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 07:07:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbiIGLH4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 07:07:56 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34D8DA3D00;
        Wed,  7 Sep 2022 04:07:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 13D67B81C44;
        Wed,  7 Sep 2022 11:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B129C43145;
        Wed,  7 Sep 2022 11:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662548868;
        bh=ymfYTg0RXAypX0hrPmht7eiOD+LusHcAybYa8Vl9Jg4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kygaKH7T5EwLCKzO5LLFQLydod0Cit/ATFHZ7c7J7nU2CUOirVfYVgS5v2J/od0D0
         WFrFNOwI0Ac5keriqvM0CHjKfSNTKbW8ItBj/tyKBdq29iTyoGgx2MYzK39DsSEpzj
         +3Ef59c9UQeoZZAP1xsXth/Zu4E8cDhHdg0mW7kwlGtLWxWPUcuOrjcSQAkP9uTqVw
         OPJnWDfphCcEUv2AeekzB8cAm2m6SVr0B/z1d90gQQfrNaBohXO4o1vyITJTPxyQKl
         ZQ0bsXn9hmNoO3OVeySs/MNy+zwgm+YffBUe6NGmhLhwyWZrvB8BcnD3iGy68KGurE
         vQSuOxmmZdJ7Q==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan+linaro@kernel.org>)
        id 1oVsuO-0004zF-Ug; Wed, 07 Sep 2022 13:07:52 +0200
From:   Johan Hovold <johan+linaro@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 10/16] phy: qcom-qmp-usb: drop unused defines
Date:   Wed,  7 Sep 2022 13:07:22 +0200
Message-Id: <20220907110728.19092-11-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220907110728.19092-1-johan+linaro@kernel.org>
References: <20220907110728.19092-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop defines and enums that are unused since the QMP driver split.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index b63183aaacb8..c50ebe8d19bc 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -28,16 +28,11 @@
 #define SW_RESET				BIT(0)
 /* QPHY_POWER_DOWN_CONTROL */
 #define SW_PWRDN				BIT(0)
-#define REFCLK_DRV_DSBL				BIT(1)
 /* QPHY_START_CONTROL bits */
 #define SERDES_START				BIT(0)
 #define PCS_START				BIT(1)
-#define PLL_READY_GATE_EN			BIT(3)
 /* QPHY_PCS_STATUS bit */
 #define PHYSTATUS				BIT(6)
-#define PHYSTATUS_4_20				BIT(7)
-/* QPHY_PCS_READY_STATUS & QPHY_COM_PCS_READY_STATUS bit */
-#define PCS_READY				BIT(0)
 
 /* QPHY_V3_DP_COM_RESET_OVRD_CTRL register bits */
 /* DP PHY soft reset */
@@ -71,8 +66,6 @@
 #define POWER_DOWN_DELAY_US_MIN			10
 #define POWER_DOWN_DELAY_US_MAX			11
 
-#define MAX_PROP_NAME				32
-
 /* Define the assumed distance between lanes for underspecified device trees. */
 #define QMP_PHY_LEGACY_LANE_STRIDE		0x400
 
@@ -115,15 +108,9 @@ struct qmp_phy_init_tbl {
 
 /* set of registers with offsets different per-PHY */
 enum qphy_reg_layout {
-	/* Common block control registers */
-	QPHY_COM_SW_RESET,
-	QPHY_COM_POWER_DOWN_CONTROL,
-	QPHY_COM_START_CONTROL,
-	QPHY_COM_PCS_READY_STATUS,
 	/* PCS registers */
 	QPHY_SW_RESET,
 	QPHY_START_CTRL,
-	QPHY_PCS_READY_STATUS,
 	QPHY_PCS_STATUS,
 	QPHY_PCS_AUTONOMOUS_MODE_CTRL,
 	QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR,
-- 
2.35.1

