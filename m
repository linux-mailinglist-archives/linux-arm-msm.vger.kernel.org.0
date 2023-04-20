Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB2036E8B4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 09:24:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234002AbjDTHYm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 03:24:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234045AbjDTHYl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 03:24:41 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A3254215
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 00:24:33 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id vc20so4130731ejc.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 00:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681975472; x=1684567472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UeE1oPaPoCHu6Xt7NpLmY+t44SfRyPfj0/UTyohxLM8=;
        b=B6RsF49XoExRgE22W6/kqV0IWJUJFUYhRinWcd9jbCRbzV9jrX6wPT3Sd9UffCjB9G
         NNRHcUfzZ7Yq7C+Z8yVfTIKyMLk4yw2uf3HsF/4PcU+KmavBEzbg8i1y/mo/IorlCOb8
         FQkSxRNokmqsLskqrtMg+xAh5hgrSDQX9ZTYadkusQaQwJcgv02H5TJA2mLHlIFU5FgA
         xKOfM4qZwVDJ0MUdYvqPLePNZITyr34erDkiC5Jg0fz1DffB6xDgHYIdNKeGTCYUbYha
         9qKB7CAZNm9ZYYsef8Ki49ANxhTTIWQKoKZyXVcU3FEkqVs4P0HLPYooNhkkw4uFNjFI
         oMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681975472; x=1684567472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UeE1oPaPoCHu6Xt7NpLmY+t44SfRyPfj0/UTyohxLM8=;
        b=fultgSoeFshFiRSnuldG8C0KEujVqFdcFj8faoVWbaCiDVllHR7v4bW/G3CrW5tdcW
         UbGPWVAD7jdVHm/ZEcOAqPJc20gOljpN1fNMWZxQJBIobs8T2GufQfrgRnldr+PejKKO
         peshKfDRfrOQa7IztaxhJu/rKttdhgZCRly6HsdPe1yyccsAgHnVP5iGfFOJYRlU9DZ8
         YYCjMLs93ZoDagH12Zp9q/VHB1zaSSqSttxuov7+cCJcmGJXmJPnRVvjVuFsSfLdccdl
         uLAXNprKm2w27DSjzscGKIG/EnOZWyd5mXuuBWALqI6Egt2QKbaHBMGW1OxyPXda/4L0
         t4vA==
X-Gm-Message-State: AAQBX9f2t9P1Z3LibveNmR5XfWz7ZidUcg9Gfhhgbexr41WnStMhZu2C
        lEnKBoTYXHFKVoF8Tr0EpKROBg==
X-Google-Smtp-Source: AKy350bZ9uh+yzDNBiXCTHa6fAMploSnigzOJLxJbL5XoLrMQoytcA7HV9j1DJomq/lGyjke3CB/AQ==
X-Received: by 2002:a17:906:304c:b0:946:c1d2:8b5d with SMTP id d12-20020a170906304c00b00946c1d28b5dmr5282179ejd.17.1681975471702;
        Thu, 20 Apr 2023 00:24:31 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id y21-20020a170906471500b0094f663bced2sm415784ejq.33.2023.04.20.00.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 00:24:31 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: thermal: qcom-tsens: correct unit address
Date:   Thu, 20 Apr 2023 09:24:29 +0200
Message-Id: <20230420072429.36255-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Match unit-address to first reg entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index b6452ed78802..d9aa54c11663 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -328,7 +328,7 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     // Example 1 (new calbiration data: for pre v1 IP):
-    thermal-sensor@900000 {
+    thermal-sensor@4a9000 {
         compatible = "qcom,msm8916-tsens", "qcom,tsens-v0_1";
         reg = <0x4a9000 0x1000>, /* TM */
               <0x4a8000 0x1000>; /* SROT */
@@ -358,7 +358,7 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     // Example 1 (legacy: for pre v1 IP):
-    tsens1: thermal-sensor@900000 {
+    tsens1: thermal-sensor@4a9000 {
            compatible = "qcom,msm8916-tsens", "qcom,tsens-v0_1";
            reg = <0x4a9000 0x1000>, /* TM */
                  <0x4a8000 0x1000>; /* SROT */
-- 
2.34.1

