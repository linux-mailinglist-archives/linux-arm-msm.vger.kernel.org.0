Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 381F964E13E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Dec 2022 19:47:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbiLOSri (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Dec 2022 13:47:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbiLOSrJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Dec 2022 13:47:09 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 104FA4B9B0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Dec 2022 10:46:45 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id q6so17029134lfm.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Dec 2022 10:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ow/jl7Lq41cBFQ0kKYmK3RpwA+PwdFmm0JCIINqkeK0=;
        b=PdRHvaroyyS1RdpumfsfR6h4Wj9Lu9gS/2+GiHYn0w0gdLNVkPwX7FmIcY67+eLRUI
         M6zO+sKFhu76hMlzRNbAmhGibi8Cp5uhwF1xKhRMP0LIbZx+3ZWrfPG5oov2XIJrnLrB
         rCLgtPgM5q083f8xPuyeIN0Q8sxH9rMMF2fjyc8+1soo4NvPkusUz/OC2pN+QDuJJPuI
         bBuQeuC8JUcvQODphD+ceDTSoY1kdXbbksdhqFMQSZjJwkGBuHA1lhx9Zrj0XTK3TUbb
         aUa7O0ckOwF89ju+CIFtmnECwLtGrwmdVFqG3OlMJGmYcR7zNX3RrkAb806NT/P6fZXo
         XMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ow/jl7Lq41cBFQ0kKYmK3RpwA+PwdFmm0JCIINqkeK0=;
        b=FYuJ5OZqqibqLJcdmD2w1iw34BvD5PK+NmjZFWsb4CaIxydOKXbYiS9Ri6ipzyBE/+
         edAc0w88RiVHZ+hgvnVlyK6fjmIMHLLFBVBe6A7zBJHpjgOwEyOwUnagnJrHnzu5QBDn
         ZuSgmc3nOa9VuCMO1ZNdu+FN9TlrAWoiczaI4e/+AA4LbXz5z8VAKBVtI+lm4twwxP4u
         XMUk4O8hY5RHzPBuL+vGOZROWtX3XYrbYkFsq78TKVafjdyj/YDIxH1NpkgNdCQ2g4TA
         JOzmJgYH7cFsPiUD1PZgoHybm/mwxf03KxRyMYopdCVXDMIRrX8uM9WLGPwbBzFd2Pyj
         tGFg==
X-Gm-Message-State: ANoB5pmRxCvGxb6xibR0FDJZBXkkdpZc5bf+QI0rO6ke5vUx2RrGwzEi
        DK0FQmCFFV9TcSYgjrxSRh1kGg==
X-Google-Smtp-Source: AA0mqf7SeygvyCy/5X5fmIjhgJWnrVBU9vsPrvMp3HwiuIP9qbAaMQeoO/WKQxgAYzcVKUrpIDjcKg==
X-Received: by 2002:a05:6512:15a7:b0:4b6:e494:a98d with SMTP id bp39-20020a05651215a700b004b6e494a98dmr7751372lfb.44.1671130003399;
        Thu, 15 Dec 2022 10:46:43 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c15-20020a056512074f00b004b5774726dcsm1225419lfs.236.2022.12.15.10.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 10:46:42 -0800 (PST)
Message-ID: <ca15a54b-8040-5e4f-a78e-12b7f8a554e1@linaro.org>
Date:   Thu, 15 Dec 2022 20:46:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2] drm/msm/dp: do not complete dp_aux_cmd_fifo_tx() if
 irq is not for aux transfer
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, andersson@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1671129159-31105-1-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1671129159-31105-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/12/2022 20:32, Kuogee Hsieh wrote:
> There are 3 possible interrupt sources are handled by DP controller,
> HPDstatus, Controller state changes and Aux read/write transaction.
> At every irq, DP controller have to check isr status of every interrupt
> sources and service the interrupt if its isr status bits shows interrupts
> are pending. There is potential race condition may happen at current aux
> isr handler implementation since it is always complete dp_aux_cmd_fifo_tx()
> even irq is not for aux read or write transaction. This may cause aux read
> transaction return premature if host aux data read is in the middle of
> waiting for sink to complete transferring data to host while irq happen.
> This will cause host's receiving buffer contains unexpected data. This
> patch fixes this problem by checking aux isr and return immediately at
> aux isr handler if there are no any isr status bits set.
> 
> Current there is a bug report regrading eDP edid corruption happen during
> system booting up. After lengthy debugging to found that VIDEO_READY
> interrupt was continuously firing during system booting up which cause
> dp_aux_isr() to complete dp_aux_cmd_fifo_tx() prematurely to retrieve data
> from aux hardware buffer which is not yet contains complete data transfer
> from sink. This cause edid corruption.
> 
> Follows are the signature at kernel logs when problem happen,
> EDID has corrupt header
> panel-simple-dp-aux aux-aea0000.edp: Couldn't identify panel via EDID
> panel-simple-dp-aux aux-aea0000.edp: error -EIO: Couldn't detect panel nor find a fallback
> 
> Changes in v2:
> -- do complete if (ret == IRQ_HANDLED) ay dp-aux_isr()
> -- add more commit text

