Return-Path: <linux-arm-msm+bounces-96920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMheIrg2sWlqsgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:32:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E2C260930
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:32:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E1D83065ACC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 09:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D313D8133;
	Wed, 11 Mar 2026 09:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="i3j2f19v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EC93D8101;
	Wed, 11 Mar 2026 09:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773220975; cv=pass; b=IOTGuLUr4+Fs7lkfpChrYuM9A0/kGc2o/SpZPtGsVMh7eG+O8lwwEvY0TYZfvNrV4Pb35vLlSrRuoBDi2Us3TO58XLtbBWlZ7KaSt6mJc1G1L8evlAyBaoVaL7txKAQeMWVYXzh0SxEFv7e6shlxXfkAe5okZuXYCd2Ym4oIfEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773220975; c=relaxed/simple;
	bh=rcm9l3ZWqX00GvowV6E/9d/qwOGxzt0256gdTvRRUtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uJWM/zNOg9mHDS74RU4pXyrij+c4hAb8xiu9epsHiB+EfN8eINHSeQRrXUczAgoakwdR2dYtRVU37w3b0ZrzIoLJr7JFz4wgaegHqZr3al3E2/IMX/nYp0/hzu0ur9vqnD/jSgxBUC1tAPV2uNU1UvjY+ED6RhaOo1b57lzsuIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=i3j2f19v; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1773220950; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=J84KeAPXqWIQ6wKcstQcHH/lD5/7LjS3ZMBdzRdtwobDNMC7WNG3xpzKdW6bYoGe1UVhXBYXoH6jF2AY3O4v4zVL7J1d/7XzkFFAz2AhNkAcyuZ+0KwzSQWJLtpRdBswfs7LWZ2eoegFFktMukxPTLrqeaQNZa9yQa/TwjfL7W4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773220950; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zve8qYdGEu7H0FwDY7DzB4l8PRSAQis09UhzaGe5cbg=; 
	b=C6KvL7U2dMl+kGokBSmQ9/yt6fIKeWPnxbGpXnu919qG7MdirZnFm2v/KjE0xTlmXL3NK1p/khrIv0jTjSxJ/b7MNUW8J3WJorPoGSgy0NqzHsWQ2DCs1q/O/AdtuiByX+pCqga4MALsee+roJLbHMKtZ8AgvoFZ6PTM3leaNXk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773220950;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=zve8qYdGEu7H0FwDY7DzB4l8PRSAQis09UhzaGe5cbg=;
	b=i3j2f19vd5CkZ2hzl1lwpJY/iVBMPGQq9EY7He3t5Lu0ICi9o9TxhsqvGQwFrQ8q
	kCensj+vSXtHm95oFnbtttrnTnAXSHxTGyVOlNffXoVEjMaByLCS1p9NxObTJ0JAbF8
	ZLU3gFNwi0tLGStrZ0W6ARTYZZz74U5vo2uH7AN0=
Received: by mx.zohomail.com with SMTPS id 1773220947654876.7935642938618;
	Wed, 11 Mar 2026 02:22:27 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 46745180598; Wed, 11 Mar 2026 10:22:13 +0100 (CET)
Date: Wed, 11 Mar 2026 10:22:13 +0100
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
Subject: Re: [PATCH v20 02/10] power: reset: reboot-mode: Add support for 64
 bit magic
Message-ID: <abE0JbYLKuDgi78F@venus>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-2-cf7d346b8372@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="api54taleiuzpogc"
Content-Disposition: inline
In-Reply-To: <20260304-arm-psci-system_reset2-vendor-reboots-v20-2-cf7d346b8372@oss.qualcomm.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.1.0.1.4.3/273.195.15
X-ZohoMailClient: External
X-Rspamd-Queue-Id: F3E2C260930
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96920-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,collabora.com:dkim,collabora.com:email,qualcomm.com:email]
X-Rspamd-Action: no action


--api54taleiuzpogc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v20 02/10] power: reset: reboot-mode: Add support for 64
 bit magic
MIME-Version: 1.0

Hi,

