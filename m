Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F215122113E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2020 17:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbgGOPgM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jul 2020 11:36:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbgGOPgM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jul 2020 11:36:12 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C411DC061755;
        Wed, 15 Jul 2020 08:36:11 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id g20so1932544edm.4;
        Wed, 15 Jul 2020 08:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ldTR/KsOkvUXfFE3oIwY06p1m96PfAnxhTKvRebiJFk=;
        b=WcIywgf/5yGovAVSIjXD9OIB0Yx1Lqe39sKQcKnE0bhl7NpHMP3wyUyXsz76eznoDN
         kLjzcwlopVjThClxHuAyihsZX8FPaEHuAR07Xs+vzRHSsrUbJI0eICfPyJGZKPi/QsKZ
         mmZYeZuAvUsvxgkbItIok1s8pKt4mmzBtXk9cwHdKDPanj9nt1L5t+ZuHliLF00lGmDj
         sgGGTAONqoqLI9wypqeA5drEqMm5oVMEDqzFIsWfOobV+z2oJKOnAPiPglVQaa4qup8s
         aimYRQqb3HkkSb9UJ3FCrUOw7rkvO35YQrAjHrLTkQRICmx+aHtbSrz7ehlxcrNUKK9x
         axwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ldTR/KsOkvUXfFE3oIwY06p1m96PfAnxhTKvRebiJFk=;
        b=gQ0XgMnJ9kus4pHurSEm0wdnrdUhN4vb/1c8UPemjVzXd2S2EpPNxLlTp0apwiqgQR
         +nAv2yFLteaOfb22DD3gs2HskF9o8A4JtgviHGTrjGHbok7qJoVwffz95y1FhyMaNsjs
         iGDlujgMa7MAPEXip87nqzhuIinyxjgZbGbzVaUrKaY/2DSNLJUnewj81AXdUv2hA42T
         r9BgyLC78sKMS+5x+2dcujIthhkOPYrM9Cc/R8sDllek8c/UreJzrhuqQcdD1P/nNPRL
         bSsdYPj4+CaZ+avd9sQrxnAjE73gaM3xeHVrH4uqycEuH/hoFSlAS9JHdBBUHug9xA59
         BUYg==
X-Gm-Message-State: AOAM5300h6fXWjwjGPwqSDswQJRT/qJxXqAbFr4rzdO8uX4T1mB+iEdQ
        1V/IqG3WCtXHkfNUSywOCQzxS7GN3JZDPlhKtXw=
X-Google-Smtp-Source: ABdhPJwUDgryr+uwNIkAcro/MFjmRNEHds+xBye6alkuUKRwQY/Ip2yfUIBYAYZ0SbfRqlleTEVLIvRkwjo+QnLxV+0=
X-Received: by 2002:a50:cd1a:: with SMTP id z26mr209684edi.120.1594827370435;
 Wed, 15 Jul 2020 08:36:10 -0700 (PDT)
MIME-Version: 1.0
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
In-Reply-To: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 15 Jul 2020 08:36:43 -0700
Message-ID: <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add support for GPU DDR BW scaling
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
        saravanak@google.com, Sibi Sankar <sibis@codeaurora.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jonathan <jonathan@marek.ca>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 13, 2020 at 5:41 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> This series adds support for GPU DDR bandwidth scaling and is based on the
> bindings from Georgi [1]. This is mostly a rebase of Sharat's patches [2] on the
> tip of msm-next branch.
>
> Changes from v4:
> - Squashed a patch to another one to fix Jonathan's comment
> - Add back the pm_runtime_get_if_in_use() check
>
> Changes from v3:
> - Rebased on top of Jonathan's patch which adds support for changing gpu freq
> through hfi on newer targets
> - As suggested by Rob, left the icc_path intact for pre-a6xx GPUs
>
> [1] https://kernel.googlesource.com/pub/scm/linux/kernel/git/vireshk/pm/+log/opp/linux-next/
> [2] https://patchwork.freedesktop.org/series/75291/
>
> Sharat Masetty (6):
>   dt-bindings: drm/msm/gpu: Document gpu opp table
>   drm: msm: a6xx: send opp instead of a frequency
>   drm: msm: a6xx: use dev_pm_opp_set_bw to scale DDR
>   arm64: dts: qcom: SDM845: Enable GPU DDR bw scaling
>   arm64: dts: qcom: sc7180: Add interconnects property for GPU
>   arm64: dts: qcom: sc7180: Add opp-peak-kBps to GPU opp

I can take the first two into msm-next, the 3rd will need to wait
until dev_pm_opp_set_bw() lands

Bjorn, I assume you take the last three?

BR,
-R

>
>  .../devicetree/bindings/display/msm/gpu.txt        |  28 ++++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi               |   9 ++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi               |   9 ++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 108 ++++++++++++---------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   2 +-
>  drivers/gpu/drm/msm/msm_gpu.c                      |   3 +-
>  drivers/gpu/drm/msm/msm_gpu.h                      |   3 +-
>  7 files changed, 112 insertions(+), 50 deletions(-)
>
> --
> 2.7.4
>
