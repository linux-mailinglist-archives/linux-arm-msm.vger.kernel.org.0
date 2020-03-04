Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A58FF1791E4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2020 15:03:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727543AbgCDODv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Mar 2020 09:03:51 -0500
Received: from mga02.intel.com ([134.134.136.20]:46935 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725795AbgCDODv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Mar 2020 09:03:51 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Mar 2020 06:03:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,514,1574150400"; 
   d="scan'208";a="274677392"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.167]) ([10.237.72.167])
  by fmsmga002.fm.intel.com with ESMTP; 04 Mar 2020 06:03:40 -0800
Subject: Re: [PATCH V2] mmc: cqhci: Update cqhci memory ioresource name
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        ulf.hansson@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dianders@google.com,
        mka@chromium.org, Ritesh Harjani <riteshh@codeaurora.org>,
        Asutosh Das <asutoshd@codeaurora.org>
References: <1583323250-23596-1-git-send-email-vbadigan@codeaurora.org>
 <1583328320-9981-1-git-send-email-vbadigan@codeaurora.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <8584d9b7-a3bc-eb18-79c3-8796a07cd460@intel.com>
Date:   Wed, 4 Mar 2020 16:02:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1583328320-9981-1-git-send-email-vbadigan@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/03/20 3:25 pm, Veerabhadrarao Badiganti wrote:
> Update cqhci memory ioresource name from cqhci_mem to cqhci since
> suffix _mem is redundant.
> 
> Only sdhci-msm driver is making use of this resource as of now.
> No other vendor's driver is using it. So this update shouldn't affect
> any other vendor's cqhci functionality.
> 
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
> Corresponding binding change:
> https://lore.kernel.org/linux-arm-msm/1582545470-11530-1-git-send-email-vbadigan@codeaurora.org/
> 
> Changes sicne V1:
> 	- Updated commit text expalining this change affects *only*
> 	  qcom cqhci functionality.
> 
> ---
>  drivers/mmc/host/cqhci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/cqhci.c b/drivers/mmc/host/cqhci.c
> index e2ea2c4..e24b8ff 100644
> --- a/drivers/mmc/host/cqhci.c
> +++ b/drivers/mmc/host/cqhci.c
> @@ -1077,7 +1077,7 @@ struct cqhci_host *cqhci_pltfm_init(struct platform_device *pdev)
>  
>  	/* check and setup CMDQ interface */
>  	cqhci_memres = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> -						   "cqhci_mem");
> +						   "cqhci");
>  	if (!cqhci_memres) {
>  		dev_dbg(&pdev->dev, "CMDQ not supported\n");
>  		return ERR_PTR(-EINVAL);
> 

