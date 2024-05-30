Return-Path: <linux-arm-msm+bounces-21099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1EB8D4BBF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 14:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 620BD1C21F19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 12:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C355B132112;
	Thu, 30 May 2024 12:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="zDqAP0zA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0CF13210D
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 12:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717072479; cv=none; b=Qc7ve56PgDTAVHD4rO60NN2W4RWvzoAR/0+ipcAy6y3zqzEQaQJuB6PJXnyk8D1hgqVjEicC4WlQhW8qjvabt0KAFl0aD/NcAeBG2EhpBLwUfCb+IorKtrdbtU1U3vaSs5864heLXauaew8jpxA4xu4bq1fQvRUnPamsHWy13Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717072479; c=relaxed/simple;
	bh=3EAc270GOisvCj8dYgrA44nXJyeUIV05uLrntE2kQXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vGuMnZCr7Q/rCWBwNITgMpPjj0MeriAGWeOaDYRNEW1tsk3ZAdcYILDlxEtrvVGsdhwu1brclgwFs6moTD3x696Uc/ykZpEPw1XQ06AV0yRLzJKWpB4fGMSMVrnoQhHoHfZTg2wXe1j2eFdFlj+Bag285tn5muDpDOsNEGkt4SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=zDqAP0zA; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42108856c33so5870165e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 05:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1717072475; x=1717677275; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ktVNsM22917dZAynxsv5GXb4hlZ/XE1ZLs9sHcQUXDo=;
        b=zDqAP0zAcTzr6CTAoofdRqWVDFu3Jrcdl1wqlEt8NZEfh+xXlFGIyVBItseXkL3Ob/
         NuOVZPE+rUqmpi57rFToKFSchcgtiwtAEQZYDQn6EUfTUBz1ABrNk4hp2kuGYgBr3XRn
         CkHcaz+OwsQvSCWfVEJpG3MvqGoAmYbe7Zg3P242OXWpKq1mEUftg5ru2UMOztoWcKNM
         IZSE5FFbBRPgQ0BiFdC+/S+k2TUfbGkX0uKOOJ6I1ykB2JeJ+TMXYhDimPanjd0U4HQG
         UFj+imvidgFm90MPHrt1WJo/N2ng6mnwDPQxr56qrbLwGri2m8QOKZQk3m0C2H6/1897
         R/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717072475; x=1717677275;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ktVNsM22917dZAynxsv5GXb4hlZ/XE1ZLs9sHcQUXDo=;
        b=oQblP3Sic/47XCIdYdCuNye8G1Kasq6etRx2mmm609P+WRHUjhPleSu5QsVuitTech
         /s38ooJa7oK5o0dyYJeNZi8iTLEuFRjOD+4K+KiFrtY5ADKo2ts3HjGj5EMBHqquFZKc
         NgurdX29ipjaXp0kcGb94ZZV39K8OHCCqHe/eyFIWLzCexyvayTUAClfEhHujiajQGEN
         e4LpFyocTBmSaJbFmElgYNfx4oxmoMfEY0bYux8jPYOOjVkUgkYSKXGUzTmJoi1dXxj4
         GJs/zII8PIyCFPrI9AxoiMPAmgWTJRIBm80UPTXQZkkFdGqDGdXJMCL/3Jo8vNIGEnf1
         NnGw==
X-Forwarded-Encrypted: i=1; AJvYcCVtxq1HTCgt23aZV7FrWo3g2uLpBudNHzxOegU1eMSQD08/dq9JbxYuy7Rct9re4WGD0mPJM50ndtFoMSfSbYmDeI8nUzgHqntF+06oYQ==
X-Gm-Message-State: AOJu0YwoTw/0oR7ZQl3YcUhj2RHoJ3XKLM+8WTo4foUM5XW9qL7KuI3S
	6VUQHUvw9c3en4r57STUMv/noIHNKAjz/TlOv17yGCyM52qduwxl4trHEacriJc=
X-Google-Smtp-Source: AGHT+IFYxtCK25sfSOiuY5nuDusYxlyyhmUuFZU6a1ke3427hoJXy7AAxN1yJwe6rPBG0CFk+gnyeg==
X-Received: by 2002:a05:600c:3509:b0:418:f5a:580b with SMTP id 5b1f17b1804b1-4212811f675mr15479765e9.18.1717072474712;
        Thu, 30 May 2024 05:34:34 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421270697b6sm24134475e9.24.2024.05.30.05.34.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 05:34:34 -0700 (PDT)
Message-ID: <40903165-c965-4c6c-a3bf-104b1088730b@freebox.fr>
Date: Thu, 30 May 2024 14:34:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: msm8998: add HDMI GPIOs
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, MSM <linux-arm-msm@vger.kernel.org>,
 DT <devicetree@vger.kernel.org>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
References: <8cc61db5-2920-4dd1-8132-5af434fb05b1@freebox.fr>
 <o6wwzb4qblelfpfsrmqhoovjnyvymf42p2ilv4bzn4le3nklbv@kj3qklez7izy>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <o6wwzb4qblelfpfsrmqhoovjnyvymf42p2ilv4bzn4le3nklbv@kj3qklez7izy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/05/2024 02:45, Dmitry Baryshkov wrote:

