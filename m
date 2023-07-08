Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 766EC74BA96
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 02:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232882AbjGHAeU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 20:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbjGHAeT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 20:34:19 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D40DF1BF5
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 17:34:17 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fba03becc6so4623527e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 17:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688776456; x=1691368456;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mFeoEp95ns5po24iiOVjiBNQNFUg9MGx4urbNtotoYk=;
        b=lcKcuhFKfOWAx1X+tnOMJ+K1D/sCCoVbGIOhFMwhknnb/8pqXuF2YhWbV/pys9Rp09
         Lv7x0nKnmuvmEuHjh0YoncUHPPFHpScRIu0vyR1sKETI6Cqz8Q5IQWpr7BW8kp58YPAe
         IISv3vsmHut08KnAs0LqucTYg3fSyt73QMEGLiEnGLextm0RU5KgGI5FaaCZxrSp5H1H
         UtD94PJBIW8PVN8tPVm8fp4GYR2LJSmcEfuSkUh3/Cwt6BXZ63l+6eiyPv8PCvJ2g0EU
         lBtAk14Iabxhtv+4nJxJYna2sxUjkAFRu2L5wI5FnfLk2HdMG741BJLfQ5HKwXeMlQdq
         SVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688776456; x=1691368456;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mFeoEp95ns5po24iiOVjiBNQNFUg9MGx4urbNtotoYk=;
        b=UZqP5AW6OkY1onQtIkjc3BzjCGPBCTj9enhhnjVl+IjOsIdPvjLCLvsypBn4abw6Lm
         m0G+UQl4bvtAoZPkvVQ1sAE8bGVQcAtVI9RIbYkeHRJAq0Jhzv9jw9yh/GfKTDsZXsPU
         4vTyJRx5C16P/2pFL5R+mpDW8OTdgy+JZaD5JX9kkkURMyWzLBY7l2hHlAcJQ3+lvMX9
         1q9NKQ1Q2uHdcXGFVY9vKCApxpAajzIfYmPwJtxS4PbVtEebJq2lM2ltCnrq0tRDsUp7
         XkN5FM4Dn6LqnXppLjsLQgeUvJTWKxcPR5rO/ShXT/Do4SL3CBqVxPzzLKU27+tWVdFR
         uN2w==
X-Gm-Message-State: ABy/qLaET9UVLsG/lEljFPMrX6SLUOp2Gh/xLRpVSs4f+r/m4n7VaVTJ
        KYdAyPz72UXBaRp7AXAT6wydYw==
X-Google-Smtp-Source: APBJJlFbdvCfGi2vZqiZbjD944cuLiAoEpBvFyZSDs0zlNPAC2fiTrifdrhglBDLo1qz4kPYAT7OgQ==
X-Received: by 2002:a19:4f48:0:b0:4f8:5ede:d453 with SMTP id a8-20020a194f48000000b004f85eded453mr2142516lfk.23.1688776456101;
        Fri, 07 Jul 2023 17:34:16 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id j16-20020ac25510000000b004fbb20791f3sm861038lfk.31.2023.07.07.17.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 17:34:15 -0700 (PDT)
Message-ID: <b70e6e98-e5a8-71d7-891a-889c268a7e06@linaro.org>
Date:   Sat, 8 Jul 2023 03:34:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 3/5] drm/msm/dp: delete EV_HPD_INIT_SETUP
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, andersson@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
        quic_sbillaka@quicinc.com, marijn.suijten@somainline.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1688773943-3887-1-git-send-email-quic_khsieh@quicinc.com>
 <1688773943-3887-4-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1688773943-3887-4-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/07/2023 02:52, Kuogee Hsieh wrote:
> EV_HPD_INIT_SETUP flag is used to trigger the initialization of external
> DP host controller. Since external DP host controller initialization had
> been incorporated into pm_runtime_resume(), this flag become obsolete.
> Lets get rid of it.

And another question. Between patches #2 and #3 we have both INIT_SETUP 
event and the PM doing dp_display_host_init(). Will it work correctly?

> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 12 ------------
>   1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 2c5706a..44580c2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -55,7 +55,6 @@ enum {
>   enum {
>   	EV_NO_EVENT,
>   	/* hpd events */
> -	EV_HPD_INIT_SETUP,
>   	EV_HPD_PLUG_INT,
>   	EV_IRQ_HPD_INT,
>   	EV_HPD_UNPLUG_INT,
> @@ -1119,9 +1118,6 @@ static int hpd_event_thread(void *data)
>   		spin_unlock_irqrestore(&dp_priv->event_lock, flag);
>   
>   		switch (todo->event_id) {
> -		case EV_HPD_INIT_SETUP:
> -			dp_display_host_init(dp_priv);
> -			break;
>   		case EV_HPD_PLUG_INT:
>   			dp_hpd_plug_handle(dp_priv, todo->data);
>   			break;
> @@ -1483,15 +1479,7 @@ void __exit msm_dp_unregister(void)
>   
>   void msm_dp_irq_postinstall(struct msm_dp *dp_display)
>   {
> -	struct dp_display_private *dp;
> -
> -	if (!dp_display)
> -		return;
> -
> -	dp = container_of(dp_display, struct dp_display_private, dp_display);
>   
> -	if (!dp_display->is_edp)
> -		dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 0);
>   }
>   
>   bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)

-- 
With best wishes
Dmitry

