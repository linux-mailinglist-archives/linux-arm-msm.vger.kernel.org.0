Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D4F028B854
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Oct 2020 15:52:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390073AbgJLNv0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Oct 2020 09:51:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:58574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389956AbgJLNua (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Oct 2020 09:50:30 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 543F620678;
        Mon, 12 Oct 2020 13:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602510629;
        bh=gclqk7PlHJkH2Ivqw36sMpSSFpCR5Atw2BLhMIFSeZ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uBfz4p4Rs+2yLXkEje0vEUczBBX9Wa8UI1+elcZfPtciYMbvFTkbSNNMrr+FrPv9E
         lyTKL+hZtelhR2hYYQyRxGz5GNnfPqnWLnGrV47YD66zUGy5e/zug9eW1IFmqQGzLQ
         rp+iMF+8MOkSI+8AIteEQJn6DaMl0iRaM4yayxHM=
Date:   Mon, 12 Oct 2020 14:50:25 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Cc:     Ajye Huang <ajye.huang@gmail.com>, linux-kernel@vger.kernel.org,
        dianders@chromium.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rohit kumar <rohitkr@codeaurora.org>, tzungbi@chromium.org,
        linux-arm-kernel@lists.infradead.org,
        Cheng-yi Chiang <cychiang@chromium.org>
Subject: Re: [PATCH v1 1/2] ASoC: qcom: dt-bindings: Modify sc7180 machine
 bindings
Message-ID: <20201012135025.GF4332@sirena.org.uk>
References: <20200928063744.525700-1-ajye_huang@compal.corp-partner.google.com>
 <20200928063744.525700-2-ajye_huang@compal.corp-partner.google.com>
 <20201009135231.GA6655@sirena.org.uk>
 <CALprXBZAFCOpWP2186RaP++613qnjPY3D3NbXEN5CToYsLNsRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="m1UC1K4AOz1Ywdkx"
Content-Disposition: inline
In-Reply-To: <CALprXBZAFCOpWP2186RaP++613qnjPY3D3NbXEN5CToYsLNsRw@mail.gmail.com>
X-Cookie: Fremen add life to spice!
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--m1UC1K4AOz1Ywdkx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 10, 2020 at 12:07:54AM +0800, Ajye Huang wrote:
> On Fri, Oct 9, 2020 at 9:52 PM Mark Brown <broonie@kernel.org> wrote:
> > On Mon, Sep 28, 2020 at 02:37:43PM +0800, Ajye Huang wrote:

> > > Add compatible "qcom,sc7180-sndcard-rt5682-m98357-2mic"
> > > for 2mic case.

> > This doesn't apply against current code, please check and resend.

> Thank you for your reply,
> This patch depends on  Cheng-Yi's patch series
> https://patchwork.kernel.org/patch/11773221/.

That's "ASoC: qcom: dt-bindings: Add sc7180 machine bindings" for those
playing at home.

>   If I misunderstand what you mean, please correct me,

A version of some SC7180 patches was applied.  However it does seem like
that didn't include any machine driver bindings so it must've been a
different, similar looking series which is presumably waiting for a new
version - please resend based on that new version (ideally these patches
could be picked up as part of that series).

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--m1UC1K4AOz1Ywdkx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+EXyAACgkQJNaLcl1U
h9BwIAf/XpfQPd1lFO2YwlgTjpFOBaziPt4AR62h8rbInkhceFG213nkLrJwxqwB
zd86aM3WLbMco1ub9Cb45c8Ki+XG3JkKzu42jAe57UI7PKDSEUbMPX9ij9syI0rp
Av2maAjFLvsayqXLMKoPAEeukBfNGxFys7bGRRPVFCFH2Ji9o2JmrRQ3nUOTmxNW
kZBtjAkb2L7b9gMZj2p+pnwuU/Sx9DWyaE5pIu02YsjxXCp1NSWRCYnoZ/WPmvMh
la5s2RnQJ7d5etnRM/iKDUmNrJX6bptGu7aFpwIM7ErjhIc2nT8SbtH79lU63t9w
eGhLoubWxF3WrO9uxYZ9ecN0h4ufwg==
=78nE
-----END PGP SIGNATURE-----

--m1UC1K4AOz1Ywdkx--
