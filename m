Return-Path: <linux-arm-msm+bounces-97765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALNzFZlZt2nwQAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:15:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F18D729357B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:15:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1BF13040A99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 01:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEFA8238C3B;
	Mon, 16 Mar 2026 01:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p2cm25iq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6238A1C6FF5
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 01:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773623583; cv=none; b=dL3cBxEM7+hZLQEFLjRmKz7ljT0x83jVdpbAfGErbiHROovqBNIwWcCiYItA3ggMZGRlmacGDzyVC/LHxjjwE6iWLuDpKcJesSFbxd+sE6OZh8bamry4WtIAzxwwOOA81ifdakNMEcZl8f1/x/CWJHMTPxZdz8g8CO7GV13dzew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773623583; c=relaxed/simple;
	bh=3nVSYJBG/RHwLpzJ3jy8WUI63ecwZdGLAVBwNBEWi1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qNYu195QzUkIPutnoVRZgHpLoYXza9POO7dB6vHmNKJPw39clGKwvD5gwgbWkoLKubwJDyHoDqRIyo/jAj/B9LIyV3sqyArci6l2HvG6tR+dHT/x1mha/lksG3qmbf7rCTDW4DVS8hTMo2LSes8+OsCX/WAaqCL7y42+V134IBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p2cm25iq; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48539d21b76so27804935e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 18:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773623576; x=1774228376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQHvQSUZFEo8KyeR/vWOplBdKKbajrVoCBMz2zzdolM=;
        b=p2cm25iqf45kFk7tZ6GNdT/0YaVKTRAw9cW4jfdnp1i/5MJ2YmKv2g/MJ3wfRJYT1v
         9q/R9vZbFe46CX3yXtw6oYvrpFipsSIZ3DldlYhSyVwQPGLaR07MKiAmIT8xNJo8tYvl
         5yduhPVnpxSadyfkHMLUbagfzADvjSuf+MSgdx1ToB6sik6Ur0pOizXkF7deVtx3rW92
         9D7VWpWYflYv2HPP2Lv7y3Hxo1LtbbzyrkBE8AueeRVE1U9T+2axp9ZNmylRHY2Fs3R6
         YIFLRkhxobtgoIN71CFRf3HRtC/k8BU9EjHkW41hsBUHklG+jH1/w7x9D3tWE48dM/PD
         vuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773623576; x=1774228376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dQHvQSUZFEo8KyeR/vWOplBdKKbajrVoCBMz2zzdolM=;
        b=RzBC1c0iWIWNyWtRF33dnoiGoX+KMIyQh9fOqBP0Hh911q/Mj1mvnTsGe0w6S1Igt7
         MjNQA+JTzpxFm9lkVk+mX8tqhi4CY7HlRti0DdPLiKYrbbVqOuH6DTlm0pG0boBul994
         5lhSeG44kuvakgG2OewWIKkr6fJ6dCWdjJjit13BqZHp0S7gK0ZRlMyfgBAa4MDoDpWr
         GpXEx8gaApSuwf5EUJQpdMHbJkARBtUUbmpA0NjJWcvwebeare890Rkrm+D6y1ldR6yK
         JWbzzgFr1A6en7LSaMYQhJ+sTqY34UqHx0Rsb3YUp4Dzq4cEYi4Gbkab+RF6+76eygj6
         dlKw==
X-Gm-Message-State: AOJu0YyufG6hqpGfGMenmblGZxuNK6RniUbqEEt8on7DfJ2wEStby/42
	4UZuGjFR7N9XEg7DuWe+cynjFWoG4x2b3e7JQjnvwMCh++mh1u7EUg9BvQfIpNN3i3c=
X-Gm-Gg: ATEYQzzseDsTOhGvpfL1vz43TTaH8LzLNv7YuskJAV+bmbm/FkNobD6CwxQBEGVlsnl
	JU4HejyCNKosoO7bPLL+BVlcpplAl6Hpuvhoavd8n4/0NvuYKT3mkFXhI6e6bxfuVDJ3YeiGjfh
	6YJfQAzahPcYbbiLuDyehFVrIo0f730oQx7Mlfe+mAtOYrD2pwSF4MuRuSHRQ5kEAqnOIzWk8eC
	pCvMrkAoYy0ogNzGBQdfUvT96SU+hA46D91S7z8J9J1/UWRhgZvL+zVwv5yahCN8tE2z3OCJKbK
	aMaAmIsuUHGs4qTWVDI4zGr9g1yTIIWdOQGDRO22Z5YXwlIB/niTcY08JR3PBn25x/UjE2oPYmp
	MjKNC28Xk9ARBzvDiCsUgXw1UM2v+8fVMuKvFn7ZNKAeFrzXd0Am9ezVTaxPxEaytemUwJw4tuh
	nhe+uHw9jqZgMhehvBYjbBqdNfFCJxYng/DQY=
