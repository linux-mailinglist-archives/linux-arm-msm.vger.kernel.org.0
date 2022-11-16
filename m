Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B50F262BBE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 12:27:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239010AbiKPL1m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 06:27:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239343AbiKPL1J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 06:27:09 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95D612A970
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:17:51 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id bs21so29373632wrb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 03:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbsa3bLA/wMv2MLSQ7jZxuU99/pQBAA0OD4jsFAi8M8=;
        b=B3yyoXk2amBl2yptwzLGqoZvVLEMAM1K+RJm2NBjR+3aZP7yRKg8o3x6y1YyiBVGsy
         /rjxtkdtKn6zN3BdZqTr/QmNf4J+6kVy5AyoECUoF7q6u5ZXz6zX6QGg6tMnk8sGC93f
         4UqFJRrLArzynh17AR+elKcLe4vTbHSBf3bEPNFPrrWn5pcIUND2f2dGPMNSqjsNMjSD
         71IZVpADXUB4jlECIK0/vTLz8LcYznP85Yu8PdouzurQaIu5I7cnnwVw7CALKijg2jj1
         gFLlRjhhcGT9IVDVb/Ag7vyLqbLrjOw57qkQPbdp28ANOQblGBrGqb0hnch2Kz4+MZ3a
         lMyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dbsa3bLA/wMv2MLSQ7jZxuU99/pQBAA0OD4jsFAi8M8=;
        b=yeBaIZRTmcymzbOzTRAtl4qt/4ea1uCEC0HA+oSE3ClFEIqDzCJN7P7Ii9mtyU4gtt
         OJO97oMKP9ZGBV9/fbmkbfT1ZVPShAPbpkCLF6sISMGMJlZis2Cdh9TXPpfqkyUH7D29
         hvZy8g9UIfXig/PYuufmnP0Gsc8GZZCbQ8gR6A3vgrTWxyrMjNajTuWPe18HKMctR9S7
         wEZzCvCDOOE390L9yJ23WL9EyNoJ8iYtkGyBjzmV7RN70UyvNJdpYeym/xkHcr7hDoRF
         rqGTYsTIOYJBJMR4KSMCNkP1m2PSbepJBluAQahCKvVnTpPin5cHX2YCY2XppjMujGHX
         R69Q==
X-Gm-Message-State: ANoB5pmvrrDUnMWQA86IAhC+Nb0/Lq/J1OTqgW0D8LK/4vUAkt1m1Os3
        ypPPzEk9T51D7kO6OFvTPA+MxA==
X-Google-Smtp-Source: AA0mqf42LggVGFR/E7ZboJ6Yqyw6rWVGHc5A+19uvWJuQaVWk/qNAD4w23/GsV/1Sr3peL6qRGOs3w==
X-Received: by 2002:a5d:670e:0:b0:236:e5a2:4f66 with SMTP id o14-20020a5d670e000000b00236e5a24f66mr14344024wru.357.1668597470096;
        Wed, 16 Nov 2022 03:17:50 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c19d100b003c6f8d30e40sm1875870wmq.31.2022.11.16.03.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 03:17:49 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: power: rpmpd: Add SM8550 to rpmpd binding
Date:   Wed, 16 Nov 2022 13:17:44 +0200
Message-Id: <20221116111745.2633074-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116111745.2633074-1-abel.vesa@linaro.org>
References: <20221116111745.2633074-1-abel.vesa@linaro.org>
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

Add compatible and constants for the power domains exposed by the RPMH
in the Qualcomm SM8550 platform.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../devicetree/bindings/power/qcom,rpmpd.yaml    |  1 +
 include/dt-bindings/power/qcom-rpmpd.h           | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index c0bee4e8a9db..5bb9f59d196f 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -47,6 +47,7 @@ properties:
       - qcom,sm8250-rpmhpd
       - qcom,sm8350-rpmhpd
       - qcom,sm8450-rpmhpd
+      - qcom,sm8550-rpmhpd
 
   '#power-domain-cells':
     const: 1
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 7b2e4b66419a..7a31620ede7f 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -113,6 +113,22 @@
 #define SM8450_MXC_AO	11
 #define SM8450_MSS	12
 
+/* SM8550 Power Domain Indexes */
+#define SM8550_CX	0
+#define SM8550_CX_AO	1
+#define SM8550_EBI	2
+#define SM8550_GFX	3
+#define SM8550_LCX	4
+#define SM8550_LMX	5
+#define SM8550_MMCX	6
+#define SM8550_MMCX_AO	7
+#define SM8550_MX	8
+#define SM8550_MX_AO	9
+#define SM8550_MXC	10
+#define SM8550_MXC_AO	11
+#define SM8550_MSS	12
+#define SM8550_NSP	13
+
 /* QDU1000/QRU1000 Power Domain Indexes */
 #define QDU1000_EBI	0
 #define QDU1000_MSS	1
-- 
2.34.1

