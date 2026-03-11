Return-Path: <linux-arm-msm+bounces-96919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gG2OKZE3sWmesgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:36:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABA8260B39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 533E7311F310
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D683B2FF0;
	Wed, 11 Mar 2026 09:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="c4uyrduF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E9D3C9EF0;
	Wed, 11 Mar 2026 09:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773220948; cv=pass; b=ctsg/MYp5/WzEdKp0WxnSFBDodzNvMjuhSxZKvEC6uN4+eSk7ZQw+8ztq2r8sZPubcrHBjlIYF+UO9iXvOdc/v701NdGmQ42bm0ECi7slk7XLA6bGwL3t7YwP9/ophVAChGMCBafyche+iePqe2XdJ6SdnNWe3kdkRpoCUjYpiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773220948; c=relaxed/simple;
	bh=y2L6S6HzJgvbYUx8jMz8y37/kWuHdlMuLZuL+2csCtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KW0ceNJurCenPe2xyEz3/lOMV1C80RE7uT4ZoPy7SHKGMlNDHcITgUOrgOajPEgJ17wTNtCIGwa3jJF43+OOPiR7inbDpHrRuou3JlGXQAVkyqg6lqm5FHrqP98ffjMX2PaymOuqMZ58lDpYZObe8QsG9Enx7YlGnVx1VH6xzak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=c4uyrduF; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1773220919; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iZQ7BRC3VmrC5pOc6an3Cmw1EtRiO7GP0XmcB01js00pmeCpAi/QJJxNmj9k8V9Z3FpXTebNi4hkwv++tFlMAfy1bujUz0yqqzvHuwWE/itxMwsZPfTefIsfZiAExPLDax++O7BT89JjNaw5bzhpbNvGV3ezQwICM+lpybiR4pI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773220919; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ONvlDCAz8iTTB0H+F5+hE7m3thkqxiLj8SsuFjUaXWM=; 
	b=L41GPBHkWD9qm6xUdQmiVun6qRWVyq8iqSUckvdc6w2C/szXN/bP+gNLh3LEu8L+IAFXXEhLV5EBiIWSwPab+9q40GguR6In82XfLaJdRjGJvNrOKaOXWMz9/UEomhiIg7KRg++rUgMeDxU6Q6abqjhDWqPzcY3f5Ew0RQ0OCWU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773220919;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=ONvlDCAz8iTTB0H+F5+hE7m3thkqxiLj8SsuFjUaXWM=;
	b=c4uyrduFsHc+RwmPhxinHIQppYYy8mOgB76fl5iSvBXW2KFo03vL1n3CYiOzsl+s
	MY+Ok4JfXa+gncaZUF6x2de8S5yvTKptnKAFAL42MZD0kJlLDSfiqOTqXwDGVIcXCdT
	M96aNS6VAZgbgDfRsY1uDPp+GRHM0xhZv9FBWW9U=
Received: by mx.zohomail.com with SMTPS id 1773220916508975.5222689796449;
	Wed, 11 Mar 2026 02:21:56 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 3E2C2180598; Wed, 11 Mar 2026 10:21:39 +0100 (CET)
Date: Wed, 11 Mar 2026 10:21:39 +0100
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
Subject: Re: [PATCH v20 01/10] power: reset: reboot-mode: Remove devres based
 allocations
Message-ID: <abEzdgQ6pe0fC-5z@venus>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-1-cf7d346b8372@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ugxzc4dr53elckrk"
Content-Disposition: inline
In-Reply-To: <20260304-arm-psci-system_reset2-vendor-reboots-v20-1-cf7d346b8372@oss.qualcomm.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.1.1.4.3/273.195.15
X-ZohoMailClient: External
X-Rspamd-Queue-Id: 0ABA8260B39
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96919-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,collabora.com:dkim,collabora.com:email]
X-Rspamd-Action: no action


--ugxzc4dr53elckrk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v20 01/10] power: reset: reboot-mode: Remove devres based
 allocations
MIME-Version: 1.0

Hi,

On Wed, Mar 04, 2026 at 11:33:01PM +0530, Shivendra Pratap wrote:
> Devres APIs are intended for use in drivers, where the managed lifetime
> of resources is tied directly to the driver attach/detach cycle. In
> shared subsystem code, there is no guarantee that the subsystem
> functions will only be called after a driver has been attached, nor that
> they will not be referenced after the managed resources have been
> released during driver detach.
>=20
> To ensure correct lifetime handling, avoid using devres-based
> allocations in the reboot-mode and explicitly handle allocation and
> cleanup of resources.
>=20
> Fixes: 4fcd504edbf7 ("power: reset: add reboot mode driver")
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

The patch does not apply, though.

-- Sebastian

