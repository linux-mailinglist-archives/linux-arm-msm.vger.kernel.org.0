Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13415399A85
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jun 2021 08:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbhFCGTq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 02:19:46 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:43668 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbhFCGTq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 02:19:46 -0400
Received: by mail-ot1-f48.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso4758460otu.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 23:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to;
        bh=AORJO5loH8P1GCxBtXakps2SGxdj+XmHegIFz60ntSY=;
        b=m+a8Q1UpsGAwg2QV2ag3baMSuw4sbbIdKA/R3hm/N9Rbev/uihCBU+7ucdJCdo4I1B
         sN1FtF3Cn2NxdCrssZOG1BR3kj7NBLlERFQXgAB7OGtNUtF3rf9WinaAi86Z9EecPKOl
         Zp0/gqK7Ib3OXxPjeLHNnEAowBmn5c7TGgWq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to;
        bh=AORJO5loH8P1GCxBtXakps2SGxdj+XmHegIFz60ntSY=;
        b=FG9Kpy37C/VzFFRLt8NlU1bmw9Eic0sVNfooJDTicKiuFJUlE9oPLwDzTDvEPcSmVP
         CAwXJ1SE5DppA839g93CjdJHbUWRtexhalgcUy47wgEXHVPkQa6CClmzybBUZY3fYIKM
         tL2bS5bYe8HWQclj81jm6fi4HhvH2K1+rtaC/EKIj91SwQbGUE4nEnuLVd3WLZ9qyjZ2
         7IJhN/b8itoS0siOYVKsFfK1ohgqIYaCkIcLpIB9KoFdyfep/Yiw6y6tN1D6fG9s41Gj
         Ra0QcDjpfbLnhlIQ2bw9d8WdyR+YAmZecD+i18ymXVN1oXt+nLQeCiyUPPFGSYtGHIig
         IT0Q==
X-Gm-Message-State: AOAM5333IWUAnp/T2vDA5kZq1CYenrR4721xYc0oTzjq9JBpuv9+YWLX
        tB/lXucheTyFpHtPEaQou75/QQOpiRvjckDMheFPCQ==
X-Google-Smtp-Source: ABdhPJxyYLeIoldjWEenrhIDKjwGFGHgDtAWhmJTqgX+kVi9DQAsE9OwTaUuSW0wIJ7tz1YPkk2udKnCFrsX4wlP32g=
X-Received: by 2002:a9d:18e:: with SMTP id e14mr9745672ote.34.1622701022184;
 Wed, 02 Jun 2021 23:17:02 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Jun 2021 23:17:01 -0700
MIME-Version: 1.0
In-Reply-To: <20210603050530.15898-1-srivasam@codeaurora.org>
References: <20210603050530.15898-1-srivasam@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 2 Jun 2021 23:17:01 -0700
Message-ID: <CAE-0n52CyZkRDForR7LumXL7Tcr=48UV7T-wxirMsxk7AJJsmg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: qcom: Fix for DMA interrupt clear reg overwriting
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

Quoting Srinivasa Rao Mandadapu (2021-06-02 22:05:30)
> This patch fixes the DMA interrupt registers overwriting

 $ git grep "This patch" -- Documentation/process

> issue in lpass platform interrupt handler.

Can you describe the issue more?

>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---

Any Fixes tag?

>  sound/soc/qcom/lpass-platform.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index 0df9481ea4c6..e02caa121fa4 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -650,7 +650,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
>         struct lpass_variant *v = drvdata->variant;
>         irqreturn_t ret = IRQ_NONE;
>         int rv;
> -       unsigned int reg = 0, val = 0;
> +       unsigned int reg = 0, val = 0, val_clr = 0, val_mask = 0;

Why assign to 0 and then overwrite it?

>         struct regmap *map;
>         unsigned int dai_id = cpu_dai->driver->id;
>
> @@ -676,8 +676,9 @@ static irqreturn_t lpass_dma_interrupt_handler(
>         return -EINVAL;
>         }
>         if (interrupts & LPAIF_IRQ_PER(chan)) {
> -
> -               rv = regmap_write(map, reg, LPAIF_IRQ_PER(chan) | val);
> +               val_clr = (LPAIF_IRQ_PER(chan) | val);

Is the extra parenthesis useful?

> +               val_mask = LPAIF_IRQ_ALL(chan);
> +               rv = regmap_update_bits(map, reg, val_mask, val_clr);
>                 if (rv) {
>                         dev_err(soc_runtime->dev,
>                                 "error writing to irqclear reg: %d\n", rv);
