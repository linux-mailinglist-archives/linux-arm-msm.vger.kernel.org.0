Return-Path: <linux-arm-msm+bounces-21152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4AC8D507C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 19:06:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EE081C2092B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 17:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09E93FBB2;
	Thu, 30 May 2024 17:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HSTU9l1s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5040B224DE;
	Thu, 30 May 2024 17:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717088777; cv=none; b=QzWxtsx8Hqo3P4QqDByQLLwfRnY/DN1w+K5rlUtH8N6CUOIQL2IbDCEuEqMPgkS/Af7meCcTYwVC73JHfvaDNJq5k2Hz4XJ5M4lLV1YTjNjzz/scgv7b8uJ/BlXbwuAgKAGamDmcv1Voaq/5EOPa4Dn+Xg7A+alNTrxIe1cvXCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717088777; c=relaxed/simple;
	bh=NXLUfYeAt+KW40KaODAH3OyjjVWz8At5SnRU9pT24dQ=;
	h=Content-Type:Mime-Version:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=dCaeKdwg2ColRYuyXbfq9oDUXol6MXFcei/fGOZT73PmtjVL4GuyJAO0jfvmjrNky3tOcC183BC3Xin+mZVKKQRlHt/ed0OEAAiSkcUdhh85G/t9ULK18vNjnPjT1XYPqA7F52EY9rh58RxXPf2b5XmfWHcjn90Nn6vj2mMinLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HSTU9l1s; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4202ca70270so14469655e9.3;
        Thu, 30 May 2024 10:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717088775; x=1717693575; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pSoUzpghMgKgPNRSR5S6LQ+u83p2do0Jb8qm1RA2ZPk=;
        b=HSTU9l1svsWldED07tO2QLZv3cytQoEEYsdPpGVY0KBKXGDetGtB3uoA6ejYXeEBnb
         msGwrEegHZ/qPyAIscopS9xfE39SPLnthRiNbXgrx89MX8OdyZAEPWwP3eY6vqtRI3q0
         jCnsVAbOOOlFLl0N2EY+cTQG0sES2b4A0SwFWbHeSnHM7dmemxCwivXRjwcZKX+SGl44
         Mx1ptdLn+joFcc0lm5ytCLtIks1q9GY7HOe1pvLWyEL5bay5C49hJX5+Hol1XGlk4Rok
         x6LTrTLFkrZ0K6vqn6iDHbMwX6RLYe/Iu6csoda058ubDzMsORXE/iYJ+sGjg76gUduG
         PqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717088775; x=1717693575;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSoUzpghMgKgPNRSR5S6LQ+u83p2do0Jb8qm1RA2ZPk=;
        b=PK/futEYEN0qbocPGaYFBTo/8a5vw98PkCk3jKQimNyv5TQTHaCpHQLSuo+RUdbn3g
         TVMieT0k0TqaVAYE9idN/X0U7SnmwYV/bt12nO40H4zMM29nZcDfuv7HhJv+WrMpb3sm
         ooMVzZgYs7pZMFPL19d4MeICF0SxCo+FMhqx7ul4ooRuMfS67nAlZhhCw0cDvTU1F+mM
         yiS8uTrl0fsKMqY/erGtxi5AtSK/wpu1FxAdWXo0n1ZAQu9HrwgSgGBEI0fYecoRXsuE
         s0nkIZzF+WJapBv5zMCRCfw2HaoSOTAIiWezF5zFO/OOI4nruLLTiRFqEHZFDKzkY/UD
         twkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxgTfiC0BDJqldRqzun9TD8NdAd4bFsZa7p3qMEbBFDeu0Ibl+xhPFiO0XW46PcHTRIthJl3vkoafxys4OXX1f4Yez84a2FqngHbTebjAHy55pZp8fL8zZ1puTx+/Jzgw07IScbO9hCfrPf5p7hSyuwIMrBgnlZDOWfIYd0K+OAHxxGXeRXg==
X-Gm-Message-State: AOJu0YyFTrdXjj7LyYrXTnTPTLnF/G6JfZRxCP5FQzJxihtw7Th3cIbu
	MXDFvNCYocKtXXepqv8BfS45V/9tk4t0FvN3kpFNf82/kCzhXL2G
X-Google-Smtp-Source: AGHT+IE07+jFmD4tsq0YkWo2ZvEXF5/9W5Sn0y4kUj7pi2LLryIUNFMmQtrQNqIVHInfXzsH/nPW/A==
X-Received: by 2002:a05:6000:dd0:b0:35d:cc6e:9fab with SMTP id ffacd0b85a97d-35dcc6ea738mr1227194f8f.30.1717088774477;
        Thu, 30 May 2024 10:06:14 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dbdc776c3sm2833601f8f.61.2024.05.30.10.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 10:06:13 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=e14441a93509a3d277ebc86de6e5514a086381ac1db1c0825d540e138362;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Thu, 30 May 2024 19:06:13 +0200
