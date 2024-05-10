Return-Path: <linux-arm-msm+bounces-19649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 802928C23BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 13:39:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 206261F21720
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 11:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90960168AFC;
	Fri, 10 May 2024 11:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tcF4nxlg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E04621340;
	Fri, 10 May 2024 11:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715341161; cv=none; b=ThLnPiIDqssLzxy5NeOHGGNnTjDPeo8yaLKsTgBW/+ccTOWB0z7chxzbVOKGMiQhV+1akY4yIrhM/prXYDJyR/qc+w7IWYVRWguts6+xCg1xXXWs3L+a9t2bMkpipSi58bAV1aFcETrnTXtuzTMRchiXvrAb2+2KfChN5ujX1tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715341161; c=relaxed/simple;
	bh=gBgODkg3DdI9NzHPa1K7qm2JszTbSglDjzlA/h4YKWM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uDsiAw70Modtv15d8qJFMSt6cdvb9mjAqvYyiHcFK3BeerDj+AJw5ikNO5du27Q89cj4o2BvVoDrYI+AHEhXy4DU4eO/ovR0MYL+aSNewvyjt+oKtvlYWZqZSOOXrZ+PcizMxxNwSx+OrOMyOUa/WtwU4up3xa/QWe4MvQqy3kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tcF4nxlg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD37EC113CC;
	Fri, 10 May 2024 11:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715341160;
	bh=gBgODkg3DdI9NzHPa1K7qm2JszTbSglDjzlA/h4YKWM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tcF4nxlg0QDEweWZwzWRCeVMhoRIu7J1gmdn73ynftzzX5dbSA1P4W8ujpGv0+jrm
	 nbOzvPAqUbgaOYo/PdyUL81APw3bP5ZqUlEA1bv2v06ThVSZ+1EGMPEOkJGIiyfYGJ
	 kCkxZxWZtBeI1+Ib7DROy4aZjp3wcPfVzFz4kwz+SAnlI9U2RPXX7ELddRRwyhmnGF
	 djstVSRcMGs3bD5X3DNa8uPLVYL5h5TL6IyZsAv6NnYu8t3K0W+2r1dDyIki3R/AJK
	 NVBFC0k1dteGFqP6NSb5O4MZkFfK9HiWqs8V/gqLo9ApsQQzr7m7Unm72abzdxhsLM
	 EC1q/CFOAekrQ==
Date: Fri, 10 May 2024 12:39:11 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jani Nikula <jani.nikula@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada
 <masahiroy@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, Jon
 Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] docs: document python version used for compilation
Message-ID: <20240510123911.34f050b5@sal.lan>
In-Reply-To: <CAA8EJprcjDnpsriXOrRO4cVh5Sm9KDbHbsyKePru=6pn0-bfJA@mail.gmail.com>
References: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
	<878r0ijdh5.fsf@intel.com>
	<20240510102036.3ea40b37@sal.lan>
	<87o79ehtbz.fsf@intel.com>
	<CAA8EJprcjDnpsriXOrRO4cVh5Sm9KDbHbsyKePru=6pn0-bfJA@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Fri, 10 May 2024 13:39:17 +0300
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> escreveu:

> On Fri, 10 May 2024 at 13:09, Jani Nikula <jani.nikula@intel.com> wrote:
> >
> > On Fri, 10 May 2024, Mauro Carvalho Chehab <mchehab@kernel.org> wrote: =
=20
> > > Em Fri, 10 May 2024 11:08:38 +0300
> > > Jani Nikula <jani.nikula@intel.com> escreveu:
> > > =20
> > >> On Thu, 09 May 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =
wrote: =20
> > >> > The drm/msm driver had adopted using Python3 script to generate re=
gister
> > >> > header files instead of shipping pre-generated header files. Docum=
ent
> > >> > the minimal Python version supported by the script.
> > >> >
> > >> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >> > ---
> > >> >  Documentation/process/changes.rst | 1 +
> > >> >  1 file changed, 1 insertion(+)
> > >> >
> > >> > diff --git a/Documentation/process/changes.rst b/Documentation/pro=
cess/changes.rst
> > >> > index 5685d7bfe4d0..8d225a9f65a2 100644
> > >> > --- a/Documentation/process/changes.rst
> > >> > +++ b/Documentation/process/changes.rst
> > >> > @@ -63,6 +63,7 @@ cpio                   any              cpio --v=
ersion
> > >> >  GNU tar                1.28             tar --version
> > >> >  gtags (optional)       6.6.5            gtags --version
> > >> >  mkimage (optional)     2017.01          mkimage --version
> > >> > +Python (optional)      3.5.x            python3 --version =20
> > >>
> > >> Python 3.5 reached end-of-life 3=C2=BD years ago [1]. What's the poi=
nt in
> > >> using anything older than the oldest supported version of Python,
> > >> i.e. 3.8 at this time? =20
> > >
> > > What's the point of breaking compilation with on older distros?
> > > The idea of minimal versions here is to specify the absolute minimum
> > > version that it is required for the build to happen. If 3.5 is
> > > the minimal one, then be it. =20
> >
> > AFAICT 3.5 was an arbitrary rather than a deliberate choice. We should
> > at least be aware *why* we'd be sticking to old versions. =20
>=20
> From my side, the 3.5 was chosen basing on the previous feedback from
> Jon Hunter: https://lore.kernel.org/dri-devel/20240412165407.42163-1-jona=
thanh@nvidia.com/

Patch there seems small/simple enough if it is all it takes for 3.5.

Yet, it would be nice to hear from Jon Hunter about the rationale
for 3.5 support (if any).

> > Minimum versions here also means sticking to features available in said
> > versions, for Python just as well as for GCC or any other tool. That's
> > not zero cost.
> >
> > I guess there are two angles here too. The absolute minimum version
> > currently required, and the, uh, maximum the minimum version can be
> > safely bumped to. Say, you want to use a feature not available in the
> > current minimum, how far up can you bump the version to?
> >
> > Could we define and document the criteria (e.g. based on distros as you
> > suggest below) so we don't have to repeat the discussion?

Agreed. While we should not bump version randomly, defining a
criteria about when we should update the requirement sounds a great idea.

For me, the criteria is:

- the minimal version shall be at least the minimal one required for the
  Kernel to build at the most used LTS distros that are not EOL, e. g.:=20
  Debian, openSUSE/SUSE, CentOS/RHEL and Ubuntu LTS[1].

[1] In practice, Ubuntu LTS usually has a python version newer than
    Debian LTS, and CentOS versions are identical to RHEL ones, so
    I guess checking for Debian, openSUSE, SUSE and RHEL should be
    enough.

Regards,
Mauro

