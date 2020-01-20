Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C94C0142AD8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2020 13:30:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727580AbgATMa4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jan 2020 07:30:56 -0500
Received: from mga17.intel.com ([192.55.52.151]:8457 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726626AbgATMaz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jan 2020 07:30:55 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Jan 2020 04:30:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,342,1574150400"; 
   d="scan'208";a="399361289"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.167]) ([10.237.72.167])
  by orsmga005.jf.intel.com with ESMTP; 20 Jan 2020 04:30:51 -0800
Subject: Re: [PATCH V2 1/2] mmc: sdhci: Let a vendor driver supply and update
 ADMA descriptor size
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        ulf.hansson@linaro.org
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        sayalil@codeaurora.org, cang@codeaurora.org,
        rampraka@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <1579194192-7942-2-git-send-email-vbadigan@codeaurora.org>
 <1579519045-26467-1-git-send-email-vbadigan@codeaurora.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <9cb3dd40-0edd-6e71-bc31-c4bb4a7282c9@intel.com>
Date:   Mon, 20 Jan 2020 14:29:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1579519045-26467-1-git-send-email-vbadigan@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/01/20 1:17 pm, Veerabhadrarao Badiganti wrote:
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

A couple of minor tweaks below sorry.

> 
> Suggested-by: Adrian Hunter <adrian.hunter@intel.com>
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> ---
>  drivers/mmc/host/sdhci.c | 13 +++++++------
>  drivers/mmc/host/sdhci.h |  3 ++-
>  2 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index 3140fe2..44fb446 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -3822,14 +3822,15 @@ int sdhci_setup_host(struct sdhci_host *host)
>  		void *buf;
>  
>  		if (host->flags & SDHCI_USE_64_BIT_DMA) {
> -			host->adma_table_sz = host->adma_table_cnt *
> -					      SDHCI_ADMA2_64_DESC_SZ(host);
> -			host->desc_sz = SDHCI_ADMA2_64_DESC_SZ(host);
> +			if (!host->alloc_desc_sz)
> +				host->alloc_desc_sz =
> +					SDHCI_ADMA2_64_DESC_SZ(host);
>  		} else {
> -			host->adma_table_sz = host->adma_table_cnt *
> -					      SDHCI_ADMA2_32_DESC_SZ;
> -			host->desc_sz = SDHCI_ADMA2_32_DESC_SZ;
> +			host->alloc_desc_sz = SDHCI_ADMA2_32_DESC_SZ;
>  		}

The following is simpler:

		if (!(host->flags & SDHCI_USE_64_BIT_DMA))
			host->alloc_desc_sz = SDHCI_ADMA2_32_DESC_SZ;
		else if (!host->alloc_desc_sz)
			host->alloc_desc_sz = SDHCI_ADMA2_64_DESC_SZ(host);

> +		host->desc_sz = host->alloc_desc_sz;
> +		host->adma_table_sz = host->adma_table_cnt *
> +					      host->desc_sz;

Wrap is not needed

>  
>  		host->align_buffer_sz = SDHCI_MAX_SEGS * SDHCI_ADMA2_ALIGN;
>  		/*
> diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
> index 0ed3e0e..10bda3a 100644
> --- a/drivers/mmc/host/sdhci.h
> +++ b/drivers/mmc/host/sdhci.h
> @@ -554,7 +554,8 @@ struct sdhci_host {
>  	dma_addr_t adma_addr;	/* Mapped ADMA descr. table */
>  	dma_addr_t align_addr;	/* Mapped bounce buffer */
>  
> -	unsigned int desc_sz;	/* ADMA descriptor size */
> +	unsigned int desc_sz;	/* ADMA current descriptor size */
> +	unsigned int alloc_desc_sz;	/* ADMA descr. max size host supports */
>  
>  	struct workqueue_struct *complete_wq;	/* Request completion wq */
>  	struct work_struct	complete_work;	/* Request completion work */
> 

