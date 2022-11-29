Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96C0E63C3D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 16:35:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234892AbiK2Pfm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Nov 2022 10:35:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbiK2Pfl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Nov 2022 10:35:41 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A68940465;
        Tue, 29 Nov 2022 07:35:37 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 93A3CB8169F;
        Tue, 29 Nov 2022 15:35:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60B1AC433C1;
        Tue, 29 Nov 2022 15:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669736135;
        bh=mr3lXxgSCC088X1RmqdVsd+T302ohU53xonXenXS/R4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Nc++r+fa5ao4HyDV2m1NPie3v0DnsHqYxPzeoicSb+/qcTvbbDuuXwKVwOBS5FMe6
         ge4QEIZzaCK2ij4fdoNO8EIkCfaw0f6/tWNmzqgB1Yjvaz+N5k8dLQTjh16VgCBX7p
         oPeprEZTqf/p3QMe2Lu0QS0nfFPMY8o4tsEoqKDCwMzat2kqEoE4bdZTmn1HwxpBlF
         13e9k7Pi/TBgd1EOqgwjS3NiQ2+lNnS0ois8ky2kmi1lNx8N5QBsLwzQ1Y3+83QkQe
         VmWZ1GAIAlAmaVXemwMXbXROq+TLP2r3biMXD98ZlplmwvFkAipP6jr8ElbBNokW3q
         VHjPpBB0lV5ew==
Date:   Tue, 29 Nov 2022 21:05:19 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Asutosh Das <quic_asutoshd@quicinc.com>
Cc:     quic_cang@quicinc.com, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org, quic_nguyenb@quicinc.com,
        quic_xiaosenh@quicinc.com, stanley.chu@mediatek.com,
        eddie.huang@mediatek.com, daejun7.park@samsung.com,
        bvanassche@acm.org, avri.altman@wdc.com, beanhuo@micron.com,
        linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Arthur Simchaev <Arthur.Simchaev@wdc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Jinyoung Choi <j-young.choi@samsung.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 08/16] ufs: core: mcq: Allocate memory for mcq mode
Message-ID: <20221129153519.GH4931@workstation>
References: <cover.1669684648.git.quic_asutoshd@quicinc.com>
 <2616d76835732286e6d59d087f5dc1332a249964.1669684648.git.quic_asutoshd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2616d76835732286e6d59d087f5dc1332a249964.1669684648.git.quic_asutoshd@quicinc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 28, 2022 at 05:20:49PM -0800, Asutosh Das wrote:
