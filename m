Return-Path: <linux-arm-msm+bounces-114469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BwE7E0TqPGpyuQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:43:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEC86C3EDC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 10:43:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VmqS50eV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114469-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114469-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3E563056A91
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 08:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917563812F2;
	Thu, 25 Jun 2026 08:42:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C3130E831;
	Thu, 25 Jun 2026 08:42:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782376969; cv=none; b=kt8feczjpBNV505LzsyUxDdBtm3zfO9aX/xLfdhCfCsvqMhyGglIiKocPtp1Df5eFkXJLtVTbEQ3kmBjkgUtc8ZkXpBvEISeBTvWoYj13wXKc1eLL/ZDx7FUElaxaEDrHebOvo/tzb2S6RMnRFcYH+pB8JVcX4T8hyqZD6Y3OBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782376969; c=relaxed/simple;
	bh=K3HKPYyJofRb3cLQpaA8dyYqaH2fIhKnG6VaAwKE62o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pT6kz/MkLh0NkDL2xdFpRERdOkRaaftuYaCsAFYUWo1QmjCCDBPvJbGfuMlY4ydGc5hIj6rK8G/5ekB7LtmiOiybuMNyxa/fnfa0vHwnJ8vvyeTIJUm7E5B5Rwx1Rnqtr1ECqQVO3/csEa7W2bc0p6ho05QWEybSQ/4SpsbJwTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VmqS50eV; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B06461F00A3D;
	Thu, 25 Jun 2026 08:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782376968;
	bh=yCZkKrTgoFrJtnFixlEN0th2zJIgTQaaRt7O4yiSnhg=;
	h=From:Date:Subject:To:Cc;
	b=VmqS50eV5ilEOTQJpsgoEZzDjlvxthS+vCxcXy62aI3epznKEJWP3sI1N29VlxegE
	 D4QlfbhQSuTuREEfGYnayGTgjEgc3C5yKgWeu1WD5f0DhMiKFShym3MsAYhp/abmU3
	 0A1LYThV9PiTMikluYzVY5C1WAoEqt691T7L0ytAEGJ0P5Ee3Z9L1UfTzxmCd1+Ax5
	 GvLSlD5VsXL7roo2cDtuKS02SuGfvnykwS/MsT4pN8dV6UmXdL0z/JfPXcHY72hRen
	 06Gr2hLPQHegEgFNb0VsWF3M6MU07QmE1qxQ2OwldfPeSTfECSI8yAP308ZuIl92lF
	 pV/UD4Hp/AvxA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 25 Jun 2026 10:42:43 +0200
Subject: [PATCH] arm64: dts: qcom: msm8996-xiaomi-gemini: Fix up ti,drv2604
 enable GPIO
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-topic-ti_drv2604_dtwarn-v1-1-76e91fcafbe8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDMBCF4VeRWTeQRA3YVyklmGTaThdRJvEC4
 rsbdfkdOP8GCZkwwbPagHGmREMsUI8K/K+PXxQUikFLbaTRrcjDSF5ksoHnMjU25KXnKKRxXnW
 qbjtXQ3mPjB9ar/LrfTtN7o8+nznY9wOxY39XewAAAA==
X-Change-ID: 20260625-topic-ti_drv2604_dtwarn-06bc191359b3
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Raffaele Tranquillini <raffaele.tranquillini@gmail.com>, 
 Yassine Oudjana <y.oudjana@protonmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782376965; l=1233;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=DPjptcUhigJiIbreUPlKcoE8dMc+hsqt7sPDdf9VIlk=;
 b=WqXJk0kHeuIg2F4psQ5uILn30LJuAvv63AVJYsyN7sN3BxQlXvxm+JK52uIS+XfZUfE7965sM
 oDZRXxO6k6kDjiYMi0oYp/BmFs7AeK/nRiQP+xjH+GzPadRVfA+/3iS
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114469-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:raffaele.tranquillini@gmail.com,m:y.oudjana@protonmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:raffaeletranquillini@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,protonmail.com];
	FORGED_SENDER(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DDEC86C3EDC

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Update the 'enable-gpio' property name to 'enable-gpios' to conform to
the bindings for the TI DRV2604 haptics module. While at it, use the
GPIO_ACTIVE_HIGH define instead of the raw literal.

Fixes: 4ac46b3682c5 ("arm64: dts: qcom: msm8996: xiaomi-gemini: Add support for Xiaomi Mi 5")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
index fd3a2121465b..ca22e2f9d20a 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts
@@ -39,7 +39,7 @@ &blsp2_i2c3 {
 	haptics: drv2604@5a {
 		compatible = "ti,drv2604";
 		reg = <0x5a>;
-		enable-gpio = <&tlmm 93 0x00>;
+		enable-gpios = <&tlmm 93 GPIO_ACTIVE_HIGH>;
 		mode = <DRV260X_LRA_MODE>;
 		library-sel = <DRV260X_LIB_LRA>;
 		pinctrl-names = "default","sleep";

---
base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
change-id: 20260625-topic-ti_drv2604_dtwarn-06bc191359b3

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


