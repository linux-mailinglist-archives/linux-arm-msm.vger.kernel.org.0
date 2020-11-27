Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B76C2C65D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Nov 2020 13:41:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729309AbgK0MjX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Nov 2020 07:39:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:48938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729148AbgK0MjX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Nov 2020 07:39:23 -0500
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net [92.233.91.117])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D2A0322240;
        Fri, 27 Nov 2020 12:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606480762;
        bh=uitY12qTzJ6CCv8Sff1HVoEyGCJ5WaJc3uh+EFJw428=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kjFojvRH5W2864LJMjgV8LXoFhjHdTqCBxc64tYibo7aT9tPtIENd2Ja4CWpa4a4W
         IPG0FUzwTPM9bFCAUIVq7rWxHoBH8l3UVC2DTZlBPfvdy/KptFKTB/tbqlBE6RuV4h
         xaa6D5AHgV65Ab1gaN4BSiafN5cRy5AsZCzVEGbE=
Date:   Fri, 27 Nov 2020 12:38:56 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Subject: Re: [PATCH] Asoc: qcom: Fix for problem in resume with CRAS
Message-ID: <20201127123856.GA4845@sirena.org.uk>
References: <1606450323-21641-1-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vtzGhvizbBRQ85DL"
Content-Disposition: inline
In-Reply-To: <1606450323-21641-1-git-send-email-srivasam@codeaurora.org>
X-Cookie: All work and no pay makes a housewife.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--vtzGhvizbBRQ85DL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 27, 2020 at 09:42:03AM +0530, Srinivasa Rao Mandadapu wrote:
> To support playback continuation after resume problem in chrome
> audio server:
> Prepare device in  platform trigger callback.
> Make I2s and DMA control registers as non volatile.

What is the actual issue this is fixing?

As I have previously said please submit patches using subject lines
reflecting the style for the subsystem, this makes it easier for people
to identify relevant patches.  Look at what existing commits in the area
you're changing are doing and make sure your subject lines visually
resemble what they're doing.  There's no need to resubmit to fix this
alone.

--vtzGhvizbBRQ85DL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/A82AACgkQJNaLcl1U
h9A/7Qf/c6x/s5ZWRfoB7c+m1pakjVu2TQcvsEdS0xLz2/SldOq2hhGP0dW6gXca
4brb3HK8lDaIwnlbk3N27mGDUObmzte/41ZJ/Gx0HNIqN8oU7dEgO+AEU+XJ+bnO
cFBy1NhWu2ZnC33hkVxeyJSzDg0hT2pTE+rOoCRog0cgWXlsGfQW/OJONyTdVfeX
g+LnVrLafbO4ERJRlYICy1Ibj8ongorQVPPGU3OoB1fq4cMXvO18NMi7pg/dFH/q
YqzP2l5jrH+jiugbzniHHcvnkqVFta8BfKcxZqeXfDKT6Cv3vtT6c/k++/Guzq0V
J67riGm4jZB7+pEneGlM4ZSQr/mmng==
=YJfA
-----END PGP SIGNATURE-----

--vtzGhvizbBRQ85DL--
