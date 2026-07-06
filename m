Return-Path: <linux-arm-msm+bounces-116956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pd6iGibxS2qbdQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 20:17:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF5371461F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 20:17:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=BcbDZ7jC;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116956-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116956-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA01B309B54D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 16:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B6F63BD246;
	Mon,  6 Jul 2026 16:14:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A974014A5
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 16:13:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783354441; cv=none; b=Q+cQdkCLrvKXc3E58Do56ppMGEAPbqM1+YempS+UhRUDGDtL6RLZ+fBEZzfIMoNbLyJ0Yl/+HL6/adAQda8owSn9YM3IfLu7TNkS9ML7qwuDBlVNofPcQjLeu8tCBwaHP2hXeh28gIt1zBjG6QbYW4jIz9kTEiYSituUfUbONjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783354441; c=relaxed/simple;
	bh=fSkiMpVUEYl3XEopipwR05J7PwTHPUwofPO4hOYN9Gs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZZfeyv2qeSepLUKkv8u87R40yq44k2vusR3oTLbgvPUqaRpYvY7lM8rFLue1q2TXgv4yMmZByISWtKk9BhIdLGDU602PgyMF6E6QAWNFe/W1EEFfQ2iDuEiLi6HjY0YLoz4UiNYXXDk56OcZkdT2LsiqE9+nEB8cPJC7Kk56Vgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BcbDZ7jC; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C5EFB4E40CB5;
	Mon,  6 Jul 2026 16:13:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9139E601A2;
	Mon,  6 Jul 2026 16:13:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5CC9D11BC0389;
	Mon,  6 Jul 2026 18:13:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783354434; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fSkiMpVUEYl3XEopipwR05J7PwTHPUwofPO4hOYN9Gs=;
	b=BcbDZ7jCRDzTLgEyTmzujpQpst13yNJWuoy1LH0y4GbTMIyi67opMNuEsqqW9C2XLf72BR
	a34XJaYDfm3GgnUJYsgMVEoheV+AJ+fjew2fHKidHgGeFDwJhBKzNe1lqMPNTlpRSazQzK
	+Rpv8FdoLPjlgmyjEZYiFocJ7KZM7pun7pZMTlo41NnXkV6/xiNptIcT9BB4880f7iruec
	tcr44yik6ItLzgC7U4Odey8SJ5WbJbnJKQ34Fqi9JJBDeP8Fk7SFQ8G+CUF3u42LPDb+PY
	R5fNMi+7Uv5phwpv9yYDbUTr5x4blfzKzhm2AJnyqKUHRVH6f5sNoK0MB6hc0w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  linux-mtd@lists.infradead.org,
  linux-arm-msm@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] mtd: rawnand: qcom: Add MDM9607
