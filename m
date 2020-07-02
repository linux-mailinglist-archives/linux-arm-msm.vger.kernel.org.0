Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 251D8211C1E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2020 08:46:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgGBGqT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jul 2020 02:46:19 -0400
Received: from mga18.intel.com ([134.134.136.126]:64717 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726092AbgGBGqS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jul 2020 02:46:18 -0400
IronPort-SDR: Cb9BMgJWDCxoZiSicbWmhLJThl8Styr8d9RIdTMfD7heOIZKBllFc2WYuL2wSWQd286Koi+JHd
 N99Dvmt96kBA==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="134265999"
X-IronPort-AV: E=Sophos;i="5.75,303,1589266800"; 
   d="scan'208";a="134265999"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 23:46:18 -0700
IronPort-SDR: v7U+dvG0JerInWCo3R9hK9JqeJKTiDEU8gdKJDmp0r+41/s7CPIErJfxT/6Don/UqVvg9LbpOL
 tr5d0+Fe5I8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,303,1589266800"; 
   d="scan'208";a="425847449"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.73]) ([10.237.72.73])
  by orsmga004.jf.intel.com with ESMTP; 01 Jul 2020 23:46:16 -0700
Subject: Re: [PATCH -next] mmc: sdhci-msm: Make function
 sdhci_msm_dump_vendor_regs() static
To:     Wei Yongjun <weiyongjun1@huawei.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Sahitya Tummala <stummala@codeaurora.org>
Cc:     Hulk Robot <hulkci@huawei.com>, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20200702020347.77214-1-weiyongjun1@huawei.com>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <41e37733-c292-30dd-161c-745ffc1eac55@intel.com>
Date:   Thu, 2 Jul 2020 09:45:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200702020347.77214-1-weiyongjun1@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/07/20 5:03 am, Wei Yongjun wrote:
> From: Hulk Robot <hulkci@huawei.com>
> 
> Fix sparse build warning:
> 
> drivers/mmc/host/sdhci-msm.c:1888:6: warning:
>  symbol 'sdhci_msm_dump_vendor_regs' was not declared. Should it be static?
> 
> Signed-off-by: Hulk Robot <hulkci@huawei.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci-msm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 15c42b059240..66f755f94d2c 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1885,7 +1885,7 @@ static void sdhci_msm_reset(struct sdhci_host *host, u8 mask)
>  #define SDHCI_MSM_DUMP(f, x...) \
>  	pr_err("%s: " DRIVER_NAME ": " f, mmc_hostname(host->mmc), ## x)
>  
> -void sdhci_msm_dump_vendor_regs(struct sdhci_host *host)
> +static void sdhci_msm_dump_vendor_regs(struct sdhci_host *host)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>  	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> 

