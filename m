Return-Path: <linux-arm-msm+bounces-91830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNwHKUV8g2nyngMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 18:05:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C511EAC4A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 18:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2642330CBBDC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 16:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7772A3446CB;
	Wed,  4 Feb 2026 16:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gmT1ttEa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BE633F390;
	Wed,  4 Feb 2026 16:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770224273; cv=none; b=kf4rZYXfGwVSg34eO4ViC6aPZheaIPd9ojY5JM1GMlJbCGZ9nIcT0SpVDA579q7O7F4NPTtrmT22UxtcAyaEJCOEciQO+4hBNX+eU/hJs4as7dpsMn4yRLWiJjwPVV0b+hU9Q0N9EaCQtQE6dcJ2SI/hAyw8BQCciso4/7TOeK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770224273; c=relaxed/simple;
	bh=ZGQw8SCQ9E5j0Rr/XYKdccY0ozg61wegwtmjgf9knpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FF7Qt+GhiNjbw5SCbqKrI7RDKUK2Ye+o/VFmj72MycuqfbLzrR7F8eU2QTmHRe8HfXn031jjqQX8c9ksaVxFo3WDcDl+6v6LOGZBrUbbVzzG3hLKjb2i5d6X9Cslx5kYm4YWv4fayHkj3P80s0tB1mUn/W6gg9ZhwC5jCFNfPAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gmT1ttEa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 959E6C2BCAF;
	Wed,  4 Feb 2026 16:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770224273;
	bh=ZGQw8SCQ9E5j0Rr/XYKdccY0ozg61wegwtmjgf9knpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gmT1ttEaV6VHa6LjeygKPjKrXbF9cn6bkLS8Hixz05qev/YLnSPdiQoKEOXScVQjS
	 oUK/R7lMyCEsunU56p0dxTXmn7ux5rGjrUGZfl0xhT9ZVRM07Gi8ALxo0RNsTf3P9o
	 BZ8IO3YnOwF5Zppa0YUhGJkU7NlPMqquJU1QoH3Z890IQhEm9F0Wb8p0Ev8Hj1wMiz
	 NaM6gi+cuGPqxh+ZZe+T0yYdfxIpl9zrOsOrAgjZoKnNAYTFqzEoJ1R/kzUq1fxNi8
	 OLWvCel+C5n0DXL665B6u5BkxBt6cduqrbQsknYzOcyPl1Qgh1HrXXwFt6HrQcm8g5
	 OyWXhZpDIZccg==
Date: Wed, 4 Feb 2026 16:57:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Praveen Talari <praveen.talari@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com, prasad.sodagudi@oss.qualcomm.com,
	mukesh.savaliya@oss.qualcomm.com, quic_vtanuku@quicinc.com,
	aniket.randive@oss.qualcomm.com,
	chandana.chiluveru@oss.qualcomm.com,
	jyothi.seerapu@oss.qualcomm.com
Subject: Re: [PATCH v2 4/4] spi: geni-qcom: Add target abort support
Message-ID: <d8415a8f-81f2-4f14-bc2b-23f90879efaa@sirena.org.uk>
References: <20260204162854.1206323-1-praveen.talari@oss.qualcomm.com>
 <20260204162854.1206323-5-praveen.talari@oss.qualcomm.com>
 <68908c06-390e-4717-bab2-708de7f5cec4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zOcovwL2eKNVIBjj"
Content-Disposition: inline
In-Reply-To: <68908c06-390e-4717-bab2-708de7f5cec4@oss.qualcomm.com>
X-Cookie: Are you having fun yet?
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-91830-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2C511EAC4A
X-Rspamd-Action: no action


--zOcovwL2eKNVIBjj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 04, 2026 at 05:41:46PM +0100, Konrad Dybcio wrote:
> On 2/4/26 5:28 PM, Praveen Talari wrote:

> > +	if (spi->target)
> > +		spi->target_abort = spi_geni_target_abort;

> The same check is made in core:

> spi_target_abort()
> -> spi_controller_is_target()

> So I'm assuming the intention was to allow assigning the func pointer
> indiscriminately. Other drivers seem to do it both ways.

> Mark, any specific preference?

Not really TBH, it's redundant in the driver but if the people working
on the driver find having the check there saves them having to check
that the core does the right thing that's fine.  It's not like this is a
fast path.

--zOcovwL2eKNVIBjj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmDeosACgkQJNaLcl1U
h9DQYgf/chdsxM+HwPg2STRHNhREd80182DYjukMSvYRHMMXM1BCANch+8pQC3w0
1VJSRdIBLeqQEAxVY+agsHDSQJfJlYnC0MvSzsH/+1GnfmTnZ1lCBLyzOs7sL+k3
HG1muaHg7dZmuNpjdnwlO58z50+djPytYER8FsLkzBnyLVVrvF2ToyCvE5tILgF2
rTwLTIh1X/BDfVIHhGEN3Y+YShXyHMBztUUHR4sU4wtFctBxt602I6XFCWdbrO4N
JAIanc87gcxixK7w8T5JBBM/MY4cnUI5gxnoGGakSROeIGndb9J2BFYadMwEK/Yn
F3XoaagZRw9CE4fXUu2T2Uh108vljw==
=0TVW
-----END PGP SIGNATURE-----

--zOcovwL2eKNVIBjj--

