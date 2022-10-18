Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3EC360364D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Oct 2022 01:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbiJRXEG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Oct 2022 19:04:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbiJRXEC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Oct 2022 19:04:02 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE7BABD04E
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Oct 2022 16:03:57 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id c23so10684171qtw.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Oct 2022 16:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTZo2+UahNqPWbr20HjCnz9vJERnU3dBPmvkQF15Ej0=;
        b=dVhl0/3xyNOFWUTaRfptDk77g3ISYeG5BAQULaistrGZpm1Vy3YIkO3rQp3XCubOWI
         GUIUU/MCGGfz/MyuqXZPK6fAVC60t0gL2+QXGAHjqVipYXHG0I87GMqYKtO/4hdyp9TF
         KpDuPrdwvJvUAmmcvvoH2Z10ZHFmjlrRaWlX19kV74IJ9XZ4OiU9lihpk0HJ8cric8ho
         hgoWVf+WrI2cw5zO82+AE/Erm7juQZ9GV7SnDr2psDvybP6Wvm7L5moYGKSLfRWKtz0U
         RBVe2ZXXiMMIr804C9XvPcgevTB3V8j01RXeMZXdP2T2QP/gb336ec1nXRpQG2WdcBK7
         gtXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CTZo2+UahNqPWbr20HjCnz9vJERnU3dBPmvkQF15Ej0=;
        b=f6QFPcxYD51rzoH/djS6+oulmjCehjE1TzvPYYRwsqARZcaHNJarKlGdsuywxTFrhi
         6/I885u3WCQB17B/Kgt4JRKmp/83vvVYmfz2aDx98JHzl40SK39JB6WlSt/weFcVZr1l
         AQmPJ1GzyynYcj3Z++76dASsCipOCLxCXBQ+PzJZlBhvo577bGD4LUrGLdauZXZQerP3
         mw7YXAPutV6sNHIy9Rpi9e8V0M5l1HFUtZuwloSN5CcqwFdeP49S/Q4VgqteaoVIupBC
         RzA8a7WTTPuuD9G1Xvfw9hVdT22blTrOc1aoxeUDEkj28z0qIiFnYb6N/Wx2tCZvRfUN
         NyIg==
X-Gm-Message-State: ACrzQf0avSuiEo3bqD8y7OQ+XorUy9c8Naz+EP84db4GJofBLHibMXCO
        K6UJ3oJ1e5T2MT1SJMDG6DidaQ==
X-Google-Smtp-Source: AMsMyM7g2AN/qnBID36dG7XpnKgpAor9vmvpsvkHVIag7jTObbnJSIafndN1Y40O8GPw4/aGfd64Ow==
X-Received: by 2002:a05:622a:43:b0:39c:eb15:c2ee with SMTP id y3-20020a05622a004300b0039ceb15c2eemr4201214qtw.331.1666134236657;
        Tue, 18 Oct 2022 16:03:56 -0700 (PDT)
Received: from krzk-bin.MSRM (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id 134-20020a370a8c000000b006cbcdc6efedsm3279010qkk.41.2022.10.18.16.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 16:03:56 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/5] dt-bindings: dma: qcom: gpi: Use sm6350 fallback
Date:   Tue, 18 Oct 2022 19:03:48 -0400
Message-Id: <20221018230352.1238479-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221018230352.1238479-1-krzysztof.kozlowski@linaro.org>
References: <20221018230352.1238479-1-krzysztof.kozlowski@linaro.org>
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

Several devices like SM6350, SM8150 and SC7280 are actually compatible,
so use one compatible fallback for all of them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index 6f7dcae944e4..0c2894498845 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -20,11 +20,14 @@ properties:
   compatible:
     oneOf:
       - enum:
-          - qcom,sc7280-gpi-dma
           - qcom,sdm845-gpi-dma
           - qcom,sm6350-gpi-dma
-          - qcom,sm8350-gpi-dma
-          - qcom,sm8450-gpi-dma
+      - items:
+          - enum:
+              - qcom,sc7280-gpi-dma
+              - qcom,sm8350-gpi-dma
+              - qcom,sm8450-gpi-dma
+          - const: qcom,sm6350-gpi-dma
       - items:
           - enum:
               - qcom,sdm670-gpi-dma
-- 
2.34.1

