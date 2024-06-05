Return-Path: <linux-arm-msm+bounces-21797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8678FD57A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 20:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 007452872F5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 18:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B142B1494B0;
	Wed,  5 Jun 2024 18:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DzuCIoOM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7C11465BD;
	Wed,  5 Jun 2024 18:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610756; cv=none; b=MM//v/B5AvOCHweqs/4+mNhvVI9CxJHDJpABhe9B3+EiZwfAX2BnVZedQpwykYdOxKjdotLPtkT9+ASLvIURyQkPDvQsUAc6o2qJI60T1PxIQZLs05Km+UpnFimq0cV72X3Kx9YBBpCz/Y84HOYSkt/VS6a9GpqPFOnYfqR0fhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610756; c=relaxed/simple;
	bh=+y3yaIyqBqQ+qBHCr47NqxdcQHNtVGTtw1CuuXvmOLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYIfRddfMiLOXEEXaBiyNabnjxCgVKVLKbVXljPEK01v1k1P2m0DOEDae5woIeZL3AD/4hI3BE7bQ9yotVjcbv/JORBZ00ExnCZ4GpozPm3vxGhTqpjgQWjOvuUFmiWuxt4cV+wrkng5hVztSZ7GcwIlr+JR1FMsXXJppKM19Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DzuCIoOM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F0F1C2BD11;
	Wed,  5 Jun 2024 18:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717610756;
	bh=+y3yaIyqBqQ+qBHCr47NqxdcQHNtVGTtw1CuuXvmOLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DzuCIoOMgM+pzFBzbvCyjZN42UWIwiaZK6pNVz3kvyxqniODrNgOtKnWXrWg8NlE/
	 3eD723EsPgq5mps0oe5/pR/v46PSvROk+9Raucfi8oUK4SlHfkJzvtQovS2XyyG9rW
	 c2ZaQUxTyCPHDdZlZ7uukErpYO1VY2Hd38We4Fku5gMyIF4RH6AsiOVan3wx93mjLQ
	 RC4kOv48WgOePpBwRDTbJBGXPlfOu8lvAq79ZkC140eTdwrIhkmxuiZ5hTBzxjiDts
	 d4wZRrGS8vG81M0FoeQ5bNW3JpSP4lfR73xsg2XaVCRzYpXOvuAtVxBe0gqJIsVHuQ
	 HZ1L2Vhy9PWYA==
Date: Wed, 5 Jun 2024 11:05:53 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Connor Abbott <cwabbott0@gmail.com>,
	dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
	quic_jesszhan@quicinc.com, Rob Clark <robdclark@chromium.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/a6xx: use __unused__ to fix compiler warnings
 for gen7_* includes
Message-ID: <20240605180553.GA2457302@thelio-3990X>
References: <20240605003829.4120343-1-quic_abhinavk@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605003829.4120343-1-quic_abhinavk@quicinc.com>

Hi Abhinav,

Just a drive by style comment.

On Tue, Jun 04, 2024 at 05:38:28PM -0700, Abhinav Kumar wrote:
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 0a7717a4fc2f..a958e2b3c025 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -8,19 +8,15 @@
>  #include "a6xx_gpu_state.h"
>  #include "a6xx_gmu.xml.h"
>  
> -/* Ignore diagnostics about register tables that we aren't using yet. We don't
> - * want to modify these headers too much from their original source.
> - */
> -#pragma GCC diagnostic push
> -#pragma GCC diagnostic ignored "-Wunused-variable"
> -#pragma GCC diagnostic ignored "-Wunused-const-variable"
> +static const unsigned int *gen7_0_0_external_core_regs[] __attribute((__unused__));
> +static const unsigned int *gen7_2_0_external_core_regs[] __attribute((__unused__));
> +static const unsigned int *gen7_9_0_external_core_regs[] __attribute((__unused__));
> +static struct gen7_sptp_cluster_registers gen7_9_0_sptp_clusters[] __attribute((__unused__));

Please do not open code attributes. This is available as either
'__always_unused' or '__maybe_unused', depending on the context.
checkpatch would have warned about this if it was '__attribute__'
instead of '__attribute'.

Cheers,
Nathan

