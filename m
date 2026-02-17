Return-Path: <linux-arm-msm+bounces-93201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GTzIBuNlGn6FQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 16:45:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B7614DAA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 16:45:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FF0F301BCD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 15:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3A03358AD;
	Tue, 17 Feb 2026 15:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jKnQR2cr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27FFC2FF;
	Tue, 17 Feb 2026 15:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771343128; cv=none; b=FZ2FeCDVaXjA4wrsnV0QDuTDeFYSl5lTt6jpmObeM299dRX2EO8bJURV3zP4MvyIZ+YTU0JJ8Kfr41uhZqGRCjTuxXhLPvO8CnLaph+3+KTkvmrg8rX/QaRHri6WmpcEdixqjdfuh6XU70TPZC1MjQrmfeNBSwgxymfbV3BZawo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771343128; c=relaxed/simple;
	bh=9OFR4oH3Zk84H3xfRvdUSrHB2a6gJ5ZvV7zt654XCrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XSNusGGyCWn4nLCCecyiADlPju0mMB6mhbayEgk8IsG27QwTiRiVBGqbGKk2LszQ/XcIPevX2StkcrUmiFLtk1D4uaLnf5lzjMFl4tfNqVj5m1y1Qodi1vpLANeDh7vXmYh6dyg5NebTHRU1IfqjK9HtZL8kXoy38LIiT40SIBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jKnQR2cr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F578C4CEF7;
	Tue, 17 Feb 2026 15:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771343128;
	bh=9OFR4oH3Zk84H3xfRvdUSrHB2a6gJ5ZvV7zt654XCrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jKnQR2cr1XLg2EolDlgOOsJJvW5kynO8j6yNVGsRIDnUXfll6v6Reco+E6qPaE7nE
	 EKdbWwSrPUUCBi7wG96d28bGUVIXtTtVbEaziiMRJeFaBGbeAUv+C2Mr/p7uN0Co6p
	 Bq3lGuicCZR8YR4wdoZ1oj803QSmbRH6hKq64AslV7n4EVYZeapSUv5Xb4EjxRdae7
	 qOSNKf0KYR0cqtYBvjg1wSdZq+NF7iOpX6Ry3Wj2XiYMgUITrSW3hde/XvOhmdRyUW
	 2R7M1Z9AAW3Msu1ymEjqmihLdWZMPIWg9ZJ02fFwfSP0tRW89HXq9L/9iNXjzlBVwp
	 ntkiCOSSCHYGw==
Date: Tue, 17 Feb 2026 15:45:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Praveen Talari <praveen.talari@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org,
	dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org,
	bjorn.andersson@oss.qualcomm.com, prasad.sodagudi@oss.qualcomm.com,
	mukesh.savaliya@oss.qualcomm.com, quic_vtanuku@quicinc.com,
	aniket.randive@oss.qualcomm.com,
	chandana.chiluveru@oss.qualcomm.com
Subject: Re: [PATCH v1 0/4] Enable SPI on SA8255p Qualcomm platforms
Message-ID: <dde7127a-7341-427c-817c-35be6310dfff@sirena.org.uk>
References: <20260112190134.1526646-1-praveen.talari@oss.qualcomm.com>
 <20260114-truthful-just-boobook-16494b@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k5qFPc8EOj1BI2pK"
Content-Disposition: inline
In-Reply-To: <20260114-truthful-just-boobook-16494b@quoll>
X-Cookie: I'm into SOFTWARE!
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93201-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 30B7614DAA8
X-Rspamd-Action: no action


--k5qFPc8EOj1BI2pK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 14, 2026 at 10:00:06AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Jan 13, 2026 at 12:31:30AM +0530, Praveen Talari wrote:

> > Dependencies:
> > This series depends on Enable I2C on SA8255p Qualcomm platforms
> > https://lore.kernel.org/all/20260112104722.591521-1-praveen.talari@oss.qualcomm.com/

> It should not because it means it cannot be easily applied by
> maintainers.

> Why can't you decouple the dependencies?

I assume that was the soc changes mixed into that series rather than
something I2C specifc, there should really be a shared branch with just
that stuff that driver subsystems can pull.  In any case none of the
dependencies landed so I'll discard this, please resubmit when there's a
clearer story with dependencies.

--k5qFPc8EOj1BI2pK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmUjREACgkQJNaLcl1U
h9AUSgf9HxRu/lpm0ydOjbz6RqYmUoYPIKSLnPcwvcvhmWLtzpXY9RFsPe/b0oZs
x4VvH8Z4dASHwXd1oMl3tx9fOxo5RaVxky5TE4CbWK3HntGVLcFCKoAADQ3OpyGS
qtbPpEQGbbgfmTgVrnqL7RTCrmcIXyyF2ar12dyQFCGaLf5/fMViNCrXSvvV7u6i
6rL4GNl+oSDfq/0RYA6KXzOv1feGLbOTyRVKp4QXyo1sIqKBjVlfj2blHh0o5tpB
OS5KfL1Gdhzu89wzPXPUdCJKmqKyyhQcPxIaHTDxynjfpPI2FOggy5TfdVbqw6+H
htetCfMeP6a8hv6Xkff0poO/XkirSA==
=Y04F
-----END PGP SIGNATURE-----

--k5qFPc8EOj1BI2pK--

