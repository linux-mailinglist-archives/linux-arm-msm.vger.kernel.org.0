Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A10C02B5082
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 20:04:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728095AbgKPTEU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 14:04:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:53580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725879AbgKPTEU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 14:04:20 -0500
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 52B132225B;
        Mon, 16 Nov 2020 19:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605553459;
        bh=YQbOeR0Ir0jO5GxTkZ/KPEcLOqI6KXbHLyISKeSbQ2k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f3nHWDB5UYIanun4/6bqobOCfJotTUjTtZItEmpy0wO6KaXjrxdusbSMS4ljgIs1V
         pDbRIw4hq7DjsHI/TtpuMdrR/of84ih03VU/ZohdCYYh2vZ8V+NmW9wOj8Dsj2ZgmL
         OKSRtmDgMyutH1MzfMyRjnQs3SXIohzYYhKlIbjs=
Date:   Mon, 16 Nov 2020 19:04:00 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Subject: Re: [PATCH] Asoc: qcom: lpass-platform: Fix memory leak
Message-ID: <20201116190400.GE4739@sirena.org.uk>
References: <1605416210-14530-1-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="brEuL7wsLY8+TuWz"
Content-Disposition: inline
In-Reply-To: <1605416210-14530-1-git-send-email-srivasam@codeaurora.org>
X-Cookie: Immanuel doesn't pun, he Kant.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--brEuL7wsLY8+TuWz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Nov 15, 2020 at 10:26:50AM +0530, Srinivasa Rao Mandadapu wrote:
> lpass_pcm_data is not freed in error paths. Free it in
> error paths to avoid memory leak.

Please use subject lines reflecting the general style for the subsystem,
it makes it easier for people to spot patches that need to be reviewed.

--brEuL7wsLY8+TuWz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+yzSAACgkQJNaLcl1U
h9CULgf/enozSv/x01jexTc5wfCzv9oWXsElA/pDZMQvwp2/Hix6fWeuOPzmWIo7
7PYUVqp5i6mJWejVH+qDpIVIwo2V/KzyT81D5JmooPoOglEZzKdiJcj0LK7mkkD+
T21T3qhVwaWml3gna9W8srBFidN3/gJ7+Agd5M3nQbxGtqINtMPBrJ1y7F6CsGhc
+pTCkwcpDe/oOhWiV/iifsBhWYmkdCWHypN3vMSDMzuiE5u+PcnZchGhPSdCqrJF
FXZ0dMoESRKqUS+MoVa0o3tAL6SEnY/gXvmFEJAw7bYCfpID82GULtwfDuuFmApK
qXYtPZY8/noF2WY+pdHO582yoJ12ag==
=NfJ5
-----END PGP SIGNATURE-----

--brEuL7wsLY8+TuWz--
