Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D801A4F04A1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Apr 2022 17:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357533AbiDBP6F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Apr 2022 11:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357523AbiDBP6A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Apr 2022 11:58:00 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEAFA17E30
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Apr 2022 08:56:01 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id p15so11637702ejc.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Apr 2022 08:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EuVHQKj00KiyE/jfkOjZYn3vY7PV3FTcEesPbvXU4jo=;
        b=eiKtSHZaOzxi0xEi2h4siGI7VE6mBVjFN6OJR24q1WgvVZ6kSRaOUEDYuBaigafCPm
         zJJwX0s57Try+onBevGkRSMSRmMjtD2jnHEnGMA7LKBMXjK7P3pPp92V5LzK7crnLpka
         gNzmNC+uGs1cNb83fwTIhpyAsCze1i38mKbswtxQVju+eTgpR1OMheczD7S1Lro8XjKd
         F1it+0NbsGC9TPrDGfdKtPmpX5XwS64ATtDTieFE40f87SbPMhMZnflYrRgzPXrgYuYH
         ofePZTxy65EZlp8mPIp02snTHluS3UJDHZ/KiIN4N+GHk4Ab3R8TYdHC3M7KIdx3Z25h
         xSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EuVHQKj00KiyE/jfkOjZYn3vY7PV3FTcEesPbvXU4jo=;
        b=RdF9ggBo/USgLY6RGcv0jQhPB8IbrEbtSvPue7hlNw7InHde7Rhk5csYqLkeojAICl
         gVF74eSgpB1leQbIladZ9u0eM3WdbiSYma5JqNhQ+fWHzN9SURWepexPF50uA9qA+Pov
         vrmGthT8hhyI6iKlwAHtZRtY62w/Ygh4ZBI0iXs0dc0E34+8VIAex9f+uQhTDv6NAJaD
         9vpjjblafwg5Qe757UpAV9/D58s5DsRPpHbf5GkxmWtAlLs91iOp9x0130zgpF5nUvgl
         3kGAZyAsKZW3jBi7YGQDUOaseWmAcU/YDRiRr7gq+2QjlAx/U8zv07SsgQyyN7/blCEu
         IxnA==
X-Gm-Message-State: AOAM531P8Oae79eHOghkXs5eFXpq4zw9RkUn5LAJXCup+3sHm1hd5Yw2
        ujFbC/qxg7EkLd4n+cmsk3fS7Q==
X-Google-Smtp-Source: ABdhPJxfLuqMATYwK9iSwU7NsddkjCUqupSmfKJN4fjzjdy/zsVfgOnyfdOxpAIE3kuLumpuxTC3uA==
X-Received: by 2002:a17:907:1ca8:b0:6df:f192:cf4a with SMTP id nb40-20020a1709071ca800b006dff192cf4amr4469091ejc.620.1648914960455;
        Sat, 02 Apr 2022 08:56:00 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id b12-20020a170906038c00b006e4e48969d2sm1479331eja.88.2022.04.02.08.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 08:55:59 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH 1/2] dt-bindings: mailbox: qcom-ipcc: simplify the example
Date:   Sat,  2 Apr 2022 17:55:50 +0200
Message-Id: <20220402155551.16509-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
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

Consumer examples in the bindings of resource providers are trivial,
useless and duplicating code.  Additionally the incomplete qcom,smp2p
example triggers DT schema warnings.

Cleanup the example by removing the consumer part and fixing the
indentation to DT schema convention.

Reported-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/mailbox/qcom-ipcc.yaml           | 29 +++++++------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index 866efb278813..dfdc72345a2a 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -61,23 +61,14 @@ additionalProperties: false
 
 examples:
   - |
-        #include <dt-bindings/interrupt-controller/arm-gic.h>
-        #include <dt-bindings/mailbox/qcom-ipcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/mailbox/qcom-ipcc.h>
 
-        mailbox@408000 {
-                compatible = "qcom,sm8250-ipcc", "qcom,ipcc";
-                reg = <0x408000 0x1000>;
-                interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
-                interrupt-controller;
-                #interrupt-cells = <3>;
-                #mbox-cells = <2>;
-        };
-
-        smp2p-modem {
-                compatible = "qcom,smp2p";
-                interrupts-extended = <&ipcc_mproc IPCC_CLIENT_MPSS
-                                IPCC_MPROC_SIGNAL_SMP2P IRQ_TYPE_EDGE_RISING>;
-                mboxes = <&ipcc_mproc IPCC_CLIENT_MPSS IPCC_MPROC_SIGNAL_SMP2P>;
-
-                /* Other SMP2P fields */
-        };
+    mailbox@408000 {
+        compatible = "qcom,sm8250-ipcc", "qcom,ipcc";
+        reg = <0x408000 0x1000>;
+        interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <3>;
+        #mbox-cells = <2>;
+    };
-- 
2.32.0