> To read the bqueuedepth, the device descriptor is fetched
> in Single Doorbell Mode. This allocated memory may not be
> enough for MCQ mode because the number of tags supported
> in MCQ mode may be larger than in SDB mode.
> Hence, release the memory allocated in SDB mode and allocate
> memory for MCQ mode operation.
> Define the ufs hardware queue and Completion Queue Entry.
> 
> Co-developed-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Asutosh Das <quic_asutoshd@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
>  drivers/ufs/core/ufs-mcq.c     | 59 ++++++++++++++++++++++++++++++++++++++++--
>  drivers/ufs/core/ufshcd-priv.h |  1 +
>  drivers/ufs/core/ufshcd.c      | 48 +++++++++++++++++++++++++++++++---
>  include/ufs/ufshcd.h           | 20 ++++++++++++++
>  include/ufs/ufshci.h           | 22 ++++++++++++++++
>  5 files changed, 145 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
> index 6f66bd7..5496c62 100644
> --- a/drivers/ufs/core/ufs-mcq.c
> +++ b/drivers/ufs/core/ufs-mcq.c
> @@ -149,15 +149,70 @@ static int ufshcd_mcq_config_nr_queues(struct ufs_hba *hba)
>  	return 0;
>  }
>  
> +int ufshcd_mcq_memory_alloc(struct ufs_hba *hba)
> +{
> +	struct ufs_hw_queue *hwq;
> +	size_t utrdl_size, cqe_size;
> +	int i;
> +
> +	for (i = 0; i < hba->nr_hw_queues; i++) {
> +		hwq = &hba->uhq[i];
> +
> +		utrdl_size = sizeof(struct utp_transfer_req_desc) *
> +			     hwq->max_entries;
> +		hwq->sqe_base_addr = dmam_alloc_coherent(hba->dev, utrdl_size,
> +							 &hwq->sqe_dma_addr,
> +							 GFP_KERNEL);
> +		if (!hwq->sqe_dma_addr) {
> +			dev_err(hba->dev, "SQE allocation failed\n");
> +			return -ENOMEM;
> +		}
> +
> +		cqe_size = sizeof(struct cq_entry) * hwq->max_entries;
> +		hwq->cqe_base_addr = dmam_alloc_coherent(hba->dev, cqe_size,
> +							 &hwq->cqe_dma_addr,
> +							 GFP_KERNEL);
> +		if (!hwq->cqe_dma_addr) {
> +			dev_err(hba->dev, "CQE allocation failed\n");
> +			return -ENOMEM;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +
>  int ufshcd_mcq_init(struct ufs_hba *hba)
>  {
> -	int ret;
> +	struct ufs_hw_queue *hwq;
> +	int ret, i;
>  
>  	ret = ufshcd_mcq_config_nr_queues(hba);
>  	if (ret)
>  		return ret;
>  
>  	ret = ufshcd_vops_mcq_config_resource(hba);
> -	return ret;
> +	if (ret)
> +		return ret;
> +
> +	hba->uhq = devm_kzalloc(hba->dev,
> +				hba->nr_hw_queues * sizeof(struct ufs_hw_queue),
> +				GFP_KERNEL);
> +	if (!hba->uhq) {
> +		dev_err(hba->dev, "ufs hw queue memory allocation failed\n");
> +		return -ENOMEM;
> +	}
> +
> +	for (i = 0; i < hba->nr_hw_queues; i++) {
> +		hwq = &hba->uhq[i];
> +		hwq->max_entries = hba->nutrs;
> +	}
> +
> +	/* The very first HW queue serves device commands */
> +	hba->dev_cmd_queue = &hba->uhq[0];
> +	/* Give dev_cmd_queue the minimal number of entries */
> +	hba->dev_cmd_queue->max_entries = MAX_DEV_CMD_ENTRIES;
> +
> +	return 0;
>  }
>  
> diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
> index da974a9..4146d27 100644
> --- a/drivers/ufs/core/ufshcd-priv.h
> +++ b/drivers/ufs/core/ufshcd-priv.h
> @@ -63,6 +63,7 @@ int ufshcd_query_flag(struct ufs_hba *hba, enum query_opcode opcode,
>  void ufshcd_auto_hibern8_update(struct ufs_hba *hba, u32 ahit);
>  int ufshcd_mcq_init(struct ufs_hba *hba);
>  int ufshcd_mcq_decide_queue_depth(struct ufs_hba *hba);
> +int ufshcd_mcq_memory_alloc(struct ufs_hba *hba);
>  
>  #define SD_ASCII_STD true
>  #define SD_RAW false
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index e17159a..7e931aa 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -3740,6 +3740,14 @@ static int ufshcd_memory_alloc(struct ufs_hba *hba)
>  	}
>  
>  	/*
> +	 * Skip utmrdl allocation; it may have been
> +	 * allocated during first pass and not released during
> +	 * MCQ memory allocation.
> +	 * See ufshcd_release_sdb_queue() and ufshcd_config_mcq()
> +	 */
> +	if (hba->utmrdl_base_addr)
> +		goto skip_utmrdl;
> +	/*
>  	 * Allocate memory for UTP Task Management descriptors
>  	 * UFSHCI requires 1024 byte alignment of UTMRD
>  	 */
> @@ -3755,6 +3763,7 @@ static int ufshcd_memory_alloc(struct ufs_hba *hba)
>  		goto out;
>  	}
>  
> +skip_utmrdl:
>  	/* Allocate memory for local reference block */
>  	hba->lrb = devm_kcalloc(hba->dev,
>  				hba->nutrs, sizeof(struct ufshcd_lrb),
> @@ -8221,6 +8230,22 @@ static int ufshcd_add_lus(struct ufs_hba *hba)
>  	return ret;
>  }
>  
> +/* SDB - Single Doorbell */
> +static void ufshcd_release_sdb_queue(struct ufs_hba *hba, int nutrs)
> +{
> +	size_t ucdl_size, utrdl_size;
> +
> +	ucdl_size = sizeof(struct utp_transfer_cmd_desc) * nutrs;
> +	dmam_free_coherent(hba->dev, ucdl_size, hba->ucdl_base_addr,
> +			   hba->ucdl_dma_addr);
> +
> +	utrdl_size = sizeof(struct utp_transfer_req_desc) * nutrs;
> +	dmam_free_coherent(hba->dev, utrdl_size, hba->utrdl_base_addr,
> +			   hba->utrdl_dma_addr);
> +
> +	devm_kfree(hba->dev, hba->lrb);
> +}
> +
>  static int ufshcd_alloc_mcq(struct ufs_hba *hba)
>  {
>  	int ret;
> @@ -8232,12 +8257,29 @@ static int ufshcd_alloc_mcq(struct ufs_hba *hba)
>  
>  	hba->nutrs = ret;
>  	ret = ufshcd_mcq_init(hba);
> -	if (ret) {
> -		hba->nutrs = old_nutrs;
> -		return ret;
> +	if (ret)
> +		goto err;
> +
> +	/*
> +	 * Previously allocated memory for nutrs may not be enough in MCQ mode.
> +	 * Number of supported tags in MCQ mode may be larger than SDB mode.
> +	 */
> +	if (hba->nutrs != old_nutrs) {
> +		ufshcd_release_sdb_queue(hba, old_nutrs);
> +		ret = ufshcd_memory_alloc(hba);
> +		if (ret)
> +			goto err;
> +		ufshcd_host_memory_configure(hba);
>  	}
>  
> +	ret = ufshcd_mcq_memory_alloc(hba);
> +	if (ret)
> +		goto err;
> +
>  	return 0;
> +err:
> +	hba->nutrs = old_nutrs;
> +	return ret;
>  }
>  
>  /**
> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
> index 9d7829a..90461f43 100644
> --- a/include/ufs/ufshcd.h
> +++ b/include/ufs/ufshcd.h
> @@ -865,6 +865,8 @@ enum ufshcd_res {
>   * @mcq_sup: is mcq supported by UFSHC
>   * @res: array of resource info of MCQ registers
>   * @mcq_base: Multi circular queue registers base address
> + * @uhq: array of supported hardware queues
> + * @dev_cmd_queue: Queue for issuing device management commands
>   */
>  struct ufs_hba {
>  	void __iomem *mmio_base;
> @@ -1020,6 +1022,24 @@ struct ufs_hba {
>  	bool mcq_sup;
>  	struct ufshcd_res_info res[RES_MAX];
>  	void __iomem *mcq_base;
> +	struct ufs_hw_queue *uhq;
> +	struct ufs_hw_queue *dev_cmd_queue;
> +};
> +
> +/**
> + * struct ufs_hw_queue - per hardware queue structure
> + * @sqe_base_addr: submission queue entry base address
> + * @sqe_dma_addr: submission queue dma address
> + * @cqe_base_addr: completion queue base address
> + * @cqe_dma_addr: completion queue dma address
> + * @max_entries: max number of slots in this hardware queue
> + */
> +struct ufs_hw_queue {
> +	void *sqe_base_addr;
> +	dma_addr_t sqe_dma_addr;
> +	struct cq_entry *cqe_base_addr;
> +	dma_addr_t cqe_dma_addr;
> +	u32 max_entries;
>  };
>  
>  /* Returns true if clocks can be gated. Otherwise false */
> diff --git a/include/ufs/ufshci.h b/include/ufs/ufshci.h
> index 67fcebd..15d1ea2 100644
> --- a/include/ufs/ufshci.h
> +++ b/include/ufs/ufshci.h
> @@ -486,6 +486,28 @@ struct utp_transfer_req_desc {
>  	__le16  prd_table_offset;
>  };
>  
> +/* MCQ Completion Queue Entry */
> +struct cq_entry {
> +	/* DW 0-1 */
> +	__le64 command_desc_base_addr;
> +
> +	/* DW 2 */
> +	__le16  response_upiu_length;
> +	__le16  response_upiu_offset;
> +
> +	/* DW 3 */
> +	__le16  prd_table_length;
> +	__le16  prd_table_offset;
> +
> +	/* DW 4 */
> +	__le32 status;
> +
> +	/* DW 5-7 */
> +	__le32 reserved[3];
> +};
> +
> +static_assert(sizeof(struct cq_entry) == 32);
> +
>  /*
>   * UTMRD structure.
>   */
> -- 
> 2.7.4
> 
