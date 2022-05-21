Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DAA952FE48
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 18:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343721AbiEUQqX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 12:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355436AbiEUQqF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 12:46:05 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 847271274C
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 09:46:03 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id m11so1206922ljc.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 09:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lV6XE1ObPcqdSJehI4oOM5CcaG9hBJhYUJVtFsl6KVA=;
        b=SlF8HSmJ37m/auQxe5mt5Wgps17gPY1s9HhSGiiP1KFyNvJzGhQowQxpe3tLjki7aw
         ai67ybC6IH/467bxmNRIlUTtTHQGXF3wTpR660iO88ztsy+QEnEP1P0Nb+SAfYqJ6IRs
         Q6iNvqUuoMLFoBdWDYcUa2L0PthPj43lOepkanheo1VdsB17enX85QA4dO8Qu7IAlHNo
         9GR+pF0KN+iFCWvkWJnAYkD/skdlwyOL5AxduWNcPjBXnnLKHJwOflCNsQhWofqW0FQ+
         Zurv0vRihj5MSQmxOgh2ANjZ2tr8v5ql9tcEjlkZe/zcJH3oIfzrXY6PjKTvHVdi6tsz
         HEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lV6XE1ObPcqdSJehI4oOM5CcaG9hBJhYUJVtFsl6KVA=;
        b=Yu8RWIkKLYA0GtLL8VDrssxEX5bCQwCu8K6X19fXu27+4XoK1t+SlQZoL1bQ5Scy05
         k/vZcDHkp2tB6hjXlxytD+19jHsNdjf3rYPbbLuK5UVxzpIhOtYgHUh/PyXgkKFDBDmG
         5c06vvj4iIKEYkID8Tt46+B7Nmfih5JiPmxXpIihuf+dxTjxBhwKqrrNv2op3AomsYxM
         SHTelegMZTTBwFXd2I2tParJjV1viyL4IOeMT1+r3hIbQjqEiwCN8bpYMim94tVB1yZu
         1gMoDv5/hQKdJ/Z7MJEFPc/UIeMzpZs5hzoT9CmlkGscETwP/6qpJV9fGrGs07vCnMoI
         zjQw==
X-Gm-Message-State: AOAM531pDiuK870xaEQZyrlmIaZAEaPTEGVL1/tx3CUvIgKUIXxa23GS
        J7fmbXDqVf3W0c1R5gypvPtmZA==
X-Google-Smtp-Source: ABdhPJwBJx86nm4AGXMi3tXkTmiD+126msLSL/MxRxN7ylxSmhbk5p7qheACXUDPfoRhAPNsqtCenA==
X-Received: by 2002:a2e:8346:0:b0:24d:ac67:42c7 with SMTP id l6-20020a2e8346000000b0024dac6742c7mr8195551ljh.323.1653151561926;
        Sat, 21 May 2022 09:46:01 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f26-20020a19ae1a000000b0047255d211cesm1114282lfc.253.2022.05.21.09.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 09:46:01 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 08/12] dt-bindings: arm: qcom: add missing SM6125 board compatibles
Date:   Sat, 21 May 2022 18:45:46 +0200
Message-Id: <20220521164550.91115-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220521164550.91115-1-krzysztof.kozlowski@linaro.org>
References: <20220521164550.91115-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document board compatibles already present in Linux kernel.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 84fdb4f337b6..9f4be49aceb8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -53,6 +53,7 @@ description: |
         sdm845
         sdx55
         sdx65
+        sm6125
         sm7225
         sm8150
         sm8250
@@ -353,6 +354,11 @@ properties:
               - xiaomi,beryllium
           - const: qcom,sdm845
 
+      - items:
+          - enum:
+              - sony,pdx201
+          - const: qcom,sm6125
+
       - items:
           - enum:
               - fairphone,fp4
-- 
2.32.0

