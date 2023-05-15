Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A068702E4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 May 2023 15:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242370AbjEONg4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 May 2023 09:36:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242350AbjEONgx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 May 2023 09:36:53 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77BB41FEE
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 06:36:52 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f509ec3196so30448405e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 May 2023 06:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684157811; x=1686749811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6omFeCMKQQj09/ceCLTqpP2YWnzqMpAujAZuytfA25g=;
        b=msO51y08gA/spSvolZcVIaHkF8dg0KHRN6Qb27FRLYaCqOYS1XehFbYrTsgYiXsgus
         fRn43yrxu7TCZ0sDMDlLA+qCKHkZ4oZSHi2JKmbfWR9rgLPYRD8fzYw21Pg2yBAHMxsh
         b0i5YdSMasHgtA8x0xiFZqNhn64wl5+bkzRQHb01FYzif040Y+k6epKVFdSIphBnuQHi
         ztbB7vjLepsOg21BPgdIXPaXIUMwklTEBvGeegFvgjsSR2jGGbf+gPoulJD7sYQG4bdF
         qQuWLL89fKPFLAzYGxeiu2mnGcyaB9sVOaJ6N9UPjJ5zQOPmE0WEsgkxXHb/pJrmqd07
         36kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684157811; x=1686749811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6omFeCMKQQj09/ceCLTqpP2YWnzqMpAujAZuytfA25g=;
        b=OBlnZWFwUQ8eHzUk+S4ORrsXDglGDQ5wkhwvUX9lY3TOaELN/UxfXJVTBb6GTLpOc1
         5nOE+Owc70LdzQbgw9fXrXmR0QH+57+yItEfjhWmbA4KXs+QLuDdnL83NG2WSovtUzyn
         1W+5qnoTKj/lqAdeJQdJ+ze4ZA01RBi9Q7xbHFveWunfKNU3VQYMOZda3AC3shzdhp1W
         JBaBLzmgoiXhk4roAhfMzlAxcyMzEAWNj0Mjbo4+OJ+TmVK04pNFXkVfrFBUWn+cmJpy
         ess5kTsScN1+dppSRDu0FBGWjbgixct5gDz5Vo7Fj9AxRzeRkZeyt7Z4CrkrlcWM7b9f
         Sa7g==
X-Gm-Message-State: AC+VfDyDEP5HlxHy84ZEd8hvbsy9tS7h2aLmXBBdOOFLSZ0pl5KXt7uw
        h7S1DVeN1Cnb15Y/ya1qqo2S/A==
X-Google-Smtp-Source: ACHHUZ4TH/e8glnpbdncFVTRaYoUftgHLa97FFp8FlGRWLTYgzFxTyr12MGjPEjjbiFVbJQqp3ThEQ==
X-Received: by 2002:a5d:4292:0:b0:2ef:d0de:e8a4 with SMTP id k18-20020a5d4292000000b002efd0dee8a4mr24586008wrq.25.1684157811007;
        Mon, 15 May 2023 06:36:51 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o17-20020a5d4091000000b003078a3f3a24sm28856634wrp.114.2023.05.15.06.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 06:36:50 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        luca.weiss@fairphone.com, lujianhua000@gmail.com,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     konrad.dybcio@linaro.org, caleb.connolly@linaro.org,
        bryan.odonoghue@linaro.org, subbaram@quicinc.com,
        jackp@quicinc.com, robertom@qti.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 04/11] dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: Add input and output ports
Date:   Mon, 15 May 2023 14:36:36 +0100
Message-Id: <20230515133643.3621656-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230515133643.3621656-1-bryan.odonoghue@linaro.org>
References: <20230515133643.3621656-1-bryan.odonoghue@linaro.org>
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

Add a ports declaration which is optional containing two port@
declarations.

port@0 to receive an orientation-switch message from the Type-C port or
redriver

port@1 to subsequently transmit the orientation-switch on once the PHY has
finished doing its orientation turn-around.

If ports is declared the input port port@0 is mandatory but the output
port@1 is optional.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
index d307343388888..c370b9cd58c2e 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
@@ -65,6 +65,25 @@ properties:
     description: Flag the port as possible handler of orientation switching
     type: boolean
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: OF graph bindings that model incoming orientation-switch and
+      outgoing orientation-switch messages. An example of an incoming
+      orientation-switch message might come form a Type-C connector or a USB
+      redriver. An example of an output would be a DisplayPort controller.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Type-C mux orientation-switch input.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: PHY orientation-switch output.
+
+    required:
+      - port@0
+
   resets:
     items:
       - description: reset of phy block.
@@ -279,4 +298,23 @@ examples:
             #clock-cells = <1>;
             #phy-cells = <0>;
         };
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                qmpphy_typec_mux_in: endpoint {
+                    remote-endpoint = <&pmic_typec_mux_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                qmpphy_typec_mux_out: endpoint {
+                    remote-endpoint = <&dp_typec_mux_in>;
+                };
+            };
+        };
     };
-- 
2.39.2

