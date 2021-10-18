Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40615432400
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 18:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232180AbhJRQpB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 12:45:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231811AbhJRQpB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 12:45:01 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC939C061745
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Oct 2021 09:42:49 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 204so836868ljf.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Oct 2021 09:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dgwWr3BXdTwUC0OrGuOgT8cS3CjgXPDui5v0oZBimWw=;
        b=j5j2m4OsgxsL2ElnGTkxunX1vf480gdCZWPnVSX5PsnMbjz3K+UnrJ3ky4IQhFOM62
         3ugYm7QBA1+1fKxqjagvX3O9gMkElc6Lz1V4k0D9kxvlhh//EJKzEYAKK2qDosxxGaIA
         Cdb9iFiBi8nXl6UJTewq99KHqloPeOC5Bd9O9XWXI/DmB45nCCAJigeazo3RzU6oxNbI
         JPPqJmjZ3WTMJC8CLDk+eldymAz6IL6UGhj4VvM3mcdfRD+PFBeggPMjSl5ZRxq57/vf
         nAaBK1y5gv/EHacIIHZmuwLROHizMmABHqumEsCRq0dM/WgVU9NNXQ8QQV7xry1ZEJTb
         Jt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dgwWr3BXdTwUC0OrGuOgT8cS3CjgXPDui5v0oZBimWw=;
        b=8ModTaTordd7taT0CKLtgk0CWrn0rHVB+cC7rFgw9gKgKk2UP8WiVPz393b6592g03
         mcQYJ8OiMnE4qCYZk/vSv9iYU2AjGCXd2CPi3g3JcHTo50KPuPoF8bA4awSFtGmTSlmM
         v5nE9rTZetwJBCk4XWlm5zJMfThMwQ/DyylDp3mgAaSU4B6LD6BvVev1t8BypXgsi4VF
         uvsuW4R0addy1LUx07R8DqrzpbnW/S3s6uKFY2qAm+fn13IQV40D/d6SL2UbLwGIFuMD
         eH176ta853tMTkpHXwjGWGuQOk9KYaz4mZmbQmSU2+sta1NCCJ9bMredxaL1ZQ/3xsNh
         EBAA==
X-Gm-Message-State: AOAM531Ke8rgC85bbKo8ze0fdQh2zT8OpIzpIA97Cp5il7FrodOsjZAe
        ZwI2dQ0p0XU3fzX6AE7K4PKXGt+5+Ffhxp088yU7TQ==
X-Google-Smtp-Source: ABdhPJwnHe4vWrE0K3Wm0c2Rfoo9x9QZhO1oxkDeBbktqaK53ENKMBgbVLMJfggxzoMrl5SYEGZkxiz2RQIRstjni2Q=
X-Received: by 2002:a2e:a911:: with SMTP id j17mr865105ljq.61.1634575368092;
 Mon, 18 Oct 2021 09:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <20211018153627.2787882-1-robdclark@gmail.com>
In-Reply-To: <20211018153627.2787882-1-robdclark@gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 18 Oct 2021 09:42:36 -0700
Message-ID: <CALAqxLU=O2yaJ=ZOtg0S-zX4KyirbXNx+0iF3EJ9d4=rVL6Z=Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/devfreq: Restrict idle clamping to a618 for now
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        open list <linux-kernel@vger.kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 18, 2021 at 8:31 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Until we better understand the stability issues caused by frequent
> frequency changes, lets limit them to a618.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> Caleb/John, I think this should help as a workaround for the power
> instability issues on a630.. could you give it a try?

While I hit it fairly often, I can't reliably reproduce the crash, but
in limited testing this seems ok to me.
I've not hit the crash so far, nor seen any other negative side
effects over 5.14.

So for what that's worth:
Tested-by: John Stultz <john.stultz@linaro.org>

Caleb has better luck tripping this issue right away, so they can
hopefully provide a more assured response.

thanks
-john
