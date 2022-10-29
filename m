Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6832A61256A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 23:13:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbiJ2VNS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Oct 2022 17:13:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiJ2VNR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Oct 2022 17:13:17 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B78A3CBFB
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 14:13:16 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id bp15so13525569lfb.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 14:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mq8Mg06fdD8FFSs+dwD1ITMKqlWnIs/wVZyIglcsiPc=;
        b=po6WXVw9WSHq/UQZyPh9zCXDgLHvb4PeMI38LBF4vn0NS5ZDPMaKDJgzN4ctT4wZKw
         spnRodfwn+6y/mYskrqV/NDQu+SZ/Xy9z9+xkVzewoRaA7oXZcSZSuT/q/BiJy5CjkzQ
         MZ4Y+SPB85ndhYiqLj8ZYx3hgZNsKdJXZubR9t/kV8vZ5+vpZRzjc8kiw/GvTRdDEMo1
         uDSnYQbb/0NTsYzszJEfbv5IKehB1E/RyQ+fvg/CzJHER0ajcAc3UrJygAejKVP+ER3r
         NlUPeAk/7CknWx65tjHv1EQy9QMiVZU7sk1GjLYgk9q4Ai3r9pjEOr+FIoDswROARauU
         Qkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mq8Mg06fdD8FFSs+dwD1ITMKqlWnIs/wVZyIglcsiPc=;
        b=yzDix9cf0CZJb9WVfIOjo89eUD3Fx7FYAfObSFImHFC2UZZqziha4qDpzLJYkSOAMX
         cxHzD9AQJ8l5r9unud7g5GRpqJlRYFInJbzqWCjt8MQ5AsgfZ0Wo8jP+9KZJWnWXaohN
         HmerhknLoUQ0FThgDsQWwmKPKjcwE8Z5Fr/l0fXFn3ZiHLkXwEa0VmamZKDU8la8lDIQ
         uCTotydzEr9re+RqyW4Se1SmL69Bh9NAW3U3hixml0Xy5AWoM6OpsapTU1Om5eF/h8XO
         NAlnODoR3RIo8tLJGvRzP6qNCbyflKYbMzUveXJ7TkNl/rmNou3skUD+uzB4H+8Thkru
         xRDw==
X-Gm-Message-State: ACrzQf0CJ5RzaRkcK1zi8mzZg8+htOBTE60w8DcofTfveiFls8M3Yx8q
        tIKfxQ/hcUE7TONQJvItJYFbBA==
X-Google-Smtp-Source: AMsMyM46iI4lf7SmclXK+EHWE1Atz1jHMgUHdPOMtJSyDkqEgBOlRePWkwbCVNxvvkAnY6D4+s/FNg==
X-Received: by 2002:a05:6512:2102:b0:4a2:48a2:2cc1 with SMTP id q2-20020a056512210200b004a248a22cc1mr2379585lfr.167.1667077994504;
        Sat, 29 Oct 2022 14:13:14 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id j14-20020a05651231ce00b004a480c8f770sm433508lfe.210.2022.10.29.14.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 14:13:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: [PATCH v1 0/7] PCI/phy: Add support for PCI on sm8350 platform
Date:   Sun, 30 Oct 2022 00:13:05 +0300
Message-Id: <20221029211312.929862-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

SM8350 is one of the recent Qualcomm platforms which lacks PCIe support.
Use sm8450 PHY tables to add support for the PCIe hosts on Qualcomm SM8350 platform.

Note: the PCIe0 table is based on the v2.1 tables, so it might work
incorrectly on earlier platforms.

Dependencies:
- phy/next
- https://lore.kernel.org/all/20221028133603.18470-1-johan+linaro@kernel.org/

Dmitry Baryshkov (7):
  dt-bindings: PCI: qcom: Add sm8350 to bindings
  dt-bindings: phy: qcom,qmp-pcie: add sm8350 bindings
  PCI: qcom: Add support for SM8350
  phy: qcom-qmp-pcie: split and rename the sm8450 gen3 PHY config tables
  phy: qcom-qmp-pcie: add support for sm8350 platform
  arm64: dts: qcom: sm8350: add PCIe devices
  arm64: dts: qcom: sm8350-hdk: enable PCIe devices

 .../devicetree/bindings/pci/qcom,pcie.yaml    |  54 ++++
 .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       |  22 ++
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts       |  16 ++
 arch/arm64/boot/dts/qcom/sm8350.dtsi          | 248 +++++++++++++++++-
 drivers/pci/controller/dwc/pcie-qcom.c        |   1 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 164 ++++++++++--
 6 files changed, 487 insertions(+), 18 deletions(-)


base-commit: 25dcaf94448f41f1634e8e44f28f37b1aff4bc2c
prerequisite-patch-id: 2653b8544469dbf460318520629a991707063a74
prerequisite-patch-id: 8e104dd9bcbfc111a3e3a40e653b7529bc43c2da
prerequisite-patch-id: a20eaeb1d3c239365d6941e0b78bd735d80ac16c
prerequisite-patch-id: 564c51aafef04658f6f72a90680640f77117c8eb
prerequisite-patch-id: 6d7542be2843ccfd1f649d2dc85230e640adf5f1
prerequisite-patch-id: e36118b08045416bf3d79a2c69b7f1b2009d6945
prerequisite-patch-id: d48963bb923f85108a8f0d574e92dc63ce341483
prerequisite-patch-id: d8dfcbc4413e5a29ed9d4c2a50f5e6cdec0d261a
prerequisite-patch-id: 0493226b1dd5989626619e598650d98e165a9c1b
prerequisite-patch-id: 7264ed9ab2e1fc6c25db45812c6834f36590e72e
prerequisite-patch-id: 2784713a211929f0b253674742a7bf0966e02c22
prerequisite-patch-id: 454b9956cd3d4c4cdc4f39e746175a5d6a1ca084
prerequisite-patch-id: ce69ae926fb095edd2f3699cfe28e9e75719985c
prerequisite-patch-id: 0286a9947535ee3be9f58b8a06f7b3018d1309d8
prerequisite-patch-id: 9d0856ce66a0603950eaa4024057c1cf1f84ed95
-- 
2.35.1

