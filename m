Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 399F85B5F9E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Sep 2022 19:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbiILRxD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Sep 2022 13:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbiILRwt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Sep 2022 13:52:49 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F372F3F33B
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 10:52:47 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id k10so16111610lfm.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Sep 2022 10:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=XI0KQ8q7PFkFGP0DABWmIIcFsiDPrqSNCN4sbyFUatc=;
        b=zfaxxC5hscfj2i6FJ63hXlCZ02ftU84yLDoSWWK3pMIfqcAOk0lfJ8g9V9MQ57cc7S
         LXhqgILB3CTzBl6YbJaGZBhQeLi5CupsiCKLmsTZXJMNHkIVz+tE65jLGZjhxr3UzhEr
         LJ12NAzoLkt+3OKVwzPYos7aPoY9tCl31cGYy/V19u0/onROlQwINcPQQMHq1Otg9Jqy
         iGvuG0p+QNbs0qpXSJ0kFbWVNJ6Me5XFsxTPakWVFntoyXESNNCYBqGwuddC4grJoBgx
         6JP9y6CqhmdoubaNUVL70rb9wVzVfpI0gvLECNIR1KYNr1iZNz8HK9QDrFh6Fkbv2WWz
         8hMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=XI0KQ8q7PFkFGP0DABWmIIcFsiDPrqSNCN4sbyFUatc=;
        b=k+lcsuhCmb7hepiYfBSbpZZ9vqaQiEdDvWYzwVsiFAD+LDwm6Fomrew5UnbTjC4bOl
         WhlKasjQxlZIqVVWQ8L/+cPwa1nYR+9/N7ibrEKSWLiM8ETfJeFF7fyBNeijqAp886yj
         5oYfmhuU+KHGD8HXT2yPmc4X1jq+lnmtr5iLhH2LZlREgmhLoOzfAPDT/68GyxzJmlCo
         He/8XgiL0C8IMR2zqfIOOgW4KWFQxYL24DbCZ6oKzNMvumOUF/opZ23niBHP9F0Ks2E7
         GXAwMkgm+5kftGMulewdh2vVzBA77cgMv1Of+oDfP1Nc4lv1oQm+kBFMdVKmAB5H+MHI
         518A==
X-Gm-Message-State: ACgBeo04YnGmG3K3HzoDockzTkg4OHBx31DmCCWK7So96HBH6iebi1fg
        4QuOeZBkvRq6zDeHikQcTyuJ/w==
X-Google-Smtp-Source: AA6agR58ddpzRviculgzcBsEBBSueupQl4jo1hgZZERI2CZncjlF8Iz+Ts2+bJzkmZw/T9tGQdi85w==
X-Received: by 2002:a05:6512:6d5:b0:494:990f:a820 with SMTP id u21-20020a05651206d500b00494990fa820mr9906341lff.536.1663005166350;
        Mon, 12 Sep 2022 10:52:46 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q24-20020a2eb4b8000000b0026acd11cd51sm1216736ljm.59.2022.09.12.10.52.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 10:52:45 -0700 (PDT)
Message-ID: <518564a8-5206-80cc-8306-50296de43abf@linaro.org>
Date:   Mon, 12 Sep 2022 20:52:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 1/7] drm/msm: fix use-after-free on probe deferral
To:     Johan Hovold <johan+linaro@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20220912154046.12900-1-johan+linaro@kernel.org>
 <20220912154046.12900-2-johan+linaro@kernel.org>
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220912154046.12900-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/09/2022 18:40, Johan Hovold wrote:
> The bridge counter was never reset when tearing down the DRM device so
> that stale pointers to deallocated structures would be accessed on the
> next tear down (e.g. after a second late bind deferral).
> 
> Given enough bridges and a few probe deferrals this could currently also
> lead to data beyond the bridge array being corrupted.
> 
> Fixes: d28ea556267c ("drm/msm: properly add and remove internal bridges")
> Cc: stable@vger.kernel.org      # 5.19

Fixes: a3376e3ec81c ("drm/msm: convert to drm_bridge")
Cc: stable@vger.kernel.org # 3.12

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 391d86b54ded..d254fe2507ec 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -241,6 +241,7 @@ static int msm_drm_uninit(struct device *dev)
>   
>   	for (i = 0; i < priv->num_bridges; i++)
>   		drm_bridge_remove(priv->bridges[i]);
> +	priv->num_bridges = 0;
>   
>   	pm_runtime_get_sync(dev);
>   	msm_irq_uninstall(ddev);

-- 
With best wishes
Dmitry

