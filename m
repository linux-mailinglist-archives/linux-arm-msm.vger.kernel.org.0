Return-Path: <linux-arm-msm+bounces-101656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NyrJPDIz2lH0QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:04:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 365EE394EB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:04:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C25D1307AFF5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 13:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD403AEF33;
	Fri,  3 Apr 2026 13:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mii2qDml"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6010037FF56;
	Fri,  3 Apr 2026 13:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224734; cv=none; b=DRoos/9OORO7gzXsM+HhdKleYd1wB3nfLahcGXuDNNk/+/ED2NHUYPTHW1FIFpJaaVx44mt2NWCgKfklkSLL+jp5QUFxubP4UvVWXkM0GTYu6BeLmiNHBi8K9aZhtL3ErfUQutY4VFWAIBrHHfBMP2NJK+RBl/IPRWn1RyLURq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224734; c=relaxed/simple;
	bh=rmJTbzK4IDzritBYdCx+sZj1Nkzl6sMVuKHMhZwu9Fc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dyXDZEd4rCxOJOb4vFSoHzC3hhdkoK1rX7ZQT0OCDRE5YLf7dsVgxLZ9LI/hRXO0MszatOWfvurbpUttvJbTcMvVCVyrPUGgWc7NvxJRC+sNMqL+/1I7slXzVBvSUstvW45dd2fhWEih5jqkM83kc7cGQSDpDIaI772Qgs+1axI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mii2qDml; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12D14C2BCB0;
	Fri,  3 Apr 2026 13:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775224734;
	bh=rmJTbzK4IDzritBYdCx+sZj1Nkzl6sMVuKHMhZwu9Fc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Mii2qDmlPyKDWEa+4VtTKGhv37BX3sGEXQJrDe1dPwAwBp3HJPgZooRffYX4GRLxk
	 KlaFxaq7dC3rP9qVYzuAIeHyJFIc5GVYQ3X/lyxWI5rrJbrwyZq+oc+sMQokgCdnwP
	 hhalHKQWY2XcGifElkhRfqcLVUkXgP/A5F0xAg019JviwtzGFTqOBCHtL2AKfzXx14
	 GmrDKBXFNAd5QtRH7ZUtmStPcPbtFbK0dcIaKzmut2QTecSiuy4uv9DTPjIxIcrtTg
	 /xLaY6fXc5F65hMP81l1fzDZ1IqvANRC8bxHt0GlU+aFHLvzMeP9dVNfOuxc/lYHYc
	 /RZBFTB0wK+pg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 093D3E85372;
	Fri,  3 Apr 2026 13:58:54 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 03 Apr 2026 15:58:49 +0200
Subject: [PATCH v3 4/5] arm64: dts: qcom: sdm845-shift-axolotl: Enable NFC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-oneplus-nfc-v3-4-fbdce57d63c1@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1823; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=s22pJ5rTEtiXwSmEEiYHretFehUi77jUBIFY7CCGWZE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz8eb82gH++yptm6T8ADjzBk2D5EZflA3/byGV
 1ebat1IbiiJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/HmwAKCRBgAj/E00kg
 ci5FD/kBnCx6eNjtESPBu0C549OsGknPfQK1othvKtMzd6Z+vLl/Z1Z3ugvieA/f9w+e5w22n8f
 ovkUW1jx7Y2+2y0w7wx6gcS6oO52HG2d4D8GlhrGUxJXXpd1/vxz1Mn3To2o0fP+DLutnQI/k4A
 /apctd1AaoXKSmx9IG7vw6eFIYTmH/K1i9/uDIP3ZX4034FPKcqBSyeqwyw3V1oUaLkAgjrTcJ6
 rw2zzAmdEq91c78pTFuc4Bx22pEOSmdfXRBlIuBDeSbdDytI+S+LuzMjbDA428128GouJVx9wwW
 N9Ifaq/f26mvwNNrN7EmpuS7+H/yvIcDv48hLxInxNPr3ftqx+gsOJ4LS/Sc5VOpjnOCTBePj1X
 Mnx0D4nEPxCIhYtxI+zMJidbAfs9kT1X6630r5r3YaPbPp7VI6+pWVzM1Mbu+kBv84BLWPy5Tl0
 xSmFawwM+RVYYY8BON5qh17SZtwGEAcX65xxC9uVXnmPyOsqKmv3wayxazSQlJErcXqxZ/SVoNp
 55L/qToeWFqvELDOyUFD3tnLMqNE/BCC4WwlyDWhriCP0u9Fv0usFeb28N5jXQKa7nNw3zgmV/L
 DGncZq8l8C9viTYjjxXPpbidGE6iGm/gIjPHEmDOqDuM6Y75vBbG6xKuecJ1zImeCIYM3KNptd9
 /f9WSc6bLIioWEg==
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
	TAGGED_FROM(0.00)[bounces-101656-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
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
X-Rspamd-Queue-Id: 365EE394EB6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

Enable NFC controller NXP PN553.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 52 +++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 783d66cf5b0f8..101597c666332 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -431,6 +431,26 @@ &gpu_zap_shader {
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
+		pinctrl-0 = <&nfc_default>;
+		pinctrl-1 = <&nfc_sleep>;
+		pinctrl-names = "default", "sleep";
+	};
+};
+
 &i2c5 {
 	status = "okay";
 
@@ -609,6 +629,38 @@ &slpi_pas {
 &tlmm {
 	gpio-reserved-ranges = <0 4>, <81 4>;
 
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
+
 	sde_dsi_active: sde-dsi-active-state {
 		pins = "gpio6", "gpio11";
 		function = "gpio";

-- 
2.53.0



