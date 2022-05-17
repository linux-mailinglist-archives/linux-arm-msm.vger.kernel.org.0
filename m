Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23BE5529C55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 May 2022 10:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235158AbiEQI0n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 May 2022 04:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243014AbiEQI0C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 May 2022 04:26:02 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 816C9B8F
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 01:25:54 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id i66so21427363oia.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 May 2022 01:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=qFyj5figDGQVFNUWmIzfj4DH6eo/m3Ta43JA6WzvT2c=;
        b=O3ps97EHSIwu0IuHVUjVpLTmRF7nNzrP+6cR37aR9UAJOkAvkCNANY0qTFVPksvWkL
         flbsM7GACfhNRO9+HE3f5hQrZ80I8U+gm3r/y1CQMl9zlMqZGFYkcA4HF6K3GMXQwecn
         Qcf+MEJ7B5c1TEE/NB45C2BVnbNqH2suwpi7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=qFyj5figDGQVFNUWmIzfj4DH6eo/m3Ta43JA6WzvT2c=;
        b=xmIIENpR2Vom6cm2JonQ3OeShZJTHinksDc58EhQMv9uev4sW4fkX6pMZ3IjlWenvM
         JCLETMiewntm8fP7R1IgTTv+UzG29IVI8Yr9vh4APysq71A1fUiGEGZk6vJE+tFqc8kO
         ouKgyJ5Q5lEyruufrGoMWoFGZoG9Yc0kFpcuMwYALrQzq1GLKDH4r0dkdPAmGtWlpKDb
         LyK6/Mg9OTMTM8VarrIfbmZeF5Oasl7kGdK6R5Q/cOBqagwbkvGE8HOoSir1HVqaABzq
         80dfTfbOQESWmqtgcaAnR/QqS/upNnM5Pqq4xY13QdGQfceV1veDNFOfEJcTGfniGnJo
         VAfw==
X-Gm-Message-State: AOAM530Oy/QlLfsrHsHL4uCpq1gwId9tEOyGn4r4NgRLBW0gD4+neSku
        +evCY6CXic6tIg3FKjgVDG1PMQTaoUiytyTdOOY0QQ==
X-Google-Smtp-Source: ABdhPJxs+1xc/Lw2u3NTSePNRBog18/DG6e9Xn3YMLc6OyuZxzAX8XTsp+t318WYkCDh7KJLL1WVJkbua4qZl8h/e38=
X-Received: by 2002:a05:6808:14c2:b0:326:c129:d308 with SMTP id
 f2-20020a05680814c200b00326c129d308mr9696354oiw.193.1652775953881; Tue, 17
 May 2022 01:25:53 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 May 2022 01:25:53 -0700
MIME-Version: 1.0
In-Reply-To: <1652384598-21586-1-git-send-email-quic_khsieh@quicinc.com>
References: <1652384598-21586-1-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 17 May 2022 01:25:53 -0700
Message-ID: <CAE-0n5277_-=ZYprmF6JcVfrnG0aZVXqXq092VS=mkDtrOB_wg@mail.gmail.com>
Subject: Re: [PATCH v6] drm/msm/dp: Always clear mask bits to disable
 interrupts at dp_ctrl_reset_irq_ctrl()
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dianders@chromium.org, dmitry.baryshkov@linaro.org,
        robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-05-12 12:43:18)
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index af7a80c..f3e333e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1389,8 +1389,13 @@ void dp_ctrl_reset_irq_ctrl(struct dp_ctrl *dp_ctrl, bool enable)
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

I think Dmitry requested that this part be split off to a different
patch. It's fixing the call to dp_ctrl_reset_irq_ctrl() for the disable
case.

>  }
>
>  void dp_ctrl_phy_init(struct dp_ctrl *dp_ctrl)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index c388323..ab691aa 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -98,6 +98,8 @@ struct dp_display_private {
>         struct dp_ctrl    *ctrl;
>         struct dp_debug   *debug;
>
> +       bool suspended;
> +

Can we not have this flag? I also don't understand how this patch waits
for the event queue to drain. There are now multiple places we check to
see if we've suspended, but is it even possible to be in those places
during suspend? What is wrong with moving to an irq thread? Is it
because we want to wait for a modeset (EV_USER_NOTIFICATION)?

>         struct dp_usbpd_cb usbpd_cb;
>         struct dp_display_mode dp_mode;
>         struct msm_dp dp_display;
