Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 286F656D7EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 10:29:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbiGKI3v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 04:29:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbiGKI3u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 04:29:50 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E50C81EEDD
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 01:29:47 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id e28so3897657lfj.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 01:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/jycAZFIZlkVpDgk+m+gRGDDajNp2iCR9akdaBzJOSA=;
        b=deon5Cf2YEZBPOmXPFKpikGkuFHYoNEjCqLrVo1Zb0qbk/DOPx0nJQxUNBox4tj1Ge
         BVLPhg7Mglhgkr6sWFVxrfkS99AdxEXCy97GhCTgFzYB1toW0AV1exnllPYI9b/drUUY
         9Z31kT7jrXEgBQ6+ETUjPOPDvXVk7N7/lP+VI34yXiPzlJN/bIlrzPdIniq9nf2Z1Pst
         bYyQCj1C7vbMFLBcJeqCtKC6gxcXEgO6G9T5jFy0aVqOYzgeZvIGo5OzYhUyuRmJBuj3
         iLcWLu8HTxhz6/KFXBUM3gHrC+k/5Xe/V1njJcpBUWU/DAyKOgTzUaYo+gDI4XtPf0wb
         BW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/jycAZFIZlkVpDgk+m+gRGDDajNp2iCR9akdaBzJOSA=;
        b=zhI4qEvzxEzuUJdsyC4s//sza4hLAZ2lTQi++h72hVDBi5LpAN/2HSXbtBglYXzVAJ
         6SxEjvsJz2QsGBJtNeNCc7I3voU/S+PQ3aAYl1nYprlZT/3FaD5FuiUC/KRnY9SMnxov
         08QwE6+hISSs6+RRnaJn4uWRq7Fx4sfDctdqhL3OFT4Otp4F86Q20OnTYLNnGDT204pu
         gc4p5hAuE2aoPXpkDVw6tRCmvNuT5xaRrril1s7mOTjju9GWslNqsoVsUA3nqR0MqOYG
         nyx+n419NMjYSGJOtq2NlJ5mUA7UKnNL1xuaqkfqtn4HDxfgKRH7/lF9Jngd4kPLCYaf
         vipg==
X-Gm-Message-State: AJIora9IkKEM6n7L+PlFm+pk9bWwu27oSdlg+tMxzqlQI7F/jla4QwWl
        JhMZbG3RLZ10XcmUgDpyxfmEpg==
X-Google-Smtp-Source: AGRyM1sz5Ax1f0yFBRJPQzyqUQJhhfc9Hp15pLCPtcQzgCWrtRvZeZvn9CAzo7nC4DWKFCUNn6Mryg==
X-Received: by 2002:ac2:4e11:0:b0:483:4227:30e with SMTP id e17-20020ac24e11000000b004834227030emr10293528lfr.289.1657528186283;
        Mon, 11 Jul 2022 01:29:46 -0700 (PDT)
Received: from krzk-bin.. (fwa5cab-55.bb.online.no. [88.92.171.55])
        by smtp.gmail.com with ESMTPSA id u2-20020a05651206c200b00488ab8914b5sm1401504lff.213.2022.07.11.01.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 01:29:45 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Douglas Anderson <dianders@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/5] dt-bindings: mmc: / ARM: qcom: correct reg-names and clock entries
Date:   Mon, 11 Jul 2022 10:29:35 +0200
Message-Id: <20220711082940.39539-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Hi,

No dependencies.  DT bindings patches are independent from DTS, so they can go
via separate tree.

Changes since v1
================
1. Add Rb tags.
2. Rework reg-names constraints according to Doug's feedback.

Best regards,
Krzysztof

Krzysztof Kozlowski (5):
  dt-bindings: mmc: sdhci-msm: fix reg-names entries
  dt-bindings: mmc: sdhci-msm: constrain reg-names perp variants
  arm64: dts: qcom: align SDHCI reg-names with DT schema
  ARM: dts: qcom: align SDHCI reg-names with DT schema
  ARM: dts: qcom: align SDHCI clocks with DT schema

 .../devicetree/bindings/mmc/sdhci-msm.yaml    | 61 ++++++++++++-------
 arch/arm/boot/dts/qcom-apq8084.dtsi           | 16 ++---
 arch/arm/boot/dts/qcom-ipq4019.dtsi           |  5 +-
 arch/arm/boot/dts/qcom-msm8226.dtsi           | 24 ++++----
 arch/arm/boot/dts/qcom-msm8974.dtsi           | 24 ++++----
 arch/arm/boot/dts/qcom-msm8974pro.dtsi        |  6 +-
 arch/arm/boot/dts/qcom-sdx65.dtsi             |  2 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi         |  2 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi         |  4 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi         |  4 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi         |  4 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  4 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |  2 +-
 13 files changed, 87 insertions(+), 71 deletions(-)

-- 
2.34.1

