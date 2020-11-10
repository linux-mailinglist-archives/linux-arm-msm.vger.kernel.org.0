Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83A872AD5B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Nov 2020 12:56:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbgKJL4r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 06:56:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:58306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726428AbgKJL4r (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 06:56:47 -0500
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A84EE20678;
        Tue, 10 Nov 2020 11:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605009406;
        bh=YryXYnKNldudDO/RjAz80bAXrbW7/qbSF3tU+VW8eT0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QDV5JKZraXd4PgJ4NstqiTlrlzLQdcoRw2n9tyyBrQ0/7KCCZWJ7JAlHBmIHBFps5
         8lkXJxSkhjzdeouUKFsggexk820zmoLe7TN+BF4FxJqnj+oyBq/X50SdHrPHHsUQO3
         bvVHp1xR9os+ukKwR3X0/21Alpj+n3EXFYWyThPc=
Date:   Tue, 10 Nov 2020 11:56:31 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Cc:     Ajye Huang <ajye.huang@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Cheng-yi Chiang <cychiang@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [PATCH v6 0/2] Modify documentation and machine driver for
 SC7180 sound card
Message-ID: <20201110115631.GA5957@sirena.org.uk>
References: <20201106061433.1483129-1-ajye_huang@compal.corp-partner.google.com>
 <CALprXBZCthdkxGbJBZZ+ESJRDBHY879FZMpB_4Mgpq1YAJun2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline
In-Reply-To: <CALprXBZCthdkxGbJBZZ+ESJRDBHY879FZMpB_4Mgpq1YAJun2g@mail.gmail.com>
X-Cookie: Disk crisis, please clean up!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2020 at 05:40:40PM +0800, Ajye Huang wrote:
> Hi, Mark
>=20
> Could you please kindly review the series patch v6? And may I get your
> approval if the review is done.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+qf+8ACgkQJNaLcl1U
h9DxYAf+Ml8fbU5qJTIhVmWOIV4EI0pby5cVXJ8Jm2A/+6RqBfDCWb4wpO3Znxbn
8GZnLxdDqCAQ0Ej/aTIDFS5ssSjOluIxZb0D4awtsX8Czodu8881Clpg2vlKlUw6
Uc7PsqBs5fGjPNpmavFnmL3Mu8JAhIuZBFF58Y1FDR5ns6A5fLa7tfFfO0Wbuggo
rk0vvB/2lxH8jdPqM5U0h7XM0wixDmB+MDPnTjSKHtb2bbfuBik6NzVQn6UdkrTj
vVKNExPim4TwFRG7WfVZkTBfhybxziwuFM63n0P1UCjHLIPG2Ay1lBwsPXyxrg/4
dH2Xo1C2aS2VZy5o4pMtXvVBCawm1A==
=oGFb
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
