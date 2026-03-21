Return-Path: <linux-arm-msm+bounces-99017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLXhDvG3vmkkYgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 16:23:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D39652E60A7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 16:23:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADE0F300E3AA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 15:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F19392C2D;
	Sat, 21 Mar 2026 15:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B2MdO8pk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6F1372B3C;
	Sat, 21 Mar 2026 15:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774106591; cv=none; b=EI/3Jhar1JgmSPDqgJ8SgpULB21HhVn4YBiQzqr2pYwDI8uEFO6m9Qqluo4ePB34ywalqS02pkdKjXcw0LMOq9YHONvYuI/OpJBBIGnwYgJU/cTPvzQ/hmi4DD/3cePliufPJFUhGXfyd5UrW70o5Bw0BuJShw4N+2ohc8G9NFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774106591; c=relaxed/simple;
	bh=GpDywJE4lv+WKaQwWmudJo8czmdfCXwQdG8fx5funFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U0TzkVv7LplXzo0xiD+YXbfeI9FQbndUzQwL9N4WGHKqc41UXgeF7E5H4YGYC+IFex4L6ITVQp3gurQMLOxbhIFBTeqg+NzvpOpewR9tOe+JjAj1dcl3B3RYsSUyEc2luaSKZVTi2eKlnDKR7QOlV43PGangK4kqxbJatPL9FYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B2MdO8pk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59D2FC2BCC4;
	Sat, 21 Mar 2026 15:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774106591;
	bh=GpDywJE4lv+WKaQwWmudJo8czmdfCXwQdG8fx5funFE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=B2MdO8pkpzpeoO7NfeyPtt9jWlDWs7V1aXpQieIXj3FMzy2nr6Slz+GftJ21FoLAJ
	 2/crOOVvUFzm87bhxS9CWcybScJCsBndXozViDGiMylUWY62TzF3A9gTpG/usui3s7
	 b9f9Aj/SW5+fD+G+kCzMKx7dV8Jd0BMbn/W/auIT6EdjT22rU72FXWjvbiEPX0rCC0
	 jQ62Z92UHU64QlzZNxnomY8HjU5+7AHWoWFAdNEpPe9mhQ+xxhw6ND/HJUiKy3c5S5
	 8HihOWGaBU08jok53xtQih7LKta0HEjxtfZFBWgoSYEyrk2el12JN0eKE3GDDKJ0jO
	 chlto1KemPIvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 507781094478;
	Sat, 21 Mar 2026 15:23:11 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Sat, 21 Mar 2026 17:23:22 +0100
Subject: [PATCH v3 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 display and GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260321-rimob-new-features-v3-3-d4b8ee867de7@protonmail.com>
References: <20260321-rimob-new-features-v3-0-d4b8ee867de7@protonmail.com>
In-Reply-To: <20260321-rimob-new-features-v3-0-d4b8ee867de7@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774110230; l=2395;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=VyUvBSXd0jNEXP9pnCsEQXXkOKHY91F/ZfnedxNcwXE=;
 b=kvU71w3QnZER8tVg+MaJZWGefcXQJ/RnYFCZYYFgv+W3f9k1qLjegzq2Sip1XJfT7zat2FS3Q
 SujGu+gDcU0Diyevzo20ysLzzUai7z/aADdBjdlspOl43amuoCPSar5
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
	TAGGED_FROM(0.00)[bounces-99017-lists,linux-arm-msm=lfdr.de,cristian_ci.protonmail.com];
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
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: D39652E60A7
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
index ef4faf763132..d07303a37b2c 100644
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
+	firmware-name = "qcom/msm8953/flipkart/rimob/a506_zap.mbn";
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



