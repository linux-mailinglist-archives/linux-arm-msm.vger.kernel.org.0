Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6807D26450D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 13:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727820AbgIJLFl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Sep 2020 07:05:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:51970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730699AbgIJLD2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Sep 2020 07:03:28 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F2DFF20720;
        Thu, 10 Sep 2020 11:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599735807;
        bh=dmrwyQMyeJMFMQp1EmqKFdckpq9rAe0lbenAUyImoHI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=18mUZhE89SuUR9AkRIvaLcq0CV19oM50ifpHaALiIug/IWYJwyy6/yKbEXGWUq0e2
         ySMgHwdgAHR53xxhtsjqglHPRZ6z18CuVQ19qtjnOwsiniC5WkrCRFiC2Lm3RUg9ox
         sGG3YwHzjYvnF+tl2rakOguBKLp+KG5CEGtVhy5w=
Date:   Thu, 10 Sep 2020 12:02:41 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Cheng-yi Chiang <cychiang@chromium.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Doug Anderson <dianders@chromium.org>,
        Dylan Reid <dgreid@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." 
        <alsa-devel@alsa-project.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH v7 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
Message-ID: <20200910110241.GA4898@sirena.org.uk>
References: <20200907100039.1731457-1-cychiang@chromium.org>
 <20200907100039.1731457-3-cychiang@chromium.org>
 <20200908203357.GA861143@bogus>
 <CAFv8NwLMAkFhVT-ML7QHbnSkqmgh=5SrNSik5eSCTHB1=DGQ0A@mail.gmail.com>
 <CAL_JsqKW2bpHP60MX4eFmtfzkvaHJ670m6e8H29=u=mDAYg63w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline
In-Reply-To: <CAL_JsqKW2bpHP60MX4eFmtfzkvaHJ670m6e8H29=u=mDAYg63w@mail.gmail.com>
X-Cookie: I disagree with unanimity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 09, 2020 at 11:49:22AM -0600, Rob Herring wrote:

> I would assume a codec to be similar. The codec node (the alc5682
> node) should have any jack related properties (or possibly implicitly
> support it by default).

This isn't always clear - some jack detection is implemented entirely by
integrating simple components like GPIOs and ADCs or by integrating
limited support in one device with some external components to get more
features (like bolting an ADC on the side for button detect).  I would
not expect to ever see a device with jack detection support that could
just be unconditionally enabled, it will always require some board level
wiring up to provide the connections required to function.

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9aB9EACgkQJNaLcl1U
h9AQugf/fpoDHSobmOyj7a1nUYga227O6hgeON+vz+LB7a1JnX599O2oELAe1IGT
xOV8DGUJpwdKUP1XWMHb/vMrtaS71E8m6Qsulc3s+Hdt6F38ObT5+z7zu0grr0rm
wN1qRoyWHkPhFczDkvF95J2xO+lbs+5DbmfT/YVL+npWCtyYRVgKDwhmwWvqk/Sv
5H7dVBlF1ivTTc4mAbG0FGGVlSL9hsg87i9b30jChkitX7BDRyvj41eVOdQs0Dpz
ghIR+b6ZFI4iihIbFj8kBDL6y6cekl0Cs9YUA5YLsDxSjSJUidnCiuX1UK3NNOW2
HiD76k32T+eskJVotOs6/DwV7UQS4A==
=knP8
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
