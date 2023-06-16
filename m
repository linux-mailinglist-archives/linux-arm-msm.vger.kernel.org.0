Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF307338BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 21:02:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345793AbjFPTCp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 15:02:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343765AbjFPTCf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 15:02:35 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFE733AA8
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 12:02:32 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-986bfdfe8d4so95020266b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 12:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686942151; x=1689534151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtVmJfThsLGOq2FR9Klcoqr1zDVHMPZXhgbSUxfphZg=;
        b=S/6Mh1yYGWx/Ai7oR/8mEmMrxNWlcfgTLoEc5eT74N5x1ZdPQ1qKMP2PX3+k4bOoRs
         8emJTN9STrtywN26goj/xoXZrKEGREEOkXsJURLmXlM7mdTR9/zIFxzinEKNQ0YhdNWH
         NnGo8X3zvNokT2HSfeC5wtJWIZMqRDLDjSt6jbywNNWyHZkxa+F9oUdpiA6kO7t4uGgn
         5gKpPceicxT5QklD8CUDZCNBgiakXaPYkuJASjFj+XwrwWe3X9gjX1RYFWWsVoX0BPGZ
         bulPJx2nW2aBU+Yof1/9FcLQSflgSuU+evw2MEz1CPwpKIaP0nVDlj0jk2rLVrhTuKTC
         8Zuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686942151; x=1689534151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EtVmJfThsLGOq2FR9Klcoqr1zDVHMPZXhgbSUxfphZg=;
        b=jGdETKx2UluyRU7Yp54N9yu70wKGWhhbGI89fbmD23fcoo1fW3ALxzSWPMEPV2HHhg
         Ne+QFaaMLo0Ha+lcZS2PokEbhXXJmaB6P1GTSWXIlqkwfONVMi86jHotgZ8dtMVeP0vs
         vnzJjB1OSFr8oy7WGNYEISN+icB/OjBm85AfnJdjc9tsthP9ShjZ9lxQ3aa1vcBlHvZH
         F4X0bLTMhasuWBko5QKuwvPzYd+gAvN1PmC4q85FKGUS6rNjfglurwcyglQM600HzzAy
         KTuwpH7ts/Lt47bguM1F/xVQjugOyBoqIm+pk+UDoGziaP3CLGa4R8LzTXEci5rA5s+v
         HAIQ==
X-Gm-Message-State: AC+VfDzxnbK+G02rfcP3GiiW2Ri+4uhRJmFRKu0DSZ9wVRFWTiYcZXwa
        Tj5hr3tgyBJCpXc0w61CJ//8Lw==
X-Google-Smtp-Source: ACHHUZ63bEL/JfphPnBdpSpfGpWHJtzv3TFD66dm2C3fmgngy+E6UKwCoYAJ+uXYpd7rzQoVytrc2g==
X-Received: by 2002:a17:907:7ba5:b0:982:4b35:c0b6 with SMTP id ne37-20020a1709077ba500b009824b35c0b6mr2629255ejc.1.1686942151212;
        Fri, 16 Jun 2023 12:02:31 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id q2-20020a1709060e4200b00982362776cbsm5637880eji.118.2023.06.16.12.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 12:02:30 -0700 (PDT)
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
Subject: [PATCH 2/3] arm64: dts: qcom: sm8350-hdk: add uSD card
Date:   Fri, 16 Jun 2023 21:02:21 +0200
Message-Id: <20230616190222.2251186-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230616190222.2251186-1-krzysztof.kozlowski@linaro.org>
References: <20230616190222.2251186-1-krzysztof.kozlowski@linaro.org>
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

Add uSD card to HDK8350.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index de67438b3a97..997f892a0f3a 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -475,6 +475,18 @@ &qupv3_id_2 {
 	status = "okay";
 };
 
+&sdhc_2 {
+	cd-gpios = <&tlmm 92 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_default_state &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep_state &sdc2_card_det_n>;
+	vmmc-supply = <&vreg_l9c_2p96>;
+	vqmmc-supply = <&vreg_l6c_1p8>;
+	no-sdio;
+	no-mmc;
+	status = "okay";
+};
+
 &slpi {
 	status = "okay";
 	firmware-name = "qcom/sm8350/slpi.mbn";
@@ -733,6 +745,13 @@ wake-pins {
 			bias-pull-up;
 		};
 	};
+
+	sdc2_card_det_n: sd-card-det-n-state {
+		pins = "gpio92";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &uart2 {
-- 
2.34.1

