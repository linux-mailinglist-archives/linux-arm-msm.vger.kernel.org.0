Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6413AE851
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 13:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbhFULsY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 07:48:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:59262 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229576AbhFULsX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 07:48:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 020A261042;
        Mon, 21 Jun 2021 11:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624275969;
        bh=o2BrqAEzQ18i2RIwqxFr1jTlLo7zkIjHvzpelLDjh5g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K0qeyHxscw0e50hQ1s4ED722x4ZoOQjFFfsw0bWIPNhKjWZhfm5c13usRjMnlrK0P
         KxF1nkH1kSePSbHmLqwh2jDQ1AAWasPKgyzxs6xTuACig8sAFCViRWG9OjCC6Oss7E
         PGCxK9d9LgwILRJ59h6sjRc/E1NBkS+SdzLrHn+D4WyCYWLPCXRGp0SZM7xr2/teK8
         GEvmYHfpL58vyn5V93I1pLYWMplk9O1pPzbW0Nqk+jT+Pgx1kjGHFsHZ/oeoMZvphT
         kbtexOUdUKqV2ohEX99Hvbst8tFH138C42EhTLQGYBYgqJ0l1Y2xW1tHzusiYUsOtU
         3Fmpe0865cpkA==
Date:   Mon, 21 Jun 2021 12:45:46 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     Taniya Das <tdas@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>, dianders@chromium.org,
        dgreid@chromium.org, cychiang@google.com, judyhsiao@google.com,
        tzungbi@chromium.org, swboyd@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: snd-soc-dummy: add Device Tree support
Message-ID: <20210621114546.GD4094@sirena.org.uk>
References: <20210621074152.306362-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Qrgsu6vtpU/OV/zm"
Content-Disposition: inline
In-Reply-To: <20210621074152.306362-1-judyhsiao@chromium.org>
X-Cookie: I hate dying.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--Qrgsu6vtpU/OV/zm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 21, 2021 at 03:41:52PM +0800, Judy Hsiao wrote:

> Support for loading the snd-soc-dummy via DeviceTree.
> This is useful to create dummy codec devices where we need to have some
> DAI links without a real Codec.

Why would it be useful to create DAI links to a dummy device that has
no properties?  If you've got a device with no software control it's
still going to have some limits on things like what formats and sample
rates it can accept so you should describe that in DT.

Please try to keep the CC lists for patches you are submitting relevant
to the patch, people get a lot of mail and reviews for irrelevant
patches add to the noise.

--Qrgsu6vtpU/OV/zm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDQe+oACgkQJNaLcl1U
h9DvcAf+OEQdZ8mpmDx64FNAM+JYbFmXKYuVAq6hARBk0HPXzJvIOIs9QeQtvj8d
GObICfD9GNrHXO+4+QWsToFDBSEff+lwDBMZ/fQtTLQIOwsFSiGGz6T940Ln5PnD
l3XErztXHn8QfavfE5pnQX5pU9vlXZ8GCucUa7jCn0rTko1Qp0WrUEuE35+3Sl/3
rMohutM+1vubyep03x3pRR7dPMyL3EOlq08bGXqzKkfO56oZ/RVrOKCx0ytG97tb
x0Ef9xlJalRgDK0s1xASY6KK4we8ses7pbHrsJ3zLV6SI72ND4HrnkdNiylxou9O
PCISf/t7SFF7MvLP5norF8md0ihGgg==
=PlEf
-----END PGP SIGNATURE-----

--Qrgsu6vtpU/OV/zm--
