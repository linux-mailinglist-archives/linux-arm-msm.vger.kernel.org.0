Return-Path: <linux-arm-msm+bounces-60260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E2DACE5B7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 22:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BA25175091
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 20:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6DF1940A1;
	Wed,  4 Jun 2025 20:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lQFxG6UP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EF113AD05;
	Wed,  4 Jun 2025 20:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749068594; cv=none; b=fBXrVWLZ4kywEfTRzscJSUKrNSuG20nWQUMWc5/NzTX0ByX+Yb9N0ROQj7ZlScHjPq8Dw9QCi4MYJ9VKdS8MD1M1yz9f2hyV93mr6FqsgsMN4GmejjYCAP6601nu50R2ZrnQL8F++GqED6SffVWitCUBszVn7RpYPNhHpnfdaU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749068594; c=relaxed/simple;
	bh=5GFhbHqFprf6AI7bpRC7glklZOYiHyJKzCGuN9tSXF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VlGrA2BV2+LnbZEpcrncWhtWxCD06Isg2PBFKv1QnDzUQ/kP/CNfvTgYzh7RgCQOg7GDodaXXmexax5GSZ1oF3G8i9qUutGTsWamgHWiY2181Cr4OUEEFq0aW6IROkFG9X/rms1dS6JBj5R2eWmp6HJr5+VkXiwKiIHvCsOv5Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lQFxG6UP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37247C4CEE4;
	Wed,  4 Jun 2025 20:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749068593;
	bh=5GFhbHqFprf6AI7bpRC7glklZOYiHyJKzCGuN9tSXF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lQFxG6UP3Zn447X6eKMhgJY9o7q9BOtJYaQtUZQK881d8Xqao0SDklxonXgKbm/Vi
	 CUPdpGxmzsBQyb3MZCHxf/af40CVu1AYpzrDQKB/4hqJMsGaA7nR42DiyXMNEWXAmF
	 SQ7zEQBOZe0FIhqIzcztS0EfhLOeZJAMMlb/CPFluzxLymhJETgIcffgDv5wMv9Yv2
	 uFELbAXfnVPgT7q7eTUJgqspIcY3kyDASOLLkcYNvd/Z0FrzfFhoo/kvySTHX8L+iN
	 rp9zQSvc9VSkwyDnF+azqrfR5RVkDBT52V4vrqEKikFdlAJvrC9BkV0mJyU9f3gGmD
	 jmxz7klL6Iqmw==
Date: Wed, 4 Jun 2025 15:23:11 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>, 
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: .mailmap: update Rob Clark's email address
Message-ID: <gqlhinly7mkos5ejypbhjzyefcrevok4unz7qlmwngx742p37n@hiuyb55tbncb>
References: <20250604175600.89902-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604175600.89902-1-robdclark@gmail.com>

On Wed, Jun 04, 2025 at 10:55:58AM -0700, Rob Clark wrote:
> From: Rob Clark <robin.clark@oss.qualcomm.com>
> 
> Remap historical email addresses to @oss.qualcomm.com.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Welcome,
Bjorn

> ---
>  .mailmap    | 2 ++
>  MAINTAINERS | 6 +++---
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/.mailmap b/.mailmap
> index 6a6aa09e244b..b72a164280ea 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -633,6 +633,8 @@ Richard Genoud <richard.genoud@bootlin.com> <richard.genoud@gmail.com>
>  Richard Leitner <richard.leitner@linux.dev> <dev@g0hl1n.net>
>  Richard Leitner <richard.leitner@linux.dev> <me@g0hl1n.net>
>  Richard Leitner <richard.leitner@linux.dev> <richard.leitner@skidata.com>
> +Rob Clark <robin.clark@oss.qualcomm.com> <robdclark@chromium.org>
> +Rob Clark <robin.clark@oss.qualcomm.com> <robdclark@gmail.com>
>  Robert Foss <rfoss@kernel.org> <robert.foss@linaro.org>
>  Rocky Liao <quic_rjliao@quicinc.com> <rjliao@codeaurora.org>
>  Rodrigo Siqueira <siqueira@igalia.com> <rodrigosiqueiramelo@gmail.com>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ee57fc5d48f8..5dd1a3234cc5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7567,7 +7567,7 @@ F:	Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
>  F:	drivers/gpu/drm/tiny/panel-mipi-dbi.c
>  
>  DRM DRIVER for Qualcomm Adreno GPUs
> -M:	Rob Clark <robdclark@gmail.com>
> +M:	Rob Clark <robin.clark@oss.qualcomm.com>
>  R:	Sean Paul <sean@poorly.run>
>  R:	Konrad Dybcio <konradybcio@kernel.org>
>  L:	linux-arm-msm@vger.kernel.org
> @@ -7586,7 +7586,7 @@ F:	drivers/gpu/drm/msm/registers/adreno/
>  F:	include/uapi/drm/msm_drm.h
>  
>  DRM DRIVER for Qualcomm display hardware
> -M:	Rob Clark <robdclark@gmail.com>
> +M:	Rob Clark <robin.clark@oss.qualcomm.com>
>  M:	Abhinav Kumar <quic_abhinavk@quicinc.com>
>  M:	Dmitry Baryshkov <lumag@kernel.org>
>  R:	Sean Paul <sean@poorly.run>
> @@ -20287,7 +20287,7 @@ F:	drivers/soc/qcom/icc-bwmon.c
>  F:	drivers/soc/qcom/trace_icc-bwmon.h
>  
>  QUALCOMM IOMMU
> -M:	Rob Clark <robdclark@gmail.com>
> +M:	Rob Clark <robin.clark@oss.qualcomm.com>
>  L:	iommu@lists.linux.dev
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
> -- 
> 2.49.0
> 
> 