>  drivers/power/reset/reboot-mode.c | 33 ++++++++++++++++++++-------------
>  1 file changed, 20 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/rebo=
ot-mode.c
> index fba53f638da04655e756b5f8b7d2d666d1379535..d033043f5250a4de152a7786e=
f37e88a0ace3bbb 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
> @@ -3,13 +3,17 @@
>   * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
>   */
> =20
> +#define pr_fmt(fmt)	"reboot-mode: " fmt
> +
>  #include <linux/device.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/property.h>
>  #include <linux/reboot.h>
>  #include <linux/reboot-mode.h>
> +#include <linux/slab.h>
> =20
>  #define PREFIX "mode-"
> =20
> @@ -74,6 +78,7 @@ int reboot_mode_register(struct reboot_mode_driver *reb=
oot)
>  	struct property *prop;
>  	struct device_node *np =3D reboot->dev->of_node;
>  	size_t len =3D strlen(PREFIX);
> +	u32 magic;
>  	int ret;
> =20
>  	INIT_LIST_HEAD(&reboot->head);
> @@ -82,19 +87,18 @@ int reboot_mode_register(struct reboot_mode_driver *r=
eboot)
>  		if (strncmp(prop->name, PREFIX, len))
>  			continue;
> =20
> -		info =3D devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
> +		if (device_property_read_u32(reboot->dev, prop->name, &magic)) {
> +			pr_debug("reboot mode %s without magic number\n", prop->name);
> +			continue;
> +		}
> +
> +		info =3D kzalloc(sizeof(*info), GFP_KERNEL);
>  		if (!info) {
>  			ret =3D -ENOMEM;
>  			goto error;
>  		}
> =20
> -		if (of_property_read_u32(np, prop->name, &info->magic)) {
> -			dev_err(reboot->dev, "reboot mode %s without magic number\n",
> -				info->mode);
> -			devm_kfree(reboot->dev, info);
> -			continue;
> -		}
> -
> +		info->magic =3D magic;
>  		info->mode =3D kstrdup_const(prop->name + len, GFP_KERNEL);
>  		if (!info->mode) {
>  			ret =3D  -ENOMEM;
> @@ -102,8 +106,7 @@ int reboot_mode_register(struct reboot_mode_driver *r=
eboot)
>  		} else if (info->mode[0] =3D=3D '\0') {
>  			kfree_const(info->mode);
>  			ret =3D -EINVAL;
> -			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
> -				prop->name);
> +			pr_err("invalid mode name(%s): too short!\n", prop->name);
>  			goto error;
>  		}
> =20
> @@ -116,8 +119,8 @@ int reboot_mode_register(struct reboot_mode_driver *r=
eboot)
>  	return 0;
> =20
>  error:
> -	list_for_each_entry(info, &reboot->head, list)
> -		kfree_const(info->mode);
> +	kfree(info);
> +	reboot_mode_unregister(reboot);
> =20
>  	return ret;
>  }
> @@ -130,11 +133,15 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
>  int reboot_mode_unregister(struct reboot_mode_driver *reboot)
>  {
>  	struct mode_info *info;
> +	struct mode_info *next;
> =20
>  	unregister_reboot_notifier(&reboot->reboot_notifier);
> =20
> -	list_for_each_entry(info, &reboot->head, list)
> +	list_for_each_entry_safe(info, next, &reboot->head, list) {
> +		list_del(&info->list);
>  		kfree_const(info->mode);
> +		kfree(info);
> +	}
> =20
>  	return 0;
>  }
>=20
> --=20
> 2.34.1
>=20

--ugxzc4dr53elckrk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmmxNB8ACgkQ2O7X88g7
+pp88BAAmGk4Xg3kRYPFFEZhWyBR8jjNEGWm8pYmX311V82br2YqFPYSRXMAGFA7
0uJ3/oW+oCo3mTnxxfusITm/PqkAUzMRdeLEhvvKeOfrOvUNcoP0khPceaS3pxof
qJSavQ1HPk4olXNzSEq2wBwxXWqhP8w7LB899uxp0Kv3Bazz2mn+T/R7rlaqsUP6
YiOQzVEueTfosq79eI2SPZwwW0s6xGprqzY0QCZSFMPy3Njfo4B5Uc1TH2df4knq
Snuid3lAD7iHsn3zNHGvPMlX7nKWGosLXVQQ+jPYRDki02YXCD13H15DGjyPQVuT
U1fQlRvX4GYSGTWdNdwy86PvcBNwkD1i6XcgQoYonPEHqst779sdqQXMQlp6ruo3
Zo2BGUw7lqM2N+pC6fyWnohTahnOincvoiNEYvSn9MdIPmS9dTwCj93gsu1jRAdX
UOzZmWYNPXtMntquOa6rpjjat50heDtUslXYa4U3xtKF9vW3NIw5ZIoHJGmBPHhJ
K3Q7M5MVA9ocguW9La3yGMyPTOEpvTBPGZFRUzAQA94Ph+/wznne2paQQvnkoAia
4w7DNEz0vJkSj3ZhXYKtQWLPoBZhPkTVUqRvDCqXcktgUj/tc8Fh011Jk40LFJr5
y2UPW23Ts9tduHIqaT0+PAm8iPplNGRhj8wTMdhQNQzWQjZXPnM=
=H9sF
-----END PGP SIGNATURE-----

--ugxzc4dr53elckrk--