In-Reply-To: <spaihty2s3zfj7jsv63ex7elf3bwz3bbak5ubageusatdgiodd@qh5gfhhh5ppo>
	(Manivannan Sadhasivam's message of "Mon, 6 Jul 2026 18:00:39 +0200")
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
	<4kdjxrn3bxg7rhkdovidxv2b2f6evnknng7gjtbz7pahyqaakh@qkgxaz6xlav2>
	<akult0UUSSwKQ8F5@linaro.org> <875x2smf39.fsf@bootlin.com>
	<akus-hN7-yf4Y6XU@linaro.org>
	<v4wc36d5slcbq6vsubrpzdoz6x7iq2t2xxlg7onak7fq3bcpjz@kxoqbvi734pp>
	<87y0foji2a.fsf@bootlin.com>
	<spaihty2s3zfj7jsv63ex7elf3bwz3bbak5ubageusatdgiodd@qh5gfhhh5ppo>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 06 Jul 2026 18:13:50 +0200
Message-ID: <878q7ojdtt.fsf@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116956-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:stephan.gerhold@linaro.org,m:richard@nod.at,m:vigneshr@ti.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[miquel.raynal@bootlin.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bootlin.com:from_mime,bootlin.com:dkim,bootlin.com:mid,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BDF5371461F

On 06/07/2026 at 18:00:39 +02, Manivannan Sadhasivam <mani@kernel.org> wrot=
e:

> On Mon, Jul 06, 2026 at 04:42:21PM +0200, Miquel Raynal wrote:
>> On 06/07/2026 at 16:19:04 +02, Manivannan Sadhasivam <mani@kernel.org> w=
rote:
>>=20
>> > On Mon, Jul 06, 2026 at 03:26:18PM +0200, Stephan Gerhold wrote:
>> >> On Mon, Jul 06, 2026 at 03:18:18PM +0200, Miquel Raynal wrote:
>> >> > On 06/07/2026 at 14:55:26 +02, Stephan Gerhold <stephan.gerhold@lin=
aro.org> wrote:
>> >> > > On Mon, Jun 29, 2026 at 05:46:57PM +0200, Manivannan Sadhasivam w=
rote:
>> >> > >> On Mon, Jun 08, 2026 at 03:20:21PM +0200, Stephan Gerhold wrote:
>> >> > >> > MDM9607 has QPIC v1.5 that supports the OP_PAGE_READ_ONFI_READ=
 command, but
>> >> > >> > is missing the rest of the hardware changes in QPIC v2. There =
is also only
>> >> > >> > a single clock that can be controlled using the RPM firmware. =
Document and
>> >> > >> > add the new qcom,mdm9607-nand compatible for this setup.
>> >> > >> >=20
>> >> > >> > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
>> >> > >>=20
>> >> > >> You could ammend patch 1's commit message with the information I=
 shared in the
>> >> > >> reply. But nevertheless:
>> >> > >>=20
>> >> > >> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
>> >> > >>=20
>> >> > >
>> >> > > Do you want me to resend the series with patch 1 commit message
>> >> > > adjusted? There were no other changes requested as far as I can t=
ell.
>> >> >=20
>> >> > I was mostly waiting for answers on my questions from the DT binding
>> >> > maintainers, but I understand they must be too loaded at the moment.
>> >> >=20
>> >> > > I think the current commit message there is fine, especially if y=
ou add
>> >> > > the Link: tag during applying. The extra context will be there.
>> >> > >
>> >> > > If you want me to resend, I would just replace the second paragra=
ph in
>> >> > > patch 1 with the following:
>> >> > >
>> >> > > ---
>> >> > > On MDM9607 and other recent SoCs, the QPIC hardware requires 3 cl=
ocks
>> >> > > (ahb, core, aon). However, the access to these clocks is restrict=
ed to
>> >> > > the RPM firmware that controls the shared power resources for the=
 whole
>> >> > > SoC. The clocks cannot be controlled separately, there is only a =
single
>> >> > > RPM_SMD_QPIC_CLK clock that implicitly enables all of the 3 clock=
s.
>> >> > > The only exception to this are some IPQ* SoC that are not using R=
PM,
>> >> > > there the clocks are directly controlled by the kernel via the cl=
ock
>> >> > > controller (GCC). Require only one clock in the dt-bindings for M=
DM9607
>> >> > > to avoid having to define dummy clock entries.
>> >> >=20
>> >> > I am sorry but this is still incorrect. You don't have to define 2 =
dummy
>> >> > clocks. You would have to define 3 times the same clock (and that's=
 not
>> >> > a problem). I have been working on the concept of clock nexus which
>> >> > may solve this kind of issue in a rather elegant way but that's not
>> >> > ready yet.
>> >> >=20
>> >> > In my opinion the binding that you want to push (a single clock) is
>> >> > wrong, but since I've been explaining this for several weeks alread=
y,
>> >> > please at least fix the commit message and I will take it as you wa=
nt.
>> >> >=20
>> >>=20
>> >> Thanks for your feedback!
>> >>=20
>> >> Either way works for me personally, but now we have a conflict between
>> >> your requested changes and the feedback from Mani, who maintains this
>> >> driver. :-)
>> >>=20
>> >> @Mani: Would you also be fine with defining all 3 clocks in the DT
>> >> ("ahb", "core", "aon") and then assigning the RPM_SMD_QPIC_CLK to all=
 of
>> >> them?
>> >>=20
>> >
>> > AFAIU, devicetree binding should describe the "OS view of the
>> > hardware", not the
>>=20
>> Like Geert pointed out in the below thread, I am equally surprised by
>> this shift but I guess SoC complexity requires adaptations.
>>=20
>> > hardware itself. We have many predecents to this rule. One of them is =
the SCMI
>> > based resource control in Qcom Automotive SoCs, where clocks/regulator=
s to
>> > individual IPs are controlled by the SCMI server and OS just sees a si=
ngle SCMI
>> > power-domain for the IP. So we only describe the SCMI power-domain in =
the
>> > binding and not the physical clocks/regulators received by the IP in h=
ardware.
>> >
>> > We had a recent discussion around the same topic and you can see the r=
eply from
>> > Krzk here: https://lore.kernel.org/all/c83ca485-1e2e-46ba-bd15-1168aa8=
955d3@kernel.org
>> >
>> > So here also, the hardware receives 3 clocks physically, but OS cannot=
 control
>> > all 3 of them, but just a single clock from RPMh which controls the 3 =
real
>> > clocks. Moreover, assigning the same clock to 3 different clock source=
s doesn't
>> > accurately describe the hardware either, because those 3 clocks operat=
e on
>> > different frequencies
>>=20
>> Ah, this is a point that was missing to my understanding. You actually
>> have three *different* clocks, and you control all of them through some
>> kind of firmware proxy called RPMh with a single handle. So basically
>> the kernel just enables one clock and the firmware enables/configures
>> two other clocks differently automatically. Is that it? Feels like you
>> almost need a power domain here.
>>=20
>
> RPMh indeed provides power-domains, but those serve a different purpose t=
han
> the clocks provided by it. RPMh power-domains represent an internal block=
 that
> aggregates votes from different clients like OS, Co-processor etc... and
> controls power to various IPs inside the SoC. Likewise, RPMh also aggrega=
tes
> clock votes from various clients inside the SoC and controls clock inputs=
 to
> various IP blocks.
>
> So both are not the same here.
>
>> > and if the driver queries the frequency of
>> > RPM_SMD_QPIC_CLK, it would just return the same frequency. This is whe=
re the
>> > dummy clock comes handy as it atleast provides a valid clock frequency=
 to the
>> > driver. But I'm not advocating for its usage here anymore.
>> >
>> > Hence IMO, assigning the same RPM_SMD_QPIC_CLK to all 3 clocks is not =
the right
>> > approach and we should be assigning a single RPM_SMD_QPIC_CLK to
>> > 'core' clk.
>>=20
>> You said using three times the same clock would be wrong because we
>> would get three times the same rate whereas in practice it's wrong. This
>> means the OS has access to these clocks somehow,
>
> No, there is no way the OS can access these 3 clocks individually on the =
RPMh
> enabled platforms. But the OS indeed has access to these 3 clocks on non-=
RPMh
> platforms like the older IPQ ones.
>
>> so if we need to
>> describe what the OS sees of the hardware, as you say, defining a single
>> clock is incomplete.
>>=20
>> Again, I am not totally opposed to the single clock idea if you all feel
>> like this is the way forward. Yet, it sounds a bit hackish.
>>=20
>
> I don't see it as a hackish representation, but rather a proper one becau=
se, OS
> only sees a single clock for the NAND controller.

Ok then, I'll go for the new 'not the hardware but what the OS has
access to' motto. I'll wait for v2 with the commit log updated then.

Thanks,
Miqu=C3=A8l

