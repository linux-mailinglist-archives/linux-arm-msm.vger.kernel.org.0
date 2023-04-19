Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11E756E8370
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Apr 2023 23:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232282AbjDSVUF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 17:20:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232456AbjDSVTr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 17:19:47 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C2DE83F2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 14:19:24 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id vc20so1584898ejc.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 14:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681939164; x=1684531164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KW3N7y2mH7tdXeuZ/kIZmdwbObDrn11+y8J9xSdzllM=;
        b=ac0VZV/XkkYkhhdeDLb7ecUkdh0YqRJZyMrv+a48jj2dtC61L4tA1RAfe+Z4YRFv33
         lgmKHKnGQSzwjByOIMY7RCftgyIwJJ6ExchsIJxRFGkDDmDLgQi6RPOtVFaK/es3cZVV
         fjN4sJ1JFFaA5gomq0s45vgLQLXy3EVB5rsa676mDSC8AFKYEzjtJj+rJpGgfJGDP7IX
         +B21E/0xHqzm8FZPURoVmB4mrRY7BuBEDpsZlg+8rBjpTjK+ilhEeeI66IFyXJLvvLvf
         G5/o4LOfCZVRU0FCAvUkGz04mVuGE1+d0OJxtc2MrFto27zmp76HMgFfXeIGFNyF6uK0
         q6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681939164; x=1684531164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KW3N7y2mH7tdXeuZ/kIZmdwbObDrn11+y8J9xSdzllM=;
        b=RrYCxBUP/NxO5Y4qx/UW2Hdc1fwLFGxvfbti2hhg4enNQxgS2KFP6QJ8kicKxXdqvg
         z5qUQeyoRpNJZwFk8rQ6YEohdePLFLaDaABD1SUGOwIpg+omNA/lkWRi8lVCBFKkkqAq
         ALUzftiklzv8rTh4qqmBRmfKol945Pvjpl6Lv0T8cN4pk/bMCvqZIjw39D52o3oPpqQc
         A52kok9JXzttrGZCwiZcwSqH5AZl5qL0RQ8gVUB2kONAVDHGay2HQuMAyb+KMnj0hMcD
         l5Le/Umw2fImwHR3QzifulWawv1c2Rf2RG1jklCop1+7Zhdqs5XHRmV0B2J94KdhIWUV
         XFaA==
X-Gm-Message-State: AAQBX9c/D6mUlELUjkFZbWMhpgnRKwZUb4dXEAW91euvHFMim4+s3pXi
        BDIOqynJhfrnPAUhTiSoS58obA==
X-Google-Smtp-Source: AKy350ZyesocccCe9v+hN3fGURoHdWt4yO3+2sNTeNfvV7YJNULRBXevGRscrRPzKdqF2kuz81oXeA==
X-Received: by 2002:a17:907:3e02:b0:94f:35ea:d773 with SMTP id hp2-20020a1709073e0200b0094f35ead773mr18298595ejc.75.1681939164055;
        Wed, 19 Apr 2023 14:19:24 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:976c:1d6c:6ed0:8935])
        by smtp.gmail.com with ESMTPSA id qc27-20020a170906d8bb00b0094f364b36acsm6208476ejb.165.2023.04.19.14.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 14:19:23 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT RFC PATCH] arm64: dts: qcom: sdm630-nile: correct duplicated reserved memory node
Date:   Wed, 19 Apr 2023 23:19:21 +0200
Message-Id: <20230419211921.79871-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SoC DTSI already comes with 85800000 reserved memory node, so assume the
author wanted to update its length.  This fixes dtbs W=1 warning:

  Warning (unique_unit_address_if_enabled): /reserved-memory/qhee-code@85800000: duplicate unit-address (also used in node /reserved-memory/reserved@85800000)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

What was the original code intention?
---
 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
index 2ca713a3902a..3033723fc6ff 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
@@ -138,11 +138,6 @@ debug@ffb00000 {
 			no-map;
 		};
 
-		reserved@85800000 {
-			reg = <0x00 0x85800000 0x00 0x3700000>;
-			no-map;
-		};
-
 		cont_splash_mem: splash@9d400000 {
 			reg = <0 0x9d400000 0 (1920 * 1080 * 4)>;
 			no-map;
@@ -256,6 +251,10 @@ &pon_resin {
 	linux,code = <KEY_VOLUMEUP>;
 };
 
+&qhee_code {
+	reg = <0x00 0x85800000 0x00 0x3700000>;
+};
+
 &qusb2phy0 {
 	status = "okay";
 
-- 
2.34.1

