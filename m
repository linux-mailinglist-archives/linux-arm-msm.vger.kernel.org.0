Return-Path: <linux-arm-msm+bounces-116905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qkTRFtPDS2qeZwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:03:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB73712571
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:03:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b="mmAwpS/o";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116905-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116905-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BDDE6316C369
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 14:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2F13A168B;
	Mon,  6 Jul 2026 14:42:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4168740A953;
	Mon,  6 Jul 2026 14:42:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348949; cv=none; b=RwRxnfLxkDQFjpPq1mGcxzzoR9HRuWK2BHBiRJyvp4wtEVM9fGHU7QwjNHPUeR60fRqMmesICIUHSVWEHbJUlCUFWpXtMS5m3JZSirjUl0Qbc+dKA/e8Z3NnnZXJI6JPcp2Y7W/S7gv1NfusZGR3k44KmjuThq/2RRctbNVVfAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348949; c=relaxed/simple;
	bh=9S6JUkNd7tEQQ570HblFbe1x5CYX/+kx5Sg029EJZYI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lW0ASLK49yl8hbZqGYPg02fnR2Pz6buhhT6oCSiE9ThyAJpqMxyBMvE9rvhQBPoI4m2w6HXCuMrkYKDFLwX+1KeQ8Bz2fhlYxeNHva7rjPRjZQTrZM6A91n6f+dRV1/q8ARt3j0wJe+JNYYqmYWNbT9ng2btfVKYjDjIqQ2Sr/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mmAwpS/o; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BF9574E40CB4;
	Mon,  6 Jul 2026 14:42:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 91FDE601A2;
	Mon,  6 Jul 2026 14:42:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9AD0B11BBA42D;
	Mon,  6 Jul 2026 16:42:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783348944; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9S6JUkNd7tEQQ570HblFbe1x5CYX/+kx5Sg029EJZYI=;
	b=mmAwpS/o6e/t/IuGRCLGVMC0hpbEhsm/aB1rAJrSfy85oGyILbzuFfbnS3x56EKHJkM7VH
	RPvUAyYjsjn9kdm/Ore5gKqIK4AnIYMYLN+xvGsP+NHuqhhsDqH4ox8ud8dsYuXmF25gMB
	DK4IZq8jroh3tyz1Fe+ix+PTG04853qpCetpk3el7lcfZWStSpfmY+vbgfmJQcbewqInnW
	yTDbLqh+f266pScqhWEO4zqW18gqZbhFtmkIKNcS/Se5pd0Xd6ZBDrMeF6ZmAGrN7QAhYP
	9Fxrq5ySIp7af3c8HjFaUSa57otHb8IkXL8TDecMalOHJnGDUzDPvfi+ZyoOeg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  linux-mtd@lists.infradead.org,
  linux-arm-msm@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] mtd: rawnand: qcom: Add MDM9607
