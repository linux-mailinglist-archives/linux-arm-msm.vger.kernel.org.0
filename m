Return-Path: <linux-arm-msm+bounces-53286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D18A7CC37
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 01:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7977A174438
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Apr 2025 23:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E562A1A9B4D;
	Sat,  5 Apr 2025 23:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="eiM7hbKr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE34B13A88A;
	Sat,  5 Apr 2025 23:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743894271; cv=pass; b=LkKyFlTTtqLpZYWnr5NMfM9CL59haE9OVBiUdJ2c9JtqGQPUabyiBPo9c3A6F0sLzj2LRwZScUf/NOEfgyu+i3jqpstjG0b3KD64NQmWYfS+8azV8HUgSCbOEv5VtXbPiKuv3Iw0IJ6yJJbclPwIE9LulzT9ODvDiKSt2KKY3AE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743894271; c=relaxed/simple;
	bh=r4KRKWJ9Jh7EgS3Ff9eaTSRaConaA2itmO9tvvwJH1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R96VGRM85dvVpHJNwifQXxMntHxsy3GZflDhm3m9HvX4f5zwd90ozR+weUXfQGeeqc6P5xStQHhrGG1DvzylfZ/aKfrPhnP11yQmAaMKeV/4nar9grgOjsA1DoWabXPbwsDFVRTJQYgVUW0YpKt0m8gynSAZXuCuACbZVX9L7i0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=eiM7hbKr; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1743894244; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=T/1l6nSYmkjzcrrhFTI74xTmOePIaUVo+9aMZXhvp/em86ekNMSnEkys1Dl04Wg5HpPuiyIwtdazr8Fw3Hz4JSHyUW57kCyQXxjeBApggdXJ0kZocMpnyhA5sgpyRMr9P0x6gwNwJXsfusU89KADlFNJbOYchdG/z0iQFTGMaNs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743894244; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lyZGSnBMeeneCIwyMr0oHComy6X8X/19w17qqFQ5cVw=; 
	b=EsJ/SJaaQoh4W0h9Ylztc8Ckr0Mw865B682my/yuLQQgCQMzax9Xqr99zKPknOPQfUIjdXa1scRJrVBtwe/jFFSYyZ72ZgASIwYFjDNi79wGcKwe4iO2htknhrJbNjM/x31G/4LOVq0mtFLTVev+uxXWNsBLwNGNUuHopCK0b6g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743894244;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=lyZGSnBMeeneCIwyMr0oHComy6X8X/19w17qqFQ5cVw=;
	b=eiM7hbKr8YeqnfvfxZ0qJNFvbXiGEeDrKwbc3vU9mBZF128PH6o/eFsl2M8f2hO5
	pVfxkjZuRXNH8vEsjXh9p/50oGDezN+4eiKZ7pwIvWm4dDAxbFkEdflA+xprElEzwtn
	SnX9Ziw7QqG6PvyLWOV0DljjF0HzTsOvw8Cu7JmY=
Received: by mx.zohomail.com with SMTPS id 1743894241072346.3815949955907;
	Sat, 5 Apr 2025 16:04:01 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id D2E43182317; Sun, 06 Apr 2025 01:03:54 +0200 (CEST)
Date: Sun, 6 Apr 2025 01:03:54 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: shao.mingyin@zte.com.cn
Cc: vkoul@kernel.org, robert.marko@sartura.hr, kishon@kernel.org, 
	wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org, 
	zhang.enpei@zte.com.cn, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	luka.perkov@sartura.hr, linux-arm-msm@vger.kernel.org, heiko@sntech.de, 
	linux-rockchip@lists.infradead.org, yang.yang29@zte.com.cn, xu.xin16@zte.com.cn, 
	ye.xingchen@zte.com.cn
Subject: Re: [PATCH linux-next 5/5] phy: rockchip: =?utf-8?Q?phy-rockchip-?=
 =?utf-8?B?dHlwZWM6IFVzZcKgZGV2X2Vycl9wcm9iZSgp?=
Message-ID: <gkq5rxrawtcqsnru7jsfkrxfzubbqq3rbd6fdulmqtdjmitbwk@5jj6l5aafh7x>
References: <20250402194100610qY6KQ4JPISk-4v214Qs36@zte.com.cn>
 <20250402194542026OH8jAzuv0uq-J-D9AVPqJ@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bfw6qh3c36p7wbnt"
