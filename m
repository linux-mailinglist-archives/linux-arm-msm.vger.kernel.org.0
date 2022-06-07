Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB925421B6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 08:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbiFHA6S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jun 2022 20:58:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1573483AbiFGXYI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jun 2022 19:24:08 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA3EC3F5740
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 14:33:22 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-f2a4c51c45so24834852fac.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jun 2022 14:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7WQJ/XtKegsw42WINS+GcmBCB6YzztdG6Y2PPPtUW/w=;
        b=TrullXJMsk5YwE74aMpxuW61E1Hw1bnKtHsWUuwneaKzbWnpnuR+AjXBZ629aN2OD4
         K8M0ZQuIVKorAfsPpsBq4P/2IJG0G29TGqlJA0BDh9WZ1T7oHDJej8Pa4GdBM1Px974A
         cFaCm7tTycbHC+Kgx1dTX3JZv8xASZxwar4EZmTS4r868fstIko0vde6uw7EGmO62bSp
         k9J9GAkUGTPbdwagbRBagx5TDT9IFym/yPArpVhVR2+zp4iu05KPEYJCDrOwJ5HliovS
         qmxbar3fOJ/dBtJBu0ZXgJRPAUTqg8kgwHHB5w8d+I2Ivx5MiU5sRuNowWjBNz9bAQIo
         0yHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7WQJ/XtKegsw42WINS+GcmBCB6YzztdG6Y2PPPtUW/w=;
        b=QsSImfoG3NM/Orum43nYtTBCTfQw2drfMusZe1aHMjp370BhFXAbJHKprMnMn2YUBw
         bti79mZo5pYPKyoM92otfHCUoqd9gwAEQx2jotaExk2ygJ5tIfyTaqP3x9KlK59ZFN6y
         WKQCOQnI4rS8Xf+Mymx6dVkRcizLOJCHFBj4HgibJuQCGuehecolTApeIky8KaGQXip5
         bznIUGAomumuR5UykPhzNVgBZH1D90B4JBkCVnDqEQk221RnUzKK9vduPf/5bB85dmZ5
         hJJmb1+EVcQ+UJkfqRNYnQvIfE+Rm30c2OSG9SFyFZWsMfUnOW8x5cghqMy9rDlMuoEn
         cztw==
X-Gm-Message-State: AOAM530CsIA5NJHOqDtbnIbl/YdB1RqDE0LgRGWfSS2RruLlwOoX0s2r
        CRiMZtQ4G9X1JMNhrFUk0F93ew==
X-Google-Smtp-Source: ABdhPJyU25K2d0bR0vnpnqOV1y2zdIZ6XN9gCVbMevu5CAiFWeOd1COsOlK9xlawqzqPKGiYAmdkLg==
X-Received: by 2002:a05:6870:82a2:b0:f5:f1ee:cfdb with SMTP id q34-20020a05687082a200b000f5f1eecfdbmr538939oae.297.1654637599500;
        Tue, 07 Jun 2022 14:33:19 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id cd24-20020a056808319800b0032e7205619asm4966031oib.15.2022.06.07.14.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 14:33:18 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] phy: qcom: Add SC8280XP UNI and COMBO USB phys
Date:   Tue,  7 Jun 2022 14:35:38 -0700
Message-Id: <20220607213543.4057620-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm SC8280XP has two pairs of USB phys; a pair of combo phys and a
pair of uni phys. Introduce support for these.

This is based ontop of Dmitry's refactoring of the QMP driver:
https://lore.kernel.org/all/20220602070909.1666068-1-dmitry.baryshkov@linaro.org/

A first version of this series was posted with only the UNI phy, this fixes a
few comments and add the combo phy as well.

Bjorn Andersson (5):
  dt-bindings: phy: qcom,qmp: Add compatible for SC8280XP USB phys
  phy: qcom-qmp: Add USB3 5NM QMP UNI registers
  phy: qcom-qmp: Add USB4 5NM QMP combo PHY registers
  phy: qcom-qmp: Add SC8280XP USB3 UNI phy
  phy: qcom-qmp: Add sc8280xp USB/DP combo phys

 .../devicetree/bindings/phy/qcom,qmp-phy.yaml |    2 +
 .../bindings/phy/qcom,qmp-usb3-dp-phy.yaml    |    1 +
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     |  205 +++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       |  138 ++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   13 +
 .../phy/qualcomm/phy-qcom-usb3-5nm-qmp-uni.h  |  617 +++++++
 .../qualcomm/phy-qcom-usb4-5nm-qmp-combo.h    | 1547 +++++++++++++++++
 7 files changed, 2523 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-usb3-5nm-qmp-uni.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-usb4-5nm-qmp-combo.h

-- 
2.35.1

