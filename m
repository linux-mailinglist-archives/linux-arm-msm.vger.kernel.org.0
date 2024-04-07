Return-Path: <linux-arm-msm+bounces-16685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF1D89B2CB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Apr 2024 18:10:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AD6E1F223A0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Apr 2024 16:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 490A337149;
	Sun,  7 Apr 2024 16:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tjx8zr19"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2504112E48
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Apr 2024 16:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712506205; cv=none; b=dntItI6eGjyEWJBqcnl5NqKBaoTLl3cmNWVFO/P3aLsc6o3woiaotmGUTmAYRcdZRzLgCxeXWnEcfy6o0lGLxqqpHrGyZPfHshD4JnwwCn8lY+ETkg8H1lsi+5BUjjOqzm2xxc6cPCqyE7SQS5a6bXp9xskGmL5KDBWkimmDGp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712506205; c=relaxed/simple;
	bh=1O4XExN0Xsw2LetTbNcdubO0tfhA/uyVGdEg46BdfzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bStgvcjlx+8Xz05nFdxB27qlW+dfmpopOYLT69/u3svSQoVqfYVhfzN99DJIDJKFz2Ew8W0dD6d+gW3h+nZ/pwJZ+XxWpwtPoadECrNjx8in1jMYNvSZbL+99pX+8tcGqwC9rlW2BZyVMMbPh6R4bQnDzVGG7p5FLgZN5eYN6Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tjx8zr19; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6FC2C433C7;
	Sun,  7 Apr 2024 16:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712506204;
	bh=1O4XExN0Xsw2LetTbNcdubO0tfhA/uyVGdEg46BdfzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tjx8zr19uxexZBzMz8I/ZC2r8kkC0ScGVLoHi0GAOKPOG4mdH6qQacpwJ/1o1a+of
	 hGVVEFrVKIGv2KgJpgae4+lWGede8jUmMiWZaBV4I1jdeybL1f27pAXzzqtBzKyTRR
	 1rHEswkSIGM74JbAlYQdG3OStQfyhvc6E9bpJFYOmnBCPYRecrXgc8VVHTBXmRXGLs
	 aEcboqU87lzJEeHJTDRqNxgV5vxawjJUGshyRow2acpcrcvdNuRVwIIy6N2WLCYsIM
	 BtSLAOPX61ac4gaH/U5OZrQOIJ2Vu5cMiUEO38kaO/MWQo7Xp5TYp9C72dxfOOfScd
	 6iEERkDEEzHKw==
Date: Sun, 7 Apr 2024 11:10:01 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Kiarash Hajian <kiarash8112hajian@gmail.com>
Cc: dmitry.baryshkov@linaro.org, robdclark@gmail.com, 
	quic_abhinavk@quicinc.com, tzimmermann@suse.de, sean@poorly.run, 
	marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org
Subject: Re: [PATCH 1/1] drm/msm: request memory region
Message-ID: <aozrfir52xy3gra7rlu7xmneekpyse7wchk5i4h4iw3wwglkfd@czjk7u2ou2ka>
References: <20240405162213.28263-1-kiarash8112hajian@gmail.com>
 <20240405162213.28263-2-kiarash8112hajian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405162213.28263-2-kiarash8112hajian@gmail.com>

On Fri, Apr 05, 2024 at 12:22:07PM -0400, Kiarash Hajian wrote:
> The driver's memory regions are currently just ioremap()ed, but not
> reserved through a request. That's not a bug, but having the request is
> a little more robust.
> 
> Implement the region-request through the corresponding managed
> devres-function.
> 
> Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>

Happy to see you post your first patches here, Kiarash!

In addition to the issue pointed by Dmitry, you're missing a "v3" in
your subject, indicating that this is the 3rd version of the patch. I'm
also uncertain that you got your recipients list entirely correct.

I'd recommend that you adopt b4, as described at [1], as this helps you
with such details.


Please also update the subject prefix to "drm/msm/a6xx:", to match the
majority of other changes to this file.

[1] https://b4.docs.kernel.org/en/latest/contributor/overview.html

Regards,
Bjorn

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 +-
>  drivers/gpu/drm/msm/msm_io_utils.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 8bea8ef26f77..e4f7c282799b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1503,7 +1503,7 @@ static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> -	ret = ioremap(res->start, resource_size(res));
> +	ret = devm_ioremap_resource(&pdev->dev, res);
>  	if (!ret) {
>  		DRM_DEV_ERROR(&pdev->dev, "Unable to map the %s registers\n", name);
>  		return ERR_PTR(-EINVAL);
> diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
> index afedd61c3e28..34e598ce869a 100644
> --- a/drivers/gpu/drm/msm/msm_io_utils.c
> +++ b/drivers/gpu/drm/msm/msm_io_utils.c
> @@ -83,7 +83,7 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
>  
>  	size = resource_size(res);
>  
> -	ptr = devm_ioremap(&pdev->dev, res->start, size);
> +	ptr = devm_ioremap_resource(&pdev->dev, res);
>  	if (!ptr) {
>  		if (!quiet)
>  			DRM_DEV_ERROR(&pdev->dev, "failed to ioremap: %s\n", name);
> -- 
> 2.43.0
> 
> 

