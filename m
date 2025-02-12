Return-Path: <linux-arm-msm+bounces-47664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE626A31A31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 01:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45A31188B88B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 00:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9062111;
	Wed, 12 Feb 2025 00:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HoQ/+8q4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5CB184F;
	Wed, 12 Feb 2025 00:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739318960; cv=none; b=MFX3mULqsIAOAF/fGmoBZV0CtjHpIvjw73AWc2zRcLB9MxMugvUkr8VuOzeVbJfWK12ZiyuZVZhBBpEuoKeK/abgX7RvGuBl0GiyOX9aUYaVt3LRZ/8RCB1NlN8lB3vGZF9unHUE9cP/dF97kkaNSKZsCL8qB38Pk80x1rDGxss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739318960; c=relaxed/simple;
	bh=v3R9XDHN/UWMkFb/pV7ZHZ+9fWE1c1nfxBy64a5rkhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YfQHeU8Id1TCFRoOhxyGjwYSxnlqFaAE2aPPVAMYnQ82+UrOXEpgq4tusfrIuiPQrUyYCwJ5ETCJWdftPmIBFfPri0ehL18oaZ5V8n7owVk13S5ONCfSQSZwdi1zUoimV9cSGN/ZIJxn0L1DWWEWqI/jFlo4euLmTN/F3q13yvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HoQ/+8q4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51ECCC4CEDD;
	Wed, 12 Feb 2025 00:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739318958;
	bh=v3R9XDHN/UWMkFb/pV7ZHZ+9fWE1c1nfxBy64a5rkhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HoQ/+8q4/ZfIb+1V06AFWJwefJInfCT/45vt3wLvj7+k9PmtEWbo/uCthkAnQoM1v
	 3xkgzE3oC/x4rGyRrdjzoj6WcHH2bxnJSnSqDXm3j6tbMLk6XEiFP0GNP0q29bch/i
	 +YTblCpVtgP88nmXN7VYuk5qbIN1fw54uLbc5r3bQ2co7SrWuwk1tNFPzEONbJOlIJ
	 /WBzd7tKi3eR0mOgrg1L0rtFBzBiAQnjj/up3E/Y659KoNKgHZOEdzsxmCAcNRbzkS
	 oapjjvGqVX9JqKLJHXJoRydpl7a33Y4Drjdw/V3r90F3LNyC4MLJxwoapRuKp3KdAD
	 xtUxENaEW/Fhw==
Date: Wed, 12 Feb 2025 00:09:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: "James A. MacInnes" <james.a.macinnes@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, andersson@kernel.org,
	konradybcio@kernel.org, quic_wcheng@quicinc.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, lgirdwood@gmail.com
Subject: Re: [PATCH 2/3] regulator: qcom_usb_vbus: Add support for PMI8998
 VBUS
Message-ID: <15c4579d-5053-4d7f-8a2a-b29e80240118@sirena.org.uk>
References: <20250211194918.2517593-1-james.a.macinnes@gmail.com>
 <20250211194918.2517593-3-james.a.macinnes@gmail.com>
 <aldyktqe5sypkb6tdzl5omraohn5ee272b2ww7vwax3sj7csbd@ccldsyvguuc7>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XMG0zAQO13wm2y2s"
Content-Disposition: inline
In-Reply-To: <aldyktqe5sypkb6tdzl5omraohn5ee272b2ww7vwax3sj7csbd@ccldsyvguuc7>
X-Cookie: Printed on recycled paper.


--XMG0zAQO13wm2y2s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 12, 2025 at 01:16:37AM +0200, Dmitry Baryshkov wrote:
> On Tue, Feb 11, 2025 at 11:49:15AM -0800, James A. MacInnes wrote:

> > +	pmic_type = of_device_get_match_data(dev);
> > +	if (pmic_type && strcmp(pmic_type, "pmi8998") == 0) {

> I think a traditional way is to define an enum and then use that enum
> values as match data. Or you can just add a struct with curr_table and
> get that as a match data.

Either approach works, yeah.

--XMG0zAQO13wm2y2s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmer5qcACgkQJNaLcl1U
h9CPeQf/dG2mhFKhI/AHZcdjIdWHxSe/yf4kudhh3qWMi7HpTZx1HQiz5fe1Inm2
SJWhyDODtgJ4/6Jar7ZmXGPNB1xwlh/16+XQdR2Fad52sVViNgSN8rAv6f4oFLU7
XFu9ndi9Cd1pfW4CWNqXG3X68veZjwGhSHfjcrSKCLChZOX3VgNNGc2GH74TAO0o
juJPtl1BGim74j+YsgYOpMEVu6hV5jMA4YKzVipHzCy7GEWEhOPZkgpRIqGf8zM3
ND8bfyOL+GLrW4k2xqu+W3VjjjoIu1zcmV3hjJSgCGQFrEHtFdkHoYvIz0t2b+DN
YOhuaEoeCokA1DiaQaXNKMphd/rgXQ==
=epXv
-----END PGP SIGNATURE-----

--XMG0zAQO13wm2y2s--

