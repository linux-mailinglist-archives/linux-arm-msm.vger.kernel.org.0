Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4908B4004FC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Sep 2021 20:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348708AbhICSlt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Sep 2021 14:41:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348344AbhICSlq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Sep 2021 14:41:46 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE76AC061575
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Sep 2021 11:40:46 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id k12-20020a056830150c00b0051abe7f680bso176260otp.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Sep 2021 11:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to;
        bh=g+/vVt6JhLLpX1/epBxESaopp8FQHhl77WcdHs+7WkE=;
        b=S43gOar878bmf2S/ybLy8S+qmYwiuKKN1YQkjyxZG7PrBlEr3oytcmYjl8Zvz/gTwh
         YbECImb7dEdGWbCX75zbh/ITV1FIttFEputYDhGJvuRSvPJT4vICkU9+05sCPwKXXcHa
         DPSw9qv85JWv8adTg+5LDsvHRDpraHZeLUVZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to;
        bh=g+/vVt6JhLLpX1/epBxESaopp8FQHhl77WcdHs+7WkE=;
        b=cNa9AKIHLwBqoeB79JQTWgOWsW8Jd6E3TFFmZoGQ2cXaQDKBbBAjWCDjQIuaoPf89z
         4hiih55KoT2GHTXZPZWJ+SWL9iKfoIAS5jpHvsMaQMejJ+z2LYf03/nSiKK9NUpkX12a
         7VRLg8kFSsKInpQ85uD6/pX6ZNKqp4ZB9bhBhC1eJgb60gsy9bA9ZR7IaEuRAPG55VyN
         ReMDu4o+uB1TYK8DHn+yTkvdPLQApwhzuaWq3RKo74+n2FQom91qQ4JUf6GQQCyVdN5p
         O1yfnK4Z+YT/CvEmsaXqkSYOEgMsF565dlwD2IifARishN9qmtBuCIm1pICJUSGNkqq+
         64FA==
X-Gm-Message-State: AOAM5308LlQrDUh2tNixnhVwG+6kLyNx8AjTR0gpWEMI2sGUAGimZJXt
        QARfWKyihHOgABpJ6X9FNrisuoWKj3n2HUaO323NvA==
X-Google-Smtp-Source: ABdhPJycPSV0nBgcq0hjBFC/o2cbbIgqzAp7Pb8hkvRUJrUsZwaG0a7ygKqi477f1CU9FYwgWjubKMEef81F9cz435c=
X-Received: by 2002:a05:6830:719:: with SMTP id y25mr380633ots.77.1630694445434;
 Fri, 03 Sep 2021 11:40:45 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Sep 2021 14:40:45 -0400
MIME-Version: 1.0
In-Reply-To: <20210903100153.9137-1-srivasam@codeaurora.org>
References: <20210903100153.9137-1-srivasam@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 3 Sep 2021 14:40:45 -0400
Message-ID: <CAE-0n50=vL0MHHHkc22ahrqqD3DskFXZzFU8qjU8=EY1kZ+__Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: qcom: lpass-platform: Reset irq clear reg post
 handling interrupts
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, alsa-devel@alsa-project.org,
        bgoswami@codeaurora.org, bjorn.andersson@linaro.org,
        broonie@kernel.org, devicetree@vger.kernel.org,
        judyhsiao@chromium.org, lgirdwood@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        perex@perex.cz, plai@codeaurora.org, robh+dt@kernel.org,
        rohitkr@codeaurora.org, srinivas.kandagatla@linaro.org,
        tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Srinivasa Rao Mandadapu (2021-09-03 03:01:53)
> Update interrupt clear register with reset value after addressing
> all interrupts. This is to fix playback or capture hanging issue in
> simultaneous playback and capture usecase.
>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---

Any Fixes tag?

>  sound/soc/qcom/lpass-platform.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index f9df76d37858..1a0a4b0b1a03 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -749,6 +749,12 @@ static irqreturn_t lpass_platform_lpaif_irq(int irq, void *data)
>                 }
>         }
>
> +       rv = regmap_write(drvdata->lpaif_map, LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST), 0x0);
> +       if (rv) {
> +               pr_err("error writing to irqstat reg: %d\n", rv);
> +               return IRQ_NONE;

I was thinking we should return IRQ_HANDLED still, but then I guess
failing to clear the irq be treated as a spurious irq so that if we fail
enough times we'll shut off the irq at the irqchip. Things are going bad
if the write fails.

> +       }
> +
>         return IRQ_HANDLED;
>  }
>
