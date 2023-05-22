Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D27570C0B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 May 2023 16:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232988AbjEVOGj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 May 2023 10:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233151AbjEVOGh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 May 2023 10:06:37 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E980FA
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 May 2023 07:06:35 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id C3C5B1C0004;
        Mon, 22 May 2023 14:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1684764393;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lFksMzukjU5IJFPkhxwZUOFmyMJnkU2QvIJkyZ8hCYg=;
        b=ZpK2OZxNhunwfCcMupNhrhBfJ5GRyx7Kc/lKVn+iNnQ3WqgLx1hqyL/bwVxnaeZrQmlIAk
        rCxbfqe3hA0gUtkijbcS70/WCyr2suOyGHZ0DEbjOwbku5E+6Qhm5X8XTUepv8LPJ9ZDlp
        s1Pz4uqrin4bwJSAAYUsA/GWhMuCxC8eFjAYtbbYQn+86eyYKkpwbVOOjH4QrTC26HzrDn
        d4DXfgQivT1WIlDdt+AT93n9+2SRYZX1KZJEraVAOBw+7GjiZXgWMAyIRLavS28ZLwYZ7V
        mtS833/jmj7xp0Y69D9BOUDs8iUDGD3x8NcvXd7XTNS5SBC9iIy29/3VLPj+3g==
Date:   Mon, 22 May 2023 16:06:31 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Alexandru Gagniuc <mr.nuke.me@gmail.com>,
        Christian Marangi <ansuelsmth@gmail.com>
Subject: Re: [PATCH] mtd: parsers: qcom: deal with partitions names on
 Netgear WAX218
Message-ID: <20230522160631.3bebb92a@xps-13>
In-Reply-To: <20230417133719.16592-1-zajec5@gmail.com>
References: <20230417133719.16592-1-zajec5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rafa=C5=82,

zajec5@gmail.com wrote on Mon, 17 Apr 2023 15:37:19 +0200:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> Netgear WAX218 has two similar partitions: "rootfs" and "rootfs_1". They
> both contain device firmware (kernel + rootfs). Bootloader chooses the
> one to boot from depending on the "active_fw" variable.
>=20
> The whole mechanism is used for safe firmware upgrades.
>=20
> Sadly original bootloader on this device doesn't let know what firmware
> it has booted.
>=20
> To run system reliably we need to know which kernel has been booted and
> mount proper rootfs accordingly. This patch registers currently used
> partition using the "firmware" name.

Let me try to understand this further: you need to know what kernel has
started and use the relevant rootfs, both stored in mtd partitions, so
you always mount the "firmware" partition as rootfs by changing the
partition name dynamically at boot time. Am I understanding this
correctly?

