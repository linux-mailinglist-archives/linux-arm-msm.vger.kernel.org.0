Return-Path: <linux-arm-msm+bounces-81476-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 96859C53CEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 18:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A5B10543339
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 17:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A633446BB;
	Wed, 12 Nov 2025 16:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XxxxjSUN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801043446AD
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 16:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762966795; cv=none; b=p3Qiu9Iam+pKf1TbXxJoreocNLq72Yg6HPN+bivU9pyFRVEyqukhWVGEfwYd9YIkwGvi66HCnUZvCKhz2DreHFEwPa4BAtO2fBnQhqfOFUYMd+90KbTifnfsWbu7FogE6kAcl29OfcAdRapn/SJP//8/qmRJTyhc5GxQuxYeRfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762966795; c=relaxed/simple;
	bh=RVOBomhYRdwmTIvo3d1upFxr9xv6m2ioRcySu2Zct+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sc0CLqxGZ68bgUbkgsvU24PcDEoHXrSRbTVwEhuMdXTNpIdjL8qxZGd9PffwUQnbRJpcXlOnMgQu9gF3OnpsiAcaYvhlC0eOVc7whHB0fVkO+VIhGlVGikkhQXOj5qzI9UHmoA24BVC2SOXPThjEXORb06Coomq2LdHLsC/AcTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XxxxjSUN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F25C113D0
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 16:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762966795;
	bh=RVOBomhYRdwmTIvo3d1upFxr9xv6m2ioRcySu2Zct+c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XxxxjSUNde86wmg/dcnOrvIfN2jepikxpY7GV4lYOLhagr1EawmOpBYrVV2HAdtyO
	 3TUYFKqPEPkY1rdnnXhBeoPa2xNa0hRO7yO1zs7ZhIVNnGwrszehllb7MZvKJSI+AF
	 uMKxv9JnbGqVlPiq5Py5LSOsJpDK+jw9LCdAbRWbGK5UddHigpNjs2JQWovpDwxDMr
	 SC6Bd8xvqKR5FbdKSYdtaX5S0iq5ObFngQn+ArfsBJw4HLkKHHe438BTi8m43lqaQJ
	 W4DENohKvqRFDeQMktCHwYehTOpkJbeMA8rq58HHHrJFxIJsWMjthzdqM4TcXtCWYA
	 ODaKBn0IoFE+Q==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso191793866b.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 08:59:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWte8efQr5Rus9boxCobY8/9o3rW9dI9mFTtZOXgU+6AeXUz01oYapni1WkQaAItRUL1HrgY86ZJM1a/gFd@vger.kernel.org
X-Gm-Message-State: AOJu0YwvRNQs9at1dmpl+hXh5jGTXP+oklB48L9QXv66jK+qDdOozYL7
	mNs6X0YMDCAMNZoWo5gx196DSFGHWY4T6HxVSd5K5He7rdj0n4cKj31le6gIcXP2CRuIQA44Qpp
	KCE16M9Vyn+vwwKBITypvc5TeCOrGTQ==
X-Google-Smtp-Source: AGHT+IEOqt/wJY8Cvt+ACAz7CBaI8+ZUOPnH6TL37Ek0ZSDGOQg0lL8OZ1nhy6LAM/AdjuxvzXmeIb2YLoCTlRThoLE=
X-Received: by 2002:a17:907:3fa8:b0:b70:b077:b957 with SMTP id
 a640c23a62f3a-b733198f04fmr406767266b.15.1762966793516; Wed, 12 Nov 2025
 08:59:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251031175926.1465360-1-robh@kernel.org> <aRN0fdOAV0B728qo@p14s>
 <20251111195923.GA3629535-robh@kernel.org> <CANLsYkwcbrTaKASdr5fj0m9ARS4xUgzVH8iWQKwTCvEsoZDDsQ@mail.gmail.com>
In-Reply-To: <CANLsYkwcbrTaKASdr5fj0m9ARS4xUgzVH8iWQKwTCvEsoZDDsQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 12 Nov 2025 10:59:42 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL7HcDkPgJjcqJSagdN=gH2rv6noVS57QMGNRp0YCxUBw@mail.gmail.com>
X-Gm-Features: AWmQ_bmxZCkzBm3PwPqC-n2_BEF69Zs3agW7isLAr86xc9rjwe66yE2yHIz-vl4
Message-ID: <CAL_JsqL7HcDkPgJjcqJSagdN=gH2rv6noVS57QMGNRp0YCxUBw@mail.gmail.com>
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