Message-Id: <D1N564M136RW.3CRPYTGKMW1NP@gmail.com>
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Jonathan Corbet" <corbet@lwn.net>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>, "Rob Clark" <robdclark@gmail.com>, "Abhinav
 Kumar" <quic_abhinavk@quicinc.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>, "Sean Paul" <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>
Cc: <workflows@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Masahiro Yamada" <masahiroy@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH] docs: document python version used for compilation
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
 <87o79faq4a.fsf@meer.lwn.net>
In-Reply-To: <87o79faq4a.fsf@meer.lwn.net>

--e14441a93509a3d277ebc86de6e5514a086381ac1db1c0825d540e138362
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu May 9, 2024 at 6:48 PM CEST, Jonathan Corbet wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > The drm/msm driver had adopted using Python3 script to generate registe=
r
> > header files instead of shipping pre-generated header files. Document
> > the minimal Python version supported by the script.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  Documentation/process/changes.rst | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/process/changes.rst b/Documentation/process/=
changes.rst
> > index 5685d7bfe4d0..8d225a9f65a2 100644
> > --- a/Documentation/process/changes.rst
> > +++ b/Documentation/process/changes.rst
> > @@ -63,6 +63,7 @@ cpio                   any              cpio --versio=
n
> >  GNU tar                1.28             tar --version
> >  gtags (optional)       6.6.5            gtags --version
> >  mkimage (optional)     2017.01          mkimage --version
> > +Python (optional)      3.5.x            python3 --version
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>
> Is it really optional - can you build the driver without it?
>
> This document needs some help... I'm missing a number of things that are
> *not* marked as "optional" (jfsutils, reiserfsprogs, pcmciautils, ppp,
> ...) and somehow my system works fine :)  It would be nice to document
> *why* users might need a specific tool.
>
> But I guess we aren't going to do that now.  I can apply this, but I do
> wonder about the "optional" marking.

I guess it depends a bit on what exactly "optional" implies. It's
optional in the sense that you can easily disable the driver and then
build without Python.

So does "optional" mean that allmodconfig for all platforms builds
without the dependency? Or does it mean some definition of "core" kernel
builds for a set of defined platforms?

Maybe this really needs to be annotated with the exact Kconfig options
that need this. Although that could get out of hands rather quickly. At
some point we may have to list a *lot* of these options.

Alternatively, maybe Kconfig could be taught about build dependencies?

Thierry

--e14441a93509a3d277ebc86de6e5514a086381ac1db1c0825d540e138362
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZYsgUACgkQ3SOs138+
s6Freg/+LIh2+rKXPwb4yFREYQAFPpMlCXnGsILcqDxUm9SJdjAtMH9brNBWjjLu
+2fpXg9D2/DrUhtsW/hBYht1Y74Mvu+x32N9vc2P1IVwy02AQzCjjNUeT5COq7Av
GSVCn2funNAcTlXW0yLzywErepa9A5ba9Qynf2g/NirW7QygF0eyBWKj7bViybd9
JNVmpOFg/7YmATQbqxN3EAVbU96LTPxXEgnf38X2CBnBOkc7cSVlGnpXvxcCa/MC
uqA/JX5PPNbDR/ZKmVvhqrxLML11RXGEmNcxsWk8PMiEAV3sa/atjht/arY99TC0
3ln92bZj2efq/UOgkhbBMbEs69yG8gRaJUM7gKtmuU+8yy8KPm/xXJlzVCQ+t9j7
IV5OqhWze/yjaGLxcZ66zYvg5Roue5T537/C4wM1w2ksBG7CnqRn0Gd1ofskMNI3
NU7lZlfi5rU9oytk2CPK4EKW+QrUu5WgW2AZcRPOw1lCBnh4B4fJv4Z2BjFRp9xT
qxq5wduTgt43EtWrrR/15mke+P3l5gXdTeLMdA+M1TfU5z/UMGIQuahfaP8mO8XF
odg/vESBCl/jLwIYfuIskPsLHLEnund3PdLuHynSYoClnzeinm0KvkQIxaZs/QAA
C2sHCEAPWK7buSeUieAtzZh/9IeHFz9VP4gxwifN3NEgnBHhmlc=
=73sE
-----END PGP SIGNATURE-----

--e14441a93509a3d277ebc86de6e5514a086381ac1db1c0825d540e138362--

