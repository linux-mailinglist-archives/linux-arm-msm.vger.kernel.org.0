Return-Path: <linux-arm-msm+bounces-101658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KDtMtXHz2lH0QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 15:59:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB4E394D2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 15:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 09102302EA6B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 13:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2FCE1A4F3C;
	Fri,  3 Apr 2026 13:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqEag+a7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F83B390208;
	Fri,  3 Apr 2026 13:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224734; cv=none; b=C5WIsiDMF9LJ7t2yFWXEgpGK5Ha820OROXWKA/qU3+fYlya3gVqecIs6Q8zR/XeMdz3Mnbmxh9l1NnPMzc4GB3RPV96pPk6VLCWW1zMMTEmni/aHZgDzlINBFUUrwEF7MSAltV/xnDJGzlvAM6nGtjO7il088twopsjqZHS01bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224734; c=relaxed/simple;
	bh=DciUjHAjvFv1b8FfzbJQv5+k8jscD06BSW5FFwRNwlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VLhJi00E+urKLUgJY70huZtKPtBMtgN+2sf4ICZA+CQ+4F25WLearAfMB6lNlN4qq9c5cvs4bQ91B+yLX6FFySDKLgciVCfn7kpD0X9JGWdzc2ZkyzcOjA+0mRei0pkEtWuYu4CHS6as4YQKXv/tMrHC7KBwHnSR/zRCIr0QwQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqEag+a7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A4D4C2BCB6;
	Fri,  3 Apr 2026 13:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775224734;
	bh=DciUjHAjvFv1b8FfzbJQv5+k8jscD06BSW5FFwRNwlc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lqEag+a7OFMtIG6Sp7lasEIfwge3mODE7/tDyD/dDLA2tmVaL/a1OsStjHGq7+soi
	 CJVGCu7Gc9wpz/1m6tz4QLdjNgNAV95iCwgT/6W6u/wtUIZCp6qPBcV6vr4J3YGoZW
	 lekE6zRcO58xzQJz28SbNbPMjk37fhqRj4nlGUfOVjz/Oh9326C2/lRXEExJIHoJXA
	 DzzJxYEW6W812HVMn4bZZWFx/FNE/V6DKdi1INMUXIppJOSIpAYO6lesTJAFfWDEvC
	 lL6v/aPGL5fEdw6W1Mbk2ffvY0+yLrTMBuSau3+H+EHCqeLjpuVQY7zX7P1Vz7pdn7
	 U5lQrD5V2sOMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D78E85373;
	Fri,  3 Apr 2026 13:58:54 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 03 Apr 2026 15:58:50 +0200
Subject: [PATCH v3 5/5] arm64: dts: qcom: sdm845-google-common: Enable NFC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-oneplus-nfc-v3-5-fbdce57d63c1@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1608; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=GYUicW68fG/miT4fpCJcJRDrwDdpD5Q04+imeBK0nmc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz8eb2K+Gwlr9QWsSM1v9oBdK1S2SAvB9/E4xL
 2LhhQW1i5+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/HmwAKCRBgAj/E00kg
 cq9HD/9AkeypBBRzR+ukT0gktwlzP53iCY0ZVU6vxr8NMrhKAt7MMJdejsJkaZMB8YJ0O34Rofl
 ehwKaU7Mkr7ht+lHkelAZr4lKt2KZtLFcn6vjf1YUEY/Kui3mQcuDkn+moJgZ9oHLnVKPyZNMi9
 Ol7aUjiMw4H70Me4CJLRXSWEhLsSypauGR2+7zhbbo8b9AzXkyNT23/kB262F1eShNlOIjTAlvS
 cvvdSGYfup2iYVLW52Q/WaDB/rgYLMrK7StwEJwbHoAYCbEd0/dariNnabqjgdGyaTI7eM7XMdx
 AvuAXrS9tcbYhJiGzltr9ZjAaWr4xUMyyCuvSoL4RcnkZPnbD71cA6QBYQy1/TXrNNw1qhNHn0t
 xy0jfblAyyAf3JQmq34W2pr9ke1xH7qqGBF42bieM1r06YMNntOWDKCxGlV4w314Zp1z8dFjfcL
 FFit9f4D0oRkf2QNNLWPSaowEtcyO4UYzRE6g98buIRNvFvUmmOtyFN3FWVKyD0hQBDWBnnbD87
 j92E5424S0J71SY2WHshTdWEra3LY4ekJK3TuxKj4y8lbgMv6vu46xcaoq1vMfoMTfKpqai6fAR
 BsKO2HSZYMAm8F2R3FLRlV3G0jJ7OLbwBOZV2owAl5WjVU/zoEN9ijbFmeVziddLGnK7fVb+o22
 td4aUNF0xxAcFdg==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101658-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: 6CB4E394D2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

Enable NFC controller NXP PN557.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index 6930066857768..b2dc0327dff85 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -391,6 +391,23 @@ &gpu_zap_shader {
 	firmware-name = "qcom/sdm845/Google/blueline/a630_zap.mbn";
 };
 
+&i2c3 {
+	status = "okay";
+
+	nfc@28 {
+		compatible = "nxp,pn557", "nxp,nxp-nci-i2c";
+		reg = <0x28>;
+
+		interrupts-extended = <&tlmm 63 IRQ_TYPE_EDGE_RISING>;
+
+		enable-gpios = <&tlmm 25 GPIO_ACTIVE_HIGH>;
+		firmware-gpios = <&tlmm 79 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&nfc_int_default &nfc_enable_default>;
+		pinctrl-names = "default";
+	};
+};
+
 &i2c12 {
 	/* Bottom spkr (right) CS35L36 @ 40 */
 
@@ -459,6 +476,20 @@ &tlmm {
 	gpio-reserved-ranges = < 0 4>, /* SPI (Intel MNH Pixel Visual Core) */
 			       <81 4>; /* SPI (most likely Fingerprint Cards FPC1075) */
 
+	nfc_int_default: nfc-int-default-state {
+		pins = "gpio63";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	nfc_enable_default: nfc-enable-default-state {
+		pins = "gpio25", "gpio79";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	touchscreen_reset: ts-reset-state {
 		pins = "gpio99";
 		function = "gpio";

-- 
2.53.0



