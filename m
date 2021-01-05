Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF2B2EAD83
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 15:43:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727912AbhAEOky (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 09:40:54 -0500
Received: from mga18.intel.com ([134.134.136.126]:62478 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726076AbhAEOky (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 09:40:54 -0500
IronPort-SDR: Gj7OrIdug6cxk3lHQMx8sgC6FkUpkjlQyp9F+EGZMwCuX2ZHCelc2X8p3nCfqSTXxQcAGUO/yN
 ubRVF9P3fVBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9854"; a="164815713"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; 
   d="scan'208";a="164815713"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2021 06:40:13 -0800
IronPort-SDR: Kn8QwbefPJ5XPqoFYBUW0nTKHtZc67lODwp+8nmVmRmipfxboBe8IfmOHqRUN2MzAbi1yMv67Z
 w9tVX5gP9Fvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; 
   d="scan'208";a="421794901"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.94]) ([10.237.72.94])
  by orsmga001.jf.intel.com with ESMTP; 05 Jan 2021 06:40:11 -0800
Subject: Re: [PATCH] mmc: sdhci-msm: Fix possible NULL pointer exception
To:     Md Sadre Alam <mdalam@codeaurora.org>, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     sricharan@codeaurora.org
References: <1608626913-16675-1-git-send-email-mdalam@codeaurora.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <a6210bb5-6f12-20a3-b404-f21081685b46@intel.com>
Date:   Tue, 5 Jan 2021 16:39:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1608626913-16675-1-git-send-email-mdalam@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/12/20 10:48 am, Md Sadre Alam wrote:
> of_device_get_match_data returns NULL when no match.
> So add the NULL pointer check to avoid dereference.
> 
> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
> ---
>  drivers/mmc/host/sdhci-msm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 9c7927b..f20e424 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2235,6 +2235,8 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>  	 * the data associated with the version info.
>  	 */
>  	var_info = of_device_get_match_data(&pdev->dev);
> +	if (!var_info)

Shouldn't you set ret to -ENODEV here?

> +		goto pltfm_free;
>  
>  	msm_host->mci_removed = var_info->mci_removed;
>  	msm_host->restore_dll_config = var_info->restore_dll_config;
> 

