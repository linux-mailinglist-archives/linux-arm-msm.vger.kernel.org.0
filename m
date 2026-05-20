Return-Path: <linux-arm-msm+bounces-108857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLWUD17nDWqm4gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 18:54:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D57B35929E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 18:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1A703300382A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657C8368968;
	Wed, 20 May 2026 16:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a8SQRsSq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3715636308D;
	Wed, 20 May 2026 16:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779295242; cv=none; b=q+Bxj0Abx+rvMXeh0WITcwUueE+hNOu1103uCIBYgeVvuo/GGiXdF+OpPvLAwTNoRnlCdYcxBr0Wd1X5/5Y2GPL0FjsCIGAb15G8LiC9bnMgSPSfyFLaPFMj6amxLIUzeSZHjzRycXDYMTtpD2RQWHA6ta84Hn7AlcFf8qCXHsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779295242; c=relaxed/simple;
	bh=YSAgGtAysLQdvEtZOUqvngY7HjSlIE89xn3dXCz7xjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZjbOVarmwlk7hVrZSgw/aP4MeoUtnlZY2N9VzuuAuP0BoAzVJIbWcAkTXX+V4zp4alTqGUDEQPFQhuPDBk3y+D2ElvzD7M1IimnaSJGqmNee+PywfDXEIy+9oMQH2VRDNxzk25+kewvjZ9zxrX2/+53Of5CMqtDDGBTnYtHbw0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a8SQRsSq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE704C2BCF6;
	Wed, 20 May 2026 16:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779295241;
	bh=YSAgGtAysLQdvEtZOUqvngY7HjSlIE89xn3dXCz7xjA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=a8SQRsSqJuaqRw0Y7gAeXDBmjrYdvHs7DK6AQo+/mMUCkvQ8G5p8XcZoNDxYp/SlM
	 zqQW+FxiFoVAI4sNO6j3PD5fRMAZw2W8UlJRm6hmB91dpnaxRtG41075NGdfhCSs24
	 UWuTVXfb1zZScFwiUeq4o1k+Qnl4FkQVcVjoFxzqF8fDhplaxo1BjynxNgIWRJ9OJr
	 zpJ71XTSW67+6GaVfh/OFYVoUDqddvFX7yulnwMYx5AytA0276yzAqWUoSOIplcPbA
	 0y1snSQPjdiF4WB5i5BTYbM6ha0Sgwfg+l7xlQWiYG0DEkfogtvTTnjEqBuvWkQ9c3
	 Jb2saP6zHyxEQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A23CD5BAA;
	Wed, 20 May 2026 16:40:41 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Wed, 20 May 2026 18:40:06 +0200
Subject: [PATCH 02/11] arm64: dts: qcom: sc8280xp-arcata: Enable backlight
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260520-surface-sp9-5g-for-next-v1-2-9df52552bf87@gmail.com>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
In-Reply-To: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779295238; l=3493;
 i=jerome.debretagne@gmail.com; s=20260520; h=from:subject:message-id;
 bh=qcsZWoxgvAPoNCEU3iLxOiyoEaAbYrCyLBf3CtjwWsI=;
 b=pg6Ci5b4cO+EwOsQYRLjgYTLWy1eAa40DvuFHFVwe/4NIQi3pUQuOu86a9d3eA4CSrvGmoFHC
 v2RdHso2LUPAHPU8MgHtwkURigBe0K8SeN32HZCFnR6XjAwnsRTkO8T
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=3/JYhgYjGg5V9mlFxc0A0+pFiyjsuDB/TtDlNMId9fk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20260520
 with auth_id=785
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Reply-To: jerome.debretagne@gmail.com
X-Spamd-Result: default: False [1.93 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.59)[subject];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108857-lists,linux-arm-msm=lfdr.de,jerome.debretagne.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[chromium.org,linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,kernel.org,gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	HAS_REPLYTO(0.00)[jerome.debretagne@gmail.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.34.96:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,0.0.0.3:email]
X-Rspamd-Queue-Id: D57B35929E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jérôme de Bretagne <jerome.debretagne@gmail.com>

Add backlight nodes and enable backlight so that it can be controlled
with the corresponding buttons found on Surface Pro Type Cover keyboards.

The nodes are almost identical to the ones from the ThinkPad X13s with
a different enable GPIO for the vreg_edp_bl node.

The difference was found by looking at the output of /sys/kernel/debug/gpio
on the ThinkPad X13s to see the properties of its enable gpio9:

  gpiochip1: GPIOs 742-751, parent: platform/c440000.spmi:pmic@1:gpio@8800, c440000.spmi:pmic@1:gpio@8800:
   ...
   gpio9 : out  high normal  vin-1 pull-down 10uA              push-pull  medium  atest-1 dtest-0
   ...

The same gpio9 on the Surface Pro 9 5G has different properties:

  gpiochip0: 10 GPIOs, parent: platform/c440000.spmi:pmic@1:gpio@8800, c440000.spmi:pmic@1:gpio@8800:
   ...
   gpio9 : in   high normal  vin-1 pull-up 30uA                push-pull  low     atest-1 dtest-0
   ...

Looking for a match on the Surface Pro 9 5G pointed to this only one:

  gpiochip2: 10 GPIOs, parent: platform/c440000.spmi:pmic@3:gpio@8800, c440000.spmi:pmic@3:gpio@8800:
   ...
   gpio6 : out  high normal  vin-1 pull-down 10uA              push-pull  medium  atest-1 dtest-0
   ...

Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index f2b4470d4407fb5b6a3dbac8bc972c010c31bd06..14287092fb07ea15e527fd318f7ea2155448b26c 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -46,6 +46,16 @@ wcd938x: audio-codec {
 		#sound-dai-cells = <1>;
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pmc8280c_lpg 3 1000000>;
+		enable-gpios = <&pmc8280_1_gpios 8 GPIO_ACTIVE_HIGH>;
+		power-supply = <&vreg_edp_bl>;
+
+		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
+		pinctrl-names = "default";
+	};
+
 	pmic-glink {
 		compatible = "qcom,sc8280xp-pmic-glink", "qcom,pmic-glink";
 
@@ -127,6 +137,22 @@ pmic_glink_con1_sbu: endpoint {
 		};
 	};
 
+	vreg_edp_bl: regulator-edp-bl {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_EDP_BL";
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		gpio = <&pmc8280c_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_bl_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -553,6 +579,10 @@ &pcie4_phy {
 	status = "okay";
 };
 
+&pmc8280c_lpg {
+	status = "okay";
+};
+
 &pmk8280_pon_pwrkey {
 	status = "okay";
 };
@@ -853,6 +883,13 @@ &lpass_tlmm {
 	status = "okay";
 };
 
+&pmc8280_1_gpios {
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio8";
+		function = "normal";
+	};
+};
+
 &pmc8280_2_gpios {
 	wwan_sw_en: wwan-sw-en-state {
 		pins = "gpio1";
@@ -860,6 +897,18 @@ wwan_sw_en: wwan-sw-en-state {
 	};
 };
 
+&pmc8280c_gpios {
+	edp_bl_pwm: edp-bl-pwm-state {
+		pins = "gpio8";
+		function = "func1";
+	};
+
+	edp_bl_reg_en: edp-bl-reg-en-state {
+		pins = "gpio6";
+		function = "normal";
+	};
+};
+
 &pmr735a_gpios {
 	hastings_reg_en: hastings-reg-en-state {
 		pins = "gpio1";

-- 
2.47.3



