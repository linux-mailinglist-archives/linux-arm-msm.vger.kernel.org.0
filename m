Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFD26B7DAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 17:34:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231479AbjCMQeQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 12:34:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231288AbjCMQdy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 12:33:54 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 818A52749A
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 09:33:20 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id a32so13228700ljr.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 09:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678725187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8wFrGrox8EnBEgAX+oIk4Xf77wbVAxMyYCetFccreI=;
        b=OEIe3yS9v5u8o21Nle0AENmlKsV4cl7yAz/q5tf0eJzfTemmw1YtH+CfIrQfIdBLhU
         EUDuqSMWcKV+D78MinVQcLM1mbKvKue5M9sL2nKyWJb0CKgwOvYWwVFWSrBHDdC3L3Id
         FbEzWYkLyNkvS3JyXEWIw6rDIGoVHWIfN7Pp37rmrefGXePGCtfnPxVv2XZ7S9czRFPo
         06fTKgK02dnCczM+RYymbB7ZGrkrK5ggmrlVr8V0A+pVXLwnjGwKI/pP0sZZifEpcVeB
         QnvQDsLJHB2oagw7jJicI/HQIA8Y374SuVFRDlxPJA+1pRFEh+5rG63WjhBbIFlrko+d
         3wVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678725187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G8wFrGrox8EnBEgAX+oIk4Xf77wbVAxMyYCetFccreI=;
        b=3H1gUEDUouP2RMKEH/Na8D2Hx5CLonNZ2N+dBsSKXl1nm2UGL5p4bBBcn/PkA97f1F
         LcCKs0ccB9p4/BTXes8E81u9EKWlAb7dQTXWvrbm4NbDpyavzSnwtgCqqCmTBSaK5gmR
         rD+9PZ4tMiouY70nQxUzK1LuA42ZyUa/yRHLAIc01KeN2he1593UBTkTqjVC5uVPeI2B
         FKgCO1FXnNLZmb634PwM7zSrBFqCZU/tnQiqRKg+KlzjdeUAKAqxhB85ZuWc7XROp7Qr
         SV4T6LOkNZLmjBPpq0ccVB9IF3i9Q8dKYdwTLuwEaxjlaMs5fCBBvo7bGa5KoTfjiz38
         zqpg==
X-Gm-Message-State: AO0yUKWVJ5G408jaaCcPeA4v/YHHmENBjd5nKmPAOTH1z166ToKtmZJs
        FlXe9WjLE1Z2IL5iSc6CL1B0Tw==
X-Google-Smtp-Source: AK7set+b49K0gSI/QF6Fkjm14jPKYDSu99qSQ4nAFn+NFoJToFt+xdulRKf3U4bNmmNtTZ66c/Nrrg==
X-Received: by 2002:a2e:9243:0:b0:295:a313:1365 with SMTP id v3-20020a2e9243000000b00295a3131365mr10436424ljg.3.1678725187078;
        Mon, 13 Mar 2023 09:33:07 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id q62-20020a2e5c41000000b00295765966d9sm57417ljb.86.2023.03.13.09.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 09:33:06 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 13 Mar 2023 17:32:37 +0100
Subject: [PATCH RFC v2 2/6] arm64: dts: qcom: sdm845-tama: Add Synaptics
 Touchscreen
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230313-topic-tama_disp-v2-2-37ececf43770@linaro.org>
References: <20230313-topic-tama_disp-v2-0-37ececf43770@linaro.org>
In-Reply-To: <20230313-topic-tama_disp-v2-0-37ececf43770@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678725183; l=3240;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=mu6ITjv0TcTtY1zHPg2hqqYbkjvB5XNdC9bJFxRYUnM=;
 b=Zj/avQsnRzusV6TnfAudATEn2n8c6UB5KkqtLBXgUtB5QLVTBb/L5OZqaz1cKHIQT6hSidwnF4Jt
 sqWWRV4LAyrvddIA+XGP+ZaA5E0L4Fj2BgvOqQAYifDUNQLoqeZI
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Konrad Dybcio <konrad.dybcio@somainline.org>

Add required pins and RMI4 node to the common DT and remove it
from Akatsuki, as it uses a different touch.

Since the panels are super high tech proprietary incell, they
need to be handled with very precise timings. As such the panel
driver sets up the power rails and GPIOs and the touchscreen
driver *has to* probe afterwards.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts  |  3 +
 .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi     | 69 +++++++++++++++++++++-
 2 files changed, 70 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts
index 81cbf535cb76..5d2052a0ff69 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama-akatsuki.dts
@@ -7,6 +7,9 @@
 
 #include "sdm845-sony-xperia-tama.dtsi"
 
+/* XZ3 uses an Atmel touchscreen instead. */
+/delete-node/ &touchscreen;
+
 / {
 	model = "Sony Xperia XZ3";
 	compatible = "sony,akatsuki-row", "qcom,sdm845";
diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
index ac0dfb383892..967c9b81f061 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
@@ -405,10 +405,43 @@ &gcc {
 };
 
 &i2c5 {
-	status = "okay";
 	clock-frequency = <400000>;
+	status = "okay";
+
+	touchscreen: touchscreen@2c {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x2c>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <125 IRQ_TYPE_EDGE_FALLING>;
+		vdd-supply = <&vreg_l14a_1p8>;
+		/*
+		 * This is a blatant abuse of OF, but the panel driver *needs*
+		 * to probe first, as the power/gpio switching needs to be precisely
+		 * timed in order for both the display and touch panel to function properly.
+		 */
+		incell-supply = <&panel>;
+
+		syna,reset-delay-ms = <220>;
+		syna,startup-delay-ms = <1000>;
+
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&ts_default>;
+		pinctrl-1 = <&ts_sleep>;
 
-	/* Synaptics touchscreen @ 2c, 3c */
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		rmi4-f01@1 {
+			reg = <0x01>;
+			syna,nosleep-mode = <1>;
+		};
+
+		rmi4-f12@12 {
+			reg = <0x12>;
+			syna,sensor-type = <1>;
+		};
+	};
 };
 
 &i2c10 {
@@ -561,6 +594,38 @@ sde_te_active_sleep: sde-te-active-sleep-state {
 		drive-strength = <2>;
 		bias-pull-down;
 	};
+
+	ts_default: ts-default-state {
+		reset-pins {
+			pins = "gpio99";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		int-pins {
+			pins = "gpio125";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	ts_sleep: ts-sleep-state {
+		reset-pins {
+			pins = "gpio99";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		int-pins {
+			pins = "gpio125";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+	};
 };
 
 &uart6 {

-- 
2.39.2

