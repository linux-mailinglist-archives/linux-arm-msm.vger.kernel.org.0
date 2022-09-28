Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4605EE9EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 01:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbiI1XK1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 19:10:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234105AbiI1XKV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 19:10:21 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 945A31CFD7
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:18 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id a8so22520464lff.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 16:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=zMMGoH9a62qEXJH7nGUhfedtajCJtrxrT8pB32VPuOk=;
        b=NM9TMNrpl1TpmPbGEjhFpEBqy3VHdMiupl6msViH9Gq2twHm6I5Er1sQDWxqMbN6Bp
         LcKp95kudjWnqw66sZLb6m1JyPqTYIpsgdIz7nw+VBXyWZ7lm7ltzRYOzeRWwJBryumi
         ih1Dj3skEBBunDWvp8w6d0eH+pEkcpcNTp3z0LmA01+rV1DcTBZgElW/ENL991f4/Gl5
         2B2LpiFDfvAewGG+bD4Iq/hACqJ2qST/gnl2ET+ELFNHVSZZ0OdljWtE+lW8bwLXTo7i
         TO+oN40NC3StvYlZxOoZhp34OrVdEPMYjX+FqIF/vpvhfNBuel1xRJdgYYvxPz/x73hl
         Wheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=zMMGoH9a62qEXJH7nGUhfedtajCJtrxrT8pB32VPuOk=;
        b=ELkE5RDvsYemmRPiysGI95WSBUrQeFzJQsNGPxBJFSef0uhso4JyFsmBygVgESJTps
         FsMyCbQYptoB7djF+9lQlQ9EfhAzO71077QD/RFqvOfs1lbRDyMRRiv0V5hYarT9vdoN
         YVIuIB3axQNWT8bYI0ZtZ2WKQGnntTBKygqe1PuNcidrML8aWFZs3nbB6jj8gH9NRmpm
         hEFs2HKtQDBAKxnApIrLVAOZBjJKeKT4Ma40uiskalhuSrO/iFbIpAoJrkq5Q9JJYXUs
         PLLY2cUa7DgxMrC876Ni3BwlBXR/Rt++KqsypxjdEnEyRiNX1LJ82hODe1dirlceCs/c
         KI/w==
X-Gm-Message-State: ACrzQf2ln0Y3NKZGH2kRuO/S2KvquQyjXJ628wN3kCBNRjLhwUVeDoke
        Q/a5Qq2BpZ87PThwXcIxSYeOtA==
X-Google-Smtp-Source: AMsMyM7K9PDwBf5JZFMANt6kqnHCahYoAmbrRrYk2tMnL4Y1jJtyhlGgZvp5OtMVkYxS3bTwM4RrYQ==
X-Received: by 2002:a05:6512:3b0:b0:49f:d530:9f52 with SMTP id v16-20020a05651203b000b0049fd5309f52mr119774lfp.646.1664406616973;
        Wed, 28 Sep 2022 16:10:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o16-20020ac24950000000b0049d5733fb3fsm597587lfi.212.2022.09.28.16.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 16:10:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 01/18] phy: qcom-qmp-pcie: drop unused common-block registers
Date:   Thu, 29 Sep 2022 02:09:57 +0300
Message-Id: <20220928231014.455201-2-dmitry.baryshkov@linaro.org>
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

Drop the common-block register defines that are unused since the QMP
driver split.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Reviewed-by: Dmitry Baryshkov<dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 7aff3f9940a5..7710e4dee39c 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -77,11 +77,6 @@ struct qmp_phy_init_tbl {
 
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
@@ -99,10 +94,6 @@ static const unsigned int ipq_pciephy_gen3_regs_layout[QPHY_LAYOUT_SIZE] = {
 };
 
 static const unsigned int pciephy_regs_layout[QPHY_LAYOUT_SIZE] = {
-	[QPHY_COM_SW_RESET]		= 0x400,
-	[QPHY_COM_POWER_DOWN_CONTROL]	= 0x404,
-	[QPHY_COM_START_CONTROL]	= 0x408,
-	[QPHY_COM_PCS_READY_STATUS]	= 0x448,
 	[QPHY_SW_RESET]			= 0x00,
 	[QPHY_START_CTRL]		= 0x08,
 	[QPHY_PCS_STATUS]		= 0x174,
-- 
2.35.1

