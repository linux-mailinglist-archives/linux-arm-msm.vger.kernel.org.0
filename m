Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20B8134DFCE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 06:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230377AbhC3D74 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 23:59:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbhC3D7a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 23:59:30 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E20EAC061762;
        Mon, 29 Mar 2021 20:59:28 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id e18so14783303wrt.6;
        Mon, 29 Mar 2021 20:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rM9L+7Kw3lO7Pp/XFwkGX6YGb/YVHvAdXNzLLxwfl1w=;
        b=d5r347TSpxGfn0IJ/N8JbKpxDmaafhKU5rNf58YqPHt5eTga6M8/CJYPn4c/3bO1e7
         oLowg+kak8vfpk2OM8l5bkPysCGNpJv+xzUHKoWzsYEy0xAIHVgEP+VawDDV/fIWC0zD
         CMaOLM00fzD5OdZyuBkurYektDz1zDDgrTubQCJBa1c/1ODt2sn+qbEqBAOa8scjFZ90
         ZAX4A3O61vdNTaS+gQOaVFxKMfdnoyzPAPpeEfCbK/SkdedCiktnmLb/vJWLRqtgnbla
         FyB7EDUDvngPW16tQCzd0aF3eRnJoo6QkGqpWoH3M5jWEcrOOpzS0E7S30b9pS7S2L5g
         ibZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rM9L+7Kw3lO7Pp/XFwkGX6YGb/YVHvAdXNzLLxwfl1w=;
        b=ju7TOUPiPpu8+Q9oA2xIHWY7aW0zPg3zmFGHJNnPHiLPOpMntKbyXV4+oHHq5DwwkS
         54O5JA74xa56kx/D2qrzXT5/lakkXy4v04wHPFvN+vS5/wdFmlXZn3eu1f+mjlc7Q5U1
         mNktIlCihYyEouHCT3QKCcTSS2rmo4m8nATxOPGicXkvuuBWMtDjhV36aih94Z7WpTmK
         PDsEUu42XpRVhgVWahuFaYfrz+c+Hk7AZoRcdSt+ydD1FmwPQnR3GKJG+bLnTAAqg2DX
         iDu8wlHGkEO3sicmr4XBzYR3nz9s4GCrksSNIf/NhVQk9VrpSE9XsKfa2H3P4NkYRQGg
         Sx0w==
X-Gm-Message-State: AOAM531pOHwvlzVXMlhuGuIXjX8U5ItMniuESX1Gblvp2BusVdDalUMR
        +EyU6plEd1j7ZNHqf0N5D/ezRFU99PNXBYsogM9DKdJYkII=
X-Google-Smtp-Source: ABdhPJxCVxJYlqnudbrjWfS6pU3itZKjPGMqS0eIaTBSDqgxUzehaH8vzOPEvZydqDKJr62fsSsdkBiIDOiSjiD/ZUQ=
X-Received: by 2002:adf:d0c3:: with SMTP id z3mr32463334wrh.28.1617076767659;
 Mon, 29 Mar 2021 20:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210326231303.3071950-1-eric@anholt.net> <20210329144729.GB4203@willie-the-truck>
In-Reply-To: <20210329144729.GB4203@willie-the-truck>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 29 Mar 2021 21:02:50 -0700
Message-ID: <CAF6AEGugpEk396DVtWX=W+uf3p-wcgBfCSpSLWGQJE1vKpJ4aw@mail.gmail.com>
Subject: Re: [PATCH 1/2] iommu/arm-smmu-qcom: Skip the TTBR1 quirk for db820c.
To:     Will Deacon <will@kernel.org>
Cc:     Eric Anholt <eric@anholt.net>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 29, 2021 at 7:47 AM Will Deacon <will@kernel.org> wrote:
>
> On Fri, Mar 26, 2021 at 04:13:02PM -0700, Eric Anholt wrote:
> > db820c wants to use the qcom smmu path to get HUPCF set (which keeps
> > the GPU from wedging and then sometimes wedging the kernel after a
> > page fault), but it doesn't have separate pagetables support yet in
> > drm/msm so we can't go all the way to the TTBR1 path.
>
> What do you mean by "doesn't have separate pagetables support yet"? The
> compatible string doesn't feel like the right way to determine this.

the compatible string identifies what it is, not what the sw
limitations are, so in that regard it seems right to me..

BR,
-R
