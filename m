Return-Path: <linux-arm-msm+bounces-97764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDKIE5hZt2nwQAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:15:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B93293574
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:15:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F9573040442
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 01:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD34E234964;
	Mon, 16 Mar 2026 01:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bQfBmYPk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B752066DE
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 01:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773623583; cv=none; b=I2rSIq8D2/VE9FhUl2T6gSYNeEs6v9mj5xZ75WMhFHS3lH9Ak5tUC2kNRvV2w/JWALCfZozI792Wn0wj4vIshbcLKixfYH8qg37CpK2vvbwHDVZxOfutlM98wf9oslVyrvxhwIJcUymqEp1GmaIJo31UwkTtLPuxpjWpfQ2bw6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773623583; c=relaxed/simple;
	bh=PZliYhJiPFyZNkAm4JLciiLWwJQT5YMK35xTkwdH/J0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JcTs8n9x607xkvhFY/iElSXrtAXhnNZxBfVvqoFDFcgimHeiuFowG1acYqL6jfgLjYCpafryG8b4iJUZUmmlV+mPuG91UFQiz39iJKvCetjdlDbIiKp6MI2td9dVRez/qY9Srb1+/Eh6tSkl9HTkGzi/CHJnTj6eEItgR9Yjb1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bQfBmYPk; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48541edecf9so43370485e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 18:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773623577; x=1774228377; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Ux9KlDrXiMeO+6sxOIbUbjCaB/XkjWdPsfbfbK0QR0=;
        b=bQfBmYPk5GApPhzYlwK0CRgKtcmu2H2w9pxzxFndeTckC1DMDNiYgRsKR9ULYdL6RU
         RVlpn69Xuxje9dzJnrzzpGWt5fIhKFiUWRUj5LPMo/q7We75ps25zINFYKpoZVNYOeJG
         C+/DuAXMPcB/KzwJqbqhwJLhxSNNnvEJt6tbr5pw8c2QTz/bWjPkfOHXsCl3qYUQzWiF
         gI1Ydt6TgIouo6kd93iukhtV5lt3NzOSB6CvuJw7GupmDJ5aGYvkJVzFAw4l6yH9utYe
         XFc7sSv101D/y/5+fOgoBkzVAotTurFNGqISUiUW6+Z518jmJaaVKRzKBRands6ISnxu
         xscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773623577; x=1774228377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0Ux9KlDrXiMeO+6sxOIbUbjCaB/XkjWdPsfbfbK0QR0=;
        b=Bb7/cjOrkUkG2Cfg1kdlJSoazqcXynla77hMmhnNM9oM4SW9hIgrs8RZnYS/pHC4VH
         C/++h56OUmzOBEUTY/1ankaX7BbU2/D6UDESuNwqEb7iRt1Zb6eeQBk+ej9UIAperpWl
         FRCBzdOx970OlOldvsz4iklkFKw9kSM3tYCGWcHviwOK+nIzDYR0G9CbjCO3gfJjB5/j
         LWQePRuqzutMf+6v2Vxvh/b3odAbGuNtXsk1BQqBiMBhQHJs12L5PZY5krp7n7KP5lYr
         lzzRJEMsyIgUB4ib0j/XWGxSHmCOrlUVsOKq44mShlHkf0dw9LgkbWr0tYvZLpb0g+kY
         +8Hw==
X-Gm-Message-State: AOJu0YzKyh5fe0MNlzhpjW3IAzrez6+SWfxztq5bjXzo96gVJYk623kY
	AtcOlvw+P9DK73bPaHM79bALKIVP3FE9bKne4iVghELlrY3eqL42VPVz2r3L1qBxBXV18exW3RX
	ACwqxvxQ=
