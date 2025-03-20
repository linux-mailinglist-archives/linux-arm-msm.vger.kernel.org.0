Return-Path: <linux-arm-msm+bounces-52104-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91292A6ACAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 19:04:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DE853A8C2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Mar 2025 18:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA1A224B13;
	Thu, 20 Mar 2025 18:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FExZuvSg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B369F1E5702;
	Thu, 20 Mar 2025 18:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742493744; cv=none; b=O8pIEU/+JYc2AWEi4gKAVz/JqXUPjoXvg9CFNAsxXCgJUmwBQ+u3ztfhZansq3pX13FWunI9sC+xTq72IhAplhMHWfnsJJ5lmiQExGNjAXhF1PFZmj0t2sxmsZipALA9AXxxeWpZpUcLlLEfDx2HDoh+w+e9xnYqszkLkYkBua8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742493744; c=relaxed/simple;
	bh=y9R11PCeG0aC7T4yQOMfIHSqYCQ5IC3utAoKlffVDss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fOhUeJIrJT9aR+HMYK2KC94vdPIdwRupXTGWygMtl86eBn7nqW3DI8WjOpfY+FRsHzEbtTmnRjc40EUfYYfbD9RTranfwQA6IqIgpVu7fRApKdDKyB8oESdjcXFr6vCNh5kxfsCljfCt4/p+pqG0GcqaAf1D5681japx93cJEBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FExZuvSg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CA3FC4AF0B;
	Thu, 20 Mar 2025 18:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742493744;
	bh=y9R11PCeG0aC7T4yQOMfIHSqYCQ5IC3utAoKlffVDss=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FExZuvSgG7lQ0nphnU46uCB3BITIfCUTFx/gRRNQECKgcsiWtNME41GgHctBairTj
	 L2E4xjss89M+TnVQmJP3gNRjnUYvu3j22ltM8HOhpjuVYuimADN8rrVXMdfbsEwg/o
	 FedshALdXFQlmmCNDqhhTbjSuJm60rHbMJpBjvugGcJ75Z77+vWHqHsj1ileqG8Pb/
	 WqFwlWO8YJmUHunQSgj7i4OOkw4X//d/uscB7e10Kegh3pry9R0esBPLI1F4sswS9F
	 qyRVrIrrc1RN+zEOhuXNUCBBuH9upKVbOG96on8DouTIArXT0b80FQXG77FldV3Nth
	 1Bvi4yL9YGukA==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e535e6739bso1759377a12.1;
        Thu, 20 Mar 2025 11:02:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVVpH5sA2wEbcB13Cto88FlUplJ7M1Ec0dHoaugJ/nM6M5ZzybEDTa+HVnFRRPygOVj1g+vfCeNjgtup5P7M8Thvg==@vger.kernel.org, AJvYcCVvobix/lWW9/zjL0xlteV0CHldEuvm02mz5y6Px4Byj/rcuhkOYjFKYm5bOsmQk4axEhMpaJWeMejj@vger.kernel.org, AJvYcCXDQXBl10fZhdfJhcMFYVWnCI6xyoPGsJGaId2tR8CNbQ4dAcZixfnqcqYc0PovJ9XF+2ZRn11Fu4aF2VyIkw==@vger.kernel.org, AJvYcCXmdJATqwmBCH1z4yipDMsDBOOptEz72S+Ahn4M/VnzJVbFfo+Q/Xn3j0R5MxOdnN1LM70ra2gzcPk+qw2y@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+GPyQChxriQT5LAmUgwxq89OVAglPQaPup22TOOqbyxc62DLu
	yOAoXOy43GoGX2MmM/3nsyRiPdnB8OwY1gKLAWIp4oh4gzbRnIWxp7sAks70cXL8j2m4EWvplBq
	jbgC47SOgSW6uKysvKbr6ZB2/9A==
