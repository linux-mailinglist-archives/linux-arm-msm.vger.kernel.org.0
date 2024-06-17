Return-Path: <linux-arm-msm+bounces-22848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CF690AD64
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 13:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC2C7283A38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 11:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1CC194C67;
	Mon, 17 Jun 2024 11:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r61JJ5HR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C919194AE1;
	Mon, 17 Jun 2024 11:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718625308; cv=none; b=lAGvO+Gh9ZvGWrpM+7bTnm+3puRVlh7jS5CF9gjt/UuXxdubwTZLgS/BTWa1C+c/RZ7APPG1LSVcDk0mfcHq60ymAp6WC8zIQb9sD9AkQwhM+kMdjXk0ZeJAwFLgoqL7p+q40bSqi3n3DGeslvLgPfbFQJLO4mgPCwPQwRWe4vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718625308; c=relaxed/simple;
	bh=jUYkLcHNVMGAKmmAya+2zPkcEa9Bqe1QYQq6BZcZcHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNOG++tFL2j01S2QfIADUW2miQBMG3M4t/BO31HBzBh3ea82M/vYNHdUJDbELYfHSaL/SWjr0pWwrQlUTD4bjBkBkI7HsmLoz7rsH5gaOx8D98S/OVEjNlKrL+Ll7DNQltVGbzha/CfPTXc3muMXIKwNgIFP+beyBRFvb8t/Y/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r61JJ5HR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99B76C2BD10;
	Mon, 17 Jun 2024 11:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718625307;
	bh=jUYkLcHNVMGAKmmAya+2zPkcEa9Bqe1QYQq6BZcZcHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r61JJ5HRwAWeK+V5dXT3Trn5Ly+Ls5Xb2ENHZz6MPzH+S6jxyaoH1ZkkSeePRuVA5
	 62dkADdkS+wL+exFW3KOPtePLeuFMDarSUcdHg0Bh4Q3feTFJfMT9UZvNuiMQDUkjL
	 Qg1qKTXBKUY/+vBEq6JNrqkianvWPn6D1L7ekEWbN9vRQW6cGu8PmNuGAPPZG4wa7B
	 E71jkxkXIpefUJhncHzRGZW2E0eJfi9SvIjxf/WRtFS/RbDEloIJKrVOZJU6bAcTS/
	 k4ikJSYxgo119Nr6vIHuPELJkgyTENDfUBy39P1LE4fhb9yrSkWaQW8oVZaD3tZEXu
	 F6+sX7+nS8bsg==
Date: Mon, 17 Jun 2024 12:54:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Banajit Goswami <bgoswami@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Takashi Iwai <tiwai@suse.com>, LKML <linux-kernel@vger.kernel.org>,
	Rohit kumar <quic_rohkumar@quicinc.com>
Subject: Re: [PATCH v6 3/7] ASoC: codecs: wcd937x: add wcd937x codec driver
Message-ID: <a6d17f27-51f4-47a5-8798-37bcdf3b103d@sirena.org.uk>
References: <20240611074557.604250-4-quic_mohs@quicinc.com>
 <6e1dd5d1-8c5d-44f5-99e8-f42cfbdeee04@web.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8N8IFlNCqkTciz3E"
Content-Disposition: inline
In-Reply-To: <6e1dd5d1-8c5d-44f5-99e8-f42cfbdeee04@web.de>
X-Cookie: Life is the urge to ecstasy.


--8N8IFlNCqkTciz3E
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 16, 2024 at 06:38:58PM +0200, Markus Elfring wrote:
> > This patch adds basic SoundWire codec driver to support for
> > WCD9370/WCD9375 TX and RX devices.
> =E2=80=A6
>=20
> Please improve such a change description with an imperative wording.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?h=3Dv6.10-rc3#n94

Feel free to ignore Markus, he has a long history of sending
unhelpful review comments and continues to ignore repeated requests
to stop.

--8N8IFlNCqkTciz3E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZwJBAACgkQJNaLcl1U
h9BPYAf/Te6gQtKt94WX0v+W7HqLZ1BnLN1dLZG0bLUDwYe4sJh/EFbwzvyHXx9b
KO0bBawxSl2HfrCGJ9JyfXGAuJJNkrSWhEqprY0JyUQgsLb0xuanc0eK2USUhb3V
WtK56o6Yt449MKzhg7GDg1yYCIiMBU6pJKJbE+eN8TEP0zw6M/9gVHsdVxBzHUXr
dzKJvbaNFklSSh0EuZGEWgSRR+U7oDB7D8PkDlVj6V0IROnqcl+aW4KcdH91xgxx
rPKiSkei4Kk394a8b+x2iVUfDHDjPg9pMT6aKfWQj0ejf1Vq9aSIf4QDGCq/z7M7
ZCgh0SEis37Y3kTSnUZqAaxngSlzog==
=8S2L
-----END PGP SIGNATURE-----

--8N8IFlNCqkTciz3E--

