Return-Path: <linux-arm-msm+bounces-98041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KM8BAuuYuGmsgQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 00:57:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 618432A21E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 00:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FCFF3045225
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 23:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071B23783BB;
	Mon, 16 Mar 2026 23:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bulxpirw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AA732B989;
	Mon, 16 Mar 2026 23:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773705417; cv=none; b=TwvNaMESOJ3fEBkucMEyCrGmyN3oRciZAdh2+e55mAhPT7SH9yoNjNfXTZc1G484GvLTuBlyaAdxA8WFJCUYxP2x67uI70Uf8At9EftPFVbG+atULfulEqeiMsigK5VLlW6GCCaH59FIgODgNcSj0xISs6gb7W+zt7Pb1vkWtTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773705417; c=relaxed/simple;
	bh=aBVSLPCBbP60rhVv5ksFK1Kh9ObDpoNnsj1rgiOLFWs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=m/SdG6J1KaQIeAWap9sIA5S5I33s7ob1F9b6EYffpC8TpR0fzcxEww0iFlOgSkS67S+lm6ODEvSXctJiSKsW1PoQynYsDxWSLk+90856+SfVL+80Ik1AYYixRUn8lgmL89qkD2twfqi1cLQVPrcc/l17z/Ofqh64mN5eF/WaWSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bulxpirw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D6C9C19421;
	Mon, 16 Mar 2026 23:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773705417;
	bh=aBVSLPCBbP60rhVv5ksFK1Kh9ObDpoNnsj1rgiOLFWs=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=bulxpirw9VyaOzQWWwrJxzZ3IWjFxgNtERN05KF3F6lULec4Wd0PrM+oRAJK4y85b
	 i4WpYh3nRd0fnlbjWGoTrdSXg3pcJsLlLBtxj39/YohKPGvXREMZpEQvYo1eeh8hyl
	 VRDxJxBXnL+qU7lBLe+FGreRxemuoHjm/1qQQvSqAjEXgaigZRFjqWS0oolb3M8n86
	 aaYWwOqkLKoMbg4nm6q/pF3tRX4gs4gmfbIte71xWfSeJUqAaBauxQF3ucnmpzP7nx
	 Jjb1U5kqrz4+hj3XfKACoE+KHuD/iFi8N8GLJMeeeiXSuIHXrYelelV+ZPuYN8nBq7
	 pATFfxjOfNpCg==
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 00:56:52 +0100
Message-Id: <DH4M3DJ4P58T.1BGVAVXN71Z09@kernel.org>
Subject: Re: [PATCH v2 4/4] driver core: platform: use generic
 driver_override infrastructure
Cc: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-hwmon@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-sh@vger.kernel.org>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <hanguidong02@gmail.com>, <ysato@users.sourceforge.jp>, <dalias@libc.org>,
 <glaubitz@physik.fu-berlin.de>, <abelvesa@kernel.org>, <srini@kernel.org>,
 <s.nawrocki@samsung.com>, <nuno.sa@analog.com>, <brgl@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260303115720.48783-1-dakr@kernel.org>
 <20260303115720.48783-5-dakr@kernel.org>
In-Reply-To: <20260303115720.48783-5-dakr@kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98041-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,gmail.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de,samsung.com,analog.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 618432A21E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

(Cc: Bartosz)

On Tue Mar 3, 2026 at 12:53 PM CET, Danilo Krummrich wrote:
> diff --git a/arch/sh/drivers/platform_early.c b/arch/sh/drivers/platform_=
early.c
> index 143747c45206..3cd17bb0be67 100644
> --- a/arch/sh/drivers/platform_early.c
> +++ b/arch/sh/drivers/platform_early.c
> @@ -25,10 +25,12 @@ static int platform_match(struct device *dev, struct =
device_driver *drv)
>  {
>  	struct platform_device *pdev =3D to_platform_device(dev);
>  	struct platform_driver *pdrv =3D to_platform_driver(drv);
> +	int ret;
> =20
>  	/* When driver_override is set, only bind to the matching driver */
> -	if (pdev->driver_override)
> -		return !strcmp(pdev->driver_override, drv->name);
> +	ret =3D device_match_driver_override(dev, drv);
> +	if (ret >=3D 0)
> +		return ret;
> =20
>  	/* Then try to match against the id table */
>  	if (pdrv->id_table)

I was just about to pick up this series, but then noticed that checking for
driver_override in the platform_early case doesn't make sense in the first =
place
and was accidentally added when the platform_match() callback was copied ov=
er in
commit 507fd01d5333 ("drivers: move the early platform device support to
arch/sh").

Thus, I'm going to drop this hunk and add in the following patch; please le=
t me
know if there are any concerns.

commit 39cae4095efda4b00b436c0fc46f21de84128969
Author: Danilo Krummrich <dakr@kernel.org>
Date:   Tue Mar 17 00:37:15 2026 +0100

    sh: platform_early: remove pdev->driver_override check

    In commit 507fd01d5333 ("drivers: move the early platform device suppor=
t to
    arch/sh") platform_match() was copied over to the sh platform_early
    code, accidentally including the driver_override check.

    This check does not make sense for platform_early, as sysfs is not even
    available in first place at this point in the boot process, hence remov=
e
    the check.

    Fixes: 507fd01d5333 ("drivers: move the early platform device support t=
o arch/sh")
    Signed-off-by: Danilo Krummrich <dakr@kernel.org>

diff --git a/arch/sh/drivers/platform_early.c b/arch/sh/drivers/platform_ea=
rly.c
index 143747c45206..48ddbc547bd9 100644
--- a/arch/sh/drivers/platform_early.c
+++ b/arch/sh/drivers/platform_early.c
@@ -26,10 +26,6 @@ static int platform_match(struct device *dev, struct dev=
ice_driver *drv)
        struct platform_device *pdev =3D to_platform_device(dev);
        struct platform_driver *pdrv =3D to_platform_driver(drv);

-       /* When driver_override is set, only bind to the matching driver */
-       if (pdev->driver_override)
-               return !strcmp(pdev->driver_override, drv->name);
-
        /* Then try to match against the id table */
        if (pdrv->id_table)
                return platform_match_id(pdrv->id_table, pdev) !=3D NULL;


