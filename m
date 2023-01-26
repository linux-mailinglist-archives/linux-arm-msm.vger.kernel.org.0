Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DCD267CBBD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 14:14:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236355AbjAZNOq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 08:14:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230273AbjAZNOp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 08:14:45 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 150C269504
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 05:14:21 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id m15so1085209wms.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 05:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OHA/1FBnLe/DjBL2RAHOE/0kR+mnf0skty5y8z89TXU=;
        b=t2Ezs4aR0xtOSuPyHKtDtlcugo0TiOWoAwWPyHdZ6npNMNkpe9KiTfD94IA+vVNUaG
         Y9JkZAKBEhbARn5TAWXNLxS3FNCfsqYLdt8WzHxpZtZP0SqGy0pCbiaj40YEsi+BBeUb
         jFNE2F04PCkqVh8zsvhnkAd5OFroNXlSLm6nL++WONWIx41velTvLpvUElzH0yCypRiH
         MYyLLf4v5WouNG+OzEZ45asnbXqjKBAJj6fGFYqRCyNiFPCRo7RKI+8JjTFrvprO4aYm
         4qdvFj0v9+860LiMQ7ECol1cASOuK3ZE6ttMAiLim/GGPr4FonjvAB8dHIu2FaanRnZz
         R2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OHA/1FBnLe/DjBL2RAHOE/0kR+mnf0skty5y8z89TXU=;
        b=eAwXg7mI0fBtE+IaESEjyOJWB4jvoBXYd/W3uYjO/hel/2J1db1UUpaZWmkvTHORDC
         /OUBFltcP5e/kbyyBbhu1I+S9gmZyiAc2uvBa6QX9rAWmOWXDfLb64oIM5Be62WEdW8m
         BinbN6Ku6Q7OvHr3yX/isNB5tJWu//xpLN0b2h/mkE5jDjPmDjRAeeD/7UejY5Iq0a5H
         SB6B779Jgy7cyC9FEEk65HPsfnzg4bEJ6Hn8HeAE7g9RIjpjy4gMVt/7M7qyZnPu9/aw
         +FYIg2WS8YYwftLYfzVSBeHSjD+Zk3jwMfrVUeGbuigBeO42EDjU6O8+llB0aMixetF9
         x92w==
X-Gm-Message-State: AFqh2kqeEE9DncaIV1FfDCCU9VK6QA4IsNcrTLBwRefNSNqHXMzDVKMN
        jMgWrQlstWyLgjd+ibrTP1ytzw==
X-Google-Smtp-Source: AMrXdXsB2dypJgZRyLvldnL3MwIjk8JmDxYB3+vK96DnfnuoFbKtG7UDBJzgY5JAKnZdC/FdKnBOEw==
X-Received: by 2002:a7b:c4d0:0:b0:3d1:f6b3:2ce3 with SMTP id g16-20020a7bc4d0000000b003d1f6b32ce3mr37326986wmk.35.1674738859147;
        Thu, 26 Jan 2023 05:14:19 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id 18-20020a05600c26d200b003da28dfdedcsm1719804wmv.5.2023.01.26.05.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 05:14:18 -0800 (PST)
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
Subject: [PATCH v3 0/8] sm8550: Add USB HC and PHYs support
Date:   Thu, 26 Jan 2023 15:14:07 +0200
Message-Id: <20230126131415.1453741-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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
 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c    | 423 ++++++++++++++++++
 10 files changed, 1063 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v6.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c

-- 
2.34.1

