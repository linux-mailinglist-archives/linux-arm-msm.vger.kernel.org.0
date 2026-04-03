Return-Path: <linux-arm-msm+bounces-101655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HuOCgTJz2lH0QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:04:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C147E394EDA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26C50307457F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 13:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15D233A9618;
	Fri,  3 Apr 2026 13:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kRHPsgjr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B5D3191BB;
	Fri,  3 Apr 2026 13:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224734; cv=none; b=lVXlYxm3JUxAs3MNE+77pnllL/a8M+kPnAHQYT5RAY8vHNdDBiiNq/L/bASftbopwIx2S1q04RYfCG249+cfHp0AQXS2ahaKKaugA8zPEA5xoW8HTDgsscaNsqGoodx5r4LaCcQJnhMGyvVlp+PECKpQYOqnct5dm8QfuQdymfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224734; c=relaxed/simple;
	bh=T/JHgdTM/dmwAldKXPlwExJ7LzH5O9sTly+8x2zWWRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S6bTLGUw1uXMxY07TvTLgWlvtEdOAR1yODx6/7rVuMJZ45d78vdXE69akhPgelGCUnrNMeccTMWmcLdJc3W2KJ7MjOB1q4JRzVKlW3pNK+6vZ6Fs1hrdZ1PubXXhcohEoTP9qEZxYgm9MD9feUGet6qbk9DhXI27yBVvJYIsVDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kRHPsgjr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E11C8C2BCB4;
	Fri,  3 Apr 2026 13:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775224734;
	bh=T/JHgdTM/dmwAldKXPlwExJ7LzH5O9sTly+8x2zWWRU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kRHPsgjrDu+GdVl3GIgKt0Nb24qSBGIm+NoXyJITnV8na3SFCwwJTDLIb8t0mJEwe
	 BJ1iTbk2i+BgrJpN6P14zJqK7qqC/jwfWeoahdPn/qtDmEfWAQRY0WehkQxUTgUU8V
	 4qY3Rwp7qC/ERkvc5Nd9WPf8iCAymUe2wiTuh6LVtdyTW0hm8rayorrdc5yTqCaA6f
	 TMkXYRcwvJEjBEc75zZYNe4wFGHMzXpADALOJAwGXLVzdg2wzC0cQlBYnY1VRkzPzX
	 m89fVV5Ng+Nim/p1ciOW04NWp3jFq9C1Js0Ai4mAxH0f/ZJYWnX+Ce7jOjPZc0DaG0
	 wGAkIHqKRQ8xQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A08E85371;
	Fri,  3 Apr 2026 13:58:53 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 03 Apr 2026 15:58:47 +0200
Subject: [PATCH v3 2/5] arm64: dts: qcom: sdm845-oneplus: Enable NFC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-oneplus-nfc-v3-2-fbdce57d63c1@ixit.cz>
References: <20260403-oneplus-nfc-v3-0-fbdce57d63c1@ixit.cz>
In-Reply-To: <20260403-oneplus-nfc-v3-0-fbdce57d63c1@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Martinz <amartinz@shift.eco>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Alexander Martinz <amartinz@shiftphones.com>
Cc: Petr Hodina <petr.hodina@protonmail.com>, 
 biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, oe-linux-nfc@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2115; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=XjHS4NuCx7fAMVlZG2ITyhuQL05ri2G40fQqssoq1r0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz8ebutw/eNqUEQTHgvd0Dgc/Yo9d5GISqlvQC
 Loj1cKUs1CJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/HmwAKCRBgAj/E00kg
 cpOhEACTMnYjl+0txKZmP0qO2F1r13eawzZ+jEy/BJACx7B28uNuVatro3naOMEtw8vf33HbTf2
 dCw1QiViihzBelNqdrJQaIYah5dnhWVIETf6eTJFC9geA0HEmUFkcVMwZfl0XF0YYJXTaDBBiv3
 kjbJSuPcUcbq9d4qJcCmbmkUv9NJinNs612MCwv8uOKHzMVEKTtwFTMmafh7n8Kljj269SBFiXA
 3zDxNHUgJ6KHpp4ARCugs64Cp+GJgOCznLmotaiMSJVG38Q/gq3g48URr5JCf8lOHT22Y1zkncT
 hCDfVhmK6jLkvvmylCuVDaxpo2lgDecfc/1T2vtkRpX0vj2x4E4fc0jtjSdazQGP2Qo2BmtQbH6
 uq4IVYe+CIt3Jv7WJk7Lx+DMBOUhG0xWpkXOXhkTDTQX7Goccqw+qj5p8GuKamuX2/mk9k4FKFO
 qutLfDko7CHqrOiciN1qg1qZk5xo3sJxP4JqmllAgbzyqXhUBJjzXUgijSLdTgBS3sbqyGIKbG8
 Q6i71mqxymUnrCvauu1PQNCVCaEPzU1OGmWcMHlhXRBBDFqlLsh2SsMYykug5rcFfLcol0e3fBv
 udNROSLEJRjVtNvqjZmjNgwGcI7uEMftRRTQw7hymIXyUDhj8HBMo6ZBh6+Ieu1G2+vGT/EasR7
 P0ges/E46aez6iA==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101655-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,gmail.com,vger.kernel.org,lists.linux.dev,kernel.org,ixit.cz];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: C147E394EDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

Enable NFC controller NXP PN553, which is part of the package NXP NQ330
(NFC + eSE).

Based on work of biemster <l.j.beemster@gmail.com>.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 6b7378cf4d493..f5a5f1fbc1fb6 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -464,6 +464,26 @@ &gpu_zap_shader {
 	firmware-name = "qcom/sdm845/OnePlus/enchilada/a630_zap.mbn";
 };
 
+&i2c3 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	nfc@28 {
+		compatible = "nxp,pn553", "nxp,nxp-nci-i2c";
+		reg = <0x28>;
+
+		interrupts-extended = <&tlmm 63 IRQ_TYPE_EDGE_RISING>;
+
+		enable-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
+		firmware-gpios = <&tlmm 62 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&nfc_default>;
+		pinctrl-1 = <&nfc_sleep>;
+		pinctrl-names = "default", "sleep";
+	};
+};
+
 &i2c10 {
 	status = "okay";
 	clock-frequency = <100000>;
@@ -674,6 +694,11 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&qup_i2c3_default {
+	drive-strength = <2>;
+	bias-disable;
+};
+
 &qup_i2c10_default {
 	drive-strength = <2>;
 	bias-disable;
@@ -1007,6 +1032,38 @@ speaker_default: speaker-default-state {
 		bias-pull-up;
 		output-high;
 	};
+
+	nfc_default: nfc-default-state {
+		enable-pins {
+			pins = "gpio12", "gpio62";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		int-pins {
+			pins = "gpio63";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	nfc_sleep: nfc-sleep-state {
+		enable-pins {
+			pins = "gpio12", "gpio62";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		int-pins {
+			pins = "gpio63";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
 };
 
 &venus {

-- 
2.53.0



