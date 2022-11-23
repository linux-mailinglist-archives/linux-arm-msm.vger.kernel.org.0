Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64F2963514D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 08:49:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236060AbiKWHsx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 02:48:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236054AbiKWHst (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 02:48:49 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CBEBFA70B
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 23:48:48 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id k2-20020a17090a4c8200b002187cce2f92so1213425pjh.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Nov 2022 23:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Su1NIZYU8/terDobSHxKGADJDrW1hfmKOqGKgPRAUt8=;
        b=pJQMn8glJWI/WtsSCZuR38phcR3RnPDZadpfmuWniRa+NG+YvaOMtJ3Rjz3Au6AcBi
         B8YclqGtNRSuQ8m8xU3tIwwhWGbDWSqlFbVsOFamvEA5VzhCrbeW9i1MJe1PRuDfqsjT
         kC4gtRUSSkafguTsnMlZJvdh4fsR74fdDHh2IPs/p7hTG/Ssx9KPZ97qmG8gnDMo+ryl
         UqjUn4XX0bNNAOm7Dg/cRUXV7woD6xSOawfsaXsDTQ0Ak8u0udpAlRSxFhJmeuViw/Ku
         i8zRL2RuCSHZ1Whqb92iUAngplF4sZyMZbf+4rRMuOP48lQRhBmksse2bKXrj235QKiS
         rOCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Su1NIZYU8/terDobSHxKGADJDrW1hfmKOqGKgPRAUt8=;
        b=kKfJYR07regtS8WWow/7ule58h6hzOMv4P2g/6sW6XhZHiMJlGHlYimVk+3ItNUEto
         SGnBqb0QtBWEJw5nw/Vrft6JQvJJg8nQ29/955BxvW31UU9u/dVyuTd9SO+qOxb6xwmA
         J1CFrYrIJ/KSQscNU5aptZGNAy57iQqQs+k2csvtgNGGd2O32V5RlYXByzEKkc7jC2b1
         HQtzEX06wd9yKHUSpFV2mB8L25SlneY+KHvGYJBZsgk8stJZMOnpcaF05K/uFbkPJCK0
         fzHyIZRrcRqfuyUjhY50ZE7r/Pi3w2zFtIB9M7w+J0yaOnsFIQ4vrzziw0bH/j+ac44k
         zXdw==
X-Gm-Message-State: ANoB5pmk7UKP1JzoVzoZhIHcM5kwOwb6CFAPdqErA76wYtYIDR/7VSTp
        cNhPJSq0jMd56No7wfB0Lh1K
X-Google-Smtp-Source: AA0mqf47FBzHG1woI8Q6XhWCuFsPxS/TLIZpVMhQ+otr4WA2+UfS+eZAX8zuJr+FOHgH86k1kGoXvw==
X-Received: by 2002:a17:902:f707:b0:176:b0ce:3472 with SMTP id h7-20020a170902f70700b00176b0ce3472mr20126577plo.169.1669189727526;
        Tue, 22 Nov 2022 23:48:47 -0800 (PST)
Received: from localhost.localdomain ([117.202.191.0])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm13334059plq.34.2022.11.22.23.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 23:48:46 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     martin.petersen@oracle.com, jejb@linux.ibm.com,
        andersson@kernel.org, vkoul@kernel.org
Cc:     quic_cang@quicinc.com, quic_asutoshd@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        dmitry.baryshkov@linaro.org, ahalaney@redhat.com,
        abel.vesa@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 02/20] phy: qcom-qmp-ufs: Rename MSM8996 PHY definitions
Date:   Wed, 23 Nov 2022 13:18:08 +0530
Message-Id: <20221123074826.95369-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221123074826.95369-1-manivannan.sadhasivam@linaro.org>
References: <20221123074826.95369-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Only MSM8996 is using "_ufs_" naming convention for PHY definitions instead
of "_ufsphy_" as like other SoCs. So to maintain the uniformity, let's
rename all of the definitions to use "_ufsphy_".

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 047f06c3313a..443f2714a8f1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -107,7 +107,7 @@ static const unsigned int sm8150_ufsphy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_SW_RESET]			= QPHY_V4_PCS_UFS_SW_RESET,
 };
 
-static const struct qmp_phy_init_tbl msm8996_ufs_serdes[] = {
+static const struct qmp_phy_init_tbl msm8996_ufsphy_serdes[] = {
 	QMP_PHY_INIT_CFG(QSERDES_COM_CMN_CONFIG, 0x0e),
 	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0xd7),
 	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x30),
@@ -156,12 +156,12 @@ static const struct qmp_phy_init_tbl msm8996_ufs_serdes[] = {
 	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE1, 0x00),
 };
 
-static const struct qmp_phy_init_tbl msm8996_ufs_tx[] = {
+static const struct qmp_phy_init_tbl msm8996_ufsphy_tx[] = {
 	QMP_PHY_INIT_CFG(QSERDES_TX_HIGHZ_TRANSCEIVEREN_BIAS_DRVR_EN, 0x45),
 	QMP_PHY_INIT_CFG(QSERDES_TX_LANE_MODE, 0x02),
 };
 
-static const struct qmp_phy_init_tbl msm8996_ufs_rx[] = {
+static const struct qmp_phy_init_tbl msm8996_ufsphy_rx[] = {
 	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_LVL, 0x24),
 	QMP_PHY_INIT_CFG(QSERDES_RX_SIGDET_CNTRL, 0x02),
 	QMP_PHY_INIT_CFG(QSERDES_RX_RX_INTERFACE_MODE, 0x00),
@@ -657,15 +657,15 @@ static const char * const qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll",
 };
 
-static const struct qmp_phy_cfg msm8996_ufs_cfg = {
+static const struct qmp_phy_cfg msm8996_ufsphy_cfg = {
 	.lanes			= 1,
 
-	.serdes_tbl		= msm8996_ufs_serdes,
-	.serdes_tbl_num		= ARRAY_SIZE(msm8996_ufs_serdes),
-	.tx_tbl			= msm8996_ufs_tx,
-	.tx_tbl_num		= ARRAY_SIZE(msm8996_ufs_tx),
-	.rx_tbl			= msm8996_ufs_rx,
-	.rx_tbl_num		= ARRAY_SIZE(msm8996_ufs_rx),
+	.serdes_tbl		= msm8996_ufsphy_serdes,
+	.serdes_tbl_num		= ARRAY_SIZE(msm8996_ufsphy_serdes),
+	.tx_tbl			= msm8996_ufsphy_tx,
+	.tx_tbl_num		= ARRAY_SIZE(msm8996_ufsphy_tx),
+	.rx_tbl			= msm8996_ufsphy_rx,
+	.rx_tbl_num		= ARRAY_SIZE(msm8996_ufsphy_rx),
 
 	.clk_list		= msm8996_ufs_phy_clk_l,
 	.num_clks		= ARRAY_SIZE(msm8996_ufs_phy_clk_l),
@@ -1146,7 +1146,7 @@ static int qmp_ufs_create(struct device *dev, struct device_node *np, int id,
 static const struct of_device_id qmp_ufs_of_match_table[] = {
 	{
 		.compatible = "qcom,msm8996-qmp-ufs-phy",
-		.data = &msm8996_ufs_cfg,
+		.data = &msm8996_ufsphy_cfg,
 	}, {
 		.compatible = "qcom,msm8998-qmp-ufs-phy",
 		.data = &sdm845_ufsphy_cfg,
-- 
2.25.1

