Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9FC17D0BEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Oct 2023 11:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376699AbjJTJeQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Oct 2023 05:34:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376679AbjJTJdm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Oct 2023 05:33:42 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE7541996
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Oct 2023 02:33:24 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9c773ac9b15so32258766b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Oct 2023 02:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1697794402; x=1698399202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NPt+CEIhCocuFEjYEJNPHpjjDpAfwHYTgOkmzxyzoz0=;
        b=zaGWjaxjbEFFV3LGlU1SXBviOittO024w4VisuWiBTKh6M/sf0Gi8iR/x7LTmegJo2
         PxSaDSqcL2SO028gkWNoHF0SM4f6sNNs9hUMGrwDqAz+I2aDzo7BMr+iBnbRBpT+ThBx
         lfx1ZJwPWUSOEKgRMCMDxqcQ4jy3IJ3GS+R/tXTdCMqOd4woPcFPAC6lH2vFj8hSLmxo
         3JHYFNieswSrRRcz3NjKInKALq4e80ZUDqClOkxRn98azUJI1cbqHyNEGkytSAjxMAmz
         7oOdEikDAwcmGR4m9s9pjYbtUUvJa7KbyCL1d57bnCJOSJl4NKIa4Evir24GJ8qqiuu4
         qD6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697794402; x=1698399202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPt+CEIhCocuFEjYEJNPHpjjDpAfwHYTgOkmzxyzoz0=;
        b=huLpltOfyafUc7ytmvr0UytHXlZusc1n1ctg7btwkCV73CjoRcrItmEeEpJTqhD5t2
         FvrcWIzeDITHeWo3tJVkndw9wsEF1COaWcykFgwYuUgWefpK3fRwplK5CwzLYnm6heX2
         SSQm7emJlc7ov4kfCPXsBFPfHTS2WFQa6Ri+sV6tmg69q4COFsBV23uZblL/DmbXtSt/
         c45PedLw0LCD+nrErgYf9bRnbsrCdkp9o9jTkVqQPt2YA9x1MnS5Nrx3n0gubIGD6IzR
         p+VPBQDfBP+pWmY1x2mODPE8viEaXVJDnPOzUU4rXPj99KCBkPKpA7Zw+9lo6SrMhYHJ
         cfyA==
X-Gm-Message-State: AOJu0Yy6nl+E9gQEhddPe1sSjy65UQeGPQPlQyRG635wO7/AoQVwQ4VW
        BY7aOHNoQkXLGxN7BYQe4+rzsA==
X-Google-Smtp-Source: AGHT+IGKQwW17Fy4T1BraCaYfTjGgV0tF528AbO3jxsar61meA0nxPsdWi7srJYGCContnpddhZyYQ==
X-Received: by 2002:a17:906:da82:b0:9ad:a4bd:dc67 with SMTP id xh2-20020a170906da8200b009ada4bddc67mr1041118ejb.50.1697794402540;
        Fri, 20 Oct 2023 02:33:22 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (k10064.upc-k.chello.nl. [62.108.10.64])
        by smtp.gmail.com with ESMTPSA id t15-20020a1709066bcf00b009a13fdc139fsm1102535ejs.183.2023.10.20.02.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 02:33:22 -0700 (PDT)
From:   Luca Weiss <luca.weiss@fairphone.com>
Date:   Fri, 20 Oct 2023 11:33:18 +0200
Subject: [PATCH v2 1/3] dt-bindings: usb: fsa4480: Add data-lanes property
 to endpoint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231020-fsa4480-swap-v2-1-9a7f9bb59873@fairphone.com>
References: <20231020-fsa4480-swap-v2-0-9a7f9bb59873@fairphone.com>
In-Reply-To: <20231020-fsa4480-swap-v2-0-9a7f9bb59873@fairphone.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Allow specifying data-lanes to reverse the muxing orientation between
AUX+/- and SBU1/2 where necessary by the hardware design.

In the mux there's a switch that needs to be controlled from the OS, and
it either connects AUX+ -> SBU1 and AUX- -> SBU2, or the reverse: AUX+
-> SBU2 and AUX- -> SBU1, depending on the orientation of how the USB-C
connector is plugged in.

With this data-lanes property we can now specify that AUX+ and AUX-
connections are swapped between the SoC and the mux, therefore the OS
needs to consider this and reverse the direction of this switch in the
mux.

_______          _______
      |          |     |
      |-- HP   --|     |
      |-- MIC  --|     |or
SoC   |          | MUX |-- SBU1 --->  To the USB-C
Codec |-- AUX+ --|     |-- SBU2 --->  connected
      |-- AUX- --|     |
______|          |_____|

(thanks to Neil Armstrong for this ASCII art)

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../devicetree/bindings/usb/fcs,fsa4480.yaml       | 29 +++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
index f6e7a5c1ff0b..86f6d633c2fb 100644
--- a/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
+++ b/Documentation/devicetree/bindings/usb/fcs,fsa4480.yaml
@@ -32,10 +32,37 @@ properties:
     type: boolean
 
   port:
-    $ref: /schemas/graph.yaml#/properties/port
+    $ref: /schemas/graph.yaml#/$defs/port-base
     description:
       A port node to link the FSA4480 to a TypeC controller for the purpose of
       handling altmode muxing and orientation switching.
+    unevaluatedProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/graph.yaml#/$defs/endpoint-base
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            description:
+              Specifies how the AUX+/- lines are connected to SBU1/2.
+            oneOf:
+              - items:
+                  - const: 0
+                  - const: 1
+                description: |
+                  Default AUX/SBU layout
+                  - AUX+ connected to SBU2
+                  - AUX- connected to SBU1
+              - items:
+                  - const: 1
+                  - const: 0
+                description: |
+                  Swapped AUX/SBU layout
+                  - AUX+ connected to SBU1
+                  - AUX- connected to SBU2
 
 required:
   - compatible

-- 
2.42.0