Usually it's a single dash.

> 
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

There should be no empty lines between the tags.

> Tested-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_aux.c | 87 +++++++++++++++++++++++++++++------------
>   1 file changed, 63 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index d030a93..f31e5c1 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -162,45 +162,78 @@ static ssize_t dp_aux_cmd_fifo_rx(struct dp_aux_private *aux,
>   	return i;
>   }
>   
> -static void dp_aux_native_handler(struct dp_aux_private *aux, u32 isr)
> +static irqreturn_t dp_aux_native_handler(struct dp_aux_private *aux, u32 isr)
>   {
> -	if (isr & DP_INTR_AUX_I2C_DONE)
> +	irqreturn_t ret = IRQ_NONE;
> +
> +	if (isr & DP_INTR_AUX_I2C_DONE) {
>   		aux->aux_error_num = DP_AUX_ERR_NONE;
> -	else if (isr & DP_INTR_WRONG_ADDR)
> +		ret = IRQ_HANDLED;
> +	} else if (isr & DP_INTR_WRONG_ADDR) {
>   		aux->aux_error_num = DP_AUX_ERR_ADDR;
> -	else if (isr & DP_INTR_TIMEOUT)
> +		ret = IRQ_HANDLED;
> +	} else if (isr & DP_INTR_TIMEOUT) {
>   		aux->aux_error_num = DP_AUX_ERR_TOUT;
> -	if (isr & DP_INTR_NACK_DEFER)
> +		ret = IRQ_HANDLED;
> +	}
> +
> +	if (isr & DP_INTR_NACK_DEFER) {
>   		aux->aux_error_num = DP_AUX_ERR_NACK;
> +		ret = IRQ_HANDLED;
> +	}
> +
>   	if (isr & DP_INTR_AUX_ERROR) {
>   		aux->aux_error_num = DP_AUX_ERR_PHY;
>   		dp_catalog_aux_clear_hw_interrupts(aux->catalog);
> +		ret = IRQ_HANDLED;
>   	}
> +
> +	return ret;
>   }
>   
> -static void dp_aux_i2c_handler(struct dp_aux_private *aux, u32 isr)
> +static irqreturn_t dp_aux_i2c_handler(struct dp_aux_private *aux, u32 isr)
>   {
> +	irqreturn_t ret = IRQ_NONE;
> +
>   	if (isr & DP_INTR_AUX_I2C_DONE) {
>   		if (isr & (DP_INTR_I2C_NACK | DP_INTR_I2C_DEFER))
>   			aux->aux_error_num = DP_AUX_ERR_NACK;
>   		else
>   			aux->aux_error_num = DP_AUX_ERR_NONE;
> -	} else {
> -		if (isr & DP_INTR_WRONG_ADDR)
> -			aux->aux_error_num = DP_AUX_ERR_ADDR;
> -		else if (isr & DP_INTR_TIMEOUT)
> -			aux->aux_error_num = DP_AUX_ERR_TOUT;
> -		if (isr & DP_INTR_NACK_DEFER)
> -			aux->aux_error_num = DP_AUX_ERR_NACK_DEFER;
> -		if (isr & DP_INTR_I2C_NACK)
> -			aux->aux_error_num = DP_AUX_ERR_NACK;
> -		if (isr & DP_INTR_I2C_DEFER)
> -			aux->aux_error_num = DP_AUX_ERR_DEFER;
> -		if (isr & DP_INTR_AUX_ERROR) {
> -			aux->aux_error_num = DP_AUX_ERR_PHY;
> -			dp_catalog_aux_clear_hw_interrupts(aux->catalog);
> -		}
> +
> +		return IRQ_HANDLED;
> +	}
> +
> +	if (isr & DP_INTR_WRONG_ADDR) {
> +		aux->aux_error_num = DP_AUX_ERR_ADDR;
> +		ret = IRQ_HANDLED;
> +	} else if (isr & DP_INTR_TIMEOUT) {
> +		aux->aux_error_num = DP_AUX_ERR_TOUT;
> +		ret = IRQ_HANDLED;
>   	}
> +
> +	if (isr & DP_INTR_NACK_DEFER) {
> +		aux->aux_error_num = DP_AUX_ERR_NACK_DEFER;
> +		ret = IRQ_HANDLED;
> +	}
> +
> +	if (isr & DP_INTR_I2C_NACK) {
> +		aux->aux_error_num = DP_AUX_ERR_NACK;
> +		ret = IRQ_HANDLED;
> +	}
> +
> +	if (isr & DP_INTR_I2C_DEFER) {
> +		aux->aux_error_num = DP_AUX_ERR_DEFER;
> +		ret = IRQ_HANDLED;
> +	}
> +
> +	if (isr & DP_INTR_AUX_ERROR) {
> +		aux->aux_error_num = DP_AUX_ERR_PHY;
> +		dp_catalog_aux_clear_hw_interrupts(aux->catalog);
> +		ret = IRQ_HANDLED;
> +	}
> +
> +	return ret;
>   }
>   
>   static void dp_aux_update_offset_and_segment(struct dp_aux_private *aux,
> @@ -413,6 +446,7 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux)
>   {
>   	u32 isr;
>   	struct dp_aux_private *aux;
> +	irqreturn_t ret = IRQ_NONE;

No need to assign a value here. It will be overwritten in both of code 
branches.

>   
>   	if (!dp_aux) {
>   		DRM_ERROR("invalid input\n");
> @@ -423,15 +457,20 @@ void dp_aux_isr(struct drm_dp_aux *dp_aux)
>   
>   	isr = dp_catalog_aux_get_irq(aux->catalog);
>   
> +	/* no interrupts pending, return immediately */
> +	if (!isr)
> +		return;
> +

A separate commit please.

>   	if (!aux->cmd_busy)
>   		return;
>   
>   	if (aux->native)
> -		dp_aux_native_handler(aux, isr);
> +		ret = dp_aux_native_handler(aux, isr);
>   	else
> -		dp_aux_i2c_handler(aux, isr);
> +		ret = dp_aux_i2c_handler(aux, isr);
>   
> -	complete(&aux->comp);
> +	if (ret == IRQ_HANDLED)
> +		complete(&aux->comp);

Can you just move the complete() into the individual handling functions? 
Then you won't have to return the error code from dp_aux_*_handler() at 
all. You can check `isr' in that function and call complete if there was 
any error.

Also could you please describe, why is it necessary to complete() 
condition at all? Judging from your commit message the `if (!isr) 
return;' part should be enough.

>   }
>   
>   void dp_aux_reconfig(struct drm_dp_aux *dp_aux)

-- 
With best wishes
Dmitry

