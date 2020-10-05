Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BED55283424
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 12:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725934AbgJEKpO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 06:45:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:35972 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725843AbgJEKpN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 06:45:13 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9FD372078D;
        Mon,  5 Oct 2020 10:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601894713;
        bh=lkng/i8tI+e14rJtzP4dBacXfMVUIrCuYChUoHpV6f4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RQ6ZPe8zWyyzFtnYvrxWLKJq5zXlJLtQC4lsGf7csP83g3ZNXzldLgJ8+8fMOF2nd
         4ZIoctkQOM3kOp3V0sP6U2y8/bq49YmOnD4pQgwIThajfej8+j5plWpGlTB+DV9tOh
         BMrClWmCkoY8DQjL8Rd0crX5uc0R1ejDc16rOlSE=
Date:   Mon, 5 Oct 2020 11:44:09 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Subject: Re: [PATCH v8 5/7] ASoC: qcom: Add support for lpass hdmi driver
Message-ID: <20201005104409.GA5139@sirena.org.uk>
References: <1601447977-18115-1-git-send-email-srivasam@codeaurora.org>
 <1601447977-18115-6-git-send-email-srivasam@codeaurora.org>
 <c94cf74d-03f6-999e-012f-5d9ef2316d61@linaro.org>
 <925e2586-39dd-b1d9-174a-bda3367ab668@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline
In-Reply-To: <925e2586-39dd-b1d9-174a-bda3367ab668@codeaurora.org>
X-Cookie: Most of your faults are not your fault.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 03, 2020 at 05:06:06PM +0530, Srinivasa Rao Mandadapu wrote:
> On 9/30/2020 8:57 PM, Srinivas Kandagatla wrote:

> > I did ask this question in multiple reviews, but never got an answer!
> > Are all the dp/hdmi port register range really volatile!?

> Sorry for incomplete response in last review comment reply.
> With making only specific DMA registers and interrupts registers true, aplay
> was stuck.

> Now we identified issue causing register and made it volatile.
> With that change it seems working fine. After doing all the tests we will
> share v9 series patch.

That sounds like the problem hasn't fully been understood yet and there
might be more going on?

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl96+PkACgkQJNaLcl1U
h9CtFwf9HLMbUICJl61lY3f7S4Lrbw0Ud//67rf9LdOlVvBMsc/lIUthb3aCy4uj
/DLWYw+3RgJtVZk87Z6LTduHcEABfTPEgg0AiIRzE4uFFAT7QmFOKU/m+jynGHka
MEWS2WQ2d+ttBmQImAA4Srrplq9Tx4DhLaSab+j9uVE8to/K/pOcOWt7OrenqPIK
RqySIfB8Q+TYBUJMLk7cIVr4v3AVsb/VC4rroX7+D54eiNGVQWuEO9wFq/P72qEh
GbmKbmpVakl/Ho1IxxNvJ5svxlwDYG7wBFFWodltyDs6OCnLDhDMLc+t0a/KycSs
Ud6mYHX+kMu0GA9mXnNEtcwvjO1nBQ==
=1TAI
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
