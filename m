Return-Path: <linux-arm-msm+bounces-106218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CQFBJXk+2mrHQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 03:02:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 173C74E1CBD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 03:02:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 30D0E3006984
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 01:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E2712B143;
	Thu,  7 May 2026 01:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UnQrPhMI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B3B1862A;
	Thu,  7 May 2026 01:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778115725; cv=none; b=W8yZGOQZg5GD9mlzu+9SfKiMafVIP4h48jwi9I9BXusaWrZdhKO4vQMkimiBo7jdsIJtzDrnn5c9fvvjYpPuAPxz8H4BnDX3b6tmjrwHMW6+qZlxkXX9cSIGYm8/mm3iE1OXYVmO6Sr1H4LHHO1Tr6JfXLA+Bw4qf4OeWqv8M2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778115725; c=relaxed/simple;
	bh=fZBUwbOTViWi8l6UCWBppyboqHlfzeqqq9ife7w6svQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EzVbcgJ5a2iWQgPr9ykHABUvvapAuQn3cfsVGMgRDpVPe3VmBINVyew8kftc54G+SBmBqX133ay1KGveQFINroR+/M4YRsIkzt/5J9DbYnc1DSK+IB/rmC+OOYE3vZRCzeMqF6m1odDAv2HlIInk4qoIumDsIzKBXERgNKaFGJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UnQrPhMI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC97C2BCB0;
	Thu,  7 May 2026 01:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778115724;
	bh=fZBUwbOTViWi8l6UCWBppyboqHlfzeqqq9ife7w6svQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UnQrPhMIkeujRrQGa1potls2iXtAxX067CgnYRZNG4FBGhQcKqYjJ9FrsXGYyHz2V
	 5Bb8tSZP9bzeqUXGw1v2AeNN6D3gzQYPUwS8Wv9ohhNvQycLgfQ0E8RD3NWX+mZRpE
	 Ky4STM2EX1bUy/tRKHQMgxdoi4SiqIrKe92Ao0tuLKZy1NP297CQki1m2TL/TLkeZ8
	 VqD4Qzx5Wl68OTd94p+fGWFOC4RwTHyyCb1P3zh3F00zKbi0VlFYTN+TfOPLKErkN5
	 Mcd3VI0md1yPiUgEdXTrregQPz+xrGpedyO3DSJ2+AdxSi6TBs7s6Kdy156A6nmTbo
	 hQSSw4JOdm19g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 5DB0C1AC588F; Thu, 07 May 2026 02:02:01 +0100 (BST)
Date: Thu, 7 May 2026 10:02:01 +0900
From: Mark Brown <broonie@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
	MukeshKumarSavaliyamukesh.savaliya@oss.qualcomm.com,
	AniketRandiveaniket.randive@oss.qualcomm.com,
	chandana.chiluveru@oss.qualcomm.com,
	jyothi.seerapu@oss.qualcomm.com
Subject: Re: [PATCH v1 1/2] spi: qcom-geni: trace: Add trace events for
 Qualcomm GENI SPI
Message-ID: <afvkiT50ZUEXZ-YO@sirena.co.uk>
References: <20260506-add-tracepoints-for-qcom-geni-spi-v1-0-c957cfe712d1@oss.qualcomm.com>
 <20260506-add-tracepoints-for-qcom-geni-spi-v1-1-c957cfe712d1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U/crfIK3ppUGTB9t"
Content-Disposition: inline
In-Reply-To: <20260506-add-tracepoints-for-qcom-geni-spi-v1-1-c957cfe712d1@oss.qualcomm.com>
X-Cookie: Truckers welcome.
X-Rspamd-Queue-Id: 173C74E1CBD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106218-lists,linux-arm-msm=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action


--U/crfIK3ppUGTB9t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 06, 2026 at 10:59:42PM +0530, Praveen Talari wrote:
> Add tracepoint support to the Qualcomm GENI SPI driver to provide
> runtime visibility into driver behavior without requiring invasive debug
> patches.

> +TRACE_EVENT(geni_spi_tx_data,
> +TRACE_EVENT(geni_spi_rx_data,

At least these feel like they really should be generic events, there
hopefully isn't anything driver specific about them.

--U/crfIK3ppUGTB9t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn75IgACgkQJNaLcl1U
h9AsrQf/QPrNU5EsZcKonfmZnFMtXCVRKRFQY7h1R1SrW0XqOVc2tMz4WIBKz8SC
6hjupyMdmsv+A3ggQcLHDjBMxHPYLZN2yd+gUtltI/UNiIJeRwqbR1833a5PC+6l
5AGs5FMk3q2PlD0iLqj/lNNySLUvuXcyZl6RZxoSXBhqnMYMCfxVKhLkWsDuRn6c
dq8t7s+KPDKIDAOMfWER+su+cWhXH2kTF2NSbjRnPjPWYYmOijgqiCIbcyhaoYLd
eqG5UqOYd+o4/Bs5y9h0CeQbj4Q8IkqGnzrzP2hlvRG/Bfl4AEdAMTXiVGVv9nE4
0bO9m5HM9A2bebX4Ddp3uiTI2ryvfw==
=Vs0v
-----END PGP SIGNATURE-----

--U/crfIK3ppUGTB9t--

