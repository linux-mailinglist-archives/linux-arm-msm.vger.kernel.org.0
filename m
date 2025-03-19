Return-Path: <linux-arm-msm+bounces-52033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71319A69C7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 00:04:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DFFC37A3C5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 23:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37CF220683;
	Wed, 19 Mar 2025 23:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uuGe+aOw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA9F20899C;
	Wed, 19 Mar 2025 23:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742425482; cv=none; b=Cnmty7IiVAfByvvfvEWZHKG9JZ8ny1Ul3dfKsEBMjE3O/+stuiQ2513ZcKnNpaTlLg0yDfqzXuviRXxmS5z045DVYgMRTFmVs2hkYFTQKJYAasqRo3tkh41mnoANslmX1MmMSrer+4tEa3yECyb3O2y3a5orwHAM7FsPN3m3SBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742425482; c=relaxed/simple;
	bh=wh2+nbO+uhOl81kfYkAvk91jGgv0SNefhWvjy1MiI9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L1NZhgBVWtfJ5ccHm1H6wn7t3utQAt6J/DDJVG1/utIFhLEdQ3HD6toaMTmcANdgGbzHP28IRzVAj9ZMfXreH3ehexm7GynBK5Sgw+VvG4ewp524Ezl1gGGKDdn78IabtfEq2Peyqrl9HjJGZ6DAzOs+PVUt2AwWejMIyxwci/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uuGe+aOw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0A3C4CEEF;
	Wed, 19 Mar 2025 23:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742425482;
	bh=wh2+nbO+uhOl81kfYkAvk91jGgv0SNefhWvjy1MiI9E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uuGe+aOwcgf7kb6tS+eJjVfXHyx1rbvLoZ2NOaP02SzxNs47NRpR2LVVwhgwHQXBH
	 NltceS4U3rtwfOvmEq6YnwNECmBc2oMMbb9lU/j4Uom1lYzKvdw4wm1Yy6nW930eJu
	 Qj9XsiBQDeLSstZ6bM2e8hq8mcmFfI/UZ91g+PDxaY6TrX2C3SXVc/S9g9siUzR7Xm
	 hpdQQZo/klOGL1YJZWIiEqKqUyJrEUGeSc8uY7viKfW1a/4xC4CXnFy1b01yO2/l88
	 BlSp4hn6bDt5R1zh7kce8Os/lelWqy7DrU4HRFeFfXCx+Wxz9JKCbO/8BHToR3LrOm
	 gULLlNMRPLUag==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5c9662131so282300a12.3;
        Wed, 19 Mar 2025 16:04:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVnfH0M82Sk2vb4iy5ZBg7RQTrfRaRfwzj8GeES8GAoGWEW0tVyyxaDqzVQB8RUbMJzoXCI0BgX0EIUJ3/K3A==@vger.kernel.org, AJvYcCWIZQux2cbbNmcQgC/v0B04ct+6ILQkH9+IrA28STTJtgIS6485pz6sGBiExH9AtubrUWSv7dMssxYqCheC@vger.kernel.org, AJvYcCWoLncYcpXPqYzHoI6V4kuI0egb7mi0YMzDIV9s2oaUZqwiBnKimkCAFjhseAMiA1BhKaazvnJprDntlmElZ5Kwvg==@vger.kernel.org, AJvYcCX4aN4rUq2oWRD7XJxonh6B5C5AvshRbfInzsSsmOSF21yRXgK1GPt7AGwLDlczRKyT7RlgxnPSGVYn@vger.kernel.org
X-Gm-Message-State: AOJu0Ywww1eNfw97kdTsdvOuFA6qP2qr5N3TTYwrOtkB3/zcqDd3noKD
	E/WoORxKU4DwtfCmt47DNqN8azuUuHFCTRr3DIHvTyZHz+Uuyd1MdUpkKEUeMwl6TuCtMBV+t8d
	I50ud6xIorBfKec8eiJjoaVbt5g==
X-Google-Smtp-Source: AGHT+IH1Yrc3Y5KhcKuIDvTrQ1KQbSSjJSIP+aKUctEQfy6L4vvWLzhbwAuvXFhDZUh0Wqy+O4jXTvspjUWR7fVZh34=
X-Received: by 2002:a05:6402:d0d:b0:5dc:7643:4f3d with SMTP id
 4fb4d7f45d1cf-5eb9eee0416mr908900a12.1.1742425481081; Wed, 19 Mar 2025
 16:04:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317232426.952188-1-robh@kernel.org> <20250317232426.952188-4-robh@kernel.org>
 <26e72cb2-c355-4c40-bb98-fc0ff267bf4f@foss.st.com>
