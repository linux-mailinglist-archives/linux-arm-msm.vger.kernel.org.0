Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB424FC934
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 02:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240608AbiDLAXV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 20:23:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240482AbiDLAXU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 20:23:20 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C75D01CFF5
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 17:21:04 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id j83so17475086oih.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 17:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=y7Y1GROIPsSLxY9do07YZACd9MWDSI2F+M+lT+f9eTo=;
        b=HJgEFPK74D/NzNz5ewjQS1D3WZjnbn6QPFbqVtlhSvkdtZrvSBMTVSWXksPTipI0T0
         uIqntfRaCN+XM2SobWYamTU+fzXI4do20kvZmAFLXkApFfG0I0RWihEspBxiqL5Ohv9S
         RHrhVCX3aEVON9iRfWjDEisKAVzxYtFIOGtyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=y7Y1GROIPsSLxY9do07YZACd9MWDSI2F+M+lT+f9eTo=;
        b=qIh/E9dj4L23xdhBVYiX1Q2BMrlQoPBjG8kBmCWnxM7o/igkJYp4kCxznTn88BYSDZ
         8XH3b1+JQRsngnt+BQxjnnw3F5a7chbvdkvzkWbUEaSJjNnvexhCwrQWOZYlaBBTwP8z
         XGKtPwwI+YXYxDQwPjTvVCHkHyI2q4Q58zJwglQJxmEbD6BdmiQZWRsMX3+hqdeC85vk
         j6C0toaY9dNKKMS/WbrjLQJiVOdZ0b6Gg38a3wx2UxmNgsK0R8A3MiQ86kJUYUH+pNXx
         UnUouBJI1INv6swFdWFkCNH0BpFMWTg/fR74yAQF4SHFejH70Ldc0gsLZzEKZWwMu/wO
         ByPA==
X-Gm-Message-State: AOAM531vc2qIKWgHJOXxauluxhx4vLezsj6xmrASJpSGaHDn38GkiZmx
        jS50gDXFaznm187V8oC4+U8OJ0twg9Md2rs5ltgrsw==
X-Google-Smtp-Source: ABdhPJw/3jAU3O/Kq+1TUpmeh35Qr9Tn/HpTVk9i7/UR2pAUgLJf83vv627lUOfEnAPl1s5WNjyIbdnff/jjSlRos9o=
X-Received: by 2002:aca:bd41:0:b0:2ec:ff42:814f with SMTP id
 n62-20020acabd41000000b002ecff42814fmr682476oif.63.1649722864112; Mon, 11 Apr
 2022 17:21:04 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 Apr 2022 20:21:03 -0400
MIME-Version: 1.0
In-Reply-To: <1649722129-12542-1-git-send-email-quic_khsieh@quicinc.com>
References: <1649722129-12542-1-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 11 Apr 2022 20:21:03 -0400
Message-ID: <CAE-0n53zYpqJL9GCoqZRwMptCne+4Dk4thz-7rCDac7H98dm=A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: stop event kernel thread when DP unbind
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-04-11 17:08:49)
> Current DP driver implementation, event thread is kept running
> after DP display is unbind. This patch fix this problem by disabling
> DP irq and stop event thread to exit gracefully at dp_display_unbind().
>
> Fixes: e91e3065a806 ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Should add a Reported-by tag from Dmitry here.

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 01453db..fa1ef8e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -273,6 +274,8 @@ static int dp_display_bind(struct device *dev, struct device *master,
>         return rc;
>  }
>
> +static void dp_hpd_event_stop(struct dp_display_private *dp_priv);

Why can't the function be defined here?

> +
>  static void dp_display_unbind(struct device *dev, struct device *master,
>                               void *data)
>  {
> @@ -280,6 +283,8 @@ static void dp_display_unbind(struct device *dev, struct device *master,
>         struct drm_device *drm = dev_get_drvdata(master);
>         struct msm_drm_private *priv = drm->dev_private;
>
> +       disable_irq(dp->irq);
> +       dp_hpd_event_stop(dp);
>         dp_power_client_deinit(dp->power);
>         dp_aux_unregister(dp->aux);
>         priv->dp[dp->id] = NULL;
> @@ -1054,7 +1059,7 @@ static int hpd_event_thread(void *data)
>
>         dp_priv = (struct dp_display_private *)data;
>
> -       while (1) {
> +       while (!kthread_should_stop()) {
>                 if (timeout_mode) {
>                         wait_event_timeout(dp_priv->event_q,
>                                 (dp_priv->event_pndx == dp_priv->event_gndx),
> @@ -1137,7 +1142,22 @@ static void dp_hpd_event_setup(struct dp_display_private *dp_priv)
>         init_waitqueue_head(&dp_priv->event_q);
>         spin_lock_init(&dp_priv->event_lock);
>
> -       kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
> +       dp_priv->ev_tsk = kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
> +
> +       if (IS_ERR(dp_priv->ev_tsk))
> +               DRM_ERROR("failed to create DP event thread\n");

Why can't we error out? Why can't this kthread be started in probe?

> +}
> +
> +static void dp_hpd_event_stop(struct dp_display_private *dp_priv)
> +{
> +       if (IS_ERR(dp_priv->ev_tsk))
> +               return;
> +
> +       kthread_stop(dp_priv->ev_tsk);
> +
> +       /* reset event q to empty */
> +       dp_priv->event_gndx = 0;
> +       dp_priv->event_pndx = 0;
>  }
>
