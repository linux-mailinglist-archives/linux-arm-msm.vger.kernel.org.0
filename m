Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07B7F744DC4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jul 2023 15:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbjGBNnZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 09:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjGBNnY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 09:43:24 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54436E69
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 06:43:23 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b69923a715so54459221fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 06:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688305401; x=1690897401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vLuexr7NAUfWT2/HDhg3mtXe+TEPWAZI5+vgB3CHmyY=;
        b=crWkKGLrsCFZYD44IWSkgz7sUBAj//nDbADt7I4QT52qGVUJtyHc15/EcBII+EyaTf
         GS29diRMetsHEVIGZQBpb9go5+5s6/OiVr+AvZPuTIJ1JY0uzlo298BNtIuOiKRUl0ZR
         Rl3t55+OwBjAxWpyPnalpI/uKq4UHLlxx9z4slJzg99a3Hf/44HH1qDLDPc9k63CpTAd
         XYfQ/c+3U5Jal1aajm9VoA4/gPUP7NO2nXwpHdvvxHlPYG7Wq3qB0WCyFhKdsrsAChmC
         zJPU2laVW/PdvxJ2mpsgSEFtfPwDd4hx4hrqKJGpCGo0/AVrKy6gKVmUKyhi1qEMjIRy
         jlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688305401; x=1690897401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vLuexr7NAUfWT2/HDhg3mtXe+TEPWAZI5+vgB3CHmyY=;
        b=U7a9GLqubLWBjcW6Cf7uQkxRwx5Pn6G7leNWO9mmqvRL/1FftiYoTAEdk9pWfSmSXV
         oV1tJnxpYYOynJk3m54aBaemqzlA7/5lrzpkW6x0A/zpg7PlGvKT5sp3xhEyrhw/FCbb
         D2sxab8YeZWG+7KVeNPKdLfN5l9l2H3cmQN7PO4kMc7HHWfq6uvBfPFE4sP0I4FZHug/
         5ytteEb7nsaqOkAaIM5Dzf/wR74P4m6WBSiWDWmHYRSnfu8Vu2hknBI4fvPfciCnIce4
         XPn+z4oUehCAnmmnJNktBRSMobjSwmNad9xRA48v1QHiDqQhFzPVLzeOc3cCOGBTvlNV
         8pxg==
X-Gm-Message-State: ABy/qLbKRmPc2uieFGc588LwNVAMpWNYSdYzYlX9BtDaGRlnMYK96lHZ
        PtAekL9SM6IEDIzRPVXPJjzy3A==
X-Google-Smtp-Source: APBJJlH0RKAiT0zU+eSKW8eNftrtsYD75IJ1pBObeYmC4hVNqP1AYS0xA+to1IqRF3He77q+WopvmQ==
X-Received: by 2002:a2e:9d98:0:b0:2b6:cc3b:5645 with SMTP id c24-20020a2e9d98000000b002b6cc3b5645mr5559622ljj.49.1688305401420;
        Sun, 02 Jul 2023 06:43:21 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d9-20020a2e96c9000000b002b6988ca476sm4310650ljj.101.2023.07.02.06.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 06:43:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 00/27] ARM: dts: qcom: cleanup PMIC usage
Date:   Sun,  2 Jul 2023 16:42:53 +0300
Message-Id: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

While reviewing APQ8064 CPUFreq patchset, Konrad pointed out that PMICs
are not a part of SoC and as such do not belong to the per-SoC files.

Cleanup the way 32-bit Qualcomm platforms treat PMICs:

- Move SSBI PMICs to separate files (as a bonus merging two different
  instances of PM8921, benefitting both platforms).

- Include such PMIC files only from the board files, keeping SoC file
  generic.

- Move RPM regulator definitions to board files too. They do not belong
  to the SoC dtsi files for the same reason.

- Move PMIC-specific GPIOs and supply properties to individual board
  files.

Changes since v1:
- To ease reviewing break cleanups from the  "split PMIC" patches
  (Konrad).

