Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18C4652FE4E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 18:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350649AbiEUQqh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 12:46:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355450AbiEUQqF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 12:46:05 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF9FDFFB
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 09:46:04 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id w14so18963590lfl.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 09:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KL627I96OYJURncrfoqim+72Sgnc3Jh9TbRtRh1RYGA=;
        b=fgnnWtmFXtDfmlrF68KmFMj2A/G04G1vJ/ZGn+6ouUXd9gztNB5wcdj1hyzGe8nUhf
         mR/wObB8nobZsV5DTKYCIUSgxpNSOQ4DVyDy6eGORu+/U3MY94UFkunBKf2VRv00PYOB
         CG8OgWsrai7wZJjKou2Em8msMKvzvIWAn3s/GAGmMH422mAORuY0QAsbyi4G/D9QYetg
         PQ5awO0V6xXTPNSr4e995Drni+149b6JUrileeRfrbpyYmq+XgBqKvgnkKqvnfmYnT5q
         UuSxm39cE8601Kseg8cSR2mkUKhDpMx2SL2Nq1pL4uzaZx9uiEFr2vmsC9GBuNpN7Z9R
         l/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KL627I96OYJURncrfoqim+72Sgnc3Jh9TbRtRh1RYGA=;
        b=JIWbIXBOXXqoLKNmRv/y5CMm6PaIpni14uo5ExelgWmeqJrjDTgO5Oej+lbHUEyZ20
         2c8/lp7E0wdoz5uy21oKWfXHhJsYMnC1JRKrfcZbJstJJcJlgMJs3ZXc/QmFNbajqI1/
         iIHU8nKC2zA7k4goj6G/INGYfIgXBXMKMnx53RpeWVASkZrBz35xBltqsCfUyV+mYGVV
         8Fqz0AGxDr/GAj4VquBj5SSdJR2oo9txcAUhi3VN6PyH3Vzw14t6TzZgxWk73tsP2Kbn
         n+pz55YoDoYJZwQJaPUQ3BqxOFNWmP/++As/HojR80Nk1IN9FzN6Pbapz875Xo0qcrZY
         WMPw==
X-Gm-Message-State: AOAM530Q5JP8on7zTZ61yJjYbgEx1pOJs88/AIZv1XUC2NvMsWSUbxT3
        VmohxI3Ddk2Ju1sUAzFvlfh5NTxMEZlQML2D
X-Google-Smtp-Source: ABdhPJyqvTk2Hjvz36PPOk82vfRDnOJCvvVaW9nReXFuEflMVpV60WIAW5ax0bi6OQDNHIWSykO+ww==
X-Received: by 2002:a05:6512:33cd:b0:477:b113:caa9 with SMTP id d13-20020a05651233cd00b00477b113caa9mr11013814lfg.264.1653151563124;
        Sat, 21 May 2022 09:46:03 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f26-20020a19ae1a000000b0047255d211cesm1114282lfc.253.2022.05.21.09.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 09:46:02 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 09/12] dt-bindings: arm: qcom: add missing SM6350 board compatibles
Date:   Sat, 21 May 2022 18:45:47 +0200
Message-Id: <20220521164550.91115-9-krzysztof.kozlowski@linaro.org>
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
index 9f4be49aceb8..6c38c1387afd 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -54,6 +54,7 @@ description: |
         sdx55
         sdx65
         sm6125
+        sm6350
         sm7225
         sm8150
         sm8250
@@ -359,6 +360,11 @@ properties:
               - sony,pdx201
           - const: qcom,sm6125
 
+      - items:
+          - enum:
+              - sony,pdx213
+          - const: qcom,sm6350
+
       - items:
           - enum:
               - fairphone,fp4
-- 
2.32.0

