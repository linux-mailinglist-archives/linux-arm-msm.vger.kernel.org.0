Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A841F4AE1B0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Feb 2022 20:00:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239754AbiBHS7e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Feb 2022 13:59:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233759AbiBHS7d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Feb 2022 13:59:33 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F148AC0612C0
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Feb 2022 10:59:31 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id u7so258643lji.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Feb 2022 10:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=bQB+ftnSY0O1ZK05ER49H8IGOWJpmU3jW6AeMHPyTUs=;
        b=BAe4xDP+1cEdf24JBbd1r24zYrbEzXaFHP7c4BCVvBASnm4y2OTl+5q/mMTV4dlj2C
         GS+FUpzKnKZODBZ7ZZfpDkD3hrj0aPOoALuNJtXE+DTjPbZ6syqFt3EAQsa+KnfOv72Y
         PUUCCk5o9z/WAFwS2yC7gJakBOthR69Fd7Zd/lbdd88GyFZ6nb4Na2/Loo6Z6qz+kMbF
         hZKuDPAZGOpCZ7OdZzG4hnm3yWSbn5+mFd7z/lxDQ6aZAfAbHBUvyOzmv/kLd9TRi9i4
         tqMRyf8bCT4Kpp4df8qAaYLF2nNefjZxSHKerwyvpjjX1DIqLL3/uCeSkij7IAGOU9MK
         GTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bQB+ftnSY0O1ZK05ER49H8IGOWJpmU3jW6AeMHPyTUs=;
        b=h7zPlytW71qJtYu8I4bQJKjzD5u6QK0h+ModBanCB6d3QtN38kR0WaRKyahds08t6x
         uHKNXB0sAF5Qex3hjVM+V14wiDdsmsjlqYYJKasOrGTpTM50PYUt+9O/rV3+XCF+9b8T
         b3AXmjLaEZGN7UPHYFCXz0i2MDcCbz9tgStO+X/Q7GHwMvzrvStH8JDoMKLn2hRkGnap
         Xv2auCo22QcpsMqjvXnt8XD5g32yY0aC2+r8xgOw7+WeBU5WFVdwhGNqXtcnK/K5pPfU
         Izoq33N0o0aU5DRNUVjE+ZHZqbXzMHPkSqX6Sqr2nSEeyBBnDLWD9N2XWQNKzgTYHRCh
         Sz7w==
X-Gm-Message-State: AOAM532o6O7Vl+/uaK1TIhpbXFoDL91zlvxBMQEzpfJaRJY9gq4bkYoZ
        1bLv3k4NHX3zeH7AW+jsXpJxSA==
X-Google-Smtp-Source: ABdhPJypl7uaGaNngWAFaT2U5vjwQHwAZV4DP7m2dQKe5GzDQfWzH6WoQat9xfxbm8A+QrSPvD0Pqg==
X-Received: by 2002:a2e:8715:: with SMTP id m21mr3608988lji.354.1644346770333;
        Tue, 08 Feb 2022 10:59:30 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a2sm2024850lfl.246.2022.02.08.10.59.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Feb 2022 10:59:29 -0800 (PST)
Message-ID: <285df693-c811-4fc8-f8c3-31a118a5c417@linaro.org>
Date:   Tue, 8 Feb 2022 21:59:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 1/3] drm/msm/dsi: Allow to specify dsi config as pdata
Content-Language: en-GB
To:     Loic Poulain <loic.poulain@linaro.org>, robdclark@gmail.com,
        sean@poorly.run, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org
References: <1644346272-3403-1-git-send-email-loic.poulain@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1644346272-3403-1-git-send-email-loic.poulain@linaro.org>
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
> Config autodetect based on DSI controller version is quite limited
> since several qcom SoCs can integrate a DSI controller with the same
> version, but with different config (io_offset, supplies, etc).
> 
> This change allows to specify dsi config via device data pointer.
> config autodetect is still used in case data pointer is NULL.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dsi/dsi.c      | 2 +-
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 4 ++++
>   2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index 0525488..06a9008 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -170,7 +170,7 @@ static int dsi_dev_remove(struct platform_device *pdev)
>   }
>   
>   static const struct of_device_id dt_match[] = {
> -	{ .compatible = "qcom,mdss-dsi-ctrl" },
> +	{ .compatible = "qcom,mdss-dsi-ctrl", .data = NULL /* autodetect cfg */ },
>   	{}
>   };
>   
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 6b3ced4..c540acc 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -212,6 +212,10 @@ static const struct msm_dsi_cfg_handler *dsi_get_config(
>   	int ret;
>   	u32 major = 0, minor = 0;
>   
> +	cfg_hnd = device_get_match_data(dev);
> +	if (cfg_hnd)
> +		return cfg_hnd;
> +
>   	ahb_clk = msm_clk_get(msm_host->pdev, "iface");
>   	if (IS_ERR(ahb_clk)) {
>   		pr_err("%s: cannot get interface clock\n", __func__);


-- 
With best wishes
Dmitry
