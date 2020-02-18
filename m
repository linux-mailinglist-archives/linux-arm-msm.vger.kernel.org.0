Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8DF51622D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 09:56:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbgBRI4V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 03:56:21 -0500
Received: from mga02.intel.com ([134.134.136.20]:63923 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726252AbgBRI4V (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 03:56:21 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Feb 2020 00:56:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,456,1574150400"; 
   d="scan'208";a="314991628"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.167]) ([10.237.72.167])
  by orsmga001.jf.intel.com with ESMTP; 18 Feb 2020 00:56:15 -0800
Subject: Re: [PATCH V1] mmc: mmc_test: Pass different sg lists for
 non-blocking requests
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        ulf.hansson@linaro.org
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        sayalil@codeaurora.org, cang@codeaurora.org,
        rampraka@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>
References: <1581413771-18005-1-git-send-email-vbadigan@codeaurora.org>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <8d632d78-2bf7-e207-92bf-93c792b3f7b0@intel.com>
Date:   Tue, 18 Feb 2020 10:55:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1581413771-18005-1-git-send-email-vbadigan@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/02/20 11:36 am, Veerabhadrarao Badiganti wrote:
> Supply a separate sg list for each of the request in non-blocking
> IO test cases where two requests will be issued at same time.
> 
> Otherwise, sg memory may get unmapped when a request is done while
> same memory is being accessed by controller from the other request,
> and it leads to iommu errors with below call stack:
> 
> 	__arm_lpae_unmap+0x2e0/0x478
> 	arm_lpae_unmap+0x54/0x70
> 	arm_smmu_unmap+0x64/0xa4
> 	__iommu_unmap+0xb8/0x1f0
> 	iommu_unmap_fast+0x38/0x48
> 	__iommu_dma_unmap+0x88/0x108
> 	iommu_dma_unmap_sg+0x90/0xa4
> 	sdhci_post_req+0x5c/0x78
> 	mmc_test_start_areq+0x10c/0x120 [mmc_test]
> 	mmc_test_area_io_seq+0x150/0x264 [mmc_test]
> 	mmc_test_rw_multiple+0x174/0x1c0 [mmc_test]
> 	mmc_test_rw_multiple_sg_len+0x44/0x6c [mmc_test]
> 	mmc_test_profile_sglen_wr_nonblock_perf+0x6c/0x94 [mmc_test]
> 	mtf_test_write+0x238/0x3cc [mmc_test]
> 
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> ---
>  drivers/mmc/core/mmc_test.c | 38 ++++++++++++++++++++++++++++++++------
>  1 file changed, 32 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mmc/core/mmc_test.c b/drivers/mmc/core/mmc_test.c
> index 492dd45..69bdf60 100644
> --- a/drivers/mmc/core/mmc_test.c
> +++ b/drivers/mmc/core/mmc_test.c
> @@ -71,6 +71,7 @@ struct mmc_test_mem {
>   * @sg_len: length of currently mapped scatterlist @sg
>   * @mem: allocated memory
>   * @sg: scatterlist
> + * @sg_areq: scatterlist for non blocking request
>   */
>  struct mmc_test_area {
>  	unsigned long max_sz;
> @@ -82,6 +83,7 @@ struct mmc_test_area {
>  	unsigned int sg_len;
>  	struct mmc_test_mem *mem;
>  	struct scatterlist *sg;
> +	struct scatterlist *sg_areq;
>  };
>  
>  /**
> @@ -836,7 +838,9 @@ static int mmc_test_start_areq(struct mmc_test_card *test,
>  }
>  
>  static int mmc_test_nonblock_transfer(struct mmc_test_card *test,
> -				      struct scatterlist *sg, unsigned sg_len,
> +				      struct scatterlist *sg,
> +				      struct scatterlist *sg_areq,
> +				      unsigned int sg_len,
>  				      unsigned dev_addr, unsigned blocks,
>  				      unsigned blksz, int write, int count)
>  {
> @@ -867,6 +871,7 @@ static int mmc_test_nonblock_transfer(struct mmc_test_card *test,
>  			prev_mrq = &rq2->mrq;
>  
>  		swap(mrq, prev_mrq);
> +		swap(sg, sg_areq);
>  		dev_addr += blocks;
>  	}
>  
> @@ -1396,7 +1401,7 @@ static int mmc_test_no_highmem(struct mmc_test_card *test)
>   * Map sz bytes so that it can be transferred.
>   */
>  static int mmc_test_area_map(struct mmc_test_card *test, unsigned long sz,
> -			     int max_scatter, int min_sg_len)
> +			     int max_scatter, int min_sg_len, bool nonblock)
>  {
>  	struct mmc_test_area *t = &test->area;
>  	int err;
> @@ -1411,6 +1416,20 @@ static int mmc_test_area_map(struct mmc_test_card *test, unsigned long sz,
>  		err = mmc_test_map_sg(t->mem, sz, t->sg, 1, t->max_segs,
>  				      t->max_seg_sz, &t->sg_len, min_sg_len);
>  	}
> +
> +	if (err || !nonblock)
> +		goto err;
> +
> +	if (max_scatter) {
> +		err = mmc_test_map_sg_max_scatter(t->mem, sz, t->sg_areq,
> +						  t->max_segs, t->max_seg_sz,
> +				       &t->sg_len);
> +	} else {
> +		err = mmc_test_map_sg(t->mem, sz, t->sg_areq, 1, t->max_segs,
> +				      t->max_seg_sz, &t->sg_len, min_sg_len);
> +	}

I suggest getting the length to a local and confirming it is the same

+	if (max_scatter) {
+		err = mmc_test_map_sg_max_scatter(t->mem, sz, t->sg_areq,
+						  t->max_segs, t->max_seg_sz,
+						  &sg_len);
+	} else {
+		err = mmc_test_map_sg(t->mem, sz, t->sg_areq, 1, t->max_segs,
+				      t->max_seg_sz, &sg_len, min_sg_len);
+	}
+	if (!err && sg_len != t->sg_len)
+		err = -EINVAL;

> +
> +err:
>  	if (err)
>  		pr_info("%s: Failed to map sg list\n",
>  		       mmc_hostname(test->card->host));
> @@ -1458,15 +1477,16 @@ static int mmc_test_area_io_seq(struct mmc_test_card *test, unsigned long sz,
>  			sz = max_tfr;
>  	}
>  
> -	ret = mmc_test_area_map(test, sz, max_scatter, min_sg_len);
> +	ret = mmc_test_area_map(test, sz, max_scatter, min_sg_len, nonblock);
>  	if (ret)
>  		return ret;
>  
>  	if (timed)
>  		ktime_get_ts64(&ts1);
>  	if (nonblock)
> -		ret = mmc_test_nonblock_transfer(test, t->sg, t->sg_len,
> -				 dev_addr, t->blocks, 512, write, count);
> +		ret = mmc_test_nonblock_transfer(test, t->sg, t->sg_areq,
> +				 t->sg_len, dev_addr, t->blocks, 512, write,
> +				 count);
>  	else
>  		for (i = 0; i < count && ret == 0; i++) {
>  			ret = mmc_test_area_transfer(test, dev_addr, write);
> @@ -1584,6 +1604,12 @@ static int mmc_test_area_init(struct mmc_test_card *test, int erase, int fill)
>  		goto out_free;
>  	}
>  
> +	t->sg_areq = kmalloc_array(t->max_segs, sizeof(*t->sg), GFP_KERNEL);

Needs to be freed in mmc_test_area_cleanup()

> +	if (!t->sg_areq) {
> +		ret = -ENOMEM;
> +		goto out_free;
> +	}
> +
>  	t->dev_addr = mmc_test_capacity(test->card) / 2;
>  	t->dev_addr -= t->dev_addr % (t->max_sz >> 9);
>  
> @@ -2468,7 +2494,7 @@ static int __mmc_test_cmds_during_tfr(struct mmc_test_card *test,
>  	if (!(test->card->host->caps & MMC_CAP_CMD_DURING_TFR))
>  		return RESULT_UNSUP_HOST;
>  
> -	ret = mmc_test_area_map(test, sz, 0, 0);
> +	ret = mmc_test_area_map(test, sz, 0, 0, use_areq);
>  	if (ret)
>  		return ret;
>  
> 

