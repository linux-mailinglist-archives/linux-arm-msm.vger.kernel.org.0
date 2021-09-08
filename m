Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2383C403EBD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Sep 2021 19:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235654AbhIHR7e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Sep 2021 13:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232430AbhIHR7d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Sep 2021 13:59:33 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E20DC061575
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Sep 2021 10:58:25 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id t18so4628852wrb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Sep 2021 10:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CZew05pny+AMfboX/VUE7XXgEcmZYj2JbeonnK41JqU=;
        b=XsBKI4xnbw1JaN17qWgkAV+dgpV+LjxEJti0B0aQ5lAEdApoPe9yCsXWZG4qlipwtW
         83Wm4+aTu1/vOhk4Ebsoo7qY9FJV7RvEIk1X+AxCeOonFg+JG3eZHVq2O31HYEXfwjL9
         cHx/q95tRwnLyJ0+Aaav/T7UVikaw4iK5Fm8R+Rq9DVtafjtdEIlcK0D2AjOKxemU6qt
         IjN0XXf5/ilGTNGTnj4hA9LLL3lQAWHbafzL7TfB7n3zWEVgMS2Ykyix6Ly4ANalVbCW
         GTzp/XTDG6957IkU/U/zuJYf/1UoGgbyejI50nuCJYdOAo4QWiz2jtXL+s1Un8E+10jn
         HGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CZew05pny+AMfboX/VUE7XXgEcmZYj2JbeonnK41JqU=;
        b=19GIFe5iFLWPgNuoIpLf2IT1GtO2Aw06jbUI4+gqekhAC1OMb3cCO0vV7Pv4+y/kp6
         dRfErVJvYU72ltBUddlfhwwJDJBbXV/HPPHSfdTqxjOFOVDVMymmAOTCCJEFvsv747RN
         49YrdM1gAKBQM/tDn+YsCWD4zKDV/xrCXzgtQL5cD+LGLBepJUj5WAeCZJF9dGOrSw2h
         rh5buDu3tgecXCyw6b+VGXt2kfp/Ig9gYH58RwipH0vRXIE3TmZrUhWeFb4/h4GoJbLN
         7YUc8/2vQymDYti+lZaGuMGrximxz1mkPrjDU/dcX/Xuu8Wi7yY8B45e/YjmSSEAcL+5
         jWsw==
X-Gm-Message-State: AOAM530yAfG3/mvdOt7cb6URyYeDAof2CscSyyufv126O7RsjyVI08T4
        CXTdgxka6JdRsuNA/ks+zpfaog7GOKg+Hz0PRfQ=
X-Google-Smtp-Source: ABdhPJwR0XnAGdvJm2UDco4xrFhoLo/FMbzVajSjlTKKgNt/uALn1qi0Bu2E/97jYryZzVHPJeZ/couXWsea79ELYQY=
X-Received: by 2002:a05:6000:178b:: with SMTP id e11mr5314081wrg.151.1631123904218;
 Wed, 08 Sep 2021 10:58:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210830162232.1328594-1-robdclark@gmail.com>
In-Reply-To: <20210830162232.1328594-1-robdclark@gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 8 Sep 2021 11:02:42 -0700
Message-ID: <CAF6AEGs2dycGhitXWdcOD8pNqmsueRxD_ZmR0NCXc074kHTwUw@mail.gmail.com>
Subject: Re: [PATCH igt v3 0/3] Initial igt tests for drm/msm ioctls
To:     igt-dev@lists.freedesktop.org
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Petri Latvala <petri.latvala@intel.com>,
        Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 30, 2021 at 9:18 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Add an initial set of tests for the gpu SUBMIT ioctl.  There is
> plenty more we can add, but need to start somewhere.
>
> Rob Clark (3):
>   drmtest: Add DRIVER_MSM support
>   msm: Add helper library
>   msm: Add submit ioctl tests

If there are no more comments on this series, could somebody push it?

BR,
-R

>  .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
>  lib/drmtest.c                                 |   3 +
>  lib/drmtest.h                                 |   1 +
>  lib/igt_msm.c                                 | 211 ++++++++++++++++++
>  lib/igt_msm.h                                 | 142 ++++++++++++
>  lib/meson.build                               |   1 +
>  tests/meson.build                             |   1 +
>  tests/msm_submit.c                            | 194 ++++++++++++++++
>  8 files changed, 554 insertions(+)
>  create mode 100644 lib/igt_msm.c
>  create mode 100644 lib/igt_msm.h
>  create mode 100644 tests/msm_submit.c
>
> --
> 2.31.1
>
