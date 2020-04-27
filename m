Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29DC71BAA92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2020 18:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbgD0Q7Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Apr 2020 12:59:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:36842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726030AbgD0Q7Z (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Apr 2020 12:59:25 -0400
Received: from localhost (unknown [171.76.79.70])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8EDD2206B9;
        Mon, 27 Apr 2020 16:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588006765;
        bh=/dqFyvgTMr7/GP4hysHTzeyCgcVIbSNQGjRnh7yYytk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ItM+qEI46/NGazMa3t/sxUsrW0dOpgOGRdxhfenznQYkIPv7iu2aMVvRdW77ExxDa
         k0ItWZ8tZ/4/wqYC1lzTh7JnEH5gWCvqao4usBSJGu1w6YjogIqoq4Fv4xpucK/WG8
         sQFfgIOn7svWAecOjefan+HfthYwCuzzh9QyAGuU=
Date:   Mon, 27 Apr 2020 22:29:19 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom-snps: Add runtime suspend and resume handlers
Message-ID: <20200427165919.GR56386@vkoul-mobl.Dlink>
References: <1587662818-4461-1-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587662818-4461-1-git-send-email-wcheng@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23-04-20, 10:26, Wesley Cheng wrote:

> +static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
> +{
> +	if (hsphy->suspended)
> +		return 0;
> +
> +	dev_dbg(&hsphy->phy->dev, "Suspend QCOM SNPS PHY, mode = %d \n", hsphy->mode);
> +
> +	if (hsphy->mode == PHY_MODE_USB_HOST) {
> +		/* Enable auto-resume to meet remote wakeup timing */
> +		qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_CTRL2,
> +										USB2_AUTO_RESUME, USB2_AUTO_RESUME);
> +		usleep_range(500, 1000);
> +		qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_CTRL2,
> +										0, USB2_AUTO_RESUME);

Kernel has a coding guideline where we try to "stick" to 80 char limit
and is sometimes okay like debug logs. Above is not okay. Please fix it
and run ./scripts/checkpatch.pl --strict on your patch and fix all
errors. Warning and checks at your discretion using common sense. When
in doubt do ask :)

> +	}
> +
> +	clk_disable_unprepare(hsphy->cfg_ahb_clk);
> +	hsphy->suspended = true;

why do you need to track this?

> +
> +	return 0;
> +}
> +
> +static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
> +{
> +	int ret = 0;

superfluous init..

>  static int qcom_snps_hsphy_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -251,6 +333,14 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);

would it not make sense to enable this after pjy in initialized?

-- 
~Vinod
