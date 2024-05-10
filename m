Return-Path: <linux-arm-msm+bounces-19725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E26C8C2AE3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 22:04:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AF201F25407
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 20:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C47E64D13F;
	Fri, 10 May 2024 20:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a4bxUDBF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D6A4D13B;
	Fri, 10 May 2024 20:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715371457; cv=none; b=VvHKfGAzujG8Ro/cZKycBY7esH1/9vRCYdo1xPNUbCPrX88I/wDd+CMbdILxzrgsNJH9xTKrVhKi2VWiqgfIgzaXEmEp6dcE0WZvakdvfVQoF8XNDnoz62gBf12JWtv65HQaxpWwd0pj3tkecKX0C2iTVNI1+PfqL5sTRwvTh/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715371457; c=relaxed/simple;
	bh=NTpJ5mZLyP6kU52VSGq8JCs19pLGgOI5J6ZUilwq1Is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=al6HnbipnId9sO2t4SpCQuR/7XsHJEIp5sznz1KAhF0kipGXPAMYqCqPIHQfTDf/EkFqIZmiqMQPAs+ziage3roX9cHF0n45BqW6Amn7RZP7SXpDeqB3769yL0S1k8H3pNZuCUQuqbvNjYlHDsJ9n2S9YMtzJzKAMEU7QoC3PtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a4bxUDBF; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a59c5c9c6aeso597077966b.2;
        Fri, 10 May 2024 13:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715371454; x=1715976254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3w76oPIiLr/d19BookiO28Dm/LSyOamo5VRLJKyQTcM=;
        b=a4bxUDBF/gNoLhLYzxabqHaqH+iL5fBp1yb1RhGZ8kYa3J+9U0D3s8XlO3ecIlb76K
         Hb3Aht3KioU2Sd4Mg3Du/meFFj7v4HAyd9AWKUT3Fb8XTu/7NlI+6lh0jbOg+pOS5CJK
         LPy3TB0T1A5Z8Y06bstvFWWNViHVV8PbrZtFszp+4iMkAAyoCzeqwX6v9/8+O2CRbCBC
         whlzvZQVsywsso1aaxamGab2J0TEQtaJWBFVKWfJP6otDWi5hW+JG2BmRJea0h6WaQJY
         o93RndoA963j97NFF3ga1Y+0XxKTr7yC5p8oZUtlnGqTbSjYhX2JyNhxbcO0QTJtix00
         9RrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715371454; x=1715976254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3w76oPIiLr/d19BookiO28Dm/LSyOamo5VRLJKyQTcM=;
        b=xUZm41sul/zOvwVsqI4Gr901nhAurfxSBXE59H8I9ygXPhCVQSHKRlNISBlPLKQnpd
         eApxiSYaFr7eYHf82zrLzGPMBnDb3L6d5kaAVxM0GEKNhSHzy6aXTBblcd87XNEVpVXp
         RpRtrU+qRNY/m6kGlXh/nT03rbB4A4XCvJl0jaqxBrxIqljWPJ6BLD3hpeIePTYZ8SCr
         q9eo8jlGEE/Nsvp+4cPb2cISi/6LV2oJ9pKsZbK215PtYf58cv/rkd425ZuhXH3ACIwQ
         F7xcoRf8iNaYEiHx0Svpato/c0+JiAi7ChXMmjXvhcE1Aeioq9K9vdVQYQn9D7YaLLhn
         La7g==
X-Forwarded-Encrypted: i=1; AJvYcCW+U399z6u07Axk4PS1CRhKNA2HNJblAYlhN0ucapJVKs6ShirNzH06Qm9/QBprcl1zYxT0CEFO9WzH6qzo3IxSMwxx+9x0izxSA9Kz5q9aIYIf1ao8kNe7XvW7f/SGoC9Jze1f0TeaKTg9vNABmLBqhBit9Hw4oz7qoXClo5E/8s2ExwJw/EaOMEcO21TNEoKC105MfTBRoYqyyGJGGxCtXw==
X-Gm-Message-State: AOJu0Yx+DBVB7Rx/BtbvGrVgh/6z3I98ygK4Gq6dI1nNXsGM4O+8GhXl
	98dY1HFemG0L7YUqWEJ9ePPVjsYVBXWMtl2lhApM/LNmzeXAI3m3RvWZ7++06r2MFLLjhnmUrcy
	gxc4VB9Z5IgBYuG2LtHIqPq52Aho=
