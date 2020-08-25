Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3BF252171
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Aug 2020 22:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726222AbgHYUB3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Aug 2020 16:01:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:43058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726158AbgHYUB3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Aug 2020 16:01:29 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E12A72072D;
        Tue, 25 Aug 2020 20:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598385688;
        bh=bTc4v+6F/hagCAOCYn0EUdpt19OkZWEAtYQetr9TA/0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MtwFGwk4OelnWAHsK7KS1KGH506S1PZ3kare4MTUWPq7jCKnwoKgb2o7vCqoNfWs5
         RglzVl485H0m+cP4JfbwfwQ+SKsyLWbPjq91O7pjwYne6HsenZz4wBjJbiq3j/7Las
         Ud8aAq/9a9RtRwSNLbuwHoXPeX8IDt/BSude5F+g=
Date:   Tue, 25 Aug 2020 21:00:52 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Srinivasa Rao <srivasam@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vsujithk <vsujithk@codeaurora.org>
Subject: Re: [PATCH 1/5] dt-bindings: Add sc7180-lpass HDMI header define
Message-ID: <20200825200052.GI5379@sirena.org.uk>
References: <1598375788-1882-1-git-send-email-srivasam@codeaurora.org>
 <1598375788-1882-2-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5uO961YFyoDlzFnP"
Content-Disposition: inline
In-Reply-To: <1598375788-1882-2-git-send-email-srivasam@codeaurora.org>
X-Cookie: Don't get to bragging.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--5uO961YFyoDlzFnP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2020 at 10:46:24PM +0530, Srinivasa Rao wrote:
> From: vsujithk <vsujithk@codeaurora.org>
>=20
> Add header defining HDMI dai-id for SC7180 lpass soc.
>=20
> Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
> ---

You haven't provided a signoff for the author "vsujithk" (who presumably
has a more complete name?) - these are important, see
submitting-patches.rst for details on what the signoff means and why
it's needed.

--5uO961YFyoDlzFnP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9FbfQACgkQJNaLcl1U
h9BSlAf/YtTZ0z9aVXnosGU97p0DjhzallSbOSZxFjDNmCb2yZ/ule4Z75XA+5Ga
pzP1MEIbbmmTsPsx7NQVDZuAWMGdMUISlp6rL12clfwjkg/XoJhMS6pQ4aJaCvQF
jP5manaErAltKq3qc3rOpj+4x0/xHnLjfVFyqbmy2AQvhhM/ufJNi2v1rGkn7H2e
vp2EvfC/3BOU7pRa5JjDWfZ1tfHbCIuPuDWvP+pvcJ0fcULucj25U4IKoF+Y8A13
qZ0E+eWvWeDIn2iVUboRvD2Y8rK7br55aTIlMviSb2Ss8eQJ/BpEeE1WhUDuC/1C
UzsYrYs1VQYeyG0d2jSuhyYboKdlHA==
=4xff
-----END PGP SIGNATURE-----

--5uO961YFyoDlzFnP--
