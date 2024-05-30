Return-Path: <linux-arm-msm+bounces-21153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E0F8D508D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 19:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C2661C22A14
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 17:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 737D8433D4;
	Thu, 30 May 2024 17:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPSnDGvK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967D045BE4;
	Thu, 30 May 2024 17:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717088876; cv=none; b=uZCA2Z0vOQgqliflV1//kDIRJWCUOdKtfJ9kWfolGUY0edbDv70hAnL+QH9ikmM5D609sljQx9IDRiTtSoM7aRnKgW1CI4cc3099GLK8UyMWWpju0qNSlAIUwwQg8oZDJiKQKx5Ff9EbNp6vIgGKD7NKEjeqs17GCTDjr++Ny6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717088876; c=relaxed/simple;
	bh=WcBgmLB800gWG14w0nx6MPzcQdMu6AzZ6ketuWKY9+s=;
	h=Content-Type:Mime-Version:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=ibOYoVYU2TG/XUstubGx8gBpxRHsFpXoSTtnd1VVnp2VHtJjq5NKgBoKd9gxfcXofniS7YeueiRVofExwN/Pd0w1Z47aBUd65jLMxqx5wcv0Jn39RZajb0WuDtzxIEHQ9STX+Q33PEoehyEq2GzVZj35Hov4ubkuf1sqP9WJ/cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPSnDGvK; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2e95a75a90eso11519951fa.2;
        Thu, 30 May 2024 10:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717088873; x=1717693673; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S754fL6eVqgTIUZX2+nFqHKkShFVnRKXXFJgDcc1ZDI=;
        b=gPSnDGvKQav99DE9NlpcI4PYeaAMSdL8r8Y1cpOJfRm0qNw4EXxaE2ltpfVmiY9NQF
         pQg3snkuEU/p9i+ylooLVLTAnPZNiGchXduEMxiEOAA18CUsSEDCECT9hVz3erYM7DTl
         6xCAiEYAsypc3leqHyUq2mmsbS/R3SqbOKbfT+aIOCauT4lKTrn6iX/oLjfnB3ii0aq1
         OEgpNTCe6Xr0LXI2Y8JRznyIrlZLh6p4llfPAC5DCmJoza/UHWSki1dVokG3fG9bSECX
         fv6j6uSY3fdXM2rrxy+svePxZqLiWy7ZgvWjZ17i/nejbBxwOcHnvwrG0sPx8ohzpf99
         J2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717088873; x=1717693673;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S754fL6eVqgTIUZX2+nFqHKkShFVnRKXXFJgDcc1ZDI=;
        b=L5s24eHkdTpnb9+euTsS0NLSwiX+/reudZnwIy1jyyJVAsizqSl+57BRiT/BVEqT1a
         YjBBKOeG5XPOVcmyH7u4oJ+chAVX7OfJPQ1tT7NEYHDf4dpCVlJ9xuqKQDbDGkzHVVxo
         SSETwOgWmXA30/e5EoY8CkLMF5M9BZQoDBJTEZPc1rkIqEdsqbbKt3DAhNTL0MquSk8r
         uDNXL+LJKjdwWt1jOdNH2JkC5UE10wbFbHI1WKg/uItSz3FEJvOahtqNtmbOherkeo/c
         tmsVj/buRKRwY5fk+tMmVSnp7MXqbspjCktSNLYWHRxiLZPZ8/HNqmkGzzI+KHQt+Ag4
         00YQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfMF3jv/MUAo/1OHRcEYh+RX8b0LC57SK4S0H8o/aH6j2EcbbzLoKEJVbxeKLdW98BGmzlTuTioXM1J4QZO0aLIluFe7atH5axhetQ58kPcJ5r0wUUPbXAX86lD+TmIyiXB8id7xP8Do81jorlflfufLdybUKrhN4XuVKseRpsZn29yBzG2Z8oUtZ9mAIn1VuYXOmT824iIIOPHr9UNN7zhg==
X-Gm-Message-State: AOJu0Yx76JdIMSiL3GRTGMpB7TIqnNLwVtwTUAq5+/zwmm5pYlcIEZ/5
	zqzikU3QLHA/O3YBXsHOI1aG5M8yTdbV3F6q8XSrvMqTIcTY9ZaB
X-Google-Smtp-Source: AGHT+IHwjTCFVGR50yNchGzCdFfdFMN0b/atDi7Tr/wiD7aw8w8AAvWmC3KTr7YpU1+nPKK4cCRg1g==
X-Received: by 2002:a2e:a417:0:b0:2ea:844b:1b16 with SMTP id 38308e7fff4ca-2ea84830962mr16211881fa.34.1717088872356;
        Thu, 30 May 2024 10:07:52 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421270ad410sm30167835e9.45.2024.05.30.10.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 10:07:51 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=e8d29550c8c6ecc345e96308e31e05adf5d0599eed8c116befc5ef55e617;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Thu, 30 May 2024 19:07:51 +0200
