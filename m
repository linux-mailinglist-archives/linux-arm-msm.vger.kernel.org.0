Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6912166A3C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 20:55:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbjAMTzZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 14:55:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230397AbjAMTzV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 14:55:21 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F40C287F3B
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 11:55:18 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id bp15so34538283lfb.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 11:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9oeSZuMYd3LT/X1OwhODYATjxB9rKtWVz8sj+tiVyDM=;
        b=s8Xuhkn6J3YR0r9ytJG+bvRtWlfjL2HMGuRaAs7PZNcUpwIMe6Mkfz+O/BB+Z8F2K8
         dV4bTJGmPEd3FqaEXFxmv8jlSymaPrpacDLL0NUpZcYz5GP2K8eOg81cvlf3m8kjKJc9
         wHS9RnQojaU1392xafWiYvzGJG5VLgOhr0kxnF+nL6Q8FDZRCWMXgUnGYSVksR4M5ay5
         Din/RF1J/fNsTY0gy74uvfG0zy+XyoomPAjSP1/fgZVt/UZqdBpNFNqZ6wZ3L/c53bDz
         tAGmHwwoyMu04kg+GanVStuBJ/Y/Os9e3AwR3UVUw++K6x0zX7NLEryUNZnJp1wPj6A1
         SMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9oeSZuMYd3LT/X1OwhODYATjxB9rKtWVz8sj+tiVyDM=;
        b=lCVOcBEIAtmBeI9UkEAqb+On9kqd+bQFUiJFiRIFDAmXwEYmsBE818g8ThJSCioz3s
         ilnBtQ9rQejXq4D8V3mb6B7kWu/x0giZvCUMukjZTixEi9J2XT6CfHIS8yifVjU+1XQc
         bMtyx5V6ANR10KPM5mSTSOXfgJuRlLSFxeYVBPzXm6WE67pjD1NHWayaEh+XQxVXk/5b
         SIC4FVZeE+c38RazQq0vnoOidfPTylzImaLna1Oyg/PMBkPhCBKZNrQLBlJ07NApQRaX
         SdG6s7xYQ2MAb6rh6cH4gFJeXPuVt8dlKpDtV7s3zFL9wswQFIAe10P8g9k5vcXDwVaC
         y8bQ==
X-Gm-Message-State: AFqh2kp2LYmcLzbEAk/SY/Wz+VfEs6X2RvFUrJ8uPIpCMXK9fzKpx9ff
        nhapjB5jNrm6NaW2Rywt9lUIfg==
X-Google-Smtp-Source: AMrXdXtOMhPcxZbViTRDR5rm438/yzfLeEWOC1d3C55CfWj1jPzEPgX8IGxx6d72TAe3R8s8COhfTQ==
X-Received: by 2002:a19:8c51:0:b0:4b6:ed1d:38e9 with SMTP id i17-20020a198c51000000b004b6ed1d38e9mr316540lfj.64.1673639717301;
        Fri, 13 Jan 2023 11:55:17 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q21-20020a0565123a9500b004d272bf56b5sm193904lfu.223.2023.01.13.11.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 11:55:16 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH] phy: qualcomm: qmp-ufs: rename qmp_ufs_offsets_v5 to qmp_ufs_offsets
Date:   Fri, 13 Jan 2023 21:55:15 +0200
Message-Id: <20230113195515.407866-1-dmitry.baryshkov@linaro.org>
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

All currently known QMP UFS PHYs have the same offsets for register
sub-regions. Instead of using qmp_ufs_offsets_v5 for older generations
of PHYs, rename the offsets struct instance to remove _v5 suffix.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index d2f3cba625b8..72eb37669e6c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -625,7 +625,7 @@ static const char * const qmp_phy_vreg_l[] = {
 	"vdda-phy", "vdda-pll",
 };
 
-static const struct qmp_ufs_offsets qmp_ufs_offsets_v5 = {
+static const struct qmp_ufs_offsets qmp_ufs_offsets = {
 	.serdes		= 0,
 	.pcs		= 0xc00,
 	.tx		= 0x400,
@@ -658,7 +658,7 @@ static const struct qmp_phy_cfg msm8996_ufs_cfg = {
 static const struct qmp_phy_cfg sc8280xp_ufsphy_cfg = {
 	.lanes			= 2,
 
-	.offsets		= &qmp_ufs_offsets_v5,
+	.offsets		= &qmp_ufs_offsets,
 
 	.serdes_tbl		= sm8350_ufsphy_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(sm8350_ufsphy_serdes_tbl),
@@ -698,7 +698,7 @@ static const struct qmp_phy_cfg sdm845_ufsphy_cfg = {
 static const struct qmp_phy_cfg sm6115_ufsphy_cfg = {
 	.lanes			= 1,
 
-	.offsets		= &qmp_ufs_offsets_v5,
+	.offsets		= &qmp_ufs_offsets,
 
 	.serdes_tbl		= sm6115_ufsphy_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(sm6115_ufsphy_serdes_tbl),
-- 
2.39.0

