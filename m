Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00F2C1EB9FE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2020 13:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgFBLC2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jun 2020 07:02:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbgFBLC1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jun 2020 07:02:27 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5430FC061A0E;
        Tue,  2 Jun 2020 04:02:27 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id w7so6046033edt.1;
        Tue, 02 Jun 2020 04:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xgkzO+n+OaR1PsIu6Y5TBKCmjAXGMbznUyr7FevGw1Y=;
        b=UFzbey8vdoQPyo1fDkaxCPS4iGMpGAadkgSJ+erXoeY62mKWRUFz3hcNGgMViPlMt6
         AzBaW5OjYZjGi9C15/5z7rAJ1uJpuhFJUOF3YRIJIMtgrc0EiiAqy8rajx3d9DRgrW+6
         c+yAk50O9FTR3FzuAQoCZ9Zhij24F/OcZobrs2PYlhE4fGHPU0U0M8W9VaWrYheS0l/V
         YgCvWCcnm+Sff3ypUP2XaKhTcHribLwzfqUkmZEL9Ana/ZJJxd5YNCeKjYjUdamxQ6OI
         o7DduFgW4ufoeD0iWjV5a5+56uj6VBETLcgrjMolq04qsRiDBz9Cd64ZRq8ukwWJEzqU
         L1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xgkzO+n+OaR1PsIu6Y5TBKCmjAXGMbznUyr7FevGw1Y=;
        b=KfrL4JN8F4cp9ULCpoHllsuBPgJgBJ+3P13X4YgDiQZTOKKEch3wMto5fKX8G+GZRd
         J103hPDymQA/tdIkJ/MRn+hqG48wiDNV7uHNsFSy3hBVaR4eCFsK51uaG/Vv64bktWoz
         XG0QarMdiLbie9LmT7uPvU7bGGLIOaktv4plqnf84PWsyMeHig0C3Z/3lIeIw9fCqD/K
         Ua0q2gmJsfTJ+lLcWHyPPVnHUHLTRPS2z61Tgi+P3fveLF5g1/DJG2yXvfMeu3S0LSwV
         EabYbyjlxkHrtp8Q4kQi30cd5/i9IlBtrHJAbzVDtIlwTtdX+1k1ST8pMw6uzfWU0tJL
         pSFg==
X-Gm-Message-State: AOAM530AveW3GmQMag3p/SifCHm2IVDKrORqmOknwy6c0lNOdbdDpsv8
        QhMnGa8yY/ApXl2S62pXan0=
X-Google-Smtp-Source: ABdhPJw82udMbDApJ+beV5fEl+EF6IRgM2MG0DNUBeiIVsIjkESu71dUiOyq5Ln1AnZkuwapXb8bgQ==
X-Received: by 2002:a05:6402:1d30:: with SMTP id dh16mr25188393edb.302.1591095745784;
        Tue, 02 Jun 2020 04:02:25 -0700 (PDT)
Received: from localhost (pd9e51079.dip0.t-ipconnect.de. [217.229.16.121])
        by smtp.gmail.com with ESMTPSA id s15sm1375913edw.54.2020.06.02.04.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 04:02:21 -0700 (PDT)
Date:   Tue, 2 Jun 2020 13:02:16 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Will Deacon <will@kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>,
        linux-tegra@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC 0/2] iommu: arm-smmu: Add support for early direct mappings
Message-ID: <20200602110216.GA3354422@ulmo>
References: <20191209150748.2471814-1-thierry.reding@gmail.com>
 <20200228025700.GA856087@builder>
 <20200514193249.GE279327@builder.lan>
 <CALAqxLVmomdKJCwh=e-PX+8-seDX0RXA81FzmG4sEyJmbXBh9A@mail.gmail.com>
 <20200527110343.GD11111@willie-the-truck>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline
In-Reply-To: <20200527110343.GD11111@willie-the-truck>
User-Agent: Mutt/1.13.1 (2019-12-14)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2020 at 12:03:44PM +0100, Will Deacon wrote:
> Hi John, Bjorn,
>=20
> On Tue, May 26, 2020 at 01:34:45PM -0700, John Stultz wrote:
> > On Thu, May 14, 2020 at 12:34 PM <bjorn.andersson@linaro.org> wrote:
> > >
> > > On Thu 27 Feb 18:57 PST 2020, Bjorn Andersson wrote:
> > >
> > > Rob, Will, we're reaching the point where upstream has enough
> > > functionality that this is becoming a critical issue for us.
> > >
> > > E.g. Lenovo Yoga C630 is lacking this and a single dts patch to boot
> > > mainline with display, GPU, WiFi and audio working and the story is
> > > similar on several devboards.
> > >
> > > As previously described, the only thing I want is the stream mapping
> > > related to the display controller in place, either with the CB with
> > > translation disabled or possibly with a way to specify the framebuffer
> > > region (although this turns out to mess things up in the display
> > > driver...)
> > >
> > > I did pick this up again recently and concluded that by omitting the
> > > streams for the USB controllers causes an instability issue seen on o=
ne
> > > of the controller to disappear. So I would prefer if we somehow could
> > > have a mechanism to only pick the display streams and the context
> > > allocation for this.
> > >
> > >
> > > Can you please share some pointers/insights/wishes for how we can
> > > conclude on this subject?
> >=20
> > Ping? I just wanted to follow up on this discussion as this small
> > series is crucial for booting mainline on the Dragonboard 845c
> > devboard. It would be really valuable to be able to get some solution
> > upstream so we can test mainline w/o adding additional patches.
>=20
> Sorry, it's been insanely busy recently and I haven't had a chance to thi=
nk
> about this on top of everything else. We're also carrying a hack in Andro=
id
> for you :)
>=20
> > The rest of the db845c series has been moving forward smoothly, but
> > this set seems to be very stuck with no visible progress since Dec.
> >=20
> > Are there any pointers for what folks would prefer to see?
>=20
> I've had a chat with Robin about this. Originally, I was hoping that
> people would all work together towards an idyllic future where firmware
> would be able to describe arbitrary pre-existing mappings for devices,
> irrespective of the IOMMU through which they master and Linux could
> inherit this configuration. However, that hasn't materialised (there was
> supposed to be an IORT update, but I don't know what happened to that)
> and, in actual fact, the problem that you have on db845 is /far/ more
> restricted than the general problem.

