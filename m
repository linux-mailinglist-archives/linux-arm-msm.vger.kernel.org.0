Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3127738949
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 17:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233391AbjFUPdg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 11:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233498AbjFUPdW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 11:33:22 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40940E6C
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 08:33:20 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f8775126d3so3969036e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 08:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687361598; x=1689953598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BH6finOK0NCUs0Gft2KgbaIOESt3pr5OWZYURCYeUXQ=;
        b=U+nfwtRiLk3NGnsdw+gPwlh4SogYB81aLy1y21Sf/ysdNkMKtBGPq7A2XRaViuf0fN
         fV+7aJpmELHv/bCWjqROah0saDjV/uCQZuswjf1sI71Nfo8uCM7eMfcLOHgnvddhV4LI
         WRie7RS86YXr4eM82YQ678wSjVML9yE4iM/X6rOiICLJj44gM8gBlRiNcI8yaWKi1o5x
         +WrlPRHanw3hE5RPucr2oukorA5XdvkamfVQZHxIipQIMHNonewF/M57dKc7wh1Ra0ZC
         QyumOSBvhrVPghfg/Fmbd8xWdg8txWHLtsipQ0Ieq1MIRsYBypBIEdkmOUx2J7JoQ50L
         m/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687361598; x=1689953598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BH6finOK0NCUs0Gft2KgbaIOESt3pr5OWZYURCYeUXQ=;
        b=JPg8mf1Y95I4ZYIOnCQJYiuz5ZRSonAbr0NYw5KdX/3FgEZOFMBq5S7Qwvem1Pqt/6
         KpGDbIRssPr42U2airScMh3asP8j77atYHIFC88jTiPWvObe7XazS8pGYNugCL02sFgb
         THHu71m8cHbvUw35cNWgZmwgSQhPJ3875RfrY0xh1rx+FvQ/N5+uTOl9dxdaDrGQMt9R
         uqh/cD5rrG1Q+NCYrsOACQLMYNozjryZHu/vVMz/5e4FpLWvQez0Euyx7H9vW5DQUhKs
         PBfR/pDqWO0SQQ/u/3/4XPO44f638d1jD3xFsBUll22Sj1GLtREApSe7GBfQ0lWFeW9M
         vEjQ==
X-Gm-Message-State: AC+VfDxYq2UC8SlD/BibB7TubnZx4FtGJY0qwNWiNhh6r9+21Hfq8yhc
        lw/+8n0fvdqTFU3vDWTYJTZ+tw==
X-Google-Smtp-Source: ACHHUZ6JQKPQPArgKFqdZPPb7rjF7JBGHwVhYAEFB4DxBioynvcwfq3a5UuYnz7Ry8DAdKvyHJcQdw==
X-Received: by 2002:a19:e34c:0:b0:4f8:4dbd:36fc with SMTP id c12-20020a19e34c000000b004f84dbd36fcmr9455311lfk.8.1687361598431;
        Wed, 21 Jun 2023 08:33:18 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o3-20020a056512050300b004f8751285a5sm804888lfb.80.2023.06.21.08.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 08:33:17 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        freedreno@lists.freedesktop.org
Subject: [RESEND PATCH 0/7] phy: qcom: qmp-combo: rework register access
Date:   Wed, 21 Jun 2023 18:33:10 +0300
Message-Id: <20230621153317.1025914-1-dmitry.baryshkov@linaro.org>
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

For some reason I used the wrong script to send this patchset, resend it
including proper (linux-phy & maintainers) recipients.

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

