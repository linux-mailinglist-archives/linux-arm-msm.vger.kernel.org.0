Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B784C218D88
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 18:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730655AbgGHQur (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jul 2020 12:50:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:60006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730634AbgGHQur (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jul 2020 12:50:47 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 800802063A;
        Wed,  8 Jul 2020 16:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594227047;
        bh=AqMKtqS/OXQk+rhorj+lXzo8EwOOu2YsoGozE3DRg5U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g+siRc6bJy6ezH6ZeNdz2UGNlovQfefe94DX3Ol9cFvhEvJwUWscErEJuSZWseQZS
         esTenErVulATOMRJI3KaxHGJEZgA7pGTm/tJE0yl+fLtEBEDoedT1KdWyg5i+z02jA
         31gZNcFQy7WDA+YJFJGBMkhp39cfu1zw3ooqG5XE=
Date:   Wed, 8 Jul 2020 17:50:41 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Rohit kumar <rohitkr@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajit Pandey <ajitp@codeaurora.org>
Subject: Re: [PATCH v3 5/8] ASoC: qcom: lpass-platform: Replace card->dev
 with component->dev
Message-ID: <20200708165041.GX4655@sirena.org.uk>
References: <1594184896-10629-1-git-send-email-rohitkr@codeaurora.org>
 <1594184896-10629-6-git-send-email-rohitkr@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="aBaYPhOdNx+t7mr3"
Content-Disposition: inline
In-Reply-To: <1594184896-10629-6-git-send-email-rohitkr@codeaurora.org>
X-Cookie: Oh Dad!  We're ALL Devo!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--aBaYPhOdNx+t7mr3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 08, 2020 at 10:38:13AM +0530, Rohit kumar wrote:
> From: Ajit Pandey <ajitp@codeaurora.org>
>=20
> We are allocating dma memory for component->dev but trying to mmap
> such memory for substream->pcm->card->dev. Replace device argument
> in mmap with component->dev to fix this.

This is a bug fix and should've been at the start of the series (or sent
separately) so that it can be applied without the rest of the series.

--aBaYPhOdNx+t7mr3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8F+WAACgkQJNaLcl1U
h9DYdwf/TP/V9rRaqchmnuoLr81D+iZWagfBza40aZnj6L9DmzYz9ujUAXhBwLE3
m0qzU/Y80YabOhh+GByaGdPSPAT+34xYOcFVym6e2Iqq6iJHSIY9OWeChI+ieCKv
1JxhQzQgOBoHjSLmCG/IM6/DaP8Gcab0uEakRbI6wzuhKbZtQ8TmCLD90Igv2Y36
bFNfao34+aQxdmGpe1lLqScooepCZzYeL47nFGlVoXFSG9phR0h+Qwj/ed/5alhn
ntxODL3WdwurRO+1L/TZrPhfrmMolsda9pU0G6Mm4vO2NwXK/bZuYixvckCT7H3S
5frOF/gMTdki5Wl3SDrE8GDvOrX9/w==
=exLA
-----END PGP SIGNATURE-----

--aBaYPhOdNx+t7mr3--
