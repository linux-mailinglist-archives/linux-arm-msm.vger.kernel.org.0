Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A686752FE68
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 18:48:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235051AbiEUQr7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 12:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355431AbiEUQqF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 12:46:05 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B9A11C11
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 09:46:01 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id br17so6705424lfb.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 09:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C9QWlYZbimnP2T28GM+wsNJfp2yzNn64Vfz4tFJ6qNI=;
        b=ZowkgVTuMlqygpJ6ywRaqeiyoReQBVjtzOGMRCuXLQmsdyTqNXeoUOzxlDVbSH3kZR
         X9CTQvYKlZC2K0I7t8q1OsaDr0jbLFD0Y21iQDcdEVNgU/seE9Tg+6jQIu40IF44qIQq
         6bXRe0riKun9ihbZ7xiCfM2eBmDE6JQZ47wwBVR0A5P8yRnuVJ4sjo7lv9d2a+z83qtC
         xfdEDKXG+ttBNYzltJsjs5weAnmubcQJga7DEvK/S8+Zc6I7IzQ6breG1yiPGNaWxrG7
         6uGcIz24tc1/4mEhmVpL9OHuKUJVoSl9dSVndbF4hIcDY+FFsY3OTRKOcrt5KmamY3SO
         ZDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C9QWlYZbimnP2T28GM+wsNJfp2yzNn64Vfz4tFJ6qNI=;
        b=JXgMvaMkmmQmJcbt5PxWSP5YBkafjKtuNJifKZzSd7eZcKZO6wwz5LvzwPy4b1UFEh
         P7Um4adXG/W4WtJKlr2HXkYqRUiGHZQpvntSiHKVI5iHCiqddYtb7QH73nEwD7ZTpdzC
         i6Gg/ALF+bS63VkO9EsJWoJzak5vBglPUpeP8+lFK/a8FyGrytCYCrkJDId8P/WISDjt
         4CGLpQ9rF9KAAC7fTanw61bPBLkmXYLx0mlUvdGKM2TU4bKnwKACobgTFt77pw9GrWiZ
         1CQ+tFJiEfwL03orguM45zpMnjjny6eFel8Bc7c9E7xsIabXpnc51tF4LrqYgmjiGUln
         bYGw==
X-Gm-Message-State: AOAM530CNWJf6lvoOzlAaY8mSrRVRG7Y51SLaJWuncaA/tjc3hMQanVr
        EjgYd9hBgJODIsGKfozufidz7A==
X-Google-Smtp-Source: ABdhPJzwRO2glBghGZQzXUTWSMG1t7FIjn6BCiv8fJWMyIHR+R+mzV6kEKGSZw8q5n6rTLhucAh6EA==
X-Received: by 2002:a05:6512:3f0d:b0:477:8ecb:2163 with SMTP id y13-20020a0565123f0d00b004778ecb2163mr11041206lfa.278.1653151559438;
        Sat, 21 May 2022 09:45:59 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f26-20020a19ae1a000000b0047255d211cesm1114282lfc.253.2022.05.21.09.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 09:45:58 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 06/12] dt-bindings: arm: qcom: add missing SDM636 board compatibles
Date:   Sat, 21 May 2022 18:45:44 +0200
Message-Id: <20220521164550.91115-6-krzysztof.kozlowski@linaro.org>
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
index 776149a3f628..c4fc6dd09ec3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -48,6 +48,7 @@ description: |
         sc8280xp
         sdm630
         sdm632
+        sdm636
         sdm660
         sdm845
         sdx55
@@ -292,6 +293,11 @@ properties:
               - fairphone,fp3
           - const: qcom,sdm632
 
+      - items:
+          - enum:
+              - sony,mermaid-row
+          - const: qcom,sdm636
+
       - items:
           - enum:
               - xiaomi,lavender
-- 
2.32.0

