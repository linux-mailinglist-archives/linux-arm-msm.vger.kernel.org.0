Return-Path: <linux-arm-msm+bounces-99451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDmKDxDMwWlUWgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:26:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9081A2FEED6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:26:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32FBE30E054A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F7143845B9;
	Mon, 23 Mar 2026 23:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tghZFquP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593D137A494;
	Mon, 23 Mar 2026 23:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774308044; cv=none; b=Dr7VF+g3MF6Q//jOvpeHp1St6u/EVvU98p3qLBP6h6OJgACyvXkXb+ci67TM43npbGFQRbPyfQB/dlGS3Sp+UYsUmLWAJiT8RXdXEoSednmiwKe3PbjAVUGGDDOMJDHiKtgSi+Qvz1NyQ9yuTaKYBZqbRMNoy6cxD0l1khmIjKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774308044; c=relaxed/simple;
	bh=OVwxV/fjYZXYxoHCFwLNzvHpaocKjZfdtjHT3zAG/M8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b/lbXH1uVuLL90X85zMKR5R+PKtwa2vXEpZ/nTi1bnWFggCzBHVe17RnuDzvblCGEQtOxiM+XpxfbUf5AsWkOer6ecbhgHjKClo3p1HQ6pWwtG4Sz9aonpQTKWBRSZKTA7WxwL/PJVfXNGO3t/BZ+yH4IKywOjuh5C8kyCZlvvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tghZFquP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D4F7C2BCB5;
	Mon, 23 Mar 2026 23:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774308044;
	bh=OVwxV/fjYZXYxoHCFwLNzvHpaocKjZfdtjHT3zAG/M8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tghZFquP/r7Ob/IgJEmgQ9aF4UoAe0wGloP+QUrJj8WdaVeH0fNTaPgAZaxuO1TI0
	 HwsDkTJHj86ID5hxeTvQ55tXsGCQo8XPG3Af9oKqe2zCfhWQhYune/H9D4r+nD0VFw
	 1Amb3HcY7ePKc8++O5sLUksj/CPc1DAgGH5PfWCLzCXXlPlz7BPD3aSq0gcqhY+47/
	 BlCMokTi8roPOWzlQx/Y8RVvHN4bWskz1zqui0nyp4L+CTeboVmdVdqxTXjJtECeHH
	 CsuyZX1R26VgDS8i049/RKmXUZBjl7mYZCCgcGcD3Ym3Q1oYY+og255jzSjkfjAjzn
	 qJ/MKrX8jIFTA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0829BFC72D2;
	Mon, 23 Mar 2026 23:20:44 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 24 Mar 2026 00:20:40 +0100
Subject: [PATCH v2 2/2] arm64: dts: qcom: sdm845-shift-axolotl: Enable NFC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-oneplus-nfc-v2-2-3eef052c9bc6@ixit.cz>
References: <20260324-oneplus-nfc-v2-0-3eef052c9bc6@ixit.cz>
In-Reply-To: <20260324-oneplus-nfc-v2-0-3eef052c9bc6@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Martinz <amartinz@shift.eco>
Cc: Petr Hodina <petr.hodina@protonmail.com>, 
 biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, oe-linux-nfc@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1522; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=nWZzFQkA77a3+M7i1r6AFAsRI1+jPOUl0p3IE4kIYfk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpwcrK6dFijYi4UpbhBhIPecppSkhn2JMpk9UGQ
 xH38mse6uCJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCacHKygAKCRBgAj/E00kg
 cuLkEADOkzgA6n0vsqx13ZVeQgB6DOUm4GOMyzWTpPa6Sw8aZ7dCfRMTjOsUFjpKDU3goiBy2hq
 zD0I8cBagm+pIj6wq6iH+gGVK3k7Bm5enzHbRuCk/AB/ioaNCzZ5QmOqkZXHsSak0yCaAPvpRCt
 dWmGRWixFtXO1afuayonfgpLjs0OipDQKhLJyK6kAICqnlJzmr0wrfaYPb0JwJqQoZOZLX6Prgk
 D1wjE9chEodPGE7fBm156DLBhuMWANjyKdRYQ7zcfFSjuFqtpo4lg64n4LFQOtL6LeX05m+iOUD
 8bBWdgRVVdwaUWE3VAhd3hglghS/Ow/kiwTI2XG7RpayO44nb8o4hDdhmOc3DuOSrgZJkujfc8I
 jzZSd85OYJwKHNmAKA5Q1WlmAMCVMiSTj+ffbEe0SYOT878ZNAJVWA4dHypR1FSWPdarlv+4ZRF
 QhLbxLE6UzYYdOyBgQgIRYN88qj8U2dk2dcnN0kS9rCsfrdjq+DxAkTfyVu1WUKXFmclyehuIkO
 hurPRwdV94FsDJ+Wql/Muqb821HHL0LrF5a9/hOTOcVW/qWAnke3XAgpdTZfDjk1lyLTkd4yr9w
 OgYxadgfxP60sOkqbsc6PEmbkhti6jhcEn06PyZjzkObpFIXUO2ZiMCL60ZgAbyII5yKyJ/7yJP
 1JSNrk68YPRHT3g==
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99451-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,gmail.com,vger.kernel.org,lists.linux.dev,ixit.cz];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.28:email,ixit.cz:email,ixit.cz:replyto,ixit.cz:mid]
X-Rspamd-Queue-Id: 9081A2FEED6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

Definition of the NFC.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 33 +++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 51b041f91d3e2..eea63aa170b16 100644
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
+		compatible = "nxp,pn553", "nxp,nxp-nci-i2c";
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