> While I don't see anything wrong with this patch, maybe it's better to
> include it into the patchset that adds all HDMI nodes to the msm8998.dtsi.

Here is my current diff:
Do I just need to split it up, and it's good to go?
(Doubtful++)

diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
index 83fe4b39b56f4..78607ee3e2e84 100644
--- a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
@@ -14,6 +14,7 @@ properties:
   compatible:
     enum:
       - qcom,hdmi-phy-8996
+      - qcom,hdmi-phy-8998
 
   reg:
     maxItems: 6
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index e5f051f5a92de..182d80c2ab942 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1434,6 +1434,34 @@ blsp2_spi6_default: blsp2-spi6-default-state {
 				drive-strength = <6>;
 				bias-disable;
 			};
+
+			hdmi_cec_default: hdmi-cec-default-state {
+				pins = "gpio31";
+				function = "hdmi_cec";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			hdmi_ddc_default: hdmi-ddc-default-state {
+				pins = "gpio32", "gpio33";
+				function = "hdmi_ddc";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			hdmi_hpd_default: hdmi-hpd-default-state {
+				pins = "gpio34";
+				function = "hdmi_hot";
+				drive-strength = <16>;
+				bias-pull-down;
+			};
+
+			hdmi_hpd_sleep: hdmi-hpd-sleep-state {
+				pins = "gpio34";
+				function = "hdmi_hot";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
 		};
 
 		remoteproc_mss: remoteproc@4080000 {
@@ -2757,7 +2785,7 @@ mmcc: clock-controller@c8c0000 {
 				 <&mdss_dsi0_phy 0>,
 				 <&mdss_dsi1_phy 1>,
 				 <&mdss_dsi1_phy 0>,
-				 <0>,
+				 <&hdmi_phy 0>,
 				 <0>,
 				 <0>,
 				 <&gcc GCC_MMSS_GPLL0_DIV_CLK>;
@@ -2862,6 +2890,14 @@ dpu_intf2_out: endpoint {
 							remote-endpoint = <&mdss_dsi1_in>;
 						};
 					};
+
+					port@2 {
+						reg = <2>;
+
+						dpu_intf3_out: endpoint {
+							remote-endpoint = <&hdmi_in>;
+						};
+					};
 				};
 			};
 
@@ -3017,6 +3053,103 @@ mdss_dsi1_phy: phy@c996400 {
 
 				status = "disabled";
 			};
+
+			hdmi: hdmi-tx@c9a0000 {
+				compatible = "qcom,hdmi-tx-8998";
+				reg =	<0x0c9a0000 0x50c>,
+					<0x00780000 0x6220>,
+					<0x0c9e0000 0x2c>;
+				reg-names = "core_physical",
+					    "qfprom_physical",
+					    "hdcp_physical";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&mmcc MDSS_MDP_CLK>,
+					 <&mmcc MNOC_AHB_CLK>,
+					 <&mmcc MDSS_AHB_CLK>,
+					 <&mmcc MDSS_AXI_CLK>,
+					 <&mmcc MISC_AHB_CLK>,
+					 <&mmcc MDSS_HDMI_CLK>,
+					 <&mmcc MDSS_HDMI_DP_AHB_CLK>,
+					 <&mmcc MDSS_EXTPCLK_CLK>;
+				clock-names =
+					"mdp_core",
+					"mnoc",
+					"iface",
+					"bus",
+					"iface_mmss",
+					"core",
+					"alt_iface",
+					"extp";
+
+				phys = <&hdmi_phy>;
+				phy-names = "hdmi_phy";
+
+				pinctrl-names = "default", "sleep";
+				pinctrl-0 = <&hdmi_hpd_default
+					     &hdmi_ddc_default
+					     &hdmi_cec_default>;
+				pinctrl-1 = <&hdmi_hpd_sleep
+					     &hdmi_ddc_default
+					     &hdmi_cec_default>;
+
+				power-domains = <&rpmpd MSM8998_VDDCX>;
+
+				#sound-dai-cells = <1>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						hdmi_in: endpoint {
+							remote-endpoint = <&dpu_intf3_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						hdmi_out: endpoint {
+						};
+					};
+				};
+			};
+
+			hdmi_phy: hdmi-phy@c9a0600 {
+				compatible = "qcom,hdmi-phy-8998";
+				reg = <0x0c9a0600 0x18b>,
+				      <0x0c9a0a00 0x38>,
+				      <0x0c9a0c00 0x38>,
+				      <0x0c9a0e00 0x38>,
+				      <0x0c9a1000 0x38>,
+				      <0x0c9a1200 0x0e8>;
+				reg-names = "hdmi_pll",
+					    "hdmi_tx_l0",
+					    "hdmi_tx_l1",
+					    "hdmi_tx_l2",
+					    "hdmi_tx_l3",
+					    "hdmi_phy";
+
+				#clock-cells = <0>;
+				#phy-cells = <0>;
+
+				clocks =
+					<&mmcc MDSS_AHB_CLK>,
+					<&gcc GCC_HDMI_CLKREF_CLK>,
+					<&xo>;
+				clock-names =
+					"iface",
+					"ref",
+					"xo";
+				power-domains = <&rpmpd MSM8998_VDDMX>;
+
+				status = "disabled";
+			};
 		};
 
 		venus: video-codec@cc00000 {


