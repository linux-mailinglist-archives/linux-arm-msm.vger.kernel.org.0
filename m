Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CFA453472F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 May 2022 01:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344731AbiEYX7M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 May 2022 19:59:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345472AbiEYX7J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 May 2022 19:59:09 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44A6AA0D30
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:59:07 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 1so125920ljp.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 May 2022 16:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AaghgJV3RWxswvwWMqb90Y4VmD0Lo2dTJ1tWjmmQXGo=;
        b=zlhGMon6HXNGybAznYvtgs9vuYm+2dnvQlj1YbV9Pje1/8QgooBCZcH/vVvXAayr/x
         9OVYbxea5Sj5qs0t9VMDkrYiSA9MDEcgJ81QlTA48Mb24XFeDPf6HkBmvAWoUGDWJ/sQ
         2hS0yPMRMhvmrZUp50xpQRWn3JoPAd2AaiekWhq7tWu5Fzl2G9X86N4DfEjUDWeV95nj
         S3xBo+hrn/ah5vJxJ5zTqsEemMfu/cKJ1ujYnl/XbDTzwVsZ82oAxj4eV3/1vSn9NaoQ
         JxPDIcYRn994w1dlCr7hh5Y2w5fe4QPT0AoRmLMLusdck3Z8wFKTNyHneZhrQiXHhnAi
         QEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AaghgJV3RWxswvwWMqb90Y4VmD0Lo2dTJ1tWjmmQXGo=;
        b=KvfLITmKjevpUckgOBq/zUF8+nIDmXDUza0J6JZPugrBJjvt4kLL0HVKl6aP2B56eZ
         hheb2RELUaIxTiI4goFfP1o+OtE5F0BvR7j6oJxVD51z7SRz9wVGATC+qWa3xVD+2u3n
         zTRFRgKGQgdnwXIaG/B4NBwKYmyyJlCdgZCqilcxVq1ui9zevrQ8JDT4KwMK8K8CtOha
         Gm5kKxETd60+3vZ0sLZDZfscDlKkMybYEZdppDPGBXoPSmCi/BRDYD1xoCQsoe/AM/qo
         Az+7whQ8+Lj6AvwKwJ7iBukgynDu87YdKvVn03GFwPiOi++7kHuRl06ZNzQQWgn/YzGl
         mW4g==
X-Gm-Message-State: AOAM5330ZBCOn4cpcgmFyc2OMkUnglcb8GSNxw1gZLgyHKGQsW6C6Mp/
        YY+BOmTyOKatTOQM9QrRKUJdCKPi8zkDaA==
X-Google-Smtp-Source: ABdhPJwrbQgLTxOgQlFU5bX78+v7ldLOyF3hWFP5vHH5M4umK4zp3wV0A930mhtcpMGEkOTz0z+7Sg==
X-Received: by 2002:a2e:a7d3:0:b0:253:edee:b0e with SMTP id x19-20020a2ea7d3000000b00253edee0b0emr9526006ljp.168.1653523146832;
        Wed, 25 May 2022 16:59:06 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u28-20020a056512041c00b0047255d21203sm9557lfk.306.2022.05.25.16.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 16:59:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [RFC PATCH v2 23/34] phy: qcom-qmp: move SC7180 USB PHY to new QMP driver
Date:   Thu, 26 May 2022 02:58:30 +0300
Message-Id: <20220525235841.852301-24-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220525235841.852301-1-dmitry.baryshkov@linaro.org>
References: <20220525235841.852301-1-dmitry.baryshkov@linaro.org>
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

Move support for the USB PHY driver on SC7180 platform to new QMP
driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 42 +++++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp.c     |  3 --
 2 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index d8a4b7774b49..8c4a01bdf359 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -565,6 +565,10 @@ static const char * const msm8996_usb3phy_reset_l[] = {
 	"phy", "common",
 };
 
+static const char * const sc7180_usb3phy_reset_l[] = {
+	"phy",
+};
+
 /* list of regulators */
 static const char * const qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll",
@@ -719,6 +723,41 @@ static const struct qmp_phy_usb_cfg qmp_v3_usb3phy_cfg = {
 	.has_phy_dp_com_ctrl	= true,
 };
 
+static const struct qmp_phy_usb_cfg sc7180_usb3phy_cfg = {
+	.base = {
+		.type			= PHY_TYPE_USB3,
+		.nlanes			= 1,
+
+		.serdes_tbl		= qmp_v3_usb3_serdes_tbl,
+		.serdes_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_serdes_tbl),
+		.tx_tbl			= qmp_v3_usb3_tx_tbl,
+		.tx_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_tx_tbl),
+		.rx_tbl			= qmp_v3_usb3_rx_tbl,
+		.rx_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_rx_tbl),
+		.pcs_tbl		= qmp_v3_usb3_pcs_tbl,
+		.pcs_tbl_num		= ARRAY_SIZE(qmp_v3_usb3_pcs_tbl),
+		.clk_list		= qmp_v3_phy_clk_l,
+		.num_clks		= ARRAY_SIZE(qmp_v3_phy_clk_l),
+		.reset_list		= sc7180_usb3phy_reset_l,
+		.num_resets		= ARRAY_SIZE(sc7180_usb3phy_reset_l),
+		.vreg_list		= qmp_phy_vreg_l,
+		.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+		.regs			= qmp_v3_usb3phy_regs_layout,
+
+		.start_ctrl		= SERDES_START | PCS_START,
+		.pwrdn_ctrl		= SW_PWRDN,
+		.phy_status		= PHYSTATUS,
+
+		.is_dual_lane_phy	= true,
+	},
+
+	.has_pwrdn_delay	= true,
+	.pwrdn_delay_min	= POWER_DOWN_DELAY_US_MIN,
+	.pwrdn_delay_max	= POWER_DOWN_DELAY_US_MAX,
+
+	.has_phy_dp_com_ctrl	= true,
+};
+
 static int qcom_qmp_phy_com_init(struct qmp_usb_phy *qphy_usb)
 {
 	struct qcom_qmp *qmp = qphy_usb->base.qmp;
@@ -1047,6 +1086,9 @@ static const struct of_device_id qcom_qmp_phy_usb_of_match_table[] = {
 	}, {
 		.compatible = "qcom,msm8998-qmp-usb3-phy",
 		.data = &msm8998_usb3phy_cfg,
+	}, {
+		.compatible = "qcom,sc7180-qmp-usb3-phy",
+		.data = &sc7180_usb3phy_cfg,
 	}, {
 		.compatible = "qcom,sdm845-qmp-usb3-phy",
 		.data = &qmp_v3_usb3phy_cfg,
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 3a308fcbe198..b4b5a22877ff 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -3323,9 +3323,6 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id,
 
 static const struct of_device_id qcom_qmp_phy_of_match_table[] = {
 	{
-		.compatible = "qcom,sc7180-qmp-usb3-phy",
-		.data = &sc7180_usb3phy_cfg,
-	}, {
 		.compatible = "qcom,sc7180-qmp-usb3-dp-phy",
 		/* It's a combo phy */
 	}, {
-- 
2.35.1

