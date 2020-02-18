Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 678FB16231D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 10:13:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgBRJNX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 04:13:23 -0500
Received: from mga06.intel.com ([134.134.136.31]:19293 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726225AbgBRJNX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 04:13:23 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Feb 2020 01:13:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,456,1574150400"; 
   d="scan'208";a="314996167"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.167]) ([10.237.72.167])
  by orsmga001.jf.intel.com with ESMTP; 18 Feb 2020 01:13:17 -0800
Subject: Re: [PATCH V3] mmc: sdhci-msm: Update system suspend/resume callbacks
 of sdhci-msm platform driver
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>, ulf.hansson@linaro.org,
        robh+dt@kernel.org, mka@chromium.org
Cc:     asutoshd@codeaurora.org, swboyd@google.com,
        stummala@codeaurora.org, sayalil@codeaurora.org,
        cang@codeaurora.org, vbadigan@codeaurora.org,
        rampraka@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org
References: <1581492673-27295-1-git-send-email-sbhanu@codeaurora.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <e4424388-2c6c-7736-da45-7b3b20b9ebbd@intel.com>
Date:   Tue, 18 Feb 2020 11:12:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1581492673-27295-1-git-send-email-sbhanu@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/02/20 9:31 am, Shaik Sajida Bhanu wrote:
> The existing suspend/resume callbacks of sdhci-msm driver are just
> gating/un-gating the clocks. During suspend cycle more can be done
> like disabling controller, disabling card detection, enabling wake-up events.
> 
> So updating the system pm callbacks for performing these extra
> actions besides controlling the clocks.
> 
> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
> 
> Changes since V2:
>     Removed disabling/enabling pwr-irq from system pm ops.
> 
> Changes since V1:
>     Invoking pm_runtime_force_suspend/resume instead of
>     sdhci_msm_runtime_suepend/resume.
> ---
>  drivers/mmc/host/sdhci-msm.c | 41 +++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index c3a160c..fcff3e8 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2159,9 +2159,46 @@ static __maybe_unused int sdhci_msm_runtime_resume(struct device *dev)
>  	return 0;
>  }
>  
> +static int sdhci_msm_suspend(struct device *dev)
> +{
> +	struct sdhci_host *host = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (host->mmc->caps2 & MMC_CAP2_CQE) {
> +		ret = cqhci_suspend(host->mmc);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = sdhci_suspend_host(host);
> +	if (ret)
> +		return ret;

		goto resume_cqhci;

> +
> +	return pm_runtime_force_suspend(dev);

Ideally there should be an error path e.g.

	ret = pm_runtime_force_suspend(dev);
	if (!ret)
		return ret;

	sdhci_resume_host()
resume_cqhci:
	cqhci_resume()
	return ret;

> +}
> +
> +static int sdhci_msm_resume(struct device *dev)
> +{
> +	struct sdhci_host *host = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = pm_runtime_force_resume(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = sdhci_resume_host(host);
> +	if (ret < 0)
> +		return ret;
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

