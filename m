Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10B882CAA3B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Dec 2020 18:53:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404170AbgLARwq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Dec 2020 12:52:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:54766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391855AbgLARwq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Dec 2020 12:52:46 -0500
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net [92.233.91.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CFCF620639;
        Tue,  1 Dec 2020 17:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606845124;
        bh=jUfmwSwFjkBDlJ2yKLucSJdrO2Do2GFfT2jP3rl2XF0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B6evOfVtPDO/lqPGI4YNEUtxLDjHbZ2Gn0Fo0LlZJhPXn5WYv1KHmWaBDtNZPQcnM
         mjSeRMfZVph92b22w85+1sXGKO/sK9bLw4OSpTbJAZhnHNFFEl/kxxChQpoT1nfsYF
         F/Qw+ItDxJumfTk/UJCa0IEZ6Tgyc4WhgJMslYxI=
Date:   Tue, 1 Dec 2020 17:51:35 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Subject: Re: [PATCH v4 1/2] Partially revert ASoC: qcom: Fix enabling BCLK
 and LRCLK in LPAIF invalid state
Message-ID: <20201201175135.GO5239@sirena.org.uk>
References: <1606539559-4277-1-git-send-email-srivasam@codeaurora.org>
 <1606539559-4277-2-git-send-email-srivasam@codeaurora.org>
 <20201130124617.GC4756@sirena.org.uk>
 <966993b7-4720-bdd2-cf4d-cf5a7c11a0c1@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2/+Vq7w28QOSGzSM"
Content-Disposition: inline
In-Reply-To: <966993b7-4720-bdd2-cf4d-cf5a7c11a0c1@codeaurora.org>
X-Cookie: Who was that masked man?
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--2/+Vq7w28QOSGzSM
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 01, 2020 at 11:01:21PM +0530, Srinivasa Rao Mandadapu wrote:
> On 11/30/2020 6:16 PM, Mark Brown wrote:

> > Part of this commit message says that the problem was making the regist=
ers
> > non-volatile but both the change and the rest of the commit message say
> > that the issue was that the registers were made volatile.  I'm also
> > still unclear as to what the issue is either way - how does reading the
> > state of the registers from the hardware instead of the cache affect
> > things?

> Initial problem was, during playback if device suspended, I2S and DMA
> control registers

> are getting reset and unable to recover playback after resume.

> As these registers were non volatile registers, driver is not getting act=
ual
> register value

> and unable to report error state to application. Due to this application

> keeps on polling for HW current pointer state and not exited from PCM
> running state.

> Later from review comments by Srinivas kandagatla, I got to know
>=20
> about regcache sync APIs, which can be used=A0 to sync cache after resume=
 and
>=20
> HW registers can be updated with=A0 original values. With that playback c=
an be
> continued.
>=20
> So is the reason, I am reverting partial changes in the commit b182496822=
1c.

I don't understand why a fix for the register cache not being in sync
with the hardware doesn't involve syncing the register cache with the
hardware.

--2/+Vq7w28QOSGzSM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/GgqYACgkQJNaLcl1U
h9AADgf8CR0hjpkrydEc4Jmmddl9qFfQcl6Ce7ZzoFWbuXciX9c8pj+PPVgpoX/K
jwlx1LwoYv/e+ods31XWXAdp2nRaCef93oB6iUPjUydd6LdsW40FFiBCB4fiT/v/
6JqlND0PT2+PAgAkoz1sUM9Hn5U5ocdWfs02/3jICjdnfvHjDWtH6XWgNwt+CA1A
1PpFFUv4RkRTYZFG/LHHNXPOOBc8jqJ1Z66ZjEd38AvpJXaWsDAAlF4hc2XUk15/
hSoQ97rYQGjGUfQUB/K9qgkhzAj67DtXgif7iosAO+Th/hAkRwH189Z/lTZrkoOd
Rp1dumAYfp+wg91tB7hho8TJxhmygg==
=QxRn
-----END PGP SIGNATURE-----

--2/+Vq7w28QOSGzSM--
