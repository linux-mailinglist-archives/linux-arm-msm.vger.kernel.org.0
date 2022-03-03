Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C21CC4CC906
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 23:32:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237000AbiCCWdM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 17:33:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236959AbiCCWdA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 17:33:00 -0500
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD336171EF4
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 14:32:13 -0800 (PST)
Received: by mail-oo1-xc2a.google.com with SMTP id y15-20020a4a650f000000b0031c19e9fe9dso7416026ooc.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 14:32:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=aqHukTgau4IAvFi00RDl1B7HiBWVDHFl56OK28PMHW0=;
        b=IVmxY43aCeIX1Sbf2joZSulhij/7ZJfOsfW2ct8zFCjANbR9ljRuZIFKVy5W9n1ycu
         cZPe+i2/RpGClp2hAwhQ6i4nJ66ijPtZf4fDH12JPPUWIrIelgejMh2ieJ64xE8FZlMu
         0KgrAIWNyVggchJz8CU8kNPEMwijbzgnTzazk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=aqHukTgau4IAvFi00RDl1B7HiBWVDHFl56OK28PMHW0=;
        b=U1YJFWxbZmt9d9c1I4rZ0X1jgrMxCvir4ZOnEGj3ZbIxuHF6V7nSkhzy8H72vKU0F/
         175MhXRJjwndrxKpatgkEwnNdTB5VrCaY1pNKGcjXODnFN8XVO/7c2yOvasN9Fu/Brct
         KeS2L7UcqLWGzyH2wC1uOAFJluRZh1TcmDmSjoLZFyprjiTFQzWCjauCYl3LgXtIV40r
         N9Am0JmN6ADg45+tJ4Gy1FLQtb03uN7IUg7IdbcZFP27tn6fqBh9uPGNHkmnpHqsmGTe
         KaEhPpYPHAPYq05odMBc21YpHIWcl6MtwYTF6AhqYLF2cAff+mXqzdMXpYEOVi4a27tF
         fPkg==
X-Gm-Message-State: AOAM530WDGpml5TPpJECK5AIdKOcPVIhXzBaEk2zVuR0cmKcb/6fRn1W
        6O05Up0X5llaYmmjhhTqX1xcUVXuPZHpf7UksBRF/A==
X-Google-Smtp-Source: ABdhPJwMvqlFwnhs+sdOU8vYBeqkpQAJFIeV5g0NI9aFagfB5z15TsHZXR/x+aDGr8bjw4w7sdXlVyOqMAx/7wBdwfQ=
X-Received: by 2002:a4a:9821:0:b0:320:52bb:3806 with SMTP id
 y30-20020a4a9821000000b0032052bb3806mr6929333ooi.1.1646346733194; Thu, 03 Mar
 2022 14:32:13 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:32:12 -0800
MIME-Version: 1.0
In-Reply-To: <20220217055529.499829-4-dmitry.baryshkov@linaro.org>
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org> <20220217055529.499829-4-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Mar 2022 14:32:12 -0800
Message-ID: <CAE-0n529mx1ke89iw8xXZEDcs0z84hA09B31cWeVQSTU9RAAYg@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] drm/msm/dp: set stream_pixel rate directly
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-02-16 21:55:27)
> The only clock for which we set the rate is the "stream_pixel". Rather
> than storing the rate and then setting it by looping over all the
> clocks, set the clock rate directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
[...]
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 07f6bf7e1acb..8e6361dedd77 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1315,7 +1315,7 @@ static void dp_ctrl_set_clock_rate(struct dp_ctrl_private *ctrl,
>         DRM_DEBUG_DP("setting rate=%lu on clk=%s\n", rate, name);
>
>         if (num)
> -               cfg->rate = rate;
> +               clk_set_rate(cfg->clk, rate);

This looks bad. From what I can tell we set the rate of the pixel clk
after enabling the phy and configuring it. See the order of operations
in dp_ctrl_enable_mainlink_clocks() and note how dp_power_clk_enable()
is the one that eventually sets a rate through dp_power_clk_set_rate()

        dp_ctrl_set_clock_rate(ctrl, DP_CTRL_PM, "ctrl_link",
                                        ctrl->link->link_params.rate * 1000);

        phy_configure(phy, &dp_io->phy_opts);
        phy_power_on(phy);

        ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, true);	

and I vaguely recall that the DP phy needs to be configured for some
frequency so that the pixel clk can use it when determining the rate to
set.

>         else
>                 DRM_ERROR("%s clock doesn't exit to set rate %lu\n",
>                                 name, rate);
