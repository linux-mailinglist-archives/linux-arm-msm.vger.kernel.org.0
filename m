Return-Path: <linux-arm-msm+bounces-19647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5BD8C2255
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:39:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 387DC1F21A85
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 10:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC0D168AF6;
	Fri, 10 May 2024 10:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qnI3iFRZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC50152791
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 10:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715337571; cv=none; b=MeOrVxQ9kJIMApatIoYwhZbOcsdIWxM4s3leEeshXXd68bBlMpZ2/aEcKjR0zQI5/stqRWAIpc4ScOKRDnjzPuqeFLVfmG9/yUcijVWps5ptQjhS4Se63JBLQIZO+IziGEzHnoywqpOpVNj7qb0/YbKSyr/6Hg82RUIuZFNDyU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715337571; c=relaxed/simple;
	bh=lLJtm4L0AX5mYOMOb1gomKwZfQddQsuNknBSIw8ZMNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p+pxAIaVJlGtnRrNHwMGFZW30OYqgE6jTeUpOaCEGYcHoXczXmrTom+WAxP1pwQe8zCMdF1b6v+oaWny5viOalof/II+QLxFA6aVkFNVSAZ4JkeJtl2wwqRJijNZwHEkU7MLgovbUoo/6veRgVCCqcTKT8lP8GuVS4f9VTHoAdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qnI3iFRZ; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dc6cbe1ac75so1380987276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 May 2024 03:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715337568; x=1715942368; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lSdbA5qcDd+aDIma3WfgeZKWbBykON/+pmgqe3sFuHA=;
        b=qnI3iFRZeef+kYvsFuRy+W8ViLKrHwWoL+nDHGuzvAC79PAoYrLcxMA4QjUqhwm+Na
         wgTtcDTe9Jd5PK6jCtZciIN7YC5TchHsGSQKQPtdzlu1jKLsXVVehY0P7TINb0noG1Kq
         nceeyogium/QZgp3cP+FCTkdHY0nUWIXc9yhTZY7Exd1bITcV6wYTRxFruQ9rBVAB4Jx
         BZ2qFeBt/HOQX67n7hOILLptIz41rVgcvD0WKZk8zvw7YTxY6bDM6Mg79cPClo0ok5TJ
         k6bg3C9zWKEtgAvxsQsdbw9N4QgK4LWg7Velwr8RdPao1txCAnUB7m40xZ9LAsv9YWXR
         hMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715337568; x=1715942368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lSdbA5qcDd+aDIma3WfgeZKWbBykON/+pmgqe3sFuHA=;
        b=CaLsG3cPWST8r76E4PdYhOr/SihuMsxoMun7uiDiURJPlK7AtNq7A87B0GoNAGTBa+
         cH8fq0XyxiLgacdAcZkJgPJrcZOheoTXrcyic996ZAc7Uc7FizaYbq4wmJx1ofmMRSe0
         KlbNyLzywK/xw7ya7+ZyCOjHByXD89Z0sEfvJXz+UJcj/+3lQp2tUTsPBEsOcWvG1X5x
         ECPVzW870J8UBjKYC5waaUGE6Dv5Jr8zuTE2CjgkB09YTZfS2f9z3VAjJ2M1dv0FKvI9
         IIcOYVtrWSPNQsd9lU1zrXKSlEzNcoM77fzlFmTcV2WLUQeQ7v9/KBzt0hiNr3ergQHA
         92og==
X-Forwarded-Encrypted: i=1; AJvYcCUeoRvvgmncZdnQZICC1iioCCijTAqgRAzKZF74PaX8e+B2qVxdcENypFaTjOvOw4B4KOfugvZNJIpYg4AnZ8o0CM4AXUAFHmG4cz7vWw==
X-Gm-Message-State: AOJu0Yy29difoGk/K8h6ykXvldfYSfjjOHrxa930557n0BzBh+FHJZo8
	QnMMFIGRyCYHfe8+ALRo0Q8bK4f5+DZl3HS8oZE99yvM4dSN6Bfp6iMJ6WShi+e6JvafTFBLOgn
	jPRvoTzAvD/i5lw5PGbNjCTyD0hKF0pHT2kK1FQ==
X-Google-Smtp-Source: AGHT+IE60A+Q6FsjMepyIFHqpurncO2vDMU31WvgWXjOym8lcgrnre7Psf41fL/Tzu+g3TUoglYPMxGy1JdpTZZOp70=
X-Received: by 2002:a25:9e11:0:b0:de4:5c34:b8d6 with SMTP id
 3f1490d57ef6-debcfb72954mr4114585276.8.1715337568134; Fri, 10 May 2024
 03:39:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
 <878r0ijdh5.fsf@intel.com> <20240510102036.3ea40b37@sal.lan> <87o79ehtbz.fsf@intel.com>
In-Reply-To: <87o79ehtbz.fsf@intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 10 May 2024 13:39:17 +0300
Message-ID: <CAA8EJprcjDnpsriXOrRO4cVh5Sm9KDbHbsyKePru=6pn0-bfJA@mail.gmail.com>
Subject: Re: [PATCH] docs: document python version used for compilation
To: Jani Nikula <jani.nikula@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 10 May 2024 at 13:09, Jani Nikula <jani.nikula@intel.com> wrote:
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

From my side, the 3.5 was chosen basing on the previous feedback from
Jon Hunter: https://lore.kernel.org/dri-devel/20240412165407.42163-1-jonath=
anh@nvidia.com/

After checking distros that I can easily use, I don't think I will be
able to test the script with Python versions earlier than 3.7.3
(Debian oldoldstable).
I can try setting up Debian stretch (old-old-old-stable), which has
Python 3.5 and so cover the needs of Jon.

>
> Minimum versions here also means sticking to features available in said
> versions, for Python just as well as for GCC or any other tool. That's
> not zero cost.
>
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



--=20
With best wishes
Dmitry

