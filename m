Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16DCC64BCCA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 20:10:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236718AbiLMTKu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 14:10:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236696AbiLMTKp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 14:10:45 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FE8625C44
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 11:10:42 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id l8so4333661ljh.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 11:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BnF8qsfYu8s9/MwBsflSUh/lykn7aUx7PCtt6alz7i4=;
        b=oXSEFVPCgKG1MaGfvlray6dSRizFoy6QMqOB6eoMD6MFHvwPDgH44HxgWbS52QexhZ
         DrA5///74cOLhQKFJ9iBSDE2qwcTzR6tEwN7IEvjHJeqgtjYxNSpcyiGO9kadp1X2xau
         qA90u0o5vpz9kiqjk6RpGQKZmF2fJCqdHW45zF7TY3XE/hEeuIUzjk4wOhASwPsR6WmC
         PHdA576+10dfmnbWobtqeg7AbP5VM/pax/kjf95xjEEHm/Akym8gwxrQB82KCSIFrE1C
         jx5pFmVqaaTDf281CXZH71LXTvHUAfN3Rram9dxFrCY7/85BmVwBOtZBI3sMpX7ICo8C
         KAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BnF8qsfYu8s9/MwBsflSUh/lykn7aUx7PCtt6alz7i4=;
        b=5V4yGZdNHyUBhCT9fsNypNEkotIOn08pIYefUVJ5hUxR2rR2tz3LAqJnvrWgemsNCJ
         Vo/COFxQdIUOeTDfVr8gxB/czT4CH9F1Kn6Q5X7HTzfRQ3Qjr3lJbAQ6aDipR9pAmjaO
         9qa/1O8rjGhI6C7thDfUOFX8pJGfIEaRW0ffPT6LhTqKnL/AB4/L61AOF0A51LS/PVCp
         5NDHE08ivu9rk8ckDBNEbSujHHpf5DDKwjdrMjJwN+hwH3kTNt2nxWPzXWvJnPLsh76C
         rm1VH0YzPxghYcsMkz4IJJvX0fIuCXAhcUcvr3cJ1Lb52e2uj7HhMK7JtF9o0+WmWyvq
         4HBA==
X-Gm-Message-State: ANoB5ploaaBwSgbEwXioZNGzmTisoYkXH69X59s8NnvqEDy4LS6o372P
        5UvMDj1gkpxCLatmqBgRk3MPc90OU4v6HxjM
X-Google-Smtp-Source: AA0mqf6BliQz4MMlcrOfkXK2e/fGzGDu3+nV2urRz8DG+MRsH7YWEPW2dSLnDapAMj39g8PmVCA9Nw==
X-Received: by 2002:a2e:a551:0:b0:26f:eb10:1a2b with SMTP id e17-20020a2ea551000000b0026feb101a2bmr6934373ljn.23.1670958640460;
        Tue, 13 Dec 2022 11:10:40 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id w28-20020a05651c119c00b0026dfbdfc1ddsm372023ljo.11.2022.12.13.11.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 11:10:39 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org, Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] arm64: dts: qcom: sm8450: add spmi node
Date:   Tue, 13 Dec 2022 20:10:30 +0100
Message-Id: <20221213191036.611241-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
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

From: Vinod Koul <vkoul@kernel.org>

Add the spmi bus as found in the SM8450 SoC

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
[Konrad: 0x0 -> 0, move #cells down, make reg-names a vertical list]
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
I took over this patch from Vinod, it was submitted long long ago:
https://lore.kernel.org/lkml/20211209103505.197453-1-vkoul@kernel.org/
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 570475040d95..b9b59c5223eb 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2715,6 +2715,28 @@ aoss_qmp: power-controller@c300000 {
 			#clock-cells = <0>;
 		};
 
+		spmi_bus: spmi@c42d000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0 0x0c400000 0 0x00003000>,
+			      <0 0x0c500000 0 0x00400000>,
+			      <0 0x0c440000 0 0x00080000>,
+			      <0 0x0c4c0000 0 0x00010000>,
+			      <0 0x0c42d000 0 0x00010000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr",
+				    "intr",
+				    "cnfg";
+			interrupt-names = "periph_irq";
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		ipcc: mailbox@ed18000 {
 			compatible = "qcom,sm8450-ipcc", "qcom,ipcc";
 			reg = <0 0x0ed18000 0 0x1000>;
-- 
2.39.0

