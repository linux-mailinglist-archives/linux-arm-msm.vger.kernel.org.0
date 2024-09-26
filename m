Return-Path: <linux-arm-msm+bounces-32547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B34E8986D87
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 09:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22BDCB219FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2024 07:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC27A188A37;
	Thu, 26 Sep 2024 07:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2HjjNSy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFA5185B55;
	Thu, 26 Sep 2024 07:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727335591; cv=none; b=WEFJGNLbooeTNxwpWg4C5C6ETgQC4paFDzH63ITVAB8kPTYO+mKrlXIcjKBP0Oq94cXp78bugcr3+JSCf/lxpmNsy/EgQylV4xADQPYHsiDwdaVczc7xhzdYAUXGnGr1F47Sbv01nnvP0OCT7FlV7xSF2aqmwxLjq/nPh/j4DXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727335591; c=relaxed/simple;
	bh=ePa5u/BcnZ/dATlftydtRiE5hN7gmuT0GTtjNoDiKEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qAFyWVqFSYWmAOn0fzviFFeu5sQK1UwAGFs7IqiX12LqPPaSOK1DV5RQFYqm2UvdheDwWQOaxy5JjO/ceaPfDeWPSEsi1nw1fxfHQBH2nPF1qKj6/2y6a5t+oEouZiZz0GVUSJXhnTH7ahgaNTb9or8fiAdu2GrhdqHxXGXl5kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2HjjNSy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8D4C4CEC5;
	Thu, 26 Sep 2024 07:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727335590;
	bh=ePa5u/BcnZ/dATlftydtRiE5hN7gmuT0GTtjNoDiKEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M2HjjNSyNaWEZ1yenHHEyui1RPMh8RJVBscCwUg+TXnkGbJouUPm2CIehBM3+Co6X
	 VedGYDOORpYZqCXP1lA+ySO90Fwuu1ocnuaf/2z42w+C0bfF8oHdF9o/oTkHsVlwdt
	 Bf9nj/u01qIShO0iWrBh8GkbROFRYw53rMgHLuBCyUdr+dM6Ch0H1hEOVk1h39MPXE
	 7xLZP3vgb0rUT9712TiCXty9H7+EMJJ4XbeTqBu35iZX4CcMVSvlhmQeFt1qvfMBRR
	 ugPSGU54cl34WqVGyPrygkOEOE89m5ePQQ98JoI1Rvhy/0rPTMoiMuolGmKpad2Y37
	 nywPery26f36Q==
Date: Thu, 26 Sep 2024 09:26:27 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com, 
	dmitry.baryshkov@linaro.org, rodrigo.vivi@intel.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs/gpu: ci: update flake tests requirements
Message-ID: <20240926-athletic-gregarious-markhor-cc78ac@houat>
References: <20240926070653.1773597-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="xmj2ly46kzbkkxma"
Content-Disposition: inline
In-Reply-To: <20240926070653.1773597-1-vignesh.raman@collabora.com>


--xmj2ly46kzbkkxma
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 12:36:49PM GMT, Vignesh Raman wrote:
> Update the documentation to require linking to a relevant GitLab
> issue for each new flake entry instead of an email report. Added
> specific GitLab issue URLs for i915, xe and other drivers.
>=20
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>=20
> v2:
> - Add gitlab issue link for msm driver.
>=20
> ---
>  Documentation/gpu/automated_testing.rst | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/=
automated_testing.rst
> index 2d5a28866afe..f918fe56f2b0 100644
> --- a/Documentation/gpu/automated_testing.rst
> +++ b/Documentation/gpu/automated_testing.rst
> @@ -67,20 +67,26 @@ Lists the tests that for a given driver on a specific=
 hardware revision are
>  known to behave unreliably. These tests won't cause a job to fail regard=
less of
>  the result. They will still be run.
> =20
> -Each new flake entry must be associated with a link to the email reporti=
ng the
> -bug to the author of the affected driver, the board name or Device Tree =
name of
> -the board, the first kernel version affected, the IGT version used for t=
ests,
> -and an approximation of the failure rate.
> +Each new flake entry must include a link to the relevant GitLab issue, t=
he board
> +name or Device Tree name, the first kernel version affected, the IGT ver=
sion used
> +for tests and an approximation of the failure rate.
> =20
>  They should be provided under the following format::
> =20
> -  # Bug Report: $LORE_OR_PATCHWORK_URL
> +  # Bug Report: $GITLAB_ISSUE
>    # Board Name: broken-board.dtb
>    # Linux Version: 6.6-rc1
>    # IGT Version: 1.28-gd2af13d9f
>    # Failure Rate: 100
>    flaky-test
> =20
> +The GitLab issue must include the logs and the pipeline link. Use the ap=
propriate
> +link below to create an issue.
> +https://gitlab.freedesktop.org/drm/i915/kernel/-/issues for i915 driver
> +https://gitlab.freedesktop.org/drm/xe/kernel/-/issues for xe driver
> +https://gitlab.freedesktop.org/drm/msm/-/issues for msm driver
> +https://gitlab.freedesktop.org/drm/misc/kernel/-/issues for other drivers
> +

I can't comment for the others, but drm-misc at least still requires
reporting issues by mail, so, no, sorry, we can't switch to gitlab only
for now.

Maxime

--xmj2ly46kzbkkxma
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZvUMowAKCRAnX84Zoj2+
dmrwAXwJooR80dwdvsWLwVqq5T8Tn9xQ8jXG5egqf3JJs5K3KqLQK01ARZoz96es
RPNQmi8BgI1h2/qRTFQd2zqn7QgKcGKOtkv4Yc4dQqncavbg/HkcoYrbjgDyP6za
D5kG4mEAOg==
=hh9h
-----END PGP SIGNATURE-----

--xmj2ly46kzbkkxma--

