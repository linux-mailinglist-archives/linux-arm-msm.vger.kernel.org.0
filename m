Return-Path: <linux-arm-msm+bounces-117450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u3fUBiqeTWrd2wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 02:47:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F15B720B20
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 02:47:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=zVMSwW51;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117450-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117450-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7649C3092562
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 00:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5698C368D43;
	Wed,  8 Jul 2026 00:44:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5866368974
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 00:44:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783471477; cv=none; b=jVI0uYn1xkAGev2S4IHcEeBomTBkCZNmxz/KfwtEy3mq8rRA3CfxQZAjnf3FQk6KNOSjicOayTKMv1R0Mb75tEZJl8LRa7wAo5Co7a3Vk48p8WNyH0SLRPv2PhPOxhRpP6IH3M+LA5+hhclWJbd+jaFVFH82zRPnlwurXmjxNF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783471477; c=relaxed/simple;
	bh=3nogGGrXBxCDLwqT1oTOKrWJjZFhISOK5ofoQzb8Ums=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oQsRHEywpp8gBeN3YspePTYJqL4crVjJh/b97qnbSaszyZmK9uT2uNNMzOcHRQKj/2uODmgFG9aueBgIHc4pHYntCVZPgbgm1HBqCZBEHEwGf3dHo5K+5Jhrk1/SKRk70RmC5fn/GDlIwFyCNr7aioyEBNAgCykdPnRjKopWWTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zVMSwW51; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493e497643fso432895e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 17:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783471470; x=1784076270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JXuluUeSrIOh59TquJfEnMrNfJnCfonDeL5RxJtL298=;
        b=zVMSwW51pC3ZhMSSPEYrmPZ3Liuw3RIZS/6JCB4J2rU9xpJIBEZDDZu+pyU+Rujiub
         rbKjuCBVo6wp+6QUp/Ul8MXpOFVnEOMQqaUWzzfO3bwOjGfUD1aqaya810q9/wpY5aHs
         OYF3vNOUyNh+4iLrR8iBWtimYvBkZWaKgVLfjN+BOxzxQpRI2Y6mkRkp6BOdCZR/PThF
         Qpmi/BKYVmYpemsbDAV8zHJCtUEr5+nHYVKuyFTWV2tIVuR+4TwuIP0RfOlrCyIHqot7
         QD4nSUt93d3VYlJeSq5VWUuHMYc+CRvFUANECdhlpGvr2SiHhXGQQIlIRKQpcL9Gv1PG
         28Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783471470; x=1784076270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JXuluUeSrIOh59TquJfEnMrNfJnCfonDeL5RxJtL298=;
        b=ccNTxOb+nxpWURjlxeMHH4u+sOR5gTJ818ojYBSix+nfJn6VgiVtzUVQYXq/PmAYq2
         6VJupS09IMEAQFh9XnbO4ndXMtGOX54b0vDxaLU4ff/bEfMO/h+2L/MZVFGao7LOxY4G
         sGhOBZW9TPS03kbO7oHN1xKQTqVoLDHSX6xkv2bpC7NYC4G5lkMRV809fjxxG73HuqFu
         oDSwislfghQT87zw0OWsBXobSDO8U/RLu/06OB41AhrCuhfvmgFUnLWXyN0y+gqHySFq
         +Pl8dH7sKx/plC/mKpwVlckJEdanur+PPz9SPwha97nUx6vNK3ETBUUipBTmkl14K15a
         4hkg==
X-Gm-Message-State: AOJu0YzIMJKaYHkEEcufOto872aiq8wZymxhjdFvm73hx3ELC3j5rWI8
	cEeDf48MOgw9MzGchrAlzlVf1C58oSrOYeGSQBR6FpwYPXjcv7ccydWNk4pjzWAzt2UL1VRT1ni
	i7sCFSac=
X-Gm-Gg: AfdE7cmgc75xvLgH3MH2gAMcQ+IEWbYPJN8HqLupNdABcq0FUcyfMCZxNKr6BqTR/hf
	3kgo/3kR7zaeNEhbVflx1dvNT5uY4v0g7GXvoi41cxp3b8Yr75HFF5bPOC52dJu7uEDJNTPtB8C
	1vqeYTPcmo40038cJTY4sofmbtFu/xe4bqwDW4A10iJ2yYnPeV3Sez+5V64Uw3FSCx57Plo2SIa
	4+AH0XRz72nqalkxhEsroYYkP69fLjzjaiRkTPOT9lwT/UJlBpjyvfEeZlWmvn9uWaehaXgNuoB
	2ttY/6xd36qQPkr7WCa9vWn54Wn5Cua+OGaHpVu5/mnvZvf4hzoa0LGLAOz3OLxnuaASyeIj5RW
	OEXUzSH4HmfBlAdbOCViNzbIiIghbRflXSDvPoIrTxv7ym++y9ZtIB/GdHZPkM5bORGRuFOv6N5
	gaSHWZfJFVm4+osokUm5K2UouufOb0SxlSJw==
