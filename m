Return-Path: <linux-arm-msm+bounces-108234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CIHBoo5C2qWEwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 18:08:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 149D95709B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 18:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 47911304556D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 15:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F405481AB9;
	Mon, 18 May 2026 15:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vIYCwA3O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3F63FDBEE;
	Mon, 18 May 2026 15:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779119798; cv=none; b=LGHAPLrR490oAfh2/oSaMv66VRlYohBCNRTS51NIRSXo8ObxnmtwK4D82ZfBECawuSz+mmvBcHG8owYLM98pP8UZrM+y2gw9BRkE02HZW3sFO5GQBojj+gX5vqIdOgfiteXttpLrHKlED4MN5SuXOeXyCb+eYqGZDmFda4ND1i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779119798; c=relaxed/simple;
	bh=rygqpfErM9Yu9DpspQZR4y892rPLukqOrUCqEaUIgS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HN0dGz12PfPalJFDizrukoAmhxKRMTIM7ok1miXh3rejWryJwMQ/tHF2t2jr9C4fwJHr71yuCeKxricwMtYwP9jBTYaBLlkogc+uvgcMnCen6w18RUZ2fjXkgWFDhBhpKGQFKwmMZhABgny6pibL5wUlAsPJVaK9zBN9lOpfF3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vIYCwA3O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF709C2BCFA;
	Mon, 18 May 2026 15:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779119798;
	bh=rygqpfErM9Yu9DpspQZR4y892rPLukqOrUCqEaUIgS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vIYCwA3O66Uj0si6ss9vHkg2MaYGd8rjSOH6JJY2nqEh9n/yO0M/7WuYAcJD1UKUL
	 COu5cNh12TZfL3/Q7PRy3Z3TBlokgdPmvGBPuNnRuCrx09FKF2wB7keEJhqS95znXB
	 x+GavYV3A4Gn0XdFHhQi4RZSaKy1tgbldu76aZUrIN8fYBQ3+bHskr12bOtLcvDYbw
	 uFIqzlvAr0Rwiq7Rtp+KAI+ioAqSrZO3o7lvCP9nHFOfNj7TsOWvdVgicr77rRS+Rj
	 nsWMUeCgSxcsYvlRq9MUDfEm7OPVxR1MqpRauaRCvlkb6Zl1LHkTpVZTr8v3CJpTDs
	 zBrVjHXOzPWHw==
Date: Mon, 18 May 2026 16:56:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
	mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
	chandana.chiluveru@oss.qualcomm.com,
	jyothi.seerapu@oss.qualcomm.com
Subject: Re: [PATCH v2 1/2] spi: qcom-geni: trace: Add trace events for
 Qualcomm GENI SPI
Message-ID: <4b7c08ef-bee1-4bf8-8cfb-c134184b026d@sirena.org.uk>
References: <20260512-add-tracepoints-for-qcom-geni-spi-v2-0-3b184068ecf9@oss.qualcomm.com>
 <20260512-add-tracepoints-for-qcom-geni-spi-v2-1-3b184068ecf9@oss.qualcomm.com>
 <a713082f-e84e-403a-af1d-c6fa0c5d8613@sirena.org.uk>
 <3b415d4c-7d09-4ddf-847b-b5a3d94aa5e3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2ma7NOSo5854yI//"
Content-Disposition: inline
In-Reply-To: <3b415d4c-7d09-4ddf-847b-b5a3d94aa5e3@oss.qualcomm.com>
X-Cookie: She sells cshs by the cshore.
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-108234-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,sirena.org.uk:mid]
X-Rspamd-Queue-Id: 149D95709B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--2ma7NOSo5854yI//
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 18, 2026 at 09:22:46PM +0530, Praveen Talari wrote:

> Can i use below name or any suggestions?

> +TRACE_EVENT(geni_spi_setup_params

Fine by me.

--2ma7NOSo5854yI//
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoLNrAACgkQJNaLcl1U
h9AjKgf/Sw0N5I9At2YEgtUVAnl1ErcUiSfSS13Pp5coYuJxvCGCBPUDt4Udn2Gn
17a4pUFGx8B/EPzmVfBaoKCR3kcLofbp26gLYxNa7wAs3pjJmsJLnTFQ5NCjjm4u
6ZnT7i5QWxXmypdEpVnxpcTxBLlVEUKD0vpEeUCEpAiSEfAJExXE7Um90vj72uN7
q/wBfEnzpPo+3CmEZIP92TdYwSZLFSzxpkIYXSbcTSRXTw5k5a+lTd6FnIwvOLym
3mW6b/cfMNDsuXq6fDjVpfJL43R3q3V2Qev1cmr0bkIzOh095WnfaCJoOdXE0IQN
25/x2PcYTWJs6N+i6XUd7DEWHEVuiw==
=jMRC
-----END PGP SIGNATURE-----

--2ma7NOSo5854yI//--

