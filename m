Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C10C350F9E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 12:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239386AbiDZKPk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Apr 2022 06:15:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348582AbiDZKNY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Apr 2022 06:13:24 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8F8622BE52
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 02:36:15 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id bn33so21160727ljb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 02:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tH3TvKKnXPblTqVg7QnDnCSWxMYNwzCle2AW/mvTdUk=;
        b=ZlpdOX4SGfBQm99+6P3BSnFK7K0uGipKs4Lsocod+GYRc4ZhNZ6J6XxVl3KiThUI9/
         cEUfzSzE7sLuIZgFCuvHpsUIVdlQiHxHezjDBWamuopumj2bM6bOPbW5w5l+ddHIFsHY
         5SbtQFdJR8yAi14ubYebj8XJYtIP95lZ0JX6UIYUrpOneSSH7UrGmhCDHzksvUvHv2WP
         E9+MrmqvB74YOwOrX5qtEyfUwyxJulFXaUR3rDgISCuwHtEhIJLEYPlDZRwxXUaN62It
         Y3awcQhSRT12tZJVkdC57xUtid11FaAHaQQzWPVziWw1GJ9rnin8NxMZjIQTbsJGtLa/
         uD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tH3TvKKnXPblTqVg7QnDnCSWxMYNwzCle2AW/mvTdUk=;
        b=TEwcNm/pRJGRshDOVYUxAFd8oiqI1GQvb2+6vnpJGawzQ1KaOKORJ5IvzN55XOPqxR
         BDW/SbNn1pOcEJdoHsDVxkrJlJnc48Nr3A6QA2ymuYLw05YAOsdS5/hgmP6/4yh9g/nN
         phgMMsqQSx+OlaWAtnwsgttQJnJkJqlKHpJVQN/uLr3UxTb9rbI3Q93nnOz2nzd5mG2K
         NfVjc218SE/LdRFJCAIwffw6+/gLUroggSHQhQa1Ve7bc4NzN7RU88+O6YgqdLltpEPs
         /ujFqmv5Eeeru1GB/zpwQdkYYQNpuPx1paqxgIJ1ayj5UjYC/nz7EbeccnjHShKVi4Oh
         pRlQ==
X-Gm-Message-State: AOAM531lMFZQQljE5mw0HNgqYWI/o3mkKWNN/jCqIPSkgLNNIc1s5tiJ
        FUUCAQGobXUIhmO9HOlR1Xt0DA==
X-Google-Smtp-Source: ABdhPJzUYGte1S74FszCtqPB4Cjm+F7MVFJO5hr+i1cxMABx/kVp6F/OFfM6Gro4UqBqE0n9GdfKcA==
X-Received: by 2002:a2e:a816:0:b0:24d:9cd2:2d0a with SMTP id l22-20020a2ea816000000b0024d9cd22d0amr13533661ljq.26.1650965772897;
        Tue, 26 Apr 2022 02:36:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([188.162.64.30])
        by smtp.gmail.com with ESMTPSA id x23-20020a056512131700b004486c863c8esm1684232lfu.257.2022.04.26.02.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 02:36:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: clock: gcc-apq8064: move qcom,apq8084 back to gcc-other.yaml
Date:   Tue, 26 Apr 2022 12:36:07 +0300
Message-Id: <20220426093608.2957210-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426093608.2957210-1-dmitry.baryshkov@linaro.org>
References: <20220426093608.2957210-1-dmitry.baryshkov@linaro.org>
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
Reported-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml | 4 +---
 Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml   | 3 +++
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
index 97936411b6b4..9fafcb080069 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
@@ -20,12 +20,10 @@ description: |
   See also:
   - dt-bindings/clock/qcom,gcc-msm8960.h
   - dt-bindings/reset/qcom,gcc-msm8960.h
-  - dt-bindings/clock/qcom,gcc-apq8084.h
-  - dt-bindings/reset/qcom,gcc-apq8084.h
 
 properties:
   compatible:
-    const: qcom,gcc-apq8084
+    const: qcom,gcc-apq8064
 
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

