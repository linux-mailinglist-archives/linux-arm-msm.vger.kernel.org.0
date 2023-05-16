Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1DF704F4F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 15:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233448AbjEPNaZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 09:30:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232392AbjEPNaX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 09:30:23 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A27B22705
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 06:30:20 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-50bc4bc2880so21573484a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 06:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684243819; x=1686835819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1OcGSqk/DzAlyGZla680yYvSgvRKBujmsZ040c4Ko60=;
        b=W3dtwd2qeJogeV3HpSiBreUc25ST5e86KFo2+Ux1qmGjtmZbievC1u2/LmFSaTuZmd
         RG7nRskFzAqBD79LQt7qZ3uB3jC0jYLoDqnGqLcGrXN4Z4YoTnYGJMAlMcNlERI7MwaY
         J5M6D/zPz/ZQJKU3KgqSRvzeStwjx+BVkhiD52EBGgPgrZSNbk1zfhetoAhnzwuMEdKc
         8ptso/lkqpwSRzOjP3pjt2d48y6kDmkWmBnpb61Ik7nq4dlSBY8ddGhOCWn8p8cJmqHx
         5lkRVnkf2ODzI23juatkUVbdsv+HjUZ3Oaiw7j+EKEhW23dgK51IJKCm+A7L6tgII+j5
         K7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684243819; x=1686835819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1OcGSqk/DzAlyGZla680yYvSgvRKBujmsZ040c4Ko60=;
        b=Cmie0bihxW59yrGYPM0/EJiHbWGhtCbGMmQ71SF+jhRyiFWxfQIhIwvmqyoFPMhLCD
         ZK76l7ROvqZDGEr/QEc1ShNZEo3iYCemHZbR76E5zpq8NQwx/Hw7n1ZQtw24vv3xfRCO
         Uy+z9jdWUHjV8d9TxL4oCyTEVgQFVfiNJSmtUxI2saJWO79Jd1HqSGhQvuFHaIcGTpzq
         YjsNLcAPpE9Kon8aq6wHLqGDtP084FhQffm35rju+0FgPHaFq0/cy1nEruRPPd9clG+h
         MQ8u4mN9a3P9K3CroyySNCoo940dJKM60KUcBafZEhnPbXh+0Yi+vAx3nwiz2QalCooG
         46/A==
X-Gm-Message-State: AC+VfDyp1eKwjZylUfHTZ2Iff5Id0rghF2qPg8wMRTtwkDlejtfFGrmu
        KC1W8smBd7hnuuMGnxQ1ROZ8/Q==
X-Google-Smtp-Source: ACHHUZ75anCrFz5at1pEffdeVzFNgO/uUjV3kl3HsDgTwKQgZSFTxzefkZDqDbzHp/aEt+dSbVxbNw==
X-Received: by 2002:aa7:ce0a:0:b0:506:af22:1271 with SMTP id d10-20020aa7ce0a000000b00506af221271mr30055544edv.0.1684243819087;
        Tue, 16 May 2023 06:30:19 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id r23-20020aa7d157000000b0050bfed94702sm8273461edo.77.2023.05.16.06.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 06:30:18 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: qcom: sm8550-qrd: add PCIe0
Date:   Tue, 16 May 2023 15:30:10 +0200
Message-Id: <20230516133011.108093-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add PCIe0 nodes used with WCN7851 device.  The PCIe1 is not connected,
thus skip pcie_1_phy_aux_clk input clock to GCC.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index ccc58e6b45bd..e7a2bc5d788b 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -385,6 +385,38 @@ vreg_l3g_1p2: ldo3 {
 	};
 };
 
+&gcc {
+	clocks = <&bi_tcxo_div2>, <&sleep_clk>,
+		 <&pcie0_phy>,
+		 <&pcie1_phy>,
+		 <0>,
+		 <&ufs_mem_phy 0>,
+		 <&ufs_mem_phy 1>,
+		 <&ufs_mem_phy 2>,
+		 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
+};
+
+&pcie_1_phy_aux_clk {
+	status = "disabled";
+};
+
+&pcie0 {
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l1e_0p88>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
-- 
2.34.1

