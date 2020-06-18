Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1C1A1FE722
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 04:39:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728520AbgFRCis (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 22:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729108AbgFRCim (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 22:38:42 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC653C06174E;
        Wed, 17 Jun 2020 19:38:41 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id x93so3648245ede.9;
        Wed, 17 Jun 2020 19:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fn1oTj1MrOMqfg06EDKwAoYxj2Z3VWdebP8hXUOa11U=;
        b=tVzXDIaw2NKS50gVeUXfTpB8tddn0VcobFGhMm9eW4rWh53jLNluzEtW2Ye4XHjQCS
         kauGt+ouda2dca8jgapjjNZ2xaQ3fyM6h95VX/sKcOPrEq3Ahr7UHqjxX+3SUugDzKIN
         jvSCgNBduyixkI8ID3xdsETMLX87i30zgGTWVZmwCsNRSLZdrX0/6g17gipF/fFokvWe
         aUGi3WOtioAdevo+TTeg6PJvGKk7uRgzRn6eFQrieovVKFwBpHzcaZrJlWnaXgSyz/5A
         pUkPBdTWrI+9tv+3azvnVTTJe+Q5JOh0KI2M6RiK12ZW1un3uFGu/nwB6zBMXBAUq2JE
         sNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fn1oTj1MrOMqfg06EDKwAoYxj2Z3VWdebP8hXUOa11U=;
        b=dpRXRG5/SAT/RSebSuYOp39dS4haP7YwYEh1LFszrDLmYdm3cY5TzoBJCkBrFWK0i2
         SfGqxblnFIrDj7fuqTb+Qu2hRETNIq8iATscepea9WI++3dixn5FD55+UVLjxhx/BXef
         3VEBGisLYQcz/kc9pw5Nsd4wNvE20IbcBG0VwesDMgoWcvzPo3HEeBRfsUk/xRX99Maa
         nIa4tnNNO7YnOtdlKG2AhZvjt4CXrql4ARDN7Gb1tM+7y4vcMAAPFOHr2TwYc8fwXidC
         qmS1db38M6nLLkSBqo0XNH4Locrx3sLhu23Zw0gRVFqZKqMqhJ7PMzODBK+HK91Wl0S3
         uMyw==
X-Gm-Message-State: AOAM532MdzdKowTnB8snc7obAZBQNnQ0lPWNKsjjyLJLhnvbUYrt1GEN
        aF4EaPuujN5Fb8+vxBBqqOfVpGYmoPl9yzpjfxK0I+fZRRE=
X-Google-Smtp-Source: ABdhPJwHVmIzvsNJeU6cQ52qJLQTS+rkoE2LIe9n+nnNDPP/fDkExgJg3wMLxUOIqWX8Y9YnQTQ0DkMuOdCUjA5NOUI=
X-Received: by 2002:aa7:da14:: with SMTP id r20mr2030808eds.7.1592447920293;
 Wed, 17 Jun 2020 19:38:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200617205310.2183722-1-eric@anholt.net>
In-Reply-To: <20200617205310.2183722-1-eric@anholt.net>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 17 Jun 2020 19:39:08 -0700
Message-ID: <CAF6AEGu1jV+SWg8apDdq5QghGUvr1wKV38R8XwTL97VXfVUmdQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm: Fix address space size after refactor.
To:     Eric Anholt <eric@anholt.net>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 17, 2020 at 1:53 PM Eric Anholt <eric@anholt.net> wrote:
>
> Previously the address space went from 16M to ~0u, but with the
> refactor one of the 'f's was dropped, limiting us to 256MB.
> Additionally, the new interface takes a start and size, not start and
> end, so we can't just copy and paste.
>
> Fixes regressions in dEQP-VK.memory.allocation.random.*
>
> Fixes: ccac7ce373c1 ("drm/msm: Refactor address space initialization")
> Signed-off-by: Eric Anholt <eric@anholt.net>


rebased on https://patchwork.freedesktop.org/series/78281/ (which
fixed half of the problem) and pushed this and 2/2 to msm-next so it
should show up in linux-next shortly..

planning to wait a short time more to see if we find any other issues
and then send a -fixes PR

BR,
-R


> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 89673c7ed473..5db06b590943 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -194,7 +194,7 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
>         struct msm_gem_address_space *aspace;
>
>         aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M,
> -               0xfffffff);
> +               0xffffffff - SZ_16M);
>
>         if (IS_ERR(aspace) && !IS_ERR(mmu))
>                 mmu->funcs->destroy(mmu);
> --
> 2.26.2
>
