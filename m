Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C18C5E89D5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 10:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233820AbiIXIIO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 04:08:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233821AbiIXIHV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 04:07:21 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0485614F8E3
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:05:47 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id q17so2284336lji.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 01:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=HNwxWQOq48N1VUFnvQ2D5d/loFw4gC2TJinoSqyo+l8=;
        b=BiVzSgMFabdIamj0lCD/Het6ygXdhSXgsoFt9JwIJrvxpsOyaJniaB7g4RlJIc8Agc
         CvcoxUVOt9bVH4JhMYuW65fo3vjZEkM9i94vZ2Ci2oYOS3FAX0o/Oqpo9lNhoCo3ylzg
         gKqGgEeJcDn3lhk6gZ0E6Qb5+Ei69O7/URA38uxk1PSZMfRmo6Rctm62OfyOL3+dQIEM
         b46XV6hqTVMQ+Fqcztvi+MxaPcp9Yf4kJUGhct5mAhTgi34F2kNXeeVnCp5j/QrSdhl1
         TwyQpBeObzLfov3diQMO5vddlS+Z0DOT7mU3ijAO4yfJ5kxXqBo1w2L0FeQwfNpq8ltb
         SQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=HNwxWQOq48N1VUFnvQ2D5d/loFw4gC2TJinoSqyo+l8=;
        b=nuaL/bFxsqvbETmEvpSkoXJv92HEOygBCPOlwuf0eV90flfOdkkDFvi0vmNUQrVCwP
         bsO0lBwo//m+0smqtAWaqQVtxrPYiMeTmWPhIJdFN0hMOVipB8IIgD8bocar2uVcfLUI
         jzzU6eVsxDpHwrG4nfrlKdoSm2Ai9lqB/PW1jA9LwifQ/DDeGiQ5u7vPLh8SQmRQCLhP
         Eq0ekywKzeKwK2ayMpekLAmKk9i9Th6Xg2u0pw2jGt9eaOzfiI8ZkqcxKaYwGhXC/Khi
         r2bCJpbIf/kiYtZJ2vadIhoY8tg4W/xijcVzlZAPieBt2hEAd6lWnTV0AW4N0EZiRfny
         emrQ==
X-Gm-Message-State: ACrzQf0gq2L664pNKgx7Y2k0gxOy8/Y4pC2s4ZTzYhBiqgl7ZwihtvWY
        /NKDnFJB3G3GMwLlG3LlH1bqiQ==
X-Google-Smtp-Source: AMsMyM6GwrYhOjw4DiSyDWrcY3mKxoP5UbseKfXQTYb8bBXaTxmPBodlXStoAJewcXc71Aquw2FImA==
X-Received: by 2002:a2e:958f:0:b0:26c:fd2:80b4 with SMTP id w15-20020a2e958f000000b0026c0fd280b4mr3890692ljh.147.1664006746974;
        Sat, 24 Sep 2022 01:05:46 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y2-20020a2e5442000000b0026c41574790sm1696668ljd.30.2022.09.24.01.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 01:05:46 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sricharan R <sricharan@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 30/32] dt-bindings: pinctrl: qcom,sdx65: do not require function on non-GPIOs
Date:   Sat, 24 Sep 2022 10:04:57 +0200
Message-Id: <20220924080459.13084-31-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
References: <20220924080459.13084-1-krzysztof.kozlowski@linaro.org>
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

Certain pins, like SDcard related, do not have functions and such should
not be required.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/pinctrl/qcom,sdx65-pinctrl.yaml         | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
index 0f796f1f0104..a45dc81cfb98 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdx65-pinctrl.yaml
@@ -59,7 +59,6 @@ patternProperties:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
-    $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
 
     properties:
       pins:
@@ -142,7 +141,16 @@ patternProperties:
 
     required:
       - pins
-      - function
+
+    allOf:
+      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
+      - if:
+          properties:
+            pins:
+              pattern: "^gpio([0-9]|[1-9][0-9]|10[0-7])$"
+        then:
+          required:
+            - function
 
     additionalProperties: false
 
-- 
2.34.1

