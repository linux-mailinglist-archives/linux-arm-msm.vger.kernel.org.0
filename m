Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1215234EBEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 17:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232249AbhC3PPf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Mar 2021 11:15:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232274AbhC3PPF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Mar 2021 11:15:05 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7E65C061762
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 08:15:05 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id x14so16155136qki.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 08:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cJ+YJYx4OZR4pIjZNdx26kpeAL+vxeQN6P+Ncit8r0s=;
        b=GbCYv1WSjk/ew5BC7x/ek5Wk2nKYhMN1fPHHdbT0dXhA8sLDDAsvmkroYbEa1UY8pV
         t325S1USzc4yVtmH5R+gvgAKF4w2om2JhomKV4Iaf538mB2Gfj/Jm/mw8aG8EVfwF/SD
         ZZthbDH/iclBvd6Stp0tcsKmZ3GOpPd77CGCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cJ+YJYx4OZR4pIjZNdx26kpeAL+vxeQN6P+Ncit8r0s=;
        b=WTjC4Mqhz8B0mqtIXCvUvnUWUiLGoVubAOOmqj8fYXEG8+cZqovs+Ky9YXRHrD1ICq
         mdTTsfAEYFLcJ4Yt8NdzRhKgj8h0N1qkkwp+XWV1qHHZcEgSP+75otgn8E5SMy8Y9Qx3
         CdWIM7DG4WaOgs4k6CsPxrsPL0AXhT0b7wF2jr2Z63eu1Ork0jDCi8nBejh5Hs1S37+c
         /8pSmJXj/cNGjfoVFujRI3gE1w2T1HNTRthgTIGoMKhbu5+H3V7G801atPSwzoG5rG+k
         UoavaaJtUEo26TofklewxOsAn3xFNJV2wndxYJuM6Lc/h7XTQo3XzKyssJKkIWGm/66K
         eO7w==
X-Gm-Message-State: AOAM53342FlyEzxJLO+fU9Q8fQhP8ilihOgidjUjQtfiaDZxtrNH5Itx
        p9B45dOL7phZPRUA8SyCtrX8ZbTVkJ5qJA==
X-Google-Smtp-Source: ABdhPJxVBOUJP6sHygaocB363/B/Ge/1AHwd9XUbPJmIX39LUVtEbRdkyJ7AdQKexatJvsuhB8yR2Q==
X-Received: by 2002:a37:9bd1:: with SMTP id d200mr30813781qke.328.1617117304791;
        Tue, 30 Mar 2021 08:15:04 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id c26sm8463440qtj.92.2021.03.30.08.15.03
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 08:15:03 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id g38so17747358ybi.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Mar 2021 08:15:03 -0700 (PDT)
X-Received: by 2002:a25:4092:: with SMTP id n140mr36653500yba.276.1617117302924;
 Tue, 30 Mar 2021 08:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210330013408.2532048-1-john.stultz@linaro.org>
In-Reply-To: <20210330013408.2532048-1-john.stultz@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 30 Mar 2021 08:14:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XbwNmmeoZOSso3Kz1mP40ONo0hDvn6KP8zZsdg9uPcNg@mail.gmail.com>
Message-ID: <CAD=FV=XbwNmmeoZOSso3Kz1mP40ONo0hDvn6KP8zZsdg9uPcNg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix removal of valid error case when checking speed_bin
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        YongQin Liu <yongqin.liu@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Mar 29, 2021 at 6:34 PM John Stultz <john.stultz@linaro.org> wrote:
>
> Commit 7bf168c8fe8c  ("drm/msm: Fix speed-bin support not to
> access outside valid memory"), reworked the nvmem reading of
> "speed_bin", but in doing so dropped handling of the -ENOENT
> case which was previously documented as "fine".
>
> That change resulted in the db845c board display to fail to
> start, with the following error:
>
> adreno 5000000.gpu: [drm:a6xx_gpu_init] *ERROR* failed to read speed-bin (-2). Some OPPs may not be supported by hardware
>
> Thus, this patch simply re-adds the ENOENT handling so the lack
> of the speed_bin entry isn't fatal for display, and gets things
> working on db845c.
>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: YongQin Liu <yongqin.liu@linaro.org>
> Reported-by: YongQin Liu <yongqin.liu@linaro.org>
> Fixes: 7bf168c8fe8c  ("drm/msm: Fix speed-bin support not to access outside valid memory")
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
