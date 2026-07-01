Return-Path: <linux-arm-msm+bounces-115739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YAiQHKQ1RWrF8goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 17:43:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B396EF593
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 17:43:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BP4WLdKW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115739-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115739-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2A5063045693
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 15:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C272D48B361;
	Wed,  1 Jul 2026 15:43:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5923B3894;
	Wed,  1 Jul 2026 15:43:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782920610; cv=none; b=PPNk5UJtMHRVnqqHzZSf6jTyHjso2HccXe7iTnQh3zLmCnmHitlW35oXH7LIW4601fUY3MvuAI0vxZS2Atgr0n07Ds3IiUfww5MO3C7rRd/9cmnJ+5Yi8fgSVHjeobiixq0HkUAtp72HmZ/G2ikHaJulxtQrReKXu5uKwqg5ZbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782920610; c=relaxed/simple;
	bh=gtif1OoHMxEhhG3j3g6okBshbqb0qtgOCA+Az5csT68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gj4U5Gv/2Ndp78ebcNYFDvMbXXa7kM2+1jSWnnI4xzXzy1imbKslBdNjKYcLi9XxEEs4qQDfj7X+nD7PToZ3m83E3y0xNQFr8DkpsCFwPcSnYXx1OyjH0rzBrUvBuJFq5D9Fa5hyShRs1VnzBE3k4MfGaQdROUlWn9qosWuoRnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BP4WLdKW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EDEA1F000E9;
	Wed,  1 Jul 2026 15:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782920609;
	bh=pbPevqBDaQWq8tGCXHFVTyAf/dPYuJeMhHkxM3/SqrY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BP4WLdKWKPkHaBWpSora99uUg+FThcJZumzuk2evpw1cr439JKmiV9Al0gtBGltpz
	 jBf0ItGvICr3s3SPcyTHc8gSOVRyOD00tvHB/XB4J+eXEqzE6LSx2Y9+ey6mgxA3vq
	 38JmrBGK5ytbveIX1cP0LrQDKTFDqYls96WRMy3sJuoTwGRzIq9pI8vwb3LeSImzdV
	 22sf8mSrQJZGR8cqGQ56X4OyWOqE6FVsDKLf9Kd0hXAcXNKstk8W1ETnrgg04Woesq
	 dTOnfMTQ9OAo129gD16w08tZkEz+yp8LT8QAXEgXmH8KpOntwifzNT9Psyko8ZR5Y/
	 47boIegwLA6EA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 01 Jul 2026 17:43:16 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: sc8280xp-crd: Fix the pin index for
 misc_3p3_reg_en
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-8280crd_fixups-v1-2-3fe92ee9636b@oss.qualcomm.com>
References: <20260701-topic-8280crd_fixups-v1-0-3fe92ee9636b@oss.qualcomm.com>
In-Reply-To: <20260701-topic-8280crd_fixups-v1-0-3fe92ee9636b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782920599; l=1025;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=m4Ki/fMAJ7/KgZK7YUWp8LeXJTA+K50a864XICUPu+c=;
 b=hQEc2so4e/R7bB9dlO91iFjuI57m6Raq3skwCLJH/uKGu/RqPvI2R8I6AB0MSbP6DjkNdQ8D4
 CT2+A2xlgrbB19sWpCkEznSVdbwwTo7Q96MN0Y5+jqj6JssJoewvGR3
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:johan+linaro@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:johan@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-115739-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 03B396EF593

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The correct pin is GPIO1. Fix it.

Fixes: ccd3517faf18 ("arm64: dts: qcom: sc8280xp: Add reference device")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index adc6d7b7c91b..535abc5dcf37 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -184,7 +184,7 @@ vreg_misc_3p3: regulator-misc-3p3 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&pmc8280_1_gpios 2 GPIO_ACTIVE_HIGH>;
+		gpio = <&pmc8280_1_gpios 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
@@ -917,7 +917,7 @@ kypd_vol_up_n: kypd-vol-up-n-state {
 	};
 
 	misc_3p3_reg_en: misc-3p3-reg-en-state {
-		pins = "gpio2";
+		pins = "gpio1";
 		function = "normal";
 	};
 };

-- 
2.54.0


