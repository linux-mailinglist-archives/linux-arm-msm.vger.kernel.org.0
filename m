Return-Path: <linux-arm-msm+bounces-117363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FxO8Ee4qTWpFwAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 18:35:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E725271DE82
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 18:35:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=proton.me header.s=protonmail header.b=I0uTCUbL;
	dmarc=pass (policy=quarantine) header.from=proton.me;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117363-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117363-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 70D483009B3D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 16:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B70435A9B;
	Tue,  7 Jul 2026 16:34:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-106121.protonmail.ch (mail-106121.protonmail.ch [79.135.106.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A28C4434E5D;
	Tue,  7 Jul 2026 16:34:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783442091; cv=none; b=YGGRdD0/Fy1Z3X/DZx+76MhLta9BjWVaXY6j+OgaI6y7pnklRHonaYSPhFCSQAAMT0ejegC3hBiy+SfJDbhl9enzXwuvgqL2Fzn9Q2ZR6LhwVG/a5oC/+vjZegX9D3z2T2B8/8Ck5/h+3tN8+MiwTF0YAjCNnMckhiu/3fPnCKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783442091; c=relaxed/simple;
	bh=Mzs8SuveZMo5RAd1ZZoYdnYkNRzqIAba+zrREv7yGOI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EX5UF9PbZGCoVgLBisHlke/Wps3wL9SajOxStgsi+7WMmy5p4sPjkCpN7Q6Xtyi5s/Y0g/BfmMLwO4DHbnwjl677atQkoS/HdnmQcmKMdvwj/VYwZTXZ7tUJ1wQlNYvW8nXdhu4NniDwGBIbE4O+y45hJLnJCzn20yA3u2YtDJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=I0uTCUbL; arc=none smtp.client-ip=79.135.106.121
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1783442085; x=1783701285;
	bh=e1mEXN3Io1+cxS8ymD1K/F8t95agWjX3EwyhwfhzKIw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=I0uTCUbLfIf/k8Yyl/dFVy5xj2obGWjaPB/uhDp6vua4d5flxTzHvn9BfShSwx7AS
	 +dQFwnNXhHUyyBxh0Yvpqv4KFGwfHc4UNBBxNv/Qex4EPkflfhmp780L2LoozdXQOF
	 lrx9TNBvWZqPnaO4et9/vIfpSclIcb9jhXIeWj0v8ZeKRASeU7J1vZRvvDr1wMKmld
	 HO1ZC+8UMkOiRo4+b4ALvgfi4c9Hg3wA2bMPeMTdUvBw6DtkWmOnKXTZOh3OcINNHx
	 0csB6HJilTIN9jVNGLS3eXMG5qLFRROAZl161JHmgmy7cLGcB1eiW++4UFGSjbW8jC
	 H4bNY9lVExxGg==
Date: Tue, 07 Jul 2026 16:34:40 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Alex Elder <elder@kernel.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8450: Add IPA support
Message-ID: <3b7d997c-ecea-46d1-9e5a-effad3486676@proton.me>
In-Reply-To: <4afa8797-1cb1-4cf1-bdbd-9cb5725377b8@oss.qualcomm.com>
References: <20260622-sm8450-ipa-v1-0-532f0299f96e@proton.me> <20260622-sm8450-ipa-v1-1-532f0299f96e@proton.me> <806046b2-20ed-437e-a7e6-b3c0699f5a2d@oss.qualcomm.com> <b1f872f5-66cc-45fc-ad42-c308f8970691@proton.me> <66330ed6-826a-431e-9e8e-f2998af55168@oss.qualcomm.com> <1e151b08-5d3b-4b75-8d71-635617868285@proton.me> <4afa8797-1cb1-4cf1-bdbd-9cb5725377b8@oss.qualcomm.com>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 2c3f07974c2d266b2db99000671eb75cfc5fb6d8
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117363-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,proton.me:from_mime,proton.me:dkim,proton.me:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E725271DE82

On 7/7/26 6:35 AM, Konrad Dybcio wrote:
> Yes

On SM8475 I get this warning though:

[    9.551813] ipa 3f40000.ipa: limiting IPA memory size to 0x00005000

Both SM8450 and SM8475 use the same IPA version, so that shouldn't be an
issue.
On SM8550 and SM8650 this area is set to 0x5000 as well.
What should the proper solution be?

Regards,
Esteban


