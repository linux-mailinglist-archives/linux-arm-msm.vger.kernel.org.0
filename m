Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75107728DCD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 04:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236588AbjFIC0E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jun 2023 22:26:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238527AbjFIC0B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jun 2023 22:26:01 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CC8830F6
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jun 2023 19:25:57 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2af189d323fso29855231fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jun 2023 19:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686277555; x=1688869555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Mt31W0jI1fuVf091MA0W1WwuRBTHflHVK1TxVNzvWs=;
        b=opSjeVIuJExti4vaP6E7Qp+ENucVYRriMH5sayaSwFNxgDvOt7mI5kpb38B5HjDcRd
         ftGBOyKZPJpAgV2lrrWN1W/LB9dEXC5HnlmGLjOdNbJB70Itlt9XR4dJrsDfWtCmnP2K
         +q9LGemZ2/EXlEYt5rj53jFT/PmnTAFme2iiErjObKhdUi2w2mbyGiq3kaxZM1qKs12T
         Eexxlx18kIQkPUoFAF4KNYWTMME8Ocdffdp1Q063N1uB33EycLGs7cZ76fUMpi9vcTzU
         +8HdQ6thZDz62V2GFVp8IX23LQBODQNKee649en6tvwmOLj5Iw6kR/FsrAYUbPGsPq01
         sJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686277555; x=1688869555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Mt31W0jI1fuVf091MA0W1WwuRBTHflHVK1TxVNzvWs=;
        b=GFvT1nxuByAQ9AbARbBlyNEcIyo2Il7BUH/GmVtK5RVthcmCBEXoygUovQ+/5MYOCg
         DDJ3mPY3W2SdET6caqexKo2M95kV8CBF6oS+G1JqQ63wG6+7q4SdNj8WiuGNbUNscVB+
         Lv2Gx5o/35+aI5BKVlpqL12SL6UVwzzTvFFR7kE0N9SX+sp3a03Z05lZsa7S6xzomtwh
         qHdGZ2axQdZ8ohHpZFYcbPpl3cTl6VYqjKKwSXjprBX5JDudA3VJJu1UrQk1CFsbwDob
         +5q35C1bT/akpgNb3TLxVCTHWvR5usQ6GFRglrSDdPWBE38mhMJdGhFmrHERmZas5Yh0
         mSLg==
X-Gm-Message-State: AC+VfDyVmg8SeiHHLd15azsYick9dvx46BOufGKMmaC8T1CuRkogI0PA
        OmUlHx6q2Gb0E13v7hugr16XIA==
X-Google-Smtp-Source: ACHHUZ6LkESUcNJ+wXQNZjYvIm0Jk2PXzLAfJ47h8zWMYPGSf0m4XTwMmy1a11UjUNoTHOCQKFeBMg==
X-Received: by 2002:a2e:a366:0:b0:2a8:ea26:5c72 with SMTP id i6-20020a2ea366000000b002a8ea265c72mr1473656ljn.8.1686277555442;
        Thu, 08 Jun 2023 19:25:55 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id x20-20020a2e9dd4000000b002b21089f747sm167429ljj.89.2023.06.08.19.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 19:25:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 1/4] dt-bindings: power: reset: qcom-pon: define pm8941-pon
Date:   Fri,  9 Jun 2023 05:25:50 +0300
Message-Id: <20230609022553.1775844-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230609022553.1775844-1-dmitry.baryshkov@linaro.org>
References: <20230609022553.1775844-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On PM8941 pon doesn't store the reset reason. However we still need the
wrapping node for pwrkey and resin nodes. Add bindings for pm8941-pon
device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/power/reset/qcom,pon.yaml           | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
index 0b1eca734d3b..5e460128b0d1 100644
--- a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
+++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
@@ -19,6 +19,7 @@ properties:
   compatible:
     enum:
       - qcom,pm8916-pon
+      - qcom,pm8941-pon
       - qcom,pms405-pon
       - qcom,pm8998-pon
       - qcom,pmk8350-pon
@@ -74,6 +75,21 @@ allOf:
         reg-names:
           items:
             - const: pon
+
+    # Special case for pm8941, which doesn't store reset mode
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,pm8941-pon
+    then:
+      properties:
+        reg:
+          maxItems: 1
+        reg-names:
+          items:
+            - const: pon
+
   - if:
       properties:
         compatible:
-- 
2.39.2

