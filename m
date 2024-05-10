Return-Path: <linux-arm-msm+bounces-19639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 749B68C1F7B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 10:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AE531F2251A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 08:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7B615FCE5;
	Fri, 10 May 2024 08:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PokyhJOC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DC31607AF;
	Fri, 10 May 2024 08:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715328535; cv=none; b=tqIezC1n2HaRmOeWUM4Ve5wakp3TzQbe87p+1i2XaW5a18TlazAL4sHDwTvTXjs4lFrYtY7SBnkJg5DE4cDM97gab/5fojiGjOPYIuKVCOQjCs8egFZES0xcrMtMHMwwgoZFbn+HJm88d1ZnjphKgxWxGOw75hpKEIfNh8XinWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715328535; c=relaxed/simple;
	bh=WLilInU9CMgqlUDg6TUAP/uNgawnkqlXH6y0EJ/kbsY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=L2HVGOvghjVF2cXFLN7FFcClLvOqgoz2AVp5weUFj4nC7Ezryd5oeKK+oMVCVOm/qatL2xqv7bu3krHz6ZAQD6hK3iMP49q6zZmdyQP4YH3+dOC/YuDi7xzEGWUFYOrBx+8Bb8RtGmkTWjycRsIQBqtUaqRWUco9AdKjQ7Gp0pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PokyhJOC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715328535; x=1746864535;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=WLilInU9CMgqlUDg6TUAP/uNgawnkqlXH6y0EJ/kbsY=;
  b=PokyhJOCYpj2P9xO6UYcfWmElKwVzYPMrQQPSUz8SGpB5APEZRgG5Zqc
   cGFG6lMyEuuTrMj4VWczTf2uKKh3yFEMg5J27fh4/8v/u+rKDHRnF/N2V
   rL7SBSgwfCBtkyAl6VoRYB6IRyWVbKeeGNnXI5OEvDNrJSklIDaJnTKXF
   PpOa6GxIAp4/AXkpButR9OugQbzDMocQCGkMGUevyx7mCEuVow2TfEZaG
   x+72ihOC3R+ZNOoLtAItmbvlu6GkCjVGAktFiNXy5JTQLIzRiiXr1bmSH
   kiQ88IuVVmGKpKVAhKLgxRiu6S349Nx/ARYebb6c3Ewz8JndGTzK3Z9eO
   g==;
X-CSE-ConnectionGUID: AEOasjWRTKywAOGeAyfM3g==
X-CSE-MsgGUID: L0JUTdTWSUuOWFB5pKXAHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11147188"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="11147188"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 01:08:47 -0700
X-CSE-ConnectionGUID: VpFEcPo4Q1uu90H6USjaQw==
X-CSE-MsgGUID: etVPO+06Q8SoAzQO5D5a6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; 
   d="scan'208";a="30092333"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.180])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 01:08:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jonathan Corbet
 <corbet@lwn.net>, Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH] docs: document python version used for compilation
In-Reply-To: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
Date: Fri, 10 May 2024 11:08:38 +0300
Message-ID: <878r0ijdh5.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 09 May 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> The drm/msm driver had adopted using Python3 script to generate register
> header files instead of shipping pre-generated header files. Document
> the minimal Python version supported by the script.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/process/changes.rst | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/process/changes.rst b/Documentation/process/ch=
anges.rst
> index 5685d7bfe4d0..8d225a9f65a2 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -63,6 +63,7 @@ cpio                   any              cpio --version
>  GNU tar                1.28             tar --version
>  gtags (optional)       6.6.5            gtags --version
>  mkimage (optional)     2017.01          mkimage --version
> +Python (optional)      3.5.x            python3 --version

Python 3.5 reached end-of-life 3=C2=BD years ago [1]. What's the point in
using anything older than the oldest supported version of Python,
i.e. 3.8 at this time?

BR,
Jani.


[1] https://devguide.python.org/versions/



>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>=20=20
>  .. [#f1] Sphinx is needed only to build the Kernel documentation
>
> ---
> base-commit: 704ba27ac55579704ba1289392448b0c66b56258
> change-id: 20240509-python-version-a8b6ca2125ff
>
> Best regards,

--=20
Jani Nikula, Intel

