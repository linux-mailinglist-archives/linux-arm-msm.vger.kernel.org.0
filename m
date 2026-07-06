Return-Path: <linux-arm-msm+bounces-116842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3tLcIcfCS2pVZwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:59:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3957124B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 16:59:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=cSoSugdu;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116842-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116842-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B7CF33AA37E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 13:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA7D40A936;
	Mon,  6 Jul 2026 13:18:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291D6379C50;
	Mon,  6 Jul 2026 13:18:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343906; cv=none; b=Ti+5TqD5k5Rm0RKbhdnnrJrvF+sZ2PWxrfmn3lZmlyaej5MSH90iJ67fpvhrsYTQbwJhIMw4oG77Jg/iIdDAWRgFYrBbyo3b7/Yw/BJOZvoqR0JqpSk6gvB5zFSyFvjwQkMpJgSdYOtOmtXUi1cNf4a+hSz8CDxpNeC7vQnpnAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343906; c=relaxed/simple;
	bh=U0UUTPXYOIMUbfKiPj5WyHNGQxtCYRhMQN2tHOjGjGI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PJSV32a800WzIpiSEfBfiOStdClmB/zYRl0/iq+zLAaZiWGDjjuu6gEy1blQcD9XSaCr3F8XQl0fKh6M+hSFRqGPFWQo24h4ocB8rh/N3hNX+TultoboiSKK9wnJUJrY9W2N00/957vxsxfV9AGC1WP5uUhCeXu9GGOi6OQkqws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cSoSugdu; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 852B0C8EC7B;
	Mon,  6 Jul 2026 13:18:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 66252601A2;
	Mon,  6 Jul 2026 13:18:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C780C11BB817F;
	Mon,  6 Jul 2026 15:18:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783343901; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=U0UUTPXYOIMUbfKiPj5WyHNGQxtCYRhMQN2tHOjGjGI=;
	b=cSoSugduSkj26OSLyr0eg4z0X07uDcmEPgzzCoZ4G5miflrsmGdrvIOatE6BgNtt0iiJG6
	WzZpJnWsVmaHT/XKbJvTYwstnmDNVbAQIbbye7xFfNThHAc/4DCIe7/4VWXaHPv7mYD8LI
	8tvomJnUel812gpqO7ixkDOfIEjlPHZvFfr7+1u0OBmkL0DKLzqiAGDYNpUUuCR37CUEdl
	2u6zoFIvF6O6NOfT0AJvy41LYQ9MlvJdeK2JuT8wX+DWqzJDyM+w19IfLUxDqCBEpIDMTs
	vf7X/F247KGIweN/KPkCdGoAjLG/zvWHvtjsW72LkuiRzQrCA+4jXNzVPJhoOA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  linux-mtd@lists.infradead.org,  linux-arm-msm@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,  Manivannan
 Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 0/4] mtd: rawnand: qcom: Add MDM9607
In-Reply-To: <akult0UUSSwKQ8F5@linaro.org> (Stephan Gerhold's message of "Mon,
	6 Jul 2026 14:55:26 +0200")
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
	<4kdjxrn3bxg7rhkdovidxv2b2f6evnknng7gjtbz7pahyqaakh@qkgxaz6xlav2>
	<akult0UUSSwKQ8F5@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 06 Jul 2026 15:18:18 +0200
Message-ID: <875x2smf39.fsf@bootlin.com>
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
	TAGGED_FROM(0.00)[bounces-116842-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stephan.gerhold@linaro.org,m:richard@nod.at,m:vigneshr@ti.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mani@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,bootlin.com:from_mime,bootlin.com:dkim,bootlin.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C3957124B6

Hi Stephan,

On 06/07/2026 at 14:55:26 +02, Stephan Gerhold <stephan.gerhold@linaro.org>=
 wrote:

> Hi Miqu=C3=A8l,
>
> On Mon, Jun 29, 2026 at 05:46:57PM +0200, Manivannan Sadhasivam wrote:
>> On Mon, Jun 08, 2026 at 03:20:21PM +0200, Stephan Gerhold wrote:
>> > MDM9607 has QPIC v1.5 that supports the OP_PAGE_READ_ONFI_READ command=
, but
>> > is missing the rest of the hardware changes in QPIC v2. There is also =
only
>> > a single clock that can be controlled using the RPM firmware. Document=
 and
>> > add the new qcom,mdm9607-nand compatible for this setup.
>> >=20
>> > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
>>=20
>> You could ammend patch 1's commit message with the information I shared =
in the
>> reply. But nevertheless:
>>=20
>> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
>>=20
>
> Do you want me to resend the series with patch 1 commit message
> adjusted? There were no other changes requested as far as I can tell.

I was mostly waiting for answers on my questions from the DT binding
maintainers, but I understand they must be too loaded at the moment.

> I think the current commit message there is fine, especially if you add
> the Link: tag during applying. The extra context will be there.
>
> If you want me to resend, I would just replace the second paragraph in
> patch 1 with the following:
>
> ---
> On MDM9607 and other recent SoCs, the QPIC hardware requires 3 clocks
> (ahb, core, aon). However, the access to these clocks is restricted to
> the RPM firmware that controls the shared power resources for the whole
> SoC. The clocks cannot be controlled separately, there is only a single
> RPM_SMD_QPIC_CLK clock that implicitly enables all of the 3 clocks.
> The only exception to this are some IPQ* SoC that are not using RPM,
> there the clocks are directly controlled by the kernel via the clock
> controller (GCC). Require only one clock in the dt-bindings for MDM9607
> to avoid having to define dummy clock entries.

I am sorry but this is still incorrect. You don't have to define 2 dummy
clocks. You would have to define 3 times the same clock (and that's not
a problem). I have been working on the concept of clock nexus which
may solve this kind of issue in a rather elegant way but that's not
ready yet.

In my opinion the binding that you want to push (a single clock) is
wrong, but since I've been explaining this for several weeks already,
please at least fix the commit message and I will take it as you want.

Thanks,
Miqu=C3=A8l

