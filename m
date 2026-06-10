Return-Path: <linux-arm-msm+bounces-112427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +nbfMnlPKWqVUgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:50:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 246ED668F6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:50:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=F84zi30a;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112427-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112427-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CCBE931F25CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9F340584E;
	Wed, 10 Jun 2026 11:44:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DC6403AF6;
	Wed, 10 Jun 2026 11:44:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091846; cv=none; b=TZ1Tx+iLcQK4udCbUY772B60MNMCfF7cTRVidhdJxPtmQjDDeXwD3ChyWle/kAgUm1sR6kNWVfi4VfEmmwJk1wUHHm6vKf581cdqmqlUHL7QP6oJOj/Xfa94y/9bH/4doZCCk/uxx55Ed/HHXg87lbXTFCHy0OHUa3MnnbWCo98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091846; c=relaxed/simple;
	bh=p/iSawAIPqjA82qXj9fFb+48v097PuZQFwOqZ29Dc3Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I5iNlmo8XBPky77MGZkdVMurqEJOgePNNzA+Vsjc0kWBghgte5CSh8NeFjM7yWQdgcfyiglO3NorV98CRprwBV1blNJ4ILzoIXYCsmzpoUOh+F4SLWgBUh1LothQ3FqiBfSgao0oAygbKRU//9SpTfx9HziCvAS9xNNkTiTlXsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F84zi30a; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C10001F00899;
	Wed, 10 Jun 2026 11:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781091842;
	bh=9pXHGO84RTiIhAOggSiCFNtg6jRVCp72eNq4mx1RVDk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=F84zi30arrIh/GUFxpdSloOd67t2FA5cOKd5mKPlpY8wn+h9F/pSTVNY+sWjmzlMk
	 UoQK3jCUUit3amj6IpCC/6dOQ9W+0k1VspfyinsequPPYXV7x4jDlPmcvKxbsnZwCz
	 ALgDZnYSebE+489hpT8sDo/95AZFMLNQp1FIeH61m/YLCiph1rsgMFQjFEyXfw1/Pm
	 2CXdkvjtAij4LmJVfdRp0GSMWQuRVfr8t6Uxcu4QMbzr8LYhANm3whjJeWLRNDJVFV
	 JbwJkRThQHIvZurH6aItffJXDPfrDGwOX1uNxFaDUuquG7FTvOttCKHY8bJZbUsCcK
	 b9+QdTIbedV1g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 10 Jun 2026 13:43:47 +0200
Subject: [PATCH 2/5] arm64: dts: qcom: msm8976-longcheer-l9360: Fix
 accidental node override
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-topic-june26_dts_fixes-v1-2-2e0c953a6c08@oss.qualcomm.com>
References: <20260610-topic-june26_dts_fixes-v1-0-2e0c953a6c08@oss.qualcomm.com>
In-Reply-To: <20260610-topic-june26_dts_fixes-v1-0-2e0c953a6c08@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca@lucaweiss.eu>, Gabriela David <ultracoolguy@disroot.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781091829; l=1235;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=NLYdFsUXA3/y2oHZFx8IqHlKyFH0fy33Pl2kHmGFDDE=;
 b=0qAQ3vKXX3/GejwjM15FtSgcMOWjdt0BoZW3BLWtG6uMY1snqFXm0W4ewmak0XJ+zgcroLj5y
 tOBRjYElD2PBUWYR3VEQf6ieU9ZjdAXKr7SkYo+k4qUvd7qWsmV3CNL
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:git@apitzsch.eu,m:luca@lucaweiss.eu,m:ultracoolguy@disroot.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112427-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email,oss.qualcomm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 246ED668F6A

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The active and sleep pinctrl states for the touchscreen interrupt pin
shared the same node name, creating a single node, accidentally
overridden immediately after the definition. Alter the names to make
them distinct and to silence DT checker warnings.

Fixes: 79b896e7da7e ("arm64: dts: qcom: msm8976-longcheer-l9360: Add initial device tree")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts b/arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts
index 18832a3b9a1c..57f549f06f73 100644
--- a/arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts
+++ b/arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts
@@ -455,14 +455,14 @@ sdc2_cd_sleep: sdc2-cd-sleep-state {
 		bias-disable;
 	};
 
-	ts_int_default: ts-int-state {
+	ts_int_default: ts-int-default-state {
 		pins = "gpio65";
 		function = "gpio";
 		drive-strength = <2>;
 		bias-pull-down;
 	};
 
-	ts_int_sleep: ts-int-state {
+	ts_int_sleep: ts-int-sleep-state {
 		pins = "gpio65";
 		function = "gpio";
 		drive-strength = <2>;

-- 
2.54.0


