Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5ED1DFC65
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2020 04:14:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388297AbgEXCOE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 May 2020 22:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388278AbgEXCOD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 May 2020 22:14:03 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13BD7C05BD43
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2020 19:14:03 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id 205so1565184qkg.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2020 19:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SQG1405vlMxJB5LTufwruUYPH565hE4parz44qc1FEU=;
        b=b6xr7DEnaNELcP00re+6JPwISuERG1NNsUpdysV3vGKQRaFU48OCrb8h616HGV9gLM
         hajhXubDPUCJ9iRtZeWNqksEuv2q6RdR891HAipSOmu6dKvQsPn4C+Z8rV3Tr96IMiiu
         DCZRswv3ch2JVZ1ik8y5xWDuxH0Ad628haAstGBWM0am5vZaKRXNCUbWsmE4sFCmJWMD
         y7bB4qVNEp3NTyP0DYLm2MQA4hcO+3MSzePeg5goB0iBR9/M6tjCy1x3Caqzm1rDyn4f
         vQAX9zEpZXODXgjP7TOGKjDJEdBIXklXHDUoKVfdOYcQiu2ITHraTy/rjlg5/W66Gq3p
         /JtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SQG1405vlMxJB5LTufwruUYPH565hE4parz44qc1FEU=;
        b=V8onh0PwbcCDmEjM9lkCisI+4HCZLFVmhamHSWwm5crF8FOq73R6d3JSGECT8BMIMU
         4/FliepJ3IegKi69N+WWi3nrhgkN7kFQbmUXPjwTB38lW+U8Ixn0kEhTZUAWOpwpzboJ
         B7DByqdbq2PEA762WrV56BDE9ACer5fhq2HM1OL5cXnU4cyT4wIg9sklSFAZGAs4Whdn
         xYY5cBTuJpF+ufIm0Jm5urWHsb6DcwjZju/wPuK8WM8fN8IgH46KZ/AHPN1Yul2tMMen
         Cv2las9QeQdyQD+0r19fMhVOJZaiKLjnjFmD7XfNcM0KTVIAAihPBwIoM/LXlAUXSQ3J
         taYA==
X-Gm-Message-State: AOAM530zmPTEKALhEzgpb43qwEcybPnvhBoGEcXWgQcJsJGLFgH8+3ul
        ydRSdxTTocsTPxc+wbriaPZ4//nDNnY=
X-Google-Smtp-Source: ABdhPJxw7PcLq/tSQe54mBTqx+UcuW46bAp2/c0vfel4RD31ZWeZHjOh/owF55EUvVLHvY60fPFbUA==
X-Received: by 2002:a37:4e81:: with SMTP id c123mr20852532qkb.467.1590286442086;
        Sat, 23 May 2020 19:14:02 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id t189sm1625501qkc.87.2020.05.23.19.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2020 19:14:01 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        linux-kernel@vger.kernel.org (open list:GENERIC PHY FRAMEWORK)
Subject: [PATCH 1/3] phy: qcom-qmp: Allow different values for second lane
Date:   Sat, 23 May 2020 22:14:13 -0400
Message-Id: <20200524021416.17049-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200524021416.17049-1-jonathan@marek.ca>
References: <20200524021416.17049-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The primary USB PHY on sm8250 sets some values differently for the second
lane. This makes it possible to represent that.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 52 ++++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index e91040af3394..b3e07afca3ca 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -82,20 +82,34 @@ struct qmp_phy_init_tbl {
 	 * register part of layout ?
 	 * if yes, then offset gives index in the reg-layout
 	 */
-	int in_layout;
+	bool in_layout;
+	/*
+	 * mask of lanes for which this register is written
+	 * for cases when second lane needs different values
+	 */
+	u8 lane_mask;
 };
 
 #define QMP_PHY_INIT_CFG(o, v)		\
 	{				\
 		.offset = o,		\
 		.val = v,		\
+		.lane_mask = 0xff,	\
 	}
 
 #define QMP_PHY_INIT_CFG_L(o, v)	\
 	{				\
 		.offset = o,		\
 		.val = v,		\
-		.in_layout = 1,		\
+		.in_layout = true,	\
+		.lane_mask = 0xff,	\
+	}
+
+#define QMP_PHY_INIT_CFG_LANE(o, v, l)	\
+	{				\
+		.offset = o,		\
+		.val = v,		\
+		.lane_mask = l,		\
 	}
 
 /* set of registers with offsets different per-PHY */
@@ -1986,10 +2000,11 @@ static const struct qmp_phy_cfg sm8150_usb3phy_cfg = {
 	.is_dual_lane_phy	= true,
 };
 
-static void qcom_qmp_phy_configure(void __iomem *base,
-				   const unsigned int *regs,
-				   const struct qmp_phy_init_tbl tbl[],
-				   int num)
+static void qcom_qmp_phy_configure_lane(void __iomem *base,
+					const unsigned int *regs,
+					const struct qmp_phy_init_tbl tbl[],
+					int num,
+					u8 lane_mask)
 {
 	int i;
 	const struct qmp_phy_init_tbl *t = tbl;
@@ -1998,6 +2013,9 @@ static void qcom_qmp_phy_configure(void __iomem *base,
 		return;
 
 	for (i = 0; i < num; i++, t++) {
+		if (!(t->lane_mask & lane_mask))
+			continue;
+
 		if (t->in_layout)
 			writel(t->val, base + regs[t->offset]);
 		else
@@ -2005,6 +2023,14 @@ static void qcom_qmp_phy_configure(void __iomem *base,
 	}
 }
 
+static void qcom_qmp_phy_configure(void __iomem *base,
+				   const unsigned int *regs,
+				   const struct qmp_phy_init_tbl tbl[],
+				   int num)
+{
+	qcom_qmp_phy_configure_lane(base, regs, tbl, num, 0xff);
+}
+
 static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
@@ -2219,16 +2245,18 @@ static int qcom_qmp_phy_enable(struct phy *phy)
 	}
 
 	/* Tx, Rx, and PCS configurations */
-	qcom_qmp_phy_configure(tx, cfg->regs, cfg->tx_tbl, cfg->tx_tbl_num);
+	qcom_qmp_phy_configure_lane(tx, cfg->regs,
+				    cfg->tx_tbl, cfg->tx_tbl_num, 1);
 	/* Configuration for other LANE for USB-DP combo PHY */
 	if (cfg->is_dual_lane_phy)
-		qcom_qmp_phy_configure(qphy->tx2, cfg->regs,
-				       cfg->tx_tbl, cfg->tx_tbl_num);
+		qcom_qmp_phy_configure_lane(qphy->tx2, cfg->regs,
+					    cfg->tx_tbl, cfg->tx_tbl_num, 2);
 
-	qcom_qmp_phy_configure(rx, cfg->regs, cfg->rx_tbl, cfg->rx_tbl_num);
+	qcom_qmp_phy_configure_lane(rx, cfg->regs,
+				    cfg->rx_tbl, cfg->rx_tbl_num, 1);
 	if (cfg->is_dual_lane_phy)
-		qcom_qmp_phy_configure(qphy->rx2, cfg->regs,
-				       cfg->rx_tbl, cfg->rx_tbl_num);
+		qcom_qmp_phy_configure_lane(qphy->rx2, cfg->regs,
+					    cfg->rx_tbl, cfg->rx_tbl_num, 2);
 
 	qcom_qmp_phy_configure(pcs, cfg->regs, cfg->pcs_tbl, cfg->pcs_tbl_num);
 	ret = reset_control_deassert(qmp->ufs_reset);
-- 
2.26.1

