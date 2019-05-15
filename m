Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80EF21FD88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2019 03:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbfEPBqV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 May 2019 21:46:21 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37155 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbfEOXuw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 May 2019 19:50:52 -0400
Received: by mail-pf1-f196.google.com with SMTP id g3so801847pfi.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2019 16:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+Ov6B2ldvLlkcsttAAHJpxxV6SegJmYe7r9olqOW9uE=;
        b=QpKkk5YXMS7CBlSl1vIdfsyFyOOwYp6MUCnZuGZMKCqgD1gLjpqZoq709C+GrmfzXA
         ki8k2UucVYn4rEa/CG6plpGX1zTFi9ghB2mQbZj49JC2mmBpU8clIx3VN2aX/7xRX9Ev
         vJeX5vfZiZm5aPnSOihYJkhQZEXNXeSnx6t/OlmHE/A0zsOILHxe55lpBgdfj5BnburA
         TfBMmTibCYq7OVnk0dg3G/KFfnamTjJDeB3huHCLmrI3CwEiG+CHiLS8OTepWRF/lfAe
         YVzWllKrXSeBaipbAGWw+Vol7aeLai33yNgVFGdGyKgn1v41R2ZFZ3n1T7cEPV05Fti1
         v/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+Ov6B2ldvLlkcsttAAHJpxxV6SegJmYe7r9olqOW9uE=;
        b=jHE5jCpdJ6ngvEsd5f7KapUz1GKnFcjetEsui8BiDXsk39DMfJarK1CoPzMLQCrp33
         VF+Bckw2ZpXr2U9Q8oglpC9kdaSjW8zYP8RBA/LD2inKURpzka/pq+rrdeslAXGmU10o
         gB3beKgqe7yGh0QcxEr9qNAHBT+5vDjzxcd9VkIrg1VvgnoT2dq5I3fpm1xST/GEtlwG
         61kpJAOd488W4vjVJfkbv/254nTpAbDukkuULSidswRdq5o2tbDfmMsX193XY0B5M6ex
         ctriGiVzMCf/BChy+I9qdq4Yl685kATvJoK/lOw10pnJWbyWMLL2+z/wD8Z3S3cbBejT
         Ysbw==
X-Gm-Message-State: APjAAAXqoxmw9pE2zvsIlyOin4Q1LjaQSOl9gU+YF1urTIV0f61Clg3A
        mluotIJmYMYqT+b4VckI3nU8zA==
X-Google-Smtp-Source: APXvYqydZnB9tStsLQJ4no73yXQFM3MTO1wqIbjphUc3nshRpLhRc0U4N88NNldcW7XdlEsyWlXPPw==
X-Received: by 2002:a63:6b41:: with SMTP id g62mr35474675pgc.240.1557964251817;
        Wed, 15 May 2019 16:50:51 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id k192sm2720606pga.20.2019.05.15.16.50.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 May 2019 16:50:50 -0700 (PDT)
Date:   Wed, 15 May 2019 16:50:48 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Upgrade gxpd checks to IS_ERR_OR_NULL
Message-ID: <20190515235048.GQ31438@minitux>
References: <20190515170104.155525-1-sean@poorly.run>
 <20190515193904.GE24137@jcrouse1-lnx.qualcomm.com>
 <CAMavQKKxUDX-tOLULDfZxcizysWOr63VvBBT8fNa-VB=v8jvVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMavQKKxUDX-tOLULDfZxcizysWOr63VvBBT8fNa-VB=v8jvVQ@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 15 May 13:07 PDT 2019, Sean Paul wrote:

> On Wed, May 15, 2019 at 3:39 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> >
> > On Wed, May 15, 2019 at 01:00:52PM -0400, Sean Paul wrote:
> > > From: Sean Paul <seanpaul@chromium.org>
> > >
> > > dev_pm_domain_attach_by_name() can return NULL, so we should check for
> > > that case when we're about to dereference gxpd.
> > >
> > > Fixes: 9325d4266afd ("drm/msm/gpu: Attach to the GPU GX power domain")
> > > Cc: Jordan Crouse <jcrouse@codeaurora.org>
> > > Cc: Rob Clark <robdclark@chromium.org>
> > > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> >
> > Reviewed-by: Jordan Crouse <jcrouse@codeauorora.org>
> >
> 
> Thanks for the review, I've applied it to -misc-next-fixes with the
> other msm fixes for 5.2
> 

Thanks for fixing this.

I hadn't published my for-next-next branch when I spotted this, so the
addition of the GPU in the dts was amended to include the gxpd - and
will show up on -next after -rc1.

Regards,
Bjorn

> 
> Sean
> 
> > > ---
> > >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > index 9155dafae2a90..38e2cfa9cec79 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > > @@ -747,7 +747,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
> > >        * will make sure that the refcounting is correct in case we need to
> > >        * bring down the GX after a GMU failure
> > >        */
> > > -     if (!IS_ERR(gmu->gxpd))
> > > +     if (!IS_ERR_OR_NULL(gmu->gxpd))
> > >               pm_runtime_get(gmu->gxpd);
> > >
> > >  out:
> > > @@ -863,7 +863,7 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
> > >        * domain. Usually the GMU does this but only if the shutdown sequence
> > >        * was successful
> > >        */
> > > -     if (!IS_ERR(gmu->gxpd))
> > > +     if (!IS_ERR_OR_NULL(gmu->gxpd))
> > >               pm_runtime_put_sync(gmu->gxpd);
> > >
> > >       clk_bulk_disable_unprepare(gmu->nr_clocks, gmu->clocks);
> > > @@ -1234,7 +1234,7 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
> > >
> > >       pm_runtime_disable(gmu->dev);
> > >
> > > -     if (!IS_ERR(gmu->gxpd)) {
> > > +     if (!IS_ERR_OR_NULL(gmu->gxpd)) {
> > >               pm_runtime_disable(gmu->gxpd);
> > >               dev_pm_domain_detach(gmu->gxpd, false);
> > >       }
> > > --
> > > Sean Paul, Software Engineer, Google / Chromium OS
> > >
> >
> > --
> > The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> > a Linux Foundation Collaborative Project
