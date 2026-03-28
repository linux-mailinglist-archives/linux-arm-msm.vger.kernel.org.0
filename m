Return-Path: <linux-arm-msm+bounces-100555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yK54Lk1byGk0kwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 23:50:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDC6350273
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 23:50:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3721301C16C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 22:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A727736EAA2;
	Sat, 28 Mar 2026 22:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WZI8X9y7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0C03128B8;
	Sat, 28 Mar 2026 22:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774738157; cv=none; b=f+bVTtn83DzC+mDqeNZxqJDyvDcLWD5C/rq/r/4OPDb03y6wIHJ4OIOjOXGgJ1iSEUt+nS4CxGMVgZSyFduLUq9KR6opvkzFJZdGWeCx8d+VCPzNRdZ8zk2Vl5voESw2G6Ny8kQXIJYADXNidpDSVGxUCrhauwB4VDrWH3RP3A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774738157; c=relaxed/simple;
	bh=FBj259TMWNjh4lmEQqHW+lg7SFATzeEKq1MFGG46xnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eBHOjpys9B3FXhieebSQGNoPa6bnTxJPvSFI9iHDhINWG8DxlKyzZDsn/tZXdw/fFs9JWT1VBUR2x87JE3lm8q3Pu2iVvRtaosfn8HDjUJF6pZyARo8xicNJHTDyc12cHBf1TYKPy4ua5UFLb6ilm3c5416GGF1f1uy/BE4vDic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WZI8X9y7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31916C2BC86;
	Sat, 28 Mar 2026 22:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774738157;
	bh=FBj259TMWNjh4lmEQqHW+lg7SFATzeEKq1MFGG46xnA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WZI8X9y7UF5TEbOgyuREucU2lSERU2b9HKZ3KrrOpwFZ/eqBako4iQVEHL+CuWkpY
	 7iUXAHIAvxa+NpCg0fNZYvlS4Eh8mCcnX7y3G8rtLu4J2JVWaYsC7U+HqPXAUM7CWp
	 9diUH3QdDALd8dmy3nDJcZIqiTjmUxbQNzr5F2yMnHEW8rEzoX62R6hltBrY+ovdN8
	 kbr4XCzX27JVFaSATA6r3ceHgl/WHCmgYrbAZ+wwUpQr9JLWIx7/kISuLhs6uEPpRh
	 aWo7GxtyjRAPJyxwIv6ponXVAtgMCQY8kPWv+39nDb7tF0hQ4R57UnB68+fv9b7+2B
	 7lSvfleW99BPA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 237E610D1489;
	Sat, 28 Mar 2026 22:49:17 +0000 (UTC)
From: =?utf-8?q?Pablo_Correa_G=C3=B3mez_via_B4_Relay?= <devnull+pabloyoyoista.postmarketos.org@kernel.org>
Date: Sat, 28 Mar 2026 23:49:15 +0100
Subject: [PATCH 2/3] arm64: dts: qcom: sdm670: add debug uart soc node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v1-2-0babf584acdb@postmarketos.org>
References: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v1-0-0babf584acdb@postmarketos.org>
In-Reply-To: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v1-0-0babf584acdb@postmarketos.org>
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
 bh=L1100JIpppZkEIE9KsBz4sU5OJaPhYVcFrm/i+/xKLw=;
 b=owEBbQKS/ZANAwAKAXo0JWX/Y195AcsmYgBpyFrrXUDnvwlheDZ+2hKu3twU3X75u12vBwfwQ
 Ue01ImBC9SJAjMEAAEKAB0WIQS9CheUSi6o/ykTCaJ6NCVl/2NfeQUCacha6wAKCRB6NCVl/2Nf
 edABD/9aqMSORu2P0cDJ2ZuBG55trNlwe2J+pMjrZIgTmr2gWZxj36RvEZ11a4rh+kcXfi1jr9N
 DDxKEC9baYhU1tc9o3DqcMqlV5I1hsZuHfJ5+RHFtbO06VenbcAqH/mciUVe5lQMdKtqqXImJ8m
 uB22mRXGmgBsTmumqYmVqMbM5JGwPfuqgMry6rd/0cGvVC7cA4YbP9LIRdOl1Z0juDrMkDvBmk8
 heVkHAHdoAoMQgAQuBmc9gQjEEBIgxOV9p1iMwcoOaK5pLiGphnVPKJBPJhfAoUg79Y5TI9glwq
 gFTB/9yah9qumsLbr0jiqDyD1Fxp7M1BZpcBCQLY8fauMOzsRFOYMXXkpABsPtmZTY0GYOAXWlM
 dHHQoM5gHSkJNTTMsMfQ6n5i4pmTCaTSutqGVDP3Ibzffj8UQYP3BUVrBfJpbz7ez3g9aL/Vi4N
 zh3LwbJB6nnyUr/4E+jHDffGqOWEhRQbaYbMmCIY7hMEp6cZ5yjIIZJjIjjWFf+4wkoBqj8gyx8
 f84JjIujJejG/cIAPS/GILd1MC56Io2rtPzSHuJbAyxmec+o8HGkPT2wX7cWmZyABOSN6WUnnYd
 VujlKnlU45BBjgOKhzpggl/nda47chqsBD2GOG9VFrLtQ+HgHtqjVGhJN3slyOodbcITevdX+AM
 ZCztYpWiwNMGKcw==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100555-lists,linux-arm-msm=lfdr.de,pabloyoyoista.postmarketos.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[a94000:email,postmarketos.org:email,postmarketos.org:replyto,postmarketos.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5EDC6350273
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>

Values are taken from the other geni nodes

Signed-off-by: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 3e60ab527a42..25cf21c57b7d 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1069,6 +1069,21 @@ i2c12: i2c@a90000 {
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
2.53.0



