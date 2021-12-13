Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF08447313C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Dec 2021 17:06:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239397AbhLMQGd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Dec 2021 11:06:33 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:55146 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233834AbhLMQGd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Dec 2021 11:06:33 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 269AF61164
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Dec 2021 16:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D72DAC34603;
        Mon, 13 Dec 2021 16:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639411592;
        bh=rXnBsVxcBXElloKji2ajbsyDvwCJ0DSAlp3vgNJE2sA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TuIuJ3psaUqDh/BYj7qu+hKMs8MDyw8/VX5hq8v4ZYL87HI2zrK4KuKQu0yvxt5iI
         s57+N+p/2NOsMBHcBQkbGwXDj6XneJFQZcYXhMgd7VYL4IvmoCl/gVPxiWcGMZNxM/
         nUIFceByrJh4KecFGjPFi1Y7bXTUioW/Flcw31c7fsNIer/CkeMnvi3uG/TXKJybEH
         YNjaWTuXR4ODiLFAPwB7U82Vx14mHtiQ0mpe3d95Cx1tJti99T6gLPcYYp/jXU8u94
         4zpch+4U58euj0h7WuafSaX7wmLXwHn4WWSAox57OUz5sOsTEeu5FHpWOl9yl0iT1r
         CrXdkilVWw2Zg==
Date:   Mon, 13 Dec 2021 16:06:26 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, dianders@chromium.org,
        cychiang@google.com, yuhsuan@chromium.org, judyhsiao@google.com,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [v2] SoC: qcom: Distinguish headset codec by codec_dai->name
Message-ID: <YbdvgsxMThr0e8zl@sirena.org.uk>
References: <20211213023626.673323-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LeBiO8fVW2rW6wdM"
Content-Disposition: inline
In-Reply-To: <20211213023626.673323-1-judyhsiao@chromium.org>
X-Cookie: No solicitors.
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--LeBiO8fVW2rW6wdM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 13, 2021 at 10:36:26AM +0800, Judy Hsiao wrote:

> Call stack of the crash:
> ```
>  Unable to handle kernel paging request at virtual address ffffffbfe7bba9ce
>  Mem abort info:

Please think hard before including complete backtraces in upstream
reports, they are very large and contain almost no useful information
relative to their size so often obscure the relevant content in your
message. If part of the backtrace is usefully illustrative (it often is
for search engines if nothing else) then it's usually better to pull out
the relevant sections.

--LeBiO8fVW2rW6wdM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmG3b4IACgkQJNaLcl1U
h9CGawf/bxYlM8BIwZISWj9XwYRJQ4xszBtDniunG9Ubh5idc8v3okv0ft3yEG0j
/dEv2lEEY5geJV2dACTlAUbzdIHd44K7K+SoqTtZar+3p08mzTImfCaXwNvBD5qa
ftA8YH3EyMDxTnqS5f25632WrBfIgvbIL8enlfIqIMRf6UCDmKDIl4eVmN13Wk5w
k82/PDyXplEWTxQ3zyvhbv82g9XzZtkCrT+uqqs3s35ORP1V9Ay4qxc/2Z+CARQi
BfeSbE0RsjZkcnKWSQrDE/msrvaeW34tdL8rCm47Uc2C/FXsrNn46wOUlBaG/Tol
yyyDBjvmziEWRJeqm+8KYwXjZM8x2Q==
=IL/Z
-----END PGP SIGNATURE-----

--LeBiO8fVW2rW6wdM--
