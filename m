Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A444E651FCA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Dec 2022 12:36:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232093AbiLTLg2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Dec 2022 06:36:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231371AbiLTLg2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Dec 2022 06:36:28 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DC4C2AC6
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 03:36:27 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id m4so11986279pls.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 03:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=huPxZPVrtYAVsJ7rw0Hki2j64FcdxEjWj9SNeXSzqOo=;
        b=ryhiP/QKYwum0vMOPDx3DBCfrT0z+eenok3UsR4qSLWNXs2yVHPv9ZBrMqlxN3NQx5
         UVGtqXMqAJdbYMXRZV8TtkvCgO2nPnJR0nrG073Gl9hk1vXDHOYAVloKOf7xZfWSFTKJ
         LlxIO8ruht2HspcqOJ8C/WAeZzK4oZ3TYmthan6NlhXwfc079Skw1ZgUa/9DxEfY8l0S
         LN3kfCMB7V2Y0/4CDXtlkIYCFpRoFZGt+5BfkMkzh9IT+UceoY1vDEr30tntSo0PEdmj
         mwqu6mw77z6fWppCX6KALWptNAn+Mkpx4iwPAiImORvGcyHZSxEqQaVOIIdrCS8LyiQL
         go9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=huPxZPVrtYAVsJ7rw0Hki2j64FcdxEjWj9SNeXSzqOo=;
        b=rvihCp2bWMMgyooN79xf4OzZb72vBD+FXBnl8QOBnhZJUGRL64AD5Z6SlMKs3JWUO9
         hvG0ftGqleWNSaCia70uYyoEvI3B8JtOnpelGLagpeHyKTud/VR+acNdFBv9pqi9eOBZ
         HKo8gKWX69mPivNPFAi6sjjJqC913QuDxR5V4/pDYYU4m4q9ibGNABeqYemgbi12MHJD
         tYJLjoUgLPGpJj06wKrYviVMgUEC6WzciAnW8cDt5JeKf28VHRXy1sN6ijRO0KhxMyKm
         2j4hJ3UN+lHBQDU8wtPgZCxUMKbqJJp8w2pLd4o59VQdlANs9LQOxuyxjCuUDbT6LPYp
         0UHA==
X-Gm-Message-State: AFqh2krA6CY0tRq6Q7I+3RWo6uviEHqaodAGtLgXTEqpGrcD3tToz0a5
        LrZoQyHDP4ynsuvgEBrLGdcasLXsQj8xG3+X2nk=
X-Google-Smtp-Source: AMrXdXtxZPoLn10Q2MIhLkM9EuiVTQt+xbat4vnQj41VAHzNDpfGIt9VoZAmewDpBacNIKvwoWTqwA==
X-Received: by 2002:a05:6a21:e30d:b0:af:dbe9:4466 with SMTP id cb13-20020a056a21e30d00b000afdbe94466mr21194232pzc.31.1671536185989;
        Tue, 20 Dec 2022 03:36:25 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c5f:178a:c141:ef5d:9a2d:26ec])
        by smtp.gmail.com with ESMTPSA id q20-20020a631f54000000b00476c2180dbcsm7903139pgm.29.2022.12.20.03.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 03:36:25 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     devicetree@vger.kernel.org, agross@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski@linaro.org, konrad.dybcio@linaro.org,
        andersson@kernel.org
Subject: [PATCH] arm64: dts: qcom: sm6115: Move SDHC node(s)'s 'pinctrl' properties to dts
Date:   Tue, 20 Dec 2022 17:06:16 +0530
Message-Id: <20221220113616.1556097-1-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
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

Normally the 'pinctrl' properties of a SDHC controller and the
chip detect pin settings are dependent on the type of the slots
(for e.g uSD card slot), regulators and GPIO(s) available on the
board(s).

So, move the same from the sm6115 dtsi file to the respective
board file(s).

Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 .../boot/dts/qcom/sm4250-oneplus-billie2.dts  | 10 +++++++++
 arch/arm64/boot/dts/qcom/sm6115.dtsi          | 22 -------------------
 2 files changed, 10 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts b/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
index a3f1c7c41fd73..329eb496bbc5f 100644
--- a/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
+++ b/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dts
@@ -202,12 +202,22 @@ &sdhc_2 {
 	vqmmc-supply = <&vreg_l5a>;
 
 	cd-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_state_on &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_state_off &sdc2_card_det_n>;
 
 	status = "okay";
 };
 
 &tlmm {
 	gpio-reserved-ranges = <14 4>;
+
+	sdc2_card_det_n: sd-card-det-n-state {
+		pins = "gpio88";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &ufs_mem_hc {
diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 572bf04adf906..6be763d39870d 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -518,13 +518,6 @@ data-pins {
 					bias-pull-up;
 					drive-strength = <10>;
 				};
-
-				sd-cd-pins {
-					pins = "gpio88";
-					function = "gpio";
-					bias-pull-up;
-					drive-strength = <2>;
-				};
 			};
 
 			sdc2_state_off: sdc2-off-state {
@@ -545,13 +538,6 @@ data-pins {
 					bias-pull-up;
 					drive-strength = <2>;
 				};
-
-				sd-cd-pins {
-					pins = "gpio88";
-					function = "gpio";
-					bias-disable;
-					drive-strength = <2>;
-				};
 			};
 		};
 
@@ -652,10 +638,6 @@ sdhc_1: mmc@4744000 {
 				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
 			clock-names = "iface", "core", "xo", "ice";
 
-			pinctrl-0 = <&sdc1_state_on>;
-			pinctrl-1 = <&sdc1_state_off>;
-			pinctrl-names = "default", "sleep";
-
 			bus-width = <8>;
 			status = "disabled";
 		};
@@ -672,10 +654,6 @@ sdhc_2: mmc@4784000 {
 			clocks = <&gcc GCC_SDCC2_AHB_CLK>, <&gcc GCC_SDCC2_APPS_CLK>, <&xo_board>;
 			clock-names = "iface", "core", "xo";
 
-			pinctrl-0 = <&sdc2_state_on>;
-			pinctrl-1 = <&sdc2_state_off>;
-			pinctrl-names = "default", "sleep";
-
 			power-domains = <&rpmpd SM6115_VDDCX>;
 			operating-points-v2 = <&sdhc2_opp_table>;
 			iommus = <&apps_smmu 0x00a0 0x0>;
-- 
2.38.1

