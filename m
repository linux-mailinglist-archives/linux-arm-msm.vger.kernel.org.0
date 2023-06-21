Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7595573872B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jun 2023 16:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231624AbjFUOgs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jun 2023 10:36:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231731AbjFUOgj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jun 2023 10:36:39 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 891E51BD0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 07:36:32 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f8f3786f20so70277015e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jun 2023 07:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687358191; x=1689950191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q267PzQvbc4qiFwzCDZZB6FJw0yi1HjyAE+qzfNhuaE=;
        b=rctvtICKF4lpjMQ4GFaTKRkNEYiwDdBGk+QsCrkbDIvg2uKEXYwGN3Wa0p+Vkp04Qu
         Mc+CJdKQoGg2fnW3O2noq9sVKVt1r2fp4uGqKX8clqnunM31HC2FP78fjWw16TzOIJze
         yG6G9rpvpMV9bVY1CxNBf0JbNnSU0ACalWYnWbsOh7tSZ59syXRaQMYxm8kaLiZJ4MSF
         qj3FILCAHpak5gHHfuP5rLYG1uJK3fBWnr9xLRiyalNDbRc6nYwRPLLMImk0Ijf+iTCS
         K3StGdsijCQgTHT9Tm0nDauIz4fR8T0CZr4wVVEaCfCkc1CnkrnQHCoX6wlYLQLEYsfW
         65Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687358191; x=1689950191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q267PzQvbc4qiFwzCDZZB6FJw0yi1HjyAE+qzfNhuaE=;
        b=dt5irvWhrFsBm44h7x+eUkZ7JSoRDePhnvL/yV18MYoOXd+7/8q2s6SZfXtofSzMxN
         ti2QWjQrGAsEACjRP23jcT/9Owy7f4eb5NbE+tV9O5qXIbnlK3lOTw2KEoyfG7V8JKau
         ScZv007vRBX2Dsi2wPwG1NdWjNAGoS17PrmWAccS9+KpXr9Ju2zzPEvJV74h+ZYZQkrB
         kJujf6V9j3G7owREyP8Xxf57hTCnwxqIexX4byrm/anE4GOdAPkejlzOv7oPhrg+zm88
         ez2OBOYLvxIezcHzuVurpaxEgg0U4E48lTtlqPnyEmPbF4xYj53mLCMEBwkALLUD7wVU
         DXaw==
X-Gm-Message-State: AC+VfDw7+w4ykc5ruo4aj5K6zuWJTDJt5U2lyUtkeMlK7EdffQAR4wwX
        5HNerjfyp1YKzFF2Qq+QPrABKQ==
X-Google-Smtp-Source: ACHHUZ5ZhzIpeWIh4DikrGJcv3Fx3/cxAiObvcEZly48e8AIamOEO6BA+6S4z/LW5iad5YqDZNOJlw==
X-Received: by 2002:a05:600c:281:b0:3f9:960:2bb7 with SMTP id 1-20020a05600c028100b003f909602bb7mr11643793wmk.23.1687358190927;
        Wed, 21 Jun 2023 07:36:30 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id y9-20020adfdf09000000b0031122bd3c82sm4642396wrl.17.2023.06.21.07.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 07:36:30 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sm8350: fix BAM DMA crash and reboot
Date:   Wed, 21 Jun 2023 16:36:27 +0200
Message-Id: <20230621143627.189134-1-krzysztof.kozlowski@linaro.org>
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

SM8350 HDK and MTP boards were silently dying and rebooting during BAM
DMA probe:

  [    1.574304] vreg_bob: Setting 3008000-3960000uV
  [    1.576918] bam-dFormat: Log Type - Time(microsec) - Message -
  Optional Info
  Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
  S - QC_IMAGE_VERSION_STRING=BOOT.MXF.1.0-00637.1-LAHAINA-1
  S - IMAGE_VARIANT_STRING=SocLahainaLAA
  S - OEM_IMAGE_VERSION_STRING=crm-ubuntu77
  S - Boot Interface: UFS

It seems that BAM DMA is locally controller (not by firmware) and
requires proper initialization by the driver prior to use, at least on
HDK8350 and MTP8350, but probably on all boards.

Fixes: f1040a7fe8f0 ("arm64: dts: qcom: sm8350: Add Crypto Engine support")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 88ef478cb5cc..b382ce66387e 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -1741,7 +1741,6 @@ cryptobam: dma-controller@1dc4000 {
 			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
 			#dma-cells = <1>;
 			qcom,ee = <0>;
-			qcom,controlled-remotely;
 			iommus = <&apps_smmu 0x594 0x0011>,
 				 <&apps_smmu 0x596 0x0011>;
 		};
-- 
2.34.1

