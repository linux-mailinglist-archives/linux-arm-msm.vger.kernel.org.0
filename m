Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB57270B054
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 22:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbjEUUip (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 16:38:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231161AbjEUUin (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 16:38:43 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2825E6
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 13:38:41 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f3af4295ddso2732031e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 13:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684701521; x=1687293521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Kd0Grqe79UZr596KesxYlHc6g9tfq6ax8GIQassp/A=;
        b=rxwteexP+1nh6CjONIZr5CpVVFrMfvmp1jO6T8LthurqFa/1msDZ5g/8CDZHX9ysh2
         zsJ0Exm/Pe6SyyKSjSrdJZVVitQCfZGoboVC/9inP693w47iZAYjJXFUimeF/t1F3Wlj
         W0S+nbNPn2IJv28N4YcGKdZbr3Z6cHbs9s6EZvy9nBgXTXnVrk4+dw01cpQIW7rkSETJ
         ZxufG8BpzKu0VCjwQ4FRgnJHYuHAOPHbch58CiwvTpARj2C1xsQNz+GUMkLQ0DtHbKua
         kMcX0XciDaVoXxq/V82P1VB8ocJ3A0qbOIXbKMLS6YQZcxccycNwB9YghASuUIq7b/qX
         qg7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684701521; x=1687293521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Kd0Grqe79UZr596KesxYlHc6g9tfq6ax8GIQassp/A=;
        b=HZM3LdI/n7dA8g7MTyLoK2ris/k9UvpTE2nvsjVCcvK/ni7U8xN2PgjxvLu2wuY7uk
         pazp3oiEHz3c5WkKhg4QzvRImy9/QGaDLqNa0kjkPN80SXDa+RK/qbVVQU2+xd/+EKGi
         VIEkRj3aQRFT5p4Yevwyj1T5wVSHFZqiECEV/3D2Gsp6S4f0wH9OPfMjvgx5p9xtPiuM
         zfNciBJ731Uq692D8Sh7miBp0W4jjeuT0SPKUFfeMMKZZcwkhbUZ92bonjhmDZAuW8dJ
         TL45VjXZJ7nEDmOh6Rpxl+FK3e3L2MX6j+2osqm5ZiIvZt8UpC5XnXspRV+KleHS6GHC
         kKxA==
X-Gm-Message-State: AC+VfDyYKJgXPRbGh5J8sOAnHwTf2QFGY6v+yjBpZj+MswBONsyL2uIu
        sV7RnV34ecGCZed8h4hsbZxFIQ==
X-Google-Smtp-Source: ACHHUZ4XLF3qbBUiVvvYU3ykQWv79zMtchpy1NLZ2gOLLFNpRC22jZoi5ayM3bowdGVsfAq8TwhW8Q==
X-Received: by 2002:ac2:5581:0:b0:4d8:8ad1:a05f with SMTP id v1-20020ac25581000000b004d88ad1a05fmr2820050lfg.48.1684701521550;
        Sun, 21 May 2023 13:38:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a15-20020a056512020f00b004f3886a63d1sm718894lfo.298.2023.05.21.13.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 13:38:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 08/11] arm64: dts: qcom: sm8150: switch UFS QMP PHY to new style of bindings
Date:   Sun, 21 May 2023 23:38:31 +0300
Message-Id: <20230521203834.22566-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521203834.22566-1-dmitry.baryshkov@linaro.org>
References: <20230521203834.22566-1-dmitry.baryshkov@linaro.org>
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

Change the UFS QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index e2e210e10475..98fd356e87e4 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2019,7 +2019,7 @@ ufs_mem_hc: ufshc@1d84000 {
 			      <0 0x01d90000 0 0x8000>;
 			reg-names = "std", "ice";
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
+			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			#reset-cells = <1>;
@@ -2064,10 +2064,8 @@ ufs_mem_hc: ufshc@1d84000 {
 
 		ufs_mem_phy: phy@1d87000 {
 			compatible = "qcom,sm8150-qmp-ufs-phy";
-			reg = <0 0x01d87000 0 0x1c0>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01d87000 0 0x1000>;
+
 			clock-names = "ref",
 				      "ref_aux";
 			clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
@@ -2077,16 +2075,10 @@ ufs_mem_phy: phy@1d87000 {
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
-			status = "disabled";
 
-			ufs_mem_phy_lanes: phy@1d87400 {
-				reg = <0 0x01d87400 0 0x16c>,
-				      <0 0x01d87600 0 0x200>,
-				      <0 0x01d87c00 0 0x200>,
-				      <0 0x01d87800 0 0x16c>,
-				      <0 0x01d87a00 0 0x200>;
-				#phy-cells = <0>;
-			};
+			#phy-cells = <0>;
+
+			status = "disabled";
 		};
 
 		tcsr_mutex: hwlock@1f40000 {
-- 
2.39.2

