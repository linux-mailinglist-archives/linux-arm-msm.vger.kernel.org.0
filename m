Return-Path: <linux-arm-msm+bounces-100979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKzQBquLy2kuIwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:54:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7803667E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 10:53:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B34630A35C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 08:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C16D83EBF14;
	Tue, 31 Mar 2026 08:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="minGfOkh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EB03EAC9F;
	Tue, 31 Mar 2026 08:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946808; cv=none; b=VTLtvkJGg3V5SQ0XCABgmRrhiUO7DrBTQuGsuYQ6+kkNBXYKZPWRmNWjlbWok1eqv2Qk7Hzaute8H8c1oaV2APU4hGUUS3QBNEd94zoUAV8qjUtJyxFoIvN82dP67DmpT1vIVutpHNCr8bo1GBk6sdr9fscD/cAQ7rH63KDFQto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946808; c=relaxed/simple;
	bh=2YlDhGN/bU/PSRMNbE96AWQ5T72iWW/Ex5jsIdupOI8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CIdMIsnP6oJHJUGi4ELTSmI02sOt++Ryh2FQUECN+Ysg7Stz+pg5XxoRmz91cy17FpseGWyzX1zRvpjzjFtachbvV+WHuTGhL8q2AugPq8GXfdZkIMENbVPlTgmbEz0veK7N0JK1pS9gcYCjRFjNJaDDXrJxiK91VmZyt3TwhmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=minGfOkh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62D17C2BCB6;
	Tue, 31 Mar 2026 08:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774946808;
	bh=2YlDhGN/bU/PSRMNbE96AWQ5T72iWW/Ex5jsIdupOI8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=minGfOkhzNRzGvGsOw6022hSAepm2q5jNTuyevVpnJokxLNyKP6pqBvwfZ3C7mut0
	 2gSYG1SUH0EaF0z8/jKQLytDXZYkmVh4OAnLDgy0roSwaVWvEj4VR0AfTBUT08dTRM
	 QmF6dZpxGS/EHR2CCfp+gwoXFDWzR9Fi92+sgcGSJdNl49bnzPycyqIlg4eQ9Mg9Rv
	 Jj7630QiOraEf/5cwroGmqv+uHuwd2K9pTshZ9jyMrrM3D6Nu4XnSlEpwzaNm9TlJA
	 l6fYIlwTqgfkRHBH5iJvtgXaYDEPKUkrT3nvwYxoRqemsiudyglHo4XDIPCqvm1v+L
	 t/Pgy08DDL1sQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C59FF60ED;
	Tue, 31 Mar 2026 08:46:48 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Tue, 31 Mar 2026 11:47:11 +0200
Subject: [PATCH v5 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 display and GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-rimob-new-features-v5-3-5fcf42a29c12@protonmail.com>
References: <20260331-rimob-new-features-v5-0-5fcf42a29c12@protonmail.com>
In-Reply-To: <20260331-rimob-new-features-v5-0-5fcf42a29c12@protonmail.com>
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
 Cristian Cozzolino <cristian_ci@protonmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774950461; l=2566;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=JuCU1pE0+0lvM8kuKiy/BFRbd08GXSc2r+jPT6oN2Xo=;
 b=4JGuLGGOMgYKwiy9qXf/TauOPCLDiBz5c9zfOlMbKAWhnO/R8W+FpSLwYpHHRwwS5Z2GUNfSn
 tXxrQzDvdgYBX3un4ct/H95p7sqQXjoT0rG5b5heNtG/k/2LKhd88iN
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100979-lists,linux-arm-msm=lfdr.de,cristian_ci.protonmail.com];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_REPLYTO(0.00)[protonmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	HAS_REPLYTO(0.00)[cristian_ci@protonmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.962];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.sr.ht,protonmail.com,oss.qualcomm.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email,qualcomm.com:email,protonmail.com:email,protonmail.com:replyto,protonmail.com:mid]
X-Rspamd-Queue-Id: ED7803667E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Cristian Cozzolino <cristian_ci@protonmail.com>

Add the description for the display panel found on this phone.
And with this done we can also enable the GPU and set the zap shader
firmware path.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
index ef4faf763132..5a9d71d1e466 100644
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
+		compatible = "flipkart,rimob-panel-nt35532-cs";
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
@@ -238,6 +304,13 @@ &sdhc_2 {
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <135 4>;
 
+	panel_default: panel-default-state {
+		pins = "gpio61";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
 	gpio_key_default: gpio-key-default-state {
 		pins = "gpio85";
 		function = "gpio";

-- 
2.53.0



