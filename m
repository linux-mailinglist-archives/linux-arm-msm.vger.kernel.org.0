Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A592A1FB5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2019 22:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbfEOUIO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 May 2019 16:08:14 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:32942 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726124AbfEOUIO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 May 2019 16:08:14 -0400
Received: by mail-vs1-f65.google.com with SMTP id y6so798695vsb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2019 13:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=v48zyXjM+0T7zugWwKkaSHzGROBxp5MaD7k3bo3xnQA=;
        b=dRy6jUWevG+0XhP6OTr7k/DY51m5lCsFaJkkZcm1nGHHVfpqk2yboQlaciHA6UqGAY
         1WisHud/8P4Ed6MmG1zJgV3IgVbGXq+qg+WBPoOYK6oM3vlxe8xPoAEX16vq/wgvc4bE
         CFf8sukd70kKuRBXsCmfyS+bW6Vm7++aLljb4FnpBCxa+g7wwBfbjCrwqea5DpK9MSQ3
         zVzUiXmHgLyONDaC+OjZs5+sENfqNsD0qGLEvTEIqd8yYAqUNPh2W4e6xfuGrBZFZsk2
         YpN5iGd3qM265ObrDKxl2PwAs0VER3ysmq3T+RBOiyt583tGgm1pJghYmSHKWz/TywNM
         DV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=v48zyXjM+0T7zugWwKkaSHzGROBxp5MaD7k3bo3xnQA=;
        b=saToo+lw9Bv3jgkLhc0qJZ8yeyTH/CIXlxcZ33rDhS64qEVzdj2Jboio8xUUGE4fSX
         MzyEXOhZ+bYKVZRhEoXNuXa8F0VzvWOQ74LQR/9firGiQMSf09X0WehPmp9SKctOnvFP
         UVMeHbUqFXllhSbdIDK3Z2egdVTRwfSaYIJJOkPN5+pus4FfhR3ufz2mM4kuH++9UOdC
         k2eDDsBXGXrqmcnqP9Dcm9yqREFtqb4WQA8pLtmXBaGlXlIXNSDtZ1jKmEqehDYnQQcS
         Rm0NlCsAZULmP88M2qYUNXBiYQKD4L/YbkXvf0dNVTtzVF0xL2/wNeepTBl0kdi7oQcI
         1kPQ==
X-Gm-Message-State: APjAAAWyaCR4zHjdY9Ylbr+0tYhXBgVStN4B2l9tBsCa0+hOBh0Y0RY+
        bVTmkLmZwSzonq5E4kcctkAI/2luXJJAeKJwnQ6kCw==
X-Google-Smtp-Source: APXvYqysnnQ3i41oD1FSw+qj90+S478GDLPURo5Z3hBgXdt8GVd806sYNUFVdgQN0vWea5eMtp7/yipVR53sFrgmoW8=
X-Received: by 2002:a67:d806:: with SMTP id e6mr5468439vsj.43.1557950893516;
 Wed, 15 May 2019 13:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190515170104.155525-1-sean@poorly.run> <20190515193904.GE24137@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20190515193904.GE24137@jcrouse1-lnx.qualcomm.com>
From:   Sean Paul <sean@poorly.run>
Date:   Wed, 15 May 2019 16:07:37 -0400
Message-ID: <CAMavQKKxUDX-tOLULDfZxcizysWOr63VvBBT8fNa-VB=v8jvVQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Upgrade gxpd checks to IS_ERR_OR_NULL
To:     Sean Paul <sean@poorly.run>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 15, 2019 at 3:39 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Wed, May 15, 2019 at 01:00:52PM -0400, Sean Paul wrote:
> > From: Sean Paul <seanpaul@chromium.org>
> >
> > dev_pm_domain_attach_by_name() can return NULL, so we should check for
> > that case when we're about to dereference gxpd.
> >
> > Fixes: 9325d4266afd ("drm/msm/gpu: Attach to the GPU GX power domain")
> > Cc: Jordan Crouse <jcrouse@codeaurora.org>
> > Cc: Rob Clark <robdclark@chromium.org>
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
>
> Reviewed-by: Jordan Crouse <jcrouse@codeauorora.org>
>

Thanks for the review, I've applied it to -misc-next-fixes with the
other msm fixes for 5.2


Sean

> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > index 9155dafae2a90..38e2cfa9cec79 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > @@ -747,7 +747,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
> >        * will make sure that the refcounting is correct in case we need to
> >        * bring down the GX after a GMU failure
> >        */
> > -     if (!IS_ERR(gmu->gxpd))
> > +     if (!IS_ERR_OR_NULL(gmu->gxpd))
> >               pm_runtime_get(gmu->gxpd);
> >
> >  out:
> > @@ -863,7 +863,7 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
> >        * domain. Usually the GMU does this but only if the shutdown sequence
> >        * was successful
> >        */
> > -     if (!IS_ERR(gmu->gxpd))
> > +     if (!IS_ERR_OR_NULL(gmu->gxpd))
> >               pm_runtime_put_sync(gmu->gxpd);
> >
> >       clk_bulk_disable_unprepare(gmu->nr_clocks, gmu->clocks);
> > @@ -1234,7 +1234,7 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
> >
> >       pm_runtime_disable(gmu->dev);
> >
> > -     if (!IS_ERR(gmu->gxpd)) {
> > +     if (!IS_ERR_OR_NULL(gmu->gxpd)) {
> >               pm_runtime_disable(gmu->gxpd);
> >               dev_pm_domain_detach(gmu->gxpd, false);
> >       }
> > --
> > Sean Paul, Software Engineer, Google / Chromium OS
> >
>
> --
> The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
