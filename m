Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9175446A1D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 21:49:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233055AbhKEUw0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Nov 2021 16:52:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233771AbhKEUwX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Nov 2021 16:52:23 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 631DDC061714
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Nov 2021 13:49:43 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id f9so11999085ioo.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Nov 2021 13:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fNiSOY3Ex2kKhYTAI345g/wYTliLswlFSNFOE/JFxUQ=;
        b=MENF/AIiOuREajqRtDDqrgQlsyhpEjqOb/pon3tRfk3CFVTv2GFQ3zI2vcKlgz91PO
         WV3YSeYDvnBONNN7YCC8mPyNQrf4htW6TIDX/iojmhApTcDix7Dnismyo7IZy+Wpvszk
         vFouOed3KfvXCXHfhdsL1IexhB2dtFoXtazvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fNiSOY3Ex2kKhYTAI345g/wYTliLswlFSNFOE/JFxUQ=;
        b=ILrdEyLDxZJxVDmBe8CYdWzjdfa+0F14IYX2hDWylGsg/mXuTo8AsVTmjji0m7XaNO
         kXwfXQ3S7jdsE791AUmcUQBilzk2yMYX41gr2IW/1I7PiYmfCvtbN1404eQ0U4jjNc0v
         iH0Ar2uYrABU4KjkxbVglJ7mL/J8Hk/t5ZZHx8ipLoyLS1N2FypNPFuyeyz/fr/zG72a
         QY9RXh7m4WQW+V8fZ2HVCIzI8vfxHJEaOISenBzNEgRjs8lB/vnEEJLvPcjs+uoBfm6j
         uywsZFpF9oau6kPU4hfZaWEKbZrypKZUnUQaHoQ4ws0h/5fbdqjX0Or5ObTHo/2xcVQd
         UyYQ==
X-Gm-Message-State: AOAM532M7vI8UZkeLFxNmFEFnn7up2WDVPZ9lyMgurV/G4W4vb2y2Yby
        9PoWqW3hDQopCzz/xFyjvJpGlk2+OrNL9A==
X-Google-Smtp-Source: ABdhPJyKI8TF8xx5PzQvq55ajTCT5scdccEXK1GhizwgypfGkT0hBHJlyo+Y3NjHqirw2HeIF+NXGQ==
X-Received: by 2002:a05:6638:1249:: with SMTP id o9mr10921083jas.47.1636145382693;
        Fri, 05 Nov 2021 13:49:42 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id p2sm4418363ios.47.2021.11.05.13.49.42
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Nov 2021 13:49:42 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id d70so11186667iof.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Nov 2021 13:49:42 -0700 (PDT)
X-Received: by 2002:a5d:9753:: with SMTP id c19mr1196799ioo.136.1636145381818;
 Fri, 05 Nov 2021 13:49:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211103210402.623099-1-robdclark@gmail.com> <20211103210402.623099-2-robdclark@gmail.com>
In-Reply-To: <20211103210402.623099-2-robdclark@gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 5 Nov 2021 13:49:30 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WBkGMXPvuLaQ0n2V3UgAQajvYg=dPwZNx-TnpXMV1bvw@mail.gmail.com>
Message-ID: <CAD=FV=WBkGMXPvuLaQ0n2V3UgAQajvYg=dPwZNx-TnpXMV1bvw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/gpu: Respect PM QoS constraints
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Nov 3, 2021 at 1:59 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 31 +++++++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index b24e5475cafb..427c55002f4d 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -158,6 +158,33 @@ void msm_devfreq_suspend(struct msm_gpu *gpu)
>         devfreq_suspend_device(gpu->devfreq.devfreq);
>  }
>
> +static void set_target(struct msm_gpu *gpu, unsigned long freq)
> +{
> +       struct msm_gpu_devfreq *df = &gpu->devfreq;
> +       unsigned long min_freq, max_freq;
> +       u32 flags = 0;
> +
> +       /*
> +        * When setting the target freq internally, we need to apply PM QoS
> +        * constraints (such as cooling):
> +        */
> +       min_freq = dev_pm_qos_read_value(df->devfreq->dev.parent,
> +                                        DEV_PM_QOS_MIN_FREQUENCY);

Chatted with Rob offline about this, but to document on the lists for
those playing at home: the above function isn't exported to modules,
so this will fail with "allmodconfig".

In general this isn't the right approach here. I believe that the
right approach is to boost with freq_qos_update_request() and then
kick off a timer to stop boosting after a fixed period of time.


-Doug
