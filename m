Return-Path: <linux-arm-msm+bounces-19644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 457A28C21B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 12:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03C801F23E1A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 10:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1034F16C443;
	Fri, 10 May 2024 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VTMzpcLz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929D3160877;
	Fri, 10 May 2024 10:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715335754; cv=none; b=ebxJinoNaFh6Kgff8oEVdp/qhg+wNoUxa84X3qIFSC82reTlWYUk9VgtR5h1uqjTMb65hz6UkBpLN60jMNrc+TGcVbjJpJfEd9NMB+oxi1E+ByU45IGlv8C4K3fDc7CtBpl2V+JxeJY2w19ek6r/zO4anibBVQ7idlRpKwTvULk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715335754; c=relaxed/simple;
	bh=AUpf3wieelOW4Oybfw7FBJbRDJexa7/gEyn5W+WWBrE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=A7eOYW/Y2zYyp8gsEO4SPT2/LNlCYlFF6BoCCcX4fqxhgiHTpkzO0m2U+cEEkojFSWhul+6OVloyzOautWeDCkw0sv37g6RXbjRmxTikMpfV2NGm8epZCDbCXIv+qCD2HOt32FvJqv5j/CyAUG3ANEbJ5LR/iPgU8U3A/WlFd94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VTMzpcLz; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715335752; x=1746871752;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=AUpf3wieelOW4Oybfw7FBJbRDJexa7/gEyn5W+WWBrE=;
  b=VTMzpcLzbpLlxxYuTWlTe3i4DfCTpqJ4xvAYk+az369lA450D+4+HIxM
   O3U2yyhVRLIUzCLIPYdTKPbFOAMYQ8M1qbbX0EC0jP/rFeYt0DfolD8Bg
   SI5sdQv61Vr/o5PQsfXaacM01Vh1d4CM/ZFsZe+rZtnCbfvqpeO5XpLE5
   j+pWzYfBnMWs9A9xU8/ab7g6JRPsu36jx4pyvXZbeglehuzkIXgDARuzO
   ATQFMI6LGEnWTRPr05g/dGBX5gPXnc5lGidSLOTuPaX43KfefNj6vz9Fj
   tFYH0ow7cBgTxzV/gUJtaP7Bvj2iEBTJjLfv+i7PD4OEtMWBk9aEjCv9R
   Q==;
X-CSE-ConnectionGUID: hKXuJ10rRoiO4oJjsyXlDQ==
X-CSE-MsgGUID: do01SDn2SmGMBwPFYym54A==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="14259547"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="14259547"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 03:09:12 -0700
X-CSE-ConnectionGUID: fR+NzAfiSZibUFAxHTQi6g==
X-CSE-MsgGUID: CcL5EJ/iRV2+oDSx5Mhp+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="34087516"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.180])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 03:09:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jonathan Corbet
 <corbet@lwn.net>, Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada
 <masahiroy@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] docs: document python version used for compilation
In-Reply-To: <20240510102036.3ea40b37@sal.lan>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
 <878r0ijdh5.fsf@intel.com> <20240510102036.3ea40b37@sal.lan>
Date: Fri, 10 May 2024 13:09:04 +0300
Message-ID: <87o79ehtbz.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, 10 May 2024, Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> Em Fri, 10 May 2024 11:08:38 +0300
> Jani Nikula <jani.nikula@intel.com> escreveu:
>
>> On Thu, 09 May 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrot=
e:
>> > The drm/msm driver had adopted using Python3 script to generate regist=
er
>> > header files instead of shipping pre-generated header files. Document
>> > the minimal Python version supported by the script.
>> >
>> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> > ---
>> >  Documentation/process/changes.rst | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/Documentation/process/changes.rst b/Documentation/process=
/changes.rst
>> > index 5685d7bfe4d0..8d225a9f65a2 100644
>> > --- a/Documentation/process/changes.rst
>> > +++ b/Documentation/process/changes.rst
>> > @@ -63,6 +63,7 @@ cpio                   any              cpio --versi=
on
>> >  GNU tar                1.28             tar --version
>> >  gtags (optional)       6.6.5            gtags --version
>> >  mkimage (optional)     2017.01          mkimage --version
>> > +Python (optional)      3.5.x            python3 --version=20=20
>>=20
>> Python 3.5 reached end-of-life 3=C2=BD years ago [1]. What's the point in
>> using anything older than the oldest supported version of Python,
>> i.e. 3.8 at this time?
>
> What's the point of breaking compilation with on older distros?
> The idea of minimal versions here is to specify the absolute minimum
> version that it is required for the build to happen. If 3.5 is
> the minimal one, then be it.

AFAICT 3.5 was an arbitrary rather than a deliberate choice. We should
at least be aware *why* we'd be sticking to old versions.

Minimum versions here also means sticking to features available in said
versions, for Python just as well as for GCC or any other tool. That's
not zero cost.

I guess there are two angles here too. The absolute minimum version
currently required, and the, uh, maximum the minimum version can be
safely bumped to. Say, you want to use a feature not available in the
current minimum, how far up can you bump the version to?

Could we define and document the criteria (e.g. based on distros as you
suggest below) so we don't have to repeat the discussion?


BR,
Jani.

>
> -
>
> Now, a criteria is needed to raise the minimal version. IMO, the
> minimal version shall be at least the minimal one present on most
> used LTS distros that are not EOL.
>
> I would look for at least 4 such distros:
>
> - Debian
>
>   Looking at https://wiki.debian.org/LTS, Debian 10 EOL will be on
>   June, 2024.
>
>   Looking at:
>
> 	https://distrowatch.com/table.php?distribution=3Ddebian
>
>   Debian 10 uses python 3.7.3.
>
> - Looking at Distrowatch for openSUSE Leap 15.5, it uses Python
>   3.6.15 and has an EOL schedule for Dec, 2024.
>
> - RHEL 8.9 uses a bigger version than those two - 3.11.5 - again
>   looking at Distrowatch to check it.
>
> - SLES 15 SP4 and above uses Python 3.11, according with:
>   https://www.suse.com/c/python-3-11-stack-for-suse-linux-enterprise-15/
>
> From the above, IMO kernel shall support building with Python 3.6=20
> at least until the end of this year.
>
> Regards,
> Mauro

--=20
Jani Nikula, Intel

