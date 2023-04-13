Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A30906E0CA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Apr 2023 13:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbjDMLfY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Apr 2023 07:35:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230397AbjDMLfX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Apr 2023 07:35:23 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83FB6A24E
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 04:34:56 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id e16so621999wra.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Apr 2023 04:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681385686; x=1683977686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiyA5dOXEs9c5OnRUE62keTnd8lggiz6+vIXGOmgiCQ=;
        b=S5Ur+Ujn68RuX2PpNTQ7fONDlGamXf75Y4Vl43TMxmrZqVjcq18IT4ukrotvWvFP1y
         DdPNvpZvt/EfScS22k9nj7105vw97Gs+C7pZhr/4SgWPCxvl9L9idcUji9w01c/9hrB6
         9M4snccGTPokKHOUcMyneV/i1PDTT+oh4tUYVlg7ViLh5b2Tz0ho2t9fh3aEB7RbVtDi
         c0O44k7NZPdFsKcjJDyJ/wh0muYUBwGpeG5Lz2gEU25AGwvFb6Lg5yfy+3m+Yc4MO+Tj
         xB0DFlEHZTkDvKhXz/Jfv6dxGwouLN8KDyUX0+4IfhReN5fRXSJPusjCN9TQXkoryTMc
         Io4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681385686; x=1683977686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiyA5dOXEs9c5OnRUE62keTnd8lggiz6+vIXGOmgiCQ=;
        b=ZA6jg+zShb+E1WCEAurtL0NTyXlwffYCF5dQTIBGiO1SS891FiRCg6ZcoXAbhXlMk+
         64Vh9la/fIc2FYX3olZ7ZNUca/+cXu46HDO4P1gwPJZWrtd2sOfrwjJaEHvVs5j9pFMQ
         kQxfkptYDvMygN2cefyUmKA3Xh6onlFPY4Jpw/m98uhQA+5BnibFuh+H/J+iCmqc9uxB
         80O/M2tMJGu4Pe1rBnIPR4A4gw9sKXFsbQoOhyc2jdOX+l4DxdAuQV7z/8YHMNZNJdUb
         eIZ+bxskLew0yFyhyrzTJeE9waHGxF0gArNMyuknzUIcyHvMYo7eQpwGr/HX0gDcTFQz
         FLnw==
X-Gm-Message-State: AAQBX9fsOV1DZMykGde9NjuqzQR1lP7bvwtpodKi1PiNQ4lovRO3zIXK
        SFGVlJ7ZW4GDkrMFJWEI1PLGJg==
X-Google-Smtp-Source: AKy350YPkWer8m5zj1FsiYj5yiQWWshL2i1fQnKMMCDq2eflNZ3GcMbtUQKvlY9nCy0mjNb7InB2WA==
X-Received: by 2002:a5d:6444:0:b0:2f5:67c1:d70e with SMTP id d4-20020a5d6444000000b002f567c1d70emr1348644wrw.21.1681385686182;
        Thu, 13 Apr 2023 04:34:46 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id e16-20020a5d4e90000000b002f2782978d8sm1108877wru.20.2023.04.13.04.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 04:34:45 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, bryan.odonoghue@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
Subject: [PATCH v5 04/14] dt-bindings: phy: qcom,sc7180-qmp-usb3-dp-phy: Add ports as an optional
Date:   Thu, 13 Apr 2023 12:34:28 +0100
Message-Id: <20230413113438.1577658-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
References: <20230413113438.1577658-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add ports as an optional

port@0 to receive an orientation-switch message from the Type-C port or
redriver

port@1 to subsequently transmit the orientation-switch on once the PHY has
finished doing its orientation turn-around.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../phy/qcom,sc7180-qmp-usb3-dp-phy.yaml      | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
index d307343388888..9ef69ad12b74a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc7180-qmp-usb3-dp-phy.yaml
@@ -65,6 +65,22 @@ properties:
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
+        description: PHY orientation-siwtch output.
+
   resets:
     items:
       - description: reset of phy block.
@@ -279,4 +295,22 @@ examples:
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