X-Google-Smtp-Source: AGHT+IHQN97QVgyFz09nfrYtWbO3Ru8zTNvSZPoniI5opPgH/pEzb20TQeGjO3i0k0wm7am1Inl8y3sD3mZZgGtCBU4=
X-Received: by 2002:a05:6402:13d6:b0:5de:aa54:dc30 with SMTP id
 4fb4d7f45d1cf-5ebcd40b7d9mr238445a12.5.1742493742665; Thu, 20 Mar 2025
 11:02:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317232426.952188-1-robh@kernel.org> <20250317232426.952188-4-robh@kernel.org>
 <26e72cb2-c355-4c40-bb98-fc0ff267bf4f@foss.st.com> <CAL_Jsq+7ZhMWgbFDvPB+3BG7YfiS9PweybOGNY3r=d40RbGHJA@mail.gmail.com>
 <130d61a8-6f03-46dc-94ca-f098bc09babc@foss.st.com>
In-Reply-To: <130d61a8-6f03-46dc-94ca-f098bc09babc@foss.st.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 20 Mar 2025 13:02:11 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJZkEpx26=ro_y8hHA2x1Zm6z_SFOQHjQ-WzUa-gy+s0w@mail.gmail.com>
X-Gm-Features: AQ5f1Jr2DWg_p_3pOGaFM-d8b9OA-WiVr1l9JRvSP10bkvbhKAdr3MGldt734ck
Message-ID: <CAL_JsqJZkEpx26=ro_y8hHA2x1Zm6z_SFOQHjQ-WzUa-gy+s0w@mail.gmail.com>
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

