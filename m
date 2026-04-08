Return-Path: <linux-arm-msm+bounces-102375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FGROarT1mkpJAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 00:16:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A649B3C45BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 00:16:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 54B0D30233DF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 22:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243EC3A75A6;
	Wed,  8 Apr 2026 22:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kiS7skWT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750F33A4524;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775686551; cv=none; b=YnEsDMjs+zRBuMaDs2nqP/ShB5XreLc9IscqsNGtoMrkE1Yczk7Z43n1RsA7IC4+/1jgp3Ar3Bium0Kapb35w3UgRpLlEAXoCdfU6jtS8g0KjC7ONA9h8ZCPcwgkJ9J/cCp3eavZvC0vKMCpUFLh/tjx4G7mPPR+mf47/k7Kd3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775686551; c=relaxed/simple;
	bh=kHakWtc7I/4KMZNxyXdf4ZZNQ6CPJJ3HAz/w/Rhm82s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eOSj4vGk8xXHqxdMRD40LoTRLaos0D2Sq00YW/ZoH7SjXtlkM2/oJ0dKMKBEm92bm6bRBAZ632qDKG9hU0GuFigiRQJs336g08H1bYXwsKKsHFOp/X+eOlOXHiIQdPVUJndIxIIWEfWgrDCX0+sGViY2sdIJJJUUsTLzGT/xgGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kiS7skWT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50842C19421;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775686551;
	bh=kHakWtc7I/4KMZNxyXdf4ZZNQ6CPJJ3HAz/w/Rhm82s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kiS7skWTNXTLnFDt5YrRaai+6DODIhvjR5X7zhUCsOePFByb0p8CQrwuJ0X3qUUhE
	 rb0XwpCbi/avsNQ3hCv4HW7CmdWM2QokjMnIRyKTfK//S2kqoWqh8uSvlI//SgvbNt
	 Ui6keRgohDd/3pd2QDPTyC70ZtICYR/yhjuFtc4Kh0JDA4/aEYRtudVMPsWGIVeElS
	 STWW+Zkpy115UsYLfHzlsKrHaxXOjWJ3sEk5ayitbQb23/J1kwYB83st1YQDn0lXuQ
	 RISAMdzNhdWdLNUKk8qQCJLDE7dA74PZ0kaLpFHym5odD1GZ1sRoTaadhHCfWHs8ql
	 0OdUwDB7reFRA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4525510FC45F;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 09 Apr 2026 00:15:54 +0200
Subject: [PATCH v4 11/11] arm64: dts: qcom: sdm845-google: Add STM FTS
 touchscreen support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-stmfts5-v4-11-64fe62027db5@ixit.cz>
References: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
In-Reply-To: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1856; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=7SvlmHIP51I6dk+k6+tvNP3/MABqkfu3zdnv9py6gtI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp1tOSbkFU6aEYu1WSXcSny3Bib98zFWA+1DYun
 thcrml6diuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadbTkgAKCRBgAj/E00kg
 coutD/0XMKWSj++FRSkStRFByRa+K5bf/KenIGUw9yS6Emc+5dhSrjiUP+MpBY961IreoJ7GvfA
 2vv1TiTcJsZ65jxJpzQ0Dz0w4G9hoWi8V1iEGA6t7yFRB89rDaFcn4n7ORsObw2oPZz0tn59Gjy
 ayEx4qzSg2gXL6/h0DP1uUGrt+jgj0CWgd+wk0sRhgK1igWwfNwndn3Om+ZUClgSJPyAStUHSvS
 vCT0K3LrxFviAxkQXgNEVhg0WizdwahTXTwcSicUqPHBlXncNhhY2tvBFZb3xyRL+5zo4/XUkdf
 wZS6EBXa67Y7GnaUdBBbQNyDwsFryaOZQbWr6g17LR5z/igz1xeDIu5Fal6KQW5hDiM4XoWD2bT
 EtTpeSWcSGQc9zB/mroFJkiO0HiMWA06AmRYFR/6uUdUstqeaxoa18VTfps7musntig5wbFXYN2
 2VWIWJAxALeJV+3HC/x5qWlG8dpret/2INQuh/DwxaLunH4DidZOUwRPlfiTtxxTwgoIH7YnXIq
 B1FKqjLUQn2b0VwY6t3G7Coj7i2FmbcNGK8Svd4EGsdS8mTf/SK4vYqGQFTE0q2AoD/2x978zi7
 4s5zM8RcB2+W0VAnaOJaWVLV4eQhZIQ1meN7PGjQKlH7oDtcpkX+FcJOtG0wjoMbtrs4izGXKLm
 zqjJzSVm9qTBp5g==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102375-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,kernel.org,ixit.cz,oss.qualcomm.com];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,0.0.0.49:email,protonmail.com:email,ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A649B3C45BD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Petr Hodina <petr.hodina@protonmail.com>

Basic touchscreen connected to second i2c bus.

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts | 19 ++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi  |  2 +-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
index fa89be500fb85..8fb988130b551 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
@@ -26,7 +26,24 @@ &i2c2 {
 
 	status = "okay";
 
-	/* ST,FTS @ 49 */
+	touchscreen@49 {
+		compatible = "st,stmfts5";
+		reg = <0x49>;
+
+		pinctrl-0 = <&touchscreen_irq_n>, <&touchscreen_reset>;
+		pinctrl-names = "default";
+
+		interrupts-extended = <&tlmm 125 IRQ_TYPE_LEVEL_LOW>;
+
+		mode-switch-gpios = <&tlmm 136 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&vreg_l14a_1p8>;
+		vdd-supply = <&vreg_l19a_3p3>;
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <2160>;
+	};
 };
 
 &mdss_dsi0 {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index 6930066857768..4653c63ec26d2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -466,7 +466,7 @@ touchscreen_reset: ts-reset-state {
 		bias-pull-up;
 	};
 
-	touchscreen_pins: ts-pins-gpio-state {
+	touchscreen_irq_n: ts-irq-n-gpio-state {
 		pins = "gpio125";
 		function = "gpio";
 		drive-strength = <2>;

-- 
2.53.0



