Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59650505C57
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Apr 2022 18:21:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245555AbiDRQYW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Apr 2022 12:24:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238992AbiDRQYW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Apr 2022 12:24:22 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7603B2ED46
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 09:21:42 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id x17so24903306lfa.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 09:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=j2hYoC9lAx6KU/df0E9qOjOntn7E5fCvi9Hln+94RRM=;
        b=O2VDwvG90TN+4xSMCdH90drHO1qG0V8XP02ZXCYphNgIYt9QlJ/O/d1dPKaSVKSTAt
         XXqTgX0N9+KKMXWI8B/JH7gxR/FKedeZz+UEx0DbOtuCvQUvCawZ7PaZV/9cK7l47GBN
         fvNuWhusNbOwgFSkvjmtby179HrEn33iUX48+CRc7NqBClg09fTTNUguWE0rb8N3estO
         xqTfRzydVVJ4wsiqL98Rc0Tdff+Vd27OVw1BwPwRg+DqHq5yxqkaQEGyNuji9bf1JXG9
         PZujdSSiSxYm3AC5iPRHCDG2dTshIUKggSi/XClWSVoVP2ERcEf8Oam4o/h4b1caXPy3
         BRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=j2hYoC9lAx6KU/df0E9qOjOntn7E5fCvi9Hln+94RRM=;
        b=jzfI00iUFFU9qzpe/mon06q3jWaDOxt5E1EwP7henD4yWh4d2B6pQXiexZpMKefrn1
         vaOx4Ly3HmLezUOiujlcWJq+NLp3iRJkhHSDKscjqajjqazDgzJeGzei2hetwsKnqtfw
         4zTGaRxaVf72Bs5hv/+ZuEQkmMCS5aq0MeJw1gKsD5sEFCEWAz+qyf3Jz3HFaRF/iuo6
         QqcpzyByhecLBWUWdBKTn+CXZiIIw0C1q8uFOm945govbLR34q+ndudIx/mVmaUxqJWx
         vXh7AVgXnXnfjz+aanOI/N6AFW3KbIRG4BdHGFwiQvu8R0dvTyJIjRnekiZRbISGSwkW
         oUEw==
X-Gm-Message-State: AOAM532NFSi5Ue6Nw760PLAOG752I02moPFQ+p0rBHWVhlwLF5ZdH8va
        12yEHQS/BXy39GfxCKi3eKNo3A==
X-Google-Smtp-Source: ABdhPJyfNS6UmZZQQCFsEmCqvjqi+6SZLClXzpff3CL81JHrSSJQk7F4tKxVFgxDn6zlQVxxTMRJPg==
X-Received: by 2002:a05:6512:39c1:b0:44a:e25d:47fd with SMTP id k1-20020a05651239c100b0044ae25d47fdmr8387157lfu.580.1650298900343;
        Mon, 18 Apr 2022 09:21:40 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z27-20020a2eb53b000000b0024d9bbbb640sm1191826ljm.68.2022.04.18.09.21.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Apr 2022 09:21:39 -0700 (PDT)
Message-ID: <510985b1-c789-8292-9124-8b954777258d@linaro.org>
Date:   Mon, 18 Apr 2022 19:21:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v9] drm/msm/dp: stop event kernel thread when DP unbind
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, vkoul@kernel.org,
        daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1650066445-18186-1-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1650066445-18186-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/04/2022 02:47, Kuogee Hsieh wrote:
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
> Changes in v9:
> -- return error immediately if event thread create failed.
> 
> Fixes: e91e3065a806 ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 41 +++++++++++++++++++++++++++++--------
>   1 file changed, 33 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 01453db..5b289b9 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -113,6 +113,7 @@ struct dp_display_private {
>   	u32 hpd_state;
>   	u32 event_pndx;
>   	u32 event_gndx;
> +	struct task_struct *ev_tsk;
>   	struct dp_event event_list[DP_EVENT_Q_MAX];
>   	spinlock_t event_lock;
>   
> @@ -230,6 +231,8 @@ void dp_display_signal_audio_complete(struct msm_dp *dp_display)
>   	complete_all(&dp->audio_comp);
>   }
>   
> +static int dp_hpd_event_thread_start(struct dp_display_private *dp_priv);
> +
>   static int dp_display_bind(struct device *dev, struct device *master,
>   			   void *data)
>   {
> @@ -266,9 +269,18 @@ static int dp_display_bind(struct device *dev, struct device *master,
>   	}
>   
>   	rc = dp_register_audio_driver(dev, dp->audio);
> -	if (rc)
> +	if (rc) {
>   		DRM_ERROR("Audio registration Dp failed\n");
> +		goto end;
> +	}
>   
> +	rc = dp_hpd_event_thread_start(dp);
> +	if (rc) {
> +		DRM_ERROR("Event thread create failed\n");
> +		goto end;
> +	}
> +
> +	return 0;
>   end:
>   	return rc;
>   }
> @@ -280,6 +292,11 @@ static void dp_display_unbind(struct device *dev, struct device *master,
>   	struct drm_device *drm = dev_get_drvdata(master);
>   	struct msm_drm_private *priv = drm->dev_private;
>   
> +	/* disable all HPD interrupts */
> +	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_INT_MASK, false);
> +
> +	kthread_stop(dp->ev_tsk);
> +
>   	dp_power_client_deinit(dp->power);
>   	dp_aux_unregister(dp->aux);
>   	priv->dp[dp->id] = NULL;
> @@ -1054,7 +1071,7 @@ static int hpd_event_thread(void *data)
>   
>   	dp_priv = (struct dp_display_private *)data;
>   
> -	while (1) {
> +	while (!kthread_should_stop()) {
>   		if (timeout_mode) {
>   			wait_event_timeout(dp_priv->event_q,
>   				(dp_priv->event_pndx == dp_priv->event_gndx),
> @@ -1132,12 +1149,19 @@ static int hpd_event_thread(void *data)
>   	return 0;
>   }
>   
> -static void dp_hpd_event_setup(struct dp_display_private *dp_priv)
> +static int dp_hpd_event_thread_start(struct dp_display_private *dp_priv)
>   {
> -	init_waitqueue_head(&dp_priv->event_q);
> -	spin_lock_init(&dp_priv->event_lock);
> +	/* set event q to empty */
> +	dp_priv->event_gndx = 0;
> +	dp_priv->event_pndx = 0;
> +
> +	dp_priv->ev_tsk = kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
> +	if (IS_ERR(dp_priv->ev_tsk)) {
> +		DRM_ERROR("failed to create DP event thread\n");
> +		return PTR_ERR(dp_priv->ev_tsk);
> +	}
>   
> -	kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
> +	return 0;
>   }
>   
>   static irqreturn_t dp_display_irq_handler(int irq, void *dev_id)
> @@ -1266,7 +1290,10 @@ static int dp_display_probe(struct platform_device *pdev)
>   		return -EPROBE_DEFER;
>   	}
>   
> +	/* setup event q */
>   	mutex_init(&dp->event_mutex);
> +	init_waitqueue_head(&dp->event_q);
> +	spin_lock_init(&dp->event_lock);
>   
>   	/* Store DP audio handle inside DP display */
>   	dp->dp_display.dp_audio = dp->audio;
> @@ -1441,8 +1468,6 @@ void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>   
>   	dp = container_of(dp_display, struct dp_display_private, dp_display);
>   
> -	dp_hpd_event_setup(dp);
> -
>   	dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 100);
>   }
>   


-- 
With best wishes
Dmitry
