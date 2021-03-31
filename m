Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB333502E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Mar 2021 17:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235619AbhCaPEQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 11:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235592AbhCaPEP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 11:04:15 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EBF6C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 08:04:15 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id o16so20071825wrn.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Mar 2021 08:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sJpjvEOXylTWD8gk4HVhiJAi5vhAPJl8XPJPkdBkWAs=;
        b=U0V0vXxP3BRBPRjfD2+v8qzpxEb7sVUFbvzFylEUJvcgotNlbfYIEqJWZtVh1VZ0W+
         XRCtqzGUfHXqEvsnf8h3E5aeHd906ub/u/ny0baK/yI56kvqNQwmSYxC54LNCokDbvH7
         W5yl2xuBDIRdIQYlI7Cg+km42GSXucqLLZZzNEY4RGG5tRwXM/aLFX2mBLJ5D/eahT6X
         ghrpHvJ2opvrV4niT27YTSg4JNcsXOVQ9pSx5Mqcdb6qypjTuHAJw7tigSMuoKrwJ/iQ
         4hAQg53Zg7O/MImQmw2N58e4tPOjpmBLOG15aDMTWMSRTNKKsZZhLbjPrX9dIGrCMySv
         GJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sJpjvEOXylTWD8gk4HVhiJAi5vhAPJl8XPJPkdBkWAs=;
        b=gjO99l8v/ngylSIcGU2ZhY/SjaBzCyLif8d+xhIxk0UQszTQGQMWOz6ol2vI5Dt0U2
         FakZBuIWYqvafVuIO1WxE7lc6p87kOdTwD84Sa7RkWSftf6Bg2ZYxCJ99/7GQqQZdNwt
         5utVdK7gvOPGxZfKNejeLDdJbTiBmK9VceoAvMr4PW7SxVK9MMq8GgAe+WssMe+h1IZP
         4Y/S8l5jcgSwrqz+Tkk284ut6AtdhzV67Io3CD3t58DObejRcuknhr2Bh0Zwwr4yKgA3
         N4KBLZnBHMmVjospiE7RplmjVsLDGQ+6iV4uKLyVZdgHAyJ1s3zCvCyEFmpQfsonLPjL
         +oNg==
X-Gm-Message-State: AOAM530WAsXIGotqiw0li10GmZkbsIaMAWnYJAJNRSg7Fj48FykrNhef
        GZgc4ysz491lgDdwAI0yeQfDMQi6Bbuz0+rE2MU=
X-Google-Smtp-Source: ABdhPJwtrR1a/PL8Hrw8kp/rnNPC9q7fSlSWrB0Tq6lUIkKrb+lgoBQorl1Rj7gVT0mWqxQaPhVGXCwMqGGDrh8lCWU=
X-Received: by 2002:adf:d0c3:: with SMTP id z3mr4428713wrh.28.1617203053788;
 Wed, 31 Mar 2021 08:04:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210331140223.3771449-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210331140223.3771449-1-dmitry.baryshkov@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 31 Mar 2021 08:07:38 -0700
Message-ID: <CAF6AEGuqXDPTBnKwfWYmKYjc6Mw-QVkLm7G+Yxxv6sm6JDboWw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: a6xx: fix version check for the A650 SQE microcode
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

fixing Jordan's email so he actually sees this

On Wed, Mar 31, 2021 at 7:02 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> I suppose the microcode version check for a650 is incorrect. It checks
> for the version 1.95, while the firmware released have major version of 0:
> 0.91 (vulnerable), 0.99 (fixing the issue).
>
> Lower version requirements to accept firmware 0.99.
>
> Fixes: 8490f02a3ca4 ("drm/msm: a6xx: Make sure the SQE microcode is safe")
> Cc: Akhil P Oommen <akhilpo@codeaurora.org>
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index cb2df8736ca8..896b47dc9c85 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -567,17 +567,17 @@ static bool a6xx_ucode_check_version(struct a6xx_gpu *a6xx_gpu,
>         }  else {
>                 /*
>                  * a650 tier targets don't need whereami but still need to be
> -                * equal to or newer than 1.95 for other security fixes
> +                * equal to or newer than 0.95 for other security fixes
>                  */
>                 if (adreno_is_a650(adreno_gpu)) {
> -                       if ((buf[0] & 0xfff) >= 0x195) {
> +                       if ((buf[0] & 0xfff) >= 0x095) {
>                                 ret = true;
>                                 goto out;
>                         }
>
>                         DRM_DEV_ERROR(&gpu->pdev->dev,
>                                 "a650 SQE ucode is too old. Have version %x need at least %x\n",
> -                               buf[0] & 0xfff, 0x195);
> +                               buf[0] & 0xfff, 0x095);
>                 }
>
>                 /*
> --
> 2.30.2
>
