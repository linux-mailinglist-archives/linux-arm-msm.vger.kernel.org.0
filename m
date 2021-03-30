Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39C4734DCC6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 02:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbhC3AEF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 20:04:05 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:40415 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230089AbhC3ADw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 20:03:52 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617062632; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=q/vwPUUGGKX2Gce1dd+LAqI10B98dw9Nic2zaw+7SS4=;
 b=Cq8Ix/hRb9kPdTNyFd/n+2C4bXv45P0uucVGde/xFSI80lA4F89/QESrAA3jTKliJ/PnL88A
 SrPAGGbRL7IdpFedA/y/2tsyDEtsLkc4vCbMIPxmIaB+D1ZBIJmu1khc9IuPK/PPCu3aurqg
 O/MInRAEpxLq8QgQGU68cBeCQ4g=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 60626ae187ce1fbb567802c8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Mar 2021 00:03:45
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6BDE0C433CA; Tue, 30 Mar 2021 00:03:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 03AA1C433C6;
        Tue, 30 Mar 2021 00:03:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 29 Mar 2021 17:03:42 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v3 16/25] drm/msm/dpu: simplify vco_delay
 handling in dsi_phy_28nm driver
In-Reply-To: <20210327110305.3289784-17-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
 <20210327110305.3289784-17-dmitry.baryshkov@linaro.org>
Message-ID: <e7f9bb4fe6f5830569627649b9e5fac8@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-27 04:02, Dmitry Baryshkov wrote:
> Instead of setting the variable and then using it just in the one 
> place,
> determine vco_delay directly at the PLL configuration time.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
The subject line should still be "drm/msm/dsi" and not "drm/msm/dpu".
Once thats fixed, please apply
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> index 3e9b7949b038..ed369eb18e9d 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> @@ -72,8 +72,6 @@ struct dsi_pll_28nm {
>  	struct platform_device *pdev;
>  	void __iomem *mmio;
> 
> -	int vco_delay;
> -
>  	struct pll_28nm_cached_state cached_state;
>  };
> 
> @@ -212,8 +210,10 @@ static int dsi_pll_28nm_clk_set_rate(struct
> clk_hw *hw, unsigned long rate,
>  	pll_write(base + REG_DSI_28nm_PHY_PLL_SDM_CFG4, 0x00);
> 
>  	/* Add hardware recommended delay for correct PLL configuration */
> -	if (pll_28nm->vco_delay)
> -		udelay(pll_28nm->vco_delay);
> +	if (pll->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
> +		udelay(1000);
> +	else
> +		udelay(1);
> 
>  	pll_write(base + REG_DSI_28nm_PHY_PLL_REFCLK_CFG, refclk_cfg);
>  	pll_write(base + REG_DSI_28nm_PHY_PLL_PWRGEN_CFG, 0x00);
> @@ -580,10 +580,6 @@ static int dsi_pll_28nm_init(struct msm_dsi_phy 
> *phy)
> 
>  	pll = &pll_28nm->base;
>  	pll->cfg = phy->cfg;
> -	if (phy->cfg->quirks & DSI_PHY_28NM_QUIRK_PHY_LP)
> -		pll_28nm->vco_delay = 1000;
> -	else
> -		pll_28nm->vco_delay = 1;
> 
>  	ret = pll_28nm_register(pll_28nm, phy->provided_clocks->hws);
>  	if (ret) {
