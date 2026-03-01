Return-Path: <linux-arm-msm+bounces-94760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBarGgZ9pGl5iQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 18:53:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BF91D0FAD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 18:53:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B2F4302FA84
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 17:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9395833E367;
	Sun,  1 Mar 2026 17:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="stX4SPXD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE3833D6EE;
	Sun,  1 Mar 2026 17:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772387480; cv=none; b=N3u2eT1Y/5EPsKMsqnba/2Dl7PaHfLSddrPJKMZHAIr82od8GkJCBUrMKtxU0ayy62lqonL6DlbvK1OAzyWoOrFvXFcB7DBgvdfk5jz2jISheSHAOq94lzeAZVAM1rmUFO71UcAYTWFulbb4GOa0NLGUKUHuw0eLAART6kbFSY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772387480; c=relaxed/simple;
	bh=W6cSrGd0y+hrVmL05+ccKmQuO7d2OHllkzkMpslpFb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ELUq74a4Igch6ndf88gmhs2IP8IuPs4hs1PaMtVkkIRSRaPl3TQs5MvXXAoJ20gD6ilgs8Ctwg1iQsDz3TvpMfiRRizz/+Y6pSyLhFkI+xa0rgszrDKS2mw29XZomdlvKj3dgFA0ppWcqKTIDcPyIwDe+xGFiUoDOMW6G9lzlQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=stX4SPXD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32520C2BCB3;
	Sun,  1 Mar 2026 17:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772387480;
	bh=W6cSrGd0y+hrVmL05+ccKmQuO7d2OHllkzkMpslpFb4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=stX4SPXDwpSTyym0Pc/k1PVxPfqXK73WCgkdk873AKI8DSR7H+Tg1Zga+lwuAwI76
	 0/N2F7myFUzWOWVzPhStrjs4LXBc0oyJfYhZ+tpCEVXbWmBh10ol0eBCtRCoK4MhMs
	 aHDzRwuRZ5Ie4vszBeaz+pZEzh7hI+3PGCgsg1nPSa7eqq/DTDjvV+u2E++1xJ+nVo
	 BS0Yrldt9MgdJLDz0au/PXz9HE3e49TKaAFvumLea6B6jMP1WgvFDuK0mLu3hPoi7b
	 WO+Ol2PkpQY5wxaz3mLgeXUqayApkbf4l7+st+nCz+im1TQc/btzQM3LXgc74etpyA
	 6HQ1SgYC4lmMw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F3DFD0075;
	Sun,  1 Mar 2026 17:51:20 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 01 Mar 2026 18:51:24 +0100
Subject: [PATCH 10/10] arm64: dts: qcom: sdm845-google: Add STM FTS
 touchscreen support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-stmfts5-v1-10-22c458b9ac68@ixit.cz>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
In-Reply-To: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1269; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=4/lfzEYYZjUSxYP/aTkLrRQ2VN8Psoxavi/IstIzuL0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBppHyVaCX9KjhoeEmo7YHELzM8zuZw6Mbc4G6o0
 VIq1w9OLZWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaR8lQAKCRBgAj/E00kg
 ciBFD/41NrAOanfs7cx7e+2sECckL6NCNiYD4+R7Ez7hXveR0nbWJxveRy3dbRvMv6/MSxR/3M7
 9xyS9sWp24g3qnPNugFmVr5Sw7L5EXuW0dq7N56JBE9aAEab3D8E5CDyqqoNxYItk5Liv1oCvke
 oG2ZF6RO4fAEIdfScDi179tNE050cB3ddgWCm7kxwIh98oxNSUfVdYzXY2X3zDOeCyqs1xOrK1c
 JBRKed9j+vcJ22XL/nPZvN30P5EaD/yzbDJALiBdcZInagRoYRYrDLm/NIr09Kx85a5c/wQNqaA
 TTG6kv+SNNF/w3wuxb86eDrEegWJFhztfew5zKha8AQP/ikCnUwOT5OG8G9tyPkiG3YlMX861MG
 e9EYqc/JPDmpR0g3V/6FNqfO+nrfQb72T3n2ZgnRq/Q//+G+waw+uroFZuPEQRpb4lXqtJmZK6w
 cv74HQ8VTmTjzlGHOAeWPZuPyOKxZSmo1zIGlYRy9idGqNvkx+D8a5TGkDJXrqO+zXvXy1BuPLk
 LNU5vQm8hXUcmWFuIScQvTeeXX4B6Ucp27RDqM0fykYu6kWLj5mBUVk+C+Xy5jFQU/ZHLZIMhEx
 ZyAreXzqU3StjwAJx69dWraCNBF4HfZH8aB+r9LYuWOYOaLrra6j6FgOSYjx+Zxi3BID/E88zIL
 RvFppiUpphwbgLA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94760-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,kernel.org,ixit.cz];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.49:email,ixit.cz:mid,ixit.cz:email,ixit.cz:replyto,protonmail.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 08BF91D0FAD
X-Rspamd-Action: no action

From: Petr Hodina <petr.hodina@protonmail.com>

Basic touchscreen connected to second i2c bus.

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
index fa89be500fb85..2501104b06e1b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
@@ -26,7 +26,26 @@ &i2c2 {
 
 	status = "okay";
 
-	/* ST,FTS @ 49 */
+	touchscreen@49 {
+		compatible = "st,stmfts5";
+		reg = <0x49>;
+
+		pinctrl-0 = <&touchscreen_pins &touchscreen_reset>;
+		pinctrl-names = "default";
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <125 IRQ_TYPE_LEVEL_LOW>;
+
+		irq-gpios = <&tlmm 125 GPIO_ACTIVE_HIGH>;
+		switch-gpios = <&tlmm 136 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&vreg_l14a_1p8>;
+		vdd-supply = <&vreg_l19a_3p3>;
+
+		touchscreen-size-x = <1079>;
+		touchscreen-size-y = <2159>;
+	};
 };
 
 &mdss_dsi0 {

-- 
2.51.0



