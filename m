Return-Path: <linux-arm-msm+bounces-117148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hsNYIkadTGpfnAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:31:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9E4717FA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 08:31:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=czWmUPtb;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117148-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117148-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E731930154A5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 06:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A13C39FCD8;
	Tue,  7 Jul 2026 06:31:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54036304BDF
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 06:31:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783405892; cv=none; b=okmtsbwImx4tX73eozsqRnuDsW5J71kggaDuDJi4wCJ+RRd0H8PS9j7/WhWZyXuCO5enUaJFeUUS99fh84dF8iisJdCeMr09FC9yMHGRsceR4bRwMqdHY/WA3n7tgps9JCSfW8U9gcu13UHRUtftHFz3zPuIkFvGBbPMtMnF2HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783405892; c=relaxed/simple;
	bh=yjK+MgNVUSfwz13f78upz7ONpUxHIMfFE1ju5M2QNYM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NBjBt5ANfM/YmHgiSC90NRwNn8iscdfdFBIyV3kmPB3A4HGRQCYjuEakaDTMrc23lPTkG/m4NzfAlC81oFpHiWcq5L9JmQUV3O9pX9HHURIVJYKc8TdarpyfXHORIZyVZPD1Y2VHzw5iwRFkCIRHysCRPZnnv2tCX3P1Vb2mAaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=czWmUPtb; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2D5DC1A0EAD;
	Tue,  7 Jul 2026 06:31:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EB227601A3;
	Tue,  7 Jul 2026 06:31:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 194B511BC07A4;
	Tue,  7 Jul 2026 08:31:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783405881; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yjK+MgNVUSfwz13f78upz7ONpUxHIMfFE1ju5M2QNYM=;
	b=czWmUPtbmR23diM2cnPh2/18t5+ILy9oG37sriIJzI4QxsMJyX9JXukEophqNNei0q2oJq
	1kObrXzJ8LIg6SZSju2tsOPI0JL8izPaitQVm6rEw2JyaBCoUc2gOYJ/AkgIOsRgmkaaZc
	UUwsMicirwnvMRbJNp3H2Rr+gmH2adapoBl3pn16i5wPpJfcRxuZY3R3afvCI5nDm2jfIm
	TdXOTvCYSOdHpPzcEJOs3aY43uZBjP036/fB2HD6odYC/erEqSgPONHyljdBqZ9+eWJ8uy
	VdIwyVdspXTVraprOLKY40pUJoOplWh0TNOVLmvdpr9AJsmSfp5QXZudBoEizw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,  Stephan Gerhold
 <stephan.gerhold@linaro.org>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  linux-mtd@lists.infradead.org,
  linux-arm-msm@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] mtd: rawnand: qcom: Add MDM9607
In-Reply-To: <47bd85c0-f015-4c43-b616-c249596d7537@kernel.org> (Krzysztof
	Kozlowski's message of "Mon, 6 Jul 2026 18:18:15 +0200")
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
	<4kdjxrn3bxg7rhkdovidxv2b2f6evnknng7gjtbz7pahyqaakh@qkgxaz6xlav2>
	<akult0UUSSwKQ8F5@linaro.org> <875x2smf39.fsf@bootlin.com>
	<akus-hN7-yf4Y6XU@linaro.org>
	<v4wc36d5slcbq6vsubrpzdoz6x7iq2t2xxlg7onak7fq3bcpjz@kxoqbvi734pp>
	<87y0foji2a.fsf@bootlin.com>
	<spaihty2s3zfj7jsv63ex7elf3bwz3bbak5ubageusatdgiodd@qh5gfhhh5ppo>
	<47bd85c0-f015-4c43-b616-c249596d7537@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 07 Jul 2026 08:31:15 +0200
Message-ID: <8733xvjop8.fsf@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117148-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:mani@kernel.org,m:stephan.gerhold@linaro.org,m:richard@nod.at,m:vigneshr@ti.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[miquel.raynal@bootlin.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:from_mime,bootlin.com:dkim,bootlin.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EA9E4717FA0

On 06/07/2026 at 18:18:15 +02, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 06/07/2026 18:00, Manivannan Sadhasivam wrote:
>> On Mon, Jul 06, 2026 at 04:42:21PM +0200, Miquel Raynal wrote:
>>=20
>>>> and if the driver queries the frequency of
>>>> RPM_SMD_QPIC_CLK, it would just return the same frequency. This is whe=
re the
>>>> dummy clock comes handy as it atleast provides a valid clock frequency=
 to the
>>>> driver. But I'm not advocating for its usage here anymore.
>>>>
>>>> Hence IMO, assigning the same RPM_SMD_QPIC_CLK to all 3 clocks is not =
the right
>>>> approach and we should be assigning a single RPM_SMD_QPIC_CLK to
>>>> 'core' clk.
>>>
>>> You said using three times the same clock would be wrong because we
>>> would get three times the same rate whereas in practice it's wrong. This
>>> means the OS has access to these clocks somehow,
>>=20
>> No, there is no way the OS can access these 3 clocks individually on the=
 RPMh
>> enabled platforms. But the OS indeed has access to these 3 clocks on non=
-RPMh
>> platforms like the older IPQ ones.
>
> I think RPMh is a bit different case than recently discussed SCMI
> firmware layer, although maybe the true difference is irrelevant -
> whoever implements the clock handling, it is not Linux. Anyway, in case
> of SCMI this is the same die having either firmware or OS controlling
> clocks.
>
> Here the SoCs (IPO ones without RPMh and this one with RPMh) are differen=
t.
>
> If this was some bus device (I2C, SPI etc), then I would argue that the
> device pins matter.
>
> However this is internal part of the SoC, so while it still has some
> wirings, they are heavily hidden or abstracted, thus I am fine with
> approach that clocks represent the clock interfaces available to the OS,
> not the physical wires inside SoC.

Thank you very much for this feedback. I understand the rationale, and
will keep that in mind for future reviews.

Best regards,
Miqu=C3=A8l

