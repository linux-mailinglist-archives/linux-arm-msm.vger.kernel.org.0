Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF95A243C36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Aug 2020 17:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgHMPKT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 11:10:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbgHMPKS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 11:10:18 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55B34C061757;
        Thu, 13 Aug 2020 08:10:18 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id c80so4994682wme.0;
        Thu, 13 Aug 2020 08:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nuLP0ucN1jD0A5G/rbjKQ0IWTQZyFeBE7AA1MgUnySo=;
        b=uHdjMt59zx0NWygGT00vboekxP3muBYPVwS1Set3BcG6z8f9Lx3CEiTDhCKPM9Fj7d
         H7Zghzlo38jK3BNe6Q/V7mEVtBr96Qd6pWv5YN+FQsLmKLzb+BlOtjhpLdyO7zcNasUt
         Py62w87WtnJ8ls6D/5boqyKOaxS1li243OWJHj/gZv6ssIWfKoSLql/plqXYDPQEamXA
         kWGIOT1W3eFYxHLOeKNUv8Ys9xi9IEJYuFhvnN4Wt4dpfnAnzIzV6XdJXgAqHTT1liH2
         vG81U09rx74e6TuMs+pYpJhfXRlGxsHZasQ6K4UUntka++VMsPreF97mb6jnlEVEK+lk
         FnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nuLP0ucN1jD0A5G/rbjKQ0IWTQZyFeBE7AA1MgUnySo=;
        b=k22Ro+WzXPadftnW/cCISOX+LOpPAzEa51zAoV1LcN54Nw1x4tjy9Q1SBzUV2TqIcB
         6LlGAZTMHVGXmhgDjK1R1f3VsB5qWG/hGjE6itlwbOtEK+/1yYKJ4YUM1LouaqPWLHyc
         ff++mPoxmHcXssHZ77gL5uVT6vhfbh78xTFUb9D/viSJx2//aSzyDU22e1W2dq657rcL
         F5keJJiBg4tFbxvywaPF7Pz4LAx+eFp4+PkI69ftUxbmQOWkZGKlyETBad4Kc54aaHaP
         ka34KAmQPswvp3defauWXngZaDUJ1udIy73a/TKUVz1z8IKzNFkCSQFC8Phco+9frDil
         +2Xg==
X-Gm-Message-State: AOAM531cgzabqy1cAIAryDPUx5KXPugcoYVAw4OBUrMdNGoYvtOQ4Bc9
        6LOlCCrh1x468VkKcr051mF/2DI7ErBtCdB0Bm4=
X-Google-Smtp-Source: ABdhPJwyUB412yvyp91ddO2jHXQbWOlzquN4PZJB8fEibTvHbohj1VvNGz9vxVColKj4PFzWEixM2vzufgv+z0SGwwo=
X-Received: by 2002:a1c:4c17:: with SMTP id z23mr5049269wmf.49.1597331416969;
 Thu, 13 Aug 2020 08:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
 <20200810222657.1841322-5-jcrouse@codeaurora.org> <20200813131412.GB10256@willie-the-truck>
In-Reply-To: <20200813131412.GB10256@willie-the-truck>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 13 Aug 2020 08:11:02 -0700
Message-ID: <CAF6AEGuCubnXu7FKuCHPx0Bow4O7M8NSBThHDusev7xX6v2zQQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v12 04/13] iommu: Add a domain attribute to
 get/set a pagetable configuration
To:     Will Deacon <will@kernel.org>
Cc:     Jordan Crouse <jcrouse@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 13, 2020 at 6:14 AM Will Deacon <will@kernel.org> wrote:
>
> On Mon, Aug 10, 2020 at 04:26:48PM -0600, Jordan Crouse wrote:
> > Add domain attribute DOMAIN_ATTR_PGTABLE_CFG. This will be used by
> > arm-smmu to share the current pagetable configuration with the
> > leaf driver and to allow the leaf driver to set up a new pagetable
> > configuration under certain circumstances.
> >
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > ---
> >
> >  include/linux/iommu.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> > index fee209efb756..995ab8c47ef2 100644
> > --- a/include/linux/iommu.h
> > +++ b/include/linux/iommu.h
> > @@ -118,6 +118,7 @@ enum iommu_attr {
> >       DOMAIN_ATTR_FSL_PAMUV1,
> >       DOMAIN_ATTR_NESTING,    /* two stages of translation */
> >       DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE,
> > +     DOMAIN_ATTR_PGTABLE_CFG,
> >       DOMAIN_ATTR_MAX,
> >  };
>
> Nobody other than the adreno gpu uses this, so can we avoid exposing it
> in the IOMMU API, please? Given that you have a reference to the adreno
> GPU device in the SMMU implementation code thanks to .alloc_context_bank(),
> can you squirrel some function pointers away in the driver data (i.e. with
> dev_set_drvdata()) instead?
>

Hmm, we are already using drvdata on the gpu side, and it looks like
arm-smmu is also using it.  Could we get away with stashing an extra
'void *' in iommu_domain itself?

Or alternatively, if we had a is_arm_smmu_domain(domain), then we
could just directly call some exported private fxns with the domain
ptr (which could then verify that the domain is actually an
arm_smmu_domain, and then from there that the smmu is indeed
qcom,adreno-smmu, to keep things sane)

BR,
-R
