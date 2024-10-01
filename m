Return-Path: <linux-arm-msm+bounces-32881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 820CE98BCEF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 14:58:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9F7A1C23709
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 12:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D321C32F7;
	Tue,  1 Oct 2024 12:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q3jqfhjh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EFF1C2458;
	Tue,  1 Oct 2024 12:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727787487; cv=none; b=gq1QY0Vhdrby4wESmxEVZmgtCKyzK0bCz//jbMNsnDIlS5/sFgnY1sLdbKwngWhTDggaCCnwtfOAMLxzDF7gK5UsoDyS2zq3UQ7rNjwiqA6qeb5owe/Fw9W1PddQ/HqQpGGFNm8N7hxb26hNKtMCeEg1Q6YJxlvNLiuLCkZFs2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727787487; c=relaxed/simple;
	bh=QyEZfHdMYJ+lGcIcvHz3IB8FoqlRl1lML5exUpqUBTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CmFTtRGp9ZJ0sYAZRGiA/3M1H/uCIj5JYJYjHZAMqxJq36B356dkxHrJKa19jIs+TkrO356Tm98+0JBRiaorzP8x8KKd+r5TBWDZg4uN8oxnxMrxI9alEWOB9llSSr5xGveip/BC8Uhus2cVc3p3z2WHq+ZybAuXNmE19kU26jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q3jqfhjh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B902C4CEC6;
	Tue,  1 Oct 2024 12:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727787486;
	bh=QyEZfHdMYJ+lGcIcvHz3IB8FoqlRl1lML5exUpqUBTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q3jqfhjhJyToS+rPzZEqV2DJHGWKizZqhHmzKQuND2eWzdqfwlCiEcnOC/smQGWQf
	 xCxKLd07nggWaurz38kUUdZHDyk3A+M6jVagcA7hvkUJP9J11iCirRhkYcfXGA9+l8
	 b4qdhP3wrEyBCFp446b+WBxr5UkZz1Vs133zl+CP/a0XXg8HtjBjNbXXUX3RnEk1zz
	 TFTurWbtXnpmAk76Gp9i1lt+djTnXrwIx0vqUDsIEWXyIAnYHhC6P0RbVEhgjUcRez
	 IBIYsagFf3KlFaijPENMZcVHYQ74vQWpHD14jes0b4HWXzd43+9F6Q+Zn+CfU3vpVo
	 cSQKhfHvoeEuQ==
Date: Tue, 1 Oct 2024 13:58:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Chenyuan Yang <chenyuan0y@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rohit kumar <quic_rohkumar@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Takashi Iwai <tiwai@suse.com>, Zichen Xie <zichenxie0106@gmail.com>,
	Zijie Zhao <zzjas98@gmail.com>
Subject: Re: [PATCH] Fix possible NULL Pointer Dereference in
 'asoc_qcom_lpass_cpu_platform_probe'
Message-ID: <1b8a5949-2501-4501-b722-137fcf122cf6@sirena.org.uk>
References: <Zvrb+q28S/C4z2eH@hu-bjorande-lv.qualcomm.com>
 <cf8e2da5-818d-4783-a3c4-bb6aa62088f2@web.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/cGtRaFPuIMQKWOf"
Content-Disposition: inline
In-Reply-To: <cf8e2da5-818d-4783-a3c4-bb6aa62088f2@web.de>
X-Cookie: Even a hawk is an eagle among crows.


--/cGtRaFPuIMQKWOf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 01, 2024 at 02:48:54PM +0200, Markus Elfring wrote:

> > Your description and patch looks good to me.

> Interesting =E2=80=9Cview=E2=80=9D =E2=80=A6

Feel free to ignore Markus, he has a long history of sending
unhelpful review comments and continues to ignore repeated requests
to stop.

--/cGtRaFPuIMQKWOf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmb78dgACgkQJNaLcl1U
h9Ae2gf/SjdwIbpI6k7ZUnbe4dgp9xn/Piq0S4chNNyqq3t0wy+zWAyUwLRjL5Y5
+nWCk3X0qImHgisbz6Z0m+4CA3a5voxCYUVtHCMFVljfydvNve5AzxDFQsYhDWub
nBgHEqiceARe+qyhYooXEnrgeAC0LWU8J+7tXt/ylrIgo14rlGZQSiEw36DeynCG
tOpBI7eXSjfTJFwn3Q3+o7tA05cI1A2JP5IOcjp2KD6rXqSBg5DzhnZPwH6VGz9w
gQvhnVBft5ZIXqy+GZPy7dJqnKINZxivNGgnxnV7D7/812hBNDMriEvMQHJtLpe+
9MqYln6QlWgAyy7xethxx5A46RPpYg==
=kNGb
-----END PGP SIGNATURE-----

--/cGtRaFPuIMQKWOf--

