Return-Path: <linux-arm-msm+bounces-52556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F68A71EAF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 19:53:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57A6E17A963
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 18:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDC2D245015;
	Wed, 26 Mar 2025 18:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="snLlwT1B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898DA215058;
	Wed, 26 Mar 2025 18:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743015182; cv=none; b=WZFxFyMHwiw1ExweVc3H5qjGAWR2tDkFwYpp+eQM36RWtb5bGSbm0KZNn4kkjKCFMyFxZuC3YZhlbPfgmF5blK8aKtMMkI8cruGtb1UMdHSCy1aFf7PKnEPg5zIp/w2SpcnDVFiV+ooiKSeYbaNmHCFAG6UfPDw5EZgvHSsr85w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743015182; c=relaxed/simple;
	bh=7tnbCUTKMpPo8aoqQiYW410Hhe5LPNkwVR28/52KUGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CR63jnP6nLxtdHeFRa7TEtEaikeVTIesVTzKY4GhAp/L4QsNnTZAjyRmIQAygariWrzHBGXMKELn30Lf4gZkWFtbRf1c4CL513oQiWY4p7nSrFzGUgpcX0yfa2F0Z+ACn/gpMBd8U+8VEKfG9FqH7CgSVqarrXYeNV9/Gzd6h4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=snLlwT1B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FD20C4CEF0;
	Wed, 26 Mar 2025 18:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743015182;
	bh=7tnbCUTKMpPo8aoqQiYW410Hhe5LPNkwVR28/52KUGY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=snLlwT1ByOOZ8VDdLTGeiVAiEWrHtg3EvWVkctlzQIGFZzDT7XBzN2DIIFpHVRuA4
	 QWSXjBNoMYxPNGrYI7EhmcSj0AeKKRNkXc7ncCYbP0fslp4P4+jMIkZIAktw92xzl9
	 f/6pVTEXC4NSXGu4xof5rtvBej+C0GDqtW1wkGhV6Wi2YRwu2jpb0Lyghf8UlzytoG
	 WwQ6DMNodUQHQk2VpoXa2/y89pLaPCLpwF+ISbR4hp6cRaabZWfTVWMtcr/ZSfSmh8
	 jwKqvjyFp2FKpKOIs73vDRG4Rw8NplM2rXgHf/zkk7H07J9bPh8EYwSA5OcJVoLYAh
	 Co5wZxznPQ7aQ==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5ec9d24acfbso2301933a12.0;
        Wed, 26 Mar 2025 11:53:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCULByM3gBBPd93iQ9H5PkPbQbq7kXP4TicXA1aaKhpWmsdmWepvEb/nR3B7VV16xeV0U8PGJHJ71U9hqUh0@vger.kernel.org, AJvYcCV0d2Z38X05xlfAoQnlAoZYMTdejD+bwfDdVf4t6X70lo65Ix3nQfiLBMxWgNglM7M+DaMcWLb4EbLRlJGfbCueqA==@vger.kernel.org, AJvYcCVaZjgj5CxrS201Md3PY0KWIUM4WMPBMgXlS68gXmX22VfTcNNKcFVNXWo7DmkmVQtfSlaoYxgYhpC9Umww2g==@vger.kernel.org, AJvYcCXMybBh7e9IkBvVBDeMDF9I/TjndgEwHovuHdgD3YhIS/H8HejuG/wk5Ih3Kgjbq5p5QyA4ZSWNDsFO@vger.kernel.org
X-Gm-Message-State: AOJu0YzwgTrQephHReQ0rUXSL3XoX0/ynn3bV+dKHD38pxVRGzvA7F8i
	E8yfNBpgf+FpHTUnpv27E5mPywKuwkadqEsZ6DjrVrBP7R43zceG3JYesxfKEOckx44bmFER8AN
	kNIKYWD8g6TfjOeM7Koee1qsmbQ==
X-Google-Smtp-Source: AGHT+IEi/FLkb6+pDXS2OgDct0wDDLVjgAusO19cQUp3SH7xeV/KwpO2rct7/toV7PxXM7MD6oHfl5OWID6sUvuLyTI=
X-Received: by 2002:a17:907:7295:b0:ac2:26a6:febf with SMTP id
 a640c23a62f3a-ac6e0d3384emr557164766b.20.1743015180452; Wed, 26 Mar 2025
 11:53:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317232426.952188-1-robh@kernel.org> <20250317232426.952188-3-robh@kernel.org>
 <CAGb2v65djD5DLQnjQrp9kSHTQYVd9p_vP9WySj2Cx81rHmh5Mw@mail.gmail.com>
