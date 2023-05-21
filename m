Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F173D70B045
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 22:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbjEUUij (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 16:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbjEUUii (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 16:38:38 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18A3ED2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 13:38:37 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f3ba703b67so1208827e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 13:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684701515; x=1687293515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lNg1WeNQ9Ub/LGCok7PDL9jQiPuqRPP/v7XNngjKdkk=;
        b=K7MdvYGjb5o13NYA7KJq2wJg4Ve1lhYZrLYjIXYLaEIkG2I9yW7DM3qDBqKQWcQ6Ot
         4opLLJuLi0LlShrDNl057kWBgJK4mPnL/+LjB7GrzBlZYesYmEYP8VEu/Zk6XQv68YBP
         OPMLUvorNwp0YF8HCWWU2TMkW6KdNINfIgy9VYCbj9C7uDZEuS2EledyvkldbnpgYeSU
         XbE8o4pF18/xg9ZEuXtudQWUTccLbUvjLLGZbcJfBCXcEnPPMrVUGQpSTJ3X9Y7uyewh
         y3SAZY6QBysy5qa+4a9TobrwCFvzj0b2Ir999HOtasBPQbo5N9Qg0fobNZ1SZS5hUtDI
         fhGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684701515; x=1687293515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lNg1WeNQ9Ub/LGCok7PDL9jQiPuqRPP/v7XNngjKdkk=;
        b=jZ/rS+J2GdGi1zBmR2Xbivoo8c2NKLUSnaaq8X/WcyQ5dfL+0WNa7rDTWpJH0xLUA6
         Xwz3ky3VCtq0/foVmCMjt/sKSJVoOMxpJYJD651DGMb6mG3CcZ5zP/r/JGLQxSaGHurn
         tC9ndp+mT9orJjlVzg6puR+zV1rFtLghRa30dGNnT2PJbv0GazWj15sE7ethtLHvkHTy
         pi/A92g5Nb50RbxfaQpKIdpoMFq3XLWyMfruSKIMpQEuaR0tSN0GgFkiDum/p62x1PZY
         2cgu6u/7Obt10BmPY7OobUo/y+KjH08cwhM4KdvDjr2NDo98wJDQRiDYRXKrL99aBuoA
         ezMQ==
X-Gm-Message-State: AC+VfDyrPDZljl/od9U5cACRB0Z6aq01p8vDUaOROsgyMmqTlyiARlyy
        gFVU52QZG6cWXRCGQySAGEaWwg==
X-Google-Smtp-Source: ACHHUZ43B2Rl3BBoautfRXMze15+kdn5h9wpOGqjJ2oq99qum7xkWbnpLEPTRxq8Y+4ElhGjsYD3cQ==
X-Received: by 2002:ac2:5927:0:b0:4f2:61c8:fd0d with SMTP id v7-20020ac25927000000b004f261c8fd0dmr3094203lfi.48.1684701515346;
        Sun, 21 May 2023 13:38:35 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a15-20020a056512020f00b004f3886a63d1sm718894lfo.298.2023.05.21.13.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 13:38:34 -0700 (PDT)
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
        devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 00/11] phy: qcom-qmp-ufs: convert to newer style of bindings
Date:   Sun, 21 May 2023 23:38:23 +0300
Message-Id: <20230521203834.22566-1-dmitry.baryshkov@linaro.org>
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

Reviewing several patchsets for newer platforms made me understand that
having two styles of QMP PHY bindings causes confusion. Despite binding
documents having notes telling that old bindings should be used for
older platforms, it is too easy to attempt adding new platform with
older QMP PHY binding. Thus let's have just a single documented style of
bindings.

Changes since v1:
 - Split large patchset into smaller parts
 - Rebased on phy/next

Dmitry Baryshkov (11):
  dt-bindings: phy: migrate QMP UFS PHY bindings to
    qcom,sc8280xp-qmp-ufs-phy.yaml
  phy: qcom-qmp-ufs: populate offsets configuration
  arm64: dts: qcom: msm8996: switch UFS QMP PHY to new style of bindings
  arm64: dts: qcom: msm8998: switch UFS QMP PHY to new style of bindings
  arm64: dts: qcom: sdm845: switch UFS QMP PHY to new style of bindings
  arm64: dts: qcom: sm6115: switch UFS QMP PHY to new style of bindings
  arm64: dts: qcom: sm6350: switch UFS QMP PHY to new style of bindings
  arm64: dts: qcom: sm8150: switch UFS QMP PHY to new style of bindings
  arm64: dts: qcom: sm8250: switch UFS QMP PHY to new style of bindings
  arm64: dts: qcom: sm8350: switch UFS QMP PHY to new style of bindings
  arm64: dts: qcom: sm8450: switch UFS QMP PHY to new style of bindings

 .../phy/qcom,msm8996-qmp-ufs-phy.yaml         | 244 ------------------
 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        |  48 +++-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  25 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |  16 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  17 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi          |  17 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi          |  18 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |  20 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  20 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |  28 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |  28 +-
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       |  10 +
 12 files changed, 112 insertions(+), 379 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-ufs-phy.yaml

-- 
2.39.2