Content-Disposition: inline
In-Reply-To: <20250402194542026OH8jAzuv0uq-J-D9AVPqJ@zte.com.cn>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.2/243.872.34
X-ZohoMailClient: External


--bfw6qh3c36p7wbnt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH linux-next 5/5] phy: rockchip: =?utf-8?Q?phy-rockchip-?=
 =?utf-8?B?dHlwZWM6IFVzZcKgZGV2X2Vycl9wcm9iZSgp?=
MIME-Version: 1.0

Hi,

On Wed, Apr 02, 2025 at 07:45:42PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Zhang Enpei <zhang.enpei@zte.com.cn>
>=20
> Replace the open-code with dev_err_probe() to simplify the code.
>=20
> Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
>  drivers/phy/rockchip/phy-rockchip-typec.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/phy/rockchip/phy-rockchip-typec.c b/drivers/phy/rock=
chip/phy-rockchip-typec.c
> index d9701b6106d5..94d1e6ead1a7 100644
> --- a/drivers/phy/rockchip/phy-rockchip-typec.c
> +++ b/drivers/phy/rockchip/phy-rockchip-typec.c
> @@ -1151,11 +1151,9 @@ static int rockchip_typec_phy_probe(struct platfor=
m_device *pdev)
>  	if (IS_ERR(tcphy->extcon)) {
>  		if (PTR_ERR(tcphy->extcon) =3D=3D -ENODEV) {
>  			tcphy->extcon =3D NULL;
> -		} else {
> -			if (PTR_ERR(tcphy->extcon) !=3D -EPROBE_DEFER)
> -				dev_err(dev, "Invalid or missing extcon\n");
> -			return PTR_ERR(tcphy->extcon);
> -		}
> +		} else
> +			return dev_err_probe(dev, PTR_ERR(tcphy->extcon),
> +					     "Invalid or missing extcon\n");

You should also remove the { } for the normal if clause. Otherwise

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

But you might want to throw in an extra patch updating the error
message. -ENODEV is covered explicitly, so it's not "missing". I
suggest "Failed to get extcon".

Greetings,

-- Sebastian

>  	}
>=20
>  	pm_runtime_enable(dev);
> --=20
> 2.25.1
>=20

--bfw6qh3c36p7wbnt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmfxttMACgkQ2O7X88g7
+ppy+A//fWq3tj+yzqjkHN+x3+fx/l6vrY7SMi3s0Y5iNWc8KoQih+KHs5rVt5gv
+/ubWJhmdA0ArduoDnuG8Q6iqWHqKQdDmqATJG7GvMUXLGWk4WewVGT7fFgWJ8ri
0+lLkp2w4XFP2ODJYoAL0u7JXRtlBrK9hGoPAVn9qb5hlEBeFWsKKA1ymZcUJMzr
Uo9dL69VDBghYPDHfTtF0ssyNncVWkcU6NXgOVmBv89hzhVKY/5k19h0tj97QTyK
XxLwZTYGur3VACuGvu5fNj29bGq74enxRknPiGROryprdTklU5kojss0+SYQXbWU
UIrLDj/FcOceikn6N+lmntsC7Xev2yXnoIdG8g4t0ft2MMNTzyyaTiUzpXrn6P9b
3ywDYRigFeWi/ep5Mr6iMm0g8imQ398SOEn357I2Mj+XwkGZo3v3fo0G8LhfDBu9
ea9y/z04gKVr1yVvqg5blz/G7U9XugwX2K8STj7xJjZkIadq7T7Ncq8xiYji30eU
TAsXSbtxkzapGVJ6UZfnxSb+UE/lj1h21rGaQewt/jCUJz3XhrKaApKcNSb7fWcJ
9AAGcKlCjiMhak8zOTGxJwO1P80Dq8oJ6oQrqciQRdYcOMUGjb3kp1/F6TdW2pji
ifw2gZWm7FAFSVVH/jiSq9FYaoGhUrza6HITG0GEx7y1kK+yB+s=
=4gXu
-----END PGP SIGNATURE-----

--bfw6qh3c36p7wbnt--

