Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7EA657054B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 16:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230076AbiGKOT0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 10:19:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbiGKOTY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 10:19:24 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E81826AFD
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 07:19:23 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id q7so6361294lji.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 07:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2eZo4Uf6DLNwIqIGEbJqR98FHQ75J7mZnbMsiIwBVKI=;
        b=vujer/oRPRtI1ITzp7sb4qrUT0cs7mbUQjUa2ra+SuUd2wHg2VERiBFINrc7WNUuQV
         KtfF02S1QYcC5W0ss7ATKEEoDs07h4GacynEfju7LtaM+sB5pkPB9I93JryFKB1QhDSz
         FsshgD2tJJIIpthobBWkQxaGmPQBF69sx6h0z6596x/XvtdlObx8rtMH3bm66cKHjj8o
         i92TOVUwdFVy8EVa6ewL0B9ctibdzxBcGLMzS2LRuZABMYy23H+t8Fj1FZnx7K9/BdZu
         3GSSOpXXl6Vw5P2FJLCEIqXCl5yLZ3MLWSgOfHYhTGUNQzI/Nb4/twogEiFwojnLJ7Io
         e2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2eZo4Uf6DLNwIqIGEbJqR98FHQ75J7mZnbMsiIwBVKI=;
        b=J60N7xBMFeqg8ngdIhkk8vXS0vG0Nldo4K422SYAXE6G35HURywH/JRnZxLDbaVNPW
         2F3lZjuAUsK1yH9J8YUF87znI7O/ULd5sehjyJ5EN1fKWC8ohwyaWmebX/sqkry21yTV
         gNQs2hetKHycAmuj5rjyWz8OQ1wZfCykBVEIgsIiLHAMNtyWgGm64AmmyVgL+SvT2nci
         saxPdlRsqRbTXkQHMBvh0R6QQYF3giwlimAK1WZCWgMfuuehH0RGFiROyyhxiDA6bJEw
         OOhHlchsvDC2kZ/9zz2UKlkGTw1nagxKD9A1ptUzNjrZtWzPGmydeq00cqLbrWt3jBXg
         JnZQ==
X-Gm-Message-State: AJIora92mDglO65404rCbtMNoQfVtcpLlw8cvnDWlG0EgJrwVJTd4jqq
        Urv9Vl9HtDf+Xr/cv4pBldA8V94oexLLAA==
X-Google-Smtp-Source: AGRyM1sUAjzTkZR8LmknXSW2Y4xr55HJXTle46S+m4AlsuiejFOrYPId1uZ2SDxwXBlZq8YNe76JCA==
X-Received: by 2002:a05:651c:1246:b0:25a:9a7c:680c with SMTP id h6-20020a05651c124600b0025a9a7c680cmr10637075ljh.79.1657549161556;
        Mon, 11 Jul 2022 07:19:21 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p13-20020a2e804d000000b0025a885a135csm1780371ljg.119.2022.07.11.07.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 07:19:21 -0700 (PDT)
Message-ID: <28b560ab-7323-3c0d-b07c-1741874b6d00@linaro.org>
Date:   Mon, 11 Jul 2022 17:19:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 09/10] drm/msm/disp/dpu: add PSR support for eDP
 interface in dpu driver
Content-Language: en-GB
To:     Vinod Polimera <quic_vpolimer@quicinc.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, swboyd@chromium.org,
        quic_kalyant@quicinc.com, quic_khsieh@quicinc.com,
        quic_vproddut@quicinc.com, bjorn.andersson@linaro.org,
        quic_aravindh@quicinc.com, quic_abhinavk@quicinc.com,
        quic_sbillaka@quicinc.com
References: <1657544224-10680-1-git-send-email-quic_vpolimer@quicinc.com>
 <1657544224-10680-10-git-send-email-quic_vpolimer@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1657544224-10680-10-git-send-email-quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/07/2022 15:57, Vinod Polimera wrote:
> Enable PSR on eDP interface using drm self-refresh librabry.
> This patch uses a trigger from self-refresh library to enter/exit
> into PSR, when there are no updates from framework.
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 13 ++++++++++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 14 ++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  2 +-
>   3 files changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index f91e3d1..eb3915a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -18,6 +18,7 @@
>   #include <drm/drm_probe_helper.h>
>   #include <drm/drm_rect.h>
>   #include <drm/drm_vblank.h>
> +#include <drm/drm_self_refresh_helper.h>
>   
>   #include "dpu_kms.h"
>   #include "dpu_hw_lm.h"
> @@ -961,6 +962,9 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
>   
>   	DRM_DEBUG_KMS("crtc%d\n", crtc->base.id);
>   
> +	if (old_crtc_state->self_refresh_active)
> +		return;
> +
>   	/* Disable/save vblank irq handling */
>   	drm_crtc_vblank_off(crtc);
>   
> @@ -1521,7 +1525,7 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
>   {
>   	struct drm_crtc *crtc = NULL;
>   	struct dpu_crtc *dpu_crtc = NULL;
> -	int i;
> +	int i, ret;
>   
>   	dpu_crtc = kzalloc(sizeof(*dpu_crtc), GFP_KERNEL);
>   	if (!dpu_crtc)
> @@ -1558,6 +1562,13 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
>   	/* initialize event handling */
>   	spin_lock_init(&dpu_crtc->event_lock);
>   
> +	ret = drm_self_refresh_helper_init(crtc);
> +	if (ret) {
> +		DPU_ERROR("Failed to initialize %s with self-refresh helpers %d\n",
> +			crtc->name, ret);
> +		return ERR_PTR(ret);
> +	}
> +
>   	DRM_DEBUG_KMS("%s: successfully initialized crtc\n", dpu_crtc->name);
>   	return crtc;
>   }
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 3156efb..5dfb56a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -12,6 +12,7 @@
>   #include <linux/kthread.h>
>   #include <linux/seq_file.h>
>   
> +#include <drm/drm_atomic.h>
>   #include <drm/drm_crtc.h>
>   #include <drm/drm_file.h>
>   #include <drm/drm_probe_helper.h>
> @@ -1170,11 +1171,24 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
>   					struct drm_atomic_state *state)
>   {
>   	struct dpu_encoder_virt *dpu_enc = NULL;
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *old_state = NULL;
>   	int i = 0;
>   
>   	dpu_enc = to_dpu_encoder_virt(drm_enc);
>   	DPU_DEBUG_ENC(dpu_enc, "\n");
>   
> +	crtc = drm_atomic_get_old_crtc_for_encoder(state, drm_enc);
> +	if (crtc)
> +		old_state = drm_atomic_get_old_crtc_state(state, crtc);
> +
> +	/*
> +	 * The encoder is already disabled if self refresh mode was set earlier,
> +	 * in the old_state for the corresponding crtc.
> +	 */
> +	if (old_state && old_state->self_refresh_active)
> +		return;
> +
>   	mutex_lock(&dpu_enc->enc_lock);
>   	dpu_enc->enabled = false;
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index bce4764..cc0a674 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -507,7 +507,7 @@ static void dpu_kms_wait_for_commit_done(struct msm_kms *kms,
>   		return;
>   	}
>   
> -	if (!crtc->state->active) {
> +	if (!drm_atomic_crtc_effectively_active(crtc->state)) {
>   		DPU_DEBUG("[crtc:%d] not active\n", crtc->base.id);
>   		return;
>   	}


-- 
With best wishes
Dmitry
