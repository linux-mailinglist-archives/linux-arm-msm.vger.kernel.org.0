Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 407015FB930
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Oct 2022 19:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbiJKR0R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Oct 2022 13:26:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbiJKR0N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Oct 2022 13:26:13 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3887211146
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 10:26:12 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id cj27so8680690qtb.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 10:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4y246bMRiyXgggpw2m0x5+DX7a97KLlgQ9WDTK7SfM=;
        b=btnqZ8Fy2MwbXSdoyexJyVDOfw3JKdkD05YVKN8pfuwk5QpAoJbM4fua9WFN5mu+A3
         pnjU5O6FdDd0kqsYANi5jEJmiavnSVnk1RpkDaFtBhXE0c5E1lEA/EW4uhWEsalrJlp+
         0BtJnx9XkiDjV/uQmURPLIuvjP+rO/QgrphKzS0Y1/JDysghoD0TsEMibXNFKvdP5gmC
         /JXXB2bzxOxNis7i2dF1i8UvILxcnn0PSETCg6R+YXDbjVcin9MX3v2RlYVz8y2iX6Vy
         Li6QSmUHvD8a5j7bUq60/ELHmt9mjdlDP57xL0hxIenXzZBtstc3QevLFmnYXoQpR4s2
         YxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4y246bMRiyXgggpw2m0x5+DX7a97KLlgQ9WDTK7SfM=;
        b=VtGV5nKBTMZdBIjXrKYvoJ2oTlr6UDfFmc79qxTrXHYUn49aMDPR4QryVIwhb/pAoz
         2W1iZSqfxuyPEu6Ev6NEe2y/SlgAPB9p2x6ek+gZw02R16otK+x3cqsFNUTYI/dxlOCQ
         18BOl+qRJ3HUEPCqslw+DHcYfS6QwHuZPFA5eIzgsCl/mVyi1sDPgfMOfHqISQyED9up
         uqnv3Lewf7wdYRAAWQ7jyX9sFu/1E1pBx66Vu9bWpbvC44SnFcS18acX3feF3FCHu8rt
         Hyxqx/TwMGmbf+dkh+0FnsICqt0BBUMpDo8LaHfjAHEZ7IKGkK+dUvF50ID+uyhSr9L8
         ZCxw==
X-Gm-Message-State: ACrzQf20wh7AUm2uLkWdFlRzdb0UhwTYRfXyxTCQH+ox2qxOg7zkURTQ
        KdoKaoZMDaYRtKIj4W4EYFC5Ew==
X-Google-Smtp-Source: AMsMyM4BIZM22vW0xpdI89eTM6ytkwqgZD4a9KOB7WeO4XIenfQ/wXW/9ueP4ySS5w2zo8BRXNwWmw==
X-Received: by 2002:a05:622a:90:b0:394:1a9b:638e with SMTP id o16-20020a05622a009000b003941a9b638emr20262821qtw.314.1665509171381;
        Tue, 11 Oct 2022 10:26:11 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id i14-20020a05620a248e00b006bba46e5eeasm14289087qkn.37.2022.10.11.10.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 10:26:10 -0700 (PDT)
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
Subject: [PATCH v2 04/34] dt-bindings: pinctrl: qcom,sc8180x: drop checks used in common TLMM
Date:   Tue, 11 Oct 2022 13:23:28 -0400
Message-Id: <20221011172358.69043-5-krzysztof.kozlowski@linaro.org>
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
 .../bindings/pinctrl/qcom,sc8180x-pinctrl.yaml        | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
index 62d0ea7bbc62..71ca4cfd567c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc8180x-pinctrl.yaml
@@ -60,6 +60,7 @@ patternProperties:
     description:
       Pinctrl node's client devices use subnodes for desired pin configuration.
       Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
 
     properties:
       pins:
@@ -111,16 +112,6 @@ patternProperties:
     required:
       - pins
 
-    allOf:
-      - $ref: "qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state"
-      - if:
-          properties:
-            pins:
-              pattern: "^gpio([0-9]|[1-9][0-9]|1[0-8][0-9])$"
-        then:
-          required:
-            - function
-
     additionalProperties: false
 
 examples:
-- 
2.34.1

