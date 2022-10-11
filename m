Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE045FB96E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Oct 2022 19:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbiJKR21 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Oct 2022 13:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229837AbiJKR1V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Oct 2022 13:27:21 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D56D520B5
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 10:26:43 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id h15so4555944qtu.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 10:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lL14UiPeKdh/QD6+joJS9aO6pvdHV6+MX1LEVoDNOrY=;
        b=aCfBaHyW5M7b0a+mKTUTMOxtHutyhoCEs7oFo9VGSQBaN2wHyyTg0ZgLWVd+eCaEBC
         cnl8Jl5Yv31UEHAL8AVhGR0Si+Liw+wA04U+0Llowu0kGBqD2tWyBjag5KFfXotRBj8t
         hgOi43pz40JVxX2fea6x6/V1TX/dybyq4o2IPUOceyXilfv8kgzRXUlBbvCbJFm8Dzct
         A1did00iPT5GNntAMzwBNmjDg+ympjj68jgGTVMly2y9fYK0F4ftA3f/tmL7ANUh6O8h
         ZfdUghEqE/8mHPEr3ZyeEhjehORGRM9Ds4XrKLW6dBw2JEP4DEHjm8Iq+Hvdz7Gx0wb3
         szrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lL14UiPeKdh/QD6+joJS9aO6pvdHV6+MX1LEVoDNOrY=;
        b=H1i8O9kjiOmPtMT7GMAGKb7ipumEp9zHKDPmgsptFQ3/WMHwRQ+eb12MxUleonOhbL
         doTLKdy/wpw4w4GdIPRg6HMvKNfL5RqFp70y76Mt2FaFKytPw+CImq7ir9rQaBC6rQwq
         QhFVZTAyb1wxSCLceQvc36t/HmxNxvkrM63DwiAzF6xl+nhxmUR5hO1WarB3aOhp3FpK
         mTDXbkhvCNLuqpjWQ9eY9G4u/5av4Wc1yQeeA5DXZsHHK3usQEZ787lw1lLxnm5BHOqN
         KevHbh2pO3NNGgbg7Dm94SHXnynsptefo0j2uYlbOkX6SdNE/XbEUGaR/sQnOiQWrSrz
         k2FQ==
X-Gm-Message-State: ACrzQf35x2QoVRk6ILN4N2hS7ktzq5cndSYXDiWQ8otGD80toyI5S+5H
        ni0RsiZNFs1KYW1rrYwhDe3ZPg==
X-Google-Smtp-Source: AMsMyM6cgPDaHR0I4WZq9qmvwh7tbqICBBktFnruXzp31YdfKTx+AUo2Tuc0M5Ls7MiWBt09UptNxw==
X-Received: by 2002:ac8:5907:0:b0:39a:e5c3:af86 with SMTP id 7-20020ac85907000000b0039ae5c3af86mr7676626qty.74.1665509189884;
        Tue, 11 Oct 2022 10:26:29 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id i14-20020a05620a248e00b006bba46e5eeasm14289087qkn.37.2022.10.11.10.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 10:26:29 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 16/34] dt-bindings: pinctrl: qcom,sm8450: drop checks used in common TLMM
Date:   Tue, 11 Oct 2022 13:23:40 -0400
Message-Id: <20221011172358.69043-17-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
References: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
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

The common Qualcomm TLMM pin controller schema already brings
requirement of function for GPIO pins.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/qcom,sm8450-pinctrl.yaml         | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml
index 9cd97a467648..7ab9a0eec017 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-pinctrl.yaml
@@ -60,6 +60,7 @@ $defs:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
 
     properties:
       pins:
@@ -112,16 +113,6 @@ $defs:
     required:
       - pins
 
-    allOf:
-      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
-      - if:
-          properties:
-            pins:
-              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-9])$"
-        then:
-          required:
-            - function
-
     additionalProperties: false
 
 examples:
-- 
2.34.1

