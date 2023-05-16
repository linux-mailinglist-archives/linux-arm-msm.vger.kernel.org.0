Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0302570598F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 23:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbjEPVdh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 17:33:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231128AbjEPVdc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 17:33:32 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D99F7AB8
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 14:33:27 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-64ab2a37812so8684314b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 14:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684272806; x=1686864806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9+WkMxaCFyRvz0ZQf19zyMmoq6vin0MgQ/wuGkS8c8=;
        b=LsQ50DNSOaG7DgsiPagczsAlTFY68vYJaVEEnINOlsG95bUv+gCD1RMd8/jE6EmAD9
         w3v9tgqGAQBj5ALxcvoX0sglgzPNX0b/bJXrOa+5egGrNp5rb0aaZ8qxUcy8PgsEgjL4
         GHTL97vDpbli9gcHDPi07OX1uYSaRu6S2qJk3cssHzkbA8UpphKJCIaYmkArarqIWfeF
         D1EfzIzUkFAbnkfyA1c/zLtBwNxy1oNMXicOXQFpMylXXiZzgGDshgsgC9ICHMnNp7aJ
         lTtALFx/aJXqvZWwT28zzpBCFyIATV66CVnLWTejQVa0bOMXDaYH97Ucj9XkEBt+DVpq
         NMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684272806; x=1686864806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q9+WkMxaCFyRvz0ZQf19zyMmoq6vin0MgQ/wuGkS8c8=;
        b=A8Nr1tqUJHbtcWrHy2OxiUEof+Civ8bcBVgtmeHEFfIbZR7k7FsniMtSFvAB5a4K5m
         WDQ+g6smwhJbuf/ELrNaKkrcWB+Jr8SQZF88KZBb8t9WMKV6XrTkhYu1N4psq9aqunLA
         LYVAr2VeUTthOl5JGHz729txAgwcC1wyTUqFrQnLt0ko0b7jp8mJxyUB+grYs+Qr2aZ5
         zDcIfsbHBdSQgmyBPxtOmQ8NYxNcVXQxBklejwuM9k874NwPEha9tOPXitw/uZ4BLXaD
         KpvtGYA8cZgqyBJGG9AztlxKNBS7MajTAcLE8bQwEeQ4nU/EUpJFbxQ7oUg0pXScIV5c
         oEcg==
X-Gm-Message-State: AC+VfDw2jhTfud/nvzerMzCtcaDMWT7DsV1Zw9NUyVCWrTS+trKnwjIe
        WiW/gu/GyzEui3fw/Er7MQNbsEscnQy1Zg1iXsk=
X-Google-Smtp-Source: ACHHUZ4aHJBM3NOgsQOSNTWh4IKD6mhe6JFnpJnCdbQF2+4RP2d51rkO65t2SLnb11MSEpg7c5HEkw==
X-Received: by 2002:a17:902:da87:b0:1ac:7e95:74bf with SMTP id j7-20020a170902da8700b001ac7e9574bfmr200970plx.6.1684272806453;
        Tue, 16 May 2023 14:33:26 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c60:6bed:7a51:340a:a439:1b87])
        by smtp.gmail.com with ESMTPSA id jh19-20020a170903329300b001ac7af57fd4sm16027676plb.86.2023.05.16.14.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 14:33:26 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        bhupesh.sharma@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, krzysztof.kozlowski@linaro.org
Subject: [PATCH v5 2/5] dt-bindings: soc: qcom: eud: Add SM6115 / SM4250 support
Date:   Wed, 17 May 2023 03:03:05 +0530
Message-Id: <20230516213308.2432018-3-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230516213308.2432018-1-bhupesh.sharma@linaro.org>
References: <20230516213308.2432018-1-bhupesh.sharma@linaro.org>
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

Add dt-bindings for EUD found on Qualcomm SM6115 / SM4250 SoC.

On this SoC (and derivatives) the enable bit inside 'tcsr_check_reg'
needs to be set first to 'enable' the eud module.

So, update the dt-bindings to accommodate the third register
property (TCSR Base) required by the driver on these SoCs.

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 .../bindings/soc/qcom/qcom,eud.yaml           | 42 +++++++++++++++++--
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index f2c5ec7e6437..9c64b5d9504f 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -18,12 +18,16 @@ properties:
     items:
       - enum:
           - qcom,sc7280-eud
+          - qcom,sm6115-eud
       - const: qcom,eud
 
   reg:
-    items:
-      - description: EUD Base Register Region
-      - description: EUD Mode Manager Register
+    minItems: 2
+    maxItems: 3
+
+  reg-names:
+    minItems: 2
+    maxItems: 3
 
   interrupts:
     description: EUD interrupt
@@ -52,6 +56,38 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc7280-eud
+    then:
+      properties:
+        reg:
+          maxItems: 2
+        reg-names:
+          items:
+            - const: eud-base
+            - const: eud-mode-mgr
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm6115-eud
+    then:
+      properties:
+        reg:
+          maxItems: 3
+        reg-names:
+          items:
+            - const: eud-base
+            - const: eud-mode-mgr
+            - const: tcsr-base
+
 examples:
   - |
     eud@88e0000 {
-- 
2.38.1