On Wed, Nov 12, 2025 at 9:43=E2=80=AFAM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Tue, 11 Nov 2025 at 12:59, Rob Herring <robh@kernel.org> wrote:
> >
> > On Tue, Nov 11, 2025 at 10:38:05AM -0700, Mathieu Poirier wrote:
> > > Hi Rob,
> > >
> > > Please see may comment for st_remoteproc.c
> > >
> > > On Fri, Oct 31, 2025 at 12:59:22PM -0500, Rob Herring (Arm) wrote:
> > > > Use the newly added of_reserved_mem_region_to_resource() and
> > > > of_reserved_mem_region_count() functions to handle "memory-region"
> > > > properties.

[...]

> > > > diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remotepro=
c/st_remoteproc.c
> > > > index e6566a9839dc..043348366926 100644
> > > > --- a/drivers/remoteproc/st_remoteproc.c
> > > > +++ b/drivers/remoteproc/st_remoteproc.c
> > > > @@ -120,40 +120,37 @@ static int st_rproc_parse_fw(struct rproc *rp=
roc, const struct firmware *fw)
> > > >     struct device *dev =3D rproc->dev.parent;
> > > >     struct device_node *np =3D dev->of_node;
> > > >     struct rproc_mem_entry *mem;
> > > > -   struct reserved_mem *rmem;
> > > > -   struct of_phandle_iterator it;
> > > > -   int index =3D 0;
> > > > -
> > > > -   of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> > > > -   while (of_phandle_iterator_next(&it) =3D=3D 0) {
> > > > -           rmem =3D of_reserved_mem_lookup(it.node);
> > > > -           if (!rmem) {
> > > > -                   of_node_put(it.node);
> > > > -                   dev_err(dev, "unable to acquire memory-region\n=
");
> > > > -                   return -EINVAL;
> > > > -           }
> > > > +   int index =3D 0, mr =3D 0;
> > > > +
> > > > +   while (1) {
> > > > +           struct resource res;
> > > > +           int ret;
> > > > +
> > > > +           ret =3D of_reserved_mem_region_to_resource(np, mr++, &r=
es);
> > > > +           if (ret)
> > > > +                   return 0;
> > >
> > > The original code calls rproc_elf_load_rsc_table() [1] after iteratin=
g through
> > > the memory region, something that won't happen with the above.
> >
> > Indeed. it needs the following incremental change. It is slightly
> > different in that rproc_elf_load_rsc_table() is not called if
> > 'memory-region' is missing, but the binding says that's required.
> >
> > 8<--------------------------------------------------
> >
> > diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st=
_remoteproc.c
> > index 043348366926..cb09c244fdb5 100644
> > --- a/drivers/remoteproc/st_remoteproc.c
> > +++ b/drivers/remoteproc/st_remoteproc.c
> > @@ -120,15 +120,19 @@ static int st_rproc_parse_fw(struct rproc *rproc,=
 const struct firmware *fw)
> >         struct device *dev =3D rproc->dev.parent;
> >         struct device_node *np =3D dev->of_node;
> >         struct rproc_mem_entry *mem;
> > -       int index =3D 0, mr =3D 0;
> > +       int index =3D 0;
> >
> >         while (1) {
> >                 struct resource res;
> >                 int ret;
> >
> > -               ret =3D of_reserved_mem_region_to_resource(np, mr++, &r=
es);
> > -               if (ret)
> > -                       return 0;
> > +               ret =3D of_reserved_mem_region_to_resource(np, index, &=
res);
> > +               if (ret) {
> > +                       if (index)
> > +                               break;
> > +                       else
> > +                               return ret;
> > +               }
>
> This looks brittle and I'm not sure it would work.
>
> Going back to the original implementation, the only time we want to
> "break" is when @index is equal to the amount of memory regions _and_
> ret is -EINVAL.  Any other condition should return.

@index equal to number of entries returns -ENODEV, so that condition
is impossible. We can simply it to this:

if (ret =3D=3D -ENODEV && index)
    break;
else
    return ret;

If you want to keep the prior behavior when 'memory-region' is
missing, then '&& index' can be removed, but I think that was wrong
behavior.

Rob

