Return-Path: <linux-arm-msm+bounces-100558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPEwLCddyGnAkwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 23:58:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E64F3502AB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 23:58:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB714301FC85
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 22:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E9E370D5E;
	Sat, 28 Mar 2026 22:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J8xadMTA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C357341ADF;
	Sat, 28 Mar 2026 22:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774738724; cv=none; b=oDYKhJ0Idvbia/u9PHGeZzlpuQdOYeRavkHyFRPY9qyE+G8m6iHTeTAogkKnhji2bY8PK2hT2GSG+8B765kk1iHxILwQGy40D7YQtnAcdQ6kDk6nERwqkc6Mv1kHLWq3KTnig0g0rNpkpznl5x1MZanRt6UxYeRjS0Y3ZmtcgL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774738724; c=relaxed/simple;
	bh=FBj259TMWNjh4lmEQqHW+lg7SFATzeEKq1MFGG46xnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qWrtqfEjwZscAcnScZyvALLtNkN5XZa+yhPdS06syLdVGqs2AxqIdxpq3AGjWkBjL++EVq/dQnRSwOwUwKX+kPuRD+y25ogPlM3h08r2xVfNYDpZijgeoolQcAHTjNK8bFJawNJmlCTrByYccj59QSe49MyxiwTJzRzcp6hGFNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J8xadMTA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5FF48C2BC86;
	Sat, 28 Mar 2026 22:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774738724;
	bh=FBj259TMWNjh4lmEQqHW+lg7SFATzeEKq1MFGG46xnA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=J8xadMTA9zVR4FYCPUKm8cfnV+FLDs4OsDrCCpljd7ZZKi17whNtPIRHKiwUf40fc
	 WjbAGJ+Gg14IlQDP0q6fSw/NczmnXhgVnLEMkzOfeFyhKnPg6ExSq3Q8X4YvSE4aao
	 nUB1q3INpBYpI/VhTQIqxpDP+BAD72KZzIH+/IufRDMuN7gq6cD6XL45rdXP6PFDAx
	 /bRhYODMuV212EEnSqn8+txDEqmRWRw16qUnkanhnR3a8xisJRUksYXgNRqGa+N93+
	 1lmcAmYZAoQAXXCc/9eUp2GEqY5uoL+zQoD6ClAyWSP82y8ITPxojXrAm1OvIQQWsg
	 OKefy9wTJWUfg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5132510D1489;
	Sat, 28 Mar 2026 22:58:44 +0000 (UTC)
From: =?utf-8?q?Pablo_Correa_G=C3=B3mez_via_B4_Relay?= <devnull+pabloyoyoista.postmarketos.org@kernel.org>
Date: Sat, 28 Mar 2026 23:58:41 +0100
Subject: [PATCH v2 2/3] arm64: dts: qcom: sdm670: add debug uart soc node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-2-53abd9db8f0a@postmarketos.org>
References: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-0-53abd9db8f0a@postmarketos.org>
In-Reply-To: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v2-0-53abd9db8f0a@postmarketos.org>
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
 b=owEBbQKS/ZANAwAKAXo0JWX/Y195AcsmYgBpyF0iwB/xXRhz8L+4jRjNqXpXSXx9QDCNjJ8An
 LuCy+B2y+iJAjMEAAEKAB0WIQS9CheUSi6o/ykTCaJ6NCVl/2NfeQUCachdIgAKCRB6NCVl/2Nf
 eX9AD/9zmEu8SAarJ0+mCQo4cq3vPVVFuf7ZF8F/1vLWKmFMlfzqP0qpsam4Xr3x99bB2W19DKJ
 v+R1TX2w4aINZ5RyufvhQRDElwle0+bVXGJxPLZ9fv6cuouXDlO2vclcKoJ8SX1DzXboAMl+Uxs
 YC2y4KaDOL1H7Oo1JgBqWIWvc7UxGkezVBf2vsr8Ca6uTL6kKYf1Z/Q13y3sFISBv3Wg2OWAyhy
 4xYUex7wTIJ12oVJ7RqEQ8oBuw7BA1lLGTmbD6bFaM7d+ynvJu+9LweWeHEINe9AjbWi4iga8BQ
 2ho/goNBPrcMJfek33MhbWD01NJRK99+lAH6ysAIyA2Gxm1SfzmXdgURAX+TRGunkn50k9en2ax
 jnA5wfASR0z1EMx9wOtPgz07gSCBg51oojlvvazLtEV/TR8dLbUYSRGQV+zq+wamNLTAXq6QneB
 LIP12CZYuUcN+W/RB6Fb6KVWXod+smZ53m9HY73R/5qAFOMXcM8ir6q3TI+4WFhMiKLzOgfYzUz
 ka6JB6abKAwO6YisMdKu4b8UyBc6tMrS1wtz3fK5dunTn5qk2Lp3yBmGZV+NSTJ5ArPVe52g5eO
 BOup3l33DZTXLJf3HPuUWY+hzGrd2imEplEg+irbIzsizqjJaqM/vo1MF9hkuG4bo6ukI3aJ7/X
 tIdkvw6Vo0J2D5Q==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100558-lists,linux-arm-msm=lfdr.de,pabloyoyoista.postmarketos.org];
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
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_REPLYTO(0.00)[pabloyoyoista@postmarketos.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,a90000:email]
X-Rspamd-Queue-Id: 1E64F3502AB
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



