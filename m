Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC21174F2B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 16:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232871AbjGKOv6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 10:51:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232262AbjGKOv5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 10:51:57 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEE7110C7
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:51:55 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b6a6f224a1so95377201fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689087114; x=1691679114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p2XsPmwSqX9Gd1WyomM6zWpuzgKDAWrgDwIrAbNMU7I=;
        b=rsu2irE1H4DrWMvUp7Lbi5cNv2peQjK2wFAaVi1AlCBW47LZuUhKBJmSyO8Q9/i8sD
         nVR+Wt2h+zrq0KNpIqvqoObhen7ZLbRN+cFzSWJ/kBtlo4aw9ocsYGQ0GdgC8QljXPtv
         ygL+FJqzVrAo7EywuGIGZfI8dAS98PbxOPSXwhJc1/ACyHp4auMPOyi4OT63gDNE8vYi
         Nhzq2h7BoPIMex64gYhD6jzohC3+Rq8TWJWY7zBPVXI7EV7F7CS5D/QZyjP/GZZqD7JM
         L0pIrCmRbe3v2tSoCrOt8bNFQoApv+iI3lTXR8GItmyoOqFG25A0kVQ6BEvNIRy2oyQ3
         GGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689087114; x=1691679114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2XsPmwSqX9Gd1WyomM6zWpuzgKDAWrgDwIrAbNMU7I=;
        b=K3ZVJ6RArniV/iNOFmEWxAuF8vrLn95qFHq7p3zN9YZTl+CaLiaQvGKBMsxu7Zrh0N
         CnUqShnsRZvw64fkgnXmaWSA96CnL6+3qRBBOAXp3tdDpH3zqzMzta4YRfoE4FdVajkV
         0ckN62fKZGhfLhzatB/Hp41oaJvSu7YWo+TSMRnaFt6S9hBqKnSXD3DT5AjHPKKnUxEA
         nRUu4F33Mxo4X/ATAoMKCwrPljsWEuky74u7rzXiXweuo3XajEwxN0/KaNZ87hL/SCev
         OamEuoOr8wbUy86Ziir364/Gmxment+rPHJP3XJ/ZWsi8jR5ldpEmJN/SGaJRcHlxSQ3
         8WCA==
X-Gm-Message-State: ABy/qLaonGAH4RI1vBUBrt9JGG6kVXc7LlBoMMDH4wjoVgM/pqRi6iUS
        RigEez3+bq0RP01J7FvCWFaM3Q==
X-Google-Smtp-Source: APBJJlEsnz+jmijOqb/3+xiSUoZqe+lJUQAWRgjneiCrf6EOnQnP3uZ2g1TWr9YlHGHSF2b40Waenw==
X-Received: by 2002:a2e:7c18:0:b0:2b6:e651:8591 with SMTP id x24-20020a2e7c18000000b002b6e6518591mr5441446ljc.37.1689087114101;
        Tue, 11 Jul 2023 07:51:54 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a10-20020a2eb16a000000b002b6ee363337sm492454ljm.120.2023.07.11.07.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 07:51:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v4 00/11] phy: qcom-qmp-ufs: convert to newer style of bindings
Date:   Tue, 11 Jul 2023 17:51:42 +0300
Message-Id: <20230711145153.4167820-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
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

Changes since v3:
 - Rebased on top of phy-next

Changes since v2:
 - Moved status property to the last place for msm8998, sdm845 (Konrad)

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

 .../phy/qcom,msm8996-qmp-ufs-phy.yaml         | 228 ------------------
 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        |  48 +++-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  25 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |  18 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  19 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi          |  17 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi          |  18 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |  20 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  20 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi          |  28 +--
 arch/arm64/boot/dts/qcom/sm8450.dtsi          |  28 +--
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       |  10 +
 12 files changed, 114 insertions(+), 365 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/qcom,msm8996-qmp-ufs-phy.yaml

-- 
2.39.2

