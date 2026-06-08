Return-Path: <linux-arm-msm+bounces-111866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xda8KjC1Jmo8bgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 14:27:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 29636656277
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 14:27:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cGoBXZXK;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111866-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111866-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 68743307176D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 12:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4BAE372EE3;
	Mon,  8 Jun 2026 12:19:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6A721E097;
	Mon,  8 Jun 2026 12:19:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780921175; cv=none; b=WZV22M9GijBAwlcO3ba+kpXBb1n6CH2L/YzScZ8BiNxP2rxJTZ8iPOXUFeWvO8K+NCCu0WBl+YG9DkXw7VF6MRjUm4qTs19Okn8YdMPNouHpyIgbkmnpZnOleC8QvQSblLiaGDsPkYbQf4uV6dWdj6kzGpF36sb1vroPqUEJhGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780921175; c=relaxed/simple;
	bh=9xBN8ZfeV/61agqU6fNx1pPHTks1dd2IBrp9zQOPBNs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QdMaL2c7SGcwWeW3g5LReCb7BaVd561qrrLCtLxDBb01wG9GQXPxCqM10kPRv04fgV9o2FBLSZCEHBlGKAzzjy3lT1TOYkMh+TX/grbbyKGN7IZnAm1o+yc4jeV6MPExXV/jwDlr5m3btRBTmhecbrWRqJ6w9agdTpE5cQ2N3ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cGoBXZXK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 492861F00893;
	Mon,  8 Jun 2026 12:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780921174;
	bh=gotQ++StfUfpKWWWmSgjZS4aIleilC7zYz8NAL8eJKY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=cGoBXZXKFFVPYIax4hmd9ZLPJA2jt8HRmS5unvkHhJPf576cUY7cFFXHA2F3k+cWY
	 Hw+P8IL8td1n4uCGmc66Ig4LlvCpEcxcq6GZi1Ph9qUpgajumH88m7sNWSUKmtYWNS
	 WTSgfippI3vpyM3EbzaTYqI0WA+7SCdY+N/YK7LyDz/Qjx37um2E41R3ny6z94XhF2
	 OVLMBqw0W6UDB+4QyhxAGkqEaSrDjpdpb+tzDqENvfR4DbWoz98ebATus32hkRN3r/
	 qdWsfxeKaiwSX3RZ/KwIMtv5XpAkBpLDppG8fQykZzQLYpT92SOzlSQjhabHoGsNRG
	 lAKrWLPSzCW+A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wWYx2-0000000ASz0-0ZPa;
	Mon, 08 Jun 2026 12:19:32 +0000
Date: Mon, 08 Jun 2026 13:19:31 +0100
Message-ID: <86qzmhteb0.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: jens.glathe@oldschoolsolutions.biz,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley
 <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Steev Klimaszewski <threeway@gmail.com>,
	Icecream95 <ixn@disroot.org>
Subject: Re: [PATCH RFC] arm64: dts: qcom: hamoa: Drop cluster_cl5 idle state from CPU clusters
In-Reply-To: <2fff4ddf-ea2e-48da-8a7e-e58075597b00@oss.qualcomm.com>
References: <20260604-dc_zva_mitigation-v1-1-d1148c1c0259@oldschoolsolutions.biz>
	<87bjdp9znw.wl-maz@kernel.org>
	<2fff4ddf-ea2e-48da-8a7e-e58075597b00@oss.qualcomm.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: konrad.dybcio@oss.qualcomm.com, jens.glathe@oldschoolsolutions.biz, andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, threeway@gmail.com, ixn@disroot.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[oldschoolsolutions.biz,kernel.org,vger.kernel.org,gmail.com,disroot.org];
	TAGGED_FROM(0.00)[bounces-111866-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:jens.glathe@oldschoolsolutions.biz,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:threeway@gmail.com,m:ixn@disroot.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[maz@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maz@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29636656277

On Mon, 08 Jun 2026 12:40:02 +0100,
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
> 
> On 6/5/26 10:09 AM, Marc Zyngier wrote:
> > Hi Jens,
> > 
> > Thanks for sending this.
> 
> [...]
> 
> > It may be worth adding a comment somewhere in the DTS file, as
> > cluster_cl5 is not referenced anymore.
> > 
> > Ideally we'd simply mark cluster-sleep-1 with 'status = "disabled"',
> > but I'm not sure Linux (and other OSs that consume this) actively
> > parse this property.
> > 
> > Overall, I'd like clarity from the vendor on what can be done to
> > better mitigate issues like this. So far, we have been randomly
> > disabling features and CPU capabilities each and every time we find
> > something broken on these machines, and the list is getting long.
> > 
> > I don't think such course of action is sustainable, and maybe we
> > should simply consider marking the full X1 platform as BROKEN so that
> > people know what to expect.
> 
> Many "Linux-facing" people have been OoO and/or attending various
> conferences and an internal sprint for the past 2-3 weeks in a row,
> so there weren't a lot of eyes on this.. We're looking into it now.

This isn't about "Linux-facing" people availability this month or even
over the past 18 months. This doesn't even have anything to do with
Linux at all. This is about an ongoing stream of issues that have been
reported and constantly ignored since this HW made it in the wild.

For example, two of my personal favourites:

- accesses to CNTPOFF_EL2 reset the machine. This has been documented
  for since 358dd4a9bdac6 ("arm64: Add command-line override for
  ID_AA64MMFR0_EL1.ECV").

- CNTVOFF_EL2 not being consistently honoured results in screaming
  timer interrupts. This has been documented since 0bc9a9e85fcf4
  ("KVM: arm64: Work around x1e's CNTVOFF_EL2 bogosity").

I don't mind broken HW. It's almost a reassuring invariant. But this
level of brokenness without any form of acknowledgement of the issues,
nor any proposed workarounds is not acceptable. Specially when
people's data is at stake.

Which is why I think CONFIG_BROKEN=y is the right form of safety guard
against all of this until someone gets to the bottom of these things.

	M.

-- 
Without deviation from the norm, progress is not possible.

