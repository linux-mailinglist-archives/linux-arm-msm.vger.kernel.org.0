Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E03A7173C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 04:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233157AbjEaCeU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 22:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231806AbjEaCeU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 22:34:20 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9149A113
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 19:34:18 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f3baf04f0cso5907029e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 19:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685500457; x=1688092457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8hTyjGZ6AL0yA0rgfhYU4TsPoXNrzNumNaJEOJx+Ur0=;
        b=jK+2S+R8CqfU9FneCHCZ7GGe5jeac5TqTHTQE3sQfTWEV1ujxTU51imTOye1Tnl9vb
         mEMriq3PZpEyUX/rgjJYVYy8cgzsyJ/UozBjdPzAGDvRsXee0xHsWdL0wM/AZlc+3t/D
         g3a0EPcOMvQlxN571CFT9hA456ekPLlMBUSHEhapo4EGhWDqznTx7Zhozpfv7B4nG+YM
         734RxbGN5pMzB+YOPPO9npZtOMI12VQuWU22bpUe4hlcgLaDoWRPDJVqlViSCQkYwbPZ
         adaaREJPyZSlsLBykdXDW5YJlgXpfLCgv8ZKKYV2G2c6g0RDXfhUWjASqTNRxznqI60D
         IzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685500457; x=1688092457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8hTyjGZ6AL0yA0rgfhYU4TsPoXNrzNumNaJEOJx+Ur0=;
        b=iqJAi2Xxwhyx1rXNo2qTHUQJyYOWMFEeSeMr/TzrbevaTAQrJJ348Gw5Li5AkpjTUM
         qWlZHAVxh8KsPu7+aozK7B2O1Vzb4r2OME0n7Rf+Kt/IJR6+wdfOurPPkm8Iv/b+H2Ys
         I48d5lbf+088rzllcpiII3944HNG4Nq7ME84mIz61nSwv6XWdMMjtr+TUMO6OAXCu7IU
         jpkIuFoogt4g9AUALo9cktk8KXhK1aDj9yI44vD0Y8FSw1I9v/IWMpn0XIOfjo2SpCq4
         ttfuMg/TH0z9jIxAs0vvsjipBByUmALLRtpr8kwd3LP1qIPtSZE1ZGmbeEPsIArSttrN
         TYFg==
X-Gm-Message-State: AC+VfDxFFZQDFP4uk8RUbdEEnzWB9c1yK9KbbhV5SfcyRDihwGKvlPyy
        dEjJRYhKj4rD2fvXAWB71nmdmw==
X-Google-Smtp-Source: ACHHUZ6xgtJ/m1ezI+vUkAGSOWphS4aRy5+t4HwdNbQyNIJ3lfr6ksI6qsM4MWX1jMCtwXDxgKQq5Q==
X-Received: by 2002:ac2:532d:0:b0:4f3:92a9:aa06 with SMTP id f13-20020ac2532d000000b004f392a9aa06mr1731047lfh.48.1685500456861;
        Tue, 30 May 2023 19:34:16 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v24-20020ac25618000000b004f3787d8006sm524096lfd.128.2023.05.30.19.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 19:34:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 0/5] phy: qcom-qmp-usb: split away legacy USB+DP code
Date:   Wed, 31 May 2023 05:34:10 +0300
Message-Id: <20230531023415.1209301-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While working on the QMP binding cleanup, I noticed that USB QMP driver
supports both simple USB PHYs (which should be updated) and USB-only
part of USB+DP PHYs (which are largely legacy and don't need to be
updated). To ease further cleanup perform a quick cleanup of the last
remaining USB+DP PHY (on sm8150 platform) and split the legacy codepath
from the USB QMP PHY driver.

Changes since v2:
- Fixed phy subnode names (noted by Caleb)

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
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |   19 +-
 drivers/phy/qualcomm/Kconfig                  |   10 +
 drivers/phy/qualcomm/Makefile                 |    1 +
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     |    4 +
 .../phy/qualcomm/phy-qcom-qmp-usb-legacy.c    | 1407 +++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c       |  556 -------
 8 files changed, 1438 insertions(+), 641 deletions(-)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-usb-legacy.c

-- 
2.39.2

