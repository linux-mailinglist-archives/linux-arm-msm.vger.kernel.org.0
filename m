Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 295A051E2BE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 May 2022 02:29:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379230AbiEGAdV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 May 2022 20:33:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379090AbiEGAdV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 May 2022 20:33:21 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F9E25DA27
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 May 2022 17:29:36 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id v66so9260457oib.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 May 2022 17:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=BfXIYuTjESdwCcwnM3M8fBVsvHWnXl3HX1TNkGVkeNM=;
        b=Hj7bOIh95GPwij//9n8NwUm1Iyp50iOpugsjgNphXDJgxGmxKiY0vlKUeyMxhIi2K2
         6VXze4xJSRJ2kDbt4uS7zYk6Qr7yImNb8t9GihFG4WjcRLbXWUEoPHYoi87oTDjtqQx/
         dOcVT7uJgYR1HQRorqxvT5KUTQxczWwGabjn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=BfXIYuTjESdwCcwnM3M8fBVsvHWnXl3HX1TNkGVkeNM=;
        b=w/fkuj09b3g3g5fz1obUHQVqsZ/fsVLU0Ut/ALVq1/74KNfM/ue+7m6+NxaQyJkM0u
         HKQeRms12cotiPDsDQeworKOwQjmjeb+pd9MNl4QjuzFetGo5EtnM0Ke2RBlCsIkOzRq
         GnvqzNj/897i6y4zAj+nE770wwOewGqOhuqKfBe01RUeYz7fU7v+MDCbTQsbLS1+u89w
         t60mpDgcltyuBGze8EGNsYaU3SDGmxihB51owC0VaR1uuE8q361cN4pQFWwKAPTMwKGs
         cKo6AmTmUTqLGrPg0n8fjIqPQZ4P9YphhH8L6V72uWNWyLqseEcUTWfgoVDyWmulnd0n
         J+Ww==
X-Gm-Message-State: AOAM533ODu3sRWNdGChr3c9MuXnL1OsK1q+Nzz+jpq8ePkYXglr3iKPG
        KEllFpRpFaLDF8AwaiS2JbsNuivamtzUodTRKvQEgQ==
X-Google-Smtp-Source: ABdhPJxy2rjvHnXRgZkg73o/CmbSvZTI1SbRFqdP1g9gdFeFf/h84x2in8Rewwao0QtsPr/lxD+NoSJdi+JC2LVdHf4=
X-Received: by 2002:a05:6808:23ce:b0:326:6698:c271 with SMTP id
 bq14-20020a05680823ce00b003266698c271mr2647939oib.193.1651883375667; Fri, 06
 May 2022 17:29:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 6 May 2022 20:29:34 -0400
MIME-Version: 1.0
In-Reply-To: <1651873267-18220-1-git-send-email-quic_khsieh@quicinc.com>
References: <1651873267-18220-1-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 6 May 2022 20:29:34 -0400
Message-ID: <CAE-0n52HvhT_RFbJHhijKCCt8jQM70fo6ceAbnYEfOfO-dRxVA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Always clear mask bits to disable interrupts
 at dp_ctrl_reset_irq_ctrl()
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dianders@chromium.org, dmitry.baryshkov@linaro.org,
        robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-05-06 14:41:07)
> dp_catalog_ctrl_reset() will software reset DP controller. But it will
> not reset programmable registers to default value. DP driver still have
> to clear mask bits to interrupt status registers to disable interrupts
> after software reset of controller. This patch removes the enable flag
> condition checking to always clear mask bits of interrupt status
> registers to disable interrupts if enable flag is false.

Another paragraph is needed which is that this (partially?) fixes the
suspend path where we call dp_catalog_ctrl_reset() but the irq is still
unmasked and can come in while we're suspending. This leads to bus hangs
if the irq is handled after we power down the DP hardware because we run
the irq handler and access a device register assuming that no irq could
ever come in if we powered down the device. We don't know when the irq
will be handled though, so it's possible the irq is pending from before
we disable the irq in the hardware. Don't we need some irq synchronize
to make sure it doesn't run?

>
> Fixes: ba0a422be723 ("drm/msm/dp: do not initialize phy until plugin interrupt received")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 38026f2..cbf3399 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1379,8 +1379,13 @@ void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable)
>
>         dp_catalog_ctrl_reset(ctrl->catalog);
>
> -       if (enable)
> -               dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
> +       /*
> +        * all dp controller programmable registers will not
> +        * be reset to default value after DP_SW_RESET
> +        * therefore interrupt mask bits have to be updated
> +        * to enable/disable interrupts
> +        */
> +       dp_catalog_ctrl_enable_irq(ctrl->catalog, enable);
>  }
>
>  void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
