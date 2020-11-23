Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7882C1468
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 20:29:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732030AbgKWTUq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 14:20:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726953AbgKWTUq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 14:20:46 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D338DC0613CF;
        Mon, 23 Nov 2020 11:20:45 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id s8so19683661wrw.10;
        Mon, 23 Nov 2020 11:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qywik7ZeoNLjOI/OiRzyEWbv5L3UmV1jd3xo8upxDsg=;
        b=D3LUaTo9sjQT2psf9iOfR5Q+w/hWOKbYJIrGkOwrSKId0+dXBhN2JbAKZrdU51cvlB
         2TH/BH6AH3DKIlQMdVT/V8i+l/yJ0ztIDwjnuj5ekXsttMcEx45j51pC0OifHlxSPhYg
         Vk+onO+4dhk/KXF75P7ZKjh+voUOJ9oSQjQwUJDgxbPMNzzW/mCkzUromNJl14ewjTbQ
         hnFhD+OP+mQd1nGunov0a3cqO2Ge91PFnaB9BUbjoIR7Xh+5gqsSdXq8Qw6VGchsGoGF
         0vJhoOfb411RYFqRARv8q6FJ4UVj/X+YELsIA4bt6jG6BaYQDZlj6Yq4zmlmJcnYBMzK
         BWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qywik7ZeoNLjOI/OiRzyEWbv5L3UmV1jd3xo8upxDsg=;
        b=XmPx2hkMrnYUhHcS4S1tEmaYUkZjSGYKuuODpmTqm1+XxaBIo7Af1e2pu4vK6+AOPZ
         shcAiXCq6C0LkfuRPogcjSJs1tFDCs+VgAHUQqtfA8qma4awxLGbkZM1HmDAI1NuffAw
         7maoqB3ub9B4BrekEQvjcLs4HoRQexLwALmUUBw5rgFSTeKH7ghv5vIQrLXkz/RGX1rD
         O1n6vhkm5LJe46n+HXbPavDCrJzliX32C7scDCeZoX48XoIAx+Kr9iZiMSK47JTwkNis
         wq6UdpptwrMxiiCFgOmyhm80zGbGJdL3uNmS/nzMJUvqX1BGbiVWreUkEujAMrD8HfmY
         KAQw==
X-Gm-Message-State: AOAM533FKlzgnZTiOfM/gMdqPg4TmoshbcxmNtG6xS4bK/hY2QW9duxC
        7caLREG7kcYt6f2Er2bd1xl4lwszS2ySisw7vh8=
X-Google-Smtp-Source: ABdhPJy8N53HXm9IuUy+KZQkqOt4/pj9ITZPgRIZbKk5Hw32UENtsWfsI7ELNiEQlwY8TBRX7HEq8kOv+802Ag6uHEw=
X-Received: by 2002:adf:a54d:: with SMTP id j13mr1337431wrb.132.1606159244462;
 Mon, 23 Nov 2020 11:20:44 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605621785.git.saiprakash.ranjan@codeaurora.org>
 <20201123152146.GE11033@willie-the-truck> <50b68f2bdf9413b896fbe816ba4ddbc9@codeaurora.org>
In-Reply-To: <50b68f2bdf9413b896fbe816ba4ddbc9@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 23 Nov 2020 11:22:31 -0800
Message-ID: <CAF6AEGse=WBAC1WbTi6aD5_m1_NBg91f=veYm-7V=Uds7NA0Lw@mail.gmail.com>
Subject: Re: [PATCHv8 0/8] System Cache support for GPU and required SMMU support
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 23, 2020 at 9:01 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> On 2020-11-23 20:51, Will Deacon wrote:
> > On Tue, Nov 17, 2020 at 08:00:39PM +0530, Sai Prakash Ranjan wrote:
> >> Some hardware variants contain a system cache or the last level
> >> cache(llc). This cache is typically a large block which is shared
> >> by multiple clients on the SOC. GPU uses the system cache to cache
> >> both the GPU data buffers(like textures) as well the SMMU pagetables.
> >> This helps with improved render performance as well as lower power
> >> consumption by reducing the bus traffic to the system memory.
> >>
> >> The system cache architecture allows the cache to be split into slices
> >> which then be used by multiple SOC clients. This patch series is an
> >> effort to enable and use two of those slices preallocated for the GPU,
> >> one for the GPU data buffers and another for the GPU SMMU hardware
> >> pagetables.
> >>
> >> Patch 1 - Patch 6 adds system cache support in SMMU and GPU driver.
> >> Patch 7 and 8 are minor cleanups for arm-smmu impl.
> >>
> >> Changes in v8:
> >>  * Introduce a generic domain attribute for pagetable config (Will)
> >>  * Rename quirk to more generic IO_PGTABLE_QUIRK_ARM_OUTER_WBWA (Will)
> >>  * Move non-strict mode to use new struct domain_attr_io_pgtbl_config
> >> (Will)
> >
> > Modulo some minor comments I've made, this looks good to me. What is
> > the
> > plan for merging it? I can take the IOMMU parts, but patches 4-6 touch
> > the
> > MSM GPU driver and I'd like to avoid conflicts with that.
> >
>
> SMMU bits are pretty much independent and GPU relies on the domain
> attribute
> and the quirk exposed, so as long as SMMU changes go in first it should
> be good.
> Rob?

I suppose one option would be to split out the patch that adds the
attribute into it's own patch, and merge that both thru drm and iommu?

If Will/Robin dislike that approach, I'll pick up the parts of the drm
patches which don't depend on the new attribute for v5.11 and the rest
for v5.12.. or possibly a second late v5.11 pull req if airlied
doesn't hate me too much for it.

Going forward, I think we will have one or two more co-dependent
series, like the smmu iova fault handler improvements that Jordan
posted.  So I would like to hear how Will and Robin prefer to handle
those.

BR,
-R


> Thanks,
> Sai
>
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
> member
> of Code Aurora Forum, hosted by The Linux Foundation
