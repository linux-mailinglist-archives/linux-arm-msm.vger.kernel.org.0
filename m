Return-Path: <linux-arm-msm+bounces-114265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JlvaJmI4O2oVTQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 03:52:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0C86BAD5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 03:52:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=proton.me header.s=protonmail header.b=GhsNbA05;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114265-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114265-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=proton.me;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 50E0F303D814
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 01:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 315AD22D792;
	Wed, 24 Jun 2026 01:52:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D079A238171;
	Wed, 24 Jun 2026 01:52:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782265946; cv=none; b=OI+8602AHFixYyMRVBS6vthJw8Dsjbo9QlNOZKUIxAACU/pwZVMTplFD4C3j0AZ2ZPsnfV06QftmRhq7trCh2bxNNd8Ilo5cIN/f1MnLWzTHBz83XqAH/tccr1kJ1c7C055N37JMgg6Hk3QdjrlXBU30XWIGEnG/+XlC1n95ryc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782265946; c=relaxed/simple;
	bh=kUWgSY2kxKAcWmKIuycXxqSBSlQg+3S5pklblzvoN5Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ohYm8+L5ux9O5Wahzv9o27rCARkUpdOJUvxUObKrFVl4qAyyDExH6v1ErhcYYj1W/qnpmUnok45vQ6tqbCuOZrPkhlN3mRMVnJHmLmoV3v6H7i0aQ7+syBDCNIUnqmZK1YqAyXmsDtkS5b6opg2bKPfrrHFJrvtIPhyekrViL5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=GhsNbA05; arc=none smtp.client-ip=109.224.244.18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1782265934; x=1782525134;
	bh=kUWgSY2kxKAcWmKIuycXxqSBSlQg+3S5pklblzvoN5Y=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GhsNbA05s08p64h/BiqmkBpmUTA9uutN1cZpEhSDKGxr7lTpH0FP9dBRUu/dXRw8I
	 e50osvcWKAbQcFBJ5ds2q2J5JdB7iQyj0n1z94BKqzbLqyfajwWaC/wcN2EnzhJFPs
	 PUmFwE/raz6PYMQ06PUExb7FJAMQogByK2n+K7JCVXjp+Ds3y5iryEq9HHwCYLLtjV
	 MTXSKTIfjfWnDMwGiAzl0LwFGETBiYxpPXS9VH7KMBDUOYrQRVK9ydU+3k1qYFdk0V
	 Yr6Pd2/Lc5DZ2u7U/MvSOShLSb6vz14XJsRePLq4yJUu8a9GyUNH3nMVa2wcsuixyD
	 Aa/9sDYSYv+8g==
Date: Wed, 24 Jun 2026 01:52:07 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8450: Add IPA support
Message-ID: <b1f872f5-66cc-45fc-ad42-c308f8970691@proton.me>
In-Reply-To: <806046b2-20ed-437e-a7e6-b3c0699f5a2d@oss.qualcomm.com>
References: <20260622-sm8450-ipa-v1-0-532f0299f96e@proton.me> <20260622-sm8450-ipa-v1-1-532f0299f96e@proton.me> <806046b2-20ed-437e-a7e6-b3c0699f5a2d@oss.qualcomm.com>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: ea45ab5fb6d49a38f2da8add30cfb2bb0dfe5677
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114265-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:dkim,proton.me:mid,proton.me:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E0C86BAD5A

On 6/23/26 5:37 AM, Konrad Dybcio wrote:
> size =3D 0xb0000 for the RAM and uC regions that the driver seems
> to poke at (at a glance anyway..)

Sorry, I don't quite understand. Could you please clarify?

> base=3D0x1468_0000
> size=3D0x40_000

Noted, will fix in v2.

Regards,
Esteban


