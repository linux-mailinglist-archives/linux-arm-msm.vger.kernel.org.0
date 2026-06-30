Return-Path: <linux-arm-msm+bounces-115255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jXcCHaMiQ2oeRwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 03:57:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 666B76DFAEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 03:57:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=proton.me header.s=protonmail header.b=NevV1SaL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115255-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115255-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=proton.me;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 933EF3007ACD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 01:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAB3B314A98;
	Tue, 30 Jun 2026 01:57:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23C62264D9
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 01:57:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782784649; cv=none; b=IRSmFJh2FXj735UdzJ27+owsP+n3PuPE8THvoHP02Dr28aaumcFZsTDP+PT8HIbXZmxUQbcTruh98PAl2qF9AqqSI43WNgubn1yyE+bS4tVx0SLZGoIa7yCf5RRA9Gi+oHv3EELEs+TmjijlniExHdiA68vCbSMr8IbAHiQRd9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782784649; c=relaxed/simple;
	bh=ZfoG/+QKnrfYCirFVYlyh+Zu0G4dZxrFIRndgI2AFW8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HMRcNFSLfVX0QbkqNviwk+9CP5RWV1nYzuMdwVHeMulIAw2vep2FKvfEwlIUtsTOx8WgMNs2M23Z/q9fUsb6vZZMKg119KftUGo9kTNg1WMKMB/ZAiHf5Y0fqAVdZXL8zTXumDQ8HaPDz43agJDTto8C9QhHobe+ux9kt8x8TGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=NevV1SaL; arc=none smtp.client-ip=185.70.43.103
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1782784633; x=1783043833;
	bh=abt1Km3rhqF/kozSRmSM/863AzbKoF9WEhHJyA3rzFI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NevV1SaLMK9EaM/8nsFnFZqmVS2NBh1OjbbzFxFVfaaOGt2TJyiSfTafSqCRb/1kC
	 ZfP4lVW08oP0eo3RQInrKxi3uafn98+8QY+w6IdzssFXST+uWCJ7nWbRxX+Z9lyF3u
	 BvFeUc/CIqTVBY9/10ejOnclnllSYGV/py6k2bAoKU9c0/tx23FewiEiGJqACI+PCg
	 dubck7cR7AtA09b6b6XbOzBvlc3qfcsgNWZNTzanOjdHEVaOFxWccD4YX/SFo9SIuz
	 GxsUHbeCav/RZ81bTCyhL2+bWopMEaQGzig6aZpcMFy30JBXkJJ8wUP/v7+pYvbrCM
	 rwjn9Swv8rdtQ==
Date: Tue, 30 Jun 2026 01:57:10 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8450: Add IPA support
Message-ID: <1e151b08-5d3b-4b75-8d71-635617868285@proton.me>
In-Reply-To: <66330ed6-826a-431e-9e8e-f2998af55168@oss.qualcomm.com>
References: <20260622-sm8450-ipa-v1-0-532f0299f96e@proton.me> <20260622-sm8450-ipa-v1-1-532f0299f96e@proton.me> <806046b2-20ed-437e-a7e6-b3c0699f5a2d@oss.qualcomm.com> <b1f872f5-66cc-45fc-ad42-c308f8970691@proton.me> <66330ed6-826a-431e-9e8e-f2998af55168@oss.qualcomm.com>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: ef11aeb475485be296f237c5a719643ca92d8730
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115255-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:elder@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[esteuwu@proton.me,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[esteuwu@proton.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[proton.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,proton.me:dkim,proton.me:mid,proton.me:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 666B76DFAEB

On 6/29/26 10:18 AM, Konrad Dybcio wrote:
> Please alter the size of the register range that I mentioned this under,
> as the range is wider than what you specified - the driver takes a big
> offset from this base and accesses far outside the bounds of that range
Just to make sure:

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qco=
m/sm8450.dtsi
index dd151a2c48ec..100daf8120ce 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2643,7 +2643,7 @@ ipa: ipa@3f40000 {
                        compatible =3D "qcom,sm8450-ipa";
=20
                        reg =3D <0 0x3f40000 0 0x10000>,
-                             <0 0x3f50000 0 0x5000>,
+                             <0 0x3f50000 0 0xb0000>,
                              <0 0x3e04000 0 0xfc000>;
                        reg-names =3D "ipa-reg",
                                    "ipa-shared",

Is this what you're referring to?

Regards,
Esteban


