Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34B35142664
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2020 09:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbgATI7K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jan 2020 03:59:10 -0500
Received: from mga02.intel.com ([134.134.136.20]:36396 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726988AbgATI7K (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jan 2020 03:59:10 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Jan 2020 00:59:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,341,1574150400"; 
   d="scan'208";a="258634448"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.167]) ([10.237.72.167])
  by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2020 00:59:06 -0800
Subject: Re: [PATCH V2 1/2] mmc: sdhci: Let a vendor driver supply and update
 ADMA descriptor size
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        ulf.hansson@linaro.org
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        sayalil@codeaurora.org, cang@codeaurora.org,
        rampraka@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <1579194192-7942-1-git-send-email-vbadigan@codeaurora.org>
 <1579194192-7942-2-git-send-email-vbadigan@codeaurora.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <aaffb145-69ab-af11-7470-e887b45583a9@intel.com>
Date:   Mon, 20 Jan 2020 10:58:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1579194192-7942-2-git-send-email-vbadigan@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/01/20 7:03 pm, Veerabhadrarao Badiganti wrote:
> Let a vendor driver supply the maximum descriptor size that it
> can operate on. ADMA descriptor table would be allocated using this
> supplied size.
> If any SD Host controller is of version prior to v4.10 spec
> but supports 16byte descriptor, this change allows them to supply
> correct descriptor size for ADMA table allocation.
> 
> Also let a vendor driver update the descriptor size by overriding
> sdhc_host->desc_size if it has to operates on a different descriptor
> sizes in different conditions.
> 
> Suggested-by: Adrian Hunter <adrian.hunter@intel.com>
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>

A couple of minor comments below but with those changes:

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci.c | 7 +++++--
>  drivers/mmc/host/sdhci.h | 1 +
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index 3140fe2..19a5ad3 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -3822,9 +3822,12 @@ int sdhci_setup_host(struct sdhci_host *host)
>  		void *buf;
>  
>  		if (host->flags & SDHCI_USE_64_BIT_DMA) {
> +			if (!host->alloc_desc_sz)
> +				host->alloc_desc_sz =
> +					SDHCI_ADMA2_64_DESC_SZ(host);
> +			host->desc_sz = host->alloc_desc_sz;
>  			host->adma_table_sz = host->adma_table_cnt *
> -					      SDHCI_ADMA2_64_DESC_SZ(host);
> -			host->desc_sz = SDHCI_ADMA2_64_DESC_SZ(host);
> +					      host->desc_sz;
>  		} else {
>  			host->adma_table_sz = host->adma_table_cnt *
>  					      SDHCI_ADMA2_32_DESC_SZ;

Please also initialize host->alloc_desc_sz for the 32-bit case here.

> diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
> index 0ed3e0e..8e7c77d 100644
> --- a/drivers/mmc/host/sdhci.h
> +++ b/drivers/mmc/host/sdhci.h
> @@ -555,6 +555,7 @@ struct sdhci_host {
>  	dma_addr_t align_addr;	/* Mapped bounce buffer */
>  
>  	unsigned int desc_sz;	/* ADMA descriptor size */

Please  amend the comment above to:
				/* ADMA current descriptor size */

> +	unsigned int alloc_desc_sz;	/* ADMA descr. max size host supports */
>  
>  	struct workqueue_struct *complete_wq;	/* Request completion wq */
>  	struct work_struct	complete_work;	/* Request completion work */
> 

