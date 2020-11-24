Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1982C3068
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 20:06:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390919AbgKXTDy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 14:03:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390880AbgKXTDy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 14:03:54 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE6DCC0613D6;
        Tue, 24 Nov 2020 11:03:53 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id g14so8245551wrm.13;
        Tue, 24 Nov 2020 11:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kf8N/OmqZHAolew6L+ymXRNdjbnvIjwkoc3J3zrIO6o=;
        b=e4XPfFafIyuCJA3/oM5IEkO0sIKvTxq5TB/vBw5VApjZmswLIR+ss8JeVCBQc3S0YB
         utaTXD2KgvRBJSQYloFRQA3bwyim1R63U6DlE/t1zLaFkVf6C4xghKml39Z5tUdk8KE0
         FOyMsVp/6YNj0a+F4KKDzno65iOfoowVa0154Sled8pW+rU69gDbIGFGIs379KCmm2Bn
         ZxHpjoYkCCIPHBCgz4Q2ODoHHTiIRw2fRYAmW7CNSCRm8Dk2TSpWbBjoFGOb5k2sn5Wb
         xzKdxqm90TYqRiKn+hjfi33FMMy2DdVYzrfu8Tg/n3hBDZ3JwSpF8wCnmejQd5TfPZa2
         1Tww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kf8N/OmqZHAolew6L+ymXRNdjbnvIjwkoc3J3zrIO6o=;
        b=oXoqxKIZzN8rgg51x+lfFaCaQz7q7W6tkyQxU9A5Zl9dD0uf+Oc/eeVloQ11EVAXDm
         xAk12UfxhyPLTc3bw6YEcfeZXqcGJEnOyYzUF3pxAq65z/HjWgHvsA8guT5hurNpoC/9
         KUMCGxs16T0Kwo8CxijWfljgJ46FLVPpmrKEl5dG0Qzq2K7XUXmUyzKzyEzE+RaIOf0p
         iJs/vLgEMFBNeC7iJfSxtZOjbnsgYvFuAWDdZeOJIQ1Nv8lUx5Jg4gkf/siWa8QUFj5v
         nTEjhtDtBqQL598cf+uEl3L3bszK8/964EKcIed1cFM6dRfJqQCBIJm83YRXOGVR2Wbw
         RYUA==
X-Gm-Message-State: AOAM5337/P5K1o2zkPRCvanVaTTSbWlIPiIQK1DHMIfjeFnES87iadq2
        LfQrm9MzpMvebFmV7KKoLCLuLzDg1QvKHSr25sI=
X-Google-Smtp-Source: ABdhPJwW1Dno1QctDapnpNYSFC4x+KGmIfQzh+3Rg5OpwpAmPAHWb0eqXoADDsWEL4IzwAxlcJmhREL9yr7VY0C/XTc=
X-Received: by 2002:adf:f6c7:: with SMTP id y7mr6621316wrp.147.1606244632292;
 Tue, 24 Nov 2020 11:03:52 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605621785.git.saiprakash.ranjan@codeaurora.org>
 <20201123152146.GE11033@willie-the-truck> <50b68f2bdf9413b896fbe816ba4ddbc9@codeaurora.org>
 <CAF6AEGse=WBAC1WbTi6aD5_m1_NBg91f=veYm-7V=Uds7NA0Lw@mail.gmail.com>
 <1c665e33d1d27263fb5056c16d30b827@codeaurora.org> <20201124111027.GA13151@willie-the-truck>
In-Reply-To: <20201124111027.GA13151@willie-the-truck>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 24 Nov 2020 11:05:39 -0800
Message-ID: <CAF6AEGuZ2YbY=ATFBX1KJw=LwhcpH8n+zzxckTHPwwopi6mOqw@mail.gmail.com>
Subject: Re: [PATCHv8 0/8] System Cache support for GPU and required SMMU support
To:     Will Deacon <will@kernel.org>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "list@263.net:IOMMU DRIVERS , Joerg Roedel <joro@8bytes.org>," 
        <iommu@lists.linux-foundation.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Dave Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 24, 2020 at 3:10 AM Will Deacon <will@kernel.org> wrote:
>
> On Tue, Nov 24, 2020 at 09:32:54AM +0530, Sai Prakash Ranjan wrote:
> > On 2020-11-24 00:52, Rob Clark wrote:
> > > On Mon, Nov 23, 2020 at 9:01 AM Sai Prakash Ranjan
> > > <saiprakash.ranjan@codeaurora.org> wrote:
> > > >
> > > > On 2020-11-23 20:51, Will Deacon wrote:
> > > > > On Tue, Nov 17, 2020 at 08:00:39PM +0530, Sai Prakash Ranjan wrote:
> > > > >> Some hardware variants contain a system cache or the last level
> > > > >> cache(llc). This cache is typically a large block which is shared
> > > > >> by multiple clients on the SOC. GPU uses the system cache to cache
> > > > >> both the GPU data buffers(like textures) as well the SMMU pagetables.
> > > > >> This helps with improved render performance as well as lower power
> > > > >> consumption by reducing the bus traffic to the system memory.
> > > > >>
> > > > >> The system cache architecture allows the cache to be split into slices
> > > > >> which then be used by multiple SOC clients. This patch series is an
> > > > >> effort to enable and use two of those slices preallocated for the GPU,
> > > > >> one for the GPU data buffers and another for the GPU SMMU hardware
> > > > >> pagetables.
> > > > >>
> > > > >> Patch 1 - Patch 6 adds system cache support in SMMU and GPU driver.
> > > > >> Patch 7 and 8 are minor cleanups for arm-smmu impl.
> > > > >>
> > > > >> Changes in v8:
> > > > >>  * Introduce a generic domain attribute for pagetable config (Will)
> > > > >>  * Rename quirk to more generic IO_PGTABLE_QUIRK_ARM_OUTER_WBWA (Will)
> > > > >>  * Move non-strict mode to use new struct domain_attr_io_pgtbl_config
> > > > >> (Will)
> > > > >
> > > > > Modulo some minor comments I've made, this looks good to me. What is
> > > > > the
> > > > > plan for merging it? I can take the IOMMU parts, but patches 4-6 touch
> > > > > the
> > > > > MSM GPU driver and I'd like to avoid conflicts with that.
> > > > >
> > > >
> > > > SMMU bits are pretty much independent and GPU relies on the domain
> > > > attribute
> > > > and the quirk exposed, so as long as SMMU changes go in first it
> > > > should
> > > > be good.
> > > > Rob?
> > >
> > > I suppose one option would be to split out the patch that adds the
> > > attribute into it's own patch, and merge that both thru drm and iommu?
> > >
> >
> > Ok I can split out domain attr and quirk into its own patch if Will is
> > fine with that approach.
>
> Why don't I just queue the first two patches on their own branch and we
> both pull that?

Ok, that works for me.  I normally base msm-next on -rc1 but I guess
as long as we base the branch on the older or our two -next branches,
that should work out nicely

BR,
-R
