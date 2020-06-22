Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 354BA203CCA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 18:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729852AbgFVQnX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 12:43:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:53574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729458AbgFVQnW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 12:43:22 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0920B2073E;
        Mon, 22 Jun 2020 16:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592844201;
        bh=fHdUYMN1CthGXBqW5gf/eyqTc6WkYbVr0aR/luIj1iU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FtULZXDtg7M5nsENpvPqhbRvPL6xdrpt7Wt71cZ4txBP4svF8ppG5hckyjtGdPXvN
         gN6g8D4p7Iw/NSpfFhVKIikjGC4nLuFMAzncSTkrKbXaZwF+cLWoCllQev5sTDgG1R
         xRg94lJFACbaXJIBEzuCCkoM0hFZKSV+wgvQS3e4=
Date:   Mon, 22 Jun 2020 17:43:18 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Pantelis Antoniou <pantelis.antoniou@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Matthew Porter <mporter@konsulko.com>,
        Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: sound: Device tree bindings for the
 apq8039 sound complex
Message-ID: <20200622164318.GL4560@sirena.org.uk>
References: <20200619193831.12528-1-pantelis.antoniou@linaro.org>
 <20200619193831.12528-2-pantelis.antoniou@linaro.org>
 <20200619214126.GA1251@gerhold.net>
 <2070B433-83E0-4ACE-A470-36401934FC5A@linaro.org>
 <20200622120409.GD4560@sirena.org.uk>
 <519B5FAC-4DB8-4968-B9D4-96E376D74F1E@linaro.org>
 <20200622134145.GJ4560@sirena.org.uk>
 <8C9C4D5E-D92B-426D-A597-C784D1611967@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pFej7zHSL6C5fFIz"
Content-Disposition: inline
In-Reply-To: <8C9C4D5E-D92B-426D-A597-C784D1611967@linaro.org>
X-Cookie: laser, n.:
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--pFej7zHSL6C5fFIz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2020 at 05:04:16PM +0300, Pantelis Antoniou wrote:

> The problem is that for sound card that is composed of a number of compon=
ent
> like this one a pretty non trivial setting of controls must be done.

> Tt is not atypical for a card like this the set of control being a dozen
> or so, with some requiring even more.

> Someone has to do them, be it the kernel or userspace.

This is super standard stuff, it's why UCM (and the Android equivalent)
exist.  There is nothing here that's remarkable or new here, *please*
look at existing solutions before proposing new stuff and (as Stephan
suggested) please don't try to sneak major changes in how things work
into otherwise routine patches.

> Instead of having userspace do it, bundle everything in DT so that everyt=
hing
> can be set in one go, and without having the user-space engineer read the
> a few 10-100 pages of reference manuals.

Very often in embedded systems the people doing the tuning include
hardware and acoustic engineers for whom dealing with the flexibility of
the device is not an issue but having to reflash and reboot the system
to test out changes is a substantial inconvenience.  I've seen how happy
they can be with userspace configuration options allowing them to speed
up their workflows.  For end users it doesn't really make a huge
difference if the configuration is delivered as part of the firmware or
as part of userspace.

> This is arguably a hardware setting (eg. the set of configuration paramet=
ers
> that enables routing sound to speaker).

In all but the simplest systems there are several, frequently many,
options available for even seemingly simple tasks like routing audio to
the speaker.  Deciding between these is something that's well within the
bounds of userspace configurability, it's not like there's only one way
to do things and there may be tradeoffs to be made or combinations of
things to be considered (eg, will we have to mix additional streams in
or route the audio to additional outputs later?).  Transitions between
use cases are also very much part of this, they can often be worked out
automatically but not always.

> Now this is not going to perfect for all cases; some cases are very compl=
icated
> and indeed user-space has to be engaged and perform the configuration.
> This mechanism does not preclude it.

Having multiple uncoordinated mechanisms for doing the same thing in the
same system makes the system more complicated. =20

--pFej7zHSL6C5fFIz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7w36YACgkQJNaLcl1U
h9ALXAf+ITFI2DOoH2qE4+RFkrE6iNsf5CAeoJwCOIa0ZzBWTZINaqr8sHF8Ak7Q
n5iU+vu4EZRAxkRZMzzc8zPsZC7tey4F4yNshc+n1t41HtmA1OOG7Yie3Nt1iCUF
Vpj7TtWHLsAmCewClfYJ48qp2ZinR+RBGlJ3qqW4MaoZbcQEW3AGv7yswXtPZuxE
AGNvlac3wLT4dF15Ol46dIRRpcBZfs2CgP/+afQ5ZQoVFPCnucA3ljSRyM48DcqB
fM8o5v5HmUtC/FgHsMHvA46UZcyoaZzDwMGK/SpyqLOt1beqw8BbL3B8dP7EMIOY
rvDT0R1JIokB+JAoseBcmEQtxbvXXg==
=Am6L
-----END PGP SIGNATURE-----

--pFej7zHSL6C5fFIz--
