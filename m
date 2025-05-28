Return-Path: <linux-arm-msm+bounces-59715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA561AC6C94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 17:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8C7B4A3463
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 15:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0490B28C025;
	Wed, 28 May 2025 15:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tOJA9MQp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE05283683;
	Wed, 28 May 2025 15:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748444980; cv=none; b=td9QaBsmnghCuZPTvHoNm4Y82GiNzpRuxE/RZFKpRN7SSlHNWHpI3vMVi9SB9e8Vz8X1RUgyLJtse+VQRoaseb3Ooif/TRTV/pmIZSx1KHJufWT9Td3X6l5/j2qDxVmTJxrVcpVGxXgAQVmVKQG978FZZ5lKD/zbPAEZxC3zXRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748444980; c=relaxed/simple;
	bh=OHgErOC2T87wT7U4nv7ZvSNfiXesXTEy0off6Qrka8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fJOT98GNaH7jlNMWDlf/vwYmDBfLgr1zWlOsNrAY3qKQA2BBE8iPr1O82Lm8D9pSfrvmCczxXtJpTt94ODTochO1IqO2BveZlkjuBoKvEvbap4CshMuJ+Ewvh9GUFVg/EJoh/er287zqHsO8/LzqbcJ6qfRq83kPPWBhdm6xXlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tOJA9MQp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6690AC4CEEE;
	Wed, 28 May 2025 15:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748444980;
	bh=OHgErOC2T87wT7U4nv7ZvSNfiXesXTEy0off6Qrka8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tOJA9MQpq7xBq2cXfdjW9VQRwG92p6y13vY2KLQNsznfEGa9ElM8ioQbH8r0FNx08
	 x/h42gsneLyDLLzbfPdAeE+w+Dppj5J0aRgQlR86I5mP8n7iaFDH0a/xfIKFg4HlPR
	 AH6Udv/j5AFQG+VwBplGNanSYMLBGZWxc/8gW7IkuBUWlQs27tFue+1hJyMb5PkMpl
	 s5SNg43N8LCulam2deS+2pm6vIlErfIbbbsTSD9TIdHyCKp+gRzagVQvwGyu5EdrDX
	 jX0+7FBxetsOZnZkaOW/F9Goj47IEZO9WPBJR8YnXViN4NEmw7WkubeSDt6GuuPuy3
	 q9mmjQTpCT6QQ==
Date: Wed, 28 May 2025 16:09:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
Subject: Re: [PATCH v1 0/1] ASoC: qcom: sc8280xp: Assign backend ops for
 multi codec dai links
Message-ID: <a1b7cea8-403f-4289-a42a-541426576de7@sirena.org.uk>
References: <20250528150716.2011707-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e09OCX0shRhgRHcI"
Content-Disposition: inline
In-Reply-To: <20250528150716.2011707-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Cookie: Keep away from edge.


--e09OCX0shRhgRHcI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 08:37:15PM +0530, Mohammad Rafi Shaik wrote:
> In the existing implementation, the link->ops assignment is
> conditioned on link->no_pcm being set, which generally happens
> when a platform entry is present. However, in scenarios where
> there is no platform but multiple codecs in the DAI link,
> backend operations (link->ops) must still be assigned to ensure
> correct codec settings.

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--e09OCX0shRhgRHcI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmg3Jy4ACgkQJNaLcl1U
h9D9Mgf/TclVauXqxhIwsuHxnQMdM1OlfjFsQmbGlAwi3j4TX/26ttBQhGtBb0dr
n0VjN403LtF9imyqJ9wiXw17XD6uJiPjSRSS9CPlNgyXAww+xBxguV8D3zvtF6Fb
s0+0bnpjMEQqoGW0kW6YSoKz9IG4CfGbTDn99hXgbLSDnikgMkNxcNzA5AD9W5UP
dCtaXgBezIfmwkLAJWnla07FZ7oWzjTyGkieak2OIZI98WHzM8bKPkzjAf2JEv62
2QObWaZenZ+dYF3sjVq3B8h2D2SzQ+AfvrWPC2iTE0hA8XxSVn3nr3SCVBA5aArL
6KJ5N75Ou7keQ2i9pUqqMVowcHKQZQ==
=FFEa
-----END PGP SIGNATURE-----

--e09OCX0shRhgRHcI--

