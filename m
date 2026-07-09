Return-Path: <linux-arm-msm+bounces-118045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SnlkGPy2T2rEnAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 16:58:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C847328CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 16:58:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=CZ+uRmPk;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118045-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118045-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 69C093036BA2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 14:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F621383C64;
	Thu,  9 Jul 2026 14:55:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CD3385D8E
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 14:55:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783608910; cv=none; b=F9vk0b2FzA7gNmgbuuKSrOO6dseTud3WelQ2EhubXOgL/jKwMDvh5bOEnjgs8ERQpF1TXaE8YkPM6w+j537EIBx53a8Rp5S84WMvg8Da0zd5ALAutRE10NpB/NT2oMVF/d/tmF8Q4d9WOM1Bg3SKODiYwTMqspjHRKvSc4Gzh/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783608910; c=relaxed/simple;
	bh=g+sC/QZblXYDIcB9ooulCSeC1E+X3/Fd4MPLeB2SQsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QxZwAx40dBnboEUb2S83lNrZt1WdwFEHVHEYk+Rg+CSKY5CyYk2szhL2NH7Q0rIBc8A3mbVcD0KnR3uRAt1kRGaxf2MoEK6BzfC6Q/RkkqqseekN7V4jwRx1aSoLczGaqVAUhZp38eS574rU49vLarxevOBuQwKDQ94Yvc+mpYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CZ+uRmPk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB9F1F00A3E
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 14:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783608908;
	bh=+uWDUc/+B8Zcl3RjgjlcAl1XfyqZh6uKOMuQl+0chAo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CZ+uRmPkArgS05FkAxTN/g1EJcQSaRs8dsL+F4Uujnmu94htT9jKoNWjcxH0hGaAM
	 Sf1hkR2KF7IMxP8eTBaARyhpTX70W16qE4lh2fEvaK8Zeev/H+uKwIem1OhX8VkCf3
	 5y+DH/OYNcOfP4oCjE35LUFb429cJDyNDD3Ft/8DO2gaBcbQoSs5W89AIglHIf6Zow
	 RSSRot8AKZal/SBb2wkBogHeZxUlMMxWFutMvBimQbrR57brMo1OMEtNpCECFt4yHc
	 PjHTXkPIi/LmfnRmfM/qFc/FXReMbJtO5tmsp31okTdinZWUPTV+rk8IFNLHLvcqtl
	 o0y8R+Lfn6VGQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b01146b205so1533759e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 07:55:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqo2NgNmb8fi0xJgaYt1dd/UK4LagbjnAZK3UeEvKvn0Bvie3DcjZgXJwNN8U8ky7adm9n5g6B1aEhUZKYA@vger.kernel.org
X-Gm-Message-State: AOJu0YylOsUEI4eWqSTODKJj3kTa22k4KDn7qPnv5X5j+TpI4Ra51SeW
	O1kh896wlT6kmgRItnZBKi5yZ7T3M4dkpR5WUMrTZMqBJvaeNr/ahxf7EBfglPwlLZiLoxuAN+V
	jFeJ3ydpUv5IYY4G4L5j2ezpcWDlG11s=
X-Received: by 2002:ac2:5203:0:b0:5ae:c563:f611 with SMTP id
 2adb3069b0e04-5b011463233mr1492320e87.36.1783608906969; Thu, 09 Jul 2026
 07:55:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-0-92feb5a7b926@oss.qualcomm.com>
 <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-2-92feb5a7b926@oss.qualcomm.com>
