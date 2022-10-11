Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8D025FB99D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Oct 2022 19:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbiJKRaP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Oct 2022 13:30:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230228AbiJKR3G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Oct 2022 13:29:06 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEE8C69F7A
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 10:27:22 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id b25so3078073qkk.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 10:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVC3ghBKeR0GAUNqyIpEEaoUzp0peyvvuM658LrOc7c=;
        b=JSxkmtFRu9pP/yIi0SOqmm11v9rTRudrIzKlyV4Py5RoNAkRkjuZlRFEIN/OLyHmFd
         bmhOhRLwetSRh/mOaYF8toHuHQc2Mya64Zm0Ax0uMFTtbmxh01J5sBDVXf8RjWqrK2PW
         MII/sOa2Tbu6hXNeZRiM0ywr2fbtjTXzRD0foatL+6yPkzPi8MlOXVuussacbigB6r1K
         ktZ2qHa6klppU5kOwKjhbEyr3Rnn93OnUFYLscIRF6fDcAvSkjkKNDqRko03yA9nSG7O
         MjYEkHf3jKFDdVGIHMoaVod8wBrJS96dCdw6RFtS4+1fL8D3TNA6V5eeiiijk7WClDop
         Bl0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iVC3ghBKeR0GAUNqyIpEEaoUzp0peyvvuM658LrOc7c=;
        b=FVre1GfKtDIiG3wmho6gSkZ1sIWWlX2YPznkncAe2zIj8Ewibr+04IqUz+Z7qKftfJ
         M5ADvvTgYuEVYdY5A9NNNMQhmG79wenugitg5JbhSfMKNRJM10o/0Bl1QXLTy/933O0w
         a0Ilercu2MqKE3NpFxfaG7RZpNvJQELV+dhLLXc20KGUHyK5VcMuuMowZFimlAdotXDv
         eeJGPBDkMDuyS4ZImBZc+0UYkXCnCJfLIGj19YBkCud1wa3tgcm98pgyyDpj6ol98Ad9
         MBGoLbV3Vhbw1LbPePNtKsYIou++sYsFLU4MkYlmf5idUXTCDsgdttSO9M+seax6OmkA
         ZjGA==
X-Gm-Message-State: ACrzQf3nEnUfjkNTl3t90CORq2yc7EPWlfK4cTgVQiMHsbuoJ7Y49kD9
        TjP0Z0cZTtS1/B3P1d1CIncmsw==
X-Google-Smtp-Source: AMsMyM7aP5SwnQI4N0sh9iVjBKepYIo1wyJ8sJBlgNljUelfnGlYbXoTDCz/XcO/al0V9wRIp6wLMA==
X-Received: by 2002:a05:620a:4809:b0:6ce:496c:7e78 with SMTP id eb9-20020a05620a480900b006ce496c7e78mr17072444qkb.470.1665509214420;
        Tue, 11 Oct 2022 10:26:54 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id i14-20020a05620a248e00b006bba46e5eeasm14289087qkn.37.2022.10.11.10.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 10:26:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 31/34] dt-bindings: pinctrl: qcom,sc8280xp-lpass-lpi: minor style cleanups
Date:   Tue, 11 Oct 2022 13:23:55 -0400
Message-Id: <20221011172358.69043-32-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
References: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop "binding" from description (and align it with other Qualcomm
pinctrl bindings), use double quotes consistently and drop redundant
quotes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml    | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml
index edf38c774514..7d2589387e1a 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml
@@ -4,15 +4,14 @@
 $id: http://devicetree.org/schemas/pinctrl/qcom,sc8280xp-lpass-lpi-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Technologies, Inc. Low Power Audio SubSystem (LPASS)
-  Low Power Island (LPI) TLMM block
+title: Qualcomm SC8280XP SoC LPASS LPI TLMM
 
 maintainers:
   - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
 
-description: |
-  This binding describes the Top Level Mode Multiplexer block found in the
-  LPASS LPI IP on most Qualcomm SoCs
+description:
+  Top Level Mode Multiplexer pin controller in the Low Power Audio SubSystem
+  (LPASS) Low Power Island (LPI) of Qualcomm SC8280XP SoC.
 
 properties:
   compatible:
@@ -35,7 +34,7 @@ properties:
 
   gpio-controller: true
 
-  '#gpio-cells':
+  "#gpio-cells":
     description: Specifying the pin number and flags, as defined in
       include/dt-bindings/gpio/gpio.h
     const: 2
@@ -120,7 +119,7 @@ required:
   - clocks
   - clock-names
   - gpio-controller
-  - '#gpio-cells'
+  - "#gpio-cells"
   - gpio-ranges
 
 additionalProperties: false
-- 
2.34.1

