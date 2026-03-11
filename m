Return-Path: <linux-arm-msm+bounces-96921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLBuGz03sWmesgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:34:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F04260A5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53EEC30BD3E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4363DA5BB;
	Wed, 11 Mar 2026 09:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="e8OKqhVt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2F53D9DBE;
	Wed, 11 Mar 2026 09:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773221006; cv=pass; b=CX2AkrJWOfRX+0PqU5erK9NSH9xBJyMenZPyCZ5GD7Tv63Zej2XE04sI00XXLME6b0zRaP4L1bi7MuVxUqG7XjxJeIoSNn1dfNPm4pHH2r32RVr5hLdqNpQOyNDY0+c4jSHkz7qgXzHOayNtRAe/POY3y1nJjX4E2GfWVgYpPZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773221006; c=relaxed/simple;
	bh=1f/XCw1UG52lvu4xPxPJPuYLgg1RwcKJ79aK6naFrMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NdQg6t8+rKkQ+Aglr3HudpdNoFmhQu6ILK/gBNsuBoUFlNSu0juk0MWAtO3wR8LGIK/rVn/KuY/3tW9le4//BZTteoQN3jQeCsDfOQoUdsbOnnOD8Lbv8igvy3S/sJ7OB6D0eCLt/SFVoPJyPn9ZAxi3sPuUmHY9KtqtsZmmgLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=e8OKqhVt; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1773220986; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BUFSRXvRgjcaPslWi9yPwyPW6Uyn+IUeMyebQfuhIiM/RMnmr8s1k805a+skY3NvoepcQyWUkOwMFR/eSBdmYstZYtTCbbmfKeAc3IaoLHnb5LoE2GORlqbIgkcX8tZ4AMgflM8E46r3edDB6u2EFpNltW2Q1pcKCVOrwl3UPys=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773220986; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KclamfVgsrRsM4JcPp3jjJgBwleGtfA9nlFgtsmcvgI=; 
	b=emTv33vF/A4q5WKf1+zuD7WQfNeWNKNfIVHA/aNnt4LMMbcGB3b9z5v8Sxuc23zoZNmNsyoy4U/569yTEvqGE4MgvaPt0FjLioasI+ZCfjDJFSe1x8kVO6NnRbms/x1snfh5yHJermMtjPXaJTXDhuT3d6+cx4oimMQ0SGA0EVE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773220986;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=KclamfVgsrRsM4JcPp3jjJgBwleGtfA9nlFgtsmcvgI=;
	b=e8OKqhVt44vTf9eNS5Vq+P1SfILq5KhcuM4b1vDcSV5rhqPT2QZz6UN5dWuzJaJ8
	KvhkpPBogu5J4ujhz8lulmC/F7Xezrq796NjEtZ1hnlPrVFTH/IferoBXPU8unGhKzc
	7+GzBU4lC4j2kmnVxsLOVlHuoOm3nWDlumwL9Wl0=
Received: by mx.zohomail.com with SMTPS id 1773220984125552.2390183702256;
	Wed, 11 Mar 2026 02:23:04 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 29CCD180598; Wed, 11 Mar 2026 10:22:40 +0100 (CET)
Date: Wed, 11 Mar 2026 10:22:40 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	John Stultz <john.stultz@linaro.org>, Moritz Fischer <moritz.fischer@ettus.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Andre Draszik <andre.draszik@linaro.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v20 03/10] power: reset: reboot-mode: Add support for
 predefined reboot modes
Message-ID: <abE0SNBE0ol_es5E@venus>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-3-cf7d346b8372@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kqcirxuikitrnrj7"
Content-Disposition: inline
In-Reply-To: <20260304-arm-psci-system_reset2-vendor-reboots-v20-3-cf7d346b8372@oss.qualcomm.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.1.1.4.3/273.195.15
X-ZohoMailClient: External
X-Rspamd-Queue-Id: 24F04260A5A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96921-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[kernel.org,arndb.de,arm.com,rock-chips.com,gmail.com,linaro.org,ettus.com,broadcom.com,oss.qualcomm.com,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sebastian.reichel@collabora.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,collabora.com:dkim,collabora.com:email,qualcomm.com:email]
X-Rspamd-Action: no action


--kqcirxuikitrnrj7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v20 03/10] power: reset: reboot-mode: Add support for
 predefined reboot modes
MIME-Version: 1.0

Hi,

