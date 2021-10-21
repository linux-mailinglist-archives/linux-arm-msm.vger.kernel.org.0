Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECFB2436D3B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Oct 2021 00:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbhJUWLC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 18:11:02 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:16255 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230233AbhJUWLC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 18:11:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634854125; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=dCbsFaQy5fbSZvOhlEJxzzk8OkTpu48VEz1cEQ2GkkQ=;
 b=r6Q8IePN7QmyxXJ8vQUCr5O7e5Y1jT245EIKr5UOJHOQUKL+YRpEdWbqeHyRGGYUwezews05
 h+hjLDEhMimqtBJm/SBku7OgI+cyBRDOqg3pgVW4Hbh9LjYP7gOQ0/7W7tSTAsIth+3tg54d
 sJJOPCCbzQch0iI6RyXJ4Fi7zEU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6171e4ecfd91319f0f320e4e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 21 Oct 2021 22:08:44
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 151A2C43460; Thu, 21 Oct 2021 22:08:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F03E7C4338F;
        Thu, 21 Oct 2021 22:08:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 21 Oct 2021 15:08:41 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: use bulk clk API
In-Reply-To: <20211002012715.691406-1-dmitry.baryshkov@linaro.org>
References: <20211002012715.691406-1-dmitry.baryshkov@linaro.org>
Message-ID: <e567c8f2b3b60f95826e7775cbf82e67@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-10-01 18:27, Dmitry Baryshkov wrote:
> Use clk_bulk_* API instead of hand-coding them. Note, this drops 
> support
> for legacy clk naming (e.g. "iface_clk" instead of just "iface"),
> however all in-kernel device trees were converted long long ago. The
> warning is present there since 2017.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 59 ++++++------------------------
>  1 file changed, 12 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
> b/drivers/gpu/drm/msm/dsi/dsi_host.c
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
> @@ -374,15 +375,14 @@ static int dsi_clk_init(struct msm_dsi_host 
> *msm_host)
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
> +	ret = devm_clk_bulk_get(&pdev->dev, msm_host->num_bus_clks,
> msm_host->bus_clks);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Unable to get clocks, ret = %d\n", ret);
> +		goto exit;
>  	}
> 
>  	/* get link and source clocks */
> @@ -433,41 +433,6 @@ static int dsi_clk_init(struct msm_dsi_host 
> *msm_host)
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
> +	clk_bulk_disable_unprepare(msm_host->num_bus_clks, 
> msm_host->bus_clks);
> 
>  	return 0;
>  }
> @@ -493,7 +458,7 @@ int msm_dsi_runtime_resume(struct device *dev)
>  	if (!msm_host->cfg_hnd)
>  		return 0;
> 
> -	return dsi_bus_clk_enable(msm_host);
> +	return clk_bulk_prepare_enable(msm_host->num_bus_clks, 
> msm_host->bus_clks);
>  }
> 
>  int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
