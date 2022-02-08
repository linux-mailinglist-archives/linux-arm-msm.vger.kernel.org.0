Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49FA74AE1CA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Feb 2022 20:00:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385743AbiBHTAi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Feb 2022 14:00:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385737AbiBHTAh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Feb 2022 14:00:37 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F7FEC0613CB
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Feb 2022 11:00:36 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id o17so279176ljp.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Feb 2022 11:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=X5idf+WlJTR+N6QCM9X70r3K4p6PD3inGr4pvoZvcQ8=;
        b=ZRwxqS+lXDRPyY6BPRaRLJPV25om5S+ENA0vHQKXt8iVKql0Qi2j/4t6hElid/+Yuj
         NSUGn0H48hfN/4u9jtlSv1CjHTeDOkz7jynWB72DQeqOwyff605Muza+1wXxts3UY8UT
         V2OOUVa/y0tY1bsmHWeXr36FX4Svf+zFB77po7eLBV+rJvK77HFnAxksWS+uRnKU7UqB
         0OXtWpA4mmEJf6Mr5s2WvJofPwvU1e9fgyglPQ3+6an0H3FoBDIGbT8w1uvQIIRclcCK
         2SmFyOOjkm/zXqWa7ciibJonl7RWSx8DnSHEHofRoFauYER8YZG1VPpBiTOImaCaLI+J
         gqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=X5idf+WlJTR+N6QCM9X70r3K4p6PD3inGr4pvoZvcQ8=;
        b=xSnwjn4g5MG8ZrzX7+LVOO6JrHRhPHgFl+fN4hsYzzSkO9seb35s99FSGmc3l/9UCS
         8L7U5n6GZgRynySIgGLa/aor0Y7r0P56Xy5XRONkw/t4ULRhHnwIs8ctFjSVPCFDChNV
         8UJxPZlFdw30HXp0bY+1/9gLInBSwHjZ86vSDM8jmIO1Ax10Djxse76FTGrW2lBAsr3a
         VL1EiDQFwyUoFU4BIaY6GSPG6l5jfvcy9cD27QF+i7R6JzJZVdx/YSEB2SMiU07Tgpid
         GtA0i7I75IDNB5jTB0BHVcKdSZKs+KeZU1QhnU46rjVMklHd6SUAjGtUGO5hrlOmlCuK
         EYVw==
X-Gm-Message-State: AOAM533BXBSZN58HM+8Ak2i8xrcCtEVzFD38LqaEgTr8oP9bxRKdqA9x
        QfDlScaK8pdwcV+1HVDNWmdc+w==
X-Google-Smtp-Source: ABdhPJwgOo1mFkNhrC5BE+wgAukIA9Dh+8AwNOza8whvE6emCUAJT4bgFiILf1YyBHCHKHP7/sOdVw==
X-Received: by 2002:a2e:bd82:: with SMTP id o2mr3750771ljq.454.1644346834496;
        Tue, 08 Feb 2022 11:00:34 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h3sm489142lfu.258.2022.02.08.11.00.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Feb 2022 11:00:34 -0800 (PST)
Message-ID: <9a25cdaa-7f2c-3f85-0560-26684295731f@linaro.org>
Date:   Tue, 8 Feb 2022 22:00:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 2/3] drm/msm/dsi: Add support for qcm2290 dsi controller
Content-Language: en-GB
To:     Loic Poulain <loic.poulain@linaro.org>, robdclark@gmail.com,
        sean@poorly.run, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org
References: <1644346272-3403-1-git-send-email-loic.poulain@linaro.org>
 <1644346272-3403-2-git-send-email-loic.poulain@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1644346272-3403-2-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/02/2022 21:51, Loic Poulain wrote:
> Using exact version of the block as compatible string.

It would be nice to add a few words here, why is this necessary.
If you provide a paragraph, I'll insert it when applying the patch.

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi.c     |  2 ++
>   drivers/gpu/drm/msm/dsi/dsi_cfg.c | 23 +++++++++++++++++++++++
>   drivers/gpu/drm/msm/dsi/dsi_cfg.h |  3 +++
>   3 files changed, 28 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index 06a9008..bed8b24b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include "dsi.h"
> +#include "dsi_cfg.h"
>   
>   struct drm_encoder *msm_dsi_get_encoder(struct msm_dsi *msm_dsi)
>   {
> @@ -171,6 +172,7 @@ static int dsi_dev_remove(struct platform_device *pdev)
>   
>   static const struct of_device_id dt_match[] = {
>   	{ .compatible = "qcom,mdss-dsi-ctrl", .data = NULL /* autodetect cfg */ },
> +	{ .compatible = "qcom,dsi-ctrl-6g-qcm2290", .data = &qcm2290_dsi_cfg_handler },
>   	{}
>   };
>   
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index 96bbc8b..2c23324 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -213,6 +213,24 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
>   	.num_dsi = 1,
>   };
>   
> +static const char * const dsi_qcm2290_bus_clk_names[] = {
> +	"iface", "bus",
> +};
> +
> +static const struct msm_dsi_config qcm2290_dsi_cfg = {
> +	.io_offset = DSI_6G_REG_SHIFT,
> +	.reg_cfg = {
> +		.num = 1,
> +		.regs = {
> +			{"vdda", 21800, 4 },	/* 1.2 V */
> +		},
> +	},
> +	.bus_clk_names = dsi_qcm2290_bus_clk_names,
> +	.num_bus_clks = ARRAY_SIZE(dsi_qcm2290_bus_clk_names),
> +	.io_start = { 0x5e94000 },
> +	.num_dsi = 1,
> +};
> +
>   static const struct msm_dsi_host_cfg_ops msm_dsi_v2_host_ops = {
>   	.link_clk_set_rate = dsi_link_clk_set_rate_v2,
>   	.link_clk_enable = dsi_link_clk_enable_v2,
> @@ -300,3 +318,8 @@ const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
>   	return cfg_hnd;
>   }
>   
> +/*  Non autodetect configs */
> +const struct msm_dsi_cfg_handler qcm2290_dsi_cfg_handler = {
> +	.cfg = &qcm2290_dsi_cfg,
> +	.ops = &msm_dsi_6g_v2_host_ops,
> +};
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> index 41e99a9..fe54a99 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> @@ -60,5 +60,8 @@ struct msm_dsi_cfg_handler {
>   
>   const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor);
>   
> +/* Non autodetect configs */
> +extern const struct msm_dsi_cfg_handler qcm2290_dsi_cfg_handler;
> +
>   #endif /* __MSM_DSI_CFG_H__ */
>   


-- 
With best wishes
Dmitry
