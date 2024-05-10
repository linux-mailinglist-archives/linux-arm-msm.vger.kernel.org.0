Return-Path: <linux-arm-msm+bounces-19648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF6B8C2316
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 13:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73B4E1F2154D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 11:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F9616EC0C;
	Fri, 10 May 2024 11:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ihXfjw4m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B430554662;
	Fri, 10 May 2024 11:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715340120; cv=none; b=OAuByqCNrLmNBXIN5hKuqtAnFNQCIfZvsrx2tpQlJEDX4mtFFjsVXr/vW7vocLohGsYXdEGXGRKo8o5xR/h0XijYvEcRzS5mQ6BEXJwLwcB882YadPgp2JN+doUOCxfC9jdobH9++xjaU/8evbqUu22jXRrFZYXrVvAmdGUUpRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715340120; c=relaxed/simple;
	bh=HSGNzI8VBlGMlvbRbsd2ObIVJhvcS30eOk4bSfP6pl0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SGKBWPHDdtCNKpKZ6UiiuxFXjZ+YG5hxF3B93eAjLsyy7yhkO2q4cmyr6D4noWE5PEypxIcqVLWW63RTun8ExXvErUNq+yGq8B7BCtAtwBeZ0h89+2gqVntE4rQ2jK+jRhYeiRMKaKrjBwSQsjYkbZzOQXWmtNFVqLezuLktTsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ihXfjw4m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77CA4C113CC;
	Fri, 10 May 2024 11:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715340120;
	bh=HSGNzI8VBlGMlvbRbsd2ObIVJhvcS30eOk4bSfP6pl0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ihXfjw4mBP7X4WTIHWRYrSBF3iVhrYj3c4Dx5l+jpT+FTgsJffGRO9vSgHrM7zUOj
	 kOlXC4rU0xe8kX/Vro7lspV3JguR6RF+N1ERTAjFiVCf/vbxcdUh20Di/13AdAq4Jn
	 2SAEzUwnAIMnIsr5M7XU0f+0eH2wk9EACxYDCsz2wqfhADAPo3+ydQi3lMo4PurSPs
	 UT8KJCpOPJznFR3FMg1H8MQgq1cVEexFlEc6dV24BAvOi3yEzJgZ16+zZhNvXj67YS
	 o+iYYnxGzKicaIfalY9tSWfJYYggbPz/0e3U4c5WZ66vLghF5pUzH8QinBEBLaiZVB
	 wY7PMNUvznMoQ==
Date: Fri, 10 May 2024 12:21:52 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jani Nikula <jani.nikula@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada
 <masahiroy@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] docs: document python version used for compilation
Message-ID: <20240510122152.76e79ac9@sal.lan>
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
>=20
> After checking distros that I can easily use, I don't think I will be
> able to test the script with Python versions earlier than 3.7.3
> (Debian oldoldstable).
> I can try setting up Debian stretch (old-old-old-stable), which has
> Python 3.5 and so cover the needs of Jon.

Fedora 40 supports version 3.6 and above (plus 2.7):
	https://developer.fedoraproject.org/tech/languages/python/multiple-pythons=
.html

You could do something similar with Ubuntu/Debian:
	https://askubuntu.com/questions/682869/how-do-i-install-a-different-python=
-version-using-apt-get

Once an old version is installed, you can enable it with:

	$ python3.6 -m venv v3.6  # create the environment
	$ . v3.6/bin/activate

Then, if needed, install whatever dependencies are needed with pip,
inside the venv (for instance if you want to also test Sphinx, you
can install it there via pip).

I guess it should be possible to use a similar venv procedure with
older versions, but you may need to compile it from the sources if
you don't have binaries available for your distro.

Regards,
Mauro

