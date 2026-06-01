Return-Path: <linux-arm-msm+bounces-110644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCzIEO65HWoedQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 18:57:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC48622E5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 18:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5BCC330213AE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 16:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 475B13BAD82;
	Mon,  1 Jun 2026 16:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQqSFJ8w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC9D342CB3;
	Mon,  1 Jun 2026 16:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780332854; cv=none; b=cYeQCFbvEcXT5oEZb+R8VhPYdPrDfaYYTRIFwvpwaf12CDR0RpNpWQIfqCjx5FWkoAze3QJjRyTs7uGrTEcCBNgp1iHPfgXOxms8kgVhgv4yEj+6k+0KaV+3Axb/5+hgJbiu8qeovhOo0+1V7Wv9ImNifCrKlkwAlu2KJb8npFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780332854; c=relaxed/simple;
	bh=596dea2nPCiLRDoUWhfx8VMyQTnmcAwH3DY7g1uJKYI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SoLpHiScQKVXA2Harkl3BEqObVWIrIWz2w0gSDT3AsESHAauesBD3jN/gj+dCutu9CAabEHRkjAkFDPKGMyabkMbbZ9i2cczP4PDdZtmbPE44og8B7zrXrOCdOwYMpKnpUiuQA/px47jz4fVWvEMkGiu0qCeiZAkIBkdPy9KJIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQqSFJ8w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE72FC2BCF5;
	Mon,  1 Jun 2026 16:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780332853;
	bh=596dea2nPCiLRDoUWhfx8VMyQTnmcAwH3DY7g1uJKYI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BQqSFJ8wUY1oGCd042dKjXsxluAluxoSDXfibOET6fZ9tvG2r752Elhe4R/3XBR0+
	 Ydtp30Pwf75jtsVHtCoO/dvFUBBkqXurHXol55RCEqkrOmhXWYCdUvvxyFv5jRD8E4
	 uRvd5zDH2x0NTSjnbijnHAfaqwD1brG++0YZyxTniFwq0/sbL9FWW+LrEMDCdoLvLi
	 QCr8+uMCfLNiUih54sm+laGpeuqX4mQ9NvlIwBc39mcHVj9Ok+JJdSfxO+pwbehonc
	 Mgq+/xrd7pYnbvn2cpPGaC3Ah1S0q86apUPsnPkeQEI4EgX0ENTynr+G6yKj/8R/SA
	 KOoN0zUYJn9TQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF7ACD6E61;
	Mon,  1 Jun 2026 16:54:13 +0000 (UTC)
From: =?utf-8?q?Pablo_Correa_G=C3=B3mez_via_B4_Relay?= <devnull+pabloyoyoista.postmarketos.org@kernel.org>
Date: Mon, 01 Jun 2026 18:54:01 +0200
Subject: [PATCH v3 2/3] arm64: dts: qcom: sdm670: add debug uart soc node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260601-pabloyoyoista-debug-uart-on-rdacayan-next-v3-2-6fdcd669364e@postmarketos.org>
References: <20260601-pabloyoyoista-debug-uart-on-rdacayan-next-v3-0-6fdcd669364e@postmarketos.org>
In-Reply-To: <20260601-pabloyoyoista-debug-uart-on-rdacayan-next-v3-0-6fdcd669364e@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Pablo_Correa_G=C3=B3mez?= <pabloyoyoista@postmarketos.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1225;
 i=pabloyoyoista@postmarketos.org; h=from:subject:message-id;
 bh=JzKTYUEefOAcoUIPc27fvI4pDnEWLK8q2Pnup39DT4k=;
 b=owEBbQKS/ZANAwAKAXo0JWX/Y195AcsmYgBqHbk0idKve1dNITkXnG8/S7YicfHiY4hXiJlpn
 nnCE8/uvICJAjMEAAEKAB0WIQS9CheUSi6o/ykTCaJ6NCVl/2NfeQUCah25NAAKCRB6NCVl/2Nf
 ea7VD/9VKktIUQVqXohpZHaa8Nz7vFEow8oRae4KquiUJ+MvpBoitZ1fHJ2Y2kxGk5T0CuFwkFB
 dwkWN8rN2Mv54BFUE6oxb/rjTso6O0zyvIhJXL9R8zsONtjJM5540FpHs7bvNPHyLyxJnw+uMSe
 1abq2ZICiyDJ2VzxF6yxzhmpmQt9HHVmVUBfoe0fsAzafVQAJeSRkSq2y+kR9x7I2EyjWMXQZKp
 L5FUw1PXBnB8h3VdN+tKbXhIyyrZYpzT9WCAFXxxtRwbOvKYHqGgBZUNk2Ywni+3rL/kzNfCooR
 1xMyD26ZqCgMS2DaejyfvXr4FCL0H6SvTl/qUEx8vw0fGn1DfdU74Qb21JP+aDC8pJ6Uap8UdWQ
 XnQf7kDJ0Zs6zffYATgbDffTdTN8XIVHfVr5HvoZEk39sMbJs6BJO6JaZYSet+TzDFGlFlnp2vi
 mX1RThQd4kLjzzYhHLUsPaWoa3wT0MlFeTmpehhkqvO8taASD0UPvzLYvhHkpFxnARmTjyiWqu/
 9QBUjFoXvX6rcxNTW/krVRzQWrErMYYJpb66AXFxHNa4m0Ztk7k8dGETu+oUzWrRDpyoigCNECW
 CaZognqqtg5UvKf0mgUdPpztRoOctExGbdhmkC6RAJDKscRqIegh2Vci4rpr5fxdC8wJUBLwiyu
 gVCfK9YAb6v4Bgw==
X-Developer-Key: i=pabloyoyoista@postmarketos.org; a=openpgp;
 fpr=BD0A17944A2EA8FF291309A27A342565FF635F79
X-Endpoint-Received: by B4 Relay for pabloyoyoista@postmarketos.org/default
 with auth_id=698
X-Original-From: =?utf-8?q?Pablo_Correa_G=C3=B3mez?= <pabloyoyoista@postmarketos.org>
Reply-To: pabloyoyoista@postmarketos.org
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110644-lists,linux-arm-msm=lfdr.de,pabloyoyoista.postmarketos.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.sr.ht,postmarketos.org];
	TO_DN_SOME(0.00)[];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_REPLYTO(0.00)[pabloyoyoista@postmarketos.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,postmarketos.org:replyto,postmarketos.org:mid,postmarketos.org:email,a90000:email,a94000:email]
X-Rspamd-Queue-Id: 3DC48622E5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>

Values are taken from the other geni nodes

Signed-off-by: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 1c6c18a913a0..400d5d8ef9fa 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1060,6 +1060,21 @@ i2c12: i2c@a90000 {
 				status = "disabled";
 			};
 
+			uart12: serial@a90000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0 0x00a90000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart12_default>;
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SDM670_CX>;
+				interconnects = <&aggre2_noc MASTER_BLSP_2 0 &config_noc SLAVE_BLSP_2 0>,
+						<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_BLSP_2 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
 			i2c13: i2c@a94000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x00a94000 0 0x4000>;

-- 
2.54.0