> It isn't clear how many devices will need this so just check for a
> WAX218 compatible string for now.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> Cc: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> Cc: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/mtd/parsers/qcomsmempart.c | 92 +++++++++++++++++++++++++++---
>  1 file changed, 84 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qco=
msmempart.c
> index 4311b89d8df0..352fb153745c 100644
> --- a/drivers/mtd/parsers/qcomsmempart.c
> +++ b/drivers/mtd/parsers/qcomsmempart.c
> @@ -54,6 +54,69 @@ struct smem_flash_ptable {
>  	struct smem_flash_pentry pentry[SMEM_FLASH_PTABLE_MAX_PARTS_V4];
>  } __packed __aligned(4);
> =20
> +/**
> + * parse_qcomsmem_get_active_fw - get active firmware index
> + *
> + * Some devices have active and backup/fallback firmwares. This function=
 returns index of the active
> + * one. It's useful for registering MTD partitions using clear names.
> + */
> +static int parse_qcomsmem_get_active_fw(struct mtd_info *mtd, struct sme=
m_flash_ptable *ptable)
> +{
> +	bool found =3D false;
> +	size_t offset;
> +	size_t bytes;
> +	size_t size;
> +	char *buf;
> +	char *var;
> +	int err;
> +	int i;
> +
> +	if (!of_machine_is_compatible("netgear,wax218"))
> +		return -EOPNOTSUPP;
> +
> +	/* Find partition with environment data */
> +
> +	for (i =3D 0; i < le32_to_cpu(ptable->numparts); i++) {
> +		struct smem_flash_pentry *pentry =3D &ptable->pentry[i];
> +
> +		if (!strcmp(pentry->name, "0:APPSBLENV")) {
> +			offset =3D le32_to_cpu(pentry->offset) * mtd->erasesize;
> +			size =3D le32_to_cpu(pentry->length) * mtd->erasesize;
> +			found =3D true;
> +			break;
> +		}
> +	}
> +	if (!found)
> +		return -ENOENT;
> +
> +	/* Read it */
> +
> +	buf =3D kcalloc(1, size, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	err =3D mtd_read(mtd, offset, size, &bytes, buf);
> +	if ((err && !mtd_is_bitflip(err)) || bytes !=3D size) {
> +		pr_err("Failed to read environment\n");
> +		return -EIO;
> +	}

Why can't we access this information through an nvmem cell thanks to
the U-boot env parser?

> +
> +	/* Find & parse entry with active firmware index */
> +
> +	for (var =3D buf + 4; var < buf + size && *var; var +=3D strlen(var) + =
1) {
> +		const char *prefix =3D "active_fw=3D";
> +		unsigned long idx;
> +
> +		if (strstarts(var, prefix)) {
> +			err =3D kstrtol(var + strlen(prefix), 0, &idx);
> +
> +			return err ? err : idx;
> +		}
> +	}
> +
> +	return -ENOENT;
> +}
> +
>  static int parse_qcomsmem_part(struct mtd_info *mtd,
>  			       const struct mtd_partition **pparts,
>  			       struct mtd_part_parser_data *data)
> @@ -64,6 +127,8 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
>  	struct smem_flash_ptable *ptable;
>  	struct mtd_partition *parts;
>  	char *name, *c;
> +	int active_fw;
> +	int fw_idx;
> =20
>  	if (IS_ENABLED(CONFIG_MTD_SPI_NOR_USE_4K_SECTORS)
>  			&& mtd->type =3D=3D MTD_NORFLASH) {
> @@ -123,24 +188,35 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
>  			numparts++;
>  	}
> =20
> +	active_fw =3D parse_qcomsmem_get_active_fw(mtd, ptable);
> +
>  	parts =3D kcalloc(numparts, sizeof(*parts), GFP_KERNEL);
>  	if (!parts)
>  		return -ENOMEM;
> =20
> +	fw_idx =3D -1;
>  	for (i =3D 0, j =3D 0; i < tmpparts; i++) {
>  		pentry =3D &ptable->pentry[i];
>  		if (pentry->name[0] =3D=3D '\0')
>  			continue;
> =20
> -		name =3D kstrdup(pentry->name, GFP_KERNEL);
> -		if (!name) {
> -			ret =3D -ENOMEM;
> -			goto out_free_parts;
> -		}
> +		if (active_fw >=3D 0 && strstarts(pentry->name, "rootfs")) {
> +			name =3D kstrdup(++fw_idx =3D=3D active_fw ? "firmware" : "backup", G=
FP_KERNEL);

I'm really not a big fan of this logic.

Changing dynamically the partition name really sounds dangerous.

Does the kernel need to know? Or is it "just" the userspace? Could we
imagine another mechanism than the name to carry the information?

> +			if (!name) {
> +				ret =3D -ENOMEM;
> +				goto out_free_parts;
> +			}
> +		} else {
> +			name =3D kstrdup(pentry->name, GFP_KERNEL);
> +			if (!name) {
> +				ret =3D -ENOMEM;
> +				goto out_free_parts;
> +			}
> =20
> -		/* Convert name to lower case */
> -		for (c =3D name; *c !=3D '\0'; c++)
> -			*c =3D tolower(*c);
> +			/* Convert name to lower case */
> +			for (c =3D name; *c !=3D '\0'; c++)
> +				*c =3D tolower(*c);
> +		}
> =20
>  		parts[j].name =3D name;
>  		parts[j].offset =3D le32_to_cpu(pentry->offset) * mtd->erasesize;


Thanks,
Miqu=C3=A8l
