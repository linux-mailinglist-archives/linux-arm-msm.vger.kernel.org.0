Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39A921ABD7B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 12:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504375AbgDPKDG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 06:03:06 -0400
Received: from mga03.intel.com ([134.134.136.65]:36884 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2504310AbgDPKDD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 06:03:03 -0400
IronPort-SDR: K5fii6x0a+Q+J/Cpn5rN+BIwiB3uuhBvprcLs2zaEoCfuhqLzcDt6j3r1v+U9B5PHkMQXYdS0c
 X25UkglEjZ3w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2020 03:03:02 -0700
IronPort-SDR: D/jtQe/ve3dW6BN9Lpt8Wr74vjlUp9HCDN8CnSWb6ufNQiwpup6kIF+zzmgt2ISB501s+hEHdi
 b3SwtvYaQC5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,390,1580803200"; 
   d="scan'208";a="363940282"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.87]) ([10.237.72.87])
  by fmsmga001.fm.intel.com with ESMTP; 16 Apr 2020 03:02:58 -0700
Subject: Re: [PATCH V1 1/4] mmc: sdhci-msm: Enable MMC_CAP_WAIT_WHILE_BUSY
 host capability
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        ulf.hansson@linaro.org
Cc:     bjorn.andersson@linaro.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>
References: <1586706808-27337-1-git-send-email-vbadigan@codeaurora.org>
 <1586706808-27337-2-git-send-email-vbadigan@codeaurora.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <dba669ef-fa43-a380-472e-a682862eb8f3@intel.com>
Date:   Thu, 16 Apr 2020 13:02:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1586706808-27337-2-git-send-email-vbadigan@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/04/20 6:53 pm, Veerabhadrarao Badiganti wrote:
> MSM sd host controller is capable of HW busy detection of device busy
> singaling over DAT0 line.

singaling -> signaling

> 
> So set MMC_CAP_WAIT_WHILE_BUSY capability for qcom sdhc.
> 
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci-msm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 09ff731..013dcea 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2087,6 +2087,8 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>  		goto clk_disable;
>  	}
>  
> +	msm_host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY;
> +
>  	pm_runtime_get_noresume(&pdev->dev);
>  	pm_runtime_set_active(&pdev->dev);
>  	pm_runtime_enable(&pdev->dev);
> 

