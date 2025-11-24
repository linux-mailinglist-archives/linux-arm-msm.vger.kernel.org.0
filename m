Return-Path: <linux-arm-msm+bounces-83114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB8EC81E9F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 18:34:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C73A14E68AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 17:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940D62BEFE8;
	Mon, 24 Nov 2025 17:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSMluTDn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAB52BEC55
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 17:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764005657; cv=none; b=rN5kaNz1FxzjUbmxt198Th0GXsFmIPoVbfxkdXpIj88EwxQLNzZ2QjRdihkrptclCBvHv46d81CVuVh0IkgXevWXVUXXrcklYpIFxLtqytmS5kDTayXVSefAvSJ9lYSGZ54HTROlqHC3dZdNabKjJXagvK4IgD1SPM2UT6iagqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764005657; c=relaxed/simple;
	bh=QrwrudDXcmBwv5MpjExmSZyNDnG2x6mJE3eaNfxGUrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bVH19wgm4PKbFupW3dntn3C6mdb0czmqSR3kEAuL2FRk1ug9djdoGYz8xJ2ERloIMwwmjEWcVA+tYCIVXdELScwtdY+6UYHSmiN6nmpHaSjvbwG9isk6sW6Jp+LSdhBJsxi779G4I9l11rk3jzUDHfxuLSWBsQMry3XRWEV5ftw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSMluTDn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04CFFC2BCB0
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 17:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764005656;
	bh=QrwrudDXcmBwv5MpjExmSZyNDnG2x6mJE3eaNfxGUrk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cSMluTDn9fYYcsY96+RxCVmBU1UT6UeyACkllJmWSzU7gZrvo4gGKXo7uyft1pw/J
	 X0UATKXVk+76/kBFRGVF3WN6uZgdNS3IO4AInkWQW27lHULnedM31JIF4SYAhBxdt1
	 htoENAzwePRLjk5wCvlNeLCA2EhSsiJdEzldD7GbpiOoH+JZ0hIPxhLZNrJGTVLqyY
	 2rgtF3juLEX+iTIqseecGdaakgW0CW4dYuyzvYUgbL2kageR3wIVXZrIeJIMhRFjpw
	 s8V/JiAZGEYvkqjz/CuBiFxqZYv8hiBAk1mJsvk15Xna/VKLCOvT4hJYMMNMBq/vD8
	 cuwKoO9s+/KJg==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b73875aa527so729105166b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:34:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX64dmCPNbh/2c7+F+Ms9+B9/Xi/dKnFO52xe2NhM0GTC/aQFWZqL6vLpLugmuXr5n2N3UYAHfRDZpG6xmj@vger.kernel.org
X-Gm-Message-State: AOJu0YyPn63xLIf6yqPTIXPQOqWQmyIiLnXC7TT8vcWOEOpcOA16tRpv
	L9LI+PgeGIoLT2ToiJK0XIPTRBz5RD4GfeJ20m8+tcBtaR3/qkNxYiOGquP8PH0XD/z5Yoh9pJ+
	SHARKZv3ZBE3qWiAwgom9EUuprxuM9g==
X-Google-Smtp-Source: AGHT+IH4zThrBiVwTM/gMTFGPCf7Ko+9nQcpXA9JRi2zbFqO9WDmcAZTQclKPHj9NMzyHEHvrVsg+wN6QcpewpApah8=
X-Received: by 2002:a17:907:1b0f:b0:b6d:573d:bbc5 with SMTP id
 a640c23a62f3a-b767170cca7mr1240223266b.37.1764005654444; Mon, 24 Nov 2025
 09:34:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251031175926.1465360-1-robh@kernel.org> <aRN0fdOAV0B728qo@p14s>
 <20251111195923.GA3629535-robh@kernel.org> <CANLsYkwcbrTaKASdr5fj0m9ARS4xUgzVH8iWQKwTCvEsoZDDsQ@mail.gmail.com>
 <CAL_JsqL7HcDkPgJjcqJSagdN=gH2rv6noVS57QMGNRp0YCxUBw@mail.gmail.com> <aRX6DJoaP4MXG3fN@p14s>
