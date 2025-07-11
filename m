Return-Path: <linux-arm-msm+bounces-64514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC754B0169F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 10:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 926083A5E39
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 08:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0452080C8;
	Fri, 11 Jul 2025 08:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPDJ634I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4B51F4C8A;
	Fri, 11 Jul 2025 08:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752223373; cv=none; b=RachO97ot9ulf4I3BWInZ3SSucudQP+THJ1Nxzkb8g5RReYn35tNRs9egoowMSDuqJutO5kAqQotq/wZLTQxGepK/FmHQl/fo4LUMN+P1WxylYJfMYklepfykb6yKqZpZB2yofIcmEM+asAB4uTBnqdq6xaP5bGnyT48HfCYKjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752223373; c=relaxed/simple;
	bh=Ksn587LwQGnOVtjPmSeGM14Xwc66lrZWBn8JfHWAj9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cI2KIOJm5esTaJfqDOAcsvlvDyl0uzjt1DRTO2yF81Xs/bdbG6hNjV3IwUxniF0Cn9JkqlJvM9JJTjE2Ex8gAWvodxZbetWH3I5Cf7i1iburd9jbCW3aHrwp2y4oOM7t7k5pRTFvI85XmgoR8NKP49SEvlyqIr/9SRZEV9KhRdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPDJ634I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57547C4CEED;
	Fri, 11 Jul 2025 08:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752223373;
	bh=Ksn587LwQGnOVtjPmSeGM14Xwc66lrZWBn8JfHWAj9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KPDJ634INOzYR5WVlOFN6hgNAUb2r3fN1dKrdghH7OOwASHtsPjVgU3/sZ3oz4r+v
	 4/dQB2yxCTnvhuAK32QPrvKu7GixkBHTZzTUgkJPZ2RzqINnAdLEu8GHL+DWoCd5Yx
	 qiRbnAOx08Od9VmKi2qwypohZ+m5aNosps+826CXxnaybcMvbn3Bh0gTi/Fy3NapVU
	 jRdE7UWULkn+c8UtMDoa/1fqAdZd9gOD8oyd0SRG7Ys+1u9oCgmMvEAJzOKGi15lG+
	 rk8rIQUOizEocjrWlhfTdeO82Wy04bzlToCNxOP1Qi6SSQyGB/wX5ds1IDlrGbsuy8
	 BbkHhIMAt4sJw==
Date: Fri, 11 Jul 2025 09:42:48 +0100
From: Mark Brown <broonie@kernel.org>
To: George Verhaegen <verhaegen@google.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Srinivas Kandagatla <srini@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>, kernel-team@android.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, linux-arm-msm@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-arm-kernel@lists.infradead.org, David Li <dvdli@google.com>,
	Miller Liang <millerliang@google.com>
Subject: Re: [PATCH v1 4/4] ASoC: codecs: Implement 64-bit pointer operation
Message-ID: <aHDOiIPriOa65BL-@finisterre.sirena.org.uk>
References: <20250711082441.4193295-1-verhaegen@google.com>
 <20250711082441.4193295-5-verhaegen@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R6veuuaDGFY/uZCc"
Content-Disposition: inline
In-Reply-To: <20250711082441.4193295-5-verhaegen@google.com>
X-Cookie: Do not cut switchbacks.


--R6veuuaDGFY/uZCc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 09:24:36AM +0100, George Verhaegen wrote:
> From: Joris Verhaegen <verhaegen@google.com>
>=20
> Signed-off-by: Joris Verhaegen <verhaegen@google.com>
> Tested-by: Joris Verhaegen <verhaegen@google.com>
> Reviewed-by: David Li <dvdli@google.com>
> Reviewed-by: Miller Liang <millerliang@google.com>
> ---

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

(I suspect you've actually written your name in a different forms in
your git config and mail client but it's not adequately obvious.)

--R6veuuaDGFY/uZCc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhwzocACgkQJNaLcl1U
h9D8TQf/TfiZ5LH0t2t/gOySQJEWcgmIAuNt3zfQsrVDV8A5qqKogbPV75loZN6m
Eyvcog4WCIoJ4w+VNEL8E439Uk73Z25kCbdPYWnwQhZSFgE8ZpR7HD/LSbKFhc6d
emjLxS+zGnk6t/sl32u6/gLpr/aONk7oYV5e5vhxFuIsyfhttyBSFLWBANDkfegR
NTakl5zHb8GwXTdioJciuBnfyk2A+VHk+jdE9Wd13fi8Mpq6OB08OufGE9SFbMx7
hbdO7t82aZcBIILzKP+op7T62kV1SOOboIT7yomeLLUQMHkxA3s4eQ3oEy10o24L
tSUYZbnJm2Gx7zFMZZfCaR6Jik9plg==
=v/M6
-----END PGP SIGNATURE-----

--R6veuuaDGFY/uZCc--

