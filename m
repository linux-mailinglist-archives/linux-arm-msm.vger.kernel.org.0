Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 017867388F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 17:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231712AbjFUP1Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 11:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbjFUP1X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 11:27:23 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E33691
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 08:27:22 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b45d7ec066so66324371fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 08:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687361240; x=1689953240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lxGS67E5F7LIYxIf1R7Yz2kDsTmvNbR9wS74p4KXsXM=;
        b=V9lZIK6uFE4tMf0QqO6KFt2IQ+ZgD8cBtfJ8UR3OutbVpRa1zqCoqtL/mU9YYrddSN
         Od2nLsaDxoEke4CFLNwcZYFdsomIPiKCAqgDvXpIf/6N4i18k1w0AauGS9cY+4ADzIkC
         O1rPFt3O1aOEW8PBS4Mwzotw4QgQ9x0v1LCY4Smgp6eyssjsNaQG49E3FrGsWDmAD3In
         NRUMebZ2WCmiCyPkPmHuVPiSEBkNvzUBBV4ZT3/KYY9QtbS2E15+W+871W2BxDZ4yCGD
         tcR8ONhy+zzBM0P/FW7yPH6bBa/iXSdjB/PoqwT1r0ULGtoAqAcuXLh1iF2n8OQszE6C
         Tbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687361240; x=1689953240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lxGS67E5F7LIYxIf1R7Yz2kDsTmvNbR9wS74p4KXsXM=;
        b=SdGzeBvoEq44HeOb4pCXxOgJSw1limt531WiCPzHWdSgTDbZHUtju+XbJ2DcdSqXcL
         x0J7ovD25ferFDNjoFXOZI8lxGAHTlYBBaKuuwmFQgB+DQv9bOzCz5fNqYQ9IFAyEI7Z
         DxQf9+GeHjR/1jgy5beV+81XuA53JHQkAX6hUy4UlNOaCdqSZyxmZQzMnAz6hYlbpQQN
         Vn6YaV2jRQSbWz1c3KGgWKHowubj9LTJPIyt2Oooqh08waxPCCfcbU3qogpTsdnNG4tk
         ESCYgHWCiJeEXmb0AS+CYcsERQg145GurY5jFPgcweDOU+WdtgnUuqPOGKCLJ2gBugrp
         MTQg==
X-Gm-Message-State: AC+VfDxBNIsooDWkGQoVouRt/PuV2nLYRtSYXcZmH+qpjFb9vL1lQu73
        Wt19ibMVkrehgVJ0x+MTcr6dyw==
X-Google-Smtp-Source: ACHHUZ6u7ScRV5sTyrJdQiLqv2QdANaIa6NTVDT6DIcDnYZFkG4YkgBkpIJRy5nhzz07EkG9CGdhPQ==
X-Received: by 2002:a2e:b5cc:0:b0:2b4:7500:3094 with SMTP id g12-20020a2eb5cc000000b002b475003094mr3540774ljn.3.1687361240509;
        Wed, 21 Jun 2023 08:27:20 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o11-20020a2e9b4b000000b002ad5f774579sm926408ljj.96.2023.06.21.08.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 08:27:19 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/7] phy: qcom: qmp-combo: rework register access
Date:   Wed, 21 Jun 2023 18:27:12 +0300
Message-Id: <20230621152719.1025801-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patch at [1], which added another function just to have v4 vs v6
register address difference prompted me to take a look at the combo PHY
driver. We already have mechanism, register layout descriptions, for
coping with register address differences, which I ignored while adding
v4 support. It looks like nowadays this has exploded somehow, resulting
inseveral almost-identicatical functions.

Forcibly use regs layout for all version-specific registers used in DP
PHY programming. As a result, this allows us to drop several very
similar functions. And also while doing this cleanup I spotted a typo,
which resulted in a patch 1, fixing bias0_en programming for sc8280 and
sm8550 PHYs.

[1] https://lore.kernel.org/linux-arm-msm/20230601-topic-sm8550-upstream-dp-phy-init-fix-v1-1-4e9da9f97991@linaro.org/

Dmitry Baryshkov (7):
  phy: qcom: qmp-combo: correct bias0_en programming
  phy: qcom: qmp-combo: reuse register layouts for more registers
  phy: qcom: qmp-combo: reuse register layouts for even more registers
  phy: qcom: qmp-combo: reuse register layouts for some more registers
  phy: qcom: qmp-combo: drop similar functions
  phy: qcom: qmp-combo: drop qmp_v6_dp_aux_init()
  phy: qcom: qmp-combo: extract common function to setup clocks

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 408 +++++++-----------
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h   |   5 +
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   2 +
 3 files changed, 174 insertions(+), 241 deletions(-)

-- 
2.39.2

