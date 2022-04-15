Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7814C503330
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Apr 2022 07:48:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356638AbiDOXnN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Apr 2022 19:43:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354434AbiDOXnM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Apr 2022 19:43:12 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 559E686E1E
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Apr 2022 16:40:42 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id z33so16676128ybh.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Apr 2022 16:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8YKUw09FELNHdHoXG8C1HaoaiZdEDTwC86o2ZnFgkKU=;
        b=EtnRm9hXfFYzr/WZ+UUFlGBkzHsWZ37z67TAtAN58v8+mGS/KGKcjN6vMcxKqGOJMd
         5EsBp+hJVb8XSItbij9lZldXAk6AIvSh/2jVYhu5U4wi9jLQdrcjgZA691aX2KM03Lsf
         IwziwLzs4rgY5otH+KzKAuw7mLZliCmipsYS7/90lMiVaroETXBu4MLTdWT06hKBIN05
         gW1s7SNHkh30uX0+EQnmZwhq1YJyX8BCiS1X6tsUinpsCZtFztsXufZrP7qtni/5B3ol
         G2th6HVbl3aDLY6NJ2eWYJMrN7Y39vqufJTf6BVKRWrOTUQd2ITmhr1O1q2r8AbNUBDx
         Hidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8YKUw09FELNHdHoXG8C1HaoaiZdEDTwC86o2ZnFgkKU=;
        b=lDKP98fbx38MYN7fQkiCtxJ4ZBjRkrc4eVEmxjvZHn0uIFeAXvKi/4+HMA+rMLQABm
         AUmbSNPRq32XDZGYPEbH0nIY2AylzxLYT6O4khVBd45SwygLJpgtNJ7Z98bYWno0I/uG
         iY/ENEkA8xxJZBJEtdcbZmFy/z+VuC88VJsifn4zL0hoio1FRT6NsnDK+Qcrf2x1y19V
         CdCcdmbbuUDZmIQ0lE5osDA4RsPWlmNfVON6s0vmW8q7/0LoHkTome7ZwM6evWne7IEP
         qZl9qWsZQPXNFkhc8uY0oUfHuNHlY4lXIML5VsLHqODYfBlKw6K3YlD8IbAsegfbmXcF
         IpNg==
X-Gm-Message-State: AOAM531wfuOzD3ehVc90gW6OjB3U9K4ApcvyQNSHFw3V1Bka+hBgx+Vj
        w/b5xog5cKIvSUo7MjBj9c6XD9tOVYkT/t4Topq3Cg==
X-Google-Smtp-Source: ABdhPJz2pl88UdGZiEdhSU0xxxQec+qB86gh5vbHEF7z72r27yOYsJNSJdME+O9OhInco0OSWpoSgxOMB4Drz6/96kU=
X-Received: by 2002:a05:6902:d:b0:629:213c:4937 with SMTP id
 l13-20020a056902000d00b00629213c4937mr1341121ybh.66.1650066041469; Fri, 15
 Apr 2022 16:40:41 -0700 (PDT)
MIME-Version: 1.0
References: <1650065756-13520-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1650065756-13520-1-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 16 Apr 2022 02:40:30 +0300
Message-ID: <CAA8EJpoOYmE-6SBvRqp4BXmHrGBZFiFTsKWjRS8SVZhQ0eH5PA@mail.gmail.com>
Subject: Re: [PATCH v8] drm/msm/dp: stop event kernel thread when DP unbind
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie,
        agross@kernel.org, bjorn.andersson@linaro.org,
        quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
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

