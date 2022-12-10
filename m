Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8898F648F86
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Dec 2022 16:42:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbiLJPmU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Dec 2022 10:42:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbiLJPmU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Dec 2022 10:42:20 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3F2311A01
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 07:42:18 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id t17so18149818eju.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 07:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xcUtDi9xX+2BTKnC7Sf+lM+wRU4nUSjkTSCI2YSY0rg=;
        b=WWkqomR6xR49XzOe1VEN1psb5CEuEyFgREJ5H3PSsTmfhWj4BqXuPxIUT3Hp45knu+
         x1asaC3eObLYUjr6jF20L/pYLVLQcnFCajMZxJWnjFvD8S+8lblz+vU5phsIEsSsH3z7
         WORBtnsxUoKjUP2yjeGWWT7+rL3P9hhw2X91g6iYImw1dGtxaOvcBO/NmSs95Xq6s40J
         duSwJ+jzlJTZFLG4AjKD51NKAJin9ceiNiKRHjpKFhky2EcWR+xofkoqLlgaN9XUYo+a
         9KQzsUkD7LsPhXiyyv9rSU5GRquWDvT+Y2wWr3jR2rubyjyKuJxK9zmU2KZXuXhj1kEq
         IJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xcUtDi9xX+2BTKnC7Sf+lM+wRU4nUSjkTSCI2YSY0rg=;
        b=V729nm3b9I/ACsqM97pkO1E9bquQtaxGDK4YbGqI4pbc76Id+zHAQTKbs525dDAT2x
         SJG6pVprQ9hnGC/m1oS6FpDFnp/lgXvXxQM6OvquAs67kM7G+RjTNnq6Dz8AK1jHVqE4
         /sgnVeiPOKUoFzG2+0mymQPRJX9xeY0/cOeVlU92hHuiKKVh71CxJ9nYRxthvzgH5agS
         qzn4KhWIVfBJb16Hj3Jl56gPJN/9y5sMAQsb/AJslaSoNIsfLvIGWHiAFFT6hsxoYWbm
         hWto9uayjYvoQ7YNPg1iwB7NDd2kqhVbKoaBkuiFKTBmcQkJUMSfLhcTmYv/c9reCBdO
         FIUg==
X-Gm-Message-State: ANoB5pka22HDpS1Z5kzokMAEKNV7QqaVCl7pRHU6uiUqfLXNzZefTSAm
        b6qKw5blFbj0akgCvBaNK79jCff1F8v+5mjZ
X-Google-Smtp-Source: AA0mqf6Yz5etOv2UekvIlw2wdBWcKn7Xlu5pxEAaxpUWlF3kMGtCvQbLq2qqAkvRrwDDeeOK2jLw7A==
X-Received: by 2002:ac2:5594:0:b0:4a4:68b7:f889 with SMTP id v20-20020ac25594000000b004a468b7f889mr4086460lfg.45.1670682330585;
        Sat, 10 Dec 2022 06:25:30 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id c26-20020ac25f7a000000b004acb2adfa1fsm739912lfc.307.2022.12.10.06.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Dec 2022 06:25:30 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: qcom: sm8150-kumano: Add NXP PN553 NFC
Date:   Sat, 10 Dec 2022 15:25:24 +0100
Message-Id: <20221210142525.16974-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221210142525.16974-1-konrad.dybcio@linaro.org>
References: <20221210142525.16974-1-konrad.dybcio@linaro.org>
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

Add a node for NXP PN553 NFC (or PN557, unclear data), using the
nxp-nci driver.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi     | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
index 2352dff213fc..9d667bb6f25b 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
@@ -428,8 +428,18 @@ &i2c4 {
 
 	/* Qcom SMB1355 @ c */
 	/* Qcom SMB1390 @ 10 */
-	/* NXP PN553 NFC @ 28 */
 	/* Qcom FSA4480 USB-C audio switch @ 43 */
+
+	nfc@28 {
+		compatible = "nxp,nxp-nci-i2c";
+		reg = <0x28>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <47 IRQ_TYPE_EDGE_RISING>;
+
+		enable-gpios = <&tlmm 41 GPIO_ACTIVE_HIGH>;
+		firmware-gpios = <&tlmm 48 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &i2c7 {
-- 
2.38.1

