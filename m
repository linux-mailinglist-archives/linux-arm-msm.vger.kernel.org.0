Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6A543AD4D4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jun 2021 00:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234863AbhFRWMO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 18:12:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234858AbhFRWMN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 18:12:13 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21314C06175F
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 15:10:03 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id dj3so4346182qvb.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 15:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w4YiW4egPKdJECyPLrd6+VyczjYedyk/bEQ3LwbFh40=;
        b=kmgSmV1OQ5ftiq3+FvkzWjJQjPfeXPWXuZKSvT4MZJG4eugkNddA22USVB2l1Oscfa
         +w0Icj+IBTHRwhBa4kuvqXd97RFLazXj0fzsDSxeymKntKOlLCU+ClW68Gx8OVE4K4TR
         qLvxc2MGZKOKgfdqWSVacIeOAPQn4TwoKY/V0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w4YiW4egPKdJECyPLrd6+VyczjYedyk/bEQ3LwbFh40=;
        b=tWZN7bFGNcM+KmGJrn33r666Xu2SWbz3WSB1U4HAPXdvFRlvIzKFA5MLg8lWiWn2P9
         T1/s9gUaHEa+3/z2PLsTvXS6NJUymI3Z6eBzUeyAy57Dx1rvUZ5cTEzXrHnJkzdCABnT
         LGkkPoGUTKlpQ/Ad8hxgzsnKGcVu+r6Z3bicnjoTKLuZbqHiZ/qsSm1HLxDaSD7lA0bU
         mlv/S/X18LflE/CmEc8KbVKV8eoCdGp2XtelF6MHNZ7xHhNi5MWPwbI5X54ULtghwFeZ
         RSPV1uBMmz4vLLcU9Zd2OM5NpLFVktWzjrXT5ZOBZ1p7AWzXqW/7EJACRuHUn46Z8UlI
         /8sQ==
X-Gm-Message-State: AOAM533czD76Oa42ma85kKT7//Zj/FUCco6ptj6RK/gF814RrCxHw1oV
        L1rmzJ6QTbKuGzDhPZxGkR1abNQTS9DXzw==
X-Google-Smtp-Source: ABdhPJxZYR6vGKEXi17FsaNeYf9ou2Bqp+Hqe/j+93Wq0eKmWcXNWPJiEvoWZ5+sHHoZePLxMPlx7Q==
X-Received: by 2002:ad4:4c43:: with SMTP id cs3mr4825950qvb.27.1624054201764;
        Fri, 18 Jun 2021 15:10:01 -0700 (PDT)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id t184sm4979686qkf.63.2021.06.18.15.10.00
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jun 2021 15:10:00 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id c138so14578068qkg.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 15:10:00 -0700 (PDT)
X-Received: by 2002:a25:bcb:: with SMTP id 194mr17381339ybl.32.1624054200300;
 Fri, 18 Jun 2021 15:10:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623981933.git.saiprakash.ranjan@codeaurora.org> <150fc7ab1c7f9b70a95dae1f4bc3b9018c0f9e04.1623981933.git.saiprakash.ranjan@codeaurora.org>
In-Reply-To: <150fc7ab1c7f9b70a95dae1f4bc3b9018c0f9e04.1623981933.git.saiprakash.ranjan@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 18 Jun 2021 15:09:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WA_mBnxv-D3YOYUkDAAcYgktFgnw2zeTkMneqFxBg=yg@mail.gmail.com>
Message-ID: <CAD=FV=WA_mBnxv-D3YOYUkDAAcYgktFgnw2zeTkMneqFxBg=yg@mail.gmail.com>
Subject: Re: [PATCHv2 2/3] iommu/io-pgtable: Optimize partial walk flush for
 large scatter-gather list
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jun 17, 2021 at 7:51 PM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Currently for iommu_unmap() of large scatter-gather list with page size
> elements, the majority of time is spent in flushing of partial walks in
> __arm_lpae_unmap() which is a VA based TLB invalidation invalidating
> page-by-page on iommus like arm-smmu-v2 (TLBIVA) which do not support
> range based invalidations like on arm-smmu-v3.2.
>
> For example: to unmap a 32MB scatter-gather list with page size elements
> (8192 entries), there are 16->2MB buffer unmaps based on the pgsize (2MB
> for 4K granule) and each of 2MB will further result in 512 TLBIVAs (2MB/4K)
> resulting in a total of 8192 TLBIVAs (512*16) for 16->2MB causing a huge
> overhead.
>
> So instead use tlb_flush_all() callback (TLBIALL/TLBIASID) to invalidate
> the entire context for partial walk flush on select few platforms where
> cost of over-invalidation is less than unmap latency

It would probably be worth punching this description up a little bit.
Elsewhere you said in more detail why this over-invalidation is less
of a big deal for the Qualcomm SMMU. It's probably worth saying
something like that here, too. Like this bit paraphrased from your
other email:

On qcom impl, we have several performance improvements for TLB cache
invalidations in HW like wait-for-safe (for realtime clients such as
camera and display) and few others to allow for cache lookups/updates
when TLBI is in progress for the same context bank.


> using the newly
> introduced quirk IO_PGTABLE_QUIRK_TLB_INV_ALL. We also do this for
> non-strict mode given its all about over-invalidation saving time on
> individual unmaps and non-deterministic generally.

As per usual I'm mostly clueless, but I don't quite understand why you
want this new behavior for non-strict mode. To me it almost seems like
the opposite? Specifically, non-strict mode is already outside the
critical path today and so there's no need to optimize it. I'm
probably not explaining myself clearly, but I guess i'm thinking:

a) today for strict, unmap is in the critical path and it's important
to get it out of there. Getting it out of the critical path is so
important that we're willing to over-invalidate to speed up the
critical path.

b) today for non-strict, unmap is not in the critical path.

So I would almost expect your patch to _disable_ your new feature for
non-strict mappings, not auto-enable your new feature for non-strict
mappings.

If I'm babbling, feel free to ignore. ;-) Looking back, I guess Robin
was the one that suggested the behavior you're implementing, so it's
more likely he's right than I am. ;-)


-Doug
