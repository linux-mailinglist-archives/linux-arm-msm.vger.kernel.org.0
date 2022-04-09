Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6BB4FA088
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Apr 2022 02:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235372AbiDIAUc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Apr 2022 20:20:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236218AbiDIAUb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Apr 2022 20:20:31 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F9635FD4
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Apr 2022 17:18:26 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id t2so11904847qtw.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Apr 2022 17:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cq69LgK2el4VS52NpUwvcusYf7/9kO7/LrrqZuzcgYo=;
        b=LYR3cOASMQrgNSg9iFeBc/+vRFw8jaYpz+vyzKn06alZhpumerOG9Pm5U8Hw4w0Tec
         bnQt8ho3zncf4KPeHJ841JGzLQgxRUhQRbdjtTF3Q3daUZOSgGLkuWA4TQReAW7fGc8P
         7bCq5I9SDD4zyAXpRbH4j5ZbdB/IlkCjSoKFp0rgoYfz/qM6r01vtbRO7pEus0wIILpb
         irimLuwbxZZQ7h/2uYBviT0QNU9bjqb1K+//fqG2f0isbvVgjs1NYFRgWiK+5cJHEPbf
         G4dvaLnn1QIM/haR8Zm2HFeJ0sy+jY9QfNcJvwCakr9bFSOdlE1wNulHjH0vfCEv1u/r
         WZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cq69LgK2el4VS52NpUwvcusYf7/9kO7/LrrqZuzcgYo=;
        b=1vVj6NW8qzJgq2Zu+oMlnLWPmanmCOjlNXmd3x8SjUjTjY+moQioB6cGUC2oKvJatZ
         KZKJQeM+ifDtmn0VKyLI9WY5TSkRFQsRqQaj3xfeMkB1AGYT3sa2KCX0lHcrtpUryIXP
         gGdcYgKc1u/tUsgl0wuZXFcNztG2lwUH1LJVBIHfhm+zi/LA4ZUdEtmZKFAq23XdgOBB
         64cPryGh3vf1PDeHcVEQwSgG7DhwtdVhLNNA6wGSS+B6faqrCbV85GbRImtWD+NKvdK1
         AO8fHdBKTWF7G0YMVVUh4IWDdmc85WHhEu/obzLAUaQYWHf4417cpxeBh6qLgZc8xkSE
         Z2mw==
X-Gm-Message-State: AOAM532fzQX3O1T43c4cLfDZchBCCE5ngr0m+9Ki/zMTurpA1uGSfv5L
        nVZ5H3tmN0hkAIaBOfXY7xueYHbRIWpfx9tMFqY4fw==
X-Google-Smtp-Source: ABdhPJwi5ytNyy2ChhgLgtwQiMODUHza/LRqQs0so5gHIGyYuJHs9LYeXOXx0u2ytGdI2Dm++KlcBYs6+UbnDK6OX6M=
X-Received: by 2002:ac8:5a46:0:b0:2e2:2edd:374 with SMTP id
 o6-20020ac85a46000000b002e22edd0374mr18011103qta.295.1649463504962; Fri, 08
 Apr 2022 17:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220408210813.581391-1-bjorn.andersson@linaro.org> <20220408210813.581391-2-bjorn.andersson@linaro.org>
In-Reply-To: <20220408210813.581391-2-bjorn.andersson@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 9 Apr 2022 03:18:13 +0300
Message-ID: <CAA8EJprnEBcno+TtDGTboWw=dzDqb_Qiy8PEffrN3GcOWv9-wA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/msm/dpu: Issue MDSS reset during initialization
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 9 Apr 2022 at 00:05, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> It's typical for the bootloader to bring up the display for showing a
> boot splash or efi framebuffer. But in some cases the kernel driver ends
> up only partially configuring (in particular) the DPU, which might
> result in e.g. that two different data paths attempts to push data to
> the interface - with resulting graphical artifacts.
>
> Naturally the end goal would be to inherit the bootloader's
> configuration and provide the user with a glitch free handover from the
> boot configuration to a running DPU.
>
> But as implementing seamless transition from the bootloader
> configuration to the running OS will be a considerable effort, start by
> simply resetting the entire MDSS to its power-on state, to avoid the
> partial configuration.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
>
> Changes since v2:
> - Move the reset before the probing of the children, to avoid issues if child
>   drivers touched hardware at probe time.
> - Extend reset assert time as the previous 1us showed reliability issues on
>   Lenovo Flex 5G.
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 32 ++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> index b10ca505f9ac..6f921910d0e0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> @@ -3,10 +3,12 @@
>   * Copyright (c) 2018, The Linux Foundation
>   */
>
> +#include <linux/delay.h>
>  #include <linux/irq.h>
>  #include <linux/irqchip.h>
>  #include <linux/irqdesc.h>
>  #include <linux/irqchip/chained_irq.h>
> +#include <linux/reset.h>
>  #include "dpu_kms.h"
>
>  #define to_dpu_mdss(x) container_of(x, struct dpu_mdss, base)
> @@ -197,6 +199,32 @@ static void dpu_mdss_destroy(struct msm_mdss *mdss)
>         dpu_mdss->mmio = NULL;
>  }
>
> +static int dpu_mdss_reset(struct device *dev)
> +{
> +       struct reset_control *reset;
> +
> +       reset = reset_control_get_optional_exclusive(dev, NULL);
> +       if (!reset) {
> +               /* Optional reset not specified */
> +               return 0;
> +       } else if (IS_ERR(reset)) {
> +               DPU_ERROR("failed to acquire mdss reset, ret=%ld", PTR_ERR(reset));
> +               return PTR_ERR(reset);
> +       }
> +
> +       reset_control_assert(reset);
> +       /*
> +        * Tests indicate that reset has to be held for some period of time,
> +        * make it one frame in a typical system
> +        */
> +       msleep(20);
> +       reset_control_deassert(reset);
> +
> +       reset_control_put(reset);
> +
> +       return 0;
> +}
> +
>  static const struct msm_mdss_funcs mdss_funcs = {
>         .enable = dpu_mdss_enable,
>         .disable = dpu_mdss_disable,
> @@ -210,6 +238,10 @@ int dpu_mdss_init(struct platform_device *pdev)
>         int ret;
>         int irq;
>
> +       ret = dpu_mdss_reset(&pdev->dev);
> +       if (ret)
> +               return ret;
> +
>         dpu_mdss = devm_kzalloc(&pdev->dev, sizeof(*dpu_mdss), GFP_KERNEL);
>         if (!dpu_mdss)
>                 return -ENOMEM;
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