It doesn't sound to me like implementing platform-specific workarounds
is a good long-term solution (especially since, according to Bjorn, they
aren't as trivial to implement as it sounds). And we already have all
the infrastructure in place to implement what you describe, so I don't
see why we shouldn't do that. This patchset uses standard device tree
bindings that were designed for exactly this kind of use-case.

So at least for device-tree based boot firmware can already describe
these pre-existing mappings. If something standard materializes for ACPI
eventually I'm sure we can find ways to integrate that into whatever we
come up with now for DT.

I think between Bjorn, John, Laurentiu and myself there's pretty broad
consensus (correct me if I'm wrong, guys) that solving this via reserved
memory regions is a good solution that works. So I think what's really
missing is feedback on whether the changes proposed here or Laurentiu's
updated proposal[0] are acceptable, and if not, what the preference is
for getting something equivalent upstream.

Just to highlight: the IOMMU framework already provides infrastructure
to create direct mappings (via iommu_get_resv_regions(), called from
iommu_create_device_direct_mappings()). I have patches that make use of
this on Tegra210 and earlier where a non-ARM SMMU is used and where the
IOMMU driver enables translations (and doesn't fault by default) only at
device attachment time. That works perfectly using reserved-memory
regions. Perhaps that infrastructure could be extended to cover the
kinds of early mappings that we're discussing here. On the other hand it
might be a bit premature at this point because the ARM SMMU is the only
device that currently needs this, as far as I can tell.

Thierry

[0]: https://patchwork.ozlabs.org/project/linux-tegra/list/?series=3D164853

> Could you please try hacking something along the following lines and see
> how you get on? You may need my for-joerg/arm-smmu/updates branch for
> all the pieces:
>=20
>   1. Use the ->cfg_probe() callback to reserve the SMR/S2CRs you need
>      "pinning" and configure for bypass.
>=20
>   2. Use the ->def_domain_type() callback to return IOMMU_DOMAIN_IDENTITY
>      for the display controller
>=20
> I /think/ that's sufficient, but note that it differs from the current
> approach because we don't end up reserving a CB -- bypass is configured
> in the S2CR instead. Some invalidation might therefore be needed in
> ->cfg_probe() after unhooking the CB.
>=20
> Thanks, and please yell if you run into problems with this approach.
>=20
> Will

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7WMbMACgkQ3SOs138+
s6FS7hAAjnzmOGg8TMxb0NhiGM6QcXO3Js8Tej1WhHH/3E6vxv+RV6kunncGhxwH
Iw3wyGnqbwRjjzCdM+tgojDnyi+eEeb5961WbNoEmWZFJtk2ARhOxbjizxbH8ZNo
GZnKiYKHRk4VamcBxHZGgzRyhxAi1GPYGgoCmDbf0lzkvX3fydaurT3UBtlcxUC0
rBRIZppeNMFqzyyX1derKVtrLrsSIlZtdIl08tPvD+pDdpIoglxx3+JRI0oO6ESU
4uDUHipo8Ww1uRzEnEwWi1RAOAtl+M17QGlAl6OF33N2+m7bvHcyAlTYJDzksNHB
jNd8q7obRseZkGsUdbmYkW7ZJDYFa6ygQr2iEUQuGoqcQKY4eQcxRCdM2GsgzLzv
YpIFRsSfuRK1f/+YmanGqPLP+K0LQ1fP/QxllEuk+taQyFmEYn27VwWnGZBNT/cm
j5RZWrReSHcRDCDolUGlBAoWsqIOrk2qYH+z3gWBcaK+YZ+8uEZldXmX+RXNq/IX
XKKkYBioF5UnYhx0u0AB964vGKLYnalp5ajSyEWybbWFLaj/SYdLTShmz3bffy0L
rEldzwfiSS3uhmtAjSFOAhjHtnr1ExCXxrMiyGP6XEeOOfmQCe6fOOuM1GSytIaP
AlC/E7XjsbPeVjUvYffk0a0lK7x1WMuPYOq6RBVVACkVvH6G8Uo=
=0kMT
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
