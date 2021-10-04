Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD8C9421236
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 17:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbhJDPEF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 11:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbhJDPEE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 11:04:04 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06ECEC061745
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 08:02:16 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id x33-20020a9d37a4000000b0054733a85462so21841345otb.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 08:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/bjDCcvTHvbvBJgcvfiRDgtgwl+8vRY/EcD+Q1PT0rs=;
        b=qgbyGyH6IyjJbKwkbgwPdiFZWCcLfnpuc16ZmQGKAd0SCGs7zdVgPvb/4J8ujuPtCl
         /TMFPCwX0W3ZmgEDl4UWyMH84BxlFu/cdb5vV8OaaZkwJoXVWeApdDrgOXy6Ctl+AClv
         pGCtagUHXwklVcIG1PM8m/UQIkrQkIWyFhzpxq2VmxCPa6g0guwLgpCkWqLHy30/S4WR
         DGnILvw3w/aGOdHkuzZkbAHCdm13y84E7BPnmx/tIqDmH1LCNINdb2keG1s+F5o+kT5o
         rLJilhS0Ip3WaBbDUHPuLe19sWEpobnhMk45HmQ17vHUgbWNVqFAcpQvqzAIBN4sB19E
         W/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/bjDCcvTHvbvBJgcvfiRDgtgwl+8vRY/EcD+Q1PT0rs=;
        b=Ykg/85GP5Qi7pucZMxbMNBtYp1Dr6TUXW65KCZCQ8mNATp3w9rvXfrShghVNeudCSU
         k6CPeK1D/bIAkONLbRhkSLi0Fu/ZQYMe8eBfiycU5iWhmlmioz+SFXmbyWgW6WHkxBGL
         FG2gpfknvPPPhBeroXcADexAoUyrtiioWchjSrGW+SpdGYiXVMK6YyfQOE3d1lTHQP9b
         lz5eoRq/3ol6JSTx52kK0cNcRezJX9Rs5Xm6t5TucRD3PrbWvj2P63fWDZISWQATA1lI
         Ie52ceNdEG69w0qeSc58hrp0QMBtwfhbdVx20ZJtgGPJpKibShoVui40hEp+TMqYdw0D
         M1RQ==
X-Gm-Message-State: AOAM531PBcXQDwjG4PamcuV5moVnmyEEkYlRaNHVdLeKunBHA3JY8xWt
        hQFH4oWD/3d3M2PYyo8upWNTSw==
X-Google-Smtp-Source: ABdhPJyQQsdi5zrmfjewpNBPycv7XN/kw5bb9s/2mMYBDDpKBioS+q0jDEt6s3sESvBwYpIE304gTA==
X-Received: by 2002:a9d:7307:: with SMTP id e7mr10027934otk.35.1633359735198;
        Mon, 04 Oct 2021 08:02:15 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id v1sm2909827otj.70.2021.10.04.08.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 08:02:14 -0700 (PDT)
Date:   Mon, 4 Oct 2021 08:03:58 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dsi: use bulk clk API
Message-ID: <YVsX3v6TpqhITB1f@ripper>
References: <20211002012715.691406-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211002012715.691406-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 01 Oct 18:27 PDT 2021, Dmitry Baryshkov wrote:

> Use clk_bulk_* API instead of hand-coding them. Note, this drops support
> for legacy clk naming (e.g. "iface_clk" instead of just "iface"),
> however all in-kernel device trees were converted long long ago. The
> warning is present there since 2017.
> 

Nice!

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 59 ++++++------------------------
>  1 file changed, 12 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index e269df285136..3b81f40bba2e 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -106,7 +106,8 @@ struct msm_dsi_host {
>  	phys_addr_t ctrl_size;
>  	struct regulator_bulk_data supplies[DSI_DEV_REGULATOR_MAX];
>  
> -	struct clk *bus_clks[DSI_BUS_CLK_MAX];
> +	int num_bus_clks;
> +	struct clk_bulk_data bus_clks[DSI_BUS_CLK_MAX];
>  
>  	struct clk *byte_clk;
>  	struct clk *esc_clk;
> @@ -374,15 +375,14 @@ static int dsi_clk_init(struct msm_dsi_host *msm_host)
>  	int i, ret = 0;
>  
>  	/* get bus clocks */
> -	for (i = 0; i < cfg->num_bus_clks; i++) {
> -		msm_host->bus_clks[i] = msm_clk_get(pdev,
> -						cfg->bus_clk_names[i]);
> -		if (IS_ERR(msm_host->bus_clks[i])) {
> -			ret = PTR_ERR(msm_host->bus_clks[i]);
> -			pr_err("%s: Unable to get %s clock, ret = %d\n",
> -				__func__, cfg->bus_clk_names[i], ret);
> -			goto exit;
> -		}
> +	for (i = 0; i < cfg->num_bus_clks; i++)
> +		msm_host->bus_clks[i].id = cfg->bus_clk_names[i];
> +	msm_host->num_bus_clks = cfg->num_bus_clks;
> +
> +	ret = devm_clk_bulk_get(&pdev->dev, msm_host->num_bus_clks, msm_host->bus_clks);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Unable to get clocks, ret = %d\n", ret);
> +		goto exit;
>  	}
>  
>  	/* get link and source clocks */
> @@ -433,41 +433,6 @@ static int dsi_clk_init(struct msm_dsi_host *msm_host)
>  	return ret;
>  }
>  
> -static int dsi_bus_clk_enable(struct msm_dsi_host *msm_host)
> -{
> -	const struct msm_dsi_config *cfg = msm_host->cfg_hnd->cfg;
> -	int i, ret;
> -
> -	DBG("id=%d", msm_host->id);
> -
> -	for (i = 0; i < cfg->num_bus_clks; i++) {
> -		ret = clk_prepare_enable(msm_host->bus_clks[i]);
> -		if (ret) {
> -			pr_err("%s: failed to enable bus clock %d ret %d\n",
> -				__func__, i, ret);
> -			goto err;
> -		}
> -	}
> -
> -	return 0;
> -err:
> -	for (; i > 0; i--)
> -		clk_disable_unprepare(msm_host->bus_clks[i]);
> -
> -	return ret;
> -}
> -
> -static void dsi_bus_clk_disable(struct msm_dsi_host *msm_host)
> -{
> -	const struct msm_dsi_config *cfg = msm_host->cfg_hnd->cfg;
> -	int i;
> -
> -	DBG("");
> -
> -	for (i = cfg->num_bus_clks - 1; i >= 0; i--)
> -		clk_disable_unprepare(msm_host->bus_clks[i]);
> -}
> -
>  int msm_dsi_runtime_suspend(struct device *dev)
>  {
>  	struct platform_device *pdev = to_platform_device(dev);
> @@ -478,7 +443,7 @@ int msm_dsi_runtime_suspend(struct device *dev)
>  	if (!msm_host->cfg_hnd)
>  		return 0;
>  
> -	dsi_bus_clk_disable(msm_host);
> +	clk_bulk_disable_unprepare(msm_host->num_bus_clks, msm_host->bus_clks);
>  
>  	return 0;
>  }
> @@ -493,7 +458,7 @@ int msm_dsi_runtime_resume(struct device *dev)
>  	if (!msm_host->cfg_hnd)
>  		return 0;
>  
> -	return dsi_bus_clk_enable(msm_host);
> +	return clk_bulk_prepare_enable(msm_host->num_bus_clks, msm_host->bus_clks);
>  }
>  
>  int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
> -- 
> 2.33.0
> 
