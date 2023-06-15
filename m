Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FBE8731854
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 14:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344263AbjFOMOj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 08:14:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344012AbjFOMOg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 08:14:36 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9B761BDB
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 05:14:33 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3f736e0c9a8so15567905e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 05:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686831272; x=1689423272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ggxw8AJ4x4mujGVS6874wxSJqrcpmQspYJe004iAEM=;
        b=lM1if9k9keg0vDzbKt1AKO0xkJkVeN+rZ6FMpLcVodcQ7Jp8vDPzt9qq2+wP7YFcc7
         bQVrDiBsAinWN9P34UwWTJg5iSBMMEjgJYGCA1XQtPe3+/pT/pdbQl5x3ASa98cL/k4e
         L14/0sxIsK22vdCpIO97wFnmnCsZ2H+xmdRQfQxCPz/zUr2EduyFrzoELJIEXRN4p7Hr
         ApJH2FGz1TJQL0wGEykuYItgdGHK0fnBXCcS1lurpuqaVIHIClIIbeAYA3xWON+kJNSx
         6lY6wy4nz+cUSJmoBDwJbbGshHu4HchtugP3Tn3EhAr2KWSJMTyE3qWXYQaoAqtPV3g0
         mPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686831272; x=1689423272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ggxw8AJ4x4mujGVS6874wxSJqrcpmQspYJe004iAEM=;
        b=GaKkACoYPZ5zscwUGoSGnYkZ6WXgxB/EOiXAptnc2ubfCGfXifizFP/ocFiDxOOSQr
         HRcNXp/GfwFEFtjJOUjBQsQmrEGSoXwrUnJw7XzNz962lKckIElCsDLAHCwQ6RlpuY8A
         Do1tcLqcS/XqKHaMe6JRB9e79c49mr24yIcdyxrMB4w+HboDrCkBLBpqmP7w63eiEFdd
         TLClCdaQXJV7KLZLb1hsPS/iXyAp8BOyk76q648wcyHEmEXdwkuIiOCOXn0+HD9H43qc
         cyZOLKJeAPwQk6NC9Eo6Qr8iuyGL4R94WV7CR81PLjUOXd8vvDXnP/yADE0CneK0Zk2X
         8qXQ==
X-Gm-Message-State: AC+VfDwBtQUwYSoc4lATH7zEWhQALku4aHs26l7ZiABMqvO9w3KrP/yg
        GlsML2ETuzrt/+yLgMlm1KBkIA==
X-Google-Smtp-Source: ACHHUZ7+XHyQdkqyLOC/Dq+xUto1NKb5LQTqrupqa4BwTtzl1CCPc5GAJrjuw1I7+bALM5I6JonbMg==
X-Received: by 2002:a1c:4b13:0:b0:3f7:f264:3edc with SMTP id y19-20020a1c4b13000000b003f7f2643edcmr12461441wma.14.1686831272107;
        Thu, 15 Jun 2023 05:14:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2ad4:65a7:d9f3:a64e])
        by smtp.gmail.com with ESMTPSA id k17-20020a5d4291000000b003047ea78b42sm20918012wrq.43.2023.06.15.05.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 05:14:31 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>
Cc:     netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v2 00/23] arm64: qcom: sa8775p-ride: enable the first ethernet port
Date:   Thu, 15 Jun 2023 14:13:56 +0200
Message-Id: <20230615121419.175862-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There are three ethernet ports on sa8775p-ride. This series contains changes
required to enable one of the two 1Gb ports (the third one is 10Gb). We need
to add a new driver for the internal SerDes PHY, introduce several extensions
to the MAC driver (while at it: tweak coding style a bit etc.) and finally
add the relevant DT nodes.

v1 -> v2:
- move the phy-supply property from the MAC driver over to the SerDes PHY
  driver
- rework the SerDes PHY driver to work with the correct ordering of phy
  operations (init -> power_on -> set_speed)
- change the serdes_phy node label to serdes0 to be in line with other DT
  sources and make it ready for the second PHY instance
- dropped the status property from the example in SerDes PHY's DT bindings
  and moved properties around
- reworked the fourth clock in the ethqos driver: it's handled the same
  whether it's called rgmii or phyaux
- other minor tweaks
- use 0x0 consistently in DT
- squash dwmac and ethqos-specific bindings changes
- collected tags

Bartosz Golaszewski (23):
  phy: qualcomm: fix indentation in Makefile
  dt-bindings: phy: describe the Qualcomm SGMII PHY
  phy: qcom: add the SGMII SerDes PHY driver
  arm64: defconfig: enable the SerDes PHY for Qualcomm DWMAC
  net: stmmac: dwmac-qcom-ethqos: shrink clock code with devres
  net: stmmac: dwmac-qcom-ethqos: rename a label in probe()
  net: stmmac: dwmac-qcom-ethqos: tweak the order of local variables
  net: stmmac: dwmac-qcom-ethqos: use a helper variable for &pdev->dev
  net: stmmac: dwmac-qcom-ethqos: add missing include
  net: stmmac: dwmac-qcom-ethqos: add a newline between headers
  net: stmmac: dwmac-qcom-ethqos: remove stray space
  net: stmmac: dwmac-qcom-ethqos: add support for the optional serdes
    phy
  net: stmmac: dwmac-qcom-ethqos: add support for the phyaux clock
  net: stmmac: dwmac-qcom-ethqos: prepare the driver for more PHY modes
  net: stmmac: dwmac-qcom-ethqos: add support for SGMII
  net: stmmac: add new switch to struct plat_stmmacenet_data
  dt-bindings: net: qcom,ethqos: add description for sa8775p
  net: stmmac: dwmac-qcom-ethqos: add support for emac4 on sa8775p
    platforms
  arm64: dts: qcom: sa8775p: add the SGMII PHY node
  arm64: dts: qcom: sa8775p: add the first 1Gb ethernet interface
  arm64: dts: qcom: sa8775p-ride: enable the SerDes PHY
  arm64: dts: qcom: sa8775p-ride: add pin functions for ethernet0
  arm64: dts: qcom: sa8775p-ride: enable ethernet0

 .../devicetree/bindings/net/qcom,ethqos.yaml  |  12 +-
 .../devicetree/bindings/net/snps,dwmac.yaml   |   3 +
 .../phy/qcom,sa8775p-dwmac-sgmii-phy.yaml     |  55 +++
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts     | 109 +++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         |  42 ++
 arch/arm64/configs/defconfig                  |   1 +
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 284 ++++++++---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |   2 +-
 drivers/phy/qualcomm/Kconfig                  |   9 +
 drivers/phy/qualcomm/Makefile                 |   3 +-
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c     | 451 ++++++++++++++++++
 include/linux/stmmac.h                        |   1 +
 12 files changed, 895 insertions(+), 77 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
 create mode 100644 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c

-- 
2.39.2

