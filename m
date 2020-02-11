Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC8AC15934D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2020 16:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728368AbgBKPjB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Feb 2020 10:39:01 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:46339 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728200AbgBKPjA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Feb 2020 10:39:00 -0500
Received: by mail-ed1-f65.google.com with SMTP id m8so5121981edi.13;
        Tue, 11 Feb 2020 07:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CNtQvmrBREea9Fl7G/3MlJk6sbdKLk9I8E30fCKcW9E=;
        b=NqOrIcn7ZyJR+lqAv/YIVy9x21yiVOoENdZzILnUjw7Ymti9bxM9vSGPtKxg21JQrf
         auGZDdjLkDb9ZPrzTMXu39ZxQPHSdpM3ty6CE72NteZHjWMUp2mdvXRi0j5qqO+/+jKF
         sOTAEVRYDEncWJNt3YEmL+MKSD8nNfEIawRL7RfEnkD2m5LxY0Cq33tBPq4oJtw1UljK
         4rGYlJqCczX3M+LvUWcsD4Q3nSbBK0QBrSrSAYQfljR2PtjoWL6bM+JY3CJbfIqK1jMz
         r58ew3i7nIlbKvPEIfb7UFwiww0gvU4eDwsSuJh8j+g44YF70tIwFUXfWeEXQgNqi4/J
         dRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CNtQvmrBREea9Fl7G/3MlJk6sbdKLk9I8E30fCKcW9E=;
        b=nvlTJ5AQF+z16IEbPejtjBCxYIod6jttpAPI1W8W5QZfvVbEqoKoqUGnmxxvWjnITR
         0JqwdCzK9zmncCyMyFXpIRDeNCLK3BcMyV+EvlVE99dN9jPBmdunD4LBnY/wsLDScaZy
         5fJGfXFZ93OmY8PrLXTpySWkFp6WKT7V0NSaujnzSABzpuViMCYapkPUBQHmvzQy2hGw
         eqLmjHpq433WGJiTmpCmvqa3SXWZRp0T9J4MozZ60aDIF6tgcPe7IQcHEq5GuJo3BlrG
         +rX/bLCdUCG0P1axdE9F0CgiGOI7Wf6c40ty2dtWyb/sg9bIAHC2GzHUXCEAMs5CRnik
         kvRg==
X-Gm-Message-State: APjAAAVOWwSXrJHnbNvalMnORIfrtwf/074/+ELvp6cVAjJ49bc30A9x
        qoG+e/N0JSj5Rob/vizqyIWNJQqDJR4cTW5dy2Q=
X-Google-Smtp-Source: APXvYqwItQoYQSVcmwx9Ampy++4WJ+oHbL0RoUbskyAJSfcKVYY+fp30cb8KuY/v+oZod3elLZE+SS8Sm89ASpzUN/Y=
X-Received: by 2002:a17:906:a44d:: with SMTP id cb13mr6685070ejb.258.1581435538265;
 Tue, 11 Feb 2020 07:38:58 -0800 (PST)
MIME-Version: 1.0
References: <1579868411-20837-1-git-send-email-akhilpo@codeaurora.org>
 <20200124182654.GA17149@jcrouse1-lnx.qualcomm.com> <9a9ec81d-f963-8d71-d6aa-d32956788d94@codeaurora.org>
In-Reply-To: <9a9ec81d-f963-8d71-d6aa-d32956788d94@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 11 Feb 2020 07:38:47 -0800
Message-ID: <CAF6AEGuAsN0QDULRHrvtAnVANNqRv4aZWof0YKZ+yNahwSXu9A@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/a6xx: Correct the highestbank configuration
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sharat Masetty <smasetty@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 31, 2020 at 12:00 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> On 1/24/2020 11:56 PM, Jordan Crouse wrote:
> > On Fri, Jan 24, 2020 at 05:50:11PM +0530, Akhil P Oommen wrote:
> >> Highest bank bit configuration is different for a618 gpu. Update
> >> it with the correct configuration which is the reset value incidentally.
> >>
> >> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> >> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> >> ---
> >>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++++----
> >>   1 file changed, 6 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> index daf0780..536d196 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >> @@ -470,10 +470,12 @@ static int a6xx_hw_init(struct msm_gpu *gpu)
> >>      /* Select CP0 to always count cycles */
> >>      gpu_write(gpu, REG_A6XX_CP_PERFCTR_CP_SEL_0, PERF_CP_ALWAYS_COUNT);
> >>
> >> -    gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL, 2 << 1);
> >> -    gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, 2 << 1);
> >> -    gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, 2 << 1);
> >> -    gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, 2 << 21);
> >> +    if (adreno_is_a630(adreno_gpu)) {
> >> +            gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL, 2 << 1);
> >> +            gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, 2 << 1);
> >> +            gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, 2 << 1);
> >> +            gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, 2 << 21);
> >> +    }
> > it shouldn't come as a surprise that everything in the a6xx family is going to
> > have a highest bank bit setting. Even though the a618 uses the reset value, I
> > think it would be less confusing to future folks if we explicitly program it:
> >
> > if (adreno_is_a630(adreno_dev))
> >    hbb = 2;
> > else
> >    hbb = 0;
>
> I think it would be better if we keep this in the adreno_info. Yes, this
> would waste a tiny bit of space for other gpu
> entries in the gpulist. It is also possible to move this to a separate
> struct and keep a pointer to it in the adreno_info.
> But that is something we should try when there are more a6xx specific
> configurations in future.
>
> I have a new patch, but testing it is taking longer that I expected. I
> will share it as soon as possible.
>

I'm going to pull this in as-is for msm-fixes.  Please rebase the
change that you haven't posted yet on top of this patch, and send it
as a cleanup for the next cycle.  Thanks

BR,
-R
