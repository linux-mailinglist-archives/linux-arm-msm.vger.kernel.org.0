Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F383721BFD1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2020 00:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgGJWcT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 18:32:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbgGJWcS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 18:32:18 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AC53C08C5DC;
        Fri, 10 Jul 2020 15:32:18 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id n2so5793379edr.5;
        Fri, 10 Jul 2020 15:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hC/t/UWj0gzx3eIP1BTTzm43qPL8ICwohGRJ0LMjFVw=;
        b=GTYlPkhY1rTWLrI0uIyPh775vI/PSmVyK3vjQKl6GOsL86YZIrN/w2snfchxzNBK8F
         hXfmwHxavHt7jsiRimk5QpuZyvJwpUx9dIuNENC1KRAAaqCIiXhBg5ccsYbFT2e92tMe
         tjkqoEgnzCagc8LdVzwM+CrrmwRTggHuNdJdRzXfo6vJjHXp2xe/zRvXmgZVTiMiGFeM
         7k0jV54XZEMNr85He8tbyslR8A+sETHx5pDckKENFBkIyA/2JVXIxgOVYaMXNN2hveuy
         88R/TYHLO0WUDxyZbCXWNDrO9RK9SJNmYnAi3e6p0CIgBnyX0IFlaSi+IvIIZVkImSbg
         ig2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hC/t/UWj0gzx3eIP1BTTzm43qPL8ICwohGRJ0LMjFVw=;
        b=VeIJEXZ6A9p03b7WdxnUalARxZ749LDWS10VM7RWFk0bQ5ztvSa8ofGaKOFy9wIwRC
         fm3BRQ6qnKQW+KAXEZ6wwAKs+HFtW3gwTV05gUdPdK0+M7jmbdm0f7n1neGKziQ3jSK1
         t2CuvQUjprdjA4UWnyK3rh4J7Gi5l6yTIsNxbYf1Kh/t68P9pvRRiopfIEdUh7ydmNpg
         UP36VnfDk7WU10bx//IL6x2x2w4cfwxLw7V4wsnwdgblZ/7E/NNQV3ctIieJ2gE81nrK
         own5Xbqc3dYzRHIf2CvXkV45WDYU7G669GkCwxITA4QB6x5h8QtTIbGe6MQuAkdVpSc4
         uWTQ==
X-Gm-Message-State: AOAM530TnkT7VNSgoj6ou2NkgK93VQ+TyUPngO7tMYa3U5vH2eO+2KSP
        a/Z63XwlSzzuR/rfZ0vpVs4WH3r7bKjc8A7fZFY=
X-Google-Smtp-Source: ABdhPJwkVXYq7s6PZW4g2BtXeq8ENJ9m7mJ76wVcUJ3EL/dalxWRMHPdCDGlcWRBNMIU2acGDELFeA6gBPgKHHjwvcY=
X-Received: by 2002:aa7:c656:: with SMTP id z22mr67419136edr.101.1594420337003;
 Fri, 10 Jul 2020 15:32:17 -0700 (PDT)
MIME-Version: 1.0
References: <1594324828-9571-1-git-send-email-akhilpo@codeaurora.org>
 <1594324828-9571-5-git-send-email-akhilpo@codeaurora.org> <CAF6AEGv4Nc6ZAxGoCC1s5KT=rxLR6uZDHfDnWZRnnLhqnegOpA@mail.gmail.com>
 <17afba8b-dae5-d724-4c8c-8b4c79fcfb84@codeaurora.org>
In-Reply-To: <17afba8b-dae5-d724-4c8c-8b4c79fcfb84@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 10 Jul 2020 15:32:48 -0700
Message-ID: <CAF6AEGtramec7yTE1mzLO=Vtic63LOgM1pEuejUS3OrT3_vGng@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v4 4/7] drm: msm: a6xx: use dev_pm_opp_set_bw
 to scale DDR
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Jonathan <jonathan@marek.ca>,
        saravanak@google.com,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        dri-devel@freedesktop.org, Viresh Kumar <viresh.kumar@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 10, 2020 at 2:03 PM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
