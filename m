Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD99F6FB28C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 16:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234544AbjEHOXa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 10:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234565AbjEHOX3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 10:23:29 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5AE030CB
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 07:23:24 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f415a90215so26703805e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 07:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683555803; x=1686147803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6omFeCMKQQj09/ceCLTqpP2YWnzqMpAujAZuytfA25g=;
        b=WK+4x1du+EC0kKmIMlbzuqct0pE/0Cko9zQNslmdC1PkWznBLsyekEUc59uHehlgT7
         TV7EME148ZTglVq1oDdbQOsugEBWIPJ9TDf9IOLB9cT6BrEtjL/Wk6+QmMQaO4rbOsHE
         hIm6UycPld+H7fLDQ1RgcWDWYPoZBQ8pqrd0AZJw8/NXltyreAcFM0VWqEpvHmhKR+3H
         clPSEVs8OSv5UAyQQ0Nwgrzrkublz5a69VA2cOPpmTJpS2qKxQhpUjYlsypfdPuRX7/o
         59qKLWpPCa6Y8yzrK+L4h+soyig9/bHhKSnQMvKgm1dwPVOFe/xCTAMJ1TfbhyyhV8GF
         ZhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683555803; x=1686147803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6omFeCMKQQj09/ceCLTqpP2YWnzqMpAujAZuytfA25g=;
        b=MQEf9RM0ijFuqeN2g5pz2If7nMHPw3OzDiqDjNwWq9J469T/VqrlN5iOfd+86hYaR9
         yrurYNy84gX+ecPJW1oM1xnn2NrtqP5tFtD9GsbtLHuk94qZmnSJxrcHrKJ8Zm5Yuz0u
         TndPlBN2aYz/sKNzw09Kfnuq8+NE2tsdDyRdyxtDez2CxQMlqsj5ZyTxzEVi+ZShXE7I
         C/Njg9WAGSYhKoo7NF9NIIvsqtVHcRU5/t4GoJExY77IsenvEt7CuTrQG6aIvuHjmcRY
         r+oTZMPPTe1znwbC0oFhjyTJwSvTTclFBGgCG4h9A+02JqFWNuVkh01YUMhDTQL6Vw1N
         fK2A==
X-Gm-Message-State: AC+VfDzSnIgk4wfVveLQM+yXm70jDCQzrn8uOfgTcuddbjuTQeA1WGMF
        H8gyx4aY8h5ZOnP46Br5YMO/Zw==
X-Google-Smtp-Source: ACHHUZ669I3J8BxvCD34EU7zYHtD35zO6U6nKxZAB1HtQo0VhKGbXrcH05zACMG5zDRvfdgD1hDGLg==
X-Received: by 2002:a7b:cd93:0:b0:3f1:6ec5:bc6f with SMTP id y19-20020a7bcd93000000b003f16ec5bc6fmr6799958wmj.24.1683555803164;
        Mon, 08 May 2023 07:23:23 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id y25-20020a05600c365900b003f42456c490sm4081544wmq.33.2023.05.08.07.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 07:23:22 -0700 (PDT)
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
Subject: [PATCH v7 04/13] dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: Add input and output ports
Date:   Mon,  8 May 2023 15:22:59 +0100
Message-Id: <20230508142308.1656410-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508142308.1656410-1-bryan.odonoghue@linaro.org>
References: <20230508142308.1656410-1-bryan.odonoghue@linaro.org>
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

