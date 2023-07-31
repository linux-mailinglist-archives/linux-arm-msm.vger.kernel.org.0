Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 703547693DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jul 2023 12:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbjGaK6u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jul 2023 06:58:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbjGaK6f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jul 2023 06:58:35 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CEF71724
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 03:58:02 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fe3c7f16bbso484556e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jul 2023 03:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690801081; x=1691405881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MkWLzVZvkVwc4kbg9O6IOFav3DjG7Q36badDvS2EiRA=;
        b=tHUCt0i9d3oi9Rb38U3RCWJIYllh/bEHGj+2OI9WiPfYxe/HNoToWx6m9pNE8JFtuq
         6vqiHe0uE9dYzHp8S5SmF81bZ5FLPnp/NZkM+h8rywKJl1+BHFAA48395+2+hUH1fqX+
         kD2mWbs0ZU6R1A1EX2a1Gf2XPgLL8hXUE7y2/Xq/N2PY7M82+yIqcSJiTUerrqhG4ont
         o69ZtevxJApR0jBEUOELzoCZMeLC/c8n53+eNvWcfk3us4SliaF6HqN3sFkSCrWvGigJ
         rqdXMOMgJAXSVW+F2wu9twAXRM07MkvHvvJT170ChPZ3cIV+HJfISpe395Z/RzffXeYe
         HSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690801081; x=1691405881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MkWLzVZvkVwc4kbg9O6IOFav3DjG7Q36badDvS2EiRA=;
        b=CJjrH+flEVqJDk1iuybpgDtH0g4dYg2p7OA71gGrlcvp8fWBwWcvVqXM/wcL8occ9x
         lNpminxq8I9+ElqmLjLa4WnpHs6sD3V6LtzaZfy+HmYJoZWDNEu5w/ruF8vXxbqV6Frl
         kWuT5D1+vsTlwMSCQEKcx8jEKI23Tf1nF+21ApAok6uIurwyw1tw/lyWYB9uhcDzWIVc
         vCQUDQPM4T7DKOHSX8Jynj12yFzEzbn709fV6Cbmu1qL1BV3wOo1Y69B1G0VWdg+bMk9
         +IGMJ8zpg8PdjLf945TnZX7DpMKC1bwSp7qTPE3W879z9v80Nsn8T+AS1bK0kz1JR55v
         7/KQ==
X-Gm-Message-State: ABy/qLYMy4yRRcvFrDLTqWwVpT/5Q6tgtJ0l5nWCEt1nwdA5Em5b0aHJ
        Nlpy0u1q06b8hpW3M2+NkxM4Fg==
X-Google-Smtp-Source: APBJJlHixnbIxwRPCZ8VCoGR+kynEHwVm2GhExWQRQpj7EBGGmHNZro5l3hl1viEJEghiMjSP90U+w==
X-Received: by 2002:a05:6512:45b:b0:4fb:94fd:6465 with SMTP id y27-20020a056512045b00b004fb94fd6465mr5167030lfk.15.1690801080801;
        Mon, 31 Jul 2023 03:58:00 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c19-20020ac24153000000b004fb9fe34c27sm2025497lfi.92.2023.07.31.03.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 03:58:00 -0700 (PDT)
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
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v2 00/13] phy: qcom-qmp-pcie: convert to newer style of bindings
Date:   Mon, 31 Jul 2023 13:57:46 +0300
Message-Id: <20230731105759.3997549-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewing several patchsets for newer platforms made it clear that
having two styles of QMP PHY bindings causes confusion. Despite binding
documents having notes telling that old bindings should be used for
older platforms, it is too easy to attempt adding new platform with
older QMP PHY binding. Thus let's have just a single documented style of
bindings.

Proposed merge strategy: immutable branch with binding and PHY patches,
which can also be merged into Bjorn's dts-for-6.6

Changes since v1:
 - Split large patchset into smaller parts
 - Rebased on phy/next

Dmitry Baryshkov (13):
  dt-bindings: phy: migrate QMP PCIe PHY bindings to
    qcom,sc8280xp-qmp-pcie-phy.yaml
  phy: qcom-qmp-pcie: simplify clock handling
  phy: qcom-qmp-pcie: populate offsets configuration
  arm64: dts: qcom: ipq6018: switch PCIe QMP PHY to new style of
    bindings
  arm64: dts: qcom: ipq8074: switch PCIe QMP PHY to new style of
    bindings
  arm64: dts: qcom: msm8998: switch PCIe QMP PHY to new style of
    bindings
  arm64: dts: qcom: sc7280: switch PCIe QMP PHY to new style of bindings
  arm64: dts: qcom: sc8180x: switch PCIe QMP PHY to new style of
    bindings
  arm64: dts: qcom: sdm845: switch PCIe QMP PHY to new style of bindings
  arm64: dts: qcom: sm8150: switch PCIe QMP PHY to new style of bindings
  arm64: dts: qcom: sm8250: switch PCIe QMP PHY to new style of bindings
  arm64: dts: qcom: sm8450: switch PCIe QMP PHY to new style of bindings
  ARM: dts: qcom-sdx55: switch PCIe QMP PHY to new style of bindings

 .../phy/qcom,ipq8074-qmp-pcie-phy.yaml        | 278 +++---------------
 .../phy/qcom,msm8998-qmp-pcie-phy.yaml        |  97 ++++++
 .../phy/qcom,sc8280xp-qmp-pcie-phy.yaml       |  34 ++-
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi        |  31 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi         |  32 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi         |  63 ++--
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |  30 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi          |  36 +--
 arch/arm64/boot/dts/qcom/sc8180x.dtsi         | 140 ++++-----
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  71 ++---
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |  70 ++---
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 112 +++----
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |  82 +++---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c      | 162 +++++-----
 14 files changed, 520 insertions(+), 718 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,msm8998-qmp-pcie-phy.yaml

-- 
2.39.2

