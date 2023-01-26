Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B03E67CB18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 13:47:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235341AbjAZMrB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 07:47:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234116AbjAZMrA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 07:47:00 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1443856ED2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 04:46:59 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so3180493wmb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 04:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aEwl4rXqwP7HFZuGGS8GvTs9Re4pfspXDU7w3TmmVI0=;
        b=jQY5FDIzJd/D5AfxGaPGYIZIrxbmpQCSjcWGkffpFvIaQgR1klTO6ENQ754svYLOvG
         BgXcfe0ulf+BwgcCGkM5hZNZaQlx44wuZNZFwCtdb5sctz49e3b8MWpTqoKNlJBBYxFf
         xeI4WSgPevD+nwPzpdKkG4b4XbiAcdMg3JjWI/1RH95g6BcACOdoyL5+PNGEIR3FrBqA
         /x3HKYRA0nx62uKk8xJHGODcAZR/swdp2I6CFbRI1RxYZT/6ec/5TI0+JqZwuh78zrGc
         /LXemjExKf5HwgiJBROMkOK34NfNYjn0OMLOYCNiPJyw3rG9GwvPx9ssRj1PpEZ7oIK9
         xtww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aEwl4rXqwP7HFZuGGS8GvTs9Re4pfspXDU7w3TmmVI0=;
        b=5mg/lS5D9FeGUQlZHecqYgeiEjyAp9MDzGbECJtC0p8HJYXbGL2QIkyRXl+9QdkTLV
         qM+rk0AEOWSvLf4+ifLdy+L/7U1yYWEwq05G2OhEEwcEWAUq2jLhMWaSMthD4L3B3Kbf
         sF1eQCAI0H1IxzDukgOU1VqAAscbqeq0eoLWLG2bJ4TYN+cdn7abzrf3fSQ7Fa80D0Yz
         myV3a26/jSLtAHECS/URWbeAG6mri/Xbm8RIjH+AeV8cwHhtm3/Z9scBYKnFj19ThIVA
         iPO6mPSuSOluU55NdkcrjYL+Ugal2AansgJiqQxN73UZbItEKP4QmuHq5lG3FkTpC8Qn
         HCgA==
X-Gm-Message-State: AFqh2koXbtDr1QAl8Yn3ML2JopCr4qFscpavja1FmYga/ovjrtOmxygg
        /rzWUH23YuI3MoACm2hA+HDTfg==
X-Google-Smtp-Source: AMrXdXslJr4J5js/ytBZ7wAvx3rO670yMpHaS8sIaBr7oBWzofte/ymYVVnVFGDtLY2OAxvkzY7S8g==
X-Received: by 2002:a1c:f317:0:b0:3d0:480b:ac53 with SMTP id q23-20020a1cf317000000b003d0480bac53mr35697160wmq.12.1674737217607;
        Thu, 26 Jan 2023 04:46:57 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v11-20020adff68b000000b002bfb8f829eesm1198681wrp.71.2023.01.26.04.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 04:46:57 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-phy@lists.infradead.org
Subject: [PATCH v2 0/8] sm8550: Add USB HC and PHYs support
Date:   Thu, 26 Jan 2023 14:46:43 +0200
Message-Id: <20230126124651.1362533-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
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

This patchset adds support for USB for Qualcomm SM8550 platform.

This patchset is based on top of the following patchset:
https://lore.kernel.org/all/20230124124714.3087948-1-abel.vesa@linaro.org/

For changelogs please look at each patch individually.

Abel Vesa (8):
  dt-bindings: phy: Add qcom,snps-eusb2-phy schema file
  phy: qcom: Add QCOM SNPS eUSB2 driver
  dt-bindings: phy: qcom,qmp-usb: Document SM8550 compatible
  phy: qcom-qmp: pcs-usb: Add v6 register offsets
  phy: qcom-qmp: Add v6 DP register offsets
  phy: qcom-qmp-combo: Add support for SM8550
  arm64: dts: qcom: sm8550: Add USB PHYs and controller nodes
  arm64: dts: qcom: sm8550-mtp: Add USB PHYs and HC nodes

 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    |   1 +
 .../bindings/phy/qcom,snps-eusb2-phy.yaml     |  78 ++++
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts       |  22 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi          |  92 +++-
 drivers/phy/qualcomm/Kconfig                  |   9 +
 drivers/phy/qualcomm/Makefile                 |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 406 ++++++++++++++++-
 .../phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h    |  31 ++
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   4 +
 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c    | 421 ++++++++++++++++++
 10 files changed, 1061 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c

-- 
2.34.1

