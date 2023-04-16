Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3896E37FF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Apr 2023 14:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbjDPMcO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Apr 2023 08:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbjDPMcN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Apr 2023 08:32:13 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 603D32711
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Apr 2023 05:32:07 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id dx24so13213089ejb.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Apr 2023 05:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681648325; x=1684240325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VhBAvcm9tyRA8/979lwV0KyMRQj1au6h5cQh6+QT6Qs=;
        b=QWlek5J6V61fuqzGjcO8ovcm2j8cbxpvXPQLu3YXW2WH/+iouU0/mx7B0MR8xuHjId
         rB3jfURmyH+/RRXwcumLAA8eo1EkiL/Ujnhbe/8pFPS/L9Kvafe165vQmwDDSdi0Q3ru
         xmHHS0741SWMD/5pU9lB0+gx417aDQFBfaYV8VcT8Eei19tDnYySdaMKUsTD6rVVUX0v
         AO1J6WptE7JrpfbfTKvyOe0ULWxnMQIHVFt5kOsT+Jm1tG0lfx3ZpYVUikIrAPyhUrj8
         FgzNdhzkF/dijRSgrGS+zYpj4Zx3Es5sY80sa0dcfamVVcWKtF32D9O2LnFxxQofsvRl
         JiPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681648325; x=1684240325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VhBAvcm9tyRA8/979lwV0KyMRQj1au6h5cQh6+QT6Qs=;
        b=MoQ9UuYrBU1WyBHIrQ+e+znGla6GCCBOHC+XWmgJkQ4vyq8YF1h1+w9ju/zmrr8DEZ
         H4EIbYKkw5pdHJDIgWWTCAX+xPe2A+P8N/bwPTsBnE4CCG3KOu4uD9W0OaF3LDrztze+
         IgYM/czaQbpPvCENJO7grXVwMMqmd/iOzsTIsbar3hpEPVFrrtMeu/lFVwOMUj5hIQ7z
         +ZsiiZIVyES+aMyCWIsNFCPjbj2QRREOX8hd5aKTK9nKR+XdVbaeE3C/W3QpIFhjA3rD
         8lXr2grq0X8pAZsz4Xyzg8a3zHfFxLJni+Y/A6QCdKUIwgGM44m7ojYhulPIZzoCFJSx
         Xrrg==
X-Gm-Message-State: AAQBX9cO8gakvD+GwZgc28tZH1LrdzGCjxIEfTGSrVLLSOjlQlHyvmCB
        H5vaXqUn+WnEKxtyPoZelSxGQg==
X-Google-Smtp-Source: AKy350avB09N/H1jNK2PJitkIXKpRTlXUdcrqIO6cmQkRduHXVQm2OgwPQALinn2uGV7vckAsVw1bw==
X-Received: by 2002:a17:906:3d6:b0:94f:1a23:2f1c with SMTP id c22-20020a17090603d600b0094f1a232f1cmr3562624eja.50.1681648325688;
        Sun, 16 Apr 2023 05:32:05 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:29dd:ded4:3ccc:83db])
        by smtp.gmail.com with ESMTPSA id ld4-20020a1709079c0400b0094eaa31aa63sm4841394ejc.77.2023.04.16.05.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 05:32:05 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: document flash LED controller
Date:   Sun, 16 Apr 2023 14:32:03 +0200
Message-Id: <20230416123203.299740-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm SPMI PMIC come also with a LED controller for flash LEDs,
already used in DTS:

  sm8250-hdk.dtb: pmic@5: 'led-controller@d300' does not match any of the regexes: ...
  From schema: Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 476c616daf4d..34de4feef911 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -139,6 +139,10 @@ patternProperties:
     type: object
     $ref: /schemas/pinctrl/qcom,pmic-gpio.yaml#
 
+  "^led-controller@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/leds/qcom,spmi-flash-led.yaml#
+
   "^nvram@[0-9a-f]+$":
     type: object
     $ref: /schemas/nvmem/qcom,spmi-sdam.yaml#
-- 
2.34.1

