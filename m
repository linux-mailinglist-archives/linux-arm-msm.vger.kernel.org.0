Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF1F2364EA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Apr 2021 01:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232046AbhDSXeZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Apr 2021 19:34:25 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:57214 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232027AbhDSXeZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Apr 2021 19:34:25 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618875235; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ZWzCdC+z5UyZhszG/8Haa1EIaXLOwOdaGyCo2LbFCaw=;
 b=BToPZmG69zai8AMMpApFy8fwa8D6aUuwwq2FVa3OdHpwr/e/A7Ho+RnvYDNT/OANz1+STV3B
 Pz9tOIHAPicxCGR9yf2ehUx0LQAXmjVaYbKXTg6RWrpkX+iVQmBFgiU567GGtI2pBWLCOF9r
 zTyoxLIZIS2pv+t4HBVxbcLOx3o=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 607e135287ce1fbb565948d1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 19 Apr 2021 23:33:38
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 680B2C433D3; Mon, 19 Apr 2021 23:33:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BD889C433F1;
        Mon, 19 Apr 2021 23:33:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 19 Apr 2021 16:33:34 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dsi: fix msm_dsi_phy_get_clk_provider return code
In-Reply-To: <20210412000158.2049066-1-dmitry.baryshkov@linaro.org>
References: <20210412000158.2049066-1-dmitry.baryshkov@linaro.org>
Message-ID: <7ff8d6af018650a313842fa0470a5d5b@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-04-11 17:01, Dmitry Baryshkov wrote:
> msm_dsi_phy_get_clk_provider() always returns two provided clocks, so
> return 0 instead of returning incorrect -EINVAL error code.
> 
> Fixes: 5d13459650b3 ("drm/msm/dsi: push provided clocks handling into
> a generic code")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index f0a2ddf96a4b..ff7f2ec42030 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -843,7 +843,7 @@ int msm_dsi_phy_get_clk_provider(struct msm_dsi_phy 
> *phy,
>  	if (pixel_clk_provider)
>  		*pixel_clk_provider = 
> phy->provided_clocks->hws[DSI_PIXEL_PLL_CLK]->clk;
> 
> -	return -EINVAL;
> +	return 0;
>  }
> 
>  void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy)
