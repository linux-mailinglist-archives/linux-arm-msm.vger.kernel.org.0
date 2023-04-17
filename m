Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43E4A6E4239
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Apr 2023 10:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbjDQIJ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Apr 2023 04:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229912AbjDQIJ4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Apr 2023 04:09:56 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 709A349D3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 01:09:55 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id fw30so9050115ejc.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 01:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681718994; x=1684310994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eB6SW7Euj55s9d4nUZtZWO0Bk1+ooxqocEtVUxCmzck=;
        b=xEF8yexVoxI0DjKLEMIIiJP3BP8/jFyqdKdVYenrQPVCR1PBm23kkw2uMMJNhiCLMx
         goS48Uknlm1/GTAXMoVZmmcPeoYYHqOmnS0vZFu2KRQlqFy3Nc7lyBPuxmvEFv0dJ/SO
         +bL5b7FbZ97wA9h3NBdwYdhyTwwUtKPRl4zKL0bv8In/ZHz2XLT937mkEla71UdRmdJg
         qrJIaHhnVkLDJp3CRZdnIrWfAhd4YAislpr6LU1O2+FF5tQkUGgUtINj+V4cKJCbsZl6
         6yyzz5v06xc56BgMg8fgfgZoKlf8S/YH5uD6PJwdVeI9DFeOQO5hywLv+KMouaU/aiVA
         Xmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681718994; x=1684310994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eB6SW7Euj55s9d4nUZtZWO0Bk1+ooxqocEtVUxCmzck=;
        b=HAd2rEBwb3hf4hVjgXGTqdEeioCOWKQn2enDTUgRHkqti//xgxbJI7mRgXhPHxE6Tb
         dWwEuiGWqFEdjH87mOIgKZ60Xleo9CMyo3eEZ9X5HTaKSLokeR+F5E8CulLZPtLlo8PX
         S1MsYUZ8BiLYKOZyRRn9mGnOdspv8joPKcAWjo538L9ayAcL9lMwJHvqGUzavRUFaoOi
         z1OvnQZdShGTjssZV/H3nzRvsydSP0BvvNguiE6vuKodU6e3azUuKgEO3mDQqSLj8eeZ
         Mw9VYfTVWjOcfcq3YYEcNdxjNIWKKOX2GXcs8TI18DWa3e37q8lnKAH3sG1HYOllR4wY
         TWhw==
X-Gm-Message-State: AAQBX9ds13HXWuyTWLM03VD3beiG59WiK3VXHaxcODsINldvBTPJv2uD
        csdwxyevmbQWO4/x5yXnnS5PYA==
X-Google-Smtp-Source: AKy350anHPqQ10fQx3NsI3POV1UAZ5LfsHWMvHnmmjQhLRiJGKI4rAfJjP5JTqUHfoCRKRcH+xDebA==
X-Received: by 2002:a17:906:3ac7:b0:94a:5819:5a24 with SMTP id z7-20020a1709063ac700b0094a58195a24mr7430375ejd.18.1681718993749;
        Mon, 17 Apr 2023 01:09:53 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:b0ac:4d3b:966c:b33d])
        by smtp.gmail.com with ESMTPSA id y16-20020a1709064b1000b0094f7da9f1besm988179eju.61.2023.04.17.01.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 01:09:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/4] arm64: dts: qcom: sm8150: drop snps,dw-pcie fallback compatible
Date:   Mon, 17 Apr 2023 10:09:38 +0200
Message-Id: <20230417080939.28648-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230417080818.28398-1-krzysztof.kozlowski@linaro.org>
References: <20230417080818.28398-1-krzysztof.kozlowski@linaro.org>
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

Qualcomm PCI express root complex does not use snps,dw-pcie fallback:

  ['qcom,pcie-sm8150', 'snps,dw-pcie'] is too long

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Add Rb tag.
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 25085621ef49..a7f7bbfefa5b 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1823,7 +1823,7 @@ dma@10a2000 {
 		};
 
 		pcie0: pci@1c00000 {
-			compatible = "qcom,pcie-sm8150", "snps,dw-pcie";
+			compatible = "qcom,pcie-sm8150";
 			reg = <0 0x01c00000 0 0x3000>,
 			      <0 0x60000000 0 0xf1d>,
 			      <0 0x60000f20 0 0xa8>,
@@ -1918,7 +1918,7 @@ pcie0_lane: phy@1c06200 {
 		};
 
 		pcie1: pci@1c08000 {
-			compatible = "qcom,pcie-sm8150", "snps,dw-pcie";
+			compatible = "qcom,pcie-sm8150";
 			reg = <0 0x01c08000 0 0x3000>,
 			      <0 0x40000000 0 0xf1d>,
 			      <0 0x40000f20 0 0xa8>,
-- 
2.34.1