On Sat, 16 Apr 2022 at 02:36, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Current DP driver implementation, event thread is kept running
> after DP display is unbind. This patch fix this problem by disabling
> DP irq and stop event thread to exit gracefully at dp_display_unbind().
>
> Changes in v2:
> -- start event thread at dp_display_bind()
>
> Changes in v3:
> -- disable all HDP interrupts at unbind
> -- replace dp_hpd_event_setup() with dp_hpd_event_thread_start()
> -- replace dp_hpd_event_stop() with dp_hpd_event_thread_stop()
> -- move init_waitqueue_head(&dp->event_q) to probe()
> -- move spin_lock_init(&dp->event_lock) to probe()
>
> Changes in v4:
> -- relocate both dp_display_bind() and dp_display_unbind() to bottom of file
>
> Changes in v5:
> -- cancel relocation of both dp_display_bind() and dp_display_unbind()
>
> Changes in v6:
> -- move empty event q to dp_event_thread_start()
>
> Changes in v7:
> -- call ktheread_stop() directly instead of dp_hpd_event_thread_stop() function
>
> Changes in v8:
> -- return error immediately if audio registration failed.
>
> Fixes: e91e3065a806 ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 35 +++++++++++++++++++++++++++--------
>  1 file changed, 27 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 01453db..590f90b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -113,6 +113,7 @@ struct dp_display_private {
>         u32 hpd_state;
>         u32 event_pndx;
>         u32 event_gndx;
> +       struct task_struct *ev_tsk;
>         struct dp_event event_list[DP_EVENT_Q_MAX];
>         spinlock_t event_lock;
>
> @@ -230,6 +231,8 @@ void dp_display_signal_audio_complete(struct msm_dp *dp_display)
>         complete_all(&dp->audio_comp);
>  }
>
> +static int dp_hpd_event_thread_start(struct dp_display_private *dp_priv);
> +
>  static int dp_display_bind(struct device *dev, struct device *master,
>                            void *data)
>  {
> @@ -266,9 +269,12 @@ static int dp_display_bind(struct device *dev, struct device *master,
>         }
>
>         rc = dp_register_audio_driver(dev, dp->audio);
> -       if (rc)
> +       if (rc) {
>                 DRM_ERROR("Audio registration Dp failed\n");
> +               goto end;
> +       }
>
> +       rc = dp_hpd_event_thread_start(dp);

At least a DRM_ERROR is missing here. And yes, I'd ask again for a
goto/return 0;

>  end:
>         return rc;
>  }
> @@ -280,6 +286,11 @@ static void dp_display_unbind(struct device *dev, struct device *master,
>         struct drm_device *drm = dev_get_drvdata(master);
>         struct msm_drm_private *priv = drm->dev_private;
>
> +       /* disable all HPD interrupts */
> +       dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, false);
> +
> +       kthread_stop(dp->ev_tsk);
> +
>         dp_power_client_deinit(dp->power);
>         dp_aux_unregister(dp->aux);
>         priv->dp[dp->id] = NULL;
> @@ -1054,7 +1065,7 @@ static int hpd_event_thread(void *data)
>
>         dp_priv = (struct dp_display_private *)data;
>
> -       while (1) {
> +       while (!kthread_should_stop()) {
>                 if (timeout_mode) {
>                         wait_event_timeout(dp_priv->event_q,
>                                 (dp_priv->event_pndx == dp_priv->event_gndx),
> @@ -1132,12 +1143,19 @@ static int hpd_event_thread(void *data)
>         return 0;
>  }
>
> -static void dp_hpd_event_setup(struct dp_display_private *dp_priv)
> +static int dp_hpd_event_thread_start(struct dp_display_private *dp_priv)
>  {
> -       init_waitqueue_head(&dp_priv->event_q);
> -       spin_lock_init(&dp_priv->event_lock);
> +       /* set event q to empty */
> +       dp_priv->event_gndx = 0;
> +       dp_priv->event_pndx = 0;
> +
> +       dp_priv->ev_tsk = kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
> +       if (IS_ERR(dp_priv->ev_tsk)) {
> +               DRM_ERROR("failed to create DP event thread\n");
> +               return PTR_ERR(dp_priv->ev_tsk);
> +       }
>
> -       kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
> +       return 0;
>  }
>
>  static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
> @@ -1266,7 +1284,10 @@ static int dp_display_probe(struct platform_device *pdev)
>                 return -EPROBE_DEFER;
>         }
>
> +       /* setup event q */
>         mutex_init(&dp->event_mutex);
> +       init_waitqueue_head(&dp->event_q);
> +       spin_lock_init(&dp->event_lock);
>
>         /* Store DP audio handle inside DP display */
>         dp->dp_display.dp_audio = dp->audio;
> @@ -1441,8 +1462,6 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>
>         dp = container_of(dp_display, struct dp_display_private, dp_display);
>
> -       dp_hpd_event_setup(dp);
> -
>         dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
>  }
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
With best wishes
Dmitry
