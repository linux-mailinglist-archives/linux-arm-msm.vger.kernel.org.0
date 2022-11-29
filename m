Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C677063C3E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 16:37:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235935AbiK2Phf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Nov 2022 10:37:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbiK2Phd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Nov 2022 10:37:33 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92DBC11D;
        Tue, 29 Nov 2022 07:37:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3CE74B81694;
        Tue, 29 Nov 2022 15:37:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6816CC433D7;
        Tue, 29 Nov 2022 15:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669736249;
        bh=/J82Jv42irRPm48hqLx9B1tWVw/EnG7tvSOqIx1fwKo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OieB1AN7JSU0tiJt8Ez9xfnN+NrrH+QVDzZ6jFtwHlfgZ+Bqpud/dOgdDA7j/ZanC
         WLL2VGsxvux43qcL4h/FMtySG9goi32T36u2ONu0tXLLVXLIsTEkQwIp7lpI9TgxqJ
         mri1cMJCksYmshl9+IO18IDcvPDAgBYNGLfIVii5DYmz3m5rN2JS+TRp5ViufTld6A
         pFKiWLIhuCDOpWNC9NOAxTXFkcZPm1YR32sINwGXj2mYGZxIRfUy+WsTOGl7RMtioN
         FXpC20PMpGSvuvGoTyS9mJMcDd+HXAN+4Fsywtlytv/T26btk7t+OSJmxGlwMkvLMS
         ZNxBfWyxNufjQ==
Date:   Tue, 29 Nov 2022 21:07:12 +0530
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
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Arthur Simchaev <Arthur.Simchaev@wdc.com>,
        Jinyoung Choi <j-young.choi@samsung.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 14/16] ufs: mcq: Add completion support of a cqe
Message-ID: <20221129153712.GI4931@workstation>
References: <cover.1669684648.git.quic_asutoshd@quicinc.com>
 <a6a3a41fa7a70c21c9f9f8be53bb8adcf5ec4abf.1669684648.git.quic_asutoshd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6a3a41fa7a70c21c9f9f8be53bb8adcf5ec4abf.1669684648.git.quic_asutoshd@quicinc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 28, 2022 at 05:20:55PM -0800, Asutosh Das wrote:
