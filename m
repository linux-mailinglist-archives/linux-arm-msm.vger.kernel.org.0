Return-Path: <linux-arm-msm+bounces-33376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E42992DA8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 15:47:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DACE1F2248B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 13:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512E31D417C;
	Mon,  7 Oct 2024 13:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WcKkyqix"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAD31662E4;
	Mon,  7 Oct 2024 13:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728308834; cv=none; b=oAm+vNn+KCnlmMEJryYAsJsdN5uZN7JRhy82iPEbqCDh4U9GYXJKeAtRQnPdGGGaDvN7jAWm/Sdp6ok0FabAPe/Isu36GRsYhHisoZp1mjjZBFzDHOJska+ONH10OyesN1TjG8cblWwsahFbAiyPIrV1c+/5Qaxekb5CNvE4P48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728308834; c=relaxed/simple;
	bh=yGFj/O5rnD5FErbWRKXzgdC/zozHjxSeh3qRyTdrHpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M1UwSC4rwY0eVVFPhkvJUY43eb3pZbvZ9wLfaFxD/MWdzA31eL95U6KI5QKokBJSGpSXAMD5mipBONqTI16gfwIPDObxy7oh35CAMRNlmIlFwOo4JrwqI6QE1IEZdhC9hv70HZ0trCofQR9Lti79GdbT8+jUuUIqwwZ6TB133uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WcKkyqix; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ED8AC4CEC6;
	Mon,  7 Oct 2024 13:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728308833;
	bh=yGFj/O5rnD5FErbWRKXzgdC/zozHjxSeh3qRyTdrHpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WcKkyqixZ6z9FTdcHN0rpj+oqcJa7DojRBwBguzjszsRUG+BXIOpEGXGGNAOtJiXP
	 eB/BJCu4bYYJ8InH9iZhMLfqq3EwZOds2+Lt2AinjfSok9aZZqxkn3YikXtMXCvI6n
	 EUn58tucHkdlPrnyJiX8s+GcOW1Tb4u1SdAKfcNBascNXYT3xTfbNetfsILRPFPFBt
	 i4iHr0s+DqqBVrliP8zvzEfQ4gBf5bJxDef72m4EAfLspRqHSBHViTsM9zFR+q+wYi
	 Ru+3HFHNa2wmjyc9PU7tMYWisHGw6nPds3whgWsEFNv8Iyw+h7Tx9Q8SYHPemURAyb
	 52KrkkclVeHwQ==
Date: Mon, 7 Oct 2024 14:47:09 +0100
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
Subject: Re: [PATCH v3] ASoC: qcom: Fix NULL Dereference in
 asoc_qcom_lpass_cpu_platform_probe()
Message-ID: <ZwPmXVzXphEtvvhx@finisterre.sirena.org.uk>
References: <20241006205737.8829-1-zichenxie0106@gmail.com>
 <9be6b874-0c4d-4100-887f-0aa693985715@web.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9JgK+5okZLJh/tVY"
Content-Disposition: inline
In-Reply-To: <9be6b874-0c4d-4100-887f-0aa693985715@web.de>
X-Cookie: Editing is a rewording activity.


--9JgK+5okZLJh/tVY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2024 at 03:16:27PM +0200, Markus Elfring wrote:
> > A devm_kzalloc() in asoc_qcom_lpass_cpu_platform_probe() could
>=20
>                    call?
>=20
>=20
> > possibly return NULL pointer. NULL Pointer Dereference may be
>=20
> Can the term =E2=80=9Cnull pointer dereference=E2=80=9D be applied for
> the final commit message (including the summary phrase)?
>=20
>=20
> > triggerred without addtional check.
>=20
>   triggered?         additional?

Feel free to ignore Markus, he has a long history of sending
unhelpful review comments and continues to ignore repeated requests
to stop.

--9JgK+5okZLJh/tVY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcD5l0ACgkQJNaLcl1U
h9Bz3wf/Qjsm7YymNTSgU04NIuFJv7cm/idFHsogeWTEMXMQi8XF6YHHZnh5nqgT
S9nuoLxNBpHddndwDTkmZjPEn/uptCpBeMHJRYa3L2Xc4C605FUBt1uy2kM3LmRX
konGCd7t9CHNYWWErxvnOhPPgfIKInfEQHhBWl35R/zZRHWHLlN4DLb+SYCdx5JC
ELx7rjvdBW0o5zUfhUi38aW1m/Lj+CI8/3bBKjTy3HZFx05qpLL0n9X/J8UGBhYS
ZnNspHpLAo/qmNQBpB5HHYnNCG8YBnVgZvV48NHZJrvMJZ7T8oTOEhzArNcB/8Ou
srH8XkXcQcrwKLOj9NYITJdOtwxQ0Q==
=h7hN
-----END PGP SIGNATURE-----

--9JgK+5okZLJh/tVY--

