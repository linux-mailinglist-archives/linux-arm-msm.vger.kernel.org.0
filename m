Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE753B0A37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 18:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbhFVQZr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 12:25:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:53400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229769AbhFVQZq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 12:25:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EBAF860240;
        Tue, 22 Jun 2021 16:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624379010;
        bh=dvnbdNnOiv03SgjtecC7Dh5JlTHc3Gn16vJg0Lm+0VQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lIZK4me2EB7vjw3OO3BFGCQ6AOkbHde3QpzQhzvTRf4rBlt0/HJ16wOBqS6XKXP1n
         Os0RgH4qcR6j+Xj/PPQkHFPoTIFuV997H5bRIahKQ8R69mAdtSL8wH6j4XD7zK04Lk
         PF3vJYOXOfHPOhrUqBSMweeLRhq4B6Nu9pCCVt+lCOrZkj4GlxFbCLe3eL1hfstHLg
         OxnR/9MoQaKyZMQHZuKbD9hsvKfgUcoC4iro246CKO0gWQ1H1Q2x3JBKuCINIWi9os
         PKHI4n4SMcyrwbm1PnubdP3LzISh0K2Xb4Cwh1x3Jn439lHLJ52qon/UgEHbLCdbkd
         UdxJnAsXiMpHg==
Date:   Tue, 22 Jun 2021 17:23:07 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Douglas Anderson <dianders@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Judy Hsiao <judyhsiao@google.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: snd-soc-dummy: add Device Tree support
Message-ID: <20210622162307.GF4574@sirena.org.uk>
References: <20210621074152.306362-1-judyhsiao@chromium.org>
 <20210621114546.GD4094@sirena.org.uk>
 <CAJXt+b-eRLKORqPOX1cJM3xzEyJhdeuj+w9-btpZSmy7v4U6Sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Y/WcH0a6A93yCHGr"
Content-Disposition: inline
In-Reply-To: <CAJXt+b-eRLKORqPOX1cJM3xzEyJhdeuj+w9-btpZSmy7v4U6Sw@mail.gmail.com>
X-Cookie: fortune: not found
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--Y/WcH0a6A93yCHGr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 23, 2021 at 12:10:53AM +0800, Judy Hsiao wrote:

> Thanks for your review comment.
> This patch is used to support multi-channel where we want one codec to
> control the only GPIO shared by 4 amps.

So you've got 4 instances of the same CODEC?  Then I'd expect to see
those all individually represented in DT.  Or if there's a single
physical CODEC then I'm not sure what the dummies are for?

> In snd_soc_runtime_calc_hw(), by creating dummy codecs that share a
> DAI link with a real codec:
>   1. The min/ max channel of  CPU DAI will be directly adopted.
>   2. The formats and sample rates of the DAI link will be determined
> by the real codec unless the real codec supports the rate
>       and format that do not intersect with the rate and format of
> snd-soc-dummy.
> That is the reason why we don=E2=80=99t specify the format and sample rat=
es of
> the dummy codec with the real codec determining the properties .

It's not clear to me why you'd not just describe the actual CODECs here
rather than using a dummy CODEC, the fact that the dummy CODEC is doing
what you want is just an accident of the implementation rather than a
description of the hardware.

--Y/WcH0a6A93yCHGr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDSDmoACgkQJNaLcl1U
h9CHhgf9GyO7DmKsckUqnMgiWbG3VYozrFo/OBZbuZQ9BpW1Z1HA8NODEpIGZnJu
IFCzwNcBW9kli0vU6+PDVxxhMtuGuj3/+Y2IabUlr/f0Mq6s+rgKJAjPmyqb8MI8
7RkBXF9O0esDEhYBV5w0sMhAp/galLTCgUjPevMdSmfCuiMZHLpKnHW1cW+FgK0m
8gGcALicOwyv2nYo42vozX8jt3ujOrccNTHP0mlPuqj2ceW8IAF/yQDqkb9C7kqL
K4aUK/VJ5mcx4z0Aj2PQyFoHn1ITfSOOo4ROsOT89HdupM1TeuCv6pms0KIfHGYG
exburGtpvtRoijicCRPkG7E03VLbZg==
=UqxB
-----END PGP SIGNATURE-----

--Y/WcH0a6A93yCHGr--
