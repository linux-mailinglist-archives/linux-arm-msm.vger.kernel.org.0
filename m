Return-Path: <linux-arm-msm+bounces-19513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C728C0223
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 18:37:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75300283AB3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 16:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C5E130A5B;
	Wed,  8 May 2024 16:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/Q6Emeq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5661CAA9;
	Wed,  8 May 2024 16:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715186124; cv=none; b=ul+RHE1ttsIQwd9lL6e0cNq06OwJKq0VkP0La6ERmpyO+ejALk6O7cnwFZf5kOvSHWUYQr5CluGLnrrn7vBtAdvo0jX4bwuy6ImiMXQXvfxw7JVrg1AgbgTfnCA1V/di6YYi1ig8wdHss6rZ0Gz6Sy2GdhJcRrLpTvVi6zGwJBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715186124; c=relaxed/simple;
	bh=kqR3e+G+FwxxvYQszYYBav4hMORDD8iu64I0EbyOkPw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YriKuzgkLNHAFeGQL9keqnsVwQBdtadggByNag7sEJydamflDFR2HrUOD7cOVlxPH+eUGYpGG4y0Z/W3cL7I8Bvxo8hZ7FrWGEK89FOi8i2wDKy7SxJCkVCAvKcS6okKLR3I6toVdlfzsXJDH4DH5iG/pIfxTpMgHx1BY5LjGPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/Q6Emeq; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52192578b95so1117314e87.2;
        Wed, 08 May 2024 09:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715186120; x=1715790920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tp/T9XNsntI4CnM9P4PFtuq3ai3Ksp8Jmc/dAXOLMkw=;
        b=W/Q6EmeqwT5LLMBGRdpitODkUtU0yhynge79P5Iw86VE0qxwtqaOfhop8uAiUNzlIv
         cwjK/XitD2mA3+Cvua/+Xyn4zLoDcp4QiHqO1N8vS9XBBepf5NYfRLoc1j9k7RCypVEx
         z1NtAdbj8wUOoEtm5naYXvEuFXJX8rnX5GiIBahMwkqobCo6tjmskqf260DgWvf0EMII
         +bcMlUGZg9GW5+fGDG9ZPW9k3qx6UbyVU2G7QGcpfqgl1Z4CyntEnCgwHWvGS95Hb6b7
         NNA0lQCKbg8AfoDXMCR3nJ1Ca614Y4+R5cKhTyyywfKNfQBBPvI+SF6uoFx5YWAR2CZ2
         cuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715186120; x=1715790920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tp/T9XNsntI4CnM9P4PFtuq3ai3Ksp8Jmc/dAXOLMkw=;
        b=W2t9Z2RA/XTLojW09BkNLk21N4XgSauPUMTvTWeyWUMldENBOKRz9P0qAkhYCIY44k
         hKxbPJnTEY/Z+qfUkR02Ar/2echdLUYOz3x4anixvx5gbrKmzPKzTbaCiwJ3L97EjU9a
         EJMBrObLd7Aa4rozKrnYU5+rZkUXEGSO5x2gdvmXi4X56NK1qL1DQB1PuEL4nssjim91
         Cvtwuweo4Q4DMZ5pbV3ktimga0LgooS9XXgxX9m6l21B5TcL5IgdWGx07c1S1Nc+5/Tp
         YEeIjhb8s8QL9185rWIdd3SG2/GDJEAGdGcWe99lEr5fFGTE9FNd7PYRyNXNkoucmYpP
         poFg==
X-Forwarded-Encrypted: i=1; AJvYcCVzDQ2wdXNx1Y1LOEogrEc1qOP5zrTv9aPhMi9ZM0zeq6oCrs3S0jEKsV5U/dCTQrNseAFFmBE2JGEMRJNPQCpvjGrocLeBKP7vu4TVAdd8qGcI8IKgCT2HwFzqaZM6EdHqwLEnbPWh3ljJeXSh0Pxzf+NVexeCoHh9VYu6NIWXZc0hC5ELhnM=
X-Gm-Message-State: AOJu0Ywh/LKpgoolGNzjSXU/yWvxCpDv3/RjdWFUf/+GfubSzOH7Cimy
	QNa7BHSlaeot4ZCgo4cI1GxJSpknmvcZDKPQXZQI+LVbL8rhXnAj8iVbON39