In-Reply-To: <aRX6DJoaP4MXG3fN@p14s>
From: Rob Herring <robh@kernel.org>
Date: Mon, 24 Nov 2025 11:34:02 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJGtQTVdaJ99DKiqbo3GfxmU7V6QjroTxHi7gR53Dfe-Q@mail.gmail.com>
X-Gm-Features: AWmQ_bmPMfxmmKwhG7Mzx1bAQRdZoKMheTTGVeWZ-CEQx6BfmTyQnFsumwKZ_Xg
Message-ID: <CAL_JsqJGtQTVdaJ99DKiqbo3GfxmU7V6QjroTxHi7gR53Dfe-Q@mail.gmail.com>
Subject: Re: [PATCH v6] remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 9:32=E2=80=AFAM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Wed, Nov 12, 2025 at 10:59:42AM -0600, Rob Herring wrote:
> > On Wed, Nov 12, 2025 at 9:43=E2=80=AFAM Mathieu Poirier
> > <mathieu.poirier@linaro.org> wrote:
> > >
> > > On Tue, 11 Nov 2025 at 12:59, Rob Herring <robh@kernel.org> wrote:
> > > >
> > > > On Tue, Nov 11, 2025 at 10:38:05AM -0700, Mathieu Poirier wrote:
> > > > > Hi Rob,
> > > > >
> > > > > Please see may comment for st_remoteproc.c
> > > > >
> > > > > On Fri, Oct 31, 2025 at 12:59:22PM -0500, Rob Herring (Arm) wrote=
:
> > > > > > Use the newly added of_reserved_mem_region_to_resource() and
> > > > > > of_reserved_mem_region_count() functions to handle "memory-regi=
on"
> > > > > > properties.
> >
> > [...]
> >
> > > > > > diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remot=
eproc/st_remoteproc.c
> > > > > > index e6566a9839dc..043348366926 100644
> > > > > > --- a/drivers/remoteproc/st_remoteproc.c
> > > > > > +++ b/drivers/remoteproc/st_remoteproc.c
> > > > > > @@ -120,40 +120,37 @@ static int st_rproc_parse_fw(struct rproc=
 *rproc, const struct firmware *fw)
> > > > > >     struct device *dev =3D rproc->dev.parent;
> > > > > >     struct device_node *np =3D dev->of_node;
> > > > > >     struct rproc_mem_entry *mem;
> > > > > > -   struct reserved_mem *rmem;
> > > > > > -   struct of_phandle_iterator it;
> > > > > > -   int index =3D 0;
> > > > > > -
> > > > > > -   of_phandle_iterator_init(&it, np, "memory-region", NULL, 0)=
;
> > > > > > -   while (of_phandle_iterator_next(&it) =3D=3D 0) {
> > > > > > -           rmem =3D of_reserved_mem_lookup(it.node);
> > > > > > -           if (!rmem) {
> > > > > > -                   of_node_put(it.node);
> > > > > > -                   dev_err(dev, "unable to acquire memory-regi=
on\n");
> > > > > > -                   return -EINVAL;
> > > > > > -           }
> > > > > > +   int index =3D 0, mr =3D 0;
> > > > > > +
> > > > > > +   while (1) {
> > > > > > +           struct resource res;
> > > > > > +           int ret;
> > > > > > +
> > > > > > +           ret =3D of_reserved_mem_region_to_resource(np, mr++=
, &res);
> > > > > > +           if (ret)
> > > > > > +                   return 0;
> > > > >
> > > > > The original code calls rproc_elf_load_rsc_table() [1] after iter=
ating through
> > > > > the memory region, something that won't happen with the above.
> > > >
> > > > Indeed. it needs the following incremental change. It is slightly
> > > > different in that rproc_elf_load_rsc_table() is not called if
> > > > 'memory-region' is missing, but the binding says that's required.
> > > >
> > > > 8<--------------------------------------------------
> > > >
> > > > diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remotepro=
c/st_remoteproc.c
> > > > index 043348366926..cb09c244fdb5 100644
> > > > --- a/drivers/remoteproc/st_remoteproc.c
> > > > +++ b/drivers/remoteproc/st_remoteproc.c
> > > > @@ -120,15 +120,19 @@ static int st_rproc_parse_fw(struct rproc *rp=
roc, const struct firmware *fw)
> > > >         struct device *dev =3D rproc->dev.parent;
> > > >         struct device_node *np =3D dev->of_node;
> > > >         struct rproc_mem_entry *mem;
> > > > -       int index =3D 0, mr =3D 0;
> > > > +       int index =3D 0;
> > > >
> > > >         while (1) {
> > > >                 struct resource res;
> > > >                 int ret;
> > > >
> > > > -               ret =3D of_reserved_mem_region_to_resource(np, mr++=
, &res);
> > > > -               if (ret)
> > > > -                       return 0;
> > > > +               ret =3D of_reserved_mem_region_to_resource(np, inde=
x, &res);
> > > > +               if (ret) {
> > > > +                       if (index)
> > > > +                               break;
> > > > +                       else
> > > > +                               return ret;
> > > > +               }
> > >
> > > This looks brittle and I'm not sure it would work.
> > >
> > > Going back to the original implementation, the only time we want to
> > > "break" is when @index is equal to the amount of memory regions _and_
> > > ret is -EINVAL.  Any other condition should return.
> >
> > @index equal to number of entries returns -ENODEV, so that condition
> > is impossible. We can simply it to this:
> >
> > if (ret =3D=3D -ENODEV && index)
> >     break;
> > else
> >     return ret;
>
> To me this needs to be:
>
> entries =3D of_reserved_mem_region_count(np);

Ideally, we try to avoid parsing the same property twice. The places
we count and then read the property again are when we need to allocate
an array of the right size in between. But if that puts this patch to
bed finally, then fine.

>
> ...
> ...
>
> if (ret =3D=3D -ENODEV && index =3D=3D entries)
>         break;
> else
>         return ret;
>
> But taking a step back, it might even be easier to go from a while() to a=
 for(),
> the same way you did in imx_rproc_addr_init().
>
> >
> > If you want to keep the prior behavior when 'memory-region' is
> > missing, then '&& index' can be removed, but I think that was wrong
> > behavior.
> >
> > Rob

