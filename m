Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C48B34DC97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 01:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbhC2Xnp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 19:43:45 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:41268 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230224AbhC2Xnf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 19:43:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617061415; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=WgW6syh6j6COpNAJzyDzrYgUluof8RVQTmMEBMQ1CDk=;
 b=Mz/gfTxn4b8t5rmTlpbYeO7N3dYGaiL65TxT8XTenxBxAxR1uMZspaGoK5cC36aR+eJrsgmi
 SXASCvdai04Y3xvDMa4ekkYuFNJ6U1kVEJXvRrkDQCCalKiG5PLQ7m+WHZ/L1FwRu2FnYO7T
 v13u5fbbdvSyP1Tw3n0X7Jn9H8w=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6062661d876af85fc40b1b00 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 29 Mar 2021 23:43:25
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 29FEBC43468; Mon, 29 Mar 2021 23:43:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 27440C433ED;
        Mon, 29 Mar 2021 23:43:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 29 Mar 2021 16:43:24 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v3 13/25] drm/msm/dsi: use
 devm_of_clk_add_hw_provider
In-Reply-To: <20210327110305.3289784-14-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
 <20210327110305.3289784-14-dmitry.baryshkov@linaro.org>
Message-ID: <efeb7fefb8e025ec26bb227680942c76@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-27 04:02, Dmitry Baryshkov wrote:
> Use devm_of_clk_add_hw_provider() to register provided clocks. This
> allows dropping the remove function alltogether.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 22 +---------------------
>  1 file changed, 1 insertion(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index df3b91b0ea88..46561435a27d 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -728,7 +728,7 @@ static int dsi_phy_driver_probe(struct
> platform_device *pdev)
>  		}
>  	}
> 
> -	ret = of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
>  				     phy->provided_clocks);
>  	if (ret) {
>  		DRM_DEV_ERROR(dev, "%s: failed to register clk provider: %d\n",
> __func__, ret);
> @@ -742,31 +742,11 @@ static int dsi_phy_driver_probe(struct
> platform_device *pdev)
>  	return 0;
> 
>  fail:
> -	if (phy->pll) {
> -		of_clk_del_provider(dev->of_node);
> -		phy->pll = NULL;
> -	}
> -
>  	return ret;
>  }
> 
> -static int dsi_phy_driver_remove(struct platform_device *pdev)
> -{
> -	struct msm_dsi_phy *phy = platform_get_drvdata(pdev);
> -
> -	if (phy && phy->pll) {
> -		of_clk_del_provider(pdev->dev.of_node);
> -		phy->pll = NULL;
> -	}
> -
> -	platform_set_drvdata(pdev, NULL);
> -
> -	return 0;
> -}
> -
>  static struct platform_driver dsi_phy_platform_driver = {
>  	.probe      = dsi_phy_driver_probe,
> -	.remove     = dsi_phy_driver_remove,
>  	.driver     = {
>  		.name   = "msm_dsi_phy",
>  		.of_match_table = dsi_phy_dt_match,
