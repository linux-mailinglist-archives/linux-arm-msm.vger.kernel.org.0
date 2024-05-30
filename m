Return-Path: <linux-arm-msm+bounces-21138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 320A78D5008
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 18:45:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B5D7285E4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 16:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A617224D4;
	Thu, 30 May 2024 16:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="vjFCqkgc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D30228E7
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 16:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717087527; cv=none; b=CC51ecHVx3VABEzlD1XP0nA3tn+QAleizVb/brzgdUY5ggT6WrFk/tASXcrgkzSJH3BRxbAJCWNEttalZZXYFdwZHT1716wQ9BvLuVCop6EgzhkSewvuoqN5XJDZQSZroYm+osz3GwxEAxEae74sUuIYkyFpyUmbB21E50v3vkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717087527; c=relaxed/simple;
	bh=rGzVD1YiEJQaIHQz6C6hMl2QWne24F7La2tFPhV77kM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=auw1TNziYLOQm+d4R1onwhOTJs59TFjKogDZ0bCx4/6oI6A2Y0V79SyBJt5MW7SXwx65KRaJWnZ2UHWoXa8UdKrZSkXF4slx0SGkOdJOdeSb7HBPwJJ4LBHOpRzAjLB3USp/jFbVaGUDXXLV7b1KnzSJWhE/j7BoL8VMeBPiMGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=vjFCqkgc; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42101a2ac2cso1304665e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 09:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1717087522; x=1717692322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ace5TTE0fjG/44mTn4+p1NqHztO8DZcxVDYvVq9lTpI=;
        b=vjFCqkgcXx+nRPMpR5F2FcrVVNmiBKMoowqsHx0Pv77I2ld6TDhqfcesA9LTnkyumV
         8MqECFUI6iogZWNy68f6OgKsWIoIZl1iNrxFkyfT6SKiiy+uZo8QosKpS9Gqu7PmqCF+
         ZpIJI/8q1qZP6r2snZUTXdJQ6y8kD0S2A7BQ+i4KMpeh2ujwjH9QscWp0/iPKN8x/gbH
         ggkWEm41kRH4oJtB2vW2XUyYWmlrWLvWJWaq7GazjYK1E1kdXmrWUv+29ownlm7Gf5UZ
         GLpqS/FCeEDo/4pY/ZIBppTobswXwiFvDpwFk2KFCQUuo/Q/Z7LeFQAy3GVvyKyaRAlo
         RAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717087522; x=1717692322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ace5TTE0fjG/44mTn4+p1NqHztO8DZcxVDYvVq9lTpI=;
        b=jxZ4ALPPM8i7gWNl5tk7JS/q0Psp3YlsdCCn99CzzPLQ1ZWQ5P2hyPgyV999BoBonR
         Dt8Z3dXkg390fvynpkIEmM7MsjSGh34aVONBz7H9Eotua2an5KLBoMkfPhcjwLjSiufG
         2icctiEBR7Q3In1LbsYQ81cFbGoFXkqhBj2L1Izi2YktVBfXrW1hvfxvebEVyIGQBliU
         nMxrPbL15C4vuN/cYiD15ZIWFywvaborLNwnDcwFxf9g1e8Lv0BdN8FMuuVzJdFGTaST
         f08cih6TZNTpt798miskP+Wy9AVYK6I/C/bmlpRsdi6DtuY0Y0UYxnWzCFsPD+z0eKez
         4E0A==
X-Forwarded-Encrypted: i=1; AJvYcCVR9KMHSWf9FRFd9dSOmYbmBLYnOLy/6K5YEJ0J6c4A/WCH9NRO4rO4J8SzXIAXIRZdgvEiUYLvgQfODRnCkeMSqZqGFCF0bVPnWB//SA==
X-Gm-Message-State: AOJu0YxsiC8TYi+Z1vMrqd2orCLUBmY9VJrPdIHfJpE0hNZQgpKlmCqf
	Fh3oQIy8tCIxkGatHaXEUxspKN1ub7DQmpcVuqHG+jAbRuS+vy28Gtqd8WUzjtE=
