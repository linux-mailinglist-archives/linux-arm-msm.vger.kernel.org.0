Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 599F366A513
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 22:21:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbjAMVVV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 16:21:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230411AbjAMVVG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 16:21:06 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5964288DD6
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 13:21:05 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id f34so34813307lfv.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 13:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tTQShJXOSeSWVAzHkEXUIIDyr/KPTLwtNcNNqe4LAsA=;
        b=myjxbRmS1er0kDxiwYviTZnZGssUomNTifZxwW+sOutYQsz9WyTTPFeIZv738IWb3g
         jtByFcnXEF3frxswGxVRFhlkqcznxpJ91plj4yHXRQ4ZLsIIxLCetrqT1Tm0F6UCljKU
         MgKpUgWUwJs4Iysf3BaEXTClHhdSBxE1gwC3T/0yrH96T85g1G7m2T8lJiinToKZG9zg
         h/fTkPsu/7BXgdDAI/7dkjq/gN2plYN0ayAxvHKX3l6jvqXIazP4v1YpKpY8VVr/sv6L
         MOp9R2rex9KVFfU89bLPeUd5RSutuPQ3B4ZtIJyYeT976h7aB9MG/WGg2+DjQxmyAVCe
         oq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tTQShJXOSeSWVAzHkEXUIIDyr/KPTLwtNcNNqe4LAsA=;
        b=dhvsmoY1Pi8CYexAaTf2BO7kOBYN9iB4rBLTAmJqMbg5xLQAQDVPHd60vTMdiQIIrD
         6aUDzKBkE/YjPGfSOyfdo8DIQeL7gHLRGWKlvAfhHUTvKxaxxE/DPm0IqqylLcyG/1hR
         8oszFfWdyh0s2o3olX5qVglplhYb7pXp8a2szXKo2eH7L98scU1nZNmsqrU4TVp9u3wd
         NPUQcZrWy91mULLuR9S7oxnZnHentd0vBfQDnqb2+gPnflWG1jKfwGKAk/FeV+5jOH8r
         Qcsq4kL1vluVEBCx4mjyR9EkB0/uxU8wdj85h/3suEMK8jvAj5FQNWHmxQ6EYVtnZEfj
         W6zg==
X-Gm-Message-State: AFqh2kr2/mKQhCMslAGgEQcThiCF+O+dwneJIYoXSHFfMW2Dp/lhMKqD
        U2lcP8vZOusn3i0sFom9f/4Klw==
X-Google-Smtp-Source: AMrXdXuoTqOsnf22kuXjsZrWlNrjinyvm7Q8uvjT9bfULjz2v2DgkY13vt1SJ7xm+YeZdMSLF8mbuQ==
X-Received: by 2002:a05:6512:2302:b0:4a4:68b8:f4f1 with SMTP id o2-20020a056512230200b004a468b8f4f1mr28746817lfu.55.1673644863739;
        Fri, 13 Jan 2023 13:21:03 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t24-20020ac25498000000b004d39af98b04sm80602lfk.19.2023.01.13.13.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 13:21:03 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH 1/2] phy: qcom-qmp-combo: remove QPHY_PCS_LFPS_RXTERM_IRQ_STATUS reg
Date:   Fri, 13 Jan 2023 23:21:01 +0200
Message-Id: <20230113212102.421491-1-dmitry.baryshkov@linaro.org>
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

The QPHY_PCS_LFPS_RXTERM_IRQ_STATUS register is not used, remove it from
register layout.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 521ea3ce6b83..ee35bcd2bdb5 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -59,9 +59,6 @@
 /* QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR register bits */
 #define IRQ_CLEAR				BIT(0)
 
-/* QPHY_PCS_LFPS_RXTERM_IRQ_STATUS register bits */
-#define RCVR_DETECT				BIT(0)
-
 /* QPHY_V3_PCS_MISC_CLAMP_ENABLE register bits */
 #define CLAMP_EN				BIT(0) /* enables i/o clamp_n */
 
@@ -99,7 +96,6 @@ enum qphy_reg_layout {
 	QPHY_PCS_STATUS,
 	QPHY_PCS_AUTONOMOUS_MODE_CTRL,
 	QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR,
-	QPHY_PCS_LFPS_RXTERM_IRQ_STATUS,
 	QPHY_PCS_POWER_DOWN_CONTROL,
 	/* Keep last to ensure regs_layout arrays are properly initialized */
 	QPHY_LAYOUT_SIZE
@@ -112,7 +108,6 @@ static const unsigned int qmp_v3_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_POWER_DOWN_CONTROL]	= 0x04,
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= 0x0d8,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR]  = 0x0dc,
-	[QPHY_PCS_LFPS_RXTERM_IRQ_STATUS] = 0x170,
 };
 
 static const unsigned int qmp_v4_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
-- 
2.39.0

