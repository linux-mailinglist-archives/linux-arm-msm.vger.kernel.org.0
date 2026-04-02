Return-Path: <linux-arm-msm+bounces-101447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHGpGYIRzmmnkgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 08:49:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D47DF384B47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 08:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8A8B6305BFFC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 06:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5766387585;
	Thu,  2 Apr 2026 06:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="CTyY1XJa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5AC388370
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 06:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775111971; cv=none; b=uS9MGt7ulnxvwHXtDAiU/u/Hzqp8/4qOcskQYFVhpm8nHbZo47ZTK32v84PEl6/AodNcIMNYCOBL5f16lVJTbtiHdeTws/RVZDifA438rcvE/XP8VG/5J1QlEOWqM0AtUY1PoIQj/CrgDQ1rzEQV/NdbkH5RkK5mHBGFsaempEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775111971; c=relaxed/simple;
	bh=uWHcgiFkbhONdWjssKegkq1hYy0i+Ln+kxQjyB2htMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KTK5/neyOzfQF9B6ah6zmnXD7odkWmTkEysuA/dP7sQhL4HnZZGt11XfqnjLA0gcvXP2IR9aefnc8RGtDTaC8jj5QIbNeVLFera4gn4rpKrnMf8LVqOqgxLeM27Byx3uTr0hMpf1G47ThpMxitvaFHqD8Bf5COImjMNVBdWu/Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=CTyY1XJa; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1775111968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OzFYOId8jjWvpftRsZ/WZQmuRx94yEIGpXNni2Kndng=;
	b=CTyY1XJascUFpbQPuuOC6j79PziD/rNHWkHNRCKv7h5k4tF7JlbZ4DTqEhaMQWONiv/WPG
	unPsw9QlGZgx/oMuBvueRUL0DFWid9641/NSt085aGFGSFKQZ0g5TE0YPf0IJCvMSVPiPC
	LBA6+zRwCqJl3en9Rjfl5e+uQRSG2o2fbEj5mPPe1N2WS/iuYujA3ePXKgFzNQu+iL3DlI
	kCxbHammJCAkI1FTWekznheJHQUiWx38aQa1dIoPVhBvkz4rO2ujBzhdtvcUdHfD8ouzd/
	XExUDF8dX02ULJWcykDALKQmJ6qSXcsJ6U23RgWGE51NAQvvpBAGjRunRLNpYA==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Wed, 01 Apr 2026 23:38:37 -0700
Subject: [PATCH v8 10/15] arm64: dts: qcom: sdm845-lg-judyln: Add display
 panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-judyln-dts-v8-10-7677cfafbc78@postmarketos.org>
References: <20260401-judyln-dts-v8-0-7677cfafbc78@postmarketos.org>
In-Reply-To: <20260401-judyln-dts-v8-0-7677cfafbc78@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775111929; l=3358;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=uWHcgiFkbhONdWjssKegkq1hYy0i+Ln+kxQjyB2htMA=;
 b=PrkKf5hcmDbwieH8VDSvzc7rhXkiOZbfDj97LQwk9UqhNicFgRWeKXQNkTRhIGu1G5xHGXl+y
 ho751kN6nO7BNtnNO7FhbScRfGQL+qVMKYD4x76xVUm9X5Z7Y6MCVO4
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[postmarketos.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[postmarketos.org:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101447-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,tuta.io,gmail.com,postmarketos.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.5:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sajattack@postmarketos.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[postmarketos.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,9d400000:email,postmarketos.org:dkim,postmarketos.org:email,postmarketos.org:mid,qualcomm.com:email,tuta.io:email]
X-Rspamd-Queue-Id: D47DF384B47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Also include other supporting msm drm nodes, gpio and backlight

Co-developed-by: Amir Dahan <system64fumo@tuta.io>
Signed-off-by: Amir Dahan <system64fumo@tuta.io>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 13 +++--
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 68 +++++++++++++++++++++++++-
 2 files changed, 75 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 51cd930488a9..552d9719bede 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -450,10 +450,6 @@ &cdsp_pas {
 	status = "okay";
 };
 
-&dispcc {
-	status = "disabled";
-};
-
 &gcc {
 	protected-clocks = <GCC_QSPI_CORE_CLK>,
 			   <GCC_QSPI_CORE_CLK_SRC>,
@@ -525,6 +521,15 @@ led@5 {
 	};
 };
 
+&pmi8998_wled {
+	qcom,current-limit-microamp = <20000>;
+	qcom,ovp-millivolt = <29600>;
+	qcom,switching-freq = <800>;
+	qcom,num-strings = <3>;
+	qcom,cabc;
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index 2c024b32c00c..7948fe3dbaa2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -21,8 +21,6 @@ framebuffer@9d400000 {
 			height = <3120>;
 			stride = <(1440 * 4)>;
 			format = "a8r8g8b8";
-			lab-supply = <&lab>;
-			ibb-supply = <&ibb>;
 		};
 	};
 
@@ -71,6 +69,51 @@ &ipa {
 	firmware-name = "qcom/sdm845/LG/judyln/ipa_fws.mbn";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vdda_mipi_dsi0_1p2>;
+
+	status = "okay";
+
+	display_panel: panel@0 {
+		reg = <0>;
+		compatible = "lg,sw49410-lh609qh1", "lg,sw49410";
+
+		backlight = <&pmi8998_wled>;
+		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+		width-mm = <65>;
+		height-mm = <140>;
+
+		vsp-supply = <&lab>;
+		vsn-supply = <&ibb>;
+
+		pinctrl-0 = <&sde_dsi_active &sde_te_active_sleep>;
+		pinctrl-1 = <&sde_dsi_sleep &sde_te_active_sleep>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vdda_mipi_dsi0_pll>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
+	qcom,te-source = "mdp_vsync_e";
+};
+
 &ibb {
 	regulator-min-microvolt = <5500000>;
 	regulator-max-microvolt = <5500000>;
@@ -106,6 +149,27 @@ thinq_key_default: thinq-key-default-state {
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	sde_dsi_active: sde-dsi-active-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	sde_dsi_sleep: sde-dsi-sleep-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	sde_te_active_sleep: sde-te-active-sleep-state {
+		pins = "gpio10";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
 };
 
 &venus {

-- 
2.53.0