Message-Id: <D1N57DK5Z2XU.2VP8OXFUMC709@gmail.com>
Cc: "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>, "Jonathan Corbet" <corbet@lwn.net>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Sean Paul" <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, <workflows@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Masahiro
 Yamada" <masahiroy@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH] docs: document python version used for compilation
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Rob Clark" <robdclark@gmail.com>, "Jani Nikula" <jani.nikula@intel.com>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
 <878r0ijdh5.fsf@intel.com> <20240510102036.3ea40b37@sal.lan>
 <87o79ehtbz.fsf@intel.com>
 <CAF6AEGvTkL=JxGDaOab9XpJ4htWQnBA1dTEOUxBUTAavM0DB4w@mail.gmail.com>
In-Reply-To: <CAF6AEGvTkL=JxGDaOab9XpJ4htWQnBA1dTEOUxBUTAavM0DB4w@mail.gmail.com>

--e8d29550c8c6ecc345e96308e31e05adf5d0599eed8c116befc5ef55e617
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri May 10, 2024 at 10:04 PM CEST, Rob Clark wrote:
> On Fri, May 10, 2024 at 3:09=E2=80=AFAM Jani Nikula <jani.nikula@intel.co=
m> wrote:
> >
> > On Fri, 10 May 2024, Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> > > Em Fri, 10 May 2024 11:08:38 +0300
> > > Jani Nikula <jani.nikula@intel.com> escreveu:
> > >
> > >> On Thu, 09 May 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =
wrote:
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
> > >> > +Python (optional)      3.5.x            python3 --version
> > >>
> > >> Python 3.5 reached end-of-life 3=C2=BD years ago [1]. What's the poi=
nt in
> > >> using anything older than the oldest supported version of Python,
> > >> i.e. 3.8 at this time?
> > >
> > > What's the point of breaking compilation with on older distros?
> > > The idea of minimal versions here is to specify the absolute minimum
> > > version that it is required for the build to happen. If 3.5 is
> > > the minimal one, then be it.
> >
> > AFAICT 3.5 was an arbitrary rather than a deliberate choice. We should
> > at least be aware *why* we'd be sticking to old versions.
> >
> > Minimum versions here also means sticking to features available in said
> > versions, for Python just as well as for GCC or any other tool. That's
> > not zero cost.
>
> At this point, the cost to having a lower minimum version is pretty
> small, so I'm not worrying too much about it.
>
> Maybe once kernel developers discover mako, and start generating more
> at build time, we'll have to re-evaluate. ;-)

You're making an interesting point. Does the build dependency here
denote Python (& standard library) or do we assume that if people have
Python installed that they can also install arbitrary extra packages?
Would a Mako dependency need to be explicitly mentioned here?

Thierry

--e8d29550c8c6ecc345e96308e31e05adf5d0599eed8c116befc5ef55e617
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZYsmcACgkQ3SOs138+
s6GwDhAAk7AgMlJlfnIXUZpOj/rOLWcb600MiHHFNHwSQCe4Uth9OdBvDjdFqsUH
IOsRHerjzQEwlXmSafIOpXa2PZIdyxpGhW5b3regoBNfy9BeGgQLPyFwcQht6qh2
VI2nrMek6YghkNYEOJgj/mR3pKgPdubbvenIHKRqjoOVO+dviJfnRCWGyBAmD/A7
vBa21JJQ8xMZ4+uBFmwGfD6z3wzmNJejyeMTrSEspmmWzp1EouxwEy/gtUPv4xKQ
zC1HEk/hWUEYaFgY0zgsT+HH80QhfpO2A93RM/DhcON8UPG0zkPXjNGy7PR49kAm
8dHvyVnT42uD2ziXfp6sDAlCw5StvmPNyEDxltCBmZXWlana1DkQZarfNuBpuTBl
Uf1C2GBc1I9AjH0Dui+jdzBurfBTRi0p5OTMh4xtfTuBKLQnNwCZ+Loc+Ft4uzX1
ziaoZtR9q2PpElDhruxNAHH19a7DpfB71HYvcnhkrlpCH85ivsFIGditzYlMxuOK
uoMZchMwVyzqptRpyKHsfgaIYNWffFB/vmLI27m4HrRYGl5qg4tx7te8FK9RP7cC
mSM7KS36BA/BlJV9dLePmcKHylabI1HgJRKQ5nwFo5TyCHIh00EEpC01k7hcW/N3
qrVTwB7kDgm0w1udks5zBp0D9+xquWiRWF9uVpwLQOvTfzcp434=
=RSh3
-----END PGP SIGNATURE-----

--e8d29550c8c6ecc345e96308e31e05adf5d0599eed8c116befc5ef55e617--

