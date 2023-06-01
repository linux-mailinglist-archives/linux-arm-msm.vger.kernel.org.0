Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35D3B719B6D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 14:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231276AbjFAMBT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 08:01:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233203AbjFAMBQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 08:01:16 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07E26137
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 05:00:47 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-973f78329e3so101845066b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 05:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685620846; x=1688212846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCPA+P2UAidfJpGnMXGQrvaS8Hqrjx2vCCHOl5IY6/4=;
        b=PCsAMOQBdXVkB7zz6bVIm+iW/G7cSOgQ6Cs2jRb5J/SrRXwHrUNn8Yc9Y7/lVfvXw3
         W0rQQsG6J8vnnKCaekuPjQ58x9ojFbNo5HKsRlWpUl4QNx2dTMMksEe85Q2pmvt531HL
         b65kqVp8gVEOw1iZq72dA5cwuqJ56dX8TvQjyARgcGVIDS31nBWMDRlwhwnuBvxlJgec
         mxH2+1YAzVww48B2/sMZecwq3I1Ql+Zk7q0GMj9Gme2V+ARnhysU+tCtHB5C8Npot2Dc
         hYIHOQeNEfOrT28JBafpRcZNizwUREvokxdWrK8f9OyVppGsndnmXyDL5zBL+VN5xcm7
         NQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685620846; x=1688212846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCPA+P2UAidfJpGnMXGQrvaS8Hqrjx2vCCHOl5IY6/4=;
        b=D79PSdxTHSae1dWNWi0Z1x57J6N6gupOgrqJ7JJb7YU4z91N5wiTywql3muMA4PuvS
         9DPYYKV/Hf/VQ5srplxnqF7w1Hi4eiQlVeoYaG9LSpEENM/yeMc75hBfzNh3TUhW84ne
         +rWVcmK3pl8GFPz1pngkz1E1m5e0P6VWmmcaqZnlOBYgUS0bI6c9sxZ0nMd+bD9DMBv+
         VmCD7QM7YsG551w0/ZKLU7yxeYWpGuWUiafba3WWHkkU72+yHMbuEl962lwQl9cu0a4Q
         36oQ+HaOwFPgRx26Lrr+vsA55zuRcHNAI+tzInKx9I0JMRbsuu207SeBwhwIU7CXVnrW
         Jo9Q==
X-Gm-Message-State: AC+VfDy4b7JI7Gtp/m1IWEF+AQNFhZI+7Zy/d819DOiYSW0kc+CuEQr4
        7FU6ufk3EE9cLZJ4ZaIUJZ8GsA==
X-Google-Smtp-Source: ACHHUZ7RNC0+pCkbpUB70+beg3SCzM5xi5QoEIVK5qfnFQxk5yNuerazlLGFtX9868CeVWyIq9Y1jg==
X-Received: by 2002:a17:907:1c02:b0:96f:bc31:5e0b with SMTP id nc2-20020a1709071c0200b0096fbc315e0bmr9250250ejc.64.1685620846173;
        Thu, 01 Jun 2023 05:00:46 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id v24-20020a170906b01800b0096f6e2f4d9esm10359923ejy.83.2023.06.01.05.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 05:00:45 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/4] arm64: dts: qcom: sm8250: Add missing interconnect paths to USB HCs
Date:   Thu,  1 Jun 2023 15:00:27 +0300
Message-Id: <20230601120029.38859-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230601120029.38859-1-abel.vesa@linaro.org>
References: <20230601120029.38859-1-abel.vesa@linaro.org>
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

The USB HCs nodes are missing the interconnect paths, so add them.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index e5c60a6e4074..eefd3dcbb2e1 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3750,6 +3750,10 @@ usb_1: usb@a6f8800 {
 
 			resets = <&gcc GCC_USB30_PRIM_BCR>;
 
+			interconnects = <&aggre1_noc MASTER_USB3 0 &mc_virt SLAVE_EBI_CH0 0>,
+					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_USB3 0>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
 			usb_1_dwc3: usb@a600000 {
 				compatible = "snps,dwc3";
 				reg = <0 0x0a600000 0 0xcd00>;
@@ -3810,6 +3814,10 @@ usb_2: usb@a8f8800 {
 
 			resets = <&gcc GCC_USB30_SEC_BCR>;
 
+			interconnects = <&aggre1_noc MASTER_USB3_1 0 &mc_virt SLAVE_EBI_CH0 0>,
+					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_USB3_1 0>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
 			usb_2_dwc3: usb@a800000 {
 				compatible = "snps,dwc3";
 				reg = <0 0x0a800000 0 0xcd00>;
-- 
2.34.1

