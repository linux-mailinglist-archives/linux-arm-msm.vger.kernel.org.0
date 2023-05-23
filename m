Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0582370DBD4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 13:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbjEWL5B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 07:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbjEWL5A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 07:57:00 -0400
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63F25119
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 04:56:59 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2af2b74d258so45592921fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 04:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684842958; x=1687434958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8zAW8Q5S5rXjdmwhdT0daKqhZraK7B5DKGDiP4be9+o=;
        b=xZfiKPMNUc7Ut/YI6/ewXndUQ0oiSy8UR1G+OnXfueF0vQVXCEeZlea4FiKyabcS7D
         BIRW2GqXm8lecbKQuFT4j4Avd99hXl1Z6eASSc4hQLe1PKDBPGth0I+W4ZrTOeeMEHOJ
         pw7YaRxBQBO+BdLKAQAKY/0Y5PcD/i1N89hSDMczWP/YWnsamOKsgPAIqLoYRYWFB2mn
         DSSE0FFwVUAeTGhK+7agjtcGr0gZRyacvNiGYixiq1RLuSHmv9sfUrXP2zChB4TBhlUT
         xWBnuzuf/Pol+0gHO+YqQY6zzrGk5xYuAksds/7ZlYMZofBDgx0ykklTUOA1Sg1dtMGE
         mD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684842958; x=1687434958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8zAW8Q5S5rXjdmwhdT0daKqhZraK7B5DKGDiP4be9+o=;
        b=Qflk2nwaRholNdYKUKHpGt0FaPr/yXKh6QAb8XVTmNY/GganUm7rJ2MDHeqO64gpyU
         9ZqPuHynCCBjbhcRSPrxJqkHok35MjbjJf/c7fLtKmp9vOesfQlo0aI7OgIuMoyJd8IL
         jksiTcMn4Xgn8qhKhXGOEW30ese901NFOSv8j11vDJN09plrAV9Wc7ezMivloiCRuRWU
         SbKqvnhQ5kXL/t3pL3yMxbhOdcJb5itKFUJg9t/4+ndIMUro8RJPjX/n1gMdXoTSrzhF
         Z+S9CuIu0ahLgf06u8JngBH9gLcK48XJKSjIiQzmOhv3nKF8QiVdbp2z8L/pdMkACBuH
         JkTA==
X-Gm-Message-State: AC+VfDwH5MlAXs1V4jmqr7XrmzacLterzkGH3EhOWnnh/nuHIsKIWiCH
        LTHTijOslNM6s/59bOjxORMjfA==
X-Google-Smtp-Source: ACHHUZ4RUSdkgR3aBpWxg/ICRjbkfam0oSMXvo9mqukxpwQaSjC3XWCHJ9x8Onb/kSokgWfQ3iCcbg==
X-Received: by 2002:a2e:9213:0:b0:2ad:9c26:3638 with SMTP id k19-20020a2e9213000000b002ad9c263638mr5720015ljg.52.1684842957660;
        Tue, 23 May 2023 04:55:57 -0700 (PDT)
Received: from eriador.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 4-20020a05651c008400b002aa42d728d9sm1585350ljq.36.2023.05.23.04.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 04:55:56 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH] phy: qcom-snps: Fix kerneldoc warning
Date:   Tue, 23 May 2023 14:55:56 +0300
Message-Id: <20230523115556.3460131-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Ad ddocumentation to the update_seq_cfg to fix the kerneldoc warning:

drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c:136: warning: Function parameter or member 'update_seq_cfg' not described in 'qcom_snps_hsphy'

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index a59063596214..6fe442d0241b 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -120,6 +120,7 @@ struct phy_override_seq {
  * @vregs: regulator supplies bulk data
  * @phy_initialized: if PHY has been initialized correctly
  * @mode: contains the current mode the PHY is in
+ * @update_seq_cfg: PHY configuration bits
  */
 struct qcom_snps_hsphy {
 	struct phy *phy;
-- 
2.39.2

