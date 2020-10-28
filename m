Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98D7B29E1EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 03:05:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726411AbgJ1Vst (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Oct 2020 17:48:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:38134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725790AbgJ1VmX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Oct 2020 17:42:23 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9B73A2483C;
        Wed, 28 Oct 2020 21:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603920312;
        bh=GJYr0kQ5tQclKFUAWNHS/HPkX2rE4VXTuAgt6K8K3sU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NrHWrlJZKlc5ihemz0VmfxNgxWCyJN5iXcB5ZTjHBIWIo+VoffwEF90ALfUJtbmFt
         9kfSYka9iSSe8f2tj+hDXjWCo+UHps1QG6MmhLdZy7MMy30tjcKoCgWePeL06uPz21
         cHvSw+v9Wch4ogLxrKprt3tVCVIFBzdYeOxZNgnM=
Date:   Wed, 28 Oct 2020 21:25:06 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Subject: Re: [PATCH v2] Asoc: qcom: lpass-sc7180: Fix MI2S bitwidth field bit
 positions
Message-ID: <20201028212506.GB6302@sirena.org.uk>
References: <1603798474-4897-1-git-send-email-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Content-Disposition: inline
In-Reply-To: <1603798474-4897-1-git-send-email-srivasam@codeaurora.org>
X-Cookie: Allow 6 to 8 weeks for delivery.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 27, 2020 at 05:04:34PM +0530, Srinivasa Rao Mandadapu wrote:

> Update SC7180 lpass_variant structure with proper I2S bitwidth
> field bit positions, as bitwidth denotes 0 to 1 bits,
> but previously used only 0 bit.

To repeat my previous feedback:

| Please submit patches using subject lines reflecting the style for the
| subsystem, this makes it easier for people to identify relevant patches.
| Look at what existing commits in the area you're changing are doing and
| make sure your subject lines visually resemble what they're doing.

--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+Z4bEACgkQJNaLcl1U
h9AvIQf8DyFuw//44sZKS76tGkYUI5e63r0TFIgniukPLkySfUIpx+onvitdbnoF
d5kB+XFMTSPLebTNF3+bdb3fzWLYlhWL0zr5UPL/P9+is6DwLji3NOT2Qlh9oMLQ
WGcBl/NaliM2uxVnPB7eByEOpZAuPd61K+lhM6Mg8nlKroMZqJFUpN/D0asYhS4z
r4Grz87b4Ncgtwq0EZ9pOA9Y1AVPN7w2YUh9qLEAf10i99Z0gXDwBZusY76Ffn3g
ExRlnD73EUQPf4YX97Ey7B9vWjmGxZL6a3HnHHwU4YItA7Dio7CX7NDak0mQYWBs
C10XnhMfKVhxDsy5nhtTnYQI81Y60A==
=mqF7
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--
