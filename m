Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67B897DB6A3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Oct 2023 10:49:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232851AbjJ3Jtm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Oct 2023 05:49:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232526AbjJ3JtB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Oct 2023 05:49:01 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C511D1713
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Oct 2023 02:48:27 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-32f737deedfso1805290f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Oct 2023 02:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698659306; x=1699264106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uCuSfSLgFx8Z/IvwoSAQd+YCkV42twFc29IgX5SJkTg=;
        b=EO+7pu23wVOqdMCcOAQnUKgR8Fp59rAP1vtfq2/dmh/zSGlbEtm65sKaS/JQLr/q1R
         SNs6lN8lcTN7h+4AsepaZyxKDnqDUXbwfXDieQweI3taBB6ayVKZyCjz03Fz/T4aeVW9
         NutM92GxVdKLhO6Lm/I2T02urhSH7C2FfuIeMfIbcx6EiljwfYEDWZUcajanMNwPvE36
         07RK/VGtIW6/7hyHXEbnW7egCo2KnQQjuRGcqsiTKPZ9ydTtZvlv35mu38M5HrJUdKLZ
         nnW8iupQuH73IFJ0Z44kSz3DNm8ciOIiBMX29xVaK4Zniw1UZ3oxu568mIPJTGNxml1n
         1v6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698659306; x=1699264106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uCuSfSLgFx8Z/IvwoSAQd+YCkV42twFc29IgX5SJkTg=;
        b=FUBB8iKyEJVRjxN1EmIttA48D9ngyFU1UJpKZM4XWqM53AruWOq5WFg4eYnjiuPYFG
         1ciOQjM55R7QcaTBbW/Ml74uU/vfBA3uzgGYShE+1Fbax5jLpIOwHFKZM0qfOVD9rd3/
         7wdTwgKZuYGdhgX+Z8L4xOGcDQuoQiMheKnhUz7lPmr2N0GyTeYdbQWsC/YgJ1m/Hql9
         zhLNp+Mpt44U6Q7aHa8cjosCTyHIR7CBEEp786zC5nNT7MARTeGMSn0Wbc0Jw/mUfaPn
         MyexnXogbQC+VRLRoBG24eaCSzyXIPYaqNSr4vH1KAFTCN91NPTV/SqSXJrIcJsFI/b0
         sYBA==
X-Gm-Message-State: AOJu0Yzfx9EyWfXPuF2sJT5B8a7yETOoFBunegoKB53MKTwnFv+oKs+l
        PlI6yb7G18TSoSRD3N7QKwpAdQ==
X-Google-Smtp-Source: AGHT+IHW/xU5Ij0aGLUm73LSiJoZHAEsd+ik2nIPYqzPQsf0fl7/4XS3gnokOk2EzQoCAHfj6y/kpg==
X-Received: by 2002:adf:fa85:0:b0:32d:a221:446 with SMTP id h5-20020adffa85000000b0032da2210446mr6682171wrr.59.1698659306186;
        Mon, 30 Oct 2023 02:48:26 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id x14-20020a5d444e000000b0031980294e9fsm7854256wrr.116.2023.10.30.02.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 02:48:25 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 30 Oct 2023 10:48:20 +0100
Subject: [PATCH v2 4/7] dt-bindings: phy: qcom,snps-eusb2: document the
 SM8650 Synopsys eUSB2 PHY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231030-topic-sm8650-upstream-phy-v2-4-a543a4c4b491@linaro.org>
References: <20231030-topic-sm8650-upstream-phy-v2-0-a543a4c4b491@linaro.org>
In-Reply-To: <20231030-topic-sm8650-upstream-phy-v2-0-a543a4c4b491@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=919;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=uDr4gwg1jv7yeRi5cBz8xYb4ZzzFE6+VBH4HpIqP6lE=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlP3vjH4uGW9TyY3ekMitgroXCau0sfpQjVnZfbqiH
 yJNM9fqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZT974wAKCRB33NvayMhJ0WonD/
 4rK2+ac0h/7aAFux75W9E5oGIohRphOpiw0/MhpGXzOgcKxAHhIER/vVWUFv0qv0jcTf/vGSymHo+d
 gCfpsPxZWRjXBXQ4nv369sLAn+jb8+5ODwSWR+khqU81ODLRRe6WskynZ2NMzMFX8JmBzfhBbnbjYI
 wt7efHKzmEGhGXX2itP6f6xKSWINRCWFMrEky2Qpp27bgCGDgXiWcZd9FvgZfpfz9nhEl5E+SKPeSg
 olKaDv0QyNjAk9TM1OSwEMbB3GafzbCK7xLk+QS1rTuRPjWWWpfiLLCLbHb++5mYCbANSyqcK1W4wr
 heHaxu8qacQfD8YoVZWAjndiZQSOmzwrfWgnFmfBjzyY0dj2e077PBFygyd9/qRZmbTQ8Bmt5X7WPN
 1lsWVAMIRMUHLyjCaNkp8Ho7KnXd7mYYk2IkKmbSzKW+r26hvPTtDtzr80JDswjH06fL4R0oSAPePU
 nKeAUGbfp+aAKWXRtHd0479s6o0WWGyml7MygMWH8hP4x2Xw/LSokngWogAkzHi3duM4sUZ9eIeM3d
 fsLZIekuS5cuZYjY6SEd30edMT/C/xft7nwxSmPcXGzVg6p4OOkEHLiYTCribY+liJUZ0jF1c0SdX4
 VKR98rpQEOhYBOFGnMImQkKFcBzt92pM4oNmoVcQdyPUzW0Xro8FqNTX3FKA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the Synopsys eUSB2 PHY on the SM8650 Platform by using
the SM8550 as fallback.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index c95828607ab6..8f5d7362046c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -18,6 +18,7 @@ properties:
       - items:
           - enum:
               - qcom,sdx75-snps-eusb2-phy
+              - qcom,sm8650-snps-eusb2-phy
           - const: qcom,sm8550-snps-eusb2-phy
       - const: qcom,sm8550-snps-eusb2-phy
 

-- 
2.34.1

