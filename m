Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3E076AFF9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Aug 2023 11:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231862AbjHAJxQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Aug 2023 05:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233709AbjHAJxG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Aug 2023 05:53:06 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 846B0BE
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Aug 2023 02:53:04 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fbc1218262so58376985e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Aug 2023 02:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690883583; x=1691488383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9h+KW3ibAIf8KPX3KGs5bvs7zvqsxoWDz8O/Xwhkhy8=;
        b=v47ilscGmZpxF+Z12lrKGfwuBtWsmA4LSwGqNHEAgo//c8xAxKj3kTBVbkqhSzDPaM
         iN1wgbkmy2vGofm8sPjh6bC3665MZCtI2wyCeMPni8FGSLODFePMAbS7JAxbdnu8u/X1
         UkxtAj6sWp0BIVoNLqQTVuRRfct0u34y4lnzUj+48O7tDyidckvO5sqdO61ZTZGtf7ZB
         iGSgx5gqiDr7onHpyyg6NeHE9c6KI2Ocg3oNmorNE53MRqtqKrQlQ918JtMTG8n2R9OG
         gre4gt+Z4fRCQL20AgootTmcaBji/rDKkgyVZRhIgXEPG9n3X4rDpzHg4HtHSv74Lepm
         9NUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690883583; x=1691488383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9h+KW3ibAIf8KPX3KGs5bvs7zvqsxoWDz8O/Xwhkhy8=;
        b=k/jDiyGj0siGK8MEg4W+EWbZqjIfE+qXQSLQDGRTl7/oiXUMRZ4AgubeJ6z2+rS7v3
         S5bAA+CvuB3TGUG9wVQSv2HVNcxa1hShpqDc1NFSnWWoI8feKWO51uDxPrx2UvXVP6m0
         LUv5Zm3XT3rsYAffzOY26Ph20C+hgktYAlPYredyMXUoo7Sqd43uxUxa+I8qSh67T6Ha
         g8qbIk8D5DuNGFZAedmUAMalVj0hH3sZW3MK4/DJ/XjQC5aJCleQIS4tLRgLNMeXhwEZ
         fglfhUraPMZtiIIrTQPaLKtkLeg9PnzltcfUyk3pvtcZoqTN5gYx8wIr6M4KeZbxHqPC
         Y18g==
X-Gm-Message-State: ABy/qLZqHiGO/KtHiFDxDcfRIAI9IIdQyWforhcBwmUIUB3PGimAwFWa
        U+bkVIAnp3SfONTe5o/VzEj8Mw==
X-Google-Smtp-Source: APBJJlHjXzXhv2pp/vvPsqmxwd1ov8bSEbdvjEvrOUpBtzBS2jbzXMK6+ZObuiHDLXpCN5LKoDDc1A==
X-Received: by 2002:a7b:c8d2:0:b0:3fe:90f:8496 with SMTP id f18-20020a7bc8d2000000b003fe090f8496mr2058975wml.1.1690883582971;
        Tue, 01 Aug 2023 02:53:02 -0700 (PDT)
Received: from hackbox.lan ([86.123.96.80])
        by smtp.gmail.com with ESMTPSA id 3-20020a05600c234300b003fc16ee2864sm13737640wmq.48.2023.08.01.02.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 02:53:02 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: qcom: sm8550-mtp: Add missing supply for L1B regulator
Date:   Tue,  1 Aug 2023 12:52:46 +0300
Message-Id: <20230801095246.2884770-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Even though currently there is no consumer for L1B, add the supply
for it anyway.

Fixes: 71342fb91eae ("arm64: dts: qcom: Add base SM8550 MTP dts")
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 00c7e1704a8c..0127c6c285b7 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -187,6 +187,7 @@ regulators-0 {
 
 		vdd-bob1-supply = <&vph_pwr>;
 		vdd-bob2-supply = <&vph_pwr>;
+		vdd-l1-l4-l10-supply = <&vreg_s6g_1p8>;
 		vdd-l2-l13-l14-supply = <&vreg_bob1>;
 		vdd-l3-supply = <&vreg_s4g_1p3>;
 		vdd-l5-l16-supply = <&vreg_bob1>;
-- 
2.34.1

