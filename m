Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D815076E372
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Aug 2023 10:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234692AbjHCIpn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Aug 2023 04:45:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234581AbjHCIpm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Aug 2023 04:45:42 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 131E6115
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Aug 2023 01:45:40 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3174aac120aso597264f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Aug 2023 01:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691052338; x=1691657138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tw5E2UBQXvOpbGHprcCTw5ennRO9STUpYBfUSdY86ds=;
        b=v3BkjVM4N+k0L+9N0fX8b0VpGB3GZj3ZaV4mXmjUOoeIMuxakqtD3h2HREbyjni4Pi
         HGPb2Xv5u94HlYxw/rubczGLMaKIyAjbFW/q6xy1c+kt9jMzlD4ntVgnrMKnc0aNFjh1
         C7tD2tYBKGLsPtRuRnQE1Gj2SViVv1i7P4S5CaKQ+G23CHHc1kyypT8TWJZZtGtias3E
         wVHLsHmyHLP5U+dTX2WuTEZrlHszl8V+IrSHuAxSREpgejpaQjkYhfEv/Jh5uJ/bLWp8
         YkQivFFoLp7hEK8627Gu8JxaoGl2vfQNUZOJnL7YFRYG4KpAbG3mZBqbyvlTXmX0Jvvn
         QUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691052338; x=1691657138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tw5E2UBQXvOpbGHprcCTw5ennRO9STUpYBfUSdY86ds=;
        b=PJ0yanE2a+2uVD53XeMaVX278u9mdNfRJbi2C8oxJ+0UIMjDKd0XiEjmR0Z2TC2EdK
         L0JchlEpXZ4bwiUUHEZOOXFggnvHsRaS7F7905D3fVTa2YzXHosShekUTStBsIGFKEvv
         z4juXX2YL5+E02nl9JTR4LQEfUIC9lLCO7Sd+tSun9EuLIJrEdPIds/lEB9ojzFQvdQo
         GFnL4fF+OjQdpTDm1b8vAlMfXPMmHxgGUMgGdjJsixmbQszE3u7ImZyLO3s7838pKxbi
         Nea8zxniGL6ZqvPmMh/eB7m6sb9W+c6DzRzt8ZRuB851NWQ7JOEb07ph3JfzzlOuLyNm
         xQYQ==
X-Gm-Message-State: ABy/qLaeCGxj5ZocuCJRMMBZS9WTWg313aKXy3p8WGdEbKN74vZ4JOOu
        WExAnO1n/MUd+DZYWuTeB9/EMw==
X-Google-Smtp-Source: APBJJlGtM+n4ZYHIOxX8qHnep95Tzwy+6dC+uCVnGX4jn2JE9EeJFuTOnbDHLu84u2tLdzzzYbLN/A==
X-Received: by 2002:a5d:440e:0:b0:317:43e0:3f47 with SMTP id z14-20020a5d440e000000b0031743e03f47mr6199333wrq.36.1691052338545;
        Thu, 03 Aug 2023 01:45:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id v9-20020adfe4c9000000b00314374145e0sm11895052wrm.67.2023.08.03.01.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 01:45:38 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Thu, 03 Aug 2023 10:45:26 +0200
Subject: [PATCH v3 1/3] dt-bindings: net: bluetooth: qualcomm: document
 WCN7850 chipset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230803-topic-sm8550-upstream-bt-v3-1-6874a1507288@linaro.org>
References: <20230803-topic-sm8550-upstream-bt-v3-0-6874a1507288@linaro.org>
In-Reply-To: <20230803-topic-sm8550-upstream-bt-v3-0-6874a1507288@linaro.org>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>
Cc:     netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1856;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=F961/lw+yAY73+/udy9usG6VmzbRuCgDP2WSGtHNz0o=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBky2kuGNqnF6cpxI9Q+Q0qlhP/q2EwCNu9QKsojtuB
 Hv7dVaKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZMtpLgAKCRB33NvayMhJ0W5kD/
 9AxayhGmdS183kzg04+yMz0ajHsbc9cPe86Tn44JktPczp9GIJpcEgnd1SGT817uy89AaBoGGLsc4u
 27DN+DeUdgbf6vSvsJuJOQtaAQXyofQxGTvQMS8WoKbtyBlFKSlYuuLs9DXBc2QgLnBca1HmICwJcm
 S80lab09/T0HMcfcvlx1UqpdMkCwg6jrCNcTGjf8Pe5NS8RAKZ+szD1mmlBfD78gLYVoChTMhJIUCw
 Zz6mRbXtrZ4BuSNk++3DmS8I6Hbv7DJVTDvATMNpO7VO4u5eLHTziC/X+DQ7BtEPV8G4qKzOZmgq+0
 BHuxoRxNHrFFnCAKGEZ0MApIHAigabCC1wSuQS6HVbU3NIGM+jvNd4ZpZ2CbM+JgeniT4tvOw0262c
 whzfiCoeOiAHRXqqvFnGoNMduUo586PTqPBrsSPAsWG7wUJolDvZjprJrk7khqiWvW1Vj//cRl/l2y
 STMBdALBxSm55vL/+rIfKa12Ek/n0z/b5uqnsrxrKAuQaB78ttIYBG+T7JtARfcLxEmDPN9c0xQhbJ
 OZ38D31KBRQX2iSYh7tvPQJ1he1z9532FaYFF2AGAAeWwHrnpDkSELIVhEsheBAWrJ8ZuwvyNea2tm
 Gt5JoLkKWHnST+f02u+zvgPzm0+P/bW4y9zwAUM8JEDVYIcMoGmcYz7mbuug==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the WCN7850 Bluetooth chipset.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index 2735c6a4f336..eba2f3026ab0 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -26,6 +26,7 @@ properties:
       - qcom,qca6390-bt
       - qcom,wcn6750-bt
       - qcom,wcn6855-bt
+      - qcom,wcn7850-bt
 
   enable-gpios:
     maxItems: 1
@@ -58,6 +59,9 @@ properties:
   vddaon-supply:
     description: VDD_AON supply regulator handle
 
+  vdddig-supply:
+    description: VDD_DIG supply regulator handle
+
   vddbtcxmx-supply:
     description: VDD_BT_CXMX supply regulator handle
 
@@ -73,6 +77,9 @@ properties:
   vddrfa1p2-supply:
     description: VDD_RFA_1P2 supply regulator handle
 
+  vddrfa1p9-supply:
+    description: VDD_RFA_1P9 supply regulator handle
+
   vddrfa2p2-supply:
     description: VDD_RFA_2P2 supply regulator handle
 
@@ -157,6 +164,22 @@ allOf:
         - vddrfa0p8-supply
         - vddrfa1p2-supply
         - vddrfa1p7-supply
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,wcn7850-bt
+    then:
+      required:
+        - enable-gpios
+        - swctrl-gpios
+        - vddio-supply
+        - vddaon-supply
+        - vdddig-supply
+        - vddrfa0p8-supply
+        - vddrfa1p2-supply
+        - vddrfa1p9-supply
 
 examples:
   - |

-- 
2.34.1

