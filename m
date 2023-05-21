Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20F2F70B008
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 21:54:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbjEUTye (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 15:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbjEUTyY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 15:54:24 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42086E0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 12:54:23 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-96f7bf29550so341702466b.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 12:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684698862; x=1687290862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DPlU+Sdk+xbWk66yiMas0b8B2Fguegxq4ZQMVRAqSUE=;
        b=JoRw1dCVCQmtBVR7b5wY/wzWwDcNEpu/1oJYZGuci2hlAF5jKpJVe4Zsf8+Shebj35
         0tt9AQAFMZ2HKd2uMTq06gv5KJzl9CyGUYnuXrICj5yr2dsnvJ/maPe+Ar5jKSh+YrP9
         mpjzj2/tvhO706E76DvxnE7rjBdvgCHc8MEkfEccC/GaDuDuH7szfA3NLIpWPpsEug3x
         F5MtoIJ77HFXlhyQ5tdcDQawPlJHd/8Tydnb/BLbkuR5p99GHLAbWE/myduBV/VP3kpM
         BZ2peT0tQ+HXjprtOtBPCL/Lb6jHMk07FaRftVx5GFfBKE8Wo6OJzLzPRY+uc+fEN4g0
         Wh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684698862; x=1687290862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DPlU+Sdk+xbWk66yiMas0b8B2Fguegxq4ZQMVRAqSUE=;
        b=hIFAWc0Qg45y0B7JFOAH+fwlJzZbRuIbk1p5n+KDUBvYaZQzVBlJtrD4oWtnPhuUdn
         ZQSdLeZMSJwvPuMddr2Kn7jeeZJdgEBWRBgg9Lz1w7lGihmbbXt5mJWu6uK2ql5vZkKe
         9jIDVh+6sxOzkD1iyCAq6BF4T5nmdQASUNQx3L5mSxdTiwJtcyF9UVvptd5DUhXaKrE1
         8ede+0alwlwS1u40Uc3DrkIQ8oqHyuU55NlCrtHRWdrv+dR5Fh0M+thacLrdPdkOZCmZ
         7KlTzzazHnqCnPHG/G0vMjwO8Yh51MDrVaBjOFv6hQhM4ZrlHqlHLYQpLdEdL6ZCRa/e
         5W5Q==
X-Gm-Message-State: AC+VfDyFzAN+qvi9hR7yIQzDWOM+8twl6jhQLg2qHD6Pb+QuuFJ0gAum
        WadeFkJWmc0N4VlS/8H3IF4rig==
X-Google-Smtp-Source: ACHHUZ5GRJ91EhgJXjupdVY1R7oyUpirvxLpLPTV7+4NZ4ggxMoI40S3efNJs8lW7IxwZWD1Fw3D8w==
X-Received: by 2002:a17:906:76cd:b0:953:4775:baa7 with SMTP id q13-20020a17090676cd00b009534775baa7mr7805190ejn.52.1684698861741;
        Sun, 21 May 2023 12:54:21 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 16-20020a170906101000b00965ffb8407asm2187107ejm.87.2023.05.21.12.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 12:54:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: [RESEND PATCH v2 0/5] phy: qcom-qmp-usb: split away legacy USB+DP code
Date:   Sun, 21 May 2023 22:54:15 +0300
Message-Id: <20230521195420.12454-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

[please excuse me for the spam, resending the patchset to include dts
mailing list and maintainers into cc list]

While working on the QMP binding cleanup, I noticed that USB QMP driver
supports both simple USB PHYs (which should be updated) and USB-only
part of USB+DP PHYs (which are largely legacy and don't need to be
updated). To ease further cleanup perform a quick cleanup of the last
remaining USB+DP PHY (on sm8150 platform) and split the legacy codepath
from the USB QMP PHY driver.

Changes since v1:
- Rebased on top of phy/next

Dmitry Baryshkov (5):
  dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: add sm8150 USB+DP PHY
  phy: qcom-qmp-combo: add support for the USB+DP PHY on SM8150 platform
  arm64: dts: qcom: sm8150: turn first USB PHY into USB+DP PHY
  dt-bindings: phy: qcom,msm8996-qmp-usb3-phy: drop legacy bindings
  phy: qcom-qmp-usb: split off the legacy USB+dp_com support

 .../phy/qcom,msm8996-qmp-usb3-phy.yaml        |   80 -
 .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      |    2 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |   17 +-
 drivers/phy/qualcomm/Kconfig                  |   10 +
 drivers/phy/qualcomm/Makefile                 |    1 +
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     |    4 +
 .../phy/qualcomm/phy-qcom-qmp-usb-legacy.c    | 1407 +++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       |  556 -------
 8 files changed, 1437 insertions(+), 640 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c

-- 
2.39.2

