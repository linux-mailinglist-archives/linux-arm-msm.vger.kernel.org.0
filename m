Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDA2350F24F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 09:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343854AbiDZH2E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 03:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343865AbiDZH2A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 03:28:00 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C246CAF1C5
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 00:24:53 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id t25so30327943lfg.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 00:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FVBIll1TBxMc1XuGhQQ0btXNe5eGEux22fBe80H6KDw=;
        b=lA53o6tS6guf0W7ccp+kgn2ir0LHQifRo4XLXdfC9bNhTfLD8+Ws4HsPPn42Y8ya2a
         tt5HWv3f+dqPra9zGWrJbKEbaiqJsJ1I/BYM6P7KOBh9TsKjksATITY7kkO5Jcz9VApa
         eb5kVUB8HFeACeivkiSRYraoEwWZQGZ9ezpk3/BGewDuj2Y0Dz12NE3yaU74P05QOCki
         Z+LIg6hYU1QwecMv32gqZrLppbC3WWyGwXCCcEBh7i3JAVnl8zFpcw5hMA0r6ouBs4f4
         4Za8nzcV9lZLJxTbgaKLkUovS56lUROGr0CiCjloYML33btUonJrEqZboTtqduTRGrod
         gYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FVBIll1TBxMc1XuGhQQ0btXNe5eGEux22fBe80H6KDw=;
        b=YxlKEi9OToMcA5eJKeEKq9ku5Q80818Um38Za7sqoz89ofRhEJCNWdNOecFUFtsFkn
         9hrrAPalQuFRC6AdJkCy91YfA8BnWYIzOCdCoWpIZhmDnQ/0C7CJKUgqD7eo2WJrYBtP
         qQYA8YneyRWGHiw8yC03uVLSaRvw85DlIxSNNvo9/pkAWHRGgQA9IQB1nMYjwpGAyAql
         mb9ZVsLPZ/Qd1eFIKQHtM4VRPXdgreh/uMCQ6SM9pPx4qLmifyB6PcCA5prH8Qt09BVP
         3e8RCwFSJ2MTYIj2c71/aRpmOhBk02TtH5VeUjdUiouhaCkLNXe9RHASRGG28tqTXxa+
         tP4w==
X-Gm-Message-State: AOAM533rpW9xh1IT5kOzUF1jvVRjqKv3zdE/VmDB/xsDM7n6VghAAsXG
        GLYQkP9iqhdB3m5IJiiC5PB49Q==
X-Google-Smtp-Source: ABdhPJw1+EecKeRUt/3YiJU4pI/+AHHXco4WcMMJEPQnqtcMa8/BllJx4HdNEanwdNNeiIvB/mtejQ==
X-Received: by 2002:a05:6512:2384:b0:471:fa56:bec0 with SMTP id c4-20020a056512238400b00471fa56bec0mr10156715lfv.375.1650957891981;
        Tue, 26 Apr 2022 00:24:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q22-20020a194316000000b00472163b3735sm166105lfa.131.2022.04.26.00.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 00:24:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: gcc-apq8064: move qcom,apq8084 back to gcc-other.yaml
Date:   Tue, 26 Apr 2022 10:24:51 +0300
Message-Id: <20220426072451.2905910-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The global clock controller on apq8084 has nothing to do with the schema
for apq8064. It uses the schema defined in qcom,gcc-other.yaml. Move
respective declarations back.

Instead add what was really meant to be present in qcom,gcc-apq8064
schema: the compatibility string for qcom,apq8064 device.

Fixes: a469bf89a009 ("dt-bindings: clock: simplify qcom,gcc-apq8064 Documentation")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,gcc-apq8064.yaml         | 6 +++---
 Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml | 3 +++
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
index 97936411b6b4..b867da12761e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
@@ -20,12 +20,12 @@ description: |
   See also:
   - dt-bindings/clock/qcom,gcc-msm8960.h
   - dt-bindings/reset/qcom,gcc-msm8960.h
-  - dt-bindings/clock/qcom,gcc-apq8084.h
-  - dt-bindings/reset/qcom,gcc-apq8084.h
 
 properties:
   compatible:
-    const: qcom,gcc-apq8084
+    enum:
+      - qcom,gcc-apq8064
+      - qcom,gcc-msm8060
 
   nvmem-cells:
     minItems: 1
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
index 6c45e0f85494..142402f29d98 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
@@ -15,6 +15,8 @@ description: |
   power domains.
 
   See also:
+  - dt-bindings/clock/qcom,gcc-apq8084.h
+  - dt-bindings/reset/qcom,gcc-apq8084.h
   - dt-bindings/clock/qcom,gcc-ipq4019.h
   - dt-bindings/clock/qcom,gcc-ipq6018.h
   - dt-bindings/reset/qcom,gcc-ipq6018.h
@@ -36,6 +38,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - qcom,gcc-apq8084
       - qcom,gcc-ipq4019
       - qcom,gcc-ipq6018
       - qcom,gcc-mdm9607
-- 
2.35.1

