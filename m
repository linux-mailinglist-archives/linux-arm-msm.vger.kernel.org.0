Return-Path: <linux-arm-msm+bounces-105454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9pPGME9u9GltBQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 11:11:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 406784AB2C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 11:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7036E30151F7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 09:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828B237D136;
	Fri,  1 May 2026 09:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSiqoBZZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D51F366DB5;
	Fri,  1 May 2026 09:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777626700; cv=none; b=XhT1JyNB1xYZbC2/g/uOtVI/OdshNc9FnGdSU6ZZDVgtO53l2C5/bSl8B73RzzlfOVbnvO3HLf16unKzBAaa8xLISlx6VwMyOMY3qXDRcVGqh+jfxfIZAFWAsO64M1KRijq5aVfaWR9RhwNZZwxwOit2Khwt0ckSvE/eUAeSQNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777626700; c=relaxed/simple;
	bh=8NE3gWGYnFaVUlsJLjhktxC9sF6clIn1F8f80pRPo1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sx62/JL1c3smbJrPzMGXAOjN5FijKCliGzyr6eNHlH+fCW/+LaPiHzKe4wmo79KyLECxsdqx2V46BQ2DnYFFpQ6WdPMLZOvGUnsYnfRdfQG/C04m6fPN0mjc4wSaE90PRolcbsoz5IlcpEA7ZS3upGM30PicH9IFO02I2DyJt70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSiqoBZZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4BFCC2BCB4;
	Fri,  1 May 2026 09:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777626699;
	bh=8NE3gWGYnFaVUlsJLjhktxC9sF6clIn1F8f80pRPo1Q=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=cSiqoBZZWYStHiiq2FrwGX0l2NqJjgBYItoeXLLvi8LdwCzr6pXgSpBRWyuGBFmim
	 PzYyjkeXK2w1WCI32SV7lD24sJAMUB2hN7mg/RdSRRfJhka0f5yAsZ0bBGETdWcP5W
	 7D5H7pHmZvz3wbiH8eTTbWH1owdZDxvC48+DpRJXZK4DYtxEeZnt9XGTtmKWjLNLY4
	 WDjBK7VWdqyOy2L63xPkutELQHt0VXIwQaTEBVFk7L+SYU44/JtkazqsjMleYR6pdM
	 qD4tPLBpgmczq2EDEkV+LF1LspfvWfpTwizeY52QZxAFZ66EFRr7S8Ow9x1l0uHhIK
	 VdCuMxA8oS3Lw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8CF9CD3424;
	Fri,  1 May 2026 09:11:39 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Fri, 01 May 2026 11:11:29 +0200
Subject: [PATCH] arm64: dts: qcom: sc8280xp-blackrock: switch to uefi rtc
 offset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-blackrock-rtc-v1-1-bddf3e37fa94@oldschoolsolutions.biz>
X-B4-Tracking: v=1; b=H4sIAEBu9GkC/x3M0QpAMBSH8VfRubaaxcSryMXMHydCZ5LS3t1y+
 bv4vpcChBGozV4S3Bz42BOKPCO/uH2G4jGZjDZWV7pQw+b8KodflVxeGUyoHRoHW1JqTsHEz//
 r+hg/WILRP18AAAA=
X-Change-ID: 20260501-blackrock-rtc-2efe7ae9ae64
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777626698; l=2425;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=tDNNxwtejUYdaPAby/1L+xoKUke9uWqBJlZ4wJWTrYY=;
 b=QLmw6GvnBSprPtboyVQDUmTXvT3P8+o1OoUgdHW47BtpgmxO+wiJSKesDiW5WC0ir0TSOHEEF
 U1US5Wev/LUCBehjoMxx1+XpYnJl1RJpuzW1RMOOs/dnlUfJEeqS3Gl
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz
X-Rspamd-Queue-Id: 406784AB2C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105454-lists,linux-arm-msm=lfdr.de,jens.glathe.oldschoolsolutions.biz];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	HAS_REPLYTO(0.00)[jens.glathe@oldschoolsolutions.biz];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.144:email,oldschoolsolutions.biz:email,oldschoolsolutions.biz:replyto,oldschoolsolutions.biz:mid,bc:email]

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

On many Qualcomm platforms the PMIC RTC control and time registers are
read-only so that the RTC time can not be updated. Instead an offset
needs be stored in some machine-specific non-volatile memory, which a
driver can take into account.

On platforms where the offset is stored in a Qualcomm specific UEFI
variable the variables are also accessed in a non-standard way, which
means that the OS cannot assume that the variable service is available
by the time the RTC driver probes.

Use the new 'qcom,uefi-rtc-info' property to indicate that the offset is
stored in a UEFI variable so that the OS can determine whether to wait
for it to become available.

[1]: https://lore.kernel.org/r/20250423075143.11157-4-johan+linaro@kernel.org

Fixes: 16a7fed11714 ("arm64: dts: qcom: sc8280xp-blackrock: dt definition for WDK2023")

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
This is the first of a small series of incremental updates for the
Microsoft Windows Dev Kit 2023 (sc8280xp-blackrock / Project Volterra).

Subsequent patches will address:
  - USB-C DP altmode support on the rear port (USB0)
  - Audio on all three DisplayPort-capable connectors
  - A few other cleanups cherry-picked from the Lenovo X13s

The goal is to keep changes small and reviewable.

base-commit: b9303e6bff706758c167af686b5315ad00233bf8
---
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
index 00bbeeef6f14dd89de506e33742f8f73435ac021..3dc3d7ae928d0a509c564a32908e33f5ca934c98 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
@@ -763,20 +763,11 @@ &pmk8280_pon_resin {
 };
 
 &pmk8280_rtc {
-	nvmem-cells = <&rtc_offset>;
-	nvmem-cell-names = "offset";
+	qcom,uefi-rtc-info;
 
 	status = "okay";
 };
 
-&pmk8280_sdam_6 {
-	status = "okay";
-
-	rtc_offset: rtc-offset@bc {
-		reg = <0xbc 0x4>;
-	};
-};
-
 &pmk8280_vadc {
 	channel@144 {
 		reg = <PM8350_ADC7_AMUX_THM1_100K_PU(1)>;

---
base-commit: b9303e6bff706758c167af686b5315ad00233bf8
change-id: 20260501-blackrock-rtc-2efe7ae9ae64

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



