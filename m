Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BB155747E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 11:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237669AbiGNJKy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 05:10:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237659AbiGNJKu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 05:10:50 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CE962A26E
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:10:48 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id t1so1751988lft.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yas1EK+Lg1tB+k2/KKrOSpNmOwlnNNkyZMQY2cJgMdc=;
        b=vjjPOwMoQLpDt3HEOqYUUUodyCCgSNFmWzdk99MWY7QCQr7YwfC1uAEkoyX8kjaUzj
         oV5Vh3L5ox15ZxfBvadHW2p5xQEj7tX7+3E7tFzyb6fN/L5hR+ra1y2/7QlhlmD0pJp+
         XK7KjicnR3sq1sCUIRETdas1I9hRBj6oIO39moM5vD3tdhs/a7VdLUe//CbReO5UakEi
         bSLOjfQRUHyWwDoPuJUHjeSM+K/Or1yhMjI3gt+4oCXd31v+3P5jkHLRVi75OKQYrvjP
         dwcUJPlcVcLKZr8EAW+XDnr83SLWtIfFsQjZ98D2tcrA5aUJQe+hNmIhFm4IBQRFTJux
         mCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yas1EK+Lg1tB+k2/KKrOSpNmOwlnNNkyZMQY2cJgMdc=;
        b=md+Z79Tams5rM1zaFzYfrocspb4uHLZLdJ9d/vKQoelPI/xfERjeZP831d2cL3SB87
         +Tr0f41JDiJ9coJVTE1vdSImlu4P5Hw4SZb5seEdyFuZFHSJCnTAgG+1uOZHF0g23HI/
         xMCFynSlYakg5QWFa6nfO+qOzfmQK2HdyH4CwBICzTUgFcPNk461VMNOJPt66COHx4xe
         9QHUI2jcFJ+ZvzJ5ANpwl+ps67aWuMaFTkhx129oXfOKkIXwJKBg15ggtkNkS6e4D7nn
         KJ7rZO4KKayJ72PhMKLB4fvBc/13rOOjt8plWqodF0mgIKQlb0YTYgP6yq6TudCpds94
         jm8g==
X-Gm-Message-State: AJIora8PA5r55uZpePHOi7S+hr7AmFfXCxWIaNMXUMwm02RqicuyLJnB
        MWL9Gw/r29bvcxoTOsOOIIblBw==
X-Google-Smtp-Source: AGRyM1sLJwQoozs92CJqWSGGa9WPh444ya80rvOJn8Q+ePhAzDhHUOJKjery6nvv8cgsM1CQ+4xNbA==
X-Received: by 2002:a05:6512:3ca6:b0:489:cebe:a944 with SMTP id h38-20020a0565123ca600b00489cebea944mr4534921lfv.387.1657789846824;
        Thu, 14 Jul 2022 02:10:46 -0700 (PDT)
Received: from krzk-bin.. (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id d8-20020a056512368800b004790ef191e3sm250006lfs.216.2022.07.14.02.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 02:10:46 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Doug Anderson <dianders@chromium.org>
Subject: [PATCH v3 0/3] dt-bindings: mmc: / ARM: qcom: add MSM8998 and cleanup driver of_device_id
Date:   Thu, 14 Jul 2022 11:10:39 +0200
Message-Id: <20220714091042.22287-1-krzysztof.kozlowski@linaro.org>
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

Rationale/background:
https://lore.kernel.org/linux-devicetree/CAD=FV=WGxQF4vPuRi7kWKoqTpe0RFsgH+J82C=sQbmncK_AFpw@mail.gmail.com/

Changes since v2
================
1. Add Rb tags.
2. Add a comment to SDHCI driver to hopefully prevent re-adding of compatibles
(suggested by Doug).

Changes since v1
================
1. Add Rb tags.
2. Rework driver patch (now last in the series), after talk with Doug.

Best regards,
Krzysztof

Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: Doug Anderson <dianders@chromium.org>

Krzysztof Kozlowski (3):
  dt-bindings: mmc: sdhci-msm: add MSM8998
  arm64: dts: qcom: msm8998: add MSM8998 SDCC specific compatible
  mmc: sdhci-msm: drop redundant of_device_id entries

 .../devicetree/bindings/mmc/sdhci-msm.yaml    |  1 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |  2 +-
 drivers/mmc/host/sdhci-msm.c                  | 29 +++----------------
 3 files changed, 6 insertions(+), 26 deletions(-)

-- 
2.34.1

