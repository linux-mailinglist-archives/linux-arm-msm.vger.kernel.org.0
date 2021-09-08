Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2A94037C7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Sep 2021 12:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347996AbhIHKYp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Sep 2021 06:24:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:49292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345299AbhIHKYo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Sep 2021 06:24:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 725CB6113A;
        Wed,  8 Sep 2021 10:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631096617;
        bh=65QMXzF5Bvk24nU6duUdL3mKrm5mXPSa7dnF186YHww=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c9zDqRwY+O9KjVcmp2SLPbQ5o5FikTMALXWNjOOVrbEzZk7VGnTW0bmDb7KyZDzjb
         gYuD0RQrXuTF2GR/Mzhf5DHFocLhU0X60+FBPShm2MEDcTdw+a7Vjfe4riFpKajZqg
         9bW1E+IFEtTwUSpxC0acEPXuFpwyGQn9nZjc2MLtL1EPwds1/VpaXmTrovR4ICv6D5
         VqEgqfibEWt/M+h/Pb/IUg1w26VswhxIrYUvwWN92Bbtkd6xB5qdEajoToJTk74ZvT
         Gcd3iKAjyHfY8rKTi8KtHbl19Ho+eOHm/ntQ5W7NT3tNlexafp53qFtDLnl9OrcYTN
         pije68ZtmChXQ==
Date:   Wed, 8 Sep 2021 11:23:00 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        perex@perex.cz, plai@codeaurora.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
        tiwai@suse.com
Subject: Re: [PATCH] ASoC: dt-bindings: lpass: add binding headers for
 digital codecs
Message-ID: <20210908102300.GA4112@sirena.org.uk>
References: <1630934854-14086-1-git-send-email-srivasam@codeaurora.org>
 <CAE-0n53Zj3pp4EJ_f_kXhRm3EW=od83UO44qt91P37waEq-z4Q@mail.gmail.com>
 <755e99d3-4d72-3292-a5da-ad3d6045038e@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline
In-Reply-To: <755e99d3-4d72-3292-a5da-ad3d6045038e@codeaurora.org>
X-Cookie: Should I do my BOBBIE VINTON medley?
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 08, 2021 at 10:08:33AM +0530, Srinivasa Rao Mandadapu wrote:
> On 9/8/2021 1:54 AM, Stephen Boyd wrote:
> > Quoting Srinivasa Rao Mandadapu (2021-09-06 06:27:34)

> > > +#define LPASS_CDC_DMA_VA0 8
> > > +#define LPASS_MAX_PORTS 9

> > Do we need LPASS_MAX_PORTS in the binding?

> Yes.=A0 based on this creating array of streams in machine driver. So to =
make
> upper limit introduced this macro.

That's saying it's useful to have it in the code, do we need it in the
binding itself though?

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmE4jwMACgkQJNaLcl1U
h9Bjmwf/YaSV9rxdXPdpDXlgsyTS/gQcTJBtNOBq5BxQcVcRXcq4GmFnz8V4vcQ4
cTp1TOa0f/j3XMd0xQrmzpwJPjxNJSZ0bT2kNH0totGI/AQje1F/ecFw313x6yLO
bzjAhAw3JyEK268J+QK4hzYS26+mP2t/a9itRGdKqG+zDkBCERK8Ydf14CH0i1pp
x1s5hSyad+KTsBRj3shF1TyP0V+JouH9MycZ2dJKRsL8TswhtT1jBYFQ4/4wamZx
7YLNbhh6tuvk2oWmZuSr84N30/3BAXS4ISZMl1hw8qTLe4AIJu16DPXuMlmkAFz8
SRQMBAXIWvXWzzDhJlEGvMRXPjeEXQ==
=cvim
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
