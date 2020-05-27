Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0398B1E4A6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 18:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388189AbgE0QjK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 May 2020 12:39:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:40286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388126AbgE0QjJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 May 2020 12:39:09 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 113422084C;
        Wed, 27 May 2020 16:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590597549;
        bh=dQEVqZqM5MONADQ+eSg4QugITFrmUEBdvD1ib7pMIwc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DAwRKzYmwEM0N8/UH5HFsRhlYOawBQxwQ2USEGE9Ocwt9CwQDDp9+2/NujceFUr5r
         IgB8Ph/ZqZwWc9hTTzjmAZXJAjVxwW0+R59OGnyLxL2J7IAmkJGnzaCSVZHyS1TSq1
         1w0pVErfsXkozAxdfyph36TmYm9flXFhAGJjG7fg=
Date:   Wed, 27 May 2020 17:39:06 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Sumit Semwal <sumit.semwal@linaro.org>
Cc:     agross@kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
        lgirdwood@gmail.com, robh+dt@kernel.org,
        Nisha Kumari <nishakumari@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [v2 3/4] regulator: qcom: Add labibb driver
Message-ID: <20200527163906.GI5308@sirena.org.uk>
References: <20200508204200.13481-1-sumit.semwal@linaro.org>
 <20200508204200.13481-4-sumit.semwal@linaro.org>
 <20200511103937.GC8216@sirena.org.uk>
 <CAO_48GFGpHeu_xb9XT9CFMOSUOJgRrb-z_KZ3-r3X78s-2ddjw@mail.gmail.com>
 <CAO_48GF0tjZDmTS+Fa4fv+cfH4skFZP_a9A=P7D0b_si4AFj5A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SdaPbLtAangIkrMZ"
Content-Disposition: inline
In-Reply-To: <CAO_48GF0tjZDmTS+Fa4fv+cfH4skFZP_a9A=P7D0b_si4AFj5A@mail.gmail.com>
X-Cookie: Drop in any mailbox.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--SdaPbLtAangIkrMZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 27, 2020 at 10:01:27PM +0530, Sumit Semwal wrote:
> On Thu, 14 May 2020 at 16:57, Sumit Semwal <sumit.semwal@linaro.org> wrote:

> > > If this is useful factor it out into a helper or the core, other devices
> > > also have status bits saying if the regulator is enabled.  It looks like
> > > this may be mainly trying to open code something like enable_time, with
> > > possibly some issues where the time taken to enable varies a lot.

> > Makes sense; I am not terribly familiar with the regulator core and
> > helpers, so let me look and refactor accordingly.

> Does something like this make sense, or did I misunderstand your
> suggestion completely? I'll send the updated patches accordingly.

I guess.

--SdaPbLtAangIkrMZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7Ol6oACgkQJNaLcl1U
h9BwiQf8DfPZbemPqe2sf2BseqmWV/yu1j0xZTqJz7syCgU8GM7tUyxrVe9kKQM5
uFeI0A1gpwElsO/qsFza0s6ierGn915XyguVGG3TgyKZo4BvQxv798+9jYbeLrgR
qew3Y9d7WHd8k1ozfzm9lRig28oGyD1c3dnXexh0MuEceX12H9mOmxuEX7Xgs1Z2
DpAf9kMZzfFfHDPf0Mx7AQEO1ALZuIEOy0kbgBLcMQHVNFpusJFjwZ5Sc7BoJAJY
IbwHFQ/5ai3xNYXf259wq9xEZ6eJfckrM5cd0HTsq7BEFvFs2045+P5u6g4CLrqd
4cfaDfSm8Q4So3CSGalXhJhyFRam+w==
=cox/
-----END PGP SIGNATURE-----

--SdaPbLtAangIkrMZ--
