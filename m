Return-Path: <linux-arm-msm+bounces-99048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEPnDpz7v2m9CQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 15:24:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A65CE2E9A13
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 15:24:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1DF23300B86A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 14:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 570A2364021;
	Sun, 22 Mar 2026 14:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HYesviKm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE0D363C45;
	Sun, 22 Mar 2026 14:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774189462; cv=none; b=q4fcvLmuYzeb+oDPlMrGK+YgZOtPE6qchuii1mu/CsgldbXpqQkO7Gz0Z3G0Zo1Qotn7yqGed4FYxj0LsmHhNvODeTznmDuZU1TB3emFly79IN9gKu6ljSFruIP9iA/P7byEczxeiQHq7qf7UMKvi39xDUbLoWQVoAHegSS3Q6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774189462; c=relaxed/simple;
	bh=axxplOC87DoUDLEOGdxNehpQoMQRTWK9ZAGaD7Q1mDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pItceo5lZSpCQY1moaoLGPjYVPBdZx7W8aalxDnKgsxulxbG+bMGywmaR6JpyGpMWG9DWTNg93rJU2tyezWLhhwFn79Qg/EIWrc9TbtI1B/fR6ulqNUF2tMbBdfzTQHpeCYazGxwtxXtfRNzZwQgLUFj/SLYVAGGdjlEb/w7ZIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HYesviKm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA63FC2BCB2;
	Sun, 22 Mar 2026 14:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774189461;
	bh=axxplOC87DoUDLEOGdxNehpQoMQRTWK9ZAGaD7Q1mDw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HYesviKmTrLke/T7zWs2yD3iQz0zmlm4K1QgJzhv5Fm0+bIiWcsB1GFIMEH7H31a7
	 UZ7WMwP8DUsXS5hazSjgAZUGQmNlzOp7JgIunxoPrCzGa+cowUm7n0i45gQhH18EjD
	 t3uSC7Jz2jdPx/1CGaP4YFUfjcHjkrKgKciK8rAmKt9oeA5eiCpZSmynXJ0gOANnzk
	 SyHNRukOYoqqjUKSEH/9XQSYczkJBRLJte9MfyHPk/+VWhcsA8IL2NqUIkrcrUPzJn
	 s/a5ygzSfo7paZR+t+NEduDIRVnvmFeN3Z+1ZaSJM/dCOYxtQA+BdQtowNWwnosky2
	 2Miv4AReB97Ug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B35AFFC72AD;
	Sun, 22 Mar 2026 14:24:21 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 22 Mar 2026 15:24:19 +0100
Subject: [PATCH QUESTION 1/2] arm64: dts: qcom: sdm845-oneplus: Enable NFC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260322-oneplus-nfc-v1-1-5f22f544f0e2@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1590; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=B1C0GWCfqNHFWEdIAzeVJqcuVPnC+PV2R/DBk8wqZEA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpv/uUrj18m0kn1GKpoXoftxMYSLKQDCiSUyZY+
 HsoiCa3+16JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCab/7lAAKCRBgAj/E00kg
 chU0D/0S4ZkvpDlFswm/YVkPovbK0CMXvwEphCN1YnahYdU0y72Hjqf/YZRgK5RPET+22p7rzSE
 BWolE7URerc38MO7O9uxJso0yekaNLdr2TvN18V5tX4JmrMah7HdINoVzIcyqK0xWMa4Cg09Ywu
 6+WFqtEOj9l26Lj7Xc3pJqRUCGdGyqHdj7Ny5mogStApQmP72/z3SisOYHyTncx5DpvodRHkvX2
 WKIhsatNN73X/giocFL277Z+nMqa6YKZRyuEy24manxshZQNnOiMfbMqkQ/FoDFVljU6jv++sjP
 XLRuFE1nhxKGNczYVkkweA9eK4zMJHMmEHhIsJeGq0gUTx/UxVXtExstEdtjdLGJfWDJ84l5vEi
 LYNdltdZkXNzmG9LIgUufxBCjsKbH6/OAjM5kmrpJRLb2xcOe4hWbf5rwVPYWY8fcneCjujD5jl
 05tiAY8m3Up/Qy+4VyUSBlPQFPqR3wpfViywNxvyY80rFVzkLBBjTZX3HxHmFwFCYz0hCTak5h+
 G1eXk525aegw/PJ5rE15hVlpxVCIGEGIH6iyoTtCIMYHK9yBnqgZFm8qUJ+HP62Ofh+GghqKIOs
 2jbqCc2drFi88cRBooZx89gkjKL2zY1rMggDDerGkE0+e83CXavKHcGP1WdJhHP1w2gQRhDEpaw
 iGlXUjR4C5RCKlg==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99048-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: A65CE2E9A13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: biemster <l.j.beemster@gmail.com>

Definition of the NFC.

Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 5b121ea5520f5..34f476299b114 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -392,6 +392,26 @@ &gpu_zap_shader {
 	firmware-name = "qcom/sdm845/OnePlus/enchilada/a630_zap.mbn";
 };
 
+&i2c3 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	nfc@28 {
+		compatible = "nxp,nxp-nci-i2c";
+		reg = <0x28>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <63 IRQ_TYPE_EDGE_RISING>;
+
+		enable-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
+		firmware-gpios = <&tlmm 62 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&nfc_default>;
+		pinctrl-names = "default";
+	};
+};
+
 &i2c10 {
 	status = "okay";
 	clock-frequency = <100000>;
@@ -594,6 +614,11 @@ &qupv3_id_0 {
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
@@ -926,6 +951,13 @@ speaker_default: speaker-default-state {
 		bias-pull-up;
 		output-high;
 	};
+
+	nfc_default: nfc-default-state {
+		pins = "gpio12", "gpio62", "gpio63";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
 };
 
 &venus {

-- 
2.53.0