In-Reply-To: <CAGb2v65djD5DLQnjQrp9kSHTQYVd9p_vP9WySj2Cx81rHmh5Mw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 26 Mar 2025 13:52:49 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLoJAwPeWjXyQYK1rvVzn6Meapz3iS9gW+QqYpYKuJkBQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jqmc05lmNw-rFmLFhT71JwYvVm4xio8OJGuHie4RorDqomqBJbJolJsSNo
Message-ID: <CAL_JsqLoJAwPeWjXyQYK1rvVzn6Meapz3iS9gW+QqYpYKuJkBQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] of: Simplify of_dma_set_restricted_buffer() to use of_for_each_phandle()
To: wens@kernel.org
Cc: Saravana Kannan <saravanak@google.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 1:44=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> Hi,
>
> On Tue, Mar 18, 2025 at 7:29=E2=80=AFAM Rob Herring (Arm) <robh@kernel.or=
g> wrote:
> >
> > Simplify of_dma_set_restricted_buffer() by using of_property_present()
> > and of_for_each_phandle() iterator.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  drivers/of/device.c | 34 +++++++++++++---------------------
> >  1 file changed, 13 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/of/device.c b/drivers/of/device.c
> > index edf3be197265..bb4a47d58249 100644
> > --- a/drivers/of/device.c
> > +++ b/drivers/of/device.c
> > @@ -35,44 +35,36 @@ EXPORT_SYMBOL(of_match_device);
> >  static void
> >  of_dma_set_restricted_buffer(struct device *dev, struct device_node *n=
p)
> >  {
> > -       struct device_node *node, *of_node =3D dev->of_node;
> > -       int count, i;
> > +       struct device_node *of_node =3D dev->of_node;
> > +       struct of_phandle_iterator it;
> > +       int rc, i =3D 0;
> >
> >         if (!IS_ENABLED(CONFIG_DMA_RESTRICTED_POOL))
> >                 return;
> >
> > -       count =3D of_property_count_elems_of_size(of_node, "memory-regi=
on",
> > -                                               sizeof(u32));
> >         /*
> >          * If dev->of_node doesn't exist or doesn't contain memory-regi=
on, try
> >          * the OF node having DMA configuration.
> >          */
> > -       if (count <=3D 0) {
> > +       if (!of_property_present(of_node, "memory-region"))
> >                 of_node =3D np;
> > -               count =3D of_property_count_elems_of_size(
> > -                       of_node, "memory-region", sizeof(u32));
> > -       }
> >
> > -       for (i =3D 0; i < count; i++) {
> > -               node =3D of_parse_phandle(of_node, "memory-region", i);
> > +       of_for_each_phandle(&it, rc, of_node, "memory-region", NULL, 0)=
 {
> >                 /*
> >                  * There might be multiple memory regions, but only one
> >                  * restricted-dma-pool region is allowed.
> >                  */
> > -               if (of_device_is_compatible(node, "restricted-dma-pool"=
) &&
> > -                   of_device_is_available(node)) {
> > -                       of_node_put(node);
> > -                       break;
> > +               if (of_device_is_compatible(it.node, "restricted-dma-po=
ol") &&
> > +                   of_device_is_available(it.node)) {
> > +                       if (!of_reserved_mem_device_init_by_idx(dev, of=
_node, i)) {
> > +                               of_node_put(it.node);
> > +                               return;
> > +                       }
> >                 }
> > -               of_node_put(node);
> > +               i++;
> >         }
> >
> > -       /*
> > -        * Attempt to initialize a restricted-dma-pool region if one wa=
s found.
> > -        * Note that count can hold a negative error code.
> > -        */
> > -       if (i < count && of_reserved_mem_device_init_by_idx(dev, of_nod=
e, i))
> > -               dev_warn(dev, "failed to initialise \"restricted-dma-po=
ol\" memory node\n");
> > +       dev_warn(dev, "failed to initialise \"restricted-dma-pool\" mem=
ory node\n");
>
> This changes the behavior. Before this patch, it was:
>
>     if a restricted dma pool was found, but initializing it failed, print
>     a warning.
>
> Whereas now it has become:
>
>      print a warning unless a restricted dma pool was found and successfu=
lly
>      initialized.
>
> This change causes the kernel to print out the warning for devices that
> don't even do DMA:

Thanks. I fixed it up to only warn if i is non-zero.

Rob

