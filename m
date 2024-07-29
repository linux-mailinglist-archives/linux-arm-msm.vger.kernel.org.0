Return-Path: <linux-arm-msm+bounces-27160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACEB93EBC5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 05:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FFD71C21338
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 03:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3223878281;
	Mon, 29 Jul 2024 03:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EDRy8Alj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32222B9D2;
	Mon, 29 Jul 2024 03:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722222591; cv=none; b=gSJwTNJVnN7qPjxQlNyR808QWA8GGOIeDq+sYfC93AuJ4QHDo9utHayAuEfpufuLPqDBJdfOOw7tpKY04FI4khSZoPdWNEJvqtfN0s0pSwuv29e2o+vvT0ZxIj3v4BkwEh4KkHp0hi2Ugbr6QcIemS1b8QArVgp/9U/OFXInPt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722222591; c=relaxed/simple;
	bh=qGGqw71micBXJaxsXmYl7/ikb6fEH786nZP1LH2K67g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=my82nJpL72sCwpgV6S1sVnCaAaFFEc4odJE5oEbsG8cRiajWFY+VJDfzRH84OtwXNpwvwueF8fWkuiAoiDjTDAbuI+ecKMm/cOXVd3DQbdjQNO2Sm2mi9EWkojHAAAz4kX3+sS4KeuyIxkvmpNGMQ7NmUYG88g71mCgKT507YnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EDRy8Alj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25655C116B1;
	Mon, 29 Jul 2024 03:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722222590;
	bh=qGGqw71micBXJaxsXmYl7/ikb6fEH786nZP1LH2K67g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EDRy8Alj7pCf8ehwMe8nZmF0kvOxHfoiUpmGC2NTrEnUld/VshbLgo+YpZogWA8Lc
	 OobPt4gVIemc3bubHDY/K2415bYqiUi+ewv/tAFkxV9pQFx364hSHOrfifNY7V2oJ2
	 8DdhiZJsVDtNO2hsnNRWTNNUxcxJ2YXQp2USESkxTufa4cll5QP36oTQj7DB4mz5+7
	 c4P7ki5V6tMQEQ7/7685GLCK8/jDh2E6Wq2RGRD5FsDUd+H5vxc0pxi8mit7x6gpqw
	 eby+qHk4W4gGJJj9IriXsNL4TL36yGavtfiaHF0Ol1UnWmBH6SwyKu7TFsPGb4Tgma
	 quA+SGf4/OLaQ==
Date: Sun, 28 Jul 2024 22:09:47 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: konrad.dybcio@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, robdclark@gmail.com, sean@poorly.run, quic_abhinavk@quicinc.com, 
	dmitry.baryshkov@linaro.org, marijn.suijten@somainline.org, airlied@gmail.com, 
	daniel@ffwll.ch, fekz115@gmail.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, cros-qcom-dts-watchers@chromium.org
Subject: Re: [PATCH 1/2] drivers: drm/msm/a6xx_catalog: Add A642L speedbin
 (0x81)
Message-ID: <4v5kl65wurifvkpious5ae4zhpv7zklejalg4sp4vcjiwhfbv2@o7jee7jil5ke>
References: <20240722184314.36510-1-danila@jiaxyga.com>
 <20240722184314.36510-2-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722184314.36510-2-danila@jiaxyga.com>

On Mon, Jul 22, 2024 at 09:43:13PM GMT, Danila Tikhonov wrote:
> From: Eugene Lepshy <fekz115@gmail.com>
> 

Please make sure the subject prefix matches other changes in the same
driver/files.

Regards,
Bjorn

> According to downstream, A642L's speedbin is 129 and uses 4 as index
> 
> Signed-off-by: Eugene Lepshy <fekz115@gmail.com>
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 68ba9aed5506e..99f0ee1a2edea 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -869,6 +869,7 @@ static const struct adreno_info a6xx_gpus[] = {
>  		.speedbins = ADRENO_SPEEDBINS(
>  			{ 0,   0 },
>  			{ 117, 0 },
> +			{ 129, 4 },
>  			{ 172, 2 }, /* Called speedbin 1 downstream, but let's not break things! */
>  			{ 190, 1 },
>  		),
> -- 
> 2.45.2
> 

