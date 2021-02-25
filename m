Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98F89324B3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 08:30:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233860AbhBYH3K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 02:29:10 -0500
Received: from z11.mailgun.us ([104.130.96.11]:29044 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233266AbhBYH3H (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 02:29:07 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614238122; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=rweQPpVnh7qp98De6bJw+H/FQNc1D6OQQm8bGdcfHy8=;
 b=mbstEoqB5SM5A6jrJgjnfs9GXLexdj6t1k35UbvwUk50iVnfYsGHA6rMgWT2fGob53tcVueL
 gDU4preiL4elka3gv1nuL4pdFsaB8PFlQ8kFC2DqeKXcNbSbRDS3CCazr08CwFT+EAG1WXTH
 hobrv/H6gdqQl2O++arVCU1c53c=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 603751a7095efe1816c01aa0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Feb 2021 07:28:39
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8EE41C433ED; Thu, 25 Feb 2021 07:28:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DFB27C433CA;
        Thu, 25 Feb 2021 07:28:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 24 Feb 2021 23:28:37 -0800
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dsi_pll_7nm: Solve TODO for multiplier frac_bits
 assignment
In-Reply-To: <20210224230143.1216118-1-dmitry.baryshkov@linaro.org>
References: <20210224230143.1216118-1-dmitry.baryshkov@linaro.org>
Message-ID: <74ec836c951c2eec2d978ba75ac8a7d7@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry

Thanks for the patch.

On 2021-02-24 15:01, Dmitry Baryshkov wrote:
> The number of fractional registers bits is known and already set in
> the frac_bits variable of the dsi_pll_config struct here in 7nm:
> remove the TODO by simply using that variable. This is a copy of
> 196145eb1af1 ("drm/msm/dsi_pll_10nm: Solve TODO for multiplier 
> frac_bits
> assignment").
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> index c1f6708367ae..0458eda15114 100644
> --- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> @@ -509,6 +509,7 @@ static unsigned long
> dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
>  {
>  	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
>  	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
> +	struct dsi_pll_config *config = &pll_7nm->pll_configuration;
>  	void __iomem *base = pll_7nm->mmio;
>  	u64 ref_clk = pll_7nm->vco_ref_clk_rate;
>  	u64 vco_rate = 0x0;
> @@ -529,9 +530,8 @@ static unsigned long
> dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
>  	/*
>  	 * TODO:
>  	 *	1. Assumes prescaler is disabled
> -	 *	2. Multiplier is 2^18. it should be 2^(num_of_frac_bits)
>  	 */
> -	multiplier = 1 << 18;
> +	multiplier = 1 << config->frac_bits;
>  	pll_freq = dec * (ref_clk * 2);
>  	tmp64 = (ref_clk * 2 * frac);
>  	pll_freq += div_u64(tmp64, multiplier);