In-Reply-To: <20260706-fix_sticky_-einval_after_pm_runtime_api_failure-v3-2-92feb5a7b926@oss.qualcomm.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 9 Jul 2026 16:54:55 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jAdUDrmqdZOofD_SOybX_riGygebZg28K1+biwCUwdoA@mail.gmail.com>
X-Gm-Features: AUfX_mxObOw8riju13AyHbeASLKZvtZGFB_mGMk6sFqZ8O5AcMDNT22UDuZo1rM
Message-ID: <CAJZ5v0jAdUDrmqdZOofD_SOybX_riGygebZg28K1+biwCUwdoA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] spi: qcom-geni: Fix missing error check on pm_runtime_get_sync()
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Dilip Kota <dkota@codeaurora.org>, 
	Stephen Boyd <swboyd@chromium.org>, Girish Mahadevan <girishm@codeaurora.org>, 
	Alok Chauhan <alokc@codeaurora.org>, bjorn.andersson@oss.qualcomm.com, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, aniket.randive@oss.qualcomm.com, 
	chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com, 
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118045-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:praveen.talari@oss.qualcomm.com,m:broonie@kernel.org,m:dkota@codeaurora.org,m:swboyd@chromium.org,m:girishm@codeaurora.org,m:alokc@codeaurora.org,m:bjorn.andersson@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:rafael@kernel.org,m:lenb@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:dakr@kernel.org,m:dianders@chromium.org,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:mukesh.savaliya@oss.qualcomm.com,m:aniket.randive@oss.qualcomm.com,m:chandana.chiluveru@oss.qualcomm.com,m:jyothi.seerapu@oss.qualcomm.com,m:linux-pm@vger.kernel.org,m:driver-core@lists.linux.dev,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER(0.00)[rafael@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7C847328CF

On Mon, Jul 6, 2026 at 10:53=E2=80=AFAM Praveen Talari
<praveen.talari@oss.qualcomm.com> wrote:
>
> spi_geni_init() calls pm_runtime_get_sync() to power up the device
> before accessing hardware registers, but never checks the return value.
> If the runtime resume fails, the function silently proceeds to read and
> write hardware registers on a device that may not be powered up, leading
> to register access faults.
>
> Fix this by replacing pm_runtime_get_sync() with the
> PM_RUNTIME_ACQUIRE_IF_ENABLED() macro and checking the result via
> PM_RUNTIME_ACQUIRE_ERR(), propagating any error back to the caller
> immediately before any hardware access occurs.
>
> Since the macro handles its own cleanup on failure, the out_pm label and
> the corresponding pm_runtime_put() call are no longer needed. Replace
> all goto out_pm paths with direct return ret statements and remove the
> label entirely.
>
> Fixes: 561de45f72bd ("spi: spi-geni-qcom: Add SPI driver support for GENI=
 based QUP")
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>

Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

(no issues found)

> ---
>  drivers/spi/spi-geni-qcom.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index 26e723cfea61..392accfd8515 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -613,25 +613,30 @@ static int spi_geni_init(struct spi_geni_master *ma=
s)
>         u32 spi_tx_cfg, fifo_disable;
>         int ret =3D -ENXIO;
>
> -       pm_runtime_get_sync(mas->dev);
> +       PM_RUNTIME_ACQUIRE_IF_ENABLED(mas->dev, pm);
> +       ret =3D PM_RUNTIME_ACQUIRE_ERR(&pm);
> +       if (ret < 0) {
> +               dev_err(mas->dev, "Failed to resume and get %d\n", ret);
> +               return ret;
> +       }
>
>         proto =3D geni_se_read_proto(se);
>
>         if (spi->target) {
>                 if (proto !=3D GENI_SE_SPI_SLAVE) {
>                         dev_err(mas->dev, "Invalid proto %d\n", proto);
> -                       goto out_pm;
> +                       return ret;
>                 }
>                 spi_slv_setup(mas);
>         } else if (proto =3D=3D GENI_SE_INVALID_PROTO) {
>                 ret =3D geni_load_se_firmware(se, GENI_SE_SPI);
>                 if (ret) {
>                         dev_err(mas->dev, "spi master firmware load faile=
d ret: %d\n", ret);
> -                       goto out_pm;
> +                       return ret;
>                 }
>         } else if (proto !=3D GENI_SE_SPI) {
>                 dev_err(mas->dev, "Invalid proto %d\n", proto);
> -               goto out_pm;
> +               return ret;
>         }
>         mas->tx_fifo_depth =3D geni_se_get_tx_fifo_depth(se);
>
> @@ -664,7 +669,7 @@ static int spi_geni_init(struct spi_geni_master *mas)
>                         dev_dbg(mas->dev, "Using GPI DMA mode for SPI\n")=
;
>                         break;
>                 } else if (ret =3D=3D -EPROBE_DEFER) {
> -                       goto out_pm;
> +                       return ret;
>                 }
>                 /*
>                  * in case of failure to get gpi dma channel, we can stil=
l do the
> @@ -693,10 +698,7 @@ static int spi_geni_init(struct spi_geni_master *mas=
)
>                 writel(spi_tx_cfg, se->base + SE_SPI_TRANS_CFG);
>         }
>
> -out_pm:
> -       pm_runtime_put(mas->dev);
>         return ret;
> -}
>
>  static unsigned int geni_byte_per_fifo_word(struct spi_geni_master *mas)
>  {
>
> --
> 2.34.1
>

