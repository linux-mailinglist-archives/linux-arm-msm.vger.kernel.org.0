Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72F604E7DEB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Mar 2022 01:23:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233603AbiCYWXS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Mar 2022 18:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233716AbiCYWXN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Mar 2022 18:23:13 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74DD11A774B
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 15:21:38 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id u22so7611910pfg.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 15:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/O6vtGDql6h6bwr1hfZ8t55lRl59LZ8LmFpjtzbq3zk=;
        b=ED/iIDMgB2RbYRMPWq8JmMHXXLRkxWmmecomxKQpUPgVPzFKlqoa083m5PyaNisfYQ
         jTb6FYZVjZz7XKaJgRRKy0tBN6w2mD4XPYS7qT0UzF2X6WVVq8WDKaoFU1Y5xU/R0V97
         9a1+BhaZ/CFbDi0iltzxG799kzKQ1rvBsfKJbd+Jk/ZygFcNdYAi9zr0JiM6zi2okCPK
         nCkwlH3IVUNNi7WH7zIOFQKW2ND5DNdzbgSKxGWOlwViyNAW3dThfNuopl+Sw+V1H1aN
         WlQv9FAutUlKQhV3MttfhIxIC5NmdOYa7GuIiT4bJ9KWlgbgfc9ARuFBozDx2ShF+yas
         U+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/O6vtGDql6h6bwr1hfZ8t55lRl59LZ8LmFpjtzbq3zk=;
        b=bGtptZ5g41jpMuvaWBatMTGwRza4I8zEw46cFYplOvVyJgkh+bTGnrH784hpNvNvk4
         9bF04DkhLONN59mQAhzf6lF2WuGw05CW35mVAoVkOq/3mNbXeD1IPLXN+JP0Tz6hp+dW
         Lt+ExOQkY3JcLkAmWKKl8i6WceN5Y9tIZS9xWTlQhQs8h4rlFN8fMH235O1Vg6j65d/v
         cMnjrzubjLLbeP7Zzb1vZEHtW1hEkL53+M8S2cShMmpyBVEepgE8EH+iPWg3iAGxobIg
         apv3hScMMLXlAWI3W5LFHb63dwFZx4aMJFs8vjUJyMcOpT5xnBWgp2uTBOKjp5opMnB5
         +F3w==
X-Gm-Message-State: AOAM532tW0aED6B8oXenjPamJuun2Sb8zgE0Rdqnmm9F3OeK/J2V/eC4
        8IARX580JNMOFH310kRWXzMz5ExO/20wsA==
X-Google-Smtp-Source: ABdhPJy21kYyyydAFgwiwQuRy4hYEejXOSrEo2zOKAa6/Lq+VwNiWDIuGM5Leh5TAGA+G5SH8eEXtQ==
X-Received: by 2002:a05:6a00:1310:b0:4ca:cc46:20c7 with SMTP id j16-20020a056a00131000b004cacc4620c7mr12298316pfu.44.1648246897871;
        Fri, 25 Mar 2022 15:21:37 -0700 (PDT)
Received: from localhost.localdomain ([223.233.78.42])
        by smtp.gmail.com with ESMTPSA id x16-20020a637c10000000b00380b351aaacsm6006490pgc.16.2022.03.25.15.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 15:21:37 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-phy@lists.infradead.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, bjorn.andersson@linaro.org,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 0/2] phy: qmp: Add PCIe support for SM8150 SoC
Date:   Sat, 26 Mar 2022 03:51:28 +0530
Message-Id: <20220325222130.1783242-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Changes since v3:
-----------------
- v3 can be found here: https://lore.kernel.org/linux-arm-msm/20220302203045.184500-1-bhupesh.sharma@linaro.org/
- Broke down the patchset into 3 separate patchsets for each tree,
  so that the patch(es) can be easily reviewed and merged by respective
  maintainers.
- This patchset adds the qmp-phy related PCIe support for SM8150 SoC.

Hi Vinod,

This series adds support for qmp-phy instance(s) found connected
to PCIe controller on Qualcomm SM8150 SoC. There are 2 PCIe instances
on this SoC each with different PHYs. The PCIe controller and PHYs are
mostly compatible with the ones found on SM8250 SoC, hence the old drivers
are modified to add the support.

This series has been tested on SA8155p ADP board with QCA6696 chipset connected
onboard.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>

Bhupesh Sharma (2):
  dt-bindings: phy: qcom,qmp: Add SM8150 PCIe PHY bindings
  phy: qcom-qmp: Add SM8150 PCIe QMP PHYs

 .../devicetree/bindings/phy/qcom,qmp-phy.yaml |  4 +
 drivers/phy/qualcomm/phy-qcom-qmp.c           | 90 +++++++++++++++++++
 2 files changed, 94 insertions(+)

-- 
2.35.1