X-Google-Smtp-Source: AGHT+IEOZIt/kgQAQ9S2hYehUkMrxzbU+PDxfVocTwJSC9s/TAZ5/r2D+c6d3cBlKbP4DaN8BXoB1u0mHygG1fPm6z4=
X-Received: by 2002:a50:9e61:0:b0:566:d333:45e8 with SMTP id
 4fb4d7f45d1cf-5734d5ce24fmr2906201a12.20.1715371454083; Fri, 10 May 2024
 13:04:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
 <878r0ijdh5.fsf@intel.com> <20240510102036.3ea40b37@sal.lan> <87o79ehtbz.fsf@intel.com>
In-Reply-To: <87o79ehtbz.fsf@intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 10 May 2024 13:04:02 -0700
Message-ID: <CAF6AEGvTkL=JxGDaOab9XpJ4htWQnBA1dTEOUxBUTAavM0DB4w@mail.gmail.com>
Subject: Re: [PATCH] docs: document python version used for compilation
To: Jani Nikula <jani.nikula@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 3:09=E2=80=AFAM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> On Fri, 10 May 2024, Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> > Em Fri, 10 May 2024 11:08:38 +0300
> > Jani Nikula <jani.nikula@intel.com> escreveu:
> >
> >> On Thu, 09 May 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wr=
ote:
> >> > The drm/msm driver had adopted using Python3 script to generate regi=
ster
> >> > header files instead of shipping pre-generated header files. Documen=
t
> >> > the minimal Python version supported by the script.
> >> >
> >> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> > ---
> >> >  Documentation/process/changes.rst | 1 +
> >> >  1 file changed, 1 insertion(+)
> >> >
> >> > diff --git a/Documentation/process/changes.rst b/Documentation/proce=
ss/changes.rst
> >> > index 5685d7bfe4d0..8d225a9f65a2 100644
> >> > --- a/Documentation/process/changes.rst
> >> > +++ b/Documentation/process/changes.rst
> >> > @@ -63,6 +63,7 @@ cpio                   any              cpio --ver=
sion
> >> >  GNU tar                1.28             tar --version
> >> >  gtags (optional)       6.6.5            gtags --version
> >> >  mkimage (optional)     2017.01          mkimage --version
> >> > +Python (optional)      3.5.x            python3 --version
> >>
> >> Python 3.5 reached end-of-life 3=C2=BD years ago [1]. What's the point=
 in
> >> using anything older than the oldest supported version of Python,
> >> i.e. 3.8 at this time?
> >
> > What's the point of breaking compilation with on older distros?
> > The idea of minimal versions here is to specify the absolute minimum
> > version that it is required for the build to happen. If 3.5 is
> > the minimal one, then be it.
>
> AFAICT 3.5 was an arbitrary rather than a deliberate choice. We should
> at least be aware *why* we'd be sticking to old versions.
>
> Minimum versions here also means sticking to features available in said
> versions, for Python just as well as for GCC or any other tool. That's
> not zero cost.

At this point, the cost to having a lower minimum version is pretty
small, so I'm not worrying too much about it.

Maybe once kernel developers discover mako, and start generating more
at build time, we'll have to re-evaluate. ;-)

BR,
-R

> I guess there are two angles here too. The absolute minimum version
> currently required, and the, uh, maximum the minimum version can be
> safely bumped to. Say, you want to use a feature not available in the
> current minimum, how far up can you bump the version to?
>
> Could we define and document the criteria (e.g. based on distros as you
> suggest below) so we don't have to repeat the discussion?
>
>
> BR,
> Jani.
>
> >
> > -
> >
> > Now, a criteria is needed to raise the minimal version. IMO, the
> > minimal version shall be at least the minimal one present on most
> > used LTS distros that are not EOL.
> >
> > I would look for at least 4 such distros:
> >
> > - Debian
> >
> >   Looking at https://wiki.debian.org/LTS, Debian 10 EOL will be on
> >   June, 2024.
> >
> >   Looking at:
> >
> >       https://distrowatch.com/table.php?distribution=3Ddebian
> >
> >   Debian 10 uses python 3.7.3.
> >
> > - Looking at Distrowatch for openSUSE Leap 15.5, it uses Python
> >   3.6.15 and has an EOL schedule for Dec, 2024.
> >
> > - RHEL 8.9 uses a bigger version than those two - 3.11.5 - again
> >   looking at Distrowatch to check it.
> >
> > - SLES 15 SP4 and above uses Python 3.11, according with:
> >   https://www.suse.com/c/python-3-11-stack-for-suse-linux-enterprise-15=
/
> >
> > From the above, IMO kernel shall support building with Python 3.6
> > at least until the end of this year.
> >
> > Regards,
> > Mauro
>
> --
> Jani Nikula, Intel

