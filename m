Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 191C052FE54
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 18:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355430AbiEUQqf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 12:46:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354756AbiEUQqE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 12:46:04 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA30411475
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 09:45:58 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id o22so12649649ljp.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 09:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6vYR9RHMNy47XGIvzBicNfQWTzui5AzL3akVXzjn8Hc=;
        b=ipuPVpzgrCNGPVv8uPQTxZ/hNruo0pR7cN8Bvq2LEHs6pBPesKjh/uEHkXNpO8lLD5
         oNL90rVJR77ICk4lviZe9Scv7y5mIQlP3Vl6TGGabeIGNQ9LhkIWDbeVjdYvN/OJs90X
         3qjeU1Kxgt6yq2YUY/RclXN7DBLg17qjfXIY4uAxSnN4i1HJ2UbZ/HoUucgZx9fffb4p
         K54Z7MliqC2XIGR0TXzBlt0hLjgfvdylwSzf82dOlUvDanwBI2n4Q6ztmOBW0f2RvbXw
         F5wSaTMNQfUUGjqGtYHcEKHwKqjbjaqJEaz9DHN7x+Tw/mduqJGLe6zRZnEQiDLyCBYK
         zAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6vYR9RHMNy47XGIvzBicNfQWTzui5AzL3akVXzjn8Hc=;
        b=mklmCYy8mWpnUSsZzjxPzyXG+28SX2nn6VmeukDIZF6V0rM7lYLd4dsqlff+Uxa3I0
         JqMkRi6PUh/I7iO96/0FWcZ8ebkPKCcvmnW0vhmLGaVaSxwWpNjzvlWleqIkonrK1DMU
         cwL8TPKcD/5RhUCzqItUU+TNefdrX+nCAwJOyULJT4AQQFtY62Af58p3cXFSnz+PHwoJ
         +o8naW0G66ijxu/P/tFGc0Hs41k274kHEUNXyjZJqZgFZsgQTTuezub1tINWAYpyVU+L
         L43SAACJZicYDIufA7T+gM50Z7hfOM+dLVqSJ1CFc7oHViyGefZQuER/plFOKlR/ydBe
         nuMw==
X-Gm-Message-State: AOAM532a016LntqDUzIQsaklvDRGr9m/rHIk2Tc6o20+QTwVljlQTWnj
        L6KTWqzbLXdc8k04m5/wqml7Sw==
X-Google-Smtp-Source: ABdhPJzKTRQmaY3NTiIknau/8wCbjhrp8LohOZfMELCVoaQyt1WVyW2z4lyRfGQoMHmZTZXbbInevQ==
X-Received: by 2002:a2e:b78e:0:b0:253:cee8:629e with SMTP id n14-20020a2eb78e000000b00253cee8629emr8055605ljo.244.1653151557040;
        Sat, 21 May 2022 09:45:57 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f26-20020a19ae1a000000b0047255d211cesm1114282lfc.253.2022.05.21.09.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 09:45:56 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 04/12] dt-bindings: arm: qcom: add missing QCS404 board compatibles
Date:   Sat, 21 May 2022 18:45:42 +0200
Message-Id: <20220521164550.91115-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220521164550.91115-1-krzysztof.kozlowski@linaro.org>
References: <20220521164550.91115-1-krzysztof.kozlowski@linaro.org>
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

Document board compatibles already present in Linux kernel.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7a6e098c5670..888b640cf646 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -39,6 +39,7 @@ description: |
         msm8994
         msm8996
         msm8998
+        qcs404
         sa8155p
         sa8540p
         sc7180
@@ -306,6 +307,13 @@ properties:
               - qcom,ipq6018-cp01-c1
           - const: qcom,ipq6018
 
+      - items:
+          - enum:
+              - qcom,qcs404-evb-1000
+              - qcom,qcs404-evb-4000
+          - const: qcom,qcs404-evb
+          - const: qcom,qcs404
+
       - items:
           - enum:
               - qcom,sa8155p-adp
-- 
2.32.0

