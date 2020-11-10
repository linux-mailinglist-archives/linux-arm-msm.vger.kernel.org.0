Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35A8D2AD2A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Nov 2020 10:40:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726787AbgKJJkx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 04:40:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbgKJJkx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 04:40:53 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0979C0613CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 01:40:52 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id v20so5387314ljk.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2020 01:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AXdt4/GVN4Y6ww6W0kBy4YLHXliyiP6kmKj8D1Wdz+s=;
        b=qO5mwF1JeGYhP/NW4uBHRxJwCTdGjTfHfchqISCSp2glgneKh+N0XQ6qPPIvY5RAc2
         oI0Qjx3dssYp2HnKfVuRxH+R9cmy5asjDX34qDK+PIVEG3npGguBzRWX3gNhCYdV3P3D
         nDAqGXR9CUQInuueX63CMmJNIk9QZLbY35+STE1FVcwdMXgb1AqMkm5GYy8MHz9atmyI
         N+AKEA1BC9N2eNYipwv3fQpRCHtdURnd5qnqF2oE60RosuX8WdvlPRJgTAKaQ0l2iZ7Q
         xR+ku5X7GnBhUJL+E4QYAQJrbPRQIyCVN5xMZ/XBoI2fLk75iI7GRVyk1g1vHeJOLFrH
         ddhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AXdt4/GVN4Y6ww6W0kBy4YLHXliyiP6kmKj8D1Wdz+s=;
        b=uUbKsCRu+Ose793W4eq3ox6hi2pD2YAdOwMXIElm0i+edMJ0zfJ2/cLAQzLK0PDUnv
         lSiYwp9wQp4SWyisF6f2q/WOGJ952tucApXU28bEzNfT0JA5N5pknpdSbMcioobgLrSB
         YHpq6q/YAe+IvkZxRSxJN8b5ObDQQvSHG/4cVK6QxzlU0yeGNMxVcRg6e4D8iDsdAbm0
         237sjAaQF2TMUdSMDDcX+3SjkbpA3FtWWykszC8BPT2ltEgIehue1BjZ+zQ8qciMzJ5s
         trjyKjxL/FAiNkEwFuXXurpsyW+kRT4QbCU31cIsJ/iG5pytDykzHQ7dSzNbtcXCDxoE
         O8hA==
X-Gm-Message-State: AOAM530eORu7Q9MDhT9Z77eUysZEWiw7YL8pH0dTMlQEJWkA3KV+rAZ/
        sDnCOCUcRFh0FVSKvDhUtiFk352kx05qjLbxlFD9NQ==
X-Google-Smtp-Source: ABdhPJyxnYp8OqaXR3MO5Oeb6TIQXCDHSw6iz4a1K8EfahuJjytShDCZTNTXKb/a7OkIAAffzLbSLY5LhBt3p4R/yAc=
X-Received: by 2002:a2e:b54a:: with SMTP id a10mr7500764ljn.139.1605001251219;
 Tue, 10 Nov 2020 01:40:51 -0800 (PST)
MIME-Version: 1.0
References: <20201106061433.1483129-1-ajye_huang@compal.corp-partner.google.com>
In-Reply-To: <20201106061433.1483129-1-ajye_huang@compal.corp-partner.google.com>
From:   Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date:   Tue, 10 Nov 2020 17:40:40 +0800
Message-ID: <CALprXBZCthdkxGbJBZZ+ESJRDBHY879FZMpB_4Mgpq1YAJun2g@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] Modify documentation and machine driver for SC7180
 sound card
To:     Ajye Huang <ajye.huang@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Cheng-yi Chiang <cychiang@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        ALSA development <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi, Mark

Could you please kindly review the series patch v6? And may I get your
approval if the review is done.

thanks
Ajye

On Fri, Nov 6, 2020 at 2:14 PM Ajye Huang <ajye.huang@gmail.com> wrote:
>
> Note:
> - The patch is made by the collaboration of
>  Ajye Huang <ajye_huang@compal.corp-partner.google.com>
>  Cheng-Yi Chiang <cychiang@chromium.org>
>
> v6:
> - Documentation: Addressed suggestions from Rob Herring.
>   - Define "maxItems: 1" in dmic-gpios property.
>   - Only keep one example and add dmic-gpios property in.
> v5:
> - Machine driver:
>   - Fix a format string warning (Reported-by: kernel test robot <lkp@intel.com>).
>     detailed info at https://lore.kernel.org/patchwork/patch/1331087/
>
> v4:
> - Machine driver: Addressed suggestions from Tzung-Bi.
>   - Remove redundant judgments in dmic_set() and dmic_get().
>   - Remove 1 level indent of judgment of IS_ERR(data->dmic_sel).
>
> v3:
> - Machine driver: Addressed suggestions from Tzung-Bi.
>   - Move variables "dmic_switch" and "dmic_sel" into struct sc7180_snd_data.
>   - Remove redundant judgments in dmic_set().
>
> v2:
> - Documentation: Modify the dimc-gpios property description and examples.
> - Machine driver:
>   - Remove "qcom,sc7180-sndcard-rt5682-m98357-2mic" compatible
>   - See gpio property and use anadditional control.
>
> Thanks for the review!
>
> Ajye Huang (2):
>   ASoC: google: dt-bindings: modify machine bindings for two MICs case
>   ASoC: qcom: sc7180: Modify machine driver for 2mic
>
>  .../bindings/sound/google,sc7180-trogdor.yaml |  8 ++-
>  sound/soc/qcom/sc7180.c                       | 61 +++++++++++++++++++
>  2 files changed, 68 insertions(+), 1 deletion(-)
>
> --
> 2.25.1
>
