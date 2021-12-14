Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1840B4743D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Dec 2021 14:47:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234552AbhLNNr3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 08:47:29 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:53050 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234548AbhLNNr3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 08:47:29 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 03418B819A1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 13:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9BEC34601;
        Tue, 14 Dec 2021 13:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639489646;
        bh=JwhJuFAM42vOdloILusvkHUTcWrMLKPvkc4iARM3qMM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=apP8Sai+uw6orF0J8Pdag1y0oCVskMkaL82ePR5nwcTtpFgTSnat28j7m9XPP6Dl5
         BAAs1W8v3gC+5rF0JYAm+G0D83jysqezGg1Zhf6PjGYSvbFOgjacmFR2z2pS04isTd
         duMRkBNiiS5KBAfQCwKasbWyX/zXaCUD9jyFrjKsumPPVqAJ7uqhU/PwGv16NRl0st
         yWymDcubn4TM3nojw1l/+RlacNQA9fXBMtXPwueUhtZCAndW9gPnp7LajG+DgygF1a
         eZ0qT5yMltwpPARDaCHPWdfLqV+eTF8W7bdS9CnT0QKIfOgt5JwAuN6dkXwrjnAno5
         uu/K+FyqlPmzQ==
Date:   Tue, 14 Dec 2021 13:47:20 +0000
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
Subject: Re: [v3] SoC: qcom: Distinguish headset codec by codec_dai->name
Message-ID: <YbigaFWiLzi/4Ljv@sirena.org.uk>
References: <20211214022509.1288245-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PMc1jF/EEbgjBUTX"
Content-Disposition: inline
In-Reply-To: <20211214022509.1288245-1-judyhsiao@chromium.org>
X-Cookie: No solicitors.
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--PMc1jF/EEbgjBUTX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 14, 2021 at 10:25:09AM +0800, Judy Hsiao wrote:
> Distinguish which headset codec is on the board by codec_dai->name
> instead of card->name.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--PMc1jF/EEbgjBUTX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmG4oGgACgkQJNaLcl1U
h9AkBAf/dut9BUz9jbak9a35YO2OSGoVSscO2+hGoFIOS6RNh6DYvQbq7ldY/A8+
OBkfvWnBkatZzkcf4yeKwUmCWD/JAMzqiq7JYRF+B+ziNyqCmv28d727fR5uvhAY
tW+TmcaZnIHZ58vTa5UdrKctv6cbwuZOoT/oFEcFnq2aJ+kKlrJ87cm2QWE4i22V
yZggCd67+9zFGErXbL1y/9q5Ca3zboCPQhySFUL0QxSWV2tKesT7H+PagX96m33k
mjN50juAOlpQ990xRNBmUrhahEkJ3sbHauTHUISq7eQhRRF5zszyjdMPB/v+kfWz
zOc+UmOjPyYI+URxH/5wZZM5IVrVNg==
=DvSY
-----END PGP SIGNATURE-----

--PMc1jF/EEbgjBUTX--
