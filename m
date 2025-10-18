Return-Path: <linux-arm-msm+bounces-77877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D2CBED3F6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 18:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 285BB34C620
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Oct 2025 16:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D06A24677A;
	Sat, 18 Oct 2025 16:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="k0Ut4Lyc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185B4217F33;
	Sat, 18 Oct 2025 16:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760805688; cv=none; b=nP12qdAjSag1ah2DQyQfscdql81CB6uQ52EttpcorwSLB3HF39azlwl9GubkmFb5PAS50miwfJdeQF6k9JMMJOS6qWLfczQqkX7It7AvlNGYnAaTG5ec9EzIDvvYB19HPSwuMy/WQ7rTO1m/ft2P29cDoKyQOpKIJdZ/OthltNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760805688; c=relaxed/simple;
	bh=TcQFWVZGs08q/95sXCl8FOxL8CeUh4aHnSknN21+alc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MoO2tvSpSiGlbcWAjN1eLRAND2kCBPAtWeKx517H+a81mLc0NCeCX6bSYIq2310OLeW5w2YT/nY+8N1VMvbazqpowrUCVyAKRcxPn+2oHD+7JHvtuefC7+MX4Zdd6ClzUCa+p8OTZA2CZbjKGNCGXC7KwkvtNei791+qqC3sj9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=k0Ut4Lyc; arc=none smtp.client-ip=185.70.43.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1760805682; x=1761064882;
	bh=TcQFWVZGs08q/95sXCl8FOxL8CeUh4aHnSknN21+alc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=k0Ut4LycV//jYlWaBMAJ2hJ8M5LPwV7IhEgdYXu7kaePsIzKfZXMOgK80sdAk9BBO
	 SNjUVe1Os7HeLVHr8e2nny4qK002WgWpSHm45f1bPEvTkzQZ2aiqoO7CGwBlyF7pmw
	 DOi7pfWbV8vZ9J+wiagJH7NtPiFL6hP64egxmGqqx6RXoRmAdw4bnA7Ykr2GqdoCQt
	 ps0FiehroiVMdDqIotmq0mwgst4q3eiqHxrukqTUadXqRNCqBoiVHNFZUWFMQ3C9Rt
	 6+4ocmLZhYXp5ry1D7aHHyJNWigcANkQwHnMzFvQgYoiynmMPKqW518f9BitSCc3Er
	 UcvBNInyV7OBA==
Date: Sat, 18 Oct 2025 16:41:17 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: cristian_ci <cristian_ci@protonmail.com>
Cc: "~postmarketos/upstreaming@lists.sr.ht" <~postmarketosupstreaming@lists.sr.ht>, "cristian_ci@protonmail.com" <cristian_ci@protonmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "phone-devel@vger.kernel.org" <phone-devel@vger.kernel.org>
Subject: Re: [PATCH 00/10] ARM: Add support for yarisxl mt6582 board
Message-ID: <lOMHa6mcw10H8qfGsi25ljIEyIsio6vgGzJvT9FXWc_B4uI2kpes8OP2z_2VqnkVvQWwmQUInen4YOGg92ZgN8vbZDc1KuWNvwxjFIpBhgU=@protonmail.com>
In-Reply-To: <6657bfa7-9a6e-49a1-890f-81cf655940a7@collabora.com>
References: <20250920-mt6582-v1-0-b887720f577d@protonmail.com> <6657bfa7-9a6e-49a1-890f-81cf655940a7@collabora.com>
Feedback-ID: 27475468:user:proton
X-Pm-Message-ID: 7710293a5ab96e00a613212a51e9b751d2db05ca
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, September 22nd, 2025 at 13:05, AngeloGioacchino Del Regno <angel=
ogioacchino.delregno@collabora.com> wrote:

> Il 20/09/25 20:23, Cristian Cozzolino via B4 Relay ha scritto:
>=20
> > This series adds support for Alcatel Pop C7 (OT-7041D) smartphone
> > board, named yarisxl, based on MT6582 SoC. It also includes some
> > preliminary patches. More in detail:
> > - patches 1 and 2 add support for mt6582 to platform code
> > (verified by looking at generic mt6582 downstream source code)
> > - patches 3-6 do some maintenance work to mt6582.dtsi
> > (I was unsure if squashing timer node patches into one)
> > - patches 7 and 8 add devicetree and dt-bindings support for yarisxl
>=20
>=20
> That's simply great! Nice cleanup and nice addition - the only thing I ca=
n say here
> is that seeing simple-framebuffer is a pity, and that I hope that your pl=
ans are to
> continue with systimer, clocks, spi, i2c, apdma, mediatek-drm components,=
 etc :-)
>=20
> In the meanwhile, for the whole series
>=20
> Reviewed-by: AngeloGioacchino Del Regno angelogioacchino.delregno@collabo=
ra.com
>=20
>=20
> Keep up the good work!
>=20
> Cheers,
> Angelo
>=20

Hi (sorry for being late)!
It'd be nice add more support for this old platform, though I've to say tha=
t I've got inspiration from MT6572 patch series and this series is mostly b=
ased on that work.
BTW, I've tested this series together with mt6582 u-boot port (installed as=
 2nd stage bootloader), always derived from mt65xx u-boot work.
Since original port has been tested on mt6580 and mt6572, it's not too much=
 hard making a port for sibling SoCs like mt6582 (done) and mt6592.
(I've also managed to boot successfully a 1st stage bootloader mt6582 u-boo=
t port but I've not yet tried loading linux - and testing these patches - w=
ith that).
AS mt65xx platforms share many similarities, I hope more people could take =
part and extend mainline linux hardware support for mt6580, mt6572 and mt65=
82 as you wish.

In the meantime,

Thank You very nuch and=20

Best Regards,

Cristian.

P.S. I've made a mistake about cover letter by making reference to a number=
 of eight patches, while actually there are ten patches. BTW, that's not im=
portant at this point.

