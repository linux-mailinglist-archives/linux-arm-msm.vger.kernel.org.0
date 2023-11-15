Return-Path: <linux-arm-msm+bounces-743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE8D7ED725
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 23:24:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2766D1F227D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Nov 2023 22:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31AD23C484;
	Wed, 15 Nov 2023 22:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="G7xDrnHd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C07531A8;
	Wed, 15 Nov 2023 14:24:32 -0800 (PST)
Received: from mercury (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3A04C660731B;
	Wed, 15 Nov 2023 22:24:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700087071;
	bh=WdfO82We6xf1GigqFgRt6NA0I8OKWnoJqDezVvwjbnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G7xDrnHdTlOLbBCoI6tMeK19bQ1k/9Nd3iqyWwOTNOq/5siEqtshuWOJ7ZBH1IQsj
	 Nf8OwmAiI1MbzsES5J6GLsyJB8vx69MDpRSNGqI3/tZFTqybanba6Jk1Pp8OEDzOKD
	 qdOSD4OLQ/ljn6IT0QpCbGGUYiIXRrWEKcsZSvOjXoDQ0mlcWIoLwfp59U/awBRhGV
	 K+XkANefsvqPyemWWzYjnK/X1NltGwwMXgVyLbPnxq8xGUm5QGBlEY3jb4nOXV1u4n
	 ag/QAemxr1/uGQ08PNi00dYhbT6s8FwlXuTit0QtJruWx9rJblhYuBLyo3uOADNf5M
	 cLpoN3b1wdALg==
Received: by mercury (Postfix, from userid 1000)
	id 7F2A61062B52; Wed, 15 Nov 2023 23:24:28 +0100 (CET)
Date: Wed, 15 Nov 2023 23:24:28 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Nikita Kiryushin <kiryushin@ancud.ru>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Pramod Gurav <pramod.gurav@smartplayin.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] power: reset: msm: Process register_restart_handler()
 error
Message-ID: <20231115222428.rhykr6e5koyzsyw6@mercury.elektranox.org>
References: <feeb1a89-59bd-4fd6-81a5-1d828f95b0f0@ancud.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6ouri3jfeknszkjz"
Content-Disposition: inline
In-Reply-To: <feeb1a89-59bd-4fd6-81a5-1d828f95b0f0@ancud.ru>


--6ouri3jfeknszkjz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 08, 2023 at 08:27:57PM +0300, Nikita Kiryushin wrote:
> If registering restart handler fails for msm-restart result is not checke=
d.
> It may be irrelevant now (as stated in comment to register_restart_handle=
r,
> the function currently always returns zero), but if the behavior changes
> in the future, an error at registration of handler will be silently skipp=
ed.
>=20
> Add return error code and print error message too debug log in case of
> non-zero result of register_restart_handler.
>=20
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>=20
> Fixes: 18a702e0de98 ("power: reset: use restart_notifier mechanism for
> msm-poweroff")
>=20
> Signed-off-by: Nikita Kiryushin <kiryushin@ancud.ru>
> ---

If register_restart_handler fails, it might actually be a good idea
to continue and at least have a poweroff handler :)

>  drivers/power/reset/msm-poweroff.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/power/reset/msm-poweroff.c
> b/drivers/power/reset/msm-poweroff.c
> index b9a401bd280b..5877a1ba2778 100644
> --- a/drivers/power/reset/msm-poweroff.c
> +++ b/drivers/power/reset/msm-poweroff.c
> @@ -35,11 +35,16 @@ static void do_msm_poweroff(void)
>   static int msm_restart_probe(struct platform_device *pdev)
>  {
> +	int ret =3D -EINVAL;

no need to initialize, it's overwritten before being used.

>  	msm_ps_hold =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(msm_ps_hold))
>  		return PTR_ERR(msm_ps_hold);
>  -	register_restart_handler(&restart_nb);
> +	ret =3D register_restart_handler(&restart_nb);
> +	if (ret) {
> +		dev_err(&pdev->dev, "unable to register restart handler, %d\n", ret);
> +		return ret;

There is dev_err_probe() for this, but as mentioned above it's more
sensible not to fail here.

-- Sebastian

> +	}
>   	pm_power_off =3D do_msm_poweroff;
>  -- 2.34.1
>=20

--6ouri3jfeknszkjz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmVVRRgACgkQ2O7X88g7
+pqI/Q//UzlIPHOkLnn8rNBgiRTj+0aHo5M12V75qJoce+s1EPhX1T7XNgtOfZCl
EYzgc+RgHOI+YpvPM/X07RO8LNubyvjdEBZJdG6LXua5dpxyi0FOhFYM0GJeHH2f
uP7UP6T0sJeNB3tv2Gy6HzouIcItS1IKJoGiGRHOuyPTR5cojCFbN/hG1TOFNRyp
gK8mSpeGNVzJtDfAfZgZ7X0gZAKj8tOSemHg397RTOMlMZhdu0aRt7Xx3zryn5SO
C2QYZjCf5SJ6EFlaoL5aifqBNejppko8rLzRukmh4itKPF7FD20paPUkE5Trr2Ka
E1IHJ2v02iDqTyMH/tc+lzoQVwq7IVtGWDBGxhtzbMN37ezncEDSL1+xgOwOPo00
3eq5pHujH0L8kYkZx5Fy9I6AyHiao3GlqC/HRtJF+QqTHMRgtjtI0cJgVVF3P2zE
vuNpRJ6gh0ekLg5TwnAG/dhM/mh8cA9B1k3CCCiDAlmWMXrYh3iMk76Hxu/MQXb7
ZVNgHA4qSbqOGxDJyivHHGLw2EEdDQj+EDtJLzzStc7MnNrH1L1/ASjbspN3gQsr
T2AB7k9p0uaOpGgZhNCRM6y0nI+ecHkxpQUd6kgggGpWdoys4S0VaeJVp6iewEZL
JGxHgV4/w4zSzNgQqQo8vPrGjVDQFWX83vj0zyD7FbtHaq0wYxg=
=sYCK
-----END PGP SIGNATURE-----

--6ouri3jfeknszkjz--

