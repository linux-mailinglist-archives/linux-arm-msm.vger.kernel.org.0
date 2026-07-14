Return-Path: <linux-arm-msm+bounces-119007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jPMcKFYOVmp0ygAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 12:24:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3E57535D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 12:24:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="NrQ/iebR";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119007-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119007-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A8037300BD75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 10:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881A136F411;
	Tue, 14 Jul 2026 10:24:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821BC36D51B;
	Tue, 14 Jul 2026 10:24:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784024657; cv=none; b=R8CBuZFdk0FeneErsyw07B5RDm5jvfdUvQOleqxW7B44Iz8uvs2XTfjGJoTiBUPc8iK7eN0VOx5kTZQol9hoKNxndZ4ZVLImb8e0yUiEl8cNmtuttk348Ayq20uuusJ8lbCxmoex72zBBz8bQtG51BHpAdCM/kmcKLeLj8/6EiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784024657; c=relaxed/simple;
	bh=p4oNumYaQvBwjdWHqR2Nsh0WV4eHFiNvU55JJXTj0/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bRtKy3i+j22r0ocN8qnn1pxOvgUrexJ73IvZhsPzLWW2jZUdw9pu8b4Wl8sIFT9Lv5CpgUJBv6zooLXMjxE9c5ADZajF2339zg4k1LYQ9XG3h++Yu28ZlbZwYuc+xx0WxxMy9GLuw/wWMFOZrmcdGJmieA2/QFGoxdiqSHgFD3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NrQ/iebR; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB21C1F000E9;
	Tue, 14 Jul 2026 10:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784024656;
	bh=p4oNumYaQvBwjdWHqR2Nsh0WV4eHFiNvU55JJXTj0/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NrQ/iebR1CLKNkGYdCYtnb1RuR3HVJs5iprXikWU+V2ZuPlYkPAfMP60svR7vMIBm
	 SgBnqD3cYaWU+DyodA8skKHpwMSIK5rc/3Fy6JZOR/kyLJXpLQ5HIO6RrugukOONPe
	 4DprpNpRlQhVJmm7FANRcxQf5OlvloeiPZGlHK7NyT4isHGslyVk6jNEGhtbWj2Z/x
	 IO6oWkWSkbuCoS5O10tbnxJhyE6jnhQGNdrpgHvq6MpFZYp1pADpTaZ3cQsTHfR5XR
	 eHG7k9NaAYrbCJfBr+X89vUAZDsFWaAafZ+5+98+D/nk6wRQrXZ3C7DIX0YxPhKtna
	 5PT3CfR61/vvg==
Date: Tue, 14 Jul 2026 11:24:11 +0100
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
Message-ID: <e387d140-72dd-4db0-8cf4-7de290e8b208@sirena.org.uk>
References: <20260711-add-tracepoints-for-se-reg-dump-v2-0-ca1e9ba62359@oss.qualcomm.com>
 <20260711-add-tracepoints-for-se-reg-dump-v2-2-ca1e9ba62359@oss.qualcomm.com>
 <cc4797fa-6911-45a3-8775-69c2ef32a338@sirena.org.uk>
 <4bcaa245-2127-45aa-bf05-48e275c0129c@oss.qualcomm.com>
 <72cb70b0-d89d-405b-b2b9-807e028d6fd3@sirena.org.uk>
 <788b1ebb-db13-4f6f-9e92-46802d7027f6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="co3LJxi8zGLZv8Hb"
Content-Disposition: inline
In-Reply-To: <788b1ebb-db13-4f6f-9e92-46802d7027f6@oss.qualcomm.com>
X-Cookie: Neutrinos have bad breadth.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
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
	TAGGED_FROM(0.00)[bounces-119007-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F3E57535D7


--co3LJxi8zGLZv8Hb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 14, 2026 at 10:51:42AM +0530, Praveen Talari wrote:
> On 13-07-2026 16:16, Mark Brown wrote:

> > > > SE_GENI_TX_WATERMARK_REG is one of the registers in the tracepoint,
> > > > perhaps trace before we write to clear it?

> > > it will be captured in m_irq register so it is not required to capture.

> > Are you sure that won't lead to user confusion?

> No since m_irq can capture most of other bits as well.

The point isn't that the data isn't somewhere else, the point is that
the user might look at the watermark value and not remember that in this
one specific case they need to check something else.

--co3LJxi8zGLZv8Hb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpWDkoACgkQJNaLcl1U
h9DkwQf9E4RULSMt2MIj+rxa2FU+LWGunfcFQIunLWt+TkxJq/e3avlrN5o0rr69
8c/HTvHbVbJ2xkiX15FR6+aDnJW/1iZJSwkT64KST/DpWhjwCyZlrDEk/vT06EiK
nFinkChp6w73j8nbRKq6x/HQhxZZ5iZVsJdOCmsy2cA1iuJ/1N5SltmQJjJnn3fW
bpTfbxJAZD2A+UJzhvqPizqTIOu+X+tl4ZXPTHxKtToUvT04gAYgqeN56ZW4xLCX
ZJrb2bXXd0546qGS6Rvy1qxcahRop4KV4rz7Ev0yDkvmSgEqjbA4BSq57VYj9h4E
K8XGYJHyJ5yUm5Ju+1cR9OyX6GF1tg==
=uQv2
-----END PGP SIGNATURE-----

--co3LJxi8zGLZv8Hb--

