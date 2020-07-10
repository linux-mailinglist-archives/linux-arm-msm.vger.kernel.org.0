Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFCDF21AC2D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 02:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgGJAwg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 20:52:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgGJAwg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 20:52:36 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3759AC08C5CE
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 17:52:36 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id g67so1733954pgc.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 17:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8yPHrCXyBLOpR6zGRIWiDtKHwiJWpvvhg1ayG2n9fc8=;
        b=BFP8tF2HhYiKA/qyJjHegpvIsVSUuEje6azN5GY0R3L8WUoBLc3wHtzR+46I4fEuPk
         XfiUAO8rReB0liW6wBmI3p2UY8xt/niNaytXTXJB+c3gWeaM5uKjATHL5zaongbYrilm
         Ztasc8EgPA+Q1kqS5vkNpKLsqai7o8NQCrLkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8yPHrCXyBLOpR6zGRIWiDtKHwiJWpvvhg1ayG2n9fc8=;
        b=R1uRvXtf/i1WOewJtmFXhAmG4SGIq6FYqm87kXt9ofWiF1icdmbqmiQezY6REfM8XC
         Gyc+fiMfkKgnarcJojdwxP0jrExPllsaDEE7H+FJKzjafBC/GqgyWVST6JlhdZILvQBm
         nbTa/81wfg7Aj8qINMXClw+P9nPgnDe/Mi49y8Vhayc1JfQgwdtEdEHLiM5GpuZhX0Fi
         07KpwvypDCR95aOhTYGbZOhJFcgKt3LC+G2sGSZoqbBADR363balzvhcMKx1nTuzX+39
         J90+E06CfBnlKCwOBUpe/S8HLfZRUpgbnzfSUHa9zgj/+RoGMWDViwIKW1ggFoEzoUDi
         F7RA==
X-Gm-Message-State: AOAM533fENabN0Tw80Kxn4Vy6S3HmPqqbqDQ8vgsy2XtGCe2AAGYSMq/
        dcusBeUBlnjSUtoQx66Xx7T8z4qgyiM=
X-Google-Smtp-Source: ABdhPJwcYWeG5bs4YVaoD0/XoNI2VB/2PQjL7qAGKEGMFaiXaUld/StQmsEVPMcCxV9DXDcYFi7yBw==
X-Received: by 2002:a62:1716:: with SMTP id 22mr56845258pfx.99.1594342355674;
        Thu, 09 Jul 2020 17:52:35 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id v28sm3992962pgn.81.2020.07.09.17.52.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 17:52:34 -0700 (PDT)
Date:   Thu, 9 Jul 2020 17:52:33 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH V1] mmc: sdhci-msm: Set IO pins in low power state during
 suspend
Message-ID: <20200710005233.GN3191083@google.com>
References: <1594213888-2780-1-git-send-email-vbadigan@codeaurora.org>
 <1594213888-2780-2-git-send-email-vbadigan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1594213888-2780-2-git-send-email-vbadigan@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Jul 08, 2020 at 06:41:20PM +0530, Veerabhadrarao Badiganti wrote:
> Configure SDHC IO pins with low power configuration when the driver
> is in suspend state.
> 
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> ---
>  drivers/mmc/host/sdhci-msm.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 392d41d57a6e..efd2bae1430c 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -15,6 +15,7 @@
>  #include <linux/iopoll.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/interconnect.h>
> +#include <linux/pinctrl/consumer.h>
>  
>  #include "sdhci-pltfm.h"
>  #include "cqhci.h"
> @@ -1352,6 +1353,19 @@ static void sdhci_msm_set_uhs_signaling(struct sdhci_host *host,
>  		sdhci_msm_hs400(host, &mmc->ios);
>  }
>  
> +static int sdhci_msm_set_pincfg(struct sdhci_msm_host *msm_host, bool level)
> +{
> +	struct platform_device *pdev = msm_host->pdev;
> +	int ret;
> +
> +	if (level)
> +		ret = pinctrl_pm_select_default_state(&pdev->dev);
> +	else
> +		ret = pinctrl_pm_select_sleep_state(&pdev->dev);
> +
> +	return ret;
> +}
> +
>  static int sdhci_msm_set_vmmc(struct mmc_host *mmc)
>  {
>  	if (IS_ERR(mmc->supply.vmmc))
> @@ -1596,6 +1610,9 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
>  			ret = sdhci_msm_set_vqmmc(msm_host, mmc,
>  					pwr_state & REQ_BUS_ON);
>  		if (!ret)
> +			ret = sdhci_msm_set_pincfg(msm_host,
> +					pwr_state & REQ_BUS_ON);
> +		if (!ret)
>  			irq_ack |= CORE_PWRCTL_BUS_SUCCESS;
>  		else
>  			irq_ack |= CORE_PWRCTL_BUS_FAIL;

I happened to have a debug patch in my tree which logs when regulators
are enabled/disabled, with this patch I see the SD card regulator
toggling constantly after returning from the first system suspend.

I added more logs:

[ 1156.085819] DBG: sdhci_msm_set_pincfg: level = 0 (ret: 0)
[ 1156.248936] DBG: sdhci_msm_set_pincfg: level = 1 (ret: 0)
[ 1156.301989] DBG: sdhci_msm_set_pincfg: level = 0 (ret: 0)
[ 1156.462383] DBG: sdhci_msm_set_pincfg: level = 1 (ret: 0)
[ 1156.525988] DBG: sdhci_msm_set_pincfg: level = 0 (ret: 0)
[ 1156.670372] DBG: sdhci_msm_set_pincfg: level = 1 (ret: 0)
[ 1156.717935] DBG: sdhci_msm_set_pincfg: level = 0 (ret: 0)
[ 1156.878122] DBG: sdhci_msm_set_pincfg: level = 1 (ret: 0)
[ 1156.928134] DBG: sdhci_msm_set_pincfg: level = 0 (ret: 0)

This is on an SC7180 platform. It doesn't run an upstream kernel though,
but v5.4 with plenty of upstream patches.
