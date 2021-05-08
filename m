Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB1E5376FF9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 May 2021 08:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbhEHGK6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 May 2021 02:10:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbhEHGK6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 May 2021 02:10:58 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6402CC061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 May 2021 23:09:56 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id z3so9603413oib.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 May 2021 23:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to;
        bh=+ehCmrhhM5OGDTE20S4py5cwY10k0xIadseOT++JVkU=;
        b=filaKRYCVqTgLrB7WYSzzG3Fi5HrJFb7fpcmY1plN+C7xJALT1EJeR+Yqm9YTg6/hP
         N3FPBwLjZaSQwbDlFOfRY/lRGwTqgshbIylR37I495etiV4LoY/JA2jzzGThnnzpq2Or
         +82ApXbQhbi2MA3dplRMFrTSqRg4ogvzrlWsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to;
        bh=+ehCmrhhM5OGDTE20S4py5cwY10k0xIadseOT++JVkU=;
        b=Szvw5PctcB0/poy70N/M5hqDHlWH9Nlxy1zapEZjybSfUtyrU68KMZ9E6gCOAsuIOJ
         juoAQ7l0KQyj0TUIYrokHUXFdeMRHm9P0nsjYzfEDfYLID2xu6SxCVDJBceuF7gKLad4
         2v/BaHwKpWGcLmpozZrD69dEoP2djjIXZKj2Xf9LGjqejmI9cCQC2XPf+eSQfmTVaOcB
         9eHXueKNNPIzzF3woYnfkTLJI6wOuQcqWP3qrqjnpIs09FXfkIFGkLJ6DsgvRCghA08I
         1VlxDHpCp7/SMFv3/x2XrehGaE8GLFRXOD2SMwRd4Ty0FW0Mr0Fs+qTrZXvfY5PiQiJA
         UliQ==
X-Gm-Message-State: AOAM531zOV8cXlwjr1D6wPBRPhdgbjNQycSNPNDol8Faxbd+J0bWRLZX
        KKy7fggb+COSk6HH0PDMGVyGjPoSR/TcDkrJumF6OIsf6u4=
X-Google-Smtp-Source: ABdhPJwCjdFMtu/woUmAWajk3S7zPVWlf7VcEkGyAgxE1bs3Mv227JjHZld7Ob9xYKO0lx4jgnp4g2qGCeSaEupXPEg=
X-Received: by 2002:aca:654d:: with SMTP id j13mr17682432oiw.125.1620454195844;
 Fri, 07 May 2021 23:09:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 8 May 2021 02:09:55 -0400
MIME-Version: 1.0
In-Reply-To: <20210508024254.1877-1-thunder.leizhen@huawei.com>
References: <20210508024254.1877-1-thunder.leizhen@huawei.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Sat, 8 May 2021 02:09:55 -0400
Message-ID: <CAE-0n51owL8RGJyz_5BUCTjrUW5m0X-DTKUx=mqRL=-4i-tMDA@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/msm/dpu: Fix error return code in dpu_mdss_init()
To:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Zhen Lei (2021-05-07 19:42:54)
> Fix to return a negative error code from the error handling case instead
> of 0, as done elsewhere in this function.
>
> Fixes: 070e64dc1bbc ("drm/msm/dpu: Convert to a chained irq chip")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> index 06b56fec04e0..1b6c9fb500a1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> @@ -253,8 +253,10 @@ int dpu_mdss_init(struct drm_device *dev)
>                 goto irq_domain_error;
>
>         irq = platform_get_irq(pdev, 0);
> -       if (irq < 0)
> +       if (irq < 0) {
> +               ret = irq;
>                 goto irq_error;
> +       }

It would be even better if ret wasn't assigned to 0 at the start of this
function.

>
>         irq_set_chained_handler_and_data(irq, dpu_mdss_irq,
>                                          dpu_mdss);
