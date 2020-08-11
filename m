Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 612C0241A76
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 13:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728712AbgHKLes (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 07:34:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:50740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728454AbgHKLer (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 07:34:47 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A051C20658;
        Tue, 11 Aug 2020 11:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597145686;
        bh=tXSK1bbJjI8f7pE16RsNSU4/vL0xPNkq0yMICmwmV7U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pH40c6yTYqg22uhlT4NSUDlyC96ngKf0rrFT+lKuLnUPSnEmZzI4DU/7BeBTiXgrv
         ZuLMX5dhmPB1MCEWquSnPrmgtTHJwRxj+sJlRXYObCD0aulnGT6FZWQEE0IhPB1wcp
         uIQ7FPzd22LXMgvgvccxjud+Qxl752QjsaNXOlI0=
Date:   Tue, 11 Aug 2020 12:34:18 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Rohit Kumar <rohitkr@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajit Pandey <ajitp@codeaurora.org>
Subject: Re: [PATCH v5 01/12] ASoC: qcom: Add common array to initialize soc
 based core clocks
Message-ID: <20200811113418.GD6967@sirena.org.uk>
References: <1596528453-11437-1-git-send-email-rohitkr@codeaurora.org>
 <1596528453-11437-2-git-send-email-rohitkr@codeaurora.org>
 <3e390421-84ce-3b74-a72d-8fc09e908971@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Hf61M2y+wYpnELGG"
Content-Disposition: inline
In-Reply-To: <3e390421-84ce-3b74-a72d-8fc09e908971@codeaurora.org>
X-Cookie: Gravity is a myth, the Earth sucks.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--Hf61M2y+wYpnELGG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 11, 2020 at 04:13:03PM +0530, Rohit Kumar wrote:

> Do you see any concern with patches (1-11).
> As of now, there is comment only in patch 12 from Rob which I am
> planning to update once other patches are merged. Can you
> please review and let me know if anything is missing.

Please just post the fixed series instead of sending me a stream of
pings, it must be taking you more time to do this than it would to just
send the fix.  I'm not going to apply your patches during the merge
window, they are not bug fixes and sending me content free pings just
makes me delay the review.

--Hf61M2y+wYpnELGG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8ygjkACgkQJNaLcl1U
h9C3RQf+PBe4o8K1iH4v9zKqTg+1dkOUhKkRgi+zmCmrCy0wnVLIGktdvj8PoOth
GeEGbH6rwDHgoaPShdTLAykiT6SKUWOd6ORFRfQtoMCF1Wi7ZowLA5ewKguKTpN5
rNCSk5wWOHjBR9Iys8swI05RzZngX2gARWUdUcU3TqRQGDhtvM9C8nM46TUFxrG2
e3x7GVEvrWuRmO+4+e7B9x7Ax+raNo3skRiWvASCRi0pItCxRbvJWOS21Q6DTAn0
8ZIAQVkI+DDm2kqnvJfxx6IiNTNL9Bcpf3T9BEKhQbud96OOer3iWY+X5X1RTeoM
jvlXIkOdDhohHWms7RtOxp2Drhu6/g==
=WQkS
-----END PGP SIGNATURE-----

--Hf61M2y+wYpnELGG--