In-Reply-To: <v4wc36d5slcbq6vsubrpzdoz6x7iq2t2xxlg7onak7fq3bcpjz@kxoqbvi734pp>
	(Manivannan Sadhasivam's message of "Mon, 6 Jul 2026 16:19:04 +0200")
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
	<4kdjxrn3bxg7rhkdovidxv2b2f6evnknng7gjtbz7pahyqaakh@qkgxaz6xlav2>
	<akult0UUSSwKQ8F5@linaro.org> <875x2smf39.fsf@bootlin.com>
	<akus-hN7-yf4Y6XU@linaro.org>
	<v4wc36d5slcbq6vsubrpzdoz6x7iq2t2xxlg7onak7fq3bcpjz@kxoqbvi734pp>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 06 Jul 2026 16:42:21 +0200
Message-ID: <87y0foji2a.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116905-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:stephan.gerhold@linaro.org,m:richard@nod.at,m:vigneshr@ti.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[miquel.raynal@bootlin.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,bootlin.com:from_mime,bootlin.com:dkim,bootlin.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EAB73712571

On 06/07/2026 at 16:19:04 +02, Manivannan Sadhasivam <mani@kernel.org> wrot=
e:

> On Mon, Jul 06, 2026 at 03:26:18PM +0200, Stephan Gerhold wrote:
>> On Mon, Jul 06, 2026 at 03:18:18PM +0200, Miquel Raynal wrote:
>> > On 06/07/2026 at 14:55:26 +02, Stephan Gerhold <stephan.gerhold@linaro=
.org> wrote:
>> > > On Mon, Jun 29, 2026 at 05:46:57PM +0200, Manivannan Sadhasivam wrot=
e:
>> > >> On Mon, Jun 08, 2026 at 03:20:21PM +0200, Stephan Gerhold wrote:
>> > >> > MDM9607 has QPIC v1.5 that supports the OP_PAGE_READ_ONFI_READ co=
mmand, but
>> > >> > is missing the rest of the hardware changes in QPIC v2. There is =
also only
>> > >> > a single clock that can be controlled using the RPM firmware. Doc=
ument and
>> > >> > add the new qcom,mdm9607-nand compatible for this setup.
>> > >> >=20
>> > >> > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
>> > >>=20
>> > >> You could ammend patch 1's commit message with the information I sh=
ared in the
>> > >> reply. But nevertheless:
>> > >>=20
>> > >> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
>> > >>=20
>> > >
>> > > Do you want me to resend the series with patch 1 commit message
>> > > adjusted? There were no other changes requested as far as I can tell.
>> >=20
>> > I was mostly waiting for answers on my questions from the DT binding
>> > maintainers, but I understand they must be too loaded at the moment.
>> >=20
>> > > I think the current commit message there is fine, especially if you =
add
>> > > the Link: tag during applying. The extra context will be there.
>> > >
>> > > If you want me to resend, I would just replace the second paragraph =
in
>> > > patch 1 with the following:
>> > >
>> > > ---
>> > > On MDM9607 and other recent SoCs, the QPIC hardware requires 3 clocks
>> > > (ahb, core, aon). However, the access to these clocks is restricted =
to
>> > > the RPM firmware that controls the shared power resources for the wh=
ole
>> > > SoC. The clocks cannot be controlled separately, there is only a sin=
gle
>> > > RPM_SMD_QPIC_CLK clock that implicitly enables all of the 3 clocks.
>> > > The only exception to this are some IPQ* SoC that are not using RPM,
>> > > there the clocks are directly controlled by the kernel via the clock
>> > > controller (GCC). Require only one clock in the dt-bindings for MDM9=
607
>> > > to avoid having to define dummy clock entries.
>> >=20
>> > I am sorry but this is still incorrect. You don't have to define 2 dum=
my
>> > clocks. You would have to define 3 times the same clock (and that's not
>> > a problem). I have been working on the concept of clock nexus which
>> > may solve this kind of issue in a rather elegant way but that's not
>> > ready yet.
>> >=20
>> > In my opinion the binding that you want to push (a single clock) is
>> > wrong, but since I've been explaining this for several weeks already,
>> > please at least fix the commit message and I will take it as you want.
>> >=20
>>=20
>> Thanks for your feedback!
>>=20
>> Either way works for me personally, but now we have a conflict between
>> your requested changes and the feedback from Mani, who maintains this
>> driver. :-)
>>=20
>> @Mani: Would you also be fine with defining all 3 clocks in the DT
>> ("ahb", "core", "aon") and then assigning the RPM_SMD_QPIC_CLK to all of
>> them?
>>=20
>
> AFAIU, devicetree binding should describe the "OS view of the
> hardware", not the

Like Geert pointed out in the below thread, I am equally surprised by
this shift but I guess SoC complexity requires adaptations.

> hardware itself. We have many predecents to this rule. One of them is the=
 SCMI
> based resource control in Qcom Automotive SoCs, where clocks/regulators to
> individual IPs are controlled by the SCMI server and OS just sees a singl=
e SCMI
> power-domain for the IP. So we only describe the SCMI power-domain in the
> binding and not the physical clocks/regulators received by the IP in hard=
ware.
>
> We had a recent discussion around the same topic and you can see the repl=
y from
> Krzk here: https://lore.kernel.org/all/c83ca485-1e2e-46ba-bd15-1168aa8955=
d3@kernel.org
>
> So here also, the hardware receives 3 clocks physically, but OS cannot co=
ntrol
> all 3 of them, but just a single clock from RPMh which controls the 3 real
> clocks. Moreover, assigning the same clock to 3 different clock sources d=
oesn't
> accurately describe the hardware either, because those 3 clocks operate on
> different frequencies

Ah, this is a point that was missing to my understanding. You actually
have three *different* clocks, and you control all of them through some
kind of firmware proxy called RPMh with a single handle. So basically
the kernel just enables one clock and the firmware enables/configures
two other clocks differently automatically. Is that it? Feels like you
almost need a power domain here.

> and if the driver queries the frequency of
> RPM_SMD_QPIC_CLK, it would just return the same frequency. This is where =
the
> dummy clock comes handy as it atleast provides a valid clock frequency to=
 the
> driver. But I'm not advocating for its usage here anymore.
>
> Hence IMO, assigning the same RPM_SMD_QPIC_CLK to all 3 clocks is not the=
 right
> approach and we should be assigning a single RPM_SMD_QPIC_CLK to
> 'core' clk.

You said using three times the same clock would be wrong because we
would get three times the same rate whereas in practice it's wrong. This
means the OS has access to these clocks somehow, so if we need to
describe what the OS sees of the hardware, as you say, defining a single
clock is incomplete.

Again, I am not totally opposed to the single clock idea if you all feel
like this is the way forward. Yet, it sounds a bit hackish.

> @krzk: Can you share your opinion?

Thanks,
Miqu=C3=A8l