X-Received: by 2002:a05:600c:4689:b0:477:9b35:3e49 with SMTP id 5b1f17b1804b1-485566cf80dmr182733895e9.3.1773623575813;
        Sun, 15 Mar 2026 18:12:55 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.190.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aba60esm560918225e9.5.2026.03.15.18.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:12:55 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 16 Mar 2026 01:12:47 +0000
Subject: [PATCH v2 05/11] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-x1e-camss-csi2-phy-dtsi-v2-5-859f3fa55790@linaro.org>
References: <20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org>
In-Reply-To: <20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2534;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=3nVSYJBG/RHwLpzJ3jy8WUI63ecwZdGLAVBwNBEWi1E=;
 b=kA0DAAoBInE7s6GNyDoByyZiAGm3WRmgFdPAxwGhrOelN12kjnnTusIyxGH9mP5lDV33mXFwj
 YkCMwQAAQoAHRYhBOaT+yqro23hF6tvtCJxO7Ohjcg6BQJpt1kZAAoJECJxO7Ohjcg6UhoQAIiN
 cVbyvOkSOzoOiM5HkHR9vpS4y+yRgciLSQJYXhVvbDXgtENypYxlbUeQoBSQWlxoRQ4G9ae4kuW
 uyRnFrR0b69SpNFVlt0a205JTbCJjj5XJQ5EDPs7ietHcpGDgday59LMUMBiA98pYU4sYIYCql/
 2AQmw/66JfT4/JRIJq61zZE4i5wrxcbpWPw750BQuiXOpvLdKQAsHMGUU2yhOkWA5DZhJKyLRol
 6pyMgL/ngbWIY7YO7E0K9oL7SB6TG2YWcMsWVxwf0wqBUsYSFH6GNCSLru7KKTJ1ZIQIUQ21xX1
 Xr7XVHAsTJ/1v4QO/+nXYtd0rq70YItigF6RwMVWVqXWIq6bcoqFlgBqO0tFzLfKeGtGWi/gcFO
 Bvp2xz1F6+rMpzLZqprbVrnYUCQW8GzsRzP+yjoe0mt6MnggLCJWmFs2cXBL5cukQPT5AN2PXT4
 4FTxIvpBUUpNcrrS7ET+iLbxfL5ZOohYoK4yTh87Sd9J9dD8BFD8kbesVTWD+bKnT+ZfdXOFPj6
 DmTj/3nkbb3MOm7l5lXafB4flj+cR7LGpqv87TE2l08Q2tH8V87PJa6LPL0WjVaRW5m5uNrzlDH
 c942RkwJCr3+/dH7Zz8ltfoXj5sf6GkGg4TNQMqIHw0hiuSso1hrPPUp8sK+mhOWpDZ9CwRytjo
 1kUXO
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
	TAGGED_FROM(0.00)[bounces-97765-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: F18D729357B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Define ov08x40 on cci1_i2c1. The RGB sensor appears on the AON CCI pins
connected to CSIPHY4 in four lane mode.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index c89f5ad0aed56..d47404c71b80b 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -901,6 +902,65 @@ &gpu {
 	status = "okay";
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
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&ov08x40_ep>;
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
+		compatible = "ovti,ov08x40";
+		reg = <0x36>;
+
+		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_rgb_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <0>; /* front facing */
+
+		avdd-supply = <&vreg_l7b_2p8>;
+		dovdd-supply = <&vreg_l3m_1p8>;
+
+		port {
+			ov08x40_ep: endpoint {
+				data-lanes = <1 2 3 4>;
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
 &i2c0 {
 	clock-frequency = <400000>;
 
@@ -1515,6 +1575,22 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
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
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.52.0


