Return-Path: <linux-arm-msm+bounces-99049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLE5Lp77v2m9CQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 15:24:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFCA2E9A1A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 15:24:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E62B300D62C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 14:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689DA36402A;
	Sun, 22 Mar 2026 14:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hcXcmrpP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22510363C49;
	Sun, 22 Mar 2026 14:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774189462; cv=none; b=gxQf+hjGpwEs7Csn79ljM76GgoVvUkJBNLpA3tfweZdOFeARphqfC35f0FEMQ3kQvLbtrGTaEsEZQlr1nh4YuYtQva12wWb8b7IU2fqsIcesnpckxcxBl6gepNvfC/rDu7e41/wS8QfRaP4Shlg9mBiQGJ2ySIou+afjJZjRw6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774189462; c=relaxed/simple;
	bh=XbUqrT7qss2bjTqlhu4hDVM7HCLgTM5ifxyigq2ux68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VvNybMn1L31zfbw0xaveFkeDF6Czgz3t21+jFDTGZSzffOYFoLoafBsLlNNuPaODverq8nc2La8Z1cX6WIlcqwtYkBpCXpZXRBY85cKXMgYEuR+p4B+Q0E5Ev6CEBtdNmjcDqVQeAPJojsri9y2RTUMbduj+gbfiXrI3TH3cRvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hcXcmrpP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD126C2BCB5;
	Sun, 22 Mar 2026 14:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774189461;
	bh=XbUqrT7qss2bjTqlhu4hDVM7HCLgTM5ifxyigq2ux68=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hcXcmrpP05MSLZE7pWiVF4+knrfygILa5n2u4r+giuWYP9GnhYAtnMdarlYABw6a7
	 lgOrj8l+01w8Vlsuyn7ZtMqm8lNRVUM1MAX0OoCJt2DNvZvT+bRNMgj2P0YQq/ssQ5
	 mw76pdDch9ur6uHXCPhndFgxZjxgKeABhsFxH4pv/K2tiZW+Plt9x/jlpp1otU+Q2m
	 c1xCc+E++H86dDPBHiAVKuZqtUcoONDLb4gd6UtIP6KX191cqURPCTKd/k4uwTLWgd
	 PwdCb58sgAf+km4Etrtpu162oHBExOTiX5Hef+AZomyyydbN3GUNfMARqDfwnT2Pr8
	 Dr+bphBKXmYIg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5606FC72C8;
	Sun, 22 Mar 2026 14:24:21 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 22 Mar 2026 15:24:20 +0100
Subject: [PATCH QUESTION 2/2] arm64: dts: qcom: sdm845-shift-axolotl:
 Enable NFC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260322-oneplus-nfc-v1-2-5f22f544f0e2@ixit.cz>
References: <20260322-oneplus-nfc-v1-0-5f22f544f0e2@ixit.cz>
In-Reply-To: <20260322-oneplus-nfc-v1-0-5f22f544f0e2@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, 
 biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, oe-linux-nfc@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1522; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=bg/8Mn64amhNeliB/CDjN88OEUAaoSKykTAgAGciekI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpv/uUH1GaubGxzAbpeIoZHLVihTMq2aub8E8R/
 HEKSiFPJvCJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCab/7lAAKCRBgAj/E00kg
 ciRmD/4ocnaCQSjo5z+kVKbzx56vvvy5UY4RX218IPBYHq7G+VUq2b5ofKiz3WvOb5kGXEbsJoi
 AJF7U8/PLvcEvOaylm8BOlLjBM5BQ0XsTRzIRKg9emYKmTpXgDjnfGijCzAhL6FdsEVbcwjp0bL
 NUDyy9p7ZN2cjA1HZJ0T0d6TuIrgDb5vTILZQ0lgL/f57A0lfudJkVoFF0dpDbLrjdpZgRfDqF1
 FWzKNN2SkFCDKj2J8tv4lGgu4XUnLPIGVHrhtx4Z/GtazO7owFj1j+fKC5CiNifsQFcbj0eV/Np
 BZ6HLiTrr/tQ2cKt+YN6MRIhMt8YGX7kJT3wzbkeVPf57QEznZK3RRRhB1nAQw4fX1s1l+zISgQ
 CASZl+kmtMO/1k89mVvgQVBr505ApP1ildlMeOJzmUlVI1ikWviKvogH2Nck81X6RTnBFRkUG+P
 PvNwfj00GgXktjexXgH41LTlijfDc7+AZFzeOYuHpJblsicWanHo0cUp2vEq3lK6LgBlj7m9pvT
 NdSryJeqI5B0gSd7Z4ziZAotDvKaGZXcOVx7Ngrhe4sW/UAtvqOAo2+R7/BaHBYTXYzUQHe05sG
 Rsf/6jVVUs8PeQq6NILxAEFVWhouE6xRjZUlib+y4+nyaTkoKbl5Sopp7GmTrgSPpC6WqJLlJDe
 2g7ekbKaDy4+wtw==
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
	TAGGED_FROM(0.00)[bounces-99049-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,gmail.com,vger.kernel.org,lists.linux.dev,ixit.cz];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	DBL_PROHIBIT(0.00)[0.0.0.28:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: 5BFCA2E9A1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

Definition of the NFC.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 33 +++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 51b041f91d3e2..bc336584c9fb9 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -431,6 +431,25 @@ &gpu_zap_shader {
 	firmware-name = "qcom/sdm845/SHIFT/axolotl/a630_zap.mbn";
 };
 
+&i2c3 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	nfc@28 {
+		compatible = "nxp,nq310", "nxp,nxp-nci-i2c";
+		reg = <0x28>;
+
+		interrupts-extended = <&tlmm 63 IRQ_TYPE_EDGE_RISING>;
+
+		enable-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
+		firmware-gpios = <&tlmm 62 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&nfc_int_default &nfc_enable_default>;
+		pinctrl-names = "default";
+	};
+};
+
 &i2c5 {
 	status = "okay";
 
@@ -609,6 +628,20 @@ &slpi_pas {
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <81 4>;
 
+	nfc_int_default: nfc-int-default-state {
+		pins = "gpio63";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	nfc_enable_default: nfc-enable-default-state {
+		pins = "gpio12", "gpio62";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 	sde_dsi_active: sde-dsi-active-state {
 		pins = "gpio6", "gpio11";
 		function = "gpio";

-- 
2.53.0



