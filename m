Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FBB71FD623
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 22:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726815AbgFQUhT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 16:37:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbgFQUhT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 16:37:19 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10F43C06174E
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 13:37:19 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id y13so2133817lfe.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 13:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anholt-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KnLCZJwys+q4B3B05ok3TtEm9HWxcpRhuVgOFrlznhw=;
        b=NFZcC0HxLVeJtloucD6xkDEeP+TvW++GtU2PKmlM7Pm5PGuHk8vGkD4nuqJXeVe1kD
         QgPZd8MfuT69OaWTBim3SZi4PnPodruvNDFvFGkGgjPa3MHia3roD+LRImbpilOjbPGE
         ZzVtW9xZm5CbX8kX5zVUyYCKaCk9XCeyqW6hE//g8E6qJ09W4PLzfAY8BZNDX8d6qwIW
         1Qc4DTFOYCVWNqpinrn4k92Ax7orPareKeURiV+EcmQMCws9mV6qBAx/bdFaMw3AAaGn
         UqR2RZde2nOCN7LOw2hqRRTbNcQ4tJZcO8bFVaZ6LfEdkb1oam83UKvwzc2anAMDXPba
         ji+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KnLCZJwys+q4B3B05ok3TtEm9HWxcpRhuVgOFrlznhw=;
        b=cm9qMjHecou+B0+ABQCyEPIly3hreiEjkv78nUzqvknhU47ftmvk6cqDHNE1ZxAkO0
         /zNOgiVB5dagV2nSbiNdkp5uKES84LMiIK6hZ12xleFjHOqFuZcuImo1AhGWrwIyrDHn
         OODD5d8GGiZAdEHC09ooFas1hRnWauCb/ie7LbOYWzuxqtUUcGXHWrch/o+3JIcC8cP7
         lrwgTAi+oR/EDIVnr/HK/03e6LMdKN7fq6SHiRcwSxLWDILpVjQJTcRHtvD9RS4PXi91
         2Jl7dC1pVf+PcryKTAj7DoLZ8ZRSclb4CRffxgkB26GSuTBizMcXoslJBeBg4++Bpg69
         bZqg==
X-Gm-Message-State: AOAM53387jpryWKCMXesoBngYU+gVi8ck3LGiDze001aqvm+d58s+NWs
        OvWlSfc4PU/du2KoYEFbZfLtJ8IL1EuNpCXlryw6rw==
X-Google-Smtp-Source: ABdhPJy5tFufG+SBVUtax2Z87ERt62C9EUZ15mPz3fddCgc6sVOg4TRQp2GozJYEPiXj2lWl6HnY46NpoQCRpZl4fPs=
X-Received: by 2002:a19:4bd1:: with SMTP id y200mr402640lfa.60.1592426237348;
 Wed, 17 Jun 2020 13:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200409233350.6343-1-jcrouse@codeaurora.org> <20200409233350.6343-5-jcrouse@codeaurora.org>
 <CADaigPWJDEwPZyUyEO9H3=+zzdEX=h+gSa-w1ppNpM9ryY0LZA@mail.gmail.com>
In-Reply-To: <CADaigPWJDEwPZyUyEO9H3=+zzdEX=h+gSa-w1ppNpM9ryY0LZA@mail.gmail.com>
From:   Eric Anholt <eric@anholt.net>
Date:   Wed, 17 Jun 2020 13:37:06 -0700
Message-ID: <CADaigPVvZrP_mOcB5f7w77t+4O1=Ya2VW8Ff96EzemO6swr_8Q@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] drm/msm: Refactor address space initialization
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     iommu@lists.linux-foundation.org, Sam Ravnborg <sam@ravnborg.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        will@kernel.org, Ben Dooks <ben.dooks@codethink.co.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Brian Masney <masneyb@onstation.org>,
        freedreno@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-arm-msm@vger.kernel.org,
        Sharat Masetty <smasetty@codeaurora.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sean Paul <sean@poorly.run>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        zhengbin <zhengbin13@huawei.com>,
        tongtiangen <tongtiangen@huawei.com>,
        Drew Davenport <ddavenport@chromium.org>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 17, 2020 at 1:16 PM Eric Anholt <eric@anholt.net> wrote:
>
> On Thu, Apr 9, 2020 at 4:34 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> >
> > Refactor how address space initialization works. Instead of having the
> > address space function create the MMU object (and thus require separate but
> > equal functions for gpummu and iommu) use a single function and pass the
> > MMU struct in. Make the generic code cleaner by using target specific
> > functions to create the address space so a2xx can do its own thing in its
> > own space.  For all the other targets use a generic helper to initialize
> > IOMMU but leave the door open for newer targets to use customization
> > if they need it.
>
> I'm seeing regressions in dEQP-VK.memory.allocation.random.* on cheza
> after this commit.   The symptom is that large allocations fail with
> -ENOSPC from MSM_GEM_INFO(IOVA).
>
> Possibly relevant change from having stuffed some debug info in:
>
> before:
> [    3.791436] [drm:msm_gem_address_space_create] *ERROR* msmgem
> address space create: 0x1000000 + 0xfeffffff
> [    3.801672] platform 506a000.gmu: Adding to iommu group 6
> [    3.807359] [drm:msm_gem_address_space_create] *ERROR* msmgem
> address space create: 0x0 + 0x7fffffff
> [    3.817140] msm ae00000.mdss: bound 5000000.gpu (ops a3xx_ops)
> [    3.823212] msm_dpu ae01000.mdp: [drm:msm_ioremap] *ERROR* failed
> to get memory resource: vbif_nrt
> [    3.832429] msm_dpu ae01000.mdp: [drm:msm_ioremap] *ERROR* failed
> to get memory resource: regdma
> [    3.841478] [drm:dpu_kms_hw_init:878] dpu hardware revision:0x40000000
> [    3.848193] [drm:msm_gem_address_space_create] *ERROR* msmgem
> address space create: 0x1000 + 0xffffefff
>
> after:
>
> [    3.798707] [drm:msm_gem_address_space_create] *ERROR* msmgem
> address space create: 0x1000000 + 0xfffffff
> [    3.808731] platform 506a000.gmu: Adding to iommu group 6
> [    3.814440] [drm:msm_gem_address_space_create] *ERROR* msmgem
> address space create: 0x0 + 0x7fffffff
> [    3.820494] hub 2-1:1.0: USB hub found
> [    3.824108] msm ae00000.mdss: bound 5000000.gpu (ops a3xx_ops)
> [    3.828554] hub 2-1:1.0: 4 ports detected
> [    3.833756] msm_dpu ae01000.mdp: [drm:msm_ioremap] *ERROR* failed
> to get memory resource: vbif_nrt
> [    3.847038] msm_dpu ae01000.mdp: [drm:msm_ioremap] *ERROR* failed
> to get memory resource: regdma
> [    3.856095] [drm:dpu_kms_hw_init:878] dpu hardware revision:0x40000000
> [    3.862840] [drm:msm_gem_address_space_create] *ERROR* msmgem
> address space create: 0x1000 + 0xfffffff
>
> 256MB for GMU address space?

Found the bug, fixes at the last 2 commits of
https://github.com/anholt/linux/tree/drm-msm-address-space

I'm going to try having another go at convincing gmail to let git
send-email through, but all the howtos in the world didn't work last
time (gsuite has different behavior from normal gmail).