Dmitry Baryshkov (27):
  ARM: dts: qcom: apq8064: correct XOADC register address
  ARM: dts: qcom: msm8960: introduce label for PMIC keypad
  ARM: dts: qcom: msm8660-surf: use keypad label directly
  ARM: dts: qcom: apq8064-nexus7: move sdcc1 node to proper place
  ARM: dts: qcom: mdm9615-wp8548-mangoh-green: group include clauses
  ARM: dts: qcom: strip prefix from PMIC files
  ARM: dts: qcom: apq8064: fix PMIC node labels
  ARM: dts: qcom: mdm9615: fix PMIC node labels
  ARM: dts: qcom: msm8660: fix PMIC node labels
  ARM: dts: qcom: msm8960: fix PMIC node labels
  ARM: dts: qcom: msm8960: split PMIC to separate dtsi files
  ARM: dts: qcom: apq8064: split PMICs to separate dtsi files
  ARM: dts: qcom: mdm9615: split PMIC to separate dtsi files
  ARM: dts: qcom: msm8660: split PMIC to separate dtsi files
  ARM: dts: qcom: pm8058: reorder nodes
  ARM: dts: qcom: pm8921: reorder nodes
  ARM: dts: qcom: pm8018: move reg property
  ARM: dts: qcom: pm8921: move reg property
  ARM: dts: qcom: pm8058: use defined IRQ flags
  ARM: dts: qcom: pm8921: switch to interrupts-extended
  ARM: dts: qcom: pm8018: switch to interrupts-extended
  ARM: dts: qcom: pm8058: switch to interrupts-extended
  ARM: dts: qcom: apq8064: move RPM regulators to board files
  ARM: dts: qcom: mdm9615: move RPM regulators to board files
  ARM: dts: qcom: msm8660: move RPM regulators to board files
  ARM: dts: qcom: msm8960: drop useless rpm regulators node
  ARM: dts: qcom: msm8974: move regulators to board files

 arch/arm/boot/dts/qcom/pm8018.dtsi            |  55 +++++
 arch/arm/boot/dts/qcom/pm8058.dtsi            | 159 +++++++++++++
 .../qcom/{qcom-pm8226.dtsi => pm8226.dtsi}    |   0
 arch/arm/boot/dts/qcom/pm8821.dtsi            |  22 ++
 .../qcom/{qcom-pm8841.dtsi => pm8841.dtsi}    |   0
 arch/arm/boot/dts/qcom/pm8921.dtsi            | 136 +++++++++++
 .../qcom/{qcom-pm8941.dtsi => pm8941.dtsi}    |   0
 .../qcom/{qcom-pma8084.dtsi => pma8084.dtsi}  |   0
 .../dts/qcom/{qcom-pmx55.dtsi => pmx55.dtsi}  |   0
 .../dts/qcom/{qcom-pmx65.dtsi => pmx65.dtsi}  |   0
 .../dts/qcom/qcom-apq8026-asus-sparrow.dts    |   2 +-
 .../dts/qcom/qcom-apq8026-huawei-sturgeon.dts |   2 +-
 .../boot/dts/qcom/qcom-apq8026-lg-lenok.dts   |   2 +-
 .../qcom-apq8026-samsung-matisse-wifi.dts     |   2 +-
 .../dts/qcom/qcom-apq8060-dragonboard.dts     | 146 +++++++-----
 .../dts/qcom/qcom-apq8064-asus-nexus7-flo.dts |  69 +++---
 .../boot/dts/qcom/qcom-apq8064-cm-qs600.dts   |  31 +--
 .../boot/dts/qcom/qcom-apq8064-ifc6410.dts    |  38 ++--
 .../qcom-apq8064-sony-xperia-lagan-yuga.dts   | 110 +++++----
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi      | 195 +---------------
 .../dts/qcom/qcom-apq8074-dragonboard.dts     |  31 ++-
 .../boot/dts/qcom/qcom-apq8084-ifc6540.dts    |   2 +-
 arch/arm/boot/dts/qcom/qcom-apq8084-mtp.dts   |   2 +-
 .../qcom/qcom-mdm9615-wp8548-mangoh-green.dts |   4 +-
 .../boot/dts/qcom/qcom-mdm9615-wp8548.dtsi    | 139 +++++++++++-
 arch/arm/boot/dts/qcom/qcom-mdm9615.dtsi      | 181 +--------------
 arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts  |  59 +++--
 arch/arm/boot/dts/qcom/qcom-msm8660.dtsi      | 214 +-----------------
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts   |  21 +-
 .../qcom/qcom-msm8960-samsung-expressatt.dts  |   3 +-
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi      |  42 +---
 .../qcom-msm8974-lge-nexus5-hammerhead.dts    |  31 ++-
 .../qcom/qcom-msm8974-sony-xperia-rhine.dtsi  |  31 ++-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi      |  27 ---
 .../qcom/qcom-msm8974pro-fairphone-fp2.dts    |  31 ++-
 .../qcom/qcom-msm8974pro-oneplus-bacon.dts    |  31 ++-
 .../dts/qcom/qcom-msm8974pro-samsung-klte.dts |  12 +-
 ...-msm8974pro-sony-xperia-shinano-castor.dts |  31 ++-
 arch/arm/boot/dts/qcom/qcom-sdx55-mtp.dts     |   2 +-
 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts     |   2 +-
 .../dts/qcom/qcom-sdx55-telit-fn980-tlb.dts   |   2 +-
 arch/arm/boot/dts/qcom/qcom-sdx65-mtp.dts     |   2 +-
 42 files changed, 996 insertions(+), 873 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/pm8018.dtsi
 create mode 100644 arch/arm/boot/dts/qcom/pm8058.dtsi
 rename arch/arm/boot/dts/qcom/{qcom-pm8226.dtsi => pm8226.dtsi} (100%)
 create mode 100644 arch/arm/boot/dts/qcom/pm8821.dtsi
 rename arch/arm/boot/dts/qcom/{qcom-pm8841.dtsi => pm8841.dtsi} (100%)
 create mode 100644 arch/arm/boot/dts/qcom/pm8921.dtsi
 rename arch/arm/boot/dts/qcom/{qcom-pm8941.dtsi => pm8941.dtsi} (100%)
 rename arch/arm/boot/dts/qcom/{qcom-pma8084.dtsi => pma8084.dtsi} (100%)
 rename arch/arm/boot/dts/qcom/{qcom-pmx55.dtsi => pmx55.dtsi} (100%)
 rename arch/arm/boot/dts/qcom/{qcom-pmx65.dtsi => pmx65.dtsi} (100%)

-- 
2.39.2