On Thu, Mar 20, 2025 at 4:23=E2=80=AFAM Arnaud POULIQUEN
<arnaud.pouliquen@foss.st.com> wrote:
>
>
>
> On 3/20/25 00:04, Rob Herring wrote:
> > On Wed, Mar 19, 2025 at 10:26=E2=80=AFAM Arnaud POULIQUEN
> > <arnaud.pouliquen@foss.st.com> wrote:
> >>
> >> Hello Rob,
> >>
> >> On 3/18/25 00:24, Rob Herring (Arm) wrote:
> >>> Use the newly added of_reserved_mem_region_to_resource() and
> >>> of_reserved_mem_region_count() functions to handle "memory-region"
> >>> properties.
> >>>
> >>> The error handling is a bit different in some cases. Often
> >>> "memory-region" is optional, so failed lookup is not an error. But th=
en
> >>> an error in of_reserved_mem_lookup() is treated as an error. However,
> >>> that distinction is not really important. Either the region is availa=
ble
> >>> and usable or it is not. So now, it is just
> >>> of_reserved_mem_region_to_resource() which is checked for an error.
> >>>
> >>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> >>> ---
> >>> For v6.16
> >>>
> >
> > [...]
> >
> >>> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/st=
m32_rproc.c
> >>> index b02b36a3f515..9d2bd8904c49 100644
> >>> --- a/drivers/remoteproc/stm32_rproc.c
> >>> +++ b/drivers/remoteproc/stm32_rproc.c
> >>> @@ -213,52 +213,46 @@ static int stm32_rproc_prepare(struct rproc *rp=
roc)
> >>>  {
> >>>       struct device *dev =3D rproc->dev.parent;
> >>>       struct device_node *np =3D dev->of_node;
> >>> -     struct of_phandle_iterator it;
> >>>       struct rproc_mem_entry *mem;
> >>> -     struct reserved_mem *rmem;
> >>>       u64 da;
> >>> -     int index =3D 0;
> >>> +     int index =3D 0, mr =3D 0;
> >>>
> >>>       /* Register associated reserved memory regions */
> >>> -     of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
> >>> -     while (of_phandle_iterator_next(&it) =3D=3D 0) {
> >>> -             rmem =3D of_reserved_mem_lookup(it.node);
> >>> -             if (!rmem) {
> >>> -                     of_node_put(it.node);
> >>> -                     dev_err(dev, "unable to acquire memory-region\n=
");
> >>> -                     return -EINVAL;
> >>> -             }
> >>> +     while (1) {
> >>> +             struct resource res;
> >>> +             int ret;
> >>> +
> >>> +             ret =3D of_reserved_mem_region_to_resource(np, mr++, &r=
es);
> >>> +             if (ret)
> >>> +                     return 0;
> >>>
> >>> -             if (stm32_rproc_pa_to_da(rproc, rmem->base, &da) < 0) {
> >>> -                     of_node_put(it.node);
> >>> -                     dev_err(dev, "memory region not valid %pa\n",
> >>> -                             &rmem->base);
> >>> +             if (stm32_rproc_pa_to_da(rproc, res.start, &da) < 0) {
> >>> +                     dev_err(dev, "memory region not valid %pR\n", &=
res);
> >>>                       return -EINVAL;
> >>>               }
> >>>
> >>>               /*  No need to map vdev buffer */
> >>> -             if (strcmp(it.node->name, "vdev0buffer")) {
> >>> +             if (strcmp(res.name, "vdev0buffer")) {
> >>
> >> I tested your patches
> >
> > Thank you.
> >
> >> The update introduces a regression here. The strcmp function never ret=
urns 0.
> >> Indeed, it.node->name stores the memory region label "vdev0buffer," wh=
ile
> >> res.name stores the memory region name "vdev0buffer@10042000."
> >>
> >> Several remoteproc drivers may face the same issue as they embed simil=
ar code.
> >
> > Indeed. I confused myself because node 'name' is without the
> > unit-address, but this is using the full name. I've replaced the
> > strcmp's with strstarts() to address this. I've updated my branch with
> > the changes.
>
> This is not enough as the remoteproc core function rproc_find_carveout_by=
_name()
> also compares the memory names. With the following additional fix, it is =
working
> on my STM32MP15-DK board.
>
> @@ -309,11 +309,11 @@ rproc_find_carveout_by_name(struct rproc *rproc, co=
nst
> char *name, ...)
>         vsnprintf(_name, sizeof(_name), name, args);
>         va_end(args);
>
>         list_for_each_entry(carveout, &rproc->carveouts, node) {
>                 /* Compare carveout and requested names */
> -               if (!strcmp(carveout->name, _name)) {
> +               if (strstarts(carveout->name, _name)) {
>                         mem =3D carveout;
>                         break;
>                 }
>         }
>
> I just wonder if would not be more suitable to address this using the
> "memory-region-names" field.

That would be better as you shouldn't really care what a provider node
name is where-as "memory-region-names" is meaningful to the driver.

>
> The drawback is that we would break compatibility with legacy boards...

So not an option.

I think I'll have to fix this within the reserved mem code storing the
name or do something like the diff below. I'd like to avoid the
former. Using the original device_node.name is also problematic
because I want to get rid of it. We redundantly store the node name
with and without the unit-address. There's a lot of places like this
one where we hand out the pointer with no lifetime.

diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rp=
roc.c
index 1e949694d365..cdee87c6ffe0 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -239,7 +239,7 @@ static int stm32_rproc_prepare(struct rproc *rproc)
                                                   resource_size(&res), da,
                                                   stm32_rproc_mem_alloc,
                                                   stm32_rproc_mem_release,
-                                                  res.name);
+                                                  "%.*s",
strchrnul(res.name, '@') - res.name, res.name);

                        if (mem)
                                rproc_coredump_add_segment(rproc, da,
@@ -249,7 +249,7 @@ static int stm32_rproc_prepare(struct rproc *rproc)
                        mem =3D rproc_of_resm_mem_entry_init(dev, index,
                                                           resource_size(&r=
es),
                                                           res.start,
-                                                          res.name);
+                                                          "vdev0buffer");
                }

                if (!mem) {

