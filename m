Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75836450A46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Nov 2021 17:55:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231303AbhKOQ6u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 11:58:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:42366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230385AbhKOQ6q (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 11:58:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D777160174;
        Mon, 15 Nov 2021 16:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636995349;
        bh=8ZJ3OMscvgJsPqmb+8k4Flv6H47O3kx7VGp4pJrkxVY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ve1GfrtV3I1uRgcXFM0uuMDsnfNEoyPBSToSYKLBnWo9m885G4eQwozu9oBDR3pe8
         BKebEmXzwHEnnchpT2JPffmYJ0rtFcJjxtQYI0PsCGzO2kS+O1cGfVhW67blRX+PS7
         SlLpYH67zcp4r7TcN9lx+qbJndA2YmQNTWqkVfKsaFbxwSGrJ06LD34GEd0+gcZuEd
         uTtyf1hSRchiAhhTFN4U2HH4LhC5kN/6v7SjMaE2cs4cJUUR+EpjXEbX1m5La3EGWn
         57X3W4oM87xkFmxoc6ubgP9HwRUYjd4rqUfAaamXNt0rgI2W5EJvSupwvpTeBVzXS3
         H9boqnHkdSQvQ==
Date:   Mon, 15 Nov 2021 16:55:42 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org,
        Venkata Prasad Potturu <potturu@codeaurora.org>
Subject: Re: [PATCH v2] ASoC: codecs: MBHC: Add support for special headset
Message-ID: <YZKRDnaW0oiU5lyY@sirena.org.uk>
References: <1636960288-27537-1-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3IhyrrE8cNkOJMZ6"
Content-Disposition: inline
In-Reply-To: <1636960288-27537-1-git-send-email-srivasam@codeaurora.org>
X-Cookie: Custer committed Siouxicide.
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--3IhyrrE8cNkOJMZ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 15, 2021 at 12:41:28PM +0530, Srinivasa Rao Mandadapu wrote:
> Update MBHC driver to support special headset such as apple
> and huwawei headsets.
>=20
> Changes Since V1:
>     -- Fix typo errors.

As covered in submitting-patches.rst the inter-version changes should go
after the --- so they don't end up creating noise in the changelog.

--3IhyrrE8cNkOJMZ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGSkQ4ACgkQJNaLcl1U
h9AjmAf5AWg/8cTlkjzX/kG0qnUbOIwvENszTo1qC7RizlsYAkdJ7MDKlcuGE9RF
v+PGq+n3qMPeiWYX5cvrasGWDn4fronjgv7W+oGayutwraoQcd3ngIX2DTlPXtpb
ISRxm8L8h5lZmfsynxqXw91Wsd3o4a1eHCU30hIk2JewAmHzBWvtW+j53yVRrpz2
DO5K+iuSaRAn8fxPB0cbVn+GCNqUNo/wkmJNcCUt2pGopLgN5L4RF8FSZdzqRGTY
bGmGIcv4Doq9H0TPuLMD0RlMdjHTitqTFYJ03akCkXQ1U/o9OuZAId7GNjRYhXjO
ajRHt27uKkGAThFT5OUmgwq0b2TUcg==
=WZY7
-----END PGP SIGNATURE-----

--3IhyrrE8cNkOJMZ6--