In-Reply-To: <26e72cb2-c355-4c40-bb98-fc0ff267bf4f@foss.st.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 19 Mar 2025 18:04:30 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+7ZhMWgbFDvPB+3BG7YfiS9PweybOGNY3r=d40RbGHJA@mail.gmail.com>
X-Gm-Features: AQ5f1JqOv9zU_NIrquP_FiizlsCH0dJCdTrTRAoIvYNPwVPq8s6b1gdkB9PCxY8
Message-ID: <CAL_Jsq+7ZhMWgbFDvPB+3BG7YfiS9PweybOGNY3r=d40RbGHJA@mail.gmail.com>
Subject: Re: [Linux-stm32] [PATCH 3/3] remoteproc: Use of_reserved_mem_region_*
 functions for "memory-region"
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Saravana Kannan <saravanak@google.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 10:26=E2=80=AFAM Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
> Hello Rob,
>
> On 3/18/25 00:24, Rob Herring (Arm) wrote:
> > Use the newly added of_reserved_mem_region_to_resource() and
> > of_reserved_mem_region_count() functions to handle "memory-region"
> > properties.
> >
> > The error handling is a bit different in some cases. Often
> > "memory-region" is optional, so failed lookup is not an error. But then
> > an error in of_reserved_mem_lookup() is treated as an error. However,
> > that distinction is not really important. Either the region is availabl=
e
> > and usable or it is not. So now, it is just
> > of_reserved_mem_region_to_resource() which is checked for an error.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > For v6.16
> >

[...]

> > diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm3=
2_rproc.c
> > index b02b36a3f515..9d2bd8904c49 100644
> > --- a/drivers/remoteproc/stm32_rproc.c
> > +++ b/drivers/remoteproc/stm32_rproc.c
> > @@ -213,52 +213,46 @@ static int stm32_rproc_prepare(struct rproc *rpro=
c)
> >  {
> >       struct device *dev =3D rproc->dev.parent;
> >       struct device_node *np =3D dev->of_node;
> > -     struct of_phandle_iterator it;
> >       struct rproc_mem_entry *mem;
> > -     struct reserved_mem *rmem;
> >       u64 da;
> > -     int index =3D 0;
> > +     int index =3D 0, mr =3D 0;
> >
> >       /* Register associated reserved memory regions */
> > -     of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> > -     while (of_phandle_iterator_next(&it) =3D=3D 0) {
> > -             rmem =3D of_reserved_mem_lookup(it.node);
> > -             if (!rmem) {
> > -                     of_node_put(it.node);
> > -                     dev_err(dev, "unable to acquire memory-region\n")=
;
> > -                     return -EINVAL;
> > -             }
> > +     while (1) {
> > +             struct resource res;
> > +             int ret;
> > +
> > +             ret =3D of_reserved_mem_region_to_resource(np, mr++, &res=
);
> > +             if (ret)
> > +                     return 0;
> >
> > -             if (stm32_rproc_pa_to_da(rproc, rmem->base, &da) < 0) {
> > -                     of_node_put(it.node);
> > -                     dev_err(dev, "memory region not valid %pa\n",
> > -                             &rmem->base);
> > +             if (stm32_rproc_pa_to_da(rproc, res.start, &da) < 0) {
> > +                     dev_err(dev, "memory region not valid %pR\n", &re=
s);
> >                       return -EINVAL;
> >               }
> >
> >               /*  No need to map vdev buffer */
> > -             if (strcmp(it.node->name, "vdev0buffer")) {
> > +             if (strcmp(res.name, "vdev0buffer")) {
>
> I tested your patches

Thank you.

> The update introduces a regression here. The strcmp function never return=
s 0.
> Indeed, it.node->name stores the memory region label "vdev0buffer," while
> res.name stores the memory region name "vdev0buffer@10042000."
>
> Several remoteproc drivers may face the same issue as they embed similar =
code.

Indeed. I confused myself because node 'name' is without the
unit-address, but this is using the full name. I've replaced the
strcmp's with strstarts() to address this. I've updated my branch with
the changes.

Rob

