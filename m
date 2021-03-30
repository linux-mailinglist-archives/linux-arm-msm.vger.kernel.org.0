Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1D9D34DCB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 02:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230339AbhC3ABW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 20:01:22 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:59791 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230202AbhC3ABT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 20:01:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617062479; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=jVBSUgu+pFEDHXWSRsZb2UnG++J0IAwLqxbV86v1OcY=;
 b=XOlM+YZWJ+rv2MJVZHpEflu/suiU33Uy/638jcwbJK4GYhSR/Q6bPcsEdxlZpFOJ2GuNEcJ7
 zqzhVvGBlmgFjOYhEGlcHSieRyP259Xl8b3T/1rUzd9KNqIz9h7jn/xe1LJZGjUywVaL+PnG
 WN71KOf3FkyMW22OyxvvO9NHDOU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60626a4ac39407c3279c8a8a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Mar 2021 00:01:14
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A62BFC43468; Tue, 30 Mar 2021 00:01:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8FFACC433ED;
        Tue, 30 Mar 2021 00:01:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 29 Mar 2021 17:01:11 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v3 15/25] drm/msm/dsi: drop vco_delay setting
 from 7nm, 10nm, 14nm drivers
In-Reply-To: <20210327110305.3289784-16-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
 <20210327110305.3289784-16-dmitry.baryshkov@linaro.org>
Message-ID: <d09bbd7d79f8d99fc906e22be56d8d0f@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-27 04:02, Dmitry Baryshkov wrote:
> These drivers do not use vco_delay variable, so drop it from all of
> them.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 3 ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 4 ----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c  | 3 ---
>  3 files changed, 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index e0df12a841b2..bfb96d87d1d7 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -99,7 +99,6 @@ struct dsi_pll_10nm {
>  	/* protects REG_DSI_10nm_PHY_CMN_CLK_CFG0 register */
>  	spinlock_t postdiv_lock;
> 
> -	int vco_delay;
>  	struct dsi_pll_config pll_configuration;
>  	struct dsi_pll_regs reg_setup;
> 
> @@ -771,8 +770,6 @@ static int dsi_pll_10nm_init(struct msm_dsi_phy 
> *phy)
>  	pll = &pll_10nm->base;
>  	pll->cfg = phy->cfg;
> 
> -	pll_10nm->vco_delay = 1;
> -
>  	ret = pll_10nm_register(pll_10nm, phy->provided_clocks->hws);
>  	if (ret) {
>  		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 7fe7c8348b42..434d02ffa7fe 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -122,8 +122,6 @@ struct dsi_pll_14nm {
>  	void __iomem *phy_cmn_mmio;
>  	void __iomem *mmio;
> 
> -	int vco_delay;
> -
>  	struct dsi_pll_input in;
>  	struct dsi_pll_output out;
> 
> @@ -1012,8 +1010,6 @@ static int dsi_pll_14nm_init(struct msm_dsi_phy 
> *phy)
>  	pll = &pll_14nm->base;
>  	pll->cfg = phy->cfg;
> 
> -	pll_14nm->vco_delay = 1;
> -
>  	ret = pll_14nm_register(pll_14nm, phy->provided_clocks->hws);
>  	if (ret) {
>  		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index e6c8040e1bd3..f760904efac9 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -99,7 +99,6 @@ struct dsi_pll_7nm {
>  	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG0 register */
>  	spinlock_t postdiv_lock;
> 
> -	int vco_delay;
>  	struct dsi_pll_config pll_configuration;
>  	struct dsi_pll_regs reg_setup;
> 
> @@ -796,8 +795,6 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy 
> *phy)
>  	pll = &pll_7nm->base;
>  	pll->cfg = phy->cfg;
> 
> -	pll_7nm->vco_delay = 1;
> -
>  	ret = pll_7nm_register(pll_7nm, phy->provided_clocks->hws);
>  	if (ret) {
>  		DRM_DEV_ERROR(&pdev->dev, "failed to register PLL: %d\n", ret);
