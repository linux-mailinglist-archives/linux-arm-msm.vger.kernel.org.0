Return-Path: <linux-arm-msm+bounces-109247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBJZNi81EGqqUwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:51:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 858165B27D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 12:51:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C174F30A6B5B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 10:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16D13D301D;
	Fri, 22 May 2026 10:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="omNy/g/J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B0C3CDBD0;
	Fri, 22 May 2026 10:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779446625; cv=none; b=HnwXH6vsDDvbpavVKf2Q9zkgzz4rWzk8AQYff3ynQ6Sl4ZVjNwfh3tfw+TgR4CgRtjeoAhPoWMNoNLxS/SsVT8VovzmH1KEK7oPaei+s4L3skxRBuLE2bwzuZATk0bV42eefhTxxDn9bn9imIu5b/mhCAYxYvuS8SEHG89PKhuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779446625; c=relaxed/simple;
	bh=VCO8JqZhi5cjTjlswWubLHARJbdDOER9+j65tRfAaug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ccvo4/nWlSwyaIacF0+4Phi4UZ3CxdQe7f+tAdYK4emfdhuEBO1cOysmN2VHcCLjYaxL6Sqd+ff89Ca4DfI21+hYCAgFNb59yuUcBAZjcPa2md8tG6IYMqxbNS4m5T6QF/ekKQpo1NgxfT33Z69gr5D15EUVH8AZOmhbGDlNChk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=omNy/g/J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2DFA3C2BCB3;
	Fri, 22 May 2026 10:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779446625;
	bh=VCO8JqZhi5cjTjlswWubLHARJbdDOER9+j65tRfAaug=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=omNy/g/JR3j7HiGoV7aZWMMnZ6PGGrXw1xRiGohKBVs8JfJrIvkUAyyaf3muvS/Ga
	 QS1ywM36KJU4f5PUb7et0eN+gP9KjV1EGwRZ9CIHbaqNyUiKBqGIhDPOVbJJ4iZsdF
	 ymSwk1iCFA+AFcuOJvH9xXsDN+yGsceNQq4DfFJSDOEVdn+85s8nPf00edEDJsvyxT
	 lVlkP4v9jtUMlo7U0+hCaGvfVmMi5QsOr71GTaBxq435IWaR1yOazd4gSRS7E3QRap
	 Yiu3CbWhgX6DSSi+uDdZ3SLt95R04jK6JySdhP8jg5QmBoKA4l0FY8rBi2uYFK5o7+
	 PtC3xxY0pGOwQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E2CCD5BAC;
	Fri, 22 May 2026 10:43:45 +0000 (UTC)
From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne_via_B4_Relay?= <devnull+jerome.debretagne.gmail.com@kernel.org>
Date: Fri, 22 May 2026 12:43:17 +0200
Subject: [PATCH v2 01/10] arm64: dts: qcom: sc8280xp-arcata: Enable
 backlight
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260522-surface-sp9-5g-for-next-v2-1-dd9d477407f5@gmail.com>
References: <20260522-surface-sp9-5g-for-next-v2-0-dd9d477407f5@gmail.com>
In-Reply-To: <20260522-surface-sp9-5g-for-next-v2-0-dd9d477407f5@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779446623; l=1778;
 i=jerome.debretagne@gmail.com; s=20260520; h=from:subject:message-id;
 bh=eap9AjvywFW4CRahWMk+1c1QXImrokJWDaGBrZsuJlM=;
 b=XPMffnR1UEI6XAIYI8LnzZLMO9Qf+UkXBu7f0lTlr1wcPCEoazlIvaYQIsO++welVcNLcdtRo
 5mPotzXc+0ZCAiPMWlrNYZ5cPwu3GJfXY6FZAHYW1nrSOmYA9fu/kd1
X-Developer-Key: i=jerome.debretagne@gmail.com; a=ed25519;
 pk=3/JYhgYjGg5V9mlFxc0A0+pFiyjsuDB/TtDlNMId9fk=
X-Endpoint-Received: by B4 Relay for jerome.debretagne@gmail.com/20260520
 with auth_id=785
X-Original-From: =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
Reply-To: jerome.debretagne@gmail.com
X-Spamd-Result: default: False [0.40 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109247-lists,linux-arm-msm=lfdr.de,jerome.debretagne.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_REPLYTO(0.00)[jerome.debretagne@gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 858165B27D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jérôme de Bretagne <jerome.debretagne@gmail.com>

Add backlight nodes and enable backlight so that it can be controlled
with the corresponding buttons found on Surface Pro Type Cover keyboards.

Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
---
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index f2b4470d4407fb5b6a3dbac8bc972c010c31bd06..f24f60dc73afea6eeee0ea26472cda3223811752 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -46,6 +46,15 @@ wcd938x: audio-codec {
 		#sound-dai-cells = <1>;
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pmc8280c_lpg 3 1000000>;
+		enable-gpios = <&pmc8280_1_gpios 8 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
+		pinctrl-names = "default";
+	};
+
 	pmic-glink {
 		compatible = "qcom,sc8280xp-pmic-glink", "qcom,pmic-glink";
 
@@ -553,6 +562,10 @@ &pcie4_phy {
 	status = "okay";
 };
 
+&pmc8280c_lpg {
+	status = "okay";
+};
+
 &pmk8280_pon_pwrkey {
 	status = "okay";
 };
@@ -853,6 +866,13 @@ &lpass_tlmm {
 	status = "okay";
 };
 
+&pmc8280_1_gpios {
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio8";
+		function = "normal";
+	};
+};
+
 &pmc8280_2_gpios {
 	wwan_sw_en: wwan-sw-en-state {
 		pins = "gpio1";
@@ -860,6 +880,13 @@ wwan_sw_en: wwan-sw-en-state {
 	};
 };
 
+&pmc8280c_gpios {
+	edp_bl_pwm: edp-bl-pwm-state {
+		pins = "gpio8";
+		function = "func1";
+	};
+};
+
 &pmr735a_gpios {
 	hastings_reg_en: hastings-reg-en-state {
 		pins = "gpio1";

-- 
2.47.3



