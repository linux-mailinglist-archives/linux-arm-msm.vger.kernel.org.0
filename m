Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBA4B5EDF4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 16:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233341AbiI1O4h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 10:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233287AbiI1O4a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 10:56:30 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C30596775
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 07:56:13 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id b24so14604429ljk.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 07:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=WNvCU5BgP4cLQ1KOWwPdEXpzkinKzwkXxiYmcUxdJA8=;
        b=GdI/dJdD9k6/mJPUiQ3XGPbO4ayqezDXa2hlljGMU8eUyxmyCbCywtDxLq72TSTNN5
         YG0RtXoIpJfr825wiKb1BLEPNq7j2I4TCv+FWsdv2tu0QI7+9RuRj0iLkccSfCsD92sZ
         n064bcPA+GLxhu8aHIn62eiBGWbjPdQXrlEb8Hzyib3bO7hKSd5QgHAko3FGohUl9IJS
         LusBAZFxpz9hGfa5O64BvvPHOj9j2Lf1Vg1nqjeSBh+10syliuaNnHnkRT5a40UJcrVi
         IRHtQq5Y3M+zBxupBPWGKeI8fT9HDOw1WjeNrampTRusyXeMyXLBeoCjPSCi69ADUwU6
         O+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=WNvCU5BgP4cLQ1KOWwPdEXpzkinKzwkXxiYmcUxdJA8=;
        b=vYTUlvfgNLGf0KuatvRxMMg0THgPxjoA8y3lxIPyXhZS1A6+rTn/M77qJk8WtYj9BW
         GTYue3XTBWqV2g1h8OTuYPDm4VRaoeG2N71PSma9jpvKhEajmCnvXwo2CQbfr8psqlTp
         6Ku8iN/R5dCfZPqWDumghiCrA8bxBFkJYJ+CvDR9pjWs0DARGKGRaPnLLcS91BeVlObV
         IhUHxht4r/2LyH/aiBas2opB+ArKyfp+r4mL+TR4o+IuOf2pOd1ZRpG8M0y20V1OO/Gk
         gLa+G3ybWJV2N1vn/Cc/FN5bQN5umr88+HZxW70ScVfOcdpWW7Dp+l4sLbvSfVJmjr3r
         h8qA==
X-Gm-Message-State: ACrzQf0zjvdwP5+L7tGaT2uIv/iPkx5FPnUkZMmzppx64RGoKahOLfqX
        yNXGNoFTeqmLG29y3HPO7Fxuuw==
X-Google-Smtp-Source: AMsMyM7tTmymw6eXquT9dnrNh1y8Bs9UycM0h+950vViQDtRpWYwcw9CKRsCGRaRzUdnEpd0u/UMOg==
X-Received: by 2002:a2e:a602:0:b0:264:5132:f59 with SMTP id v2-20020a2ea602000000b0026451320f59mr12405974ljp.0.1664376971585;
        Wed, 28 Sep 2022 07:56:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o6-20020a05651238a600b0048b256bb005sm498094lft.49.2022.09.28.07.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 07:56:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Subject: [PATCH 1/3] dt-bindings: clock: move qcom,gcc-msm8939 to qcom,gcc-msm8916.yaml
Date:   Wed, 28 Sep 2022 17:56:07 +0300
Message-Id: <20220928145609.375860-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928145609.375860-1-dmitry.baryshkov@linaro.org>
References: <20220928145609.375860-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MSM8939 GCC bindings are fully comptible with MSM8916, the clock
controller requires the same parent clocks, move MSM8939 GCC compatible
to qcom,msm8916.yaml

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,gcc-msm8916.yaml   | 11 ++++++++---
 .../devicetree/bindings/clock/qcom,gcc-other.yaml     |  3 ---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
index 564aa764b17b..2ceb1e501ef9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/qcom,gcc-msm8916.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Global Clock & Reset Controller Binding for MSM8916
+title: Qualcomm Global Clock & Reset Controller Binding for MSM8916 and MSM8939
 
 maintainers:
   - Stephen Boyd <sboyd@kernel.org>
@@ -12,14 +12,19 @@ maintainers:
 
 description: |
   Qualcomm global clock control module which supports the clocks, resets and
-  power domains on MSM8916.
+  power domains on MSM8916 or MSM8939.
 
   See also:
   - dt-bindings/clock/qcom,gcc-msm8916.h
+  - dt-bindings/clock/qcom,gcc-msm8939.h
+  - dt-bindings/reset/qcom,gcc-msm8916.h
+  - dt-bindings/reset/qcom,gcc-msm8939.h
 
 properties:
   compatible:
-    const: qcom,gcc-msm8916
+    enum:
+      - qcom,gcc-msm8916
+      - qcom,gcc-msm8939
 
   clocks:
     items:
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
index aae83a22b5fb..76988e04c7db 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
@@ -18,9 +18,7 @@ description: |
   - dt-bindings/clock/qcom,gcc-ipq4019.h
   - dt-bindings/clock/qcom,gcc-ipq6018.h
   - dt-bindings/reset/qcom,gcc-ipq6018.h
-  - dt-bindings/clock/qcom,gcc-msm8939.h
   - dt-bindings/clock/qcom,gcc-msm8953.h
-  - dt-bindings/reset/qcom,gcc-msm8939.h
   - dt-bindings/clock/qcom,gcc-msm8974.h (qcom,gcc-msm8226 and qcom,gcc-msm8974)
   - dt-bindings/reset/qcom,gcc-msm8974.h (qcom,gcc-msm8226 and qcom,gcc-msm8974)
   - dt-bindings/clock/qcom,gcc-mdm9607.h
@@ -38,7 +36,6 @@ properties:
       - qcom,gcc-ipq6018
       - qcom,gcc-mdm9607
       - qcom,gcc-msm8226
-      - qcom,gcc-msm8939
       - qcom,gcc-msm8953
       - qcom,gcc-msm8974
       - qcom,gcc-msm8974pro
-- 
2.35.1

