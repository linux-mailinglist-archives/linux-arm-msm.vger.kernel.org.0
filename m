Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 870913E2C8C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 16:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239050AbhHFObE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Aug 2021 10:31:04 -0400
Received: from mga09.intel.com ([134.134.136.24]:45358 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232085AbhHFObE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Aug 2021 10:31:04 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10068"; a="214362063"
X-IronPort-AV: E=Sophos;i="5.84,300,1620716400"; 
   d="scan'208";a="214362063"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2021 07:30:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,300,1620716400"; 
   d="scan'208";a="504039118"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.174]) ([10.237.72.174])
  by fmsmga004.fm.intel.com with ESMTP; 06 Aug 2021 07:30:40 -0700
Subject: Re: [PATCH V3 2/2] mmc: sdhci-msm: Use maximum possible data timeout
 value
To:     Sarthak Garg <sartgarg@codeaurora.org>, ulf.hansson@linaro.org
Cc:     vbadigan@codeaurora.org, stummala@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <1627534001-17256-2-git-send-email-sartgarg@codeaurora.org>
 <1628232901-30897-1-git-send-email-sartgarg@codeaurora.org>
 <1628232901-30897-3-git-send-email-sartgarg@codeaurora.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <22347b1a-1e58-5e08-03a0-5688d6c34cee@intel.com>
Date:   Fri, 6 Aug 2021 17:31:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1628232901-30897-3-git-send-email-sartgarg@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/08/21 9:55 am, Sarthak Garg wrote:
> From: Sahitya Tummala <stummala@codeaurora.org>
> 
> The Qcom SD controller defines the usage of 0xF in data
> timeout counter register (0x2E) which is actually a reserved
> bit as per specification. This would result in maximum of 21.26 secs
> timeout value.
> 
> Some SDcard taking more time than 2.67secs (timeout value corresponding
> to 0xE) and with that observed data timeout errors.
> So increasing the timeout value to max possible timeout.
> 
> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> Signed-off-by: Sarthak Garg <sartgarg@codeaurora.org>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci-msm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index e44b7a6..19e4673 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2696,6 +2696,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>  
>  	msm_host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_NEED_RSP_BUSY;
>  
> +	/* Set the timeout value to max possible */
> +	host->max_timeout_count = 0xF;
> +
>  	pm_runtime_get_noresume(&pdev->dev);
>  	pm_runtime_set_active(&pdev->dev);
>  	pm_runtime_enable(&pdev->dev);
> 

