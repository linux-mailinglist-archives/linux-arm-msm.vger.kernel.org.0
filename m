Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F686144C70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2020 08:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbgAVHXo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 02:23:44 -0500
Received: from mga14.intel.com ([192.55.52.115]:18401 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725884AbgAVHXo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 02:23:44 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Jan 2020 23:23:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,348,1574150400"; 
   d="scan'208";a="399924578"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.167]) ([10.237.72.167])
  by orsmga005.jf.intel.com with ESMTP; 21 Jan 2020 23:23:39 -0800
Subject: Re: [PATCH V1] mmc: sdhci-msm: Add system suspend/resume callbacks
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>, ulf.hansson@linaro.org
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        vbadigan@codeaurora.org, sayalil@codeaurora.org,
        cang@codeaurora.org, rampraka@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org
References: <1579617022-13031-1-git-send-email-sbhanu@codeaurora.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <c851e723-3e6c-4548-bb67-05a6023b4169@intel.com>
Date:   Wed, 22 Jan 2020 09:22:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1579617022-13031-1-git-send-email-sbhanu@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/01/20 4:30 pm, Shaik Sajida Bhanu wrote:
> Add system suspend/resume callbacks to sdhci-msm platform driver.

There were already callbacks, so the commit subject and messages really do
not tell what this change is about or why it is needed.  Please explain some
more.

> 
> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
> ---
>  drivers/mmc/host/sdhci-msm.c | 47 ++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 45 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 71f29ba..4984857 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2028,9 +2028,52 @@ static __maybe_unused int sdhci_msm_runtime_resume(struct device *dev)
>  	return 0;
>  }
>  
> +static int sdhci_msm_suspend(struct device *dev)
> +{
> +	struct sdhci_host *host = dev_get_drvdata(dev);
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +	int ret = 0;
> +
> +	if (host->mmc->caps2 & MMC_CAP2_CQE) {
> +		ret = cqhci_suspend(host->mmc);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	disable_irq(msm_host->pwr_irq);
> +	ret = sdhci_suspend_host(host);
> +	if (ret)
> +		return ret;
> +
> +	return sdhci_msm_runtime_suspend(dev);
> +}
> +
> +static int sdhci_msm_resume(struct device *dev)
> +{
> +	struct sdhci_host *host = dev_get_drvdata(dev);
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +	int ret = 0;
> +
> +	ret = sdhci_msm_runtime_resume(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = sdhci_resume_host(host);
> +	if (ret < 0)
> +		return ret;
> +	enable_irq(msm_host->pwr_irq);
> +
> +	if (host->mmc->caps2 & MMC_CAP2_CQE)
> +		ret = cqhci_resume(host->mmc);
> +
> +	return ret;
> +}
> +
>  static const struct dev_pm_ops sdhci_msm_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -				pm_runtime_force_resume)
> +	SET_SYSTEM_SLEEP_PM_OPS(sdhci_msm_suspend,
> +				sdhci_msm_resume)
>  	SET_RUNTIME_PM_OPS(sdhci_msm_runtime_suspend,
>  			   sdhci_msm_runtime_resume,
>  			   NULL)
> 

