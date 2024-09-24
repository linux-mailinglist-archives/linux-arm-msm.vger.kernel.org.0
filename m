Return-Path: <linux-arm-msm+bounces-32226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D1D983CEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 08:16:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B70E4281D2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 06:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD794779F;
	Tue, 24 Sep 2024 06:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BYr/ejGm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C053C463
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Sep 2024 06:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727158578; cv=none; b=iUH3lcH9a49M35QEIOAnjNijCbRprUDMFwNsuXwubCZluI6VMEttQF7UT+uYUTKNEI5D13vKwjAdTJjgBH/EBfPTJCyX0O9TG6W+/U7u7m1MHibCdrBbgG21x7QAg3jLgY7bjwhFBCK8l9QqdJrqQNV7GDz6WtbgZBGgwfQ1e10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727158578; c=relaxed/simple;
	bh=UWkBmgjGskvL8GNtm+Gp4JAUuWrilvjBC9MJ9j+d30Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QxYXOLUKST16KtOGQGB5Jo0TPXdaqdKTlEeixGndv2budTwaUTF4o3fINLx2HHd5H4SEaSRXdNpr5qbEZA2KLcxVEO6tefKFrIqnDgYomnSYINU7zkkKD6BL9o5LktJyT3hKsIf0qb68nYnmFko+HvIaKc5cYrgLPpNTnx13Qhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BYr/ejGm; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6de05b9fd0bso41363777b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Sep 2024 23:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727158575; x=1727763375; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcweUFHFW/KJCW3gKD065UQS3lsmUsHAhy70Femt8O8=;
        b=BYr/ejGmuqNAT62wgFzI47R26keNMk9vLsHqH42aF2M0vXmEJcJAzcvC+ZlCUsoPQD
         PBc4Skfexg+x5YgfpMEmHKt9pvLdL+p7poyWLOZbhLGh/kxFnNHjAgqfAOe+FRHhCnWX
         yXCNKJ2CcVRq/c0lnuvt2xQmJlKSOmm/nkiqtMbrVkxHa3aM4QCfuA9D8FxD+KJLdsZw
         K7l83tVXCfXsK4sDkePNF8YAlTcATbVBCDNtLyoMuDLpxqy5wVTSX0YgVotciInua1RU
         /mSOxzvJ2/AF8d9fv0YFczIRIjQp74AGcsRtkMR7BYig04UaWxU3assUm3U4wQCVzmuo
         j2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727158575; x=1727763375;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZcweUFHFW/KJCW3gKD065UQS3lsmUsHAhy70Femt8O8=;
        b=cCsTZMKbp57v6NzitNdfF/N6bsph6ZvLdNEEUrBfH4jm4PNplaYXd3WoXJgxf2I+EI
         mDFSpPRAerHxdu2L3KRxPrfBvREjods8kDeITT3l4pl7V0L/f4zOoYm8jGbuFaUtmYiB
         oSxZNRbxWGX6FKSwqus5F2rEPxuEm/oJQOzBYftKVjJEPgELaJAWWwKfU/nLBrhvfQgw
         7rIufbap37fJ7L5IWnl3mDpzFn0BYtlpzjLYdyGDdTYfrvxlII2GNXHGcD8uE/f2pnVw
         sV0SoJ3Nm5cQAY7ISEfiaaJj3T5xYsaPD57owA/s9c5kF550UfrSn/jx8wC6sevjv33I
         9J9g==
X-Forwarded-Encrypted: i=1; AJvYcCWc6D+gEaz9GhSD8RCkxxHqex0Piw3NyQ0jV5l2nZyhHgdnDTnqY7c9932nQ/zCA2wT6510SlygBnKn8dVN@vger.kernel.org
X-Gm-Message-State: AOJu0YylQy+ArL2yy5euGTcsLysLJXFBt91+d5xHjfwssQaBqe9CPC68
	hIHZdnnYxmY7nAJfxYWt0NnuNjLd8TqPJ/Y1RQQLmFQgHz0iALMVq+wsKXQGzdorpXvfpcEKVBF
	rK50DBpi4FhPOSXMhQSk5FdRqjIEwmkrg+5V7zw==
X-Google-Smtp-Source: AGHT+IEF5j0JkBVAgP1jTlkYufGIlKJxFTmmd49IaW+yK41rQF/NpMRTMvOPM1xHJnDTOa2dEHhH9wuEn2USXNPEeWM=
X-Received: by 2002:a05:690c:89:b0:6b1:4948:f689 with SMTP id
 00721157ae682-6dff290379dmr105980107b3.34.1727158574971; Mon, 23 Sep 2024
 23:16:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240924022600.1441969-1-vignesh.raman@collabora.com>
In-Reply-To: <20240924022600.1441969-1-vignesh.raman@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Sep 2024 08:16:04 +0200
Message-ID: <CAA8EJprUUUc0iDph-HPrW1anrdnzYju7+JERQdHbwxvznq=H4w@mail.gmail.com>
Subject: Re: [PATCH v1] docs/gpu: ci: update flake tests requirements
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, 
	robdclark@gmail.com, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com, 
	mripard@kernel.org, rodrigo.vivi@intel.com, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Sept 2024 at 04:26, Vignesh Raman
<vignesh.raman@collabora.com> wrote:
>
> Update the documentation to require linking to a relevant GitLab
> issue for each new flake entry instead of an email report. Added
> specific GitLab issue URLs for i915, xe and other drivers.
>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  Documentation/gpu/automated_testing.rst | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
> index 2d5a28866afe..f73b8939dc3a 100644
> --- a/Documentation/gpu/automated_testing.rst
> +++ b/Documentation/gpu/automated_testing.rst
> @@ -67,20 +67,25 @@ Lists the tests that for a given driver on a specific hardware revision are
>  known to behave unreliably. These tests won't cause a job to fail regardless of
>  the result. They will still be run.
>
> -Each new flake entry must be associated with a link to the email reporting the
> -bug to the author of the affected driver, the board name or Device Tree name of
> -the board, the first kernel version affected, the IGT version used for tests,
> -and an approximation of the failure rate.
> +Each new flake entry must include a link to the relevant GitLab issue, the board
> +name or Device Tree name, the first kernel version affected, the IGT version used
> +for tests and an approximation of the failure rate.
>
>  They should be provided under the following format::
>
> -  # Bug Report: $LORE_OR_PATCHWORK_URL
> +  # Bug Report: $GITLAB_ISSUE
>    # Board Name: broken-board.dtb
>    # Linux Version: 6.6-rc1
>    # IGT Version: 1.28-gd2af13d9f
>    # Failure Rate: 100
>    flaky-test
>
> +The GitLab issue must include the logs and the pipeline link. Use the appropriate
> +link below to create an issue.
> +https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/ for i915 drivers
> +https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/ for xe drivers

drm/msm for msm driver, please. Otherwise we can easily miss such issues.

> +https://gitlab.freedesktop.org/drm/misc/kernel/-/issues for other drivers
> +
>  drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-skips.txt
>  -----------------------------------------------------------
>
> --
> 2.43.0
>


-- 
With best wishes
Dmitry

