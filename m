Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14C636544F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Dec 2022 17:14:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbiLVQO1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 11:14:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbiLVQO1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 11:14:27 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEB4C266C
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 08:14:24 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id l8so2353000ljh.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 08:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PbPXhuWWUXCRtpfbn6zcTOg0AnuCm5I9vIiDytL2HSE=;
        b=hoQ5+/ua4l1uCEHcyPzLxFU0z00ihnn+72AS2FvqOzEkhDnNgUbMTMmlZaMshGvN6F
         H9AiYgIGs+dKk1auU2FZVRzQRtQfh68uYuxPJZFXklP5j3GUux/O8MjV9Eg1GKPVriaT
         3fUFv1t4Xax1nCv2IxWyNtdkwki2Wwg1e78LtqvecXbS/WboO/S8s/pzvDbzikk8oWXc
         wrE1g9TDBXd3pxNAcsWHyryFGc0soFPmHfZcJMe7jgPigym1yjUn7rxMEYCOACQPK5zO
         tDk8GJvC4mQdJbZZPGKOlw5oWbPpXc1Yqy2fMAcn78ZWMRl1B2t9PnJUC/lfEsanEEmL
         SjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PbPXhuWWUXCRtpfbn6zcTOg0AnuCm5I9vIiDytL2HSE=;
        b=FlORhVSP9rIvzK7pC6F9Xtp8dRQMfit9UOkKxMRY9ccYX7V66vKIe0WUMPa6aKGJuc
         KZVbej5VZgvuucIerC0JoT+RZxWyPQlktVRlZ+o0Tsl22oDe2U1kN8rtLxnCXFgVW58J
         B3xIqMr7V/ZAKsbBTZT3hG/TDDl3hw0Pqv+Q9zyIvLPyp5NAY5u2Zq/TAhoXx15b2WNe
         63nnxAmYNZNEy+IlnZ0vqCPJ2dKmwdIVWO1lAT2DgXNRVafTbrvFdeJHWXyxkgYoIvqr
         RJATzs5VA7sQt/mvjXCddh+Eih6u4Tcf8lb0437nGI5J+m1lsRZy5g2zJj4SQstRUTvZ
         BRZA==
X-Gm-Message-State: AFqh2kr/zOCLlUB7hAncuRcqrTaw1Kb/RnCDRmeaMTJH9jANcf/yqAq+
        qZ1d2gvtCTEO4HoksPDz2gS+lA==
X-Google-Smtp-Source: AMrXdXu8ilr3WfblXfjnYbETxE1Xt6mHIdo6oVC3go86KQrgoWjBgFCDI+5ScStOnnoxmqAARd/q0Q==
X-Received: by 2002:a2e:b0e1:0:b0:27d:960:ab5e with SMTP id h1-20020a2eb0e1000000b0027d0960ab5emr1772402ljl.50.1671725663097;
        Thu, 22 Dec 2022 08:14:23 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id x24-20020a05651c105800b002797d6bb516sm89450ljm.20.2022.12.22.08.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Dec 2022 08:14:22 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi: add input-enable and bias-bus-hold
Date:   Thu, 22 Dec 2022 17:14:20 +0100
Message-Id: <20221222161420.172824-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Allow bias-bus-hold and input-enable properties (already used in SM8450):

  sm8450-qrd.dtb: pinctrl@3440000: dmic02-default-state: 'oneOf' conditional failed, one must be fixed:
    'pins' is a required property
    'function' is a required property
    'clk-pins', 'data-pins' do not match any of the regexes: 'pinctrl-[0-9]+'
    'input-enable' does not match any of the regexes: 'pinctrl-[0-9]+'

Compact the properties which are just set to true for readability.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Add input-enable.
---
 .../bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml     | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
index 01a0a4a40ba5..e04d094d1946 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
@@ -96,14 +96,12 @@ $defs:
           2: Lower Slew rate (slower edges)
           3: Reserved (No adjustments)
 
+      bias-bus-hold: true
       bias-pull-down: true
-
       bias-pull-up: true
-
       bias-disable: true
-
+      input-enable: true
       output-high: true
-
       output-low: true
 
     required:
-- 
2.34.1

