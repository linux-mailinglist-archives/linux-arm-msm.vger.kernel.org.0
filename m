Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 838B15F131E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 22:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232224AbiI3UFt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 16:05:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232216AbiI3UFr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 16:05:47 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF10513F2B3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 13:05:43 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id a8so8410278lff.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 13:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=g/s25fFcFRGt0la+CChBB+sBdX3rR06NtZ97e/TRl5g=;
        b=me/zb+fTWwauv6a8wKXk9yOUdj4EAtMg04lETTXuDKjgI/eZDWpd++d6SmtVz3ucXc
         guFq17zdb/KB3klhaWvzujGg/3kTdh6Wc/q9NyIu7t1qR4OqsUjZvxdqIQ0CJrPuYFWx
         1zE6UYdas78gySILgPwOocpOE/R2xDb/Nag81tMpJVCP4VOZhaI9abp4EK7IaA+jldy7
         G3oQTMKmdaZSqlPVrYoMW/ws5ZARU6gn/sb8DD24/PnLlUx8nDcBkQxEcwJWZ0HT4DlX
         axZCh9bpDTZK39OUtYCHXRokhWZ4MDFTQz4U16FLWTFDccX/jPT8C2VGNXBJ2EhVIEyE
         JufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=g/s25fFcFRGt0la+CChBB+sBdX3rR06NtZ97e/TRl5g=;
        b=zIzXiL5PIVbZ4w/AdXGMBu04NkaJXtAsV2dBza8+ZdTh/2LzqBq4BSvLYXZxqzG9hl
         fbIDRQVKTYFey110dwqCwM7uQmG0TVdtQ4uIqQjyVoZvgUIq3zKMoEYJsbKUvLfMHCAw
         EkvCnitZEbdoghNuRVHJuWVXTA/Gef2xLL7LxyHn0+FgzCRksxAkvmg+rnfdFhHWMFHs
         9YjV+jaypW8h/jDTMZd7+QQkbizKzYMeWpxCyEIwqXxKbx6czgH/P18IB1727WZMG+LD
         FiHkv211hWPDM63aRWX6quRC3KtmtPrUfb8Rq7oHFVvqXJ0UA28/TMZjxegKM8wDoO6S
         qDlg==
X-Gm-Message-State: ACrzQf1D/wu+3oGy4/PSEWh4wU9/oOtdPKy9js3AhidtSb50SnRQwRxB
        bKGyDSLNTII+d6jmPk5NuHKRYQ==
X-Google-Smtp-Source: AMsMyM6pk4TIFeOeSsegG9bum/68726TptgPM44O7vmL/VW6rcp/ziYMJNNvGEwM+T+2wd5OKKvdxQ==
X-Received: by 2002:a05:6512:3502:b0:496:8e:9307 with SMTP id h2-20020a056512350200b00496008e9307mr3648621lfs.504.1664568342138;
        Fri, 30 Sep 2022 13:05:42 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id d10-20020ac2544a000000b00492f45cbbfcsm398876lfn.302.2022.09.30.13.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 13:05:41 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/2] pinctrl/arm64: qcom: convert sdm845 bindings to DT schema
Date:   Fri, 30 Sep 2022 22:05:27 +0200
Message-Id: <20220930200529.331223-1-krzysztof.kozlowski@linaro.org>
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

Hi,

Overview
========
This is independent patchset of my recent Qualcomm pinctrl fixes.

If the total amount of patches from me around Qualcomm pinctrl is a bit
overwhelming, well, yeah, expect more to come. One way to solve it is to
merge/apply faster than I can create new patches. :-)

Dependencies
============
1. No dependencies.
2. dt-bindings are independent of DTS patches.

Best regards,
Krzysztof

Krzysztof Kozlowski (2):
  arm64: dts: qcom: sdm845: align TLMM pin configuration with DT schema
  dt-bindings: pinctrl: qcom,sdm845: convert to dtschema

 .../bindings/pinctrl/qcom,sdm845-pinctrl.txt  | 176 ---------
 .../bindings/pinctrl/qcom,sdm845-pinctrl.yaml | 158 ++++++++
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    | 344 +++++++-----------
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |  76 ++--
 .../arm64/boot/dts/qcom/sdm845-lg-common.dtsi |  60 ++-
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts |   2 +-
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts       |  60 ++-
 .../boot/dts/qcom/sdm845-oneplus-common.dtsi  |  88 ++---
 .../boot/dts/qcom/sdm845-shift-axolotl.dts    | 138 +++----
 .../dts/qcom/sdm845-sony-xperia-tama.dtsi     |   6 +-
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts |  26 +-
 .../boot/dts/qcom/sdm845-xiaomi-polaris.dts   |  30 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          | 305 +++++++---------
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts |  33 +-
 .../boot/dts/qcom/sdm850-samsung-w737.dts     |  96 ++---
 15 files changed, 671 insertions(+), 927 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml

-- 
2.34.1

