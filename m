Return-Path: <linux-arm-msm+bounces-84190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 457B4C9E8D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 10:44:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E912A349B40
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 09:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D827D2E8B66;
	Wed,  3 Dec 2025 09:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="qzsP2KCS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6BC2E7BC3;
	Wed,  3 Dec 2025 09:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764754954; cv=none; b=krN+6Zd0iNH+i8ZLYW27x1sTQaBDdkNOF/Cg4fiMjqAap/BQOkNhH4Jf/gM+Fp+mWVGFbNEcX4WbXSePYO/f4ns3joz55ZvaqxAAMMzIN7RYkP6oK0CBtwTww1D8gtghUZ9I1TGv5nqjrcp7TuXJcwOmIqwoyqSHITPyLIX1ok8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764754954; c=relaxed/simple;
	bh=hGs5mk3wS7eB8wrjEqb83Q81+KzHqZ6kPfc2j4lot3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gCBtAdXNNxeD+EPJzHwAB+8sM0WJ9FYKisNLo1oAJV6pueTHcOmn1SE74yGLbWfIVeyqLVqUikNxj9Fv0TNAMwsQ/K+6ajFTFbTF6qzttNWDbxHD8guep9IIrMrpol1GLMNq4bk+NHi71O56ZZxx8HNGj0EOHmt1sxhNMKVbQsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=qzsP2KCS; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764754949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jrrX4aiCZOuubgqCQfH1NQ/OBJj9gdlZ2FUPCyJrdiM=;
	b=qzsP2KCSKUpfMRmjVdE1IVWbv1P3Vp++4jatDOw6XIx85oQ5Y21NUdkY5o7Jf+vOadIXMB
	fHyceTiP/q3oJj312jrG0/qCbyjFSXDuLEE9cdPRBrnZNwDiIIkto+lTa2tPYNay79i2UO
	QjdrHP8e9XDdtRKt6rDRLM1dmOXHNah0dISZ8atSF8a4Gpp4h+AMdCYtkuNWWpMTX6fBJD
	nfEAJE80WjxI5Boj4nOvDbooWdSN9D50bWgjCTjWA4JTZSCmqrd1iK8zRtt7kWO6ISzMnq
	QZd6M38RNA5Kw4OON7JUnCC9jTPaUyFtSfwVUyRc9736CVFndyugmUVIQGRLqw==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Wed, 03 Dec 2025 01:40:55 -0800
Subject: [PATCH v5 06/12] arm64: dts: qcom: sdm845-lg-judyln: Add firmware
 nodes, change path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-judyln-dts-v5-6-80c1ffca8487@postmarketos.org>
References: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
In-Reply-To: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764754921; l=2633;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=hGs5mk3wS7eB8wrjEqb83Q81+KzHqZ6kPfc2j4lot3U=;
 b=pz8B5W6GEU2+zpqUZJAlKUhqgJpvVDWRSeWYQYNir/0NWXE5nTqt4sKR2qnYQyjNawNS90tQP
 qrKLWLxa8/gDA1/UcoajydYe+MASuEmNevf5vi8GeSJH3IBHbWWPFeS
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Add paths for Qualcomm firmware, including:
ipa, modem, bluetooth, venus, gpu

Enable adsp and cdsp nodes since their firmware is present

GPU and bluetooth are confirmed working, others may need more
testing/fixes

But regardless they will need the firmware paths specified here
and firmware added upstream before they will work, so might as well
get started on it now.

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 10 ++++++++++
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 20 +++++++++++++++-----
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 50921af83a51..315fdc5dc392 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -162,6 +162,10 @@ &adsp_pas {
 	status = "okay";
 };
 
+&cdsp_pas {
+	status = "okay";
+};
+
 &apps_rsc {
 	regulators-0 {
 		compatible = "qcom,pm8998-rpmh-regulators";
@@ -464,6 +468,8 @@ &gpu {
 
 &ipa {
 	qcom,gsi-loader = "modem";
+	memory-region = <&ipa_fw_mem>;
+
 	status = "okay";
 };
 
@@ -663,3 +669,7 @@ &wifi {
 
 	qcom,snoc-host-cap-skip-quirk;
 };
+
+&venus {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index 506e6fe8e798..49d285c3e6b2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -35,7 +35,7 @@ battery: battery {
 };
 
 &adsp_pas {
-	firmware-name = "qcom/sdm845/judyln/adsp.mbn";
+	firmware-name = "qcom/sdm845/lg/judyln/adsp.mbn";
 };
 
 &bluetooth {
@@ -47,11 +47,17 @@ &bluetooth {
 };
 
 &cdsp_pas {
-	firmware-name = "qcom/sdm845/judyln/cdsp.mbn";
+	firmware-name = "qcom/sdm845/lg/judyln/cdsp.mbn";
 };
 
-&gpu_zap_shader {
-	firmware-name = "qcom/sdm845/judyln/a630_zap.mbn";
+&gpu {
+	zap-shader {
+		firmware-name = "qcom/sdm845/lg/judyln/a630_zap.mbn";
+	};
+};
+
+&ipa {
+	firmware-name = "qcom/sdm845/lg/judyln/ipa_fws.mbn";
 };
 
 &mdss {
@@ -96,7 +102,7 @@ &mdss_dsi0_out {
 };
 
 &mss_pil {
-	firmware-name = "qcom/sdm845/judyln/mba.mbn", "qcom/sdm845/judyln/modem.mbn";
+	firmware-name = "qcom/sdm845/lg/judyln/mba.mbn", "qcom/sdm845/lg/judyln/modem.mbn";
 };
 
 &pmi8998_charger {
@@ -135,3 +141,7 @@ sde_te_active_sleep: sde-te-active-sleep-state {
 		bias-pull-down;
 	};
 };
+
+&venus {
+	firmware-name = "qcom/sdm845/lg/judyln/venus.mbn";
+};

-- 
2.52.0


