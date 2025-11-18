Return-Path: <linux-arm-msm+bounces-82401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A96FC6BF02
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 00:05:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 308D44ECB06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 23:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE6C30E0D8;
	Tue, 18 Nov 2025 23:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RzeEr5Ki"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38652E36F8;
	Tue, 18 Nov 2025 23:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763507054; cv=none; b=t8r/Xq9pfSG5gLbxp4Uy0TKv9qnYoMVS8xI4hgQkd/2So53ixMJ2GJ5+FQUCQcvbiVEPCmmr+FP6nzGgoBQnQTxBqoFjqQ1CqnIyo+6LpTP8GD4q9GvZbd6j0uIb/YsHekDHND1V2EzJO2jpmlIs1Kgl9/h06YTsOVakSONKntk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763507054; c=relaxed/simple;
	bh=9dJX71UxlewCCxyh389TIHKUqdKLWJGapYCMl/OuFlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q9TLK2ypjrIHdEJZqegOaKGfKjqZpveUildRTR/CNWwPASGfsh9qe6P9biQKj67971xYM0qZxvBf2a9eXL+uw+HvuD7Xp542Z+p1T/vGdGsjaJ5+xqJchZlJuKpTcIK54IwWUngwuOF68jo9Z0/DDR6FfbViZ0L0jWOFnxFxrnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RzeEr5Ki; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3F2C2BCAF;
	Tue, 18 Nov 2025 23:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763507054;
	bh=9dJX71UxlewCCxyh389TIHKUqdKLWJGapYCMl/OuFlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RzeEr5KiNpMElHQW5MiNZtIWUcGEsRrr+FtSDsEPYbqJr+j3FWdSMueLO3nsYBtR/
	 BjVHuSUoLNmLnB9QaMfKx+HCLpU6f8y/6i7gAv8AglyWjwSgVJct59vXvn2yeRlVoV
	 gZeFQi7XMYRlyR6iqvUVa5rosSRezFR/yuxWnpvYYRWRrKQPAkGcMq2zD9MqX/DM6k
	 Po0KqdExTfXb00H3fFdoZ1DVEqJ2ilMDtK/X5nh0Z3H47sraMbTE/jzdNrHi/i/11l
	 MCKnD9KoucEg2of1u7ynTlb7WcojM5bq7JBkHX9ZGvyY8MX4qO/KlWHuaQb1eMWuoS
	 ePOkEnh32T0mw==
Date: Tue, 18 Nov 2025 23:04:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Ravi.Hothi.ravi.hothi@oss.qualcomm.com
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
	mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: Re: [PATCH v1 2/2] ASoC: qcom: q6dsp-lpass-ports: Add support for
 32-bit PCM format
Message-ID: <1c35a2ce-628c-48a6-9b04-a66ee1edd04a@sirena.org.uk>
References: <20251118100203.2751955-1-ravi.hothi@oss.qualcomm.com>
 <20251118100203.2751955-3-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7bXb8ofaBaZ78dfu"
Content-Disposition: inline
In-Reply-To: <20251118100203.2751955-3-ravi.hothi@oss.qualcomm.com>
X-Cookie: Microbiology Lab:  Staph Only!


--7bXb8ofaBaZ78dfu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 03:32:03PM +0530, Ravi.Hothi.ravi.hothi@oss.qualcom=
m.com wrote:
> From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
>=20
> Introduce support for 32-bit PCM format (SNDRV_PCM_FMTBIT_S32_LE) in
> addition to existing 16-bit and 24-bit formats. This allows handling
> high-resolution audio streams and improves audio quality for supported
> hardware.

Same thing here, this is a constraints only update.

--7bXb8ofaBaZ78dfu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkc+2IACgkQJNaLcl1U
h9B+uQf9EUzEjCXZkbwLdzaswP//HGoKAaqht20GFQTf+EbAH9AD6Ow83+pYf4dD
614dRxs0J+rdsyEA5wVR2VLB+7HrCDmcfuLB+IGO3NE2X5c1Fm+kyQ/ChuZMCDwB
JQwXYwGfbaaF3H8B6aLNLsxBqREQCPCwqkac53a9MHbfXvalZc+kX6XbI3Q66cL9
ugoT6T7VI70Esiu/bxNwnMAdO23qcsrLSYRlwM1M4A3a9pp7jdLuCoo5Cz94qZua
rOYUmbcIPywpMJjG5XzjZnzwODn+EluglVaVS50VYobEJZBShNm9eHVyBh6GyeXb
gZNmrjgpmsLDJ2OqfrXjlvLc/SdzSw==
=m5J6
-----END PGP SIGNATURE-----

--7bXb8ofaBaZ78dfu--

