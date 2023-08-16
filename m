Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A69ED77E0D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Aug 2023 13:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244805AbjHPLwM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Aug 2023 07:52:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244875AbjHPLwB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Aug 2023 07:52:01 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F2E72123
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Aug 2023 04:51:57 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fe4ad22eb0so62824745e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Aug 2023 04:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692186715; x=1692791515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G7oGum5pCxYXSoJ0gOXkhrsK7bDcAuYfzLXErLOePNc=;
        b=Thzl6MEwqX2EG4ah95QbNXFdMDhTZJe6XEpejlyxl7vzueYv3X1GJtAIO/b7+9TdBM
         1EU5gEg5dKdrA/w0zG9gflZyXzptlyBmT7Uv+dBu3pnbhYvujX0vs+AbgqJGYj0CGrX2
         rK5OT8RNbFaHK8zxZiOVtEaUb1HCO6P4a9h8D3ZfKCp+HonAe9dai3veuPgOTEOILmDs
         1L+ISeGDH4IRQXRQA4Yi6uENl8UOFgvinp+1Oj1m/58cQ53Lh3+qb+79/wdgFuQMRGcz
         h0KBoGbwpo5tJQh/Xp1aHrEpagfYZwIrKfh33X2uucHT+Y5uv3388F//W2UiTFZEkh5o
         Tpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692186715; x=1692791515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G7oGum5pCxYXSoJ0gOXkhrsK7bDcAuYfzLXErLOePNc=;
        b=Jb65MgaoSwM+4vxF9Clm91U4DGd5lMLnZt8EAwvIHAN/AEycjZmzoicvKcwgH47gMh
         xOcppmxQONzn0WdfOeEL0YiJEN+tMcE8jqb0dqvJRDK+ZE3cuKpmeL85lBWZZMOtJ0BE
         aNz8CSb1Gkbk7QA49Riy9AMiOhK3YXC9whk8Xx8SrOwsnv6zAPEExoW+3AMByuX3+6Zr
         LjloaMI54wgfD/5MsZKxY40DuOIx7gFnY3RDeHEXDX0Pd6D+ObGujcEnNqciA7o9K8Yr
         jBeJPyzbhyh9UNaStQpitC6m+auOA7c3j0VOgVZmAO03thxRL30GosPwpavEKDVUgdsp
         MX8w==
X-Gm-Message-State: AOJu0Yz6kybdaz/wOH3wIFFbEjsc6+aMInkogEA7lRXghb0QNpCAcB6t
        b+QaJC7pXNJ75SocxjO0Saa9JA==
X-Google-Smtp-Source: AGHT+IGKKt/5GN8Voyhb2f+eEeYq7Z0jaVDOdWiPNhgmcX5J8bnStHY5ce0fSMZ4EUt5JklZF49MRA==
X-Received: by 2002:a7b:c4cb:0:b0:3fb:e573:4172 with SMTP id g11-20020a7bc4cb000000b003fbe5734172mr1253510wmk.31.1692186715540;
        Wed, 16 Aug 2023 04:51:55 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id fk3-20020a05600c0cc300b003fc05b89e5bsm21280663wmb.34.2023.08.16.04.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 04:51:54 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        sboyd@kernel.org, luca.weiss@fairphone.com
Cc:     bryan.odonoghue@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 1/7] dt-bindings: mfd: qcom,spmi-pmic: Add typec to SPMI device types
Date:   Wed, 16 Aug 2023 12:51:45 +0100
Message-ID: <20230816115151.501736-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816115151.501736-1-bryan.odonoghue@linaro.org>
References: <20230816115151.501736-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the PMIC Type-C port driver to the list of devices.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 8b9a2008a354e..7fdbd15969d27 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -164,6 +164,10 @@ patternProperties:
     type: object
     $ref: /schemas/thermal/qcom,spmi-temp-alarm.yaml#
 
+  "^typec@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/usb/qcom,pmic-typec.yaml#
+
   "^usb-detect@[0-9a-f]+$":
     type: object
     $ref: /schemas/extcon/qcom,pm8941-misc.yaml#
-- 
2.41.0