X-Google-Smtp-Source: AGHT+IGb/kA0m/RM+i2RWmKA5BJJbiGGJvHAEA90gFGin0KEZGm0KxZCkzadxNK0gwFa4l8aSgGQUw==
X-Received: by 2002:ac2:43c1:0:b0:51c:cd8d:2865 with SMTP id 2adb3069b0e04-5217cc4585bmr1708634e87.44.1715186120037;
        Wed, 08 May 2024 09:35:20 -0700 (PDT)
Received: from localhost.localdomain (bzb212.neoplus.adsl.tpnet.pl. [83.30.47.212])
        by smtp.gmail.com with ESMTPSA id kt1-20020a170906aac100b00a52295e014bsm7820894ejb.92.2024.05.08.09.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 09:35:19 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Adam Skladowski <a39.skl@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] arm64: dts: qcom: msm8976: Add WCNSS node
Date: Wed,  8 May 2024 18:34:37 +0200
Message-Id: <20240508163455.8757-5-a39.skl@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240508163455.8757-1-a39.skl@gmail.com>
References: <20240508163455.8757-1-a39.skl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add node describing wireless connectivity subsystem.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8976.dtsi | 105 ++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
index 22a6a09a904d..a7f772485bf5 100644
--- a/arch/arm64/boot/dts/qcom/msm8976.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
@@ -771,6 +771,36 @@ blsp2_i2c4_sleep: blsp2-i2c4-sleep-state {
 				drive-strength = <2>;
 				bias-disable;
 			};
+
+			wcss_wlan_default: wcss-wlan-default-state  {
+				wcss-wlan2-pins {
+					pins = "gpio40";
+					function = "wcss_wlan2";
+					drive-strength = <6>;
+					bias-pull-up;
+				};
+
+				wcss-wlan1-pins {
+					pins = "gpio41";
+					function = "wcss_wlan1";
+					drive-strength = <6>;
+					bias-pull-up;
+				};
+
+				wcss-wlan0-pins {
+					pins = "gpio42";
+					function = "wcss_wlan0";
+					drive-strength = <6>;
+					bias-pull-up;
+				};
+
+				wcss-wlan-pins {
+					pins = "gpio43", "gpio44";
+					function = "wcss_wlan";
+					drive-strength = <6>;
+					bias-pull-up;
+				};
+			};
 		};
 
 		gcc: clock-controller@1800000 {
@@ -1458,6 +1488,81 @@ blsp2_i2c4: i2c@7af8000 {
 			status = "disabled";
 		};
 
+		wcnss: remoteproc@a204000 {
+			compatible = "qcom,pronto-v3-pil", "qcom,pronto";
+			reg = <0x0a204000 0x2000>,
+			      <0x0a202000 0x1000>,
+			      <0x0a21b000 0x3000>;
+			reg-names = "ccu",
+				    "dxe",
+				    "pmu";
+
+			memory-region = <&wcnss_fw_mem>;
+
+			interrupts-extended = <&intc GIC_SPI 149 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			power-domains = <&rpmpd MSM8976_VDDCX>,
+					<&rpmpd MSM8976_VDDMX>;
+			power-domain-names = "cx", "mx";
+
+			qcom,smem-states = <&wcnss_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			pinctrl-0 = <&wcss_wlan_default>;
+			pinctrl-names = "default";
+
+			status = "disabled";
+
+			wcnss_iris: iris {
+				/* Separate chip, compatible is board-specific */
+				clocks = <&rpmcc RPM_SMD_RF_CLK2>;
+				clock-names = "xo";
+			};
+
+			smd-edge {
+				interrupts = <GIC_SPI 142 IRQ_TYPE_EDGE_RISING>;
+
+				mboxes = <&apcs 17>;
+				qcom,smd-edge = <6>;
+				qcom,remote-pid = <4>;
+
+				label = "pronto";
+
+				wcnss_ctrl: wcnss {
+					compatible = "qcom,wcnss";
+					qcom,smd-channels = "WCNSS_CTRL";
+
+					qcom,mmio = <&wcnss>;
+
+					wcnss_bt: bluetooth {
+						compatible = "qcom,wcnss-bt";
+					};
+
+					wcnss_wifi: wifi {
+						compatible = "qcom,wcnss-wlan";
+
+						interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+							     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+						interrupt-names = "tx", "rx";
+
+						qcom,smem-states = <&apps_smsm 10>,
+								   <&apps_smsm 9>;
+						qcom,smem-state-names = "tx-enable",
+									"tx-rings-empty";
+					};
+				};
+			};
+		};
+
 		intc: interrupt-controller@b000000 {
 			compatible = "qcom,msm-qgic2";
 			reg = <0x0b000000 0x1000>, <0x0b002000 0x1000>;
-- 
2.44.0


