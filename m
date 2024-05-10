Return-Path: <linux-arm-msm+bounces-19643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE4C8C20C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 11:20:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9ED511F21410
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 09:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D463160877;
	Fri, 10 May 2024 09:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HhD7eivR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2CC1607A3;
	Fri, 10 May 2024 09:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715332853; cv=none; b=GjxIV7UiQ3GBWU9B/vIniV3a8zphzVRU1ZBn1oQr4QGzkVI7xSSqsJu0a5rcVGvc0o5ztyLTEfWeOJYPpR8BHAJDeglV+p7w1yH98JPyX5Z4spzSfTLwyxxP/fZDsU8cIYixHHlC891ukHUFL8pRoP33IF1JS0oHptnCmtOgLYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715332853; c=relaxed/simple;
	bh=AxwApNMrl0If02f8zgxWuzVZRRdNUt9GnNFM8XGVwGE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BUDw8W8H5kO4tUvZj21CM8Chbl8nEw+vRvU1zO6+BnIPtA5rczEBRypaDuDNn0Ne60anh/3P9EVFJz+AM6im+ayRulJdKLi90cYMWaHSVZgxhqejdDQXkEBIzfxiZCqFRcAFXtCf2OjkCETWrludEcd2ueiqDKILLLCVSme/j/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HhD7eivR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE08C2BD11;
	Fri, 10 May 2024 09:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715332853;
	bh=AxwApNMrl0If02f8zgxWuzVZRRdNUt9GnNFM8XGVwGE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HhD7eivRAHbJ3IYYPaM5LFruHmwMlsw66b4VN+OkyMT7k05DneC7BwsD/+ZCASNZM
	 H5C4sl6cp23hvujJoJck5jF9/+WNJrsx8yHhFoxUJqvhmKIrn3mM+Uu4cxSU+luwrX
	 DeQwKp/wiku5eg1u6nHC2hgYhxt54/P3KrSbRUxFweMO+nvH1J2F68YGFKrWeGl9BX
	 LpvINgXg9f9Wuvx4zy0CfI2Ud3V9LkrQJWXTbcLVMeD8ZIw3djcDaMxHTyAzEhA482
	 Du7npEWQ7r2vww0gblMOR32u2hUpIUO/BPqEfpkeIg9xN4svfNzVrush3wPUtnnQlK
	 6s3SE8oWPYeMg==
Date: Fri, 10 May 2024 10:20:44 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jonathan Corbet
 <corbet@lwn.net>, Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada
 <masahiroy@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] docs: document python version used for compilation
Message-ID: <20240510102036.3ea40b37@sal.lan>
In-Reply-To: <878r0ijdh5.fsf@intel.com>
References: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
	<878r0ijdh5.fsf@intel.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Fri, 10 May 2024 11:08:38 +0300
Jani Nikula <jani.nikula@intel.com> escreveu:

> On Thu, 09 May 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > The drm/msm driver had adopted using Python3 script to generate register
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
> > @@ -63,6 +63,7 @@ cpio                   any              cpio --version
> >  GNU tar                1.28             tar --version
> >  gtags (optional)       6.6.5            gtags --version
> >  mkimage (optional)     2017.01          mkimage --version
> > +Python (optional)      3.5.x            python3 --version =20
>=20
> Python 3.5 reached end-of-life 3=C2=BD years ago [1]. What's the point in
> using anything older than the oldest supported version of Python,
> i.e. 3.8 at this time?

What's the point of breaking compilation with on older distros?
The idea of minimal versions here is to specify the absolute minimum
version that it is required for the build to happen. If 3.5 is
the minimal one, then be it.

-

Now, a criteria is needed to raise the minimal version. IMO, the
minimal version shall be at least the minimal one present on most
used LTS distros that are not EOL.

I would look for at least 4 such distros:

- Debian

  Looking at https://wiki.debian.org/LTS, Debian 10 EOL will be on
  June, 2024.

  Looking at:

	https://distrowatch.com/table.php?distribution=3Ddebian

  Debian 10 uses python 3.7.3.

- Looking at Distrowatch for openSUSE Leap 15.5, it uses Python
  3.6.15 and has an EOL schedule for Dec, 2024.

- RHEL 8.9 uses a bigger version than those two - 3.11.5 - again
  looking at Distrowatch to check it.

- SLES 15 SP4 and above uses Python 3.11, according with:
  https://www.suse.com/c/python-3-11-stack-for-suse-linux-enterprise-15/

=46rom the above, IMO kernel shall support building with Python 3.6=20
at least until the end of this year.

Regards,
Mauro

