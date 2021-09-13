Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19872409D68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Sep 2021 21:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240049AbhIMTum (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 15:50:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240121AbhIMTul (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 15:50:41 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED50C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 12:49:25 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id i3-20020a056830210300b0051af5666070so14984334otc.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 12:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to;
        bh=yw1b9fZ1lnCtG8cegvzmoiB8uewJHdwQglsWdbmU568=;
        b=oEi+EQkTL3cI5BWuIOLe986IYt7QuXhKHrWvB2PKhVGBwtcewfViIp+vKPLd5Jh8Ga
         +SQebu6ypyjpH7bVj9+T7Y+zTjLLpfdff0Gg278iQWfJvD5izP55iv4Q3ODx1PMWuD7r
         aw8u/G3gjbhXzPyaBPtLRqpJD2AUwiWN1C07M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to;
        bh=yw1b9fZ1lnCtG8cegvzmoiB8uewJHdwQglsWdbmU568=;
        b=yPU5cJ7k96OgRtSQvYa+dn1vQA+PIKAiCKTM7E2auMHLzuHw5uGOYLA9OFhnjVExgC
         f8R/maePh/C76XADdmtbPr7h/K5AMfRBfpYzURaceX6PCerdksbcmslJNLERlwolPGdt
         LqsyNexhjwOoCNblDMzPceNrRhQiWPfCUsxnOwFV0zUVu69cT2PFyg8pTcED/Wo4LcYV
         dQ+9CLnEipxIjNYLT0CqV3iv3GM6c0Sdw2DYHOot2PoA5dVrXUl8P1M6OCTVcMyEcpMh
         78UO7So6ApmEi46amDj+gKYOaSanIwXnqUkj+DoO60ppbwArGlswPzl/IKiW5PIqdZqn
         cZCA==
X-Gm-Message-State: AOAM531HkAL1IkZPSgAZX461nOXmhIeSvrY4e0sa2Ha9EYG8SjSUDQB4
        jFBiIjuIzxZWGQpQrDXo4fiqXk3FXAZh/ok6fPA0NQ==
X-Google-Smtp-Source: ABdhPJz3o79dJM5zC1pjJ+LQMjOTyr1vev2/NGN4jY/c2ZfYnAk+xuiWK8/sXZPYqgI/zUyQOWM/DC8C0/FJ2jSbiDw=
X-Received: by 2002:a05:6830:18c7:: with SMTP id v7mr11183152ote.126.1631562564916;
 Mon, 13 Sep 2021 12:49:24 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Sep 2021 12:49:24 -0700
MIME-Version: 1.0
In-Reply-To: <1631539062-28577-3-git-send-email-srivasam@codeaurora.org>
References: <1631539062-28577-1-git-send-email-srivasam@codeaurora.org> <1631539062-28577-3-git-send-email-srivasam@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 13 Sep 2021 12:49:24 -0700
Message-ID: <CAE-0n50i9rm6fcuyjCCPXjtxTyXwAiRVx91dXT4BDpbGA-tKjg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: qcom: SC7280: Add machine driver
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

Quoting Srinivasa Rao Mandadapu (2021-09-13 06:17:42)
> diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
> new file mode 100644
> index 0000000..906910c
> --- /dev/null
> +++ b/sound/soc/qcom/sc7280.c
> @@ -0,0 +1,343 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
> +//
> +// sc7280.c -- ALSA SoC Machine driver for sc7280
> +
> +#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <sound/core.h>
> +#include <sound/jack.h>
> +#include <sound/pcm.h>
> +#include <sound/soc.h>
> +#include <uapi/linux/input-event-codes.h>

Looks like the include should be <linux/input.h> instead. I see that
practically no other code in the kernel is including the uapi header as
it's for userspace, not kernel. The uapi header is included in input.h
though so it's not actually all that different.

> +
> +#include <dt-bindings/sound/sc7180-lpass.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>
> +
> +#include "../codecs/wcd938x.h"
> +#include "common.h"
> +#include "lpass.h"
> +
[...]
> +static int sc7280_snd_platform_probe(struct platform_device *pdev)
> +{
> +       struct snd_soc_card *card;
> +       struct sc7280_snd_data *data;
> +       struct device *dev = &pdev->dev;
> +       struct snd_soc_dai_link *link;
> +       int ret, i;
> +
> +       /* Allocate the private data */

This comment is worthless.

> +       data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       card = &data->card;
> +       snd_soc_card_set_drvdata(card, data);
> +
> +       card->owner = THIS_MODULE;
> +       card->driver_name = "SC7280";
> +       card->dev = dev;
> +
> +       ret = qcom_snd_parse_of(card);
> +       if (ret)
> +               return ret;
> +
> +       for_each_card_prelinks(card, i, link) {
> +               link->init = sc7280_init;
> +               link->ops = &sc7280_ops;
> +       }
Nitpick: Newline here.

> +       return devm_snd_soc_register_card(dev, card);
> +}
> +