On Wed, Mar 04, 2026 at 11:33:03PM +0530, Shivendra Pratap wrote:
> reboot-mode based drivers can define a reboot-mode by adding it under
> the reboot-mode node in device tree. This limits such drivers, to define
> any predefined reboot-modes statically within the driver and creates a
> dependency on device-tree.
>=20
> Introduce a list for predefined modes in the reboot-mode framework and
> process the predefined reboot-modes along with the device-tree defined
> reboot-modes. Modify existing reboot-mode based drivers to initialize
> the predefined list-head as empty.
>=20
> This patch enables a reboot mode driver to define reboot-modes through a
> predefined static list, in addition to the device-tree based reboot-modes.
>=20
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/power/reset/nvmem-reboot-mode.c  |  1 +
>  drivers/power/reset/qcom-pon.c           |  1 +
>  drivers/power/reset/reboot-mode.c        | 28 ++++++++++++++++++++++----=
--
>  drivers/power/reset/syscon-reboot-mode.c |  1 +
>  include/linux/reboot-mode.h              |  9 +++++++++
>  5 files changed, 34 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/rese=
t/nvmem-reboot-mode.c
> index bd05d660490c686b43134f82f1eadd7665403d20..83a8d80fd7d1ccb1b736aee5f=
2d675246a63b8f8 100644
> --- a/drivers/power/reset/nvmem-reboot-mode.c
> +++ b/drivers/power/reset/nvmem-reboot-mode.c
> @@ -53,6 +53,7 @@ static int nvmem_reboot_mode_probe(struct platform_devi=
ce *pdev)
> =20
>  	nvmem_rbm->reboot.dev =3D &pdev->dev;
>  	nvmem_rbm->reboot.write =3D nvmem_reboot_mode_write;
> +	INIT_LIST_HEAD(&nvmem_rbm->reboot.predefined_modes);
> =20
>  	nvmem_rbm->cell =3D devm_nvmem_cell_get(&pdev->dev, "reboot-mode");
>  	if (IS_ERR(nvmem_rbm->cell)) {
> diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-po=
n.c
> index 57b36e6186f80aff947fd7f5aae5ce280c65dc6b..9d0e3fc621a6173438c6da4cc=
e38394199451881 100644
> --- a/drivers/power/reset/qcom-pon.c
> +++ b/drivers/power/reset/qcom-pon.c
> @@ -73,6 +73,7 @@ static int qcom_pon_probe(struct platform_device *pdev)
>  		pon->reboot_mode.dev =3D &pdev->dev;
>  		pon->reason_shift =3D reason_shift;
>  		pon->reboot_mode.write =3D qcom_pon_reboot_mode_write;
> +		INIT_LIST_HEAD(&pon->reboot_mode.predefined_modes);
>  		error =3D devm_reboot_mode_register(&pdev->dev, &pon->reboot_mode);
>  		if (error) {
>  			dev_err(&pdev->dev, "can't register reboot mode\n");
> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/rebo=
ot-mode.c
> index f5ab6eab210bcd9670441a4d2a301d9efdf2f322..a0cd463cad42cc08c55a9d1cc=
11174b513995104 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
> @@ -17,12 +17,6 @@
> =20
>  #define PREFIX "mode-"
> =20
> -struct mode_info {
> -	const char *mode;
> -	u64 magic;
> -	struct list_head list;
> -};
> -
>  static u64 get_reboot_mode_magic(struct reboot_mode_driver *reboot, cons=
t char *cmd)
>  {
>  	const char *normal =3D "normal";
> @@ -73,6 +67,7 @@ static int reboot_mode_notify(struct notifier_block *th=
is,
>   */
>  int reboot_mode_register(struct reboot_mode_driver *reboot)
>  {
> +	struct mode_info *info_predef;
>  	struct mode_info *info;
>  	struct property *prop;
>  	struct device_node *np =3D reboot->dev->of_node;
> @@ -82,6 +77,9 @@ int reboot_mode_register(struct reboot_mode_driver *reb=
oot)
> =20
>  	INIT_LIST_HEAD(&reboot->head);
> =20
> +	if (!np)
> +		goto predefined_modes;
> +
>  	for_each_property_of_node(np, prop) {
>  		if (strncmp(prop->name, PREFIX, len))
>  			continue;
> @@ -115,6 +113,24 @@ int reboot_mode_register(struct reboot_mode_driver *=
reboot)
>  		list_add_tail(&info->list, &reboot->head);
>  	}
> =20
> +predefined_modes:
> +	list_for_each_entry(info_predef, &reboot->predefined_modes, list) {
> +		info =3D kzalloc_obj(*info, GFP_KERNEL);
> +		if (!info) {
> +			ret =3D -ENOMEM;
> +			goto error;
> +		}
> +
> +		info->mode =3D kstrdup_const(info_predef->mode, GFP_KERNEL);
> +		if (!info->mode) {
> +			ret =3D -ENOMEM;
> +			goto error;
> +		}
> +
> +		info->magic =3D info_predef->magic;
> +		list_add_tail(&info->list, &reboot->head);
> +	}
> +
>  	reboot->reboot_notifier.notifier_call =3D reboot_mode_notify;
>  	register_reboot_notifier(&reboot->reboot_notifier);
> =20
> diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/res=
et/syscon-reboot-mode.c
> index 9f4b18c5e46f6a8bf197773ceceb80b250f57541..0218b71541a0cefe1534e306f=
956ae51ea9ee870 100644
> --- a/drivers/power/reset/syscon-reboot-mode.c
> +++ b/drivers/power/reset/syscon-reboot-mode.c
> @@ -48,6 +48,7 @@ static int syscon_reboot_mode_probe(struct platform_dev=
ice *pdev)
>  	syscon_rbm->reboot.dev =3D &pdev->dev;
>  	syscon_rbm->reboot.write =3D syscon_reboot_mode_write;
>  	syscon_rbm->mask =3D 0xffffffff;
> +	INIT_LIST_HEAD(&syscon_rbm->reboot.predefined_modes);
> =20
>  	syscon_rbm->map =3D syscon_node_to_regmap(pdev->dev.parent->of_node);
>  	if (IS_ERR(syscon_rbm->map))
> diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
> index 2ce189fdfff4b396d7cc6f175b30016781ae4fe9..f07696f9439063a04fc180e95=
3114ea09475805c 100644
> --- a/include/linux/reboot-mode.h
> +++ b/include/linux/reboot-mode.h
> @@ -4,6 +4,7 @@
> =20
>  #include <linux/bitfield.h>
>  #include <linux/bits.h>
> +#include <linux/reboot.h>
>  #include <linux/types.h>
> =20
>  /* Construct 64-bit reboot magic: arg2 in upper 32 bits, arg1 in lower 3=
2 */
> @@ -15,9 +16,17 @@
>  /* Get 32 bit arg2 from 64 bit magic */
>  #define REBOOT_MODE_ARG2(magic) FIELD_GET(GENMASK_ULL(63, 32), magic)
> =20
> +struct mode_info {
> +	const char *mode;
> +	u64 magic;
> +	struct list_head list;
> +};
> +
>  struct reboot_mode_driver {
>  	struct device *dev;
>  	struct list_head head;
> +	/* List of predefined reboot-modes, a reboot-mode-driver may populate. =
*/
> +	struct list_head predefined_modes;
>  	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
>  	struct notifier_block reboot_notifier;
>  };
>=20
> --=20
> 2.34.1
>=20

--kqcirxuikitrnrj7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmmxNF8ACgkQ2O7X88g7
+po6dQ//VvyVxpUlRvJxooQt5NnHUCnUxPfpKKeE4H0VJyT6tvpJBQbnvmjc7Dvn
Rq96TaYGDmv4lvI3hJ8FjVZ4AaXDP1SBk03jm3Y2AHSNHwUa6HlV4effxG+y6pm8
6dJYUGpDnHr/0oVsbma+/6HWwqqRl+I+Hqdql24/Xk9YbDfiv6Rg9PLvhIAtdBIh
JKwIOrPImgP7rynKAxdrH4B/BDVHJiHz0YFrgEo+ElypXc8CcpEGeenlOdnNz4+X
EwRQDyJ2ZGBBkYTSxEFQ5kfD0x6Vt2QzhlmcaM+hRMFIU37pBGDPbQInEgAGeAwx
NwHrofFDTD/Wth0Ei7sZF9ZVnFAgEJmPSNJEgfUKUVxEW0c43t2KJTW80IgoEnFt
4vMBhpwbIvUnTqzupTYhFkWF1iX9DX68sQrSWhbBQm4aTXQPnb7rNCDYjLBborIf
dwTiX4RQdNNvYyWK7YDgNHcHRJ/1A1yYkGXRrR0lFiHhsQ6KCzh/sPD2fxXuNDCD
dveH4rxvI1p0DjwbEV9HyQEw9PlEIcG/tlsKrzPHIfF7TWEIXD2Q2pYfXYdnj43h
tSPikUF1o25lf0RrPn4MYJ68nzRtm9sW1v//I1hlkD4YOaDwFCy/BYOplHPxRiAD
uC1qdhU6NYt3ZEStST7lByU/m8Tnn3ZvqfiQfTW0DgSLgumwlVg=
=j0T7
-----END PGP SIGNATURE-----

--kqcirxuikitrnrj7--

