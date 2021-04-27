Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38E6836CBAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Apr 2021 21:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235719AbhD0Ta7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Apr 2021 15:30:59 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:44567 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235661AbhD0Ta7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Apr 2021 15:30:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619551815; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=4NRfExpJ8kID4r71hp3WbLS78R3BpUa+03CEb54sMuQ=;
 b=uNPWHm+wCjH9rK/5v/ZfChIJlsWkkNINFHtYYQ5LXYDzWl+FZ4m7g2PxSBKe0lbj9OIYMhW8
 Lc039Sab9CQKuzXeuTw1Cr+9LJXh8JJ2y7Rvu2KIvQGj/1VEdAdBefdRZsal3fJQgcee3+s/
 T3iyEGBLKHD2k/vJqM8J+xP65rU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 608866352cc44d3aeabb9961 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Apr 2021 19:29:57
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E1C7EC433F1; Tue, 27 Apr 2021 19:29:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 72605C433D3;
        Tue, 27 Apr 2021 19:29:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 27 Apr 2021 12:29:53 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH v2 3/4] drm/msm: get rid of msm_iomap_size
In-Reply-To: <20210427001828.2375555-4-dmitry.baryshkov@linaro.org>
References: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
 <20210427001828.2375555-4-dmitry.baryshkov@linaro.org>
Message-ID: <f4a6a51ea5cc5bfbf747eb5544951076@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry

On 2021-04-26 17:18, Dmitry Baryshkov wrote:
> Instead of looping throught the resources each time to get the DSI CTRL
> area size, get it at the ioremap time.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
We will have to call into the individual modules anyway everytime we
take a snapshot as only they have access to the required clocks and the 
base address.

So even though there is nothing wrong with this change, it still adds a 
size member
which can be avoided because we have to call into the module anyway.

Any strong preference to store the size as opposed to just getting it 
when we take
the snapshot?

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c |  5 +++--
>  drivers/gpu/drm/msm/msm_drv.c      | 27 +++++++++------------------
>  drivers/gpu/drm/msm/msm_drv.h      |  3 ++-
>  3 files changed, 14 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
> b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 1a63368c3912..b3ee5c0bce12 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -102,6 +102,7 @@ struct msm_dsi_host {
>  	int id;
> 
>  	void __iomem *ctrl_base;
> +	phys_addr_t ctrl_size;
>  	struct regulator_bulk_data supplies[DSI_DEV_REGULATOR_MAX];
> 
>  	struct clk *bus_clks[DSI_BUS_CLK_MAX];
> @@ -1839,7 +1840,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>  		goto fail;
>  	}
> 
> -	msm_host->ctrl_base = msm_ioremap(pdev, "dsi_ctrl", "DSI CTRL");
> +	msm_host->ctrl_base = msm_ioremap_size(pdev, "dsi_ctrl", "DSI CTRL",
> &msm_host->ctrl_size);
>  	if (IS_ERR(msm_host->ctrl_base)) {
>  		pr_err("%s: unable to map Dsi ctrl base\n", __func__);
>  		ret = PTR_ERR(msm_host->ctrl_base);
> @@ -2494,7 +2495,7 @@ void msm_dsi_host_snapshot(struct msm_disp_state
> *disp_state, struct mipi_dsi_ho
> 
>  	pm_runtime_get_sync(&msm_host->pdev->dev);
> 
> -	msm_disp_snapshot_add_block(disp_state,
> msm_iomap_size(msm_host->pdev, "dsi_ctrl"),
> +	msm_disp_snapshot_add_block(disp_state, msm_host->ctrl_size,
>  			msm_host->ctrl_base, "dsi%d_ctrl", msm_host->id);
> 
>  	pm_runtime_put_sync(&msm_host->pdev->dev);
> diff --git a/drivers/gpu/drm/msm/msm_drv.c 
> b/drivers/gpu/drm/msm/msm_drv.c
> index 92fe844b517b..be578fc4e54f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -124,7 +124,7 @@ struct clk *msm_clk_get(struct platform_device
> *pdev, const char *name)
>  }
> 
>  static void __iomem *_msm_ioremap(struct platform_device *pdev, const
> char *name,
> -				  const char *dbgname, bool quiet)
> +				  const char *dbgname, bool quiet, phys_addr_t *psize)
>  {
>  	struct resource *res;
>  	unsigned long size;
> @@ -153,37 +153,28 @@ static void __iomem *_msm_ioremap(struct
> platform_device *pdev, const char *name
>  	if (reglog)
>  		printk(KERN_DEBUG "IO:region %s %p %08lx\n", dbgname, ptr, size);
> 
> +	if (psize)
> +		*psize = size;
> +
>  	return ptr;
>  }
> 
>  void __iomem *msm_ioremap(struct platform_device *pdev, const char 
> *name,
>  			  const char *dbgname)
>  {
> -	return _msm_ioremap(pdev, name, dbgname, false);
> +	return _msm_ioremap(pdev, name, dbgname, false, NULL);
>  }
> 
>  void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const 
> char *name,
>  				const char *dbgname)
>  {
> -	return _msm_ioremap(pdev, name, dbgname, true);
> +	return _msm_ioremap(pdev, name, dbgname, true, NULL);
>  }
> 
> -unsigned long msm_iomap_size(struct platform_device *pdev, const char 
> *name)
> +void __iomem *msm_ioremap_size(struct platform_device *pdev, const 
> char *name,
> +			  const char *dbgname, phys_addr_t *psize)
>  {
> -	struct resource *res;
> -
> -	if (name)
> -		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
> -	else
> -		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -
> -	if (!res) {
> -		dev_dbg(&pdev->dev, "failed to get memory resource: %s\n",
> -				name);
> -		return 0;
> -	}
> -
> -	return resource_size(res);
> +	return _msm_ioremap(pdev, name, dbgname, false, psize);
>  }
> 
>  void msm_writel(u32 data, void __iomem *addr)
> diff --git a/drivers/gpu/drm/msm/msm_drv.h 
> b/drivers/gpu/drm/msm/msm_drv.h
> index 15cb34451ded..c33fc1293789 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -450,9 +450,10 @@ struct clk *msm_clk_bulk_get_clock(struct
> clk_bulk_data *bulk, int count,
>  	const char *name);
>  void __iomem *msm_ioremap(struct platform_device *pdev, const char 
> *name,
>  		const char *dbgname);
> +void __iomem *msm_ioremap_size(struct platform_device *pdev, const 
> char *name,
> +		const char *dbgname, phys_addr_t *size);
>  void __iomem *msm_ioremap_quiet(struct platform_device *pdev, const 
> char *name,
>  		const char *dbgname);
> -unsigned long msm_iomap_size(struct platform_device *pdev, const char 
> *name);
>  void msm_writel(u32 data, void __iomem *addr);
>  u32 msm_readl(const void __iomem *addr);
>  void msm_rmw(void __iomem *addr, u32 mask, u32 or);
