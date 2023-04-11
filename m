Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 917346DDBA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 15:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbjDKNFM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 09:05:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230422AbjDKNFE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 09:05:04 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE4A346A8
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 06:04:52 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id gw11-20020a05600c850b00b003f07d305b32so5347262wmb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 06:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1681218291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1aypPmfAnBqSLxgE6m9YHvqGlsjygFysWM20Vfgyf8=;
        b=DT9yf3naHRAfyL/nu6ysE6kqTihLShfR1RUQTT313WkPvXfRa8lYFMqM03xJIpJGlA
         6H7L178PQ7Iovla534HiOJrt9ZvS43q56G54O+7F3xH9SHHrvcSPke6R10pDQALcaUEz
         3f6ulz2WQsKJZnuxmrBenmO1kHni/+uK0Ql7dTUpW9PbVn48xJem8cgTpvVmyhGKidZe
         /i6r+Oo6JZjnzGsP6/aKAMawvIzLxId8QMTqBtYR5UaeXVPthzUQJKA8CJJc0bzAsd4t
         7izM9zZdl42ao81xw8CvNTul5pNkapaMOiZ0PkniMR3W5SD8SVYLicvqbF2+cwAuhDvP
         wo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681218291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f1aypPmfAnBqSLxgE6m9YHvqGlsjygFysWM20Vfgyf8=;
        b=W2muaiLambYXWKjLJT+kR52owJG80iGp+JfJx/QZfqyDX0PKlHscJn2umyQf72n+vT
         fVp26NiOJeW4FDkkdlZBPT7e1jtlv+oQVF/WgzIvv5OLeZSlWPdkxOwumm+alu0CgDJO
         aC0c8XOXrSGWQKM9JwIse27bXIW1qsADB3MOSv8M8tNXAoduyaf00CDkovjEBz5bb2f1
         ERGzUqaPF3231z66VfauBlgEaGVjMnHKtD3G9g1LLAAKsDBuqU9AIdthG9mGF9q2Ioag
         hW+VWqm/tBQRvTa54lni+qd7uHJO6zWj9wnsGw+RhxpRC0sbMtj3ji0o0O2q+KNXTMnD
         JeUw==
X-Gm-Message-State: AAQBX9emjgYE0L0gFjYSOD4Bky0h98D0e3juGpsgzcTx0J8b2sLSWjdv
        6yWDLUoJNcU71xR8PExe35XlDw==
X-Google-Smtp-Source: AKy350btH3vdbLazcsWZ/ZxE6u95m/QLQJ+rNdyThrse0GWcw0VSBctgLxvyxIIvsNbBj1piCjxiyg==
X-Received: by 2002:a1c:cc11:0:b0:3f0:3377:c15f with SMTP id h17-20020a1ccc11000000b003f03377c15fmr9669781wmb.12.1681218291426;
        Tue, 11 Apr 2023 06:04:51 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a099:fc1d:c99a:bfc3])
        by smtp.gmail.com with ESMTPSA id t6-20020a7bc3c6000000b003f04646838esm16921301wmj.39.2023.04.11.06.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 06:04:51 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 2/5] dt-bindings: phy: qmp-ufs: describe the UFS PHY for sa8775p
Date:   Tue, 11 Apr 2023 15:04:43 +0200
Message-Id: <20230411130446.401440-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230411130446.401440-1-brgl@bgdev.pl>
References: <20230411130446.401440-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a new compatible for the QMP UFS PHY found on sa8775p platforms and
update the clocks property to accommodate three clocks.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../phy/qcom,sc8280xp-qmp-ufs-phy.yaml        | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index cd0fbbd3593d..94c0fab065a8 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,sa8775p-qmp-ufs-phy
       - qcom,sc8280xp-qmp-ufs-phy
       - qcom,sm6125-qmp-ufs-phy
       - qcom,sm7150-qmp-ufs-phy
@@ -25,12 +26,15 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   clock-names:
+    minItems: 2
     items:
       - const: ref
       - const: ref_aux
+      - const: qref
 
   power-domains:
     maxItems: 1
@@ -64,6 +68,26 @@ required:
   - vdda-pll-supply
   - "#phy-cells"
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sa8775p-qmp-ufs-phy
+    then:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
+    else:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+
 additionalProperties: false
 
 examples:
-- 
2.37.2

