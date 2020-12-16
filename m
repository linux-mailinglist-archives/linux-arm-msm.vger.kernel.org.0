Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60A952DC691
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Dec 2020 19:34:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730413AbgLPSd6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Dec 2020 13:33:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727931AbgLPSd6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Dec 2020 13:33:58 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 074E7C0617A7
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Dec 2020 10:33:18 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id d203so7439724oia.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Dec 2020 10:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+cTCsx1PRpNw0/y5L+7memM86sfqPOprZgZnF6YfJtQ=;
        b=UWBpb3riqV+q72tyfHr+ASdJQJL7f3veiDnR+vg6OCnHigq3SNSwbJSG2B0I+z+qRV
         DexmZ5JwOzCqz8RVjLaSUOfI4uag7FfOBMLwObWS5kRBvORUPjqmjiSf3YSaRVL7TnIp
         FUGD6mc4oif2+ZxZnhr5RU+YuEoJdmWYU85pJCunRSuB/1EZ44cNZcw0+CYczBFN6rS5
         yuphpGHAmOUiUGh8wVNKYlyAYN9H7WsGEn+TNISCgB5s+/1RP0YfZrRes7VhBZHzzmkH
         fklgEUAGiqUNIGl+YWEtL0wO1WZK0zZ5RD0cT3qfC/7B6k9KzR8zt00MJqOJLuRPHa/J
         tPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+cTCsx1PRpNw0/y5L+7memM86sfqPOprZgZnF6YfJtQ=;
        b=YiRDV3zdYIzc8DVaqgFv7h3QHx5sDVSYAA4J7TKWgn5ct+yPdya6WdD37B/Xhe/V/n
         btlaxzlFc6BFLefvjjly08NRkGfjgEz3JCnWvlivbj2TyqSBlGB0xJES5Wna8yVqUIVv
         yUWhsBpymH9T4WZyITxM8sisiKl+Ob8dIsN1kGCGF/hNaZnJAOp6OOnhsNC3R3xzjcii
         gCXzPqRlBjS2VaiDtHlEwdIFU/8Gs7BBWK5ecc534mLCKCEvzVakKWwLm9YLlfW2L4E6
         YKshq3qKepFz2HcJFxSBzYwD9mYTuFVzX2dBmKmTajPthWCgfHxWrbYsdg2QG5QR3oS9
         yObg==
X-Gm-Message-State: AOAM532IcA/s5oZpXA+q0QrlP9RUN78niSmu3p1z7HNBa/OJTAimiRyQ
        oxjsmJixDVJYtz3zNtgT5WgCSQ==
X-Google-Smtp-Source: ABdhPJyxRrQh9eyAVb6narksTmtqA3k1ONdweCWNi6MZOkBslhdu3MC0n4a4YCOdUOlpeJ4Hi1IaKg==
X-Received: by 2002:aca:568f:: with SMTP id k137mr2732141oib.138.1608143597429;
        Wed, 16 Dec 2020 10:33:17 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g200sm571303oib.19.2020.12.16.10.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 10:33:16 -0800 (PST)
Date:   Wed, 16 Dec 2020 12:33:14 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     agross@kernel.org, srinivas.kandagatla@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] nvmem: convert comma to semicolon
Message-ID: <X9pS6kzKSWA5VxOK@builder.lan>
References: <20201216132810.15688-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201216132810.15688-1-zhengyongjun3@huawei.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 16 Dec 07:28 CST 2020, Zheng Yongjun wrote:

> Replace a comma between expression statements by a semicolon.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/nvmem/qcom-spmi-sdam.c | 2 +-
>  drivers/nvmem/snvs_lpgpr.c     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvmem/qcom-spmi-sdam.c b/drivers/nvmem/qcom-spmi-sdam.c
> index a72704cd0468..b73783a04e22 100644
> --- a/drivers/nvmem/qcom-spmi-sdam.c
> +++ b/drivers/nvmem/qcom-spmi-sdam.c
> @@ -142,7 +142,7 @@ static int sdam_probe(struct platform_device *pdev)
>  	sdam->sdam_config.dev = &pdev->dev;
>  	sdam->sdam_config.name = "spmi_sdam";
>  	sdam->sdam_config.id = NVMEM_DEVID_AUTO;
> -	sdam->sdam_config.owner = THIS_MODULE,
> +	sdam->sdam_config.owner = THIS_MODULE;
>  	sdam->sdam_config.stride = 1;
>  	sdam->sdam_config.word_size = 1;
>  	sdam->sdam_config.reg_read = sdam_read;
> diff --git a/drivers/nvmem/snvs_lpgpr.c b/drivers/nvmem/snvs_lpgpr.c
> index c527d26ca6ac..4692aa985bd6 100644
> --- a/drivers/nvmem/snvs_lpgpr.c
> +++ b/drivers/nvmem/snvs_lpgpr.c
> @@ -123,7 +123,7 @@ static int snvs_lpgpr_probe(struct platform_device *pdev)
>  	cfg->dev = dev;
>  	cfg->stride = 4;
>  	cfg->word_size = 4;
> -	cfg->size = dcfg->size,
> +	cfg->size = dcfg->size;
>  	cfg->owner = THIS_MODULE;
>  	cfg->reg_read  = snvs_lpgpr_read;
>  	cfg->reg_write = snvs_lpgpr_write;
> -- 
> 2.22.0
> 
