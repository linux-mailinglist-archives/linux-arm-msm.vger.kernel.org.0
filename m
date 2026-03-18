Return-Path: <linux-arm-msm+bounces-98563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UL+9LV8Zu2k+fAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98563-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 22:30:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B382C3048
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 22:30:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56D3B314054A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 21:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F45A37DEA6;
	Wed, 18 Mar 2026 21:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kib00goj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0832B37C0FB;
	Wed, 18 Mar 2026 21:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773869335; cv=none; b=oiOVDy10ZnEnEFsbyrlyhOqhcI1XNEWM0hPTXxHdljqJzWa8JWf36m7Sn8TE+/h3dv0tdGqzw2yfHrMJWyzIzjyGLh8Zv/mUwzI8MrBF1aIUDJfPfY7C5AX6g2cX/dTfPK80bevmoTcaabLTyC3qU5F50orNS2iCrfT/gFlECL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773869335; c=relaxed/simple;
	bh=LEYCKvkqlgwoCFsNZ7u3xqphDishUtnkTNhYolaId+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uBlrhXmzEDrS9zFCKGzTJq8e6e+61/KqBsuimeds00F9+HIeJsycR7s9GuzMAaQbcJfSxLC3YFAY4S/dqfXM6AOKxC0O8RrHNAyEZIokNxlchuTjZQ3zqwclkMWpPttquXNKgK+zN+y8loKGgFlU0DCUj2kXAXr9USNjTN4hp0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kib00goj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6E69C4AF11;
	Wed, 18 Mar 2026 21:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773869334;
	bh=LEYCKvkqlgwoCFsNZ7u3xqphDishUtnkTNhYolaId+U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kib00gojxbXICfcY1aWvP9rQegRv/LvEWxH4RhtE1VI5sMj+fs2hJW6J3w+ewm3ud
	 HcRK+P424tvXjts/ePdqlO4eBcUGXp8lQhNhzMAy0tIwJFsJCKgE3+dcysyvBslxR4
	 2TISnj5bYw6BHpHnOGta8u1U6aLH9YADa4yCqzv3+gbtv35a+cZyTBOVryYojadI5q
	 im9YTzCGcQDZLWiEN/hEx4KwTLpM6obo3l6jXoObvIiJKlxx/WP+TaTwdm7pDSOvL+
	 FzeNOuC0rEZUqazjZpFnFfDu0XmM2uGgbCHkmBr/xj94ZYkwDVFu2xK4RfkifbX48R
	 WWiqoXuR0tHug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C20E11077607;
	Wed, 18 Mar 2026 21:28:54 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Wed, 18 Mar 2026 23:28:11 +0100
Subject: [PATCH v2 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 display and GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-rimob-new-features-v2-3-c1bf8917449e@protonmail.com>
References: <20260318-rimob-new-features-v2-0-c1bf8917449e@protonmail.com>
In-Reply-To: <20260318-rimob-new-features-v2-0-c1bf8917449e@protonmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773872973; l=2395;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=Vap7bqI0+oz4nLYpdhUrwS7rdfe/Uug2Ert2VjNaemM=;
 b=zJ98Yvfwa53erhG82g+73/Zncaimyj6F0v5+yihc+LgdwdyJJckd/o6LH5A8M1K2ozRGcn3UF
 Ks1tRbqLE5tDzzfOl/AUOZmAnJ2CxhB49T7zpLQGGPiaFahhDdzL6VZ
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
Reply-To: cristian_ci@protonmail.com
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98563-lists,linux-arm-msm=lfdr.de,cristian_ci.protonmail.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email,protonmail.com:email,protonmail.com:replyto,protonmail.com:mid];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.sr.ht,protonmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[cristian_ci@protonmail.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.983];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 64B382C3048
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Cristian Cozzolino <cristian_ci@protonmail.com>

Add the description for the display panel found on this phone.
And with this done we can also enable the GPU and set the zap shader
firmware path.

Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
index ef4faf763132..de287c8e9686 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
@@ -78,6 +78,13 @@ vph_pwr: vph-pwr-regulator {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/msm8953/flipkart/rimob/a506_zap.mdt";
+};
 
 &hsusb_phy {
 	vdd-supply = <&pm8953_l3>;
@@ -87,11 +94,70 @@ &hsusb_phy {
 	status = "okay";
 };
 
+&ibb {
+	qcom,discharge-resistor-kohms = <32>;
+};
+
+&lab {
+	qcom,soft-start-us = <800>;
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm8953_s3>;
+	vddio-supply = <&pm8953_l6>;
+
+	status = "okay";
+
+	panel: panel@0 {
+		compatible = "novatek,nt35532";
+		reg = <0>;
+
+		backlight = <&pmi8950_wled>;
+		reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
+		avdd-supply = <&lab>;
+		avee-supply = <&ibb>;
+		vci-supply = <&pm8953_l17>;
+		vddi-supply = <&pm8953_l6>;
+
+		pinctrl-0 = <&panel_default>;
+		pinctrl-names = "default";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
+};
+
+&mdss_dsi0_phy {
+	vcca-supply = <&pm8953_l3>;
+
+	status = "okay";
+};
+
 &pm8953_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 	status = "okay";
 };
 
+&pmi8950_wled {
+	qcom,current-limit-microamp = <10000>;
+	qcom,num-strings = <3>;
+	qcom,ovp-millivolt = <29500>;
+
+	status = "okay";
+};
+
 &rpm_requests {
 	regulators {
 		compatible = "qcom,rpm-pm8953-regulators";
@@ -244,6 +310,14 @@ gpio_key_default: gpio-key-default-state {
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	panel_default: panel-default-state {
+		pins = "gpio61";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+		output-high;
+	};
 };
 
 &usb3 {

-- 
2.53.0



