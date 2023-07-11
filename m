Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C146474F2B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 16:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233011AbjGKOwA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 10:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231739AbjGKOv7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 10:51:59 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89E4DE6F
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:51:57 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b701e41cd3so95349641fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689087116; x=1691679116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwpWca9CgyQ35ZSWhMi/urF0BbUmz+aNWYsuyPPGirk=;
        b=B5WpYTbTZlwh8+GVpCU6O/Qv4Dffba2h9NL3e/l8kawk4hWNyqHOFcLpy3K/1WoBCU
         U5GSpLs7Tqr67ASi66weG8CDza7OX3OIWU/aPr539ynV3E/Nvhk8pTukLBtbFBv9WVI7
         2IC1BOQWZ+La1k79bVk2j+TK1pyw9ACo/wK2NFyOzuntcVTTie9n/rLYn/p7kwmOT4s8
         SbBNXjX6+wRxgYx/avb74Zw94jSBWZtzyRvxnuhw4ukmwAFTyz25aLqCcLU0yLgoiP6r
         aRcLmov7YlKdZortU5SxkHo7zSn7uPZ/409mv4BkWKZw0+ocL+ub5W3//6xb5k8aB6s0
         eDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689087116; x=1691679116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DwpWca9CgyQ35ZSWhMi/urF0BbUmz+aNWYsuyPPGirk=;
        b=DKAs2ukyLgpN1hoyQunGpXY42DVRF2bKxYl+BSVZb4tepQg5ipCWL3/awTC4nKvnsP
         HiQCYBcrrZo9T4p8yya8olbpFUE39AK2I5ARMoTIGDF4Wy8gxyQ80eD37mobwTXnyJpw
         t3CBUWj6v14MD/qtG/L+SZX076c2UJCi8c4dRnXpVEdCuyR2WO2vkGstn3egJaasSL6C
         NtPX4iGORu2PG34EWi20NyIf2DYSwXe+LbtzE18HT2/2YmTQEoOFMRbCArhAuc6DlsiC
         rYj2Q6027hc3mmb3GDAsGvrA1k4en1yCLIVHToHdtwhWW3cDMx/ocs1+YmaCWqNP3bI3
         pZ9A==
X-Gm-Message-State: ABy/qLbrA3mJtat/ZAjMJWeXdlm5GcVqZ9DkYvYqRmzTdux3GTUDLQ+M
        yv6/CszWnNVHrYSsZUE60gCnjw==
X-Google-Smtp-Source: APBJJlFSi+OhNwfp7UHazwbounYgkkhI7fbQnOcsPDpQUISsmRs0wwGppsyd50YDka3uxhRVFQDIZA==
X-Received: by 2002:a2e:9d16:0:b0:2b6:e9e6:b50b with SMTP id t22-20020a2e9d16000000b002b6e9e6b50bmr12626013lji.25.1689087115708;
        Tue, 11 Jul 2023 07:51:55 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a10-20020a2eb16a000000b002b6ee363337sm492454ljm.120.2023.07.11.07.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 07:51:55 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v4 02/11] phy: qcom-qmp-ufs: populate offsets configuration
Date:   Tue, 11 Jul 2023 17:51:44 +0300
Message-Id: <20230711145153.4167820-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230711145153.4167820-1-dmitry.baryshkov@linaro.org>
References: <20230711145153.4167820-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Populate offsets configuration for the rest of UFS PHYs to make it
possible to switch them to the new (single-node) bindings style.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 8c877b668bb9..d99dc1043f74 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -833,6 +833,8 @@ static const struct qmp_ufs_offsets qmp_ufs_offsets_v6 = {
 static const struct qmp_phy_cfg msm8996_ufsphy_cfg = {
 	.lanes			= 1,
 
+	.offsets		= &qmp_ufs_offsets,
+
 	.tbls = {
 		.serdes		= msm8996_ufsphy_serdes,
 		.serdes_num	= ARRAY_SIZE(msm8996_ufsphy_serdes),
@@ -924,6 +926,8 @@ static const struct qmp_phy_cfg sc8280xp_ufsphy_cfg = {
 static const struct qmp_phy_cfg sdm845_ufsphy_cfg = {
 	.lanes			= 2,
 
+	.offsets		= &qmp_ufs_offsets,
+
 	.tbls = {
 		.serdes		= sdm845_ufsphy_serdes,
 		.serdes_num	= ARRAY_SIZE(sdm845_ufsphy_serdes),
@@ -1038,6 +1042,8 @@ static const struct qmp_phy_cfg sm8150_ufsphy_cfg = {
 static const struct qmp_phy_cfg sm8250_ufsphy_cfg = {
 	.lanes			= 2,
 
+	.offsets		= &qmp_ufs_offsets,
+
 	.tbls = {
 		.serdes		= sm8150_ufsphy_serdes,
 		.serdes_num	= ARRAY_SIZE(sm8150_ufsphy_serdes),
@@ -1070,6 +1076,8 @@ static const struct qmp_phy_cfg sm8250_ufsphy_cfg = {
 static const struct qmp_phy_cfg sm8350_ufsphy_cfg = {
 	.lanes			= 2,
 
+	.offsets		= &qmp_ufs_offsets,
+
 	.tbls = {
 		.serdes		= sm8350_ufsphy_serdes,
 		.serdes_num	= ARRAY_SIZE(sm8350_ufsphy_serdes),
@@ -1102,6 +1110,8 @@ static const struct qmp_phy_cfg sm8350_ufsphy_cfg = {
 static const struct qmp_phy_cfg sm8450_ufsphy_cfg = {
 	.lanes			= 2,
 
+	.offsets		= &qmp_ufs_offsets,
+
 	.tbls = {
 		.serdes		= sm8350_ufsphy_serdes,
 		.serdes_num	= ARRAY_SIZE(sm8350_ufsphy_serdes),
-- 
2.39.2

