Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8A363B46C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 17:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhFYPlW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 11:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbhFYPlV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 11:41:21 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA848C061574;
        Fri, 25 Jun 2021 08:39:00 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id d11so11123025wrm.0;
        Fri, 25 Jun 2021 08:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vdo63xtloDEOamPYATEH0AS03eYl+iSZfl6fPLjUbC0=;
        b=Jb0i1Lvqmij+LCFT/Mg28ra5KlS0qJQBQ26bnZVtH4y9cZM+GnQHp1dvUZ3LUnWJU1
         VzKHiDXKJ9TXOkl17FLwldxn5maUTbOx3wMjeu2i22mk56UmTrPM2C2y1zrh2p4371l0
         ngGo21DjmXU8rIwuOaB0GEvcMZhCKAAVE7WsMozqU4xp0DWnN/diafx6zcMFlVz8YtbY
         aIz9j5DOTQ8JoWobUYeiB5EYVcMY3rgGVqh20F/KXHQpiUCypMMwLwq0Qv/Y/y5sMS5I
         Wf5LtD+mCjflS70/C4h1O3yl6AOOjPMzZUBQRWl3uyvHi7tsu3jsi7mwnFUC1vgtP6yY
         uOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vdo63xtloDEOamPYATEH0AS03eYl+iSZfl6fPLjUbC0=;
        b=aZABjipyttOMlu7fLnwSiFSv2hdvv1vCwyF/4XEELg3ajRwqGRbWrp9BwN74qtrt3h
         pMUoG4Bxy91nVBsQa5NWI4+ZM6TnB74bkGkS/2zQjTaiWDzS7eTE6sMZ90PEIiUIN1pe
         Dwwzo0HQdKy0tlipFyGI//NHML5VFzrE1ta8Otu1y1MGi4owFuts66muwybxmGnjycRX
         MT4h/XLFhaaTHeja8k7oseyt+gZxMEr4gri9JLF9/6FQcVcs4SWqWtOyhnqLe5AbjY0n
         PdxYi5Oz2nHpGQCpEbTEGVupBR96PwNNp4qnISSLKIW33/PpEt7RidI4UU5yE8p31kMe
         MKtQ==
X-Gm-Message-State: AOAM533wajntQ+M185nCQpKPpiwTHvbn4AGpzBbq7hbBB13ku4JafuGd
        AeALCVxypogO7dorHZLc0kiU+dnwoow07oYEacM=
X-Google-Smtp-Source: ABdhPJxMd2QD5QxjGCuh4pj9v343g3SW9Px0O12bqlsmSQOJev5MZ4vy4Nc2H7rSC6xBZLfN8VeV69ccnD8vSa1vkF0=
X-Received: by 2002:adf:fcc5:: with SMTP id f5mr11934898wrs.83.1624635539523;
 Fri, 25 Jun 2021 08:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210610214431.539029-1-robdclark@gmail.com> <20210610214431.539029-4-robdclark@gmail.com>
 <YNVP6rfQ699BejsI@yoga>
In-Reply-To: <YNVP6rfQ699BejsI@yoga>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 25 Jun 2021 08:42:59 -0700
Message-ID: <CAF6AEGvTjTUQXqom-xhdh456tdLscbVFPQ+iud1H1gHc8A2=hA@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] drm/msm: Improve the a6xx page fault handler
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Rob Clark <robdclark@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 24, 2021 at 8:39 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 10 Jun 16:44 CDT 2021, Rob Clark wrote:
> [..]
> > diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> > index 50d881794758..6975b95c3c29 100644
> > --- a/drivers/gpu/drm/msm/msm_iommu.c
> > +++ b/drivers/gpu/drm/msm/msm_iommu.c
> > @@ -211,8 +211,17 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
> >               unsigned long iova, int flags, void *arg)
> >  {
> >       struct msm_iommu *iommu = arg;
> > +     struct adreno_smmu_priv *adreno_smmu = dev_get_drvdata(iommu->base.dev);
> > +     struct adreno_smmu_fault_info info, *ptr = NULL;
> > +
> > +     if (adreno_smmu->get_fault_info) {
>
> This seemed reasonable when I read it last time, but I didn't realize
> that the msm_fault_handler() is installed for all msm_iommu instances.
>
> So while we're trying to recover from the boot splash and setup the new
> framebuffer we end up here with iommu->base.dev being the mdss device.
> Naturally drvdata of mdss is not a struct adreno_smmu_priv.
>
> > +             adreno_smmu->get_fault_info(adreno_smmu->cookie, &info);
>
> So here we just jump straight out into hyperspace, never to return.
>
> Not sure how to wire this up to avoid the problem, but right now I don't
> think we can boot any device with a boot splash.
>

I think we could do:

------------------------
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index eed2a762e9dd..30ee8866154e 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -29,6 +29,9 @@ static struct msm_iommu_pagetable
*to_pagetable(struct msm_mmu *mmu)
  return container_of(mmu, struct msm_iommu_pagetable, base);
 }

+static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
+ unsigned long iova, int flags, void *arg);
+
 static int msm_iommu_pagetable_unmap(struct msm_mmu *mmu, u64 iova,
  size_t size)
 {
@@ -151,6 +154,8 @@ struct msm_mmu *msm_iommu_pagetable_create(struct
msm_mmu *parent)
  struct io_pgtable_cfg ttbr0_cfg;
  int ret;

+ iommu_set_fault_handler(iommu->domain, msm_fault_handler, iommu);
+
  /* Get the pagetable configuration from the domain */
  if (adreno_smmu->cookie)
  ttbr1_cfg = adreno_smmu->get_ttbr1_cfg(adreno_smmu->cookie);
@@ -300,7 +305,6 @@ struct msm_mmu *msm_iommu_new(struct device *dev,
struct iommu_domain *domain)

  iommu->domain = domain;
  msm_mmu_init(&iommu->base, dev, &funcs, MSM_MMU_IOMMU);
- iommu_set_fault_handler(domain, msm_fault_handler, iommu);

  atomic_set(&iommu->pagetables, 0);

------------------------

That would have the result of setting the same fault handler multiple
times, but that looks harmless.  Mostly the fault handling stuff is to
make it easier to debug userspace issues, the fallback dmesg spam from
arm-smmu should be sufficient for any kernel side issues.

BR,
-R
