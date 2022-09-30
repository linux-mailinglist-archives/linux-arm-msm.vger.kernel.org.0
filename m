Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 216005F0AB8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 13:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231824AbiI3Lie (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 07:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231697AbiI3LiI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 07:38:08 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B83FDE9A
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 04:29:36 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id z4so6425518lft.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 04:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ywPURN4VYg+vJJI8R5DDKnw7r6+Bfy4waBxowe0Czt4=;
        b=UC1DZla4usi26TSgEsWh3l9nOmOC9NxMBRp2p7axMMrR5DFS7ZfvjfuGAXSVSovqF1
         pbqAW3k+BYDihVjDidATGcnFwvi46JiuXkfrdlWDdfekXhwqQJeOYSzMA0r7e/gmg44K
         +yJo7+PrkFb6F38gVbQo59DZ9yY5o6ZK50CtCHOMUlTE3diGZ923atpf6pjHurTFlDwu
         gey+bs+aNLHljwwtplHWqRM0iEW4GjpEPsZigYMAHmiuK0OzfqnUPvpKkvzW+nu65RTH
         lyStgNhhHi6S8SMKRB32dQKcRhAW5OdTpwsqf25ygNHALWpmWw6asCfsk5Hrp+JbWAEB
         v6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ywPURN4VYg+vJJI8R5DDKnw7r6+Bfy4waBxowe0Czt4=;
        b=il3jpQtmUceUZyinTwiji0jM1gMaFl+ZsanP+OXSwORZ0Uunk0vLfgl+ErCkqmwGre
         h8y+pOaIn508DbHU1Wjr7xYpii4q4CyeQUkkpFMYcDR2XsSwoTqYXeIvHnPmS9ogFiYH
         PNCd/k0Mm6WKC6TVTwRN6I2wDw9qgdR9C8PgLWM7BlwDCAginhR0/c35dCVcbuWoimUj
         2dhCntmNVAFhBn7077pRmN0JeRmYwP68CTSxm4X5QpmGVGIzGRaGn2NqYkiE3XeKhLNm
         7R5+NmEbopmGjFWP9kCwte/rtJHinqd1ywKincEM9nSjHqDseHXKUo03t9NlwmYJAmFG
         GpTg==
X-Gm-Message-State: ACrzQf2S1/y8Rj6RScgGsA2ml+58VN7Wv5WpciLd7fbC47bkcKdglHdy
        Ca1/hYXl9Nq1eZ19o4N0iufjTA==
X-Google-Smtp-Source: AMsMyM7yIKT555uXSeTBk5QSsk2PaeYCtcm7Vu9W+6uYkL+t6s1X293nuRRqMzKgBeNECNg1Trts3g==
X-Received: by 2002:a05:6512:3994:b0:4a2:1a0a:15e8 with SMTP id j20-20020a056512399400b004a21a0a15e8mr73830lfu.501.1664537374077;
        Fri, 30 Sep 2022 04:29:34 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v18-20020a197412000000b0049493c14b17sm264672lfe.181.2022.09.30.04.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 04:29:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 08/12] phy: qcom-qmp-usb: remove QPHY_PCS_MISC_TYPEC_CTRL reg
Date:   Fri, 30 Sep 2022 14:29:22 +0300
Message-Id: <20220930112926.638543-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220930112926.638543-1-dmitry.baryshkov@linaro.org>
References: <20220930112926.638543-1-dmitry.baryshkov@linaro.org>
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

The QPHY_PCS_MISC_TYPEC_CTRL register is not used, remove it from
register layout.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
index 9d112aa34ba3..0b5015c7bd19 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usb.c
@@ -109,8 +109,6 @@ enum qphy_reg_layout {
 	QPHY_PCS_AUTONOMOUS_MODE_CTRL,
 	QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR,
 	QPHY_PCS_POWER_DOWN_CONTROL,
-	/* PCS_MISC registers */
-	QPHY_PCS_MISC_TYPEC_CTRL,
 	/* Keep last to ensure regs_layout arrays are properly initialized */
 	QPHY_LAYOUT_SIZE
 };
@@ -151,7 +149,6 @@ static const unsigned int qcm2290_usb3phy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_PCS_AUTONOMOUS_MODE_CTRL]	= 0xd8,
 	[QPHY_PCS_LFPS_RXTERM_IRQ_CLEAR] = 0xdc,
 	[QPHY_PCS_STATUS]		= 0x174,
-	[QPHY_PCS_MISC_TYPEC_CTRL]	= 0x00,
 };
 
 static const struct qmp_phy_init_tbl ipq8074_usb3_serdes_tbl[] = {
-- 
2.35.1

