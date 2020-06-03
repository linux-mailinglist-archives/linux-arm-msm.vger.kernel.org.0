Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 332761ECF14
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2020 13:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725833AbgFCLw5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jun 2020 07:52:57 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:43413 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725855AbgFCLw4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jun 2020 07:52:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591185176; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=MnbKsVV2ZlEOXvNHx0ywcuIwpzxoe8YLhIo5hyVFXgA=;
 b=RFveqadglnwH28+oG5NBEmUwYYevijOpDVt0MfRiSa8Vjaj8D2WanmmKu7usK703pqqIqGQc
 VaTUxM5sIJKdY3AoWxcuBg2qNc20ZaKz8hMmRdYyoEgIGc8dR8zg5hR60RPTJ70+quaSIuyS
 CvJQo5Dh88JnGg5XzbQlJosZifo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-west-2.postgun.com with SMTP id
 5ed78f1709c3530d12a3ef5c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 03 Jun 2020 11:52:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CA11BC43395; Wed,  3 Jun 2020 11:52:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EF534C433CA;
        Wed,  3 Jun 2020 11:52:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 03 Jun 2020 17:22:54 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Pradeep P V K <ppvk@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, adrian.hunter@intel.com,
        robh+dt@kernel.org, ulf.hansson@linaro.org,
        vbadigan@codeaurora.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, mka@chromium.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mmc-owner@vger.kernel.org, rnayak@codeaurora.org,
        matthias@chromium.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH V1 1/2] mmc: sdhci-msm: Add interconnect bandwidth scaling
 support
In-Reply-To: <1591175376-2374-2-git-send-email-ppvk@codeaurora.org>
References: <1591175376-2374-1-git-send-email-ppvk@codeaurora.org>
 <1591175376-2374-2-git-send-email-ppvk@codeaurora.org>
Message-ID: <29826613b412e4f4db4289e292a1fe57@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Pradeep,
Thanks for the patch.

On 2020-06-03 14:39, Pradeep P V K wrote:
> Interconnect bandwidth scaling support is now added as a
> part of OPP [1]. So, make sure interconnect driver is ready
> before handling interconnect scaling.
> 
> This change is based on
> [1] [Patch v8] Introduce OPP bandwidth bindings
> (https://lkml.org/lkml/2020/5/12/493)
> 
> [2] [Patch v3] mmc: sdhci-msm: Fix error handling
> for dev_pm_opp_of_add_table()
> (https://lkml.org/lkml/2020/5/5/491)
> 
> Signed-off-by: Pradeep P V K <ppvk@codeaurora.org>
> ---
>  drivers/mmc/host/sdhci-msm.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c 
> b/drivers/mmc/host/sdhci-msm.c
> index b277dd7..bf95484 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -14,6 +14,7 @@
>  #include <linux/slab.h>
>  #include <linux/iopoll.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/interconnect.h>
> 
>  #include "sdhci-pltfm.h"
>  #include "cqhci.h"
> @@ -1999,6 +2000,7 @@ static int sdhci_msm_probe(struct platform_device 
> *pdev)
>  	struct sdhci_pltfm_host *pltfm_host;
>  	struct sdhci_msm_host *msm_host;
>  	struct clk *clk;
> +	struct icc_path *sdhc_path;
>  	int ret;
>  	u16 host_version, core_minor;
>  	u32 core_version, config;
> @@ -2070,6 +2072,20 @@ static int sdhci_msm_probe(struct 
> platform_device *pdev)
>  	}
>  	msm_host->bulk_clks[0].clk = clk;
> 
> +	/* Make sure that ICC driver is ready for interconnect bandwdith
> +	 * scaling before registering the device for OPP.
> +	 */
> +	sdhc_path = of_icc_get(&pdev->dev, NULL);
> +	ret = PTR_ERR_OR_ZERO(sdhc_path);
> +	if (ret) {
> +		if (ret == -EPROBE_DEFER)
> +			dev_info(&pdev->dev, "defer icc path: %d\n", ret);
> +		else
> +			dev_err(&pdev->dev, "failed to get icc path:%d\n", ret);
> +		goto bus_clk_disable;
> +	}
> +	icc_put(sdhc_path);

ret = dev_pm_opp_of_find_icc_paths(&pdev->dev, NULL);

since there are multiple paths
described in the bindings you
should use ^^ instead and you
can drop temporary path as well.

> +
>  	msm_host->opp_table = dev_pm_opp_set_clkname(&pdev->dev, "core");
>  	if (IS_ERR(msm_host->opp_table)) {
>  		ret = PTR_ERR(msm_host->opp_table);

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
