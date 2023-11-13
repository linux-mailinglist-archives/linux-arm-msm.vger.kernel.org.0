Return-Path: <linux-arm-msm+bounces-545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E38B7E9857
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 09:56:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B72E8B20AA7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Nov 2023 08:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84E071A587;
	Mon, 13 Nov 2023 08:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="2mF/AodJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E9E182DC
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 08:56:32 +0000 (UTC)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F252410FC
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 00:56:30 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9e4675c7a5fso594697066b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Nov 2023 00:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1699865789; x=1700470589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NPOKnPWJWlf3ec742Gzw6PZKKL7Ki4xwsO0/KV2T8GM=;
        b=2mF/AodJUPuSRVTW7HObaBMPbbAeK26gYBOu7iDaXYQrgf20FnJv0nSQIXeM2RzLc3
         4/XHFbQ1Vit4vlewth2Xn+BhODuJY2uO1UMq2axh5VSAGqazakUylb4aWZj0O8MHIINz
         zh8n/Km+3XOV81WX1XaMS704NZzq11fGnAf9FSpiTwmpZQsXsblQV6ZuFrQFhVPJ+J48
         V27yGNsEUHPgdL1xmSezCIRwXRU2Sou8GLMT4vzUh2l92AFeJP/IReyYhy2zYTzWGE15
         7jhEoJ4Ir6qgDTmr7RGWweBJWSPuYlmP6BhTxZVlyeKn2rDQ5yrxPRLdqCnR1e7A93vk
         7yCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699865789; x=1700470589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPOKnPWJWlf3ec742Gzw6PZKKL7Ki4xwsO0/KV2T8GM=;
        b=i3Mdx/+p+MheS6LPtZ96h1qM0q7Zwt40wRM4/KF2CrqKbSg74qALM8QnAfLkKkFo6V
         0bXx2ZYN53QhIlP92UQNeP2Ki7EqECEiiank2oGfUJLLeJs1oxTJu3SP835NQu5iyHdz
         a+7v3lhvUnnEE5MM7UeBkqE9n94rNkB52tZJdNphb/eikJn2NRsDx4CZoZ1s1oIPk+MT
         ePoTKCr9wL4Tnbo0vZn58H2tHn4xgi+MYzgogsU8QrjoOGjwC1GQflpdm3vfm/nxE2V1
         VmMlIw1h7oLAjg8T5qTVuPL1lFoNMjPP6avZFIbjMgiAdKu7obypDPmYAqsmT2SHkJD8
         dsxw==
X-Gm-Message-State: AOJu0YwMxMpFeu5bmyJBaHz3Nl4js1PBePV5h8UG8pPU1pwa5cGHLIBu
	gXx7w90GTyx7deXT7fej+y0WXw==
X-Google-Smtp-Source: AGHT+IF6m7L8ru2HhB3d5vj6JwokEKjXauyfqhD4Nmgj+vhnaFro5ZZAvVzEjhM3bDEHyc4nWIYCfg==
X-Received: by 2002:a17:906:6888:b0:9e7:3af8:1fd2 with SMTP id n8-20020a170906688800b009e73af81fd2mr4108989ejr.58.1699865789559;
        Mon, 13 Nov 2023 00:56:29 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (k10064.upc-k.chello.nl. [62.108.10.64])
        by smtp.gmail.com with ESMTPSA id kk22-20020a170907767600b009c758b6cdefsm3673538ejc.128.2023.11.13.00.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 00:56:28 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 13 Nov 2023 09:56:18 +0100
Subject: [PATCH v2 07/11] arm64: dts: qcom: sc7280: Use WPSS PAS instead of
 PIL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231113-sc7280-remoteprocs-v2-7-e5c5fd5268a7@fairphone.com>
References: <20231113-sc7280-remoteprocs-v2-0-e5c5fd5268a7@fairphone.com>
In-Reply-To: <20231113-sc7280-remoteprocs-v2-0-e5c5fd5268a7@fairphone.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

The wpss-pil driver wants to manage too many resources that cannot be
touched with standard Qualcomm firmware.

Use the compatible from the PAS driver and move the ChromeOS-specific
bits to sc7280-chrome-common.dtsi.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 19 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 15 +++------------
 2 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
index 69e30d539dc6..14511a69658c 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
@@ -90,8 +90,25 @@ spi_flash: flash@0 {
 };
 
 &remoteproc_wpss {
-	status = "okay";
+	compatible = "qcom,sc7280-wpss-pil";
+	clocks = <&gcc GCC_WPSS_AHB_BDG_MST_CLK>,
+		 <&gcc GCC_WPSS_AHB_CLK>,
+		 <&gcc GCC_WPSS_RSCP_CLK>,
+		 <&rpmhcc RPMH_CXO_CLK>;
+	clock-names = "ahb_bdg",
+		      "ahb",
+		      "rscp",
+		      "xo";
+
+	resets = <&aoss_reset AOSS_CC_WCSS_RESTART>,
+		 <&pdc_reset PDC_WPSS_SYNC_RESET>;
+	reset-names = "restart", "pdc_sync";
+
+	qcom,halt-regs = <&tcsr_1 0x17000>;
+
 	firmware-name = "ath11k/WCN6750/hw1.0/wpss.mdt";
+
+	status = "okay";
 };
 
 &scm {
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index e41200bd7bed..8c21695646c6 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3589,7 +3589,7 @@ qspi: spi@88dc000 {
 		};
 
 		remoteproc_wpss: remoteproc@8a00000 {
-			compatible = "qcom,sc7280-wpss-pil";
+			compatible = "qcom,sc7280-wpss-pas";
 			reg = <0 0x08a00000 0 0x10000>;
 
 			interrupts-extended = <&intc GIC_SPI 587 IRQ_TYPE_EDGE_RISING>,
@@ -3601,12 +3601,8 @@ remoteproc_wpss: remoteproc@8a00000 {
 			interrupt-names = "wdog", "fatal", "ready", "handover",
 					  "stop-ack", "shutdown-ack";
 
-			clocks = <&gcc GCC_WPSS_AHB_BDG_MST_CLK>,
-				 <&gcc GCC_WPSS_AHB_CLK>,
-				 <&gcc GCC_WPSS_RSCP_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>;
-			clock-names = "ahb_bdg", "ahb",
-				      "rscp", "xo";
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "xo";
 
 			power-domains = <&rpmhpd SC7280_CX>,
 					<&rpmhpd SC7280_MX>;
@@ -3619,11 +3615,6 @@ remoteproc_wpss: remoteproc@8a00000 {
 			qcom,smem-states = <&wpss_smp2p_out 0>;
 			qcom,smem-state-names = "stop";
 
-			resets = <&aoss_reset AOSS_CC_WCSS_RESTART>,
-				 <&pdc_reset PDC_WPSS_SYNC_RESET>;
-			reset-names = "restart", "pdc_sync";
-
-			qcom,halt-regs = <&tcsr_1 0x17000>;
 
 			status = "disabled";
 

-- 
2.42.1


