Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6530E25AD98
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 16:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727997AbgIBOpr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 10:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727992AbgIBOph (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 10:45:37 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6888DC061244;
        Wed,  2 Sep 2020 07:45:36 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id u18so4679134wmc.3;
        Wed, 02 Sep 2020 07:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/dvle3j9y6O7Ujf2ahiU0ShW9hGye771vvDoEz/F4PY=;
        b=JwH0hkrutiCbJKZ/aZB4ztxSuEKXc/RHIh5DLGmAPyF8Znq4pnnDq6HnIVd3Ok4oTh
         YU2/xlVVNV+y/dpU4t0M0hxJtAIdfjRJ2IINlhhuD1mr5UTpxPRjXG5ER1+86kCAJBE2
         XnsmOi2L7b56QYT0cx7Vq1BWNH5nuurqO18jQkMXr2EtF9547IJz2WqLUAUZCKANG13Z
         9AyqoCsWAVtYDOyx/jG9NRJDYNT7Sn8Ae/0jUYoDShmWtEGzFn4tQVq70ajo4xNzKXhq
         s2jQOWKwLgTjC2TFqY9ubnOwFj6UdOFNVNs199snMCdpWB+NGQRSIXh36wk4CvwioGWz
         RRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/dvle3j9y6O7Ujf2ahiU0ShW9hGye771vvDoEz/F4PY=;
        b=f6K53+UDMH+BMl9t3jkOmHkNeUu6p9ERdnsedhpxIatWfOGN6WiWPw73Mi9rdwNRNt
         LfMLZ4OoBfVsk6Fx6Y6eoKnmf1sxywg/4eaGTNUT9VvI5ODs/5mKARJDQ0ixqRc0P66N
         WuVrCCYn4e0uL7yrQv7vSJLMNy4OHoOLiEcktpK1jga9nQ6xmZsoulfMdYdAWDEqA5ya
         KGbG3ddCRQhSnIm0NJF+2/lS5uCYwBDWMfofhoUg2L2dQsaPU/eZwsTC5P6jVdS5//Sn
         6xlo2fklTWwU3hfBiCu15pWXmNKHd7a9nUiQJ8n4YnrSb0+27XIp1+pE6R+OHJDao4Yt
         7+9Q==
X-Gm-Message-State: AOAM530wfVvqfAR3bYUNgb7LF90/viv5HM80PqpZ4hhvCBmbrJjCvF/h
        eA2I7i4ZRn+nXpDwJr2tO5IsvH/csE8DL26Bolc=
X-Google-Smtp-Source: ABdhPJxFnw2lIf6slElWW65nhFlI//yhOScWTQotPkmugwDQjQbmeTokKjX3zGLgqH+Z8ODw4ZvDqCRkh4/oranUikw=
X-Received: by 2002:a1c:2dcb:: with SMTP id t194mr998824wmt.94.1599057934946;
 Wed, 02 Sep 2020 07:45:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200901154200.2451899-1-robdclark@gmail.com> <CAAObsKD2uXmRD7Qw+kWzKcz5o96adczdaTGkPA_1fR=UZcR=cA@mail.gmail.com>
In-Reply-To: <CAAObsKD2uXmRD7Qw+kWzKcz5o96adczdaTGkPA_1fR=UZcR=cA@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 2 Sep 2020 07:45:23 -0700
Message-ID: <CAF6AEGtTkbK-W_4bjJ9mmFuzu4NbSHztM0+yaOWaeT8U-_RWRw@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/msm: More GPU tracepoints
To:     Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The cat is somewhat out of the bag already.. so I took the approach of
making the more useful of the traces for visualization (freq_change
trace) identical to the i915 one in units and format, so userspace
just has to add another event name to a list, and not have to add more
parsing code.

But the bigger problem is that it doesn't seem possible to #include
multiple foo_trace.h's in a single C file, so I'm not seeing how it is
possible to have both generic and driver specific traces.

BR,
-R

On Tue, Sep 1, 2020 at 11:52 PM Tomeu Vizoso <tomeu.vizoso@collabora.com> wrote:
>
> Hi Rob,
>
> Do you think we could make all these generic? Visualization tools will need to do some processing so these can be neatly presented and it could be far more convenient if people wouldn't need to add code for each GPU driver.
>
> Maybe we could put all these tracepoints in DRM core as they seem useful to all drivers?
>
> Thanks,
>
> Tomeu
>
> On Tue, 1 Sep 2020 at 17:41, Rob Clark <robdclark@gmail.com> wrote:
>>
>> From: Rob Clark <robdclark@chromium.org>
>>
>> Various extra tracepoints that I've been collecting.
>>
>> Rob Clark (3):
>>   drm/msm/gpu: Add GPU freq_change traces
>>   drm/msm: Convert shrinker msgs to tracepoints
>>   drm/msm/gpu: Add suspend/resume tracepoints
>>
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c  |  3 +
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c  |  4 ++
>>  drivers/gpu/drm/msm/msm_gem_shrinker.c |  5 +-
>>  drivers/gpu/drm/msm/msm_gpu.c          |  4 ++
>>  drivers/gpu/drm/msm/msm_gpu_trace.h    | 83 ++++++++++++++++++++++++++
>>  5 files changed, 97 insertions(+), 2 deletions(-)
>>
>> --
>> 2.26.2
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