X-Received: by 2002:a05:600c:c8a:b0:493:c3f9:65a2 with SMTP id 5b1f17b1804b1-493e688cf81mr1630345e9.5.1783471470092;
        Tue, 07 Jul 2026 17:44:30 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fc1348sm99727985e9.14.2026.07.07.17.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:44:29 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:44:14 +0100
Subject: [PATCH v4 07/11] arm64: dts: qcom: x1e80100-t14s: Add on ov02c10
 RGB sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-x1e-camss-csi2-phy-dtsi-v4-7-572348ad1b2a@linaro.org>
References: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
In-Reply-To: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2936;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=3nogGGrXBxCDLwqT1oTOKrWJjZFhISOK5ofoQzb8Ums=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZ1dPNoG6MAh/VrvPGtPZb3t/6dMtULpdp/5H
 i8/M4ZKwkCJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2dXQAKCRAicTuzoY3I
 OktzEACZuE6zpAkWqjjd4PvoPB0eE/dUAVl8Q0tKn+nBtvhPu55S6i5juwLs6uX0cvy8C+PBnNR
 BNzOs+BeWAa1iTB8E2KVIUmfKFgNmVizY83TE9otWTK6k6bg9fXQGTaTXYLG/qkoHIGE+aHYntv
 kwb53Lvf/yDyHMRmmo6+QPQioyJnYF02oiSvdTAU/kFzw4nvO0GZgZS6cM6RSkvTa80inpvQPrw
 Z200k70UgDHmGHxh5tZdUmZyQmAcVyRRwBXSHsG2GrOQgvzaLW3SN8V+uON6I3+3I/MX0KLMkVG
 hu2159g6DtOQEbTkOowBZOOuVVbJDPL8johOPyE3+Id+O02M2aaQ9xgNXDtkBXHHG9bJGy3AS/i
 ARRHuFt7HOP4AzOoboR4mfgwbEJhKsYSZs+V9sCXMZybyz3MT/Tbx4tvW/qIzyiEOAVUZn5qaJW
 47kV4wItnTVusMW9G126OmnOKuEL76FMQBXyuiedXKqCVGA/V7dOVlf4u3xRRmoopfgpH2/c2Bv
 /FUt4wd72YiKvKYSeOfFh+QcHSjiqAik5fFvZY85VJMkk+gcoYK76+xXvLOY7ss6DrbQU1QYGHD
 YiuWzDwsP8viP+bqaXT+3eaIqIg4egmOC4ZkqmcDP/DiUNNpUQlCmN2vPMhlbRg6bHDn3iw0dKL
 2vSBzz5dfTm3C+Q==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117450-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F15B720B20

Switch on the ov02c10 RGB sensor on CSIPHY4.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 99 ++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 70e50ccf67677..c5c7bf722a45e 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -866,6 +867,88 @@ vreg_l7m_2p8: ldo7 {
 
 };
 
+&camss {
+	status = "okay";
+
+	ports {
+		/*
+		 * port0 => csiphy0
+		 * port1 => csiphy1
+		 * port2 => csiphy2
+		 * port3 => csiphy4
+		 */
+		port@3 {
+			camss_csiphy4_inep: endpoint@0 {
+				data-lanes = <0 1>;
+				remote-endpoint = <&csiphy4_out_ep>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	camera@36 {
+		compatible = "ovti,ov02c10";
+		reg = <0x36>;
+
+		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_rgb_default>;
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <0>; /* front facing */
+
+		avdd-supply = <&vreg_l7m_2p8>;
+		dvdd-supply = <&vreg_l2m_1p2>;
+		dovdd-supply = <&vreg_l4m_1p8>;
+
+		port {
+			ov02c10_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&csiphy4_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy4 {
+	vdda-0p8-supply = <&vreg_l2c_0p8>;
+	vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			csiphy4_in_ep: endpoint {
+				data-lanes = <0 1>;
+				clock-lanes = <7>;
+				remote-endpoint = <&ov02c10_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			csiphy4_out_ep: endpoint {
+				remote-endpoint = <&camss_csiphy4_inep>;
+			};
+		};
+	};
+};
+
 &gpu {
 	status = "okay";
 };
@@ -1447,6 +1530,22 @@ &tlmm {
 			       <72 2>, /* Secure EC I2C connection (?) */
 			       <238 1>; /* UFS Reset */
 
+	cam_rgb_default: cam-rgb-default-state {
+		mclk-pins {
+			pins = "gpio100";
+			function = "cam_aon";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio237";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	ec_int_n_default: ec-int-n-state {
 		pins = "gpio66";
 		function = "gpio";

-- 
2.54.0