X-Gm-Gg: ATEYQzxfZraGLE0YvMW6FFEwdM0/2EAiKQa8V70vyFb1eha+E2clTGSmPiKOjSCRWVF
	0Wza1X/1AOdMJSK4MwBEjf8u61laFKeDgDvD3ZEDe9ZndHKtyaEMPwQEo0OFBBic82MBQmqSS5t
	IFlkADQJfJoF7nU1zYpwpb93Nd1uFRE04GAkbgnNAORlMMibBKWjzojAKg6V9Yt3o/ZJ6zrt0dz
	uFWLwKYpyMaty1wC4cp7+3V29PDMiZzTNJga4CjYFEVtx+ksIC9DnPv+hPeYRGxAu/7DAJ/7WaS
	yVAXpvyUppOcpDwymLP7FH8VMicIXJFhYhiRA6tV2LXmD76RA+bYpugfBbx1gjuMjAshYHOzOay
	ItKuAkVMQNeiMrNScmDSuDd5uKazZcml0Zna+vJfJpf68GrtHkbkvt7MCT0lFTfyVMytgpR73Ki
	a3GbMiuZZdHAJ5c3zxQjsMo6/IgjNunl6ZCi8=
X-Received: by 2002:a05:600c:64ce:b0:485:3b34:2f62 with SMTP id 5b1f17b1804b1-485566d0c13mr179051155e9.14.1773623577560;
        Sun, 15 Mar 2026 18:12:57 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.190.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aba60esm560918225e9.5.2026.03.15.18.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:12:57 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 16 Mar 2026 01:12:49 +0000
Subject: [PATCH v2 07/11] arm64: dts: qcom: x1e80100-t14s: Add on ov02c10
 RGB sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-x1e-camss-csi2-phy-dtsi-v2-7-859f3fa55790@linaro.org>
References: <20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org>
In-Reply-To: <20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2595;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=PZliYhJiPFyZNkAm4JLciiLWwJQT5YMK35xTkwdH/J0=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpt1kZAHyFAJBsBkBf5bJH+Lfcr0/O2oR339fwc
 Jbs73qhBgiJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCabdZGQAKCRAicTuzoY3I
 OtqeEACz17TlvsnTw0kZeumBOcA2t4yhkjFoThQ00c9zEADWuewyOuIu2O0sAZpqUv4273/P72e
 /gL5CPHkUjA5uUN1VSSRDB9PkkYm1SIB5v03yCIJHIDWZK/Ocq58Ps3hjOg/5rW7VJQkky49liK
 NmLD7nImlPgoskVaNe5XQhqTRYJIWzg85DUXhTiSWBLXotzYHDkK+5XFiJe8K8r1ImmpAH7dYoi
 rBo3Iw0PWcQWLP+/Xk4OZ7LsmrdNEkzRqavhfNz/n5Y/oJC5OPVpHNWO3Wityvu2JyKZFhimbNK
 Lgcfv2cPM/izSNa8s8y1W1pBFJqb/FlEEzHDtFG8/MAvfmRFCZmKahqiDKLCh/xAzGUq8LK6RXB
 PWkpuUUIvXpHZRuUj7wRXXmurGy/nBELSGfcuyeYAeVHhsKzeDQrfDB5IOG5Hb3oGgPig/xWJ/d
 9b31DBNbxHOaM5i+5u2FifjrP+eOy9oYZUGItFCmxsX5t/7chTDvvEkdCU3+IeC1/aqylfY0Nh2
 CYcr4bCN56MHiSKy90pZLjC8/8UQZpNLLInz+VSDJWM7Ha4LtEC1S83JoElaSlvKmV7s+rPEcq8
 4WKd3PKv9vplYj7PdQ9XBL5atzz1h+o1XEMWXJ3mlR9VvzAUBIKYDn5xiT+zti0n2danVV43JPH
 FszFGdbF/SdvhRw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-97764-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid,0.0.0.0:email,0.0.0.36:email]
X-Rspamd-Queue-Id: 89B93293574
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Switch on the ov02c10 RGB sensor on CSIPHY4.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index ee49785c9d005..54bf21f1c6f37 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -866,6 +867,66 @@ vreg_l7m_2p8: ldo7 {
 
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
+			camss_csiphy4_inep0: endpoint@0 {
+				clock-lanes = <7>;
+				data-lanes = <0 1>;
+				remote-endpoint = <&ov02c10_ep>;
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
+				remote-endpoint = <&camss_csiphy4_inep0>;
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
+};
+
 &gpu {
 	status = "okay";
 };
@@ -1447,6 +1508,22 @@ &tlmm {
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
2.52.0


