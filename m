Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF4E66A9DC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jan 2023 08:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbjANHLs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Jan 2023 02:11:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbjANHLQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Jan 2023 02:11:16 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C461159EA
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 23:10:53 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id c6so25578718pls.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 23:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5raPJrrsiQNPD02gu+jM1wjv6y1XVqaQRDV5bGNbhh4=;
        b=p93XF7t971NizNHgDlkNAcXMBDwlYMIDyahoGu8el0mdBGeTFmMCPEFCasywcKuw58
         EzsNhp5SQC4Eo62DTJPRxkn+6agtWKT1wrzTkVMenFoxU0dty9T1pBTzQEeNSGG0obZW
         IFu2dEQMBzTpcDcVBWTU9hrjKYO4ylz3uNBACMZl3lZiWIJMeg3gU57TZmS/UchTeH97
         x33m6G8Hpr3Yl+tEvV8UriL1h1zpyCJ878J4Jb/E59EKgaM5VQ71YzdFP28KEpHLKJAj
         dZGkOcCWtinxOx5G1yUNG/SElmPfSpmX3U3IJO4PoaxZSCJ9bqMHJ8gujS7xdjbE8DZi
         rBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5raPJrrsiQNPD02gu+jM1wjv6y1XVqaQRDV5bGNbhh4=;
        b=woYYql/tvZZtMrW9Ca5NQ/rExeeumZNmmhGfpUzS2tBxT28cBlIiejOMwuZvvdIlAo
         VZM/LFcRqvHg5QnZyrV4UxyPCOlwUbUqaokoauXm0Ysu4a0BsfMk4FSaa8R5Ax+owohY
         KBMYwXPkTuvyHZtjm1C6g2kO2r9zNM/0h/3KVvPzT1/7aCeQbiSZ7JeUjUFqrXeyn9FE
         gsozRtUZhOiRFJSLS9Qa0cCIqnFMsGgqoKjuykqqfhAbbLTTpuOd/EYdKt3YsImY4bvT
         Tc0dPcaYrrx2nr0LB1TWmKTD4zXvc517Ua53Ff5OV9QgSFTn+MYcuJKMWGYXkE2ychRY
         vHWA==
X-Gm-Message-State: AFqh2krc0mt6AOZMwvDH/JkD3XnmAWhz7orJx6ps98NVODdFSbBprFg8
        5+aD0vpy8g9/eU5oxG1SyiPL
X-Google-Smtp-Source: AMrXdXv1NX1zhWx+3yhYc6dTdtOwsnyRUF53uLkgQaxS5LEkQgK2uYFakIHFK0qaHmGVp3Km14M+CQ==
X-Received: by 2002:a17:902:ce0b:b0:194:4a85:b72c with SMTP id k11-20020a170902ce0b00b001944a85b72cmr16282818plg.32.1673680253206;
        Fri, 13 Jan 2023 23:10:53 -0800 (PST)
Received: from localhost.localdomain ([220.158.159.156])
        by smtp.gmail.com with ESMTPSA id q10-20020a170902e30a00b00192a04bc620sm15225358plc.295.2023.01.13.23.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 23:10:52 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     vkoul@kernel.org
Cc:     andersson@kernel.org, quic_cang@quicinc.com,
        quic_asutoshd@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@linaro.org, ahalaney@redhat.com,
        abel.vesa@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v6 09/12] phy: qcom-qmp-ufs: Avoid setting HS G3 specific registers
Date:   Sat, 14 Jan 2023 12:40:06 +0530
Message-Id: <20230114071009.88102-10-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230114071009.88102-1-manivannan.sadhasivam@linaro.org>
References: <20230114071009.88102-1-manivannan.sadhasivam@linaro.org>
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

SM8350 default init sequence sets some PCS registers to HS G3, thereby
disabling HS G4 mode. This has the effect on MPHY capability negotiation
between the host and the device during link startup and causes the
PA_MAXHSGEAR to G3 irrespective of device max gear.

Due to that, the agreed gear speed determined by the UFS core will become
G3 only and the platform won't run at G4.

So, let's remove setting these registers for SM8350 as like other G4
compatible platforms. One downside of this is that, when the board design
uses non-G4 compatible device, then MPHY will continue to run in the
default mode (G4) even if UFSHCD runs in G3. But this is the case for
other platforms as well.

Tested-by: Andrew Halaney <ahalaney@redhat.com> # Qdrive3/sa8540p-ride
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 152b1b367df3..421359ca62ba 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -572,13 +572,6 @@ static const struct qmp_phy_init_tbl sm8350_ufsphy_pcs[] = {
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_MID_TERM_CTRL1, 0x43),
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_DEBUG_BUS_CLKSEL, 0x1f),
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_RX_MIN_HIBERN8_TIME, 0xff),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_PLL_CNTL, 0x03),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TIMER_20US_CORECLK_STEPS_MSB, 0x16),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TIMER_20US_CORECLK_STEPS_LSB, 0xd8),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_PWM_GEAR_BAND, 0xaa),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_HS_GEAR_BAND, 0x06),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_TX_HSGEAR_CAPABILITY, 0x03),
-	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_RX_HSGEAR_CAPABILITY, 0x03),
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_RX_SIGDET_CTRL1, 0x0e),
 	QMP_PHY_INIT_CFG(QPHY_V5_PCS_UFS_MULTI_LANE_CTRL1, 0x02),
 };
-- 
2.25.1

