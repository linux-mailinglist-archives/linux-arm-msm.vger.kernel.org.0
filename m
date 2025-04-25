Return-Path: <linux-arm-msm+bounces-55729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBB2A9D10E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 21:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE8EE4A65D0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA3D21B9DE;
	Fri, 25 Apr 2025 19:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SelheP8/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783AE21B91F;
	Fri, 25 Apr 2025 19:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607808; cv=none; b=YxnEM3d7nXDTm51lEXLi51R8q6taDmXrTLnjbCnDHqRBVHyYDtajkZe03kkeVs9eRRcaXw2wyCZKXUYzxPXyEF51tTRvX3ZJ8Lj0Hqikm2zCfhKE/ezOOPNmxkxfDZWlhWBzCgdf+NpLHmlUQ+RKiIH4joN9ah6NxDjbYYidqow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607808; c=relaxed/simple;
	bh=MY9lGU6UW7A3yaGgz6d9uNop83Ncmq+EgFk2hJKzN2s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rr+sNYfeM/KefmGwyL6qQdrzc+JeDroyF2StK43barZSG6UFqvDjy5HCmQltkY4m2PxakfD6Jke5WD4/wt7AjULKdk6R6RsB1fX6MUCULEgFjeB2/3UZJ7jtC+mClPOxc1mWLhyuW3M5zPYcfCH0NwWzVd8Lz/7wKUfm6IDFplg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SelheP8/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12711C4CEEE;
	Fri, 25 Apr 2025 19:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745607808;
	bh=MY9lGU6UW7A3yaGgz6d9uNop83Ncmq+EgFk2hJKzN2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SelheP8/JRouf/tjDNHDiz7WPeBAuLUAOtNwlCZSJRD2R4TTpOgcCE2VNiLtzcWIC
	 dLZaKAOYg5x9wGqZmTQ1I30zTtjs+TR0N+kiYcFNM79zZ+ym5X+L6BkhSSSeu1SiLq
	 wg5k2Pzqc5nm5wKY9op0yOt5cr/z0SQMgMxy1klk21x+G4dPZ5dyJiC8lYz7dE8MXo
	 oI+iOf0RDHlKJ7XrrAzTTUIuBaKJjbH04ReX6IBD271nJcSqXB+So1bXo5dKtpLL2s
	 N0bYVz7fLqCxsLGkhpZf3tTZMVS1LmzCuEj8gketHNj3hZXCdQa5h7W8uJ/+gp5uMs
	 iGRO1M2PPkcjA==
Date: Fri, 25 Apr 2025 20:03:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/5] ASoC: qcom: sm8250: set card driver name from
 match data
Message-ID: <ccca5e19-5a4e-423b-923e-ea0de6682752@sirena.org.uk>
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
 <20250425-fp5-dp-sound-v3-2-7cb45180091b@fairphone.com>
 <36904d64-68e1-43b2-baed-50b5fddc2bcb@sirena.org.uk>
 <D9FXE4TJ23QB.1CS3D6PU2FGMR@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ypjTda1ZXp/fVkU2"
Content-Disposition: inline
In-Reply-To: <D9FXE4TJ23QB.1CS3D6PU2FGMR@fairphone.com>
X-Cookie: Debug is human, de-fix divine.


--ypjTda1ZXp/fVkU2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 25, 2025 at 08:19:39PM +0200, Luca Weiss wrote:

> I've based this series on next-20250417 tag, so this is probably due to
> the changes from the USB sound offloading series that Greg has picked
> up.

> So either Greg also picks up these changes when they're ready, or we
> wait until 6.17?

Or base it on my tree and let things get sorted in the merge, I don't
know what the conflicts might be?

--ypjTda1ZXp/fVkU2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgL3HgACgkQJNaLcl1U
h9B44wf/aC4Gzx3WW/vICUjRUiOhliwCd2nNLfii4WeQ3WcJ++YWnD+UoiVrrORW
HwsZ9PUWLVtu/wpyuh/fk+AC5MIKpIIa+j16CHpurxt15Grzav9/gdikq03YA9xb
XsGLq1x8xfljPHUaktuUXfw4X7qeZSLLbXxmy413fdQAD+3oiYpXVD0R+6WdRVSI
bdtCnO13aCg7A4rigrlb90kJDf4NxwvhCVJn3tuviCTXExiKRs6UgfGIfk0GGUJi
3F7EkP+lDsxnWyou8THgch6ZHklZqLbWnSo3L1fhVT40a5PdWcWNA16/hkTCPc+Y
O1qTsdqX99Rb9JFqHMwIRYcHxwa/UA==
=EIbc
-----END PGP SIGNATURE-----

--ypjTda1ZXp/fVkU2--

