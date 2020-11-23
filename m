Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95CEA2C1112
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 17:54:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732592AbgKWQvu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 11:51:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:36442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732092AbgKWQvs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 11:51:48 -0500
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net [92.233.91.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AE59F20717;
        Mon, 23 Nov 2020 16:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606150308;
        bh=158lXazOCoo8QHnhf+9XBqL544AdrMia4bMuOC8qki0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Psvwyc6yDuLtIWfKQ0aOf76rkBo9HFL9lfagC2N2mfm06muajkILhsOzb63jOzI8d
         x/fycBPK8uyRfflMijPTyNq60y6C4VM8G65EYs2oWsgsCtEnNbJ278S+mXa3799GEw
         3vSRFgfQnHG7f1C3Oruev5Wi99G5IBgvZn9mJQ1E=
Date:   Mon, 23 Nov 2020 16:51:24 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Subject: Re: [PATCH] Asoc: qcom: Fix enabling BCLK and LRCLK in LPAIF invalid
 state
Message-ID: <20201123165124.GI6322@sirena.org.uk>
References: <1606148273-17325-1-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1E1Oui4vdubnXi3o"
Content-Disposition: inline
In-Reply-To: <1606148273-17325-1-git-send-email-srivasam@codeaurora.org>
X-Cookie: Dry clean only.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--1E1Oui4vdubnXi3o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 23, 2020 at 09:47:53PM +0530, Srinivasa Rao Mandadapu wrote:
> Fix enabling BCLK and LRCLK only when LPAIF is invalid state and
> bit clock in enable state.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--1E1Oui4vdubnXi3o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+76IwACgkQJNaLcl1U
h9DYdQgAgWGFsJC6dNYqraAEb1cWuSo040ixzZMX/z381gtHtGp700nYpqfA25Bn
Y2bBmYuWivTHeX4KRTj7sSqz+HL2btNjvurcm7LpITLXOmVHLJi2FN1SloMfzgmA
/IXlDRwhfjl1CyxvqNaob+8PtkbviFIQC4DjlH0oJjTfhCY9zkXURWbLaPru4Vzp
LcH/2p+KPMfTGtdWe14CyAwED2wvRgGDgviQsdlRcgD5+Zvr2i1sSZ9a17ES60II
35XDRfAm7BKnEA32ZWStLy3j+4jKKncY4nH/+40dMpn1qxZlrnUxVYVuSq3Qm7jF
UPvnkuz+NgSwnR+mVM6QonsdhG1Q9w==
=+8cZ
-----END PGP SIGNATURE-----

--1E1Oui4vdubnXi3o--
