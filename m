Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC1DD7C87CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Oct 2023 16:25:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232136AbjJMOZI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Oct 2023 10:25:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232147AbjJMOZH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Oct 2023 10:25:07 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F000FD9
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Oct 2023 07:25:04 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9936b3d0286so362476866b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Oct 2023 07:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1697207103; x=1697811903; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pm+/QnAH06Qh5wXqBp81N2OJaOoNdJfCQwZxxMt/91k=;
        b=pph0E6fhGwpDPYGHdJ+f3vTSJQyVAqRy23vSoatmaLrf4Hp/ijOOJcva0y8JEI32IB
         3vmOq515iDrM2O+ZnkxCuttdCaRY/7KMsqZD5oWBWZ/OTSDCwY5sM0eb+Jt9vLLLuRdY
         r5d8KWlfmSmCGVvR3WoazCmKI0evoivs3uJ8RlTfbkkFM+kMES4navijQXSVv6fRWFpP
         3RbISxpuzFcXz1n4WwYFbrD/yHc3TmjjnyTda7p9VQA6TK4+r4j92V2U09r/vPp+419Q
         0MI1ET8iM2PIK5HPnTrgcl2abyssP2675N0NcpGlur24AeRamdBecKHaz8GaFqZtb+91
         sOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697207103; x=1697811903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pm+/QnAH06Qh5wXqBp81N2OJaOoNdJfCQwZxxMt/91k=;
        b=SGVr+Cnptq0/0JDlY7oj4gTSCuQWOeO8Tm7tYocxQY/lx5QA2imodNNKg/I7aDagrB
         nicK/lT7LhU3QLUxPXAh0dO9uHeW2ZzTAxRQVx1iVzbaeOGvzxdNaPDzgO7A+5nkKDI6
         SY6owNPbBpIr5sgGSMOQYwEL6OLeJHuaxoXoaf4LBnW+Mok1X9rGEwMU06cJF7Zsga/x
         0wmQFUHSjvxUedvyAUx8ZzCByV/aKXlNo1ifbnQljuApBNdFAqGmtAaxUACv7km6nS4p
         Z3ULzm2r7uOll5ZytO+WufzcYidTxACzISJods0/02MSN3ZWiT014mMhHfNG0xGcQOGU
         uX4Q==
X-Gm-Message-State: AOJu0YwkMwuNPIPS+07br7LZRTuReZGHPc8BQL+Mt5QSgNhpBYr2pwpw
        uaZzPXNQtj2M6tSLlTTSvGGOsA==
X-Google-Smtp-Source: AGHT+IEMHIoikYOBPwPMaRKA5aN7QcZQ1oOpqza2EXBD4ZSE4wVpOOyjeOfCcf6CHIlTBsoBeOB9eQ==
X-Received: by 2002:a17:906:1d5:b0:9a1:bb8f:17de with SMTP id 21-20020a17090601d500b009a1bb8f17demr22023725ejj.35.1697207103432;
        Fri, 13 Oct 2023 07:25:03 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ot21-20020a170906ccd500b0099df2ddfc37sm12412041ejb.165.2023.10.13.07.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 07:25:02 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 13 Oct 2023 16:24:47 +0200
Subject: [PATCH 1/2] dt-bindings: usb: add NXP PTN36502 Type-C redriver
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231013-ptn36502-v1-1-98109a430efc@fairphone.com>
References: <20231013-ptn36502-v1-0-98109a430efc@fairphone.com>
In-Reply-To: <20231013-ptn36502-v1-0-98109a430efc@fairphone.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document bindings for this Type-C USB 3.1 Gen 1 and DisplayPort v1.2
combo redriver.

The PTN36502 can also run in GPIO mode where it is configured
differently, without any I2C connection, but this is not supported yet.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../devicetree/bindings/usb/nxp,ptn36502.yaml      | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/nxp,ptn36502.yaml b/Documentation/devicetree/bindings/usb/nxp,ptn36502.yaml
new file mode 100644
index 000000000000..eee548ac1abe
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/nxp,ptn36502.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/nxp,ptn36502.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP PTN36502 Type-C USB 3.1 Gen 1 and DisplayPort v1.2 combo redriver
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+properties:
+  compatible:
+    enum:
+      - nxp,ptn36502
+
+  reg:
+    maxItems: 1
+
+  vdd18-supply:
+    description: Power supply for VDD18 pin
+
+  retimer-switch:
+    description: Flag the port as possible handle of SuperSpeed signals retiming
+    type: boolean
+
+  orientation-switch:
+    description: Flag the port as possible handler of orientation switching
+    type: boolean
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Super Speed (SS) Output endpoint to the Type-C connector
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Super Speed (SS) Input endpoint from the Super-Speed PHY
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Sideband Use (SBU) AUX lines endpoint to the Type-C connector for the purpose of
+          handling altmode muxing and orientation switching.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        typec-mux@1a {
+            compatible = "nxp,ptn36502";
+            reg = <0x1a>;
+
+            vdd18-supply = <&usb_redrive_1v8>;
+
+            retimer-switch;
+            orientation-switch;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    usb_con_ss: endpoint {
+                        remote-endpoint = <&typec_con_ss>;
+                    };
+                };
+                port@1 {
+                    reg = <1>;
+                    phy_con_ss: endpoint {
+                        remote-endpoint = <&usb_phy_ss>;
+                    };
+                };
+                port@2 {
+                    reg = <2>;
+                    usb_con_sbu: endpoint {
+                        remote-endpoint = <&typec_dp_aux>;
+                    };
+                };
+            };
+        };
+    };
+...

-- 
2.42.0

