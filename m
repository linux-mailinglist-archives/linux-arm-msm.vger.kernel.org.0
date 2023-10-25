Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B10FB7D628D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Oct 2023 09:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232846AbjJYH2G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Oct 2023 03:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232870AbjJYH2E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Oct 2023 03:28:04 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2536ADE
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 00:28:01 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c5039d4e88so82185191fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Oct 2023 00:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698218879; x=1698823679; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=azyy+CRDQlq2B5mLZ+NxQUJGwrv5k3KH5FpimP8Ouy4=;
        b=Pz7ea13XlZ+QsMFa1hgkE56IU8UHzUJcQoAHouqQEVGW1JbsmJ9wgqXm6/qYKRF0Hb
         wK/ucmIrHY3gIX3xqDKzf6Oi/JjyUycT7SQ3ce8qDZY/8LII36q9eTd7U7Kf3N5k7QCw
         OiXcQlWMWmRgOt53U07ORlHA2QN24ExG12hfgVexbr7G6ylF8ov2C1A/XmK5Jxll7Wfq
         4QpNoppOoxEG6bp4NCOCBmVRv7UOtB8NhNY50pqJMN7duNsA77QP5bzLvYCXLYYzGwvj
         G3R63BckzvgNKCNib5iZNsXtzSy2mpWCxdW2YBu5Osx5INBiv3DTF3kGy/qMcfqaDIsg
         xPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698218879; x=1698823679;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azyy+CRDQlq2B5mLZ+NxQUJGwrv5k3KH5FpimP8Ouy4=;
        b=DuObl5CmxD/cuA5jhdkfUrvVkMKvu5ydMIQt8d7kLP8icVFX5x8xH1Uy59XFdV+WG8
         51man1GjKXrDoFXkKraXIwzXixDOGMiYRELO4pPbsny/0UKSVgEn13r6gfAyWKYQV6i0
         DARQJ+RvDRg1uXV9IyD+eGclG9O2tubf9DAc/idpkU4UzmTyJVYKdZOW1LgE0Z3w0uom
         2NYQxg+ozWISM4huao3aoGJPWsOfL8c/sWgNEF4jwukVmIvdY65SdFpI3/7mT9cmpIzS
         JrcIC29Y184gWyAUC73sATDp241oNfXY6BxxUjASDYr2pny3drcTHz3nbwveMIK2FcfP
         Lgxg==
X-Gm-Message-State: AOJu0YzE2ra6c9hwbfP/IaGEFsUjLC63s3pJOJ9blMunpgt4Z/aFuRfm
        NCI9hiFf0ikZQA2ATYYI6p+Qww==
X-Google-Smtp-Source: AGHT+IHGWL+jCC2HsnKI6HnWSnuPg+2NFmJwj9g5gZ+MDHBYUaigdHFQCVbwZvJUFD/8SPUU82iNWg==
X-Received: by 2002:a2e:bc12:0:b0:2c5:2df0:a1d6 with SMTP id b18-20020a2ebc12000000b002c52df0a1d6mr11486720ljf.24.1698218879206;
        Wed, 25 Oct 2023 00:27:59 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id u25-20020a05600c00d900b004068495910csm18364488wmm.23.2023.10.25.00.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 00:27:58 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 25 Oct 2023 09:27:57 +0200
Subject: [PATCH] dt-bindings: soc: qcom: pmic-glink: document SM8650
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231025-topic-sm8650-upstream-bindings-pmic-glink-v1-1-0c2829a62565@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHzDOGUC/x2NQQrCMBAAv1L27EKS2iB+RTwk7SYumm3IVhFK/
 27wOAzM7KDUmBSuww6NPqy8Sgd7GmB+BMmEvHQGZ9xojfW4rZVn1HLxk8F31a1RKBhZFpasWEu
 3+cXyRD/GEN05EaUJeq82Svz9v2734/gB43OjA3sAAAA=
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1865;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=cyqGAaVH0eYgCZ9rKCXvebHUpJ/9C+hHK1XF4pRSjc8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlOMN9X9d/d8QP0cY2cWjBSZuh+dIxW8CaG790AIRi
 E23oQmGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZTjDfQAKCRB33NvayMhJ0TNhD/
 4i8FLUUqCIjceLfMm9qivStFBt2+c+V9fWeXWJUdqkM3aKuhDYPImDy4CPOQvU9zLkSDqXHaDeDhyS
 JsNW5fO5NwnwZ/o8/vgnYefdAAtt5OJ3FN8ZHt9fbgyaNGCjKvM9klNL5bnh062FM9j2p7bwse3M0D
 rkQZ4b8jlBoz5Jhddg9kmLQdc5uVmvgph2q+SoMTFgMzaL/+0Z9qdrkAppXIG42a77kCjLOX1nTw4T
 KWeMuvGrVybchHPUsLfXkls2az4RgbJFnHbbOZyf9cTNBwC15s9R3hBi6GXewTk6TNpBm1oyoqf4es
 scMemTUUhmxpcatrjC4lUCIjSS2mQEeypNL/8wHjkhaZ69IYJNUOSEz2BzoSRxh5UZGDmkuZjWUc+0
 dL1caKwgWEJqeAf88LYUcZbHd6hpvCz5100+ucfAcujRqe1IiTaoJ516PnO1x3AhPYSAG4aYQU/7Im
 +zpz7qqXkEESdNumdHdcD/NsJrHHGNhzkasw9FW6yyceLVK9ldsI1OJ5VCKUf5qd9/mK4DtBSzuPR/
 cr+Zr2P9rA0gxcqs7Bu3s/4ifeo7yZyiVqA49Im/K1Z9kSu2jx+15Vl/lxb4njR9zT1zzPPIn83Ffr
 nRjotQX4lUruzetPr214Z0p5zodJh7S0AnwuMXi0pQzIHWcj6QOazg4W12qg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the PMIC GLINK firmware interface on the SM8650 Platform
by using the SM8550 bindings as fallback.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
For convenience, a regularly refreshed linux-next based git tree containing
all the SM8650 related work is available at:
https://git.codelinaro.org/neil.armstrong/linux/-/tree/topic/sm85650/upstream/integ
---
 .../bindings/soc/qcom/qcom,pmic-glink.yaml         | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 422921cf1f82..61df97ffe1e4 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -20,14 +20,20 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,sc8180x-pmic-glink
-          - qcom,sc8280xp-pmic-glink
-          - qcom,sm8350-pmic-glink
-          - qcom,sm8450-pmic-glink
-          - qcom,sm8550-pmic-glink
-      - const: qcom,pmic-glink
+    oneOf:
+      - items:
+          - enum:
+              - qcom,sc8180x-pmic-glink
+              - qcom,sc8280xp-pmic-glink
+              - qcom,sm8350-pmic-glink
+              - qcom,sm8450-pmic-glink
+              - qcom,sm8550-pmic-glink
+          - const: qcom,pmic-glink
+      - items:
+          - enum:
+              - qcom,sm8650-pmic-glink
+          - const: qcom,sm8550-pmic-glink
+          - const: qcom,pmic-glink
 
   '#address-cells':
     const: 1

---
base-commit: fe1998aa935b44ef873193c0772c43bce74f17dc
change-id: 20231016-topic-sm8650-upstream-bindings-pmic-glink-63bab24feef5

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

