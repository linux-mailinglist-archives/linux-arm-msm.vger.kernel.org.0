Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C99445396C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 19:32:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239481AbhKPSeH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 13:34:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239482AbhKPSeG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 13:34:06 -0500
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95CA8C061570
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 10:31:09 -0800 (PST)
Received: by mail-il1-x131.google.com with SMTP id x9so113114ilu.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 10:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1EViyUHQdSut6g+RY4rG3RX+9KMNh10G4tRFHz9NG9E=;
        b=BPlylCR84zbphWWF7YUzdn4WkJmgNf/MrOQz/jFWkfQ9bdYeyGwjDpcFolSsS3egOe
         8X/fCkqeL2w5C4MYsBNhuj/7w/970bRxMisig2Bd3UUXBUHNRAA7a6/Ow3S4dkSEsswr
         dk630OUIqnhLds9oSGFMgYz8tM0D4JR8gRkKLuaMISRSh282560nfqfSSf6Muiaa3EKK
         de6oUD6qfQdBZYk+S/n4AeYIfoVt+xAbPphoDbukYetQD/dnNeGcMi15nTm4BXgaTbyu
         H8/e/qZ/n6+EudcD8Jox7vFxLYdohLimBZYEa9C2tVX0dMEmOgpUzTpTkFGYvdt0YmJ2
         XGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1EViyUHQdSut6g+RY4rG3RX+9KMNh10G4tRFHz9NG9E=;
        b=BursTTNP1ztWfhW5T7VePB2vzgVofBOo+tk9XcXRGSvvf3FSChM9g8K/v6jqYHherI
         57FE97C/54lOkvOfksm1knrn6bEvrMM88vhW+dw8Audj0t3B9UnSotQ6TuUG0PjrKKJx
         GL3urNi1MTjNcFpeCaa94WjDgSUhIRMrGabn8QnYLUFUoDF1oGGCFNUZiZWZQjh7LPP0
         lQ8+X6mGPiAS7XPitK1EmD4XhV+ihXJ2AGwkN+7zo8z1DqBcNnH6B0ZhvU/9v20eyQ+n
         hyPKTbRDrNooLxIlxkBNnY11Rqjv3qUDVbE6mNxJgSirWyp5BMqQkuZuhjaIv18e1fBB
         W5bQ==
X-Gm-Message-State: AOAM530FWn04HOiRNzL3kJU4WUKMXwhmpetSAvWW+fnbnep/Dwfphlk7
        4Uw1focp9R8LrUTM1hlC9kAygMQI8wxpjEELw+fbsQ==
X-Google-Smtp-Source: ABdhPJzOKDJ98X1OJQtFLiL6PuZPZvNI9s+5gIkGORkhTGagdy3QHFC93lEmQFbr1bq8pi3PmWdmQK2SEkSuhCUfKaE=
X-Received: by 2002:a05:6e02:1445:: with SMTP id p5mr5940397ilo.105.1637087469025;
 Tue, 16 Nov 2021 10:31:09 -0800 (PST)
MIME-Version: 1.0
References: <20211116155545.473311-1-robdclark@gmail.com>
In-Reply-To: <20211116155545.473311-1-robdclark@gmail.com>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Wed, 17 Nov 2021 00:00:33 +0530
Message-ID: <CAMi1Hd0qzu1t6QeZCNgSoTrScZL0_XQnZUPkQ5y7D+oV49GREw@mail.gmail.com>
Subject: Re: [PATCH] drm/scheduler: fix drm_sched_job_add_implicit_dependencies
 harder
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        David Airlie <airlied@linux.ie>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 16 Nov 2021 at 21:21, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> drm_sched_job_add_dependency() could drop the last ref, so we need to do
> the dma_fence_get() first.
>

It fixed the splats I saw on RB5 (sm8250 | A650). Thanks.

Tested-by: Amit Pundir <amit.pundir@linaro.org>

> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Fixes: 9c2ba265352a drm/scheduler: ("use new iterator in drm_sched_job_ad=
d_implicit_dependencies v2")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> Applies on top of "drm/scheduler: fix drm_sched_job_add_implicit_dependen=
cies"
> but I don't think that has a stable commit sha yet.
>
>  drivers/gpu/drm/scheduler/sched_main.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 94fe51b3caa2..f91fb31ab7a7 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -704,12 +704,13 @@ int drm_sched_job_add_implicit_dependencies(struct =
drm_sched_job *job,
>         int ret;
>
>         dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
> -               ret =3D drm_sched_job_add_dependency(job, fence);
> -               if (ret)
> -                       return ret;
> -
>                 /* Make sure to grab an additional ref on the added fence=
 */
>                 dma_fence_get(fence);
> +               ret =3D drm_sched_job_add_dependency(job, fence);
> +               if (ret) {
> +                       dma_fence_put(fence);
> +                       return ret;
> +               }
>         }
>         return 0;
>  }
> --
> 2.33.1
>
