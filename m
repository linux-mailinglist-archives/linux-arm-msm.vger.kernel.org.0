Return-Path: <linux-arm-msm+bounces-118420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CUpqOwVlUWqtDwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 23:32:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A88873EF8C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 23:32:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=AXRARrC+;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118420-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118420-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E457E304C13F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 21:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7990A3CFF50;
	Fri, 10 Jul 2026 21:26:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0BE3BF665;
	Fri, 10 Jul 2026 21:26:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718801; cv=none; b=RXIs0SgYmPajxNCL+zyhD+uiGfkM9n9BV51+4n2NIZjINOMg/8RvXNOLOCYZuziwITHsOLIJ32KwEs0ibKE6aUyKffQ4ShABLdlxHl/KCWS6sazMEZenimuP/qL0l72JrxRbxThkmj/RLyB0dKdVy2arWH9yEpqvWm9UCkPAsXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718801; c=relaxed/simple;
	bh=IrFMV4oGITrYeOHCrr3VqFpg6+Zsvxn5Zb91RHBDn70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CGcjbw2mJZpXf9an/968WXr3kV5WIPcgDts/j+1t5NqGnACzyRz82O/3BOvKcizs2tzThgBn3G35lxJcM8C/eXLab5BpiGixgcdnro59DjdExaI/prgltJ2JlwFWPcBO6mOAlSBokIMq5xBcaG4h8e1tIlm8gTPkV7HYTUbe39g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AXRARrC+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8FA31F01805;
	Fri, 10 Jul 2026 21:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783718796;
	bh=uD6htahkgcYYoDLNVJc8u1TF30tTz5i48QncIScBRqU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AXRARrC+LaL2nhX2ksKRfZwB8kHRcEpOYX3+RtGGqQm9aZZgWu1TyA9YvjAPqR46k
	 1/cNzWwdah7tBlvjZsNdYS0MuYXvp+Fufx3FhCZVO4JQL+pZuyyRe4ZSPkXUPQTJnf
	 Oza8mXo2mINBRuejTzwnQD2vqWwMYObGwCgqREstU27AqFakgBR4zu1wQ8aC05y4uz
	 Lbti/0oW+7K49Pe/cK87E7u4rze/YUSoQvCWOpdd2LoUsqY0Pc22ZeBva8RClbDMBl
	 Ym2OZdumTS/+QqXP+/tXZRFaW248C7saLF3myHcbP+s7xikqCto9VkOdUWF996I7mz
	 7Xv1ENSQ7QPJw==
Date: Fri, 10 Jul 2026 22:26:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] spi: qcom-geni: add GENI SE registers trace event
 on error paths
Message-ID: <cc4797fa-6911-45a3-8775-69c2ef32a338@sirena.org.uk>
References: <20260711-add-tracepoints-for-se-reg-dump-v2-0-ca1e9ba62359@oss.qualcomm.com>
 <20260711-add-tracepoints-for-se-reg-dump-v2-2-ca1e9ba62359@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Lw4bHw3gKlYqq4/a"
Content-Disposition: inline
In-Reply-To: <20260711-add-tracepoints-for-se-reg-dump-v2-2-ca1e9ba62359@oss.qualcomm.com>
X-Cookie: No directory.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-spi@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-118420-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A88873EF8C


--Lw4bHw3gKlYqq4/a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 11, 2026 at 12:18:42AM +0530, Praveen Talari wrote:

> The GENI SPI driver reports various transfer failures such as command
> timeouts, DMA reset timeouts, DMA transaction errors, and unexpected
> interrupt conditions. However, diagnosing the root cause of these
> failures is difficult as the hardware state is not captured when the
> error occurs.

> +#include <trace/events/qcom_geni_se.h>

Should this be in rivers/soc/qcom/qcom-geni-se.c (and the first patch?)
- that way if another driver starts using them we won't multiply define
the tracepoints.

> @@ -986,10 +997,13 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
>  					writel(0, se->base + SE_GENI_TX_WATERMARK_REG);
>  					dev_err(mas->dev, "Premature done. tx_rem = %d bpw%d\n",
>  						mas->tx_rem_bytes, mas->cur_bits_per_word);
> +					trace_geni_se_regs(se);

SE_GENI_TX_WATERMARK_REG is one of the registers in the tracepoint,
perhaps trace before we write to clear it?

--Lw4bHw3gKlYqq4/a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpRY4YACgkQJNaLcl1U
h9DaQQf/V9ofytEnsFFwGweLPOJ52okuv+hIdRB/hWRWwuNh4N45IK/PScOWQxXb
AeUiovvZXlK3/96XEF4sSojfyjrd+bVUQeUdhkX6scgvwiRdjsO5wBBmBySqQmcb
gVzGYB+PXa0WI86EglOIwxwin3lzxKML3gtObYNHpeU/QEMt3edwSy2lpwADQ9EG
afgPZGwtHIWnqOma95DBEqT/9BQAe0rdRZPzQcNFP5+Gx0u4pJMFw9FVT/XNZ8Zb
WGIb/cEZ9HPlhf67e4fm+fvug0gKkD2bsWiJpdsl5hp8q5oYO3C52c/HucOjU3Wy
qAGFyGegPEjWu3n1Liy1ve5pzrzN0w==
=yoWN
-----END PGP SIGNATURE-----

--Lw4bHw3gKlYqq4/a--

