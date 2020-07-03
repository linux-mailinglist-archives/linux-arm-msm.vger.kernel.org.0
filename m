Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC7E8213D2F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2020 18:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbgGCQEW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jul 2020 12:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbgGCQEV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jul 2020 12:04:21 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E7ADC061794;
        Fri,  3 Jul 2020 09:04:21 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id a8so27005514edy.1;
        Fri, 03 Jul 2020 09:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X/kUxjEepXtiPp+5nrjETtriBB7vp52saJU42L3Q0Ek=;
        b=NXTOyAOQ4GoupnlWcTajW/yNVeDnYrfHcp4BtrD8hDhof+ZevAzYJm3TxuAGYtrvIX
         rXs7IFYPAFaAYkPSaGYVPBBgx6wUXpVU7Tf2ZSfU3HSQNZuIfqmfnlHdR+0A3wooDual
         nww+ROO2dUWuJ2ti+hBkqVqEvZ4/hV0oUVxIg0fkD2qdrTqnRvFxJTPvp4CItzB1qJ33
         WDZPCtPVHuafx+0x1a3uAUjL2W/abTWpcNOi1zYqkyWNo9TnJ1r8zsPjqs3p1NNLj7+e
         BcY9+L3RcT/CUwC72p1r8dLp4ozaSzFkg9YeIqLuX1w6Y0NorfG4CmhwiljG3gO09s6G
         0jOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X/kUxjEepXtiPp+5nrjETtriBB7vp52saJU42L3Q0Ek=;
        b=S/pCxciyGt6f046/XruNxusNMHnULFpGjhegCjy0jPaJ9dmigjcfKSc5Uf/kc0c4Jk
         qDgD3jiC44Sb2UBW1LTjW4nv+OftaiQ7bA3qcZeJ95wmYNiSpB5X6UZ1I5sy3NA8B0hR
         /ABq3mXWvYj8LK072KvIh8eEhUX4zQP3P17BRwel5qQJfcGafml+KhDkrZks9mpWyUyj
         SOWpcgL99JNn04zV+DpvVxSTgTHqjOWGYwOzBfUdxoeNApNgfO1V51RIiUHJGogss3kW
         CLaHG07UlltiaFtXdDUstJbNW+3p5P64VcTN3OKXO7WTQvqrrnERJm9FQlL+Q5Ezi6z+
         osNg==
X-Gm-Message-State: AOAM531To2qTPpiVcY6txR/Y1jd6hivmqAaBDUgLlMkSbNsaO1o5QFvW
        4ZdxgCh0olP3zWd10o/S/t/0JJGAhLBQ8Pdb5dk=
X-Google-Smtp-Source: ABdhPJwY+TDU+zLAlj3AXwzh91hebM+nK4d4Q98sJyCJl1eumLSurp18Wh0DJ0XCpOtgEb4A9pmtUBcHSW9aUnmJcXw=
X-Received: by 2002:aa7:c656:: with SMTP id z22mr28236616edr.101.1593792259297;
 Fri, 03 Jul 2020 09:04:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593344119.git.saiprakash.ranjan@codeaurora.org>
 <449a6544b10f0035d191ac52283198343187c153.1593344120.git.saiprakash.ranjan@codeaurora.org>
 <20200703133732.GD18953@willie-the-truck> <ecfda7ca80f6d7b4ff3d89b8758f4dc9@codeaurora.org>
In-Reply-To: <ecfda7ca80f6d7b4ff3d89b8758f4dc9@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 3 Jul 2020 09:04:49 -0700
Message-ID: <CAF6AEGsCROVTsi2R7_aUkmH9Luoc_guMR0w0KUJc2cEgpfj79w@mail.gmail.com>
Subject: Re: [PATCHv3 7/7] drm/msm/a6xx: Add support for using system cache(LLC)
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Emil Velikov <emil.velikov@collabora.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 3, 2020 at 7:53 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Hi Will,
>
> On 2020-07-03 19:07, Will Deacon wrote:
> > On Mon, Jun 29, 2020 at 09:22:50PM +0530, Sai Prakash Ranjan wrote:
> >> diff --git a/drivers/gpu/drm/msm/msm_iommu.c
> >> b/drivers/gpu/drm/msm/msm_iommu.c
> >> index f455c597f76d..bd1d58229cc2 100644
> >> --- a/drivers/gpu/drm/msm/msm_iommu.c
> >> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> >> @@ -218,6 +218,9 @@ static int msm_iommu_map(struct msm_mmu *mmu,
> >> uint64_t iova,
> >>              iova |= GENMASK_ULL(63, 49);
> >>
> >>
> >> +    if (mmu->features & MMU_FEATURE_USE_SYSTEM_CACHE)
> >> +            prot |= IOMMU_SYS_CACHE_ONLY;
> >
> > Given that I think this is the only user of IOMMU_SYS_CACHE_ONLY, then
> > it
> > looks like it should actually be a property on the domain because we
> > never
> > need to configure it on a per-mapping basis within a domain, and
> > therefore
> > it shouldn't be exposed by the IOMMU API as a prot flag.
> >
> > Do you agree?
> >
>
> GPU being the only user is for now, but there are other clients which
> can use this.
> Plus how do we set the memory attributes if we do not expose this as
> prot flag?

It does appear that the downstream kgsl driver sets this for basically
all mappings.. well there is some conditional stuff around
DOMAIN_ATTR_USE_LLC_NWA but it seems based on the property of the
domain.  (Jordan may know more about what that is about.)  But looks
like there are a lot of different paths into iommu_map in kgsl so I
might have missed something.

Assuming there isn't some case where we specifically don't want to use
the system cache for some mapping, I think it could be a domain
attribute that sets an io_pgtable_cfg::quirks flag

BR,
-R