On Wed, Mar 04, 2026 at 11:33:02PM +0530, Shivendra Pratap wrote:
> Current reboot-mode supports a single 32-bit argument for any
> supported mode. Some reboot-mode based drivers may require
> passing two independent 32-bit arguments during a reboot
> sequence, for uses-cases, where a mode requires an additional
> argument. Such drivers may not be able to use the reboot-mode
> driver. For example, ARM PSCI vendor-specific resets, need two
> arguments for its operation =E2=80=93 reset_type and cookie, to complete
> the reset operation. If a driver wants to implement this
> firmware-based reset, it cannot use reboot-mode framework.
>=20
> Introduce 64-bit magic values in reboot-mode driver to
> accommodate up-to two 32-bit arguments in below format.
> |    Higher 32 bit  |   Lower 32 bit    |
> |	 arg2	    | 	    arg1	|
>=20
> Update current reboot-mode drivers for 64-bit magic.
>=20
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/power/reset/nvmem-reboot-mode.c  |  8 ++++----
>  drivers/power/reset/qcom-pon.c           |  6 +++---
>  drivers/power/reset/reboot-mode.c        | 16 +++++++++-------
>  drivers/power/reset/syscon-reboot-mode.c |  6 +++---
>  include/linux/reboot-mode.h              | 15 ++++++++++++++-
>  5 files changed, 33 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/rese=
t/nvmem-reboot-mode.c
> index d260715fccf67f9f072bb56c5defbf885750650e..bd05d660490c686b43134f82f=
1eadd7665403d20 100644
> --- a/drivers/power/reset/nvmem-reboot-mode.c
> +++ b/drivers/power/reset/nvmem-reboot-mode.c
> @@ -17,10 +17,10 @@ struct nvmem_reboot_mode {
>  	struct nvmem_cell *cell;
>  };
> =20
> -static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot,
> -				    unsigned int magic)
> +static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot, u6=
4 magic)
>  {
>  	struct nvmem_reboot_mode *nvmem_rbm;
> +	u32 magic_arg1 =3D REBOOT_MODE_ARG1(magic);
>  	size_t buf_len;
>  	void *buf;
>  	int ret;
> @@ -32,10 +32,10 @@ static int nvmem_reboot_mode_write(struct reboot_mode=
_driver *reboot,
>  		return PTR_ERR(buf);
>  	kfree(buf);
> =20
> -	if (buf_len > sizeof(magic))
> +	if (buf_len > sizeof(magic_arg1))
>  		return -EINVAL;
> =20
> -	ret =3D nvmem_cell_write(nvmem_rbm->cell, &magic, buf_len);
> +	ret =3D nvmem_cell_write(nvmem_rbm->cell, &magic_arg1, buf_len);
>  	if (ret < 0)
>  		dev_err(reboot->dev, "update reboot mode bits failed\n");
> =20
> diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-po=
n.c
> index 7e108982a582e8243c5c806bd4a793646b87189f..57b36e6186f80aff947fd7f5a=
ae5ce280c65dc6b 100644
> --- a/drivers/power/reset/qcom-pon.c
> +++ b/drivers/power/reset/qcom-pon.c
> @@ -27,17 +27,17 @@ struct qcom_pon {
>  	long reason_shift;
>  };
> =20
> -static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
> -				    unsigned int magic)
> +static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,=
 u64 magic)
