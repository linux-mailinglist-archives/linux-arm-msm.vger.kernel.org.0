Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 509AE21BB4A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 18:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbgGJQse (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 12:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727901AbgGJQsd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 12:48:33 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B534C08C5DC;
        Fri, 10 Jul 2020 09:48:33 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id w6so6798618ejq.6;
        Fri, 10 Jul 2020 09:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AH6BfNEx7NMMgyW4KKGIOyQbMozTPM1cZFNmtLAMXVo=;
        b=itvOTeZzDsSKPmqWJyGD6DG0Zy9j+XU7lRcziqvd3wLRZvRrhacbBuSSAXWVPMYDiP
         O/TOXofNQ0ZEnZAPFUtEfKqH0WhpXRHQQk9dO07qaBzAU4CWsY9rCwMlrhDIsFnL9Cvq
         F24YrLP+euH2FKXaCsq2vIEFHMqDflH4YESs11zJFThC/pbNvW3PM3eHRjYrdX+v5wN/
         kpzlPtzFZLzTg4a2qC7fr4caD2Yu7hQ9cK0trZmaRpj1/9liISYEwf8VslD5Ph3jyMTO
         A+9panmjwkCMCoSArH1xEHAHCijuc1FPox0gRKyWguhTrMyQi2Z1xwg7xYP0k7fZeEcC
         VKAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AH6BfNEx7NMMgyW4KKGIOyQbMozTPM1cZFNmtLAMXVo=;
        b=ihvSO8lwq9T+wAPTQknK9Y2DnNkoUkz0WwEcEFyJb/3nnr5r6PGvw8389fhZib12ph
         Pkn+17v06O+TA3rVuW0ScLORjzMBKuDuMJ/nncvyYTOqTZHg4qWsWx9spSHFVyCkiJ+M
         WruMH5fN0/jFyBbV3asqT1S7uAb0NphjCkHHpxY2emtAiC7qqZlmS/KA4AtJprwfXDJT
         k5L0Gs/UeKgDkLZ5dznDwYjilMWK9MMe8caO+0jRbGJUKNsGsOvKsJp7Ssp+jF945/nr
         Q1gCFrGjmxufuTtTilUnzCgLCsZ4ZqkF/O+s/4s496KITuk2hYGEcEZhd/7r2VEN5B2C
         1etA==
X-Gm-Message-State: AOAM531BJLINPYRrRxJOvfOdVwIzfa5514K/XfQFlZNUXU/ukMB19rWV
        Hw7QZj7PNE8tgrKCTHIj6RCuB9fZ4QwqpwgjUMQ=
X-Google-Smtp-Source: ABdhPJwDjzzbL451WTm2kBZbNaPGaYstnPw8x3nK3iC9JJrKdS8XZ1xv6MgGnlX4lvBVk3NgQSo97t3LUsAnzPha41A=
X-Received: by 2002:a17:906:7c54:: with SMTP id g20mr63237421ejp.460.1594399711917;
 Fri, 10 Jul 2020 09:48:31 -0700 (PDT)
MIME-Version: 1.0
References: <1593089153-17811-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1593089153-17811-1-git-send-email-kalyan_t@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 10 Jul 2020 09:49:04 -0700
Message-ID: <CAF6AEGtPDh7q6Hjophdyz+Pvi93-bK5WULGeSw9P4BWRw5SWxQ@mail.gmail.com>
Subject: Re: [v1] drm/msm/dpu: enumerate second cursor pipe for external interface
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Raviteja Tamatam <travitej@codeaurora.org>,
        nganji@codeaurora.org, Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 25, 2020 at 5:46 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> Setup an RGB HW pipe as cursor which can be used on
> secondary interface.
>
> For SC7180 2 HW pipes are enumerated as cursors
> 1 - primary interface
> 2 - secondary interface
>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 8f2357d..23061fd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -117,10 +117,10 @@
>                 .reg_off = 0x2AC, .bit_off = 0},
>         .clk_ctrls[DPU_CLK_CTRL_DMA0] = {
>                 .reg_off = 0x2AC, .bit_off = 8},
> -       .clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> -               .reg_off = 0x2B4, .bit_off = 8},
>         .clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> -               .reg_off = 0x2BC, .bit_off = 8},
> +               .reg_off = 0x2B4, .bit_off = 8},
> +       .clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> +               .reg_off = 0x2C4, .bit_off = 8},

It looks like you shifted the register offset here from 0x2bc to
0x2c4, was that intentional?

BR,
-R

>         },
>  };
>
> @@ -272,10 +272,10 @@
>                 sc7180_vig_sblk_0, 0,  SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>         SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
>                 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -       SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_SDM845_MASK,
> -               sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> +       SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000,  DMA_CURSOR_SDM845_MASK,
> +               sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
>         SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000,  DMA_CURSOR_SDM845_MASK,
> -               sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR0),
> +               sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_CURSOR1),
>  };
>
>  /*************************************************************
> --
> 1.9.1
>