X-Google-Smtp-Source: AGHT+IENzvhBU4JgyeiqNQGv7yoNWBxYsRULGs58iL7GFUlbBbvvsFDSOsGpHUxmRc3LEJ3+gaY+aw==
X-Received: by 2002:a1c:771a:0:b0:41f:9ae3:57f2 with SMTP id 5b1f17b1804b1-4212792dab3mr28376655e9.37.1717087522148;
        Thu, 30 May 2024 09:45:22 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dbe002548sm2744667f8f.79.2024.05.30.09.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 09:45:21 -0700 (PDT)
Message-ID: <8475b07d-8d44-4969-9c15-2926a6397b1c@freebox.fr>
Date: Thu, 30 May 2024 18:45:21 +0200
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
 <40903165-c965-4c6c-a3bf-104b1088730b@freebox.fr>
 <CAA8EJppg9ftnQVrZhEO9Ro2Ji6whCgQLaJrr0yCzV-2hF2HEtQ@mail.gmail.com>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <CAA8EJppg9ftnQVrZhEO9Ro2Ji6whCgQLaJrr0yCzV-2hF2HEtQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/05/2024 15:06, Dmitry Baryshkov wrote:

> This device was neither validated nor described properly in the DT
> schema. There are several other issues here.

Do you mean dtbs_check or dt_binding_check or something else?

I think I changed everything you pointed out.
(I tried to remain as close as possible to msm8996.)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index 47e97669821c3..9fc49ae9ee387 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -19,6 +19,7 @@ properties:
       - qcom,hdmi-tx-8974
       - qcom,hdmi-tx-8994
       - qcom,hdmi-tx-8996
+      - qcom,hdmi-tx-8998
 
   clocks:
     minItems: 1
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
index e5f051f5a92de..268bb83efccce 100644
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
 
@@ -3017,6 +3053,90 @@ mdss_dsi1_phy: phy@c996400 {
 
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
+				interrupts = <8>;
+
+				clocks = <&mmcc MDSS_MDP_CLK>,
+					 <&mmcc MDSS_AHB_CLK>,
+					 <&mmcc MDSS_HDMI_CLK>,
+					 <&mmcc MDSS_HDMI_DP_AHB_CLK>,
+					 <&mmcc MDSS_EXTPCLK_CLK>;
+				clock-names =
+					"mdp_core",
+					"iface",
+					"core",
+					"alt_iface",
+					"extp";
+
+				phys = <&hdmi_phy>;
+				#sound-dai-cells = <1>;
+
+				pinctrl-names = "default", "sleep";
+				pinctrl-0 = <&hdmi_hpd_default
+					     &hdmi_ddc_default
+					     &hdmi_cec_default>;
+				pinctrl-1 = <&hdmi_hpd_sleep
+					     &hdmi_ddc_default
+					     &hdmi_cec_default>;
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
+				clocks = <&mmcc MDSS_AHB_CLK>,
+					 <&gcc GCC_HDMI_CLKREF_CLK>,
+					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+				clock-names = "iface",
+					      "ref",
+					      "xo";
+
+				status = "disabled";
+			};
 		};
 
 		venus: video-codec@cc00000 {


I get /dev/tty1 on the TV.

And the following command displays test patterns as expected:
# modetest -Mmsm -a -s 33:#0 -P 34@82:1920x1080+0+0@XR24 -P 40@82:200x200+35+300@AR24 -P 46@82:200x200+310+300@AR24
setting mode 1920x1080-60.00Hz on connectors 33, crtc 82
testing 1920x1080@XR24 on plane 34, crtc 82
testing 200x200@AR24 on plane 40, crtc 82
testing 200x200@AR24 on plane 46, crtc 82


Regards


