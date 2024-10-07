Return-Path: <linux-arm-msm+bounces-33380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F0D992E97
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 16:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 532891F2339B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 14:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D504E1D433B;
	Mon,  7 Oct 2024 14:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="szdMgXzi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61DB433CA;
	Mon,  7 Oct 2024 14:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728310555; cv=none; b=JLssjm0xEbQ29RF6ezQ7GQ1gsJhXgqQyQGiuBxH6VvesX7KcecjBH3gWTBf4bghyGGzNAsX3IYCJwzp5PNY6SaC0WJjI4iNx0J5nt1Hz4q/LkWndh5GTTWO5M9iPYg5eVQt2DcFT+xaeK85cBfcbmTXFE7iI357ZZyTr4Ml4ZDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728310555; c=relaxed/simple;
	bh=3qD+O+1xzIs6q1p8HC+OxtflwSCDotmRykzLnbi1GN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lN8/kVHjppau9S/BXk6QgFJIN7Hi1K2UtmM4vrsMJIm73OOy8WuwCdTJewm/r4RNkQOtPxqJlOzTeFdkmv0GoFKszR6MLpqcHE67KG9/oRTr4OPWn4i5z1w8uTJtO4ajGssrd8i5oevdg9HIkqSrn0z299mE1ohEqWyyGorv7sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=szdMgXzi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C138FC4CEC6;
	Mon,  7 Oct 2024 14:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728310555;
	bh=3qD+O+1xzIs6q1p8HC+OxtflwSCDotmRykzLnbi1GN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=szdMgXzikN+bR54b3MvHNJnGyR26KH24dNATMHRHRHy+LT2a+ub9a0/ROx5liqzB/
	 XHWZ75o9QeDCCw9xYTCcxex2wnClosRC4A0g5exxj0Nhdx9JF1ScVihAiapBTEToXV
	 w9OkYJm5YKii8hDyhJYyiIj4k7Uo+0M0SM4+O1wK+V2hzOx0B4mbK3wpVWfXnPcylr
	 PFUaevfgiRY2629C9DkdhPNuiEtYKFTecqTPJ6AlnuBAng7IMQyv0/+vfJAxjPcMqv
	 FK0Cag24V8XoXdhQd+neLGzXMm/KhWU40nrg3uRKpbw1X8ZxDIsAEL3BcqQZLqgdAW
	 Y5883jWkAdWXw==
Date: Mon, 7 Oct 2024 15:14:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Zichen Xie <zichenxie0106@gmail.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rohit kumar <quic_rohkumar@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Chenyuan Yang <chenyuan0y@gmail.com>,
	Zijie Zhao <zzjas98@gmail.com>
Subject: Re: [v3?] ASoC: qcom: Fix NULL Dereference in
 asoc_qcom_lpass_cpu_platform_probe()
Message-ID: <ZwPszt6b5ZzAkskz@finisterre.sirena.org.uk>
References: <20241006205737.8829-1-zichenxie0106@gmail.com>
 <bc2f9291-c91d-4e46-bfa9-573eea6a67c2@web.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B6mD5aEE6D1/oRxA"
Content-Disposition: inline
In-Reply-To: <bc2f9291-c91d-4e46-bfa9-573eea6a67c2@web.de>
X-Cookie: Editing is a rewording activity.


--B6mD5aEE6D1/oRxA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2024 at 03:40:21PM +0200, Markus Elfring wrote:

> * How do you think about to reconsider the version numbers
>   a bit more?
>=20
> * Would you like to mention the repeated adjustment of
>   the patch subject?
>=20
> * Can a duplicate marker line be replaced by a blank line?

Feel free to ignore Markus, he has a long history of sending
unhelpful review comments and continues to ignore repeated requests
to stop.

--B6mD5aEE6D1/oRxA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcD7M4ACgkQJNaLcl1U
h9CFiAf/V5OjgX/m7bDwCQgaPh8iQoD0Z/LMA6OfjNapjpGiIjXiHTnyl4+joeRF
XZWhKsmHJQ8m2Cm/N73q98LdMxh49L4ocqv+R0V0p8wRBA0K+w409dSIKvrVMMF8
mBnNAtuqAnzZGzdXWmh8CEuRRj+D7F9bC7rFrappGop4KIJoswGPkRT5XZwAANKK
P7QW5dwgHMwi90bYR+cIF3R1mKinWnzDEJenxRyGiD1jhvW4zyoshNZ5fbsZSF1O
RfdTos0jJvJoFQ3mIe5Z8deCL9eCqW+clErOZ3gSEP5zXMuPnsKyLmhEqs7a1oS+
Oc9ykkgdRC+fn899c+ALAhcckcaLlQ==
=JWCO
-----END PGP SIGNATURE-----

--B6mD5aEE6D1/oRxA--

