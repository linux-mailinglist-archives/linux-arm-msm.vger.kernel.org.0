Return-Path: <linux-arm-msm+bounces-101710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOOwGU30z2lI2AYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 19:09:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D19B0396D32
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 19:09:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 73C43303C811
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 17:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A845E3D649B;
	Fri,  3 Apr 2026 17:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lj5P/7sn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778333D5670;
	Fri,  3 Apr 2026 17:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775236118; cv=none; b=ehgdCJQ+mAk43OP1Oy5BakehhQL+7Al5EVlcTHxoQ2e8YdShUAs/sn1/g+BzNAnBW9VUThsmRHBPDt8+9nIcCcScHX6qVVYFGHgA1doGf+gZ6jiaFMvsh++MO6MM8E2DFon7FYFf6AUL2EcwtAOLfS4TPiLQcaGamh2316Q9H78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775236118; c=relaxed/simple;
	bh=TdrKbk/IAUXNS6Sk9zy9AdX94k46z6QijMe7AIc7bWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XxQqnmeQdkQEVBcSp41fq2Q+fMh0Hh6ViBLDckot+2AeXz0NtLg7lwSzqsD9fmke5fynUALLxEuXmwu1e8lcmD731zNqSqgPQmAviEjFMsB/Lo2tACtuA9ZPrKR8nmnt9W0zp7KLpDTtklgfTrdgw91TLhAo10jjKnIcY/Jnr24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lj5P/7sn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 519D7C4AF19;
	Fri,  3 Apr 2026 17:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775236118;
	bh=TdrKbk/IAUXNS6Sk9zy9AdX94k46z6QijMe7AIc7bWA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Lj5P/7snoFUsjral5txOxDHgw9vRFkIdWG6hA6XGpF/oNTs/Q7IFxbsYNMdwgXUrp
	 CLgtgGidd75uqZsFjOuaT2STcZsx3Xqm9KoD8UCcj1kEEeobnbtvxANsEMQokHeFDq
	 hEsw1IRvmER1lPC2SGDpoxC13QmvIj05Dd8Kup9GDAUR8zYicV+ar2bXiWtXxuCz9S
	 Z40F3Ku3ehs+kFjQr6bykCrC3zhbyaNwTDklkshawPnA7DjAXBtlPyNq0o3IxuZQ59
	 2auLFyKEoiQ6JKdHTopHFyHSDkVj5cnDg/my1jZd9KhFVa7deZYG4lD76f0G530UTl
	 5enlCA/qA8LfQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F77E85385;
	Fri,  3 Apr 2026 17:08:38 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 03 Apr 2026 19:08:40 +0200
Subject: [PATCH WIP v3 11/11] arm64: dts: qcom: sdm845-google: Add STM FTS
 touchscreen support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-stmfts5-v3-11-5da768cfd201@ixit.cz>
References: <20260403-stmfts5-v3-0-5da768cfd201@ixit.cz>
In-Reply-To: <20260403-stmfts5-v3-0-5da768cfd201@ixit.cz>
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
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1795; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=TQFq+PWyeQhZg/mK5NDBcGQfwDmMOnudDkXhMTWZo0k=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz/QQaX/GLHPgoCPSGD4vNqAN8c8Vp77YqqTST
 i8q9/7tueKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/0EAAKCRBgAj/E00kg
 cnt3EAC9+/iOdH/C6Es8Y3zt7BHJHf73YRjGK9TxmQWh0Se913LW/Ngdu9eFlAJWY68ZVPNjmVQ
 fz1LCUrEtsNRrP6s7heETZ+K/mqf/w2eUlTxqf1HET5boZNzsCktlhmZdoKCssdMlnv43oebS10
 I5Vk+JD8virH49O9TKrew6a+jI1giQqXSwSz3LfCGo0TaVTPYhmui1VI50ths7OddPmZ6HXHi3N
 XV4Gz2OWsBluDhNmPrCVBCwFXcjNolDz5jpeZcUEAlIczTmx0NdhGx+6djhB0HZ3We7WsbdyjL2
 6AGdgeIbfDwb/Wkx5YjSFgk+3fb+aqDi1DCobwtW12vOmp4E1LUNq8Vn2Cu8k8Jvpd5HccMpjDK
 Yk1r5QGsPcrwnH/9LX69W+5nT74tYVGtULwB8Rkd5q9E0QFp0XST3zfBGdT+RwuJL7PhHuGMh6U
 O1vX5VOfABaqlEAVllwLw06IcmAUPhtO229992eu/kc3i5RAdybgdklByl4cMq8qTwdcuCB3kbB
 DC1Fj6lCVj5NJ27yaa4GiQ0ZlfC1/cHmBYNhnk+9oAe12lDGa0YoZruthb6uyZMSbDb2qgeEqY/
 zurHwlr0x55LAv4y5pM00T9QB3Rc+fGWK4RJoWy+zJLIyrQwKTaDeZxf3LtdeO6ZKtpbf5D7zvD
 iYVCEiUAlCVnGyg==
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
	TAGGED_FROM(0.00)[bounces-101710-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,kernel.org,ixit.cz];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.0.49:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:email,ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D19B0396D32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Petr Hodina <petr.hodina@protonmail.com>

Basic touchscreen connected to second i2c bus.

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
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



