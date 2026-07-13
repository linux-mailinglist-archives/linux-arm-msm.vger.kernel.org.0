Return-Path: <linux-arm-msm+bounces-118737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id J+UPMBrCVGr+SAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:46:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 623CA749F19
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:46:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=LLOsNHtY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118737-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118737-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E624301EC52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A9E34AB01;
	Mon, 13 Jul 2026 10:46:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DB137E2EC;
	Mon, 13 Jul 2026 10:46:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783939605; cv=none; b=rHM9kEGAm4/fXWRL/FI1CTrkj3G+KUH0PAoCqLo9HXQBBShiFqT4fHso7EHVGj6kwdjB2ma42+q0eoe/Zwrr+u3QTBwEdLpJ0T5ad48Dzvz37OGGJuN3mMWxW41tOT+MWmpAS5/cXgNMkzDZZl3YLp6OxDLD2dEx9EL+KCMhkjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783939605; c=relaxed/simple;
	bh=cXxx9WHkC3p7jLTx5YHr98Gkiqqday09PJ2zl2CCGQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCShg/CUJUk0ZzMzXFbVVQ7JuQAG0QjZG7REVudoHQZVP1enmSQy5I7xBOuJUVtHVRs7RMOcqQeKpsQt2zusIUnPm+C+En2cDbuR8Qqo6Q9czcEx3N/I1LiU7ZyhbpudhqNf4YGw+8IEXJ/HWKw2t1bsQ/HsgTNIbMXhDvKyoHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LLOsNHtY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37AE51F000E9;
	Mon, 13 Jul 2026 10:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783939602;
	bh=EZRzhdUs3AXtcY6EK2eOQmkcfCSHRUOtCcuL3d1csdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LLOsNHtYWk5duzyuSLQMHnKDS8PuJQAO+FcPCh5vvRkgjTA+jw5LzjivCmebL4Pt+
	 kyfSwyP4yJjQ/0C/wqyWfTjBXous0KrKUYF/wfsMzAYylFVfJewBBVt46dTGiNRRTD
	 f4RtrzJSZTxeSE+Qo+OPchKo6Xmcxw2YRpwL+E09j4yFLJ4ghEf1p1hJdn92i3yT14
	 mqu17sduUJIWHs/Cv69s0VwakMwXDTHGoONRlG7Go4M8iKabYyxaicMyUDUIOg/DJS
	 oMohfj1EqBnxbo/lS5BzZhoQnq/AE6eBd/VRf59yNvQHTurFzZJj1th6CZJJSHKaAD
	 QJGWjvsRFDs+g==
Date: Mon, 13 Jul 2026 11:46:37 +0100
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
Message-ID: <72cb70b0-d89d-405b-b2b9-807e028d6fd3@sirena.org.uk>
References: <20260711-add-tracepoints-for-se-reg-dump-v2-0-ca1e9ba62359@oss.qualcomm.com>
 <20260711-add-tracepoints-for-se-reg-dump-v2-2-ca1e9ba62359@oss.qualcomm.com>
 <cc4797fa-6911-45a3-8775-69c2ef32a338@sirena.org.uk>
 <4bcaa245-2127-45aa-bf05-48e275c0129c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gFM2XcDEhmPrjI2W"
Content-Disposition: inline
In-Reply-To: <4bcaa245-2127-45aa-bf05-48e275c0129c@oss.qualcomm.com>
X-Cookie: Courage is grace under pressure.
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.26 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
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
	TAGGED_FROM(0.00)[bounces-118737-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 623CA749F19


--gFM2XcDEhmPrjI2W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 11, 2026 at 08:21:02AM +0530, Praveen Talari wrote:
> On 11-07-2026 02:56, Mark Brown wrote:
> > On Sat, Jul 11, 2026 at 12:18:42AM +0530, Praveen Talari wrote:

> > > +#include <trace/events/qcom_geni_se.h>

> > Should this be in rivers/soc/qcom/qcom-geni-se.c (and the first patch?)
> > - that way if another driver starts using them we won't multiply define
> > the tracepoints.

> Yes, you are correct but

> If this header in drivers/soc/qcom/qcom-geni-se.c, how it will be access
> trace API in other drivers like i2c, spi and uart?

The header needs to be in the users but the CREATE_ define that you cut
needs to be in only one place to actually create the tracepoints.

> > > @@ -986,10 +997,13 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
> > >   					writel(0, se->base + SE_GENI_TX_WATERMARK_REG);
> > >   					dev_err(mas->dev, "Premature done. tx_rem = %d bpw%d\n",
> > >   						mas->tx_rem_bytes, mas->cur_bits_per_word);
> > > +					trace_geni_se_regs(se);
> > SE_GENI_TX_WATERMARK_REG is one of the registers in the tracepoint,
> > perhaps trace before we write to clear it?

> it will be captured in m_irq register so it is not required to capture.

Are you sure that won't lead to user confusion?

--gFM2XcDEhmPrjI2W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpUwgwACgkQJNaLcl1U
h9CbZAf6AkZ/OX052T66MeVyQnv/A+5ltWB7OkFdN33KCaFvw4Hho1rOQsgmJ/RF
3cwraWTP38eaFderrE7ta0LfIsKwJUgQ2+KFr9iFiquBEsDh0g5R89VAsXQZDB4v
FziZgOvukWgexKkSuZ1eG3+s6ebRo+yDugyCcMJ+fUYwUG/5fvi6LkaINYB3ybY5
1vy4RPcRJ1BuymZazaAWsk9pKGKLQdX52bwjCN1VbjwHcvADHfdn1YIHOxbpdMTH
0OY7XfnyXXre/siEcKF97QITFgviumDfnA2JfX/L0uInBQCNWCbWonos7ZIhgZPa
9UsGS4vvW9zNvKGmzRAbeXEQK3YaUw==
=qlUD
-----END PGP SIGNATURE-----

--gFM2XcDEhmPrjI2W--