>
> On 7/11/2020 1:11 AM, Rob Clark wrote:
> > On Thu, Jul 9, 2020 at 1:01 PM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
> >> From: Sharat Masetty <smasetty@codeaurora.org>
> >>
> >> This patches replaces the previously used static DDR vote and uses
> >> dev_pm_opp_set_bw() to scale GPU->DDR bandwidth along with scaling
> >> GPU frequency. Also since the icc path voting is handled completely
> >> in the opp driver, remove the icc_path handle and its usage in the
> >> drm driver.
> >>
> >> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> >> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> >> ---
> >>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 25 +++++++++++++++++--------
> >>   1 file changed, 17 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >> index b547339..6fbfd7d 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> >> @@ -123,7 +123,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
> >>
> >>          if (!gmu->legacy) {
> >>                  a6xx_hfi_set_freq(gmu, gmu->current_perf_index);
> >> -               icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
> >> +               dev_pm_opp_set_bw(&gpu->pdev->dev, opp);
> > What is the status of the patch to add dev_pm_opp_set_bw()?  If it is
> > ready to go, and I get an ack-by from the OPP maintainer, I suppose I
> > could merge it via drm/msm.
> >
> > Otherwise should we consider pulling in a private copy of it into
> > drm/msm (and then drop it to use the helper in, hopefully, the next
> > cycle)?
> >
> > I'm pulling the patches preceding this one into msm-next-staging to do
> > some testing.  And the dt patches following this one would normally
> > get merged via Bjorn.  At the moment, I'm not sure what to do with
> > this one.
> >
> > BR,
> > -R
> I see Sibi's patch is already picked in opp/linux-next branch.
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/vireshk/pm/+/b466542f331e221a3628c1cfe5ccff307d7d787f
>

ok, I guess we can try and do a 2nd late pull-req for msm-next, after
the opp pull-req lands..

BR,
-R

>
> Thanks,
> -Akhil
>
> >>                  return;
> >>          }
> >>
> >> @@ -149,11 +149,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
> >>          if (ret)
> >>                  dev_err(gmu->dev, "GMU set GPU frequency error: %d\n", ret);
> >>
> >> -       /*
> >> -        * Eventually we will want to scale the path vote with the frequency but
> >> -        * for now leave it at max so that the performance is nominal.
> >> -        */
> >> -       icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
> >> +       dev_pm_opp_set_bw(&gpu->pdev->dev, opp);
> >>   }
> >>
> >>   unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
> >> @@ -840,6 +836,19 @@ static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
> >>          dev_pm_opp_put(gpu_opp);
> >>   }
> >>
> >> +static void a6xx_gmu_set_initial_bw(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
> >> +{
> >> +       struct dev_pm_opp *gpu_opp;
> >> +       unsigned long gpu_freq = gmu->gpu_freqs[gmu->current_perf_index];
> >> +
> >> +       gpu_opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, gpu_freq, true);
> >> +       if (IS_ERR_OR_NULL(gpu_opp))
> >> +               return;
> >> +
> >> +       dev_pm_opp_set_bw(&gpu->pdev->dev, gpu_opp);
> >> +       dev_pm_opp_put(gpu_opp);
> >> +}
> >> +
> >>   int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
> >>   {
> >>          struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> >> @@ -864,7 +873,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
> >>          }
> >>
> >>          /* Set the bus quota to a reasonable value for boot */
> >> -       icc_set_bw(gpu->icc_path, 0, MBps_to_icc(3072));
> >> +       a6xx_gmu_set_initial_bw(gpu, gmu);
> >>
> >>          /* Enable the GMU interrupt */
> >>          gmu_write(gmu, REG_A6XX_GMU_AO_HOST_INTERRUPT_CLR, ~0);
> >> @@ -1040,7 +1049,7 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
> >>                  a6xx_gmu_shutdown(gmu);
> >>
> >>          /* Remove the bus vote */
> >> -       icc_set_bw(gpu->icc_path, 0, 0);
> >> +       dev_pm_opp_set_bw(&gpu->pdev->dev, NULL);
> >>
> >>          /*
> >>           * Make sure the GX domain is off before turning off the GMU (CX)
> >> --
> >> 2.7.4
> >>
> >> _______________________________________________
> >> Freedreno mailing list
> >> Freedreno@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/freedreno
