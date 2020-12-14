Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43ADE2D9E42
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Dec 2020 18:56:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439981AbgLNRvD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Dec 2020 12:51:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:54530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2439274AbgLNRvB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Dec 2020 12:51:01 -0500
Date:   Mon, 14 Dec 2020 17:50:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607968220;
        bh=7c3uSBpWEkrGyLpkCUlDnIX7pZbHL7FF3A2/sYOnzDo=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=GX0fbQrYdnWDEYLpMP3jiWLRtIOOsYgtpKSu6yRM+pJCcIH+FjzS9ask4+GRjrpQm
         vkp46yljFoJQIui6UqV8RfkTeHcu6wzxYgXHKIQ/3o3ZLOYjmPeszYEBKGvBn4RApP
         NYtJ+bibI0AiaE6nRP/4CWo0GBPClDFZBfnn8s2qb0MAi9Ga1tcGSRX9KZyUJbxiWE
         lL6X1hc15h2A37GjepLfSflyzPimNZlF0NjNG7F+HOjeaYSiCDxXsq2dWiBuKndVGO
         rTRaY0eLW7M8UsOiYnZCeCu6AdWVDwVGeNljzNEl9N3ZP9qkoqA3qKCI1pK3YXKPZN
         OX7F6tJJhKANA==
From:   Mark Brown <broonie@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Subject: Re: [PATCH v4 1/2] Partially revert ASoC: qcom: Fix enabling BCLK
 and LRCLK in LPAIF invalid state
Message-ID: <20201214175009.GD4880@sirena.org.uk>
References: <1606539559-4277-1-git-send-email-srivasam@codeaurora.org>
 <1606539559-4277-2-git-send-email-srivasam@codeaurora.org>
 <20201130124617.GC4756@sirena.org.uk>
 <966993b7-4720-bdd2-cf4d-cf5a7c11a0c1@codeaurora.org>
 <20201201175135.GO5239@sirena.org.uk>
 <89456f01-aa02-7a7d-a47b-bf1f26e66d4c@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/3yNEOqWowh/8j+e"
Content-Disposition: inline
In-Reply-To: <89456f01-aa02-7a7d-a47b-bf1f26e66d4c@codeaurora.org>
X-Cookie: Everything you know is wrong!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--/3yNEOqWowh/8j+e
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 14, 2020 at 06:13:22PM +0530, Srinivasa Rao Mandadapu wrote:
> On 12/1/2020 11:21 PM, Mark Brown wrote:

> > > Later from review comments by Srinivas kandagatla, I got to know
> > >=20
> > > about regcache sync APIs, which can be used=A0 to sync cache after re=
sume and
> > >=20
> > > HW registers can be updated with=A0 original values. With that playba=
ck can be
> > > continued.

> > > So is the reason, I am reverting partial changes in the commit b18249=
68221c.

> > I don't understand why a fix for the register cache not being in sync
> > with the hardware doesn't involve syncing the register cache with the
> > hardware.

> I am sorry I couldn't understand your point. Could you please elaborate y=
our
> query?

Your changelog talks about syncing the cache but neither the driver nor
your change actually does that.

--/3yNEOqWowh/8j+e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/XpdAACgkQJNaLcl1U
h9D/Zwf/fjn9hyBot5AFRtqGND9G8HLpAtWHKW70cPH+wBsFuqB0CLI8tZbBwh0q
kWZwfm8x8OxC44uZBFactuNZmp1+PgJ6Gj9f7wUuFBAYWUAIMjERH3qmIdBnNKwk
iVor+tLIrpGRfncjfL0tK7Xxd6YPQx0G7pDkxMHbP7sg6SS094m2CtHFo+jPRtec
AKRcvjIy7xw561ot5vqjMz62CTazM87RuqnVJsE81XcST4slkJLD9IUOSWTLDivK
UHNg/3hc3fAUBHwvPC+0t9suBwSMkifi9hJuTGbhPTnPILmRF9GJ0l4+PCqpnrVn
v5oEVRw7ErT3avD1VlAlKlN49wz43Q==
=jFTq
-----END PGP SIGNATURE-----

--/3yNEOqWowh/8j+e--