>  {
>  	struct qcom_pon *pon =3D container_of
>  			(reboot, struct qcom_pon, reboot_mode);
> +	u32 magic_arg1 =3D REBOOT_MODE_ARG1(magic);
>  	int ret;
> =20
>  	ret =3D regmap_update_bits(pon->regmap,
>  				 pon->baseaddr + PON_SOFT_RB_SPARE,
>  				 GENMASK(7, pon->reason_shift),
> -				 magic << pon->reason_shift);
> +				 magic_arg1 << pon->reason_shift);
>  	if (ret < 0)
>  		dev_err(pon->dev, "update reboot mode bits failed\n");
> =20
> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/rebo=
ot-mode.c
> index d033043f5250a4de152a7786ef37e88a0ace3bbb..f5ab6eab210bcd9670441a4d2=
a301d9efdf2f322 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
> @@ -19,12 +19,11 @@
> =20
>  struct mode_info {
>  	const char *mode;
> -	u32 magic;
> +	u64 magic;
>  	struct list_head list;
>  };
> =20
> -static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reb=
oot,
> -					  const char *cmd)
> +static u64 get_reboot_mode_magic(struct reboot_mode_driver *reboot, cons=
t char *cmd)
>  {
>  	const char *normal =3D "normal";
>  	struct mode_info *info;
> @@ -56,7 +55,7 @@ static int reboot_mode_notify(struct notifier_block *th=
is,
>  			      unsigned long mode, void *cmd)
>  {
>  	struct reboot_mode_driver *reboot;
> -	unsigned int magic;
> +	u64 magic;
> =20
>  	reboot =3D container_of(this, struct reboot_mode_driver, reboot_notifie=
r);
>  	magic =3D get_reboot_mode_magic(reboot, cmd);
> @@ -78,7 +77,7 @@ int reboot_mode_register(struct reboot_mode_driver *reb=
oot)
>  	struct property *prop;
>  	struct device_node *np =3D reboot->dev->of_node;
>  	size_t len =3D strlen(PREFIX);
> -	u32 magic;
> +	u32 magic[2] =3D {0};
>  	int ret;
> =20
>  	INIT_LIST_HEAD(&reboot->head);
> @@ -87,7 +86,10 @@ int reboot_mode_register(struct reboot_mode_driver *re=
boot)
>  		if (strncmp(prop->name, PREFIX, len))
>  			continue;
> =20
> -		if (device_property_read_u32(reboot->dev, prop->name, &magic)) {
> +		size_t count =3D device_property_count_u32(reboot->dev, prop->name);
> +
> +		if (!count || count > ARRAY_SIZE(magic) ||
> +		    device_property_read_u32_array(reboot->dev, prop->name, magic, cou=
nt)) {
>  			pr_debug("reboot mode %s without magic number\n", prop->name);
>  			continue;
>  		}
> @@ -98,7 +100,7 @@ int reboot_mode_register(struct reboot_mode_driver *re=
boot)
>  			goto error;
>  		}
> =20
> -		info->magic =3D magic;
> +		info->magic =3D REBOOT_MODE_MAGIC(magic[0], magic[1]);
>  		info->mode =3D kstrdup_const(prop->name + len, GFP_KERNEL);
>  		if (!info->mode) {
>  			ret =3D  -ENOMEM;
> diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/res=
et/syscon-reboot-mode.c
> index e0772c9f70f7a19cd8ec8a0b7fdbbaa7ba44afd0..9f4b18c5e46f6a8bf197773ce=
ceb80b250f57541 100644
> --- a/drivers/power/reset/syscon-reboot-mode.c
> +++ b/drivers/power/reset/syscon-reboot-mode.c
> @@ -20,16 +20,16 @@ struct syscon_reboot_mode {
>  	u32 mask;
>  };
> =20
> -static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
> -				    unsigned int magic)
> +static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot, u=
64 magic)
>  {
>  	struct syscon_reboot_mode *syscon_rbm;
> +	u32 magic_arg1 =3D REBOOT_MODE_ARG1(magic);
>  	int ret;
> =20
>  	syscon_rbm =3D container_of(reboot, struct syscon_reboot_mode, reboot);
> =20
>  	ret =3D regmap_update_bits(syscon_rbm->map, syscon_rbm->offset,
> -				 syscon_rbm->mask, magic);
> +				 syscon_rbm->mask, magic_arg1);
>  	if (ret < 0)
>  		dev_err(reboot->dev, "update reboot mode bits failed\n");
> =20
> diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
> index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..2ce189fdfff4b396d7cc6f175=
b30016781ae4fe9 100644
> --- a/include/linux/reboot-mode.h
> +++ b/include/linux/reboot-mode.h
> @@ -2,10 +2,23 @@
>  #ifndef __REBOOT_MODE_H__
>  #define __REBOOT_MODE_H__
> =20
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/types.h>
> +
> +/* Construct 64-bit reboot magic: arg2 in upper 32 bits, arg1 in lower 3=
2 */
> +#define REBOOT_MODE_MAGIC(arg1, arg2) \
> +	(FIELD_PREP(GENMASK_ULL(31, 0), (arg1)) | \
> +	 FIELD_PREP(GENMASK_ULL(63, 32), (arg2)))
> +/* Get 32 bit arg1 from 64 bit magic */
> +#define REBOOT_MODE_ARG1(magic) FIELD_GET(GENMASK_ULL(31, 0), magic)
> +/* Get 32 bit arg2 from 64 bit magic */
> +#define REBOOT_MODE_ARG2(magic) FIELD_GET(GENMASK_ULL(63, 32), magic)
> +
>  struct reboot_mode_driver {
>  	struct device *dev;
>  	struct list_head head;
> -	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
> +	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
>  	struct notifier_block reboot_notifier;
>  };
> =20
>=20
> --=20
> 2.34.1
>=20

--api54taleiuzpogc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmmxNEQACgkQ2O7X88g7
+prfqBAAk8HGCQ9TQ+X60LeCHWJJn1621fwgZKO183/fzTwoa0VvhOhLX/bzXHNF
BitAn7JgBTcLM4Ov+Q7GTG+IYI9FGv/pmxfrqnC3alM5vHL/MeiKjim2waakgIv/
PwGdHgc2bhsXEqbG1W5inTmSUDBhnFAcKOmgtQB4WmvaNhcQ4sjvWpCkyXJ9xlyq
q7e0yOY8IduO6abwTWakS++/31wq/q66vFCYw02vgm/rWoWyK1JGvridiD50FunB
s7d3pPceO3znxecSYJS7ml0r4YimW9jR6xADJerKzMW1Jvq+n5unri+1HszvrE6q
k9HIr5fCPFdzt/ZubyIFsjS6kuZ1cVOCpo7/BHzhR0Xpjl5SRTjWMXEarcnc9Mbl
oAsqOsFbLqmOQtUXkrUnLVYyV56WncYz/KBY/7E0S6vT51reNjQVBzq0yGvc3q3A
YzpvZ6mZrzr18fGLDsrh7Vyf2KBJFKxGSXVoad7XUhAaBnov0uEgBe0mOkKfjHrr
xdP0TE6Z4Jayyor9zfPoarb6PhnxrIE3SwVIfN26n1M0Dwmr4S2bFvMcjWvcKodm
y5isvHRFo8yOx241HAo0GjBYa3l/eM2n2mKz+T1pxEEzPJbRyPMGgxiLRI98rxmU
lfjZ3vhmBfDFrVKZCEBKMAl0dP1Q+gFkzL/UziYBOOVB7kGTshA=
=EEMe
-----END PGP SIGNATURE-----

--api54taleiuzpogc--