> Add support for completing requests from Completion Queue.
> Some host controllers support vendor specific registers
> that provide a bitmap of all CQ's which have at least one
> completed CQE. Add this support.
> The MCQ specification doesn't provide the Task Tag or its
> equivalent in the Completion Queue Entry.
> So use an indirect method to find the Task Tag from the
> Completion Queue Entry.
> 
> Co-developed-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Asutosh Das <quic_asutoshd@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> Reviewed-by: Bart Van Assche <bvanassche@acm.org>
> ---
>  drivers/ufs/core/ufs-mcq.c     | 61 ++++++++++++++++++++++++++++++++++++++++++
>  drivers/ufs/core/ufshcd-priv.h | 43 +++++++++++++++++++++++++++++
>  drivers/ufs/core/ufshcd.c      | 37 +++++++++++++++++++++++++
>  drivers/ufs/host/ufs-qcom.c    | 14 ++++++++++
>  drivers/ufs/host/ufs-qcom.h    |  4 +++
>  include/ufs/ufshcd.h           |  7 +++++
>  include/ufs/ufshci.h           |  3 +++
>  7 files changed, 169 insertions(+)
> 
> diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
> index 151caf3..68c4097 100644
> --- a/drivers/ufs/core/ufs-mcq.c
> +++ b/drivers/ufs/core/ufs-mcq.c
> @@ -25,6 +25,7 @@
>  #define MCQ_CFG_MAC_MASK	GENMASK(16, 8)
>  #define MCQ_QCFG_SIZE		0x40
>  #define MCQ_ENTRY_SIZE_IN_DWORD	8
> +#define CQE_UCD_BA GENMASK_ULL(63, 7)
>  
>  static int rw_queue_count_set(const char *val, const struct kernel_param *kp)
>  {
> @@ -236,6 +237,63 @@ static void __iomem *mcq_opr_base(struct ufs_hba *hba,
>  	return opr->base + opr->stride * i;
>  }
>  
> +u32 ufshcd_mcq_read_cqis(struct ufs_hba *hba, int i)
> +{
> +	return readl(mcq_opr_base(hba, OPR_CQIS, i) + REG_CQIS);
> +}
> +
> +void ufshcd_mcq_write_cqis(struct ufs_hba *hba, u32 val, int i)
> +{
> +	writel(val, mcq_opr_base(hba, OPR_CQIS, i) + REG_CQIS);
> +}
> +
> +/*
> + * Current MCQ specification doesn't provide a Task Tag or its equivalent in
> + * the Completion Queue Entry. Find the Task Tag using an indirect method.
> + */
> +static int ufshcd_mcq_get_tag(struct ufs_hba *hba,
> +				     struct ufs_hw_queue *hwq,
> +				     struct cq_entry *cqe)
> +{
> +	dma_addr_t dma_addr;
> +
> +	/* sizeof(struct utp_transfer_cmd_desc) must be a multiple of 128 */
> +	BUILD_BUG_ON(sizeof(struct utp_transfer_cmd_desc) & GENMASK(6, 0));
> +
> +	/* Bits 63:7 UCD base address, 6:5 are reserved, 4:0 is SQ ID */
> +	dma_addr = le64_to_cpu(cqe->command_desc_base_addr) & CQE_UCD_BA;
> +
> +	return (dma_addr - hba->ucdl_dma_addr) /
> +		sizeof(struct utp_transfer_cmd_desc);
> +}
> +
> +static void ufshcd_mcq_process_cqe(struct ufs_hba *hba,
> +					    struct ufs_hw_queue *hwq)
> +{
> +	struct cq_entry *cqe = ufshcd_mcq_cur_cqe(hwq);
> +	int tag = ufshcd_mcq_get_tag(hba, hwq, cqe);
> +
> +	ufshcd_compl_one_cqe(hba, tag, cqe);
> +}
> +
> +unsigned long ufshcd_mcq_poll_cqe_nolock(struct ufs_hba *hba,
> +					 struct ufs_hw_queue *hwq)
> +{
> +	unsigned long completed_reqs = 0;
> +
> +	ufshcd_mcq_update_cq_tail_slot(hwq);
> +	while (!ufshcd_mcq_is_cq_empty(hwq)) {
> +		ufshcd_mcq_process_cqe(hba, hwq);
> +		ufshcd_mcq_inc_cq_head_slot(hwq);
> +		completed_reqs++;
> +	}
> +
> +	if (completed_reqs)
> +		ufshcd_mcq_update_cq_head(hwq);
> +
> +	return completed_reqs;
> +}
> +
>  void ufshcd_mcq_make_queues_operational(struct ufs_hba *hba)
>  {
>  	struct ufs_hw_queue *hwq;
> @@ -279,6 +337,9 @@ void ufshcd_mcq_make_queues_operational(struct ufs_hba *hba)
>  		hwq->mcq_cq_head = mcq_opr_base(hba, OPR_CQD, i) + REG_CQHP;
>  		hwq->mcq_cq_tail = mcq_opr_base(hba, OPR_CQD, i) + REG_CQTP;
>  
> +		/* Reinitializing is needed upon HC reset */
> +		hwq->sq_tail_slot = hwq->cq_tail_slot = hwq->cq_head_slot = 0;
> +
>  		/* Enable Tail Entry Push Status interrupt only for non-poll queues */
>  		if (i < hba->nr_hw_queues - hba->nr_queues[HCTX_TYPE_POLL])
>  			writel(1, mcq_opr_base(hba, OPR_CQIS, i) + REG_CQIE);
> diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
> index 2a7fb60..4dcb7f9 100644
> --- a/drivers/ufs/core/ufshcd-priv.h
> +++ b/drivers/ufs/core/ufshcd-priv.h
> @@ -69,6 +69,10 @@ int ufshcd_mcq_memory_alloc(struct ufs_hba *hba);
>  void ufshcd_mcq_make_queues_operational(struct ufs_hba *hba);
>  void ufshcd_mcq_config_mac(struct ufs_hba *hba, u32 max_active_cmds);
>  void ufshcd_mcq_select_mcq_mode(struct ufs_hba *hba);
> +u32 ufshcd_mcq_read_cqis(struct ufs_hba *hba, int i);
> +void ufshcd_mcq_write_cqis(struct ufs_hba *hba, u32 val, int i);
> +unsigned long ufshcd_mcq_poll_cqe_nolock(struct ufs_hba *hba,
> +					 struct ufs_hw_queue *hwq);
>  struct ufs_hw_queue *ufshcd_mcq_req_to_hwq(struct ufs_hba *hba,
>  					   struct request *req);
>  
> @@ -261,6 +265,15 @@ static inline int ufshcd_mcq_vops_op_runtime_config(struct ufs_hba *hba)
>  	return -EOPNOTSUPP;
>  }
>  
> +static inline int ufshcd_vops_get_outstanding_cqs(struct ufs_hba *hba,
> +						  unsigned long *ocqs)
> +{
> +	if (hba->vops && hba->vops->get_outstanding_cqs)
> +		return hba->vops->get_outstanding_cqs(hba, ocqs);
> +
> +	return -EOPNOTSUPP;
> +}
> +
>  extern const struct ufs_pm_lvl_states ufs_pm_lvl_states[];
>  
>  /**
> @@ -347,4 +360,34 @@ static inline void ufshcd_inc_sq_tail(struct ufs_hw_queue *q)
>  	writel(val, q->mcq_sq_tail);
>  }
>  
> +static inline void ufshcd_mcq_update_cq_tail_slot(struct ufs_hw_queue *q)
> +{
> +	u32 val = readl(q->mcq_cq_tail);
> +
> +	q->cq_tail_slot = val / sizeof(struct cq_entry);
> +}
> +
> +static inline bool ufshcd_mcq_is_cq_empty(struct ufs_hw_queue *q)
> +{
> +	return q->cq_head_slot == q->cq_tail_slot;
> +}
> +
> +static inline void ufshcd_mcq_inc_cq_head_slot(struct ufs_hw_queue *q)
> +{
> +	q->cq_head_slot++;
> +	if (q->cq_head_slot == q->max_entries)
> +		q->cq_head_slot = 0;
> +}
> +
> +static inline void ufshcd_mcq_update_cq_head(struct ufs_hw_queue *q)
> +{
> +	writel(q->cq_head_slot * sizeof(struct cq_entry), q->mcq_cq_head);
> +}
> +
> +static inline struct cq_entry *ufshcd_mcq_cur_cqe(struct ufs_hw_queue *q)
> +{
> +	struct cq_entry *cqe = q->cqe_base_addr;
> +
> +	return cqe + q->cq_head_slot;
> +}
>  #endif /* _UFSHCD_PRIV_H_ */
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 0024586..8d743c3 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -6698,6 +6698,40 @@ static irqreturn_t ufshcd_tmc_handler(struct ufs_hba *hba)
>  }
>  
>  /**
> + * ufshcd_handle_mcq_cq_events - handle MCQ completion queue events
> + * @hba: per adapter instance
> + *
> + * Returns IRQ_HANDLED if interrupt is handled
> + */
> +static irqreturn_t ufshcd_handle_mcq_cq_events(struct ufs_hba *hba)
> +{
> +	struct ufs_hw_queue *hwq;
> +	unsigned long outstanding_cqs;
> +	unsigned int nr_queues;
> +	int i, ret;
> +	u32 events;
> +
> +	ret = ufshcd_vops_get_outstanding_cqs(hba, &outstanding_cqs);
> +	if (ret)
> +		outstanding_cqs = (1U << hba->nr_hw_queues) - 1;
> +
> +	/* Exclude the poll queues */
> +	nr_queues = hba->nr_hw_queues - hba->nr_queues[HCTX_TYPE_POLL];
> +	for_each_set_bit(i, &outstanding_cqs, nr_queues) {
> +		hwq = &hba->uhq[i];
> +
> +		events = ufshcd_mcq_read_cqis(hba, i);
> +		if (events)
> +			ufshcd_mcq_write_cqis(hba, events, i);
> +
> +		if (events & UFSHCD_MCQ_CQIS_TAIL_ENT_PUSH_STS)
> +			ufshcd_mcq_poll_cqe_nolock(hba, hwq);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +/**
>   * ufshcd_sl_intr - Interrupt service routine
>   * @hba: per adapter instance
>   * @intr_status: contains interrupts generated by the controller
> @@ -6722,6 +6756,9 @@ static irqreturn_t ufshcd_sl_intr(struct ufs_hba *hba, u32 intr_status)
>  	if (intr_status & UTP_TRANSFER_REQ_COMPL)
>  		retval |= ufshcd_transfer_req_compl(hba);
>  
> +	if (intr_status & MCQ_CQ_EVENT_STATUS)
> +		retval |= ufshcd_handle_mcq_cq_events(hba);
> +
>  	return retval;
>  }
>  
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 77bdec3..96a58b4 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1555,6 +1555,19 @@ static int ufs_qcom_get_hba_mac(struct ufs_hba *hba)
>  	return MAX_SUPP_MAC;
>  }
>  
> +static int ufs_qcom_get_outstanding_cqs(struct ufs_hba *hba,
> +					unsigned long *ocqs)
> +{
> +	struct ufshcd_res_info *mcq_vs_res = &hba->res[RES_MCQ_VS];
> +
> +	if (!mcq_vs_res->base)
> +		return -EINVAL;
> +
> +	*ocqs = readl(mcq_vs_res->base + UFS_MEM_CQIS_VS);
> +
> +	return 0;
> +}
> +
>  /*
>   * struct ufs_hba_qcom_vops - UFS QCOM specific variant operations
>   *
> @@ -1581,6 +1594,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
>  	.mcq_config_resource	= ufs_qcom_mcq_config_resource,
>  	.get_hba_mac		= ufs_qcom_get_hba_mac,
>  	.op_runtime_config	= ufs_qcom_op_runtime_config,
> +	.get_outstanding_cqs	= ufs_qcom_get_outstanding_cqs,
>  };
>  
>  /**
> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
> index f86e532..6912bdf 100644
> --- a/drivers/ufs/host/ufs-qcom.h
> +++ b/drivers/ufs/host/ufs-qcom.h
> @@ -73,6 +73,10 @@ enum {
>  	UFS_UFS_DBG_RD_EDTL_RAM			= 0x1900,
>  };
>  
> +enum {
> +	UFS_MEM_CQIS_VS		= 0x8,
> +};
> +
>  #define UFS_CNTLR_2_x_x_VEN_REGS_OFFSET(x)	(0x000 + x)
>  #define UFS_CNTLR_3_x_x_VEN_REGS_OFFSET(x)	(0x400 + x)
>  
> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
> index ae20697..8441c46 100644
> --- a/include/ufs/ufshcd.h
> +++ b/include/ufs/ufshcd.h
> @@ -301,6 +301,7 @@ struct ufs_pwr_mode_info {
>   * @mcq_config_resource: called to configure MCQ platform resources
>   * @get_hba_mac: called to get vendor specific mac value, mandatory for mcq mode
>   * @op_runtime_config: called to config Operation and runtime regs Pointers
> + * @get_outstanding_cqs: called to get outstanding completion queues
>   */
>  struct ufs_hba_variant_ops {
>  	const char *name;
> @@ -342,6 +343,8 @@ struct ufs_hba_variant_ops {
>  	int	(*mcq_config_resource)(struct ufs_hba *hba);
>  	int	(*get_hba_mac)(struct ufs_hba *hba);
>  	int	(*op_runtime_config)(struct ufs_hba *hba);
> +	int	(*get_outstanding_cqs)(struct ufs_hba *hba,
> +				       unsigned long *ocqs);
>  };
>  
>  /* clock gating state  */
> @@ -1067,6 +1070,8 @@ struct ufs_hba {
>   * @id: hardware queue ID
>   * @sq_tp_slot: current slot to which SQ tail pointer is pointing
>   * @sq_lock: serialize submission queue access
> + * @cq_tail_slot: current slot to which CQ tail pointer is pointing
> + * @cq_head_slot: current slot to which CQ head pointer is pointing
>   */
>  struct ufs_hw_queue {
>  	void __iomem *mcq_sq_head;
> @@ -1082,6 +1087,8 @@ struct ufs_hw_queue {
>  	u32 id;
>  	u32 sq_tail_slot;
>  	spinlock_t sq_lock;
> +	u32 cq_tail_slot;
> +	u32 cq_head_slot;
>  };
>  
>  static inline bool is_mcq_enabled(struct ufs_hba *hba)
> diff --git a/include/ufs/ufshci.h b/include/ufs/ufshci.h
> index 8784b88..1df8425 100644
> --- a/include/ufs/ufshci.h
> +++ b/include/ufs/ufshci.h
> @@ -262,6 +262,9 @@ enum {
>  /* UTMRLRSR - UTP Task Management Request Run-Stop Register 80h */
>  #define UTP_TASK_REQ_LIST_RUN_STOP_BIT		0x1
>  
> +/* CQISy - CQ y Interrupt Status Register  */
> +#define UFSHCD_MCQ_CQIS_TAIL_ENT_PUSH_STS	0x1
> +
>  /* UICCMD - UIC Command */
>  #define COMMAND_OPCODE_MASK		0xFF
>  #define GEN_SELECTOR_INDEX_MASK		0xFFFF
> -- 
> 2.7.4
> 
