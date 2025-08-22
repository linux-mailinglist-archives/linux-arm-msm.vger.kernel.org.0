Return-Path: <linux-arm-msm+bounces-70283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0722AB3127C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0BB0605638
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 09:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D22612EC56B;
	Fri, 22 Aug 2025 09:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ShYcV1Zx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18E62820CB;
	Fri, 22 Aug 2025 09:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755853503; cv=none; b=C8cUQbUTnVym/KY2C6XcA82nFSrNqTLHyrIH3bkfx+fGqcBiKj5HFrLOjtbs0w7QtAQonvqNwyQVBKJG07p5TNJmZVY1WXGzljOYgVqmuaIFDR5Tnf4HGf6/Lwj+Ptd2tIZwFZqatcAo3wR6vIWLa4LCbulfnBOajnmjF+L86zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755853503; c=relaxed/simple;
	bh=Qh73QKv2+Jh/RkA86jBnGl7Wo/prnjXPODplIgrBy6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vCbZKuo3QJVoDyKhNICIty9/dpVkDDn/hmWD1bF/dQ70uZGa97XvkFkmEUIP25SHlwfdKs0WbKHQOaG0amVICK979k+bLI/sWgZQ/iLy1OuVFXJHp1wypn/i8JOHdrEMkGo1rj40RitSk7rGNqGkzCm/zFwSLcu72XqH5HKWhXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ShYcV1Zx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97674C4CEF1;
	Fri, 22 Aug 2025 09:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755853503;
	bh=Qh73QKv2+Jh/RkA86jBnGl7Wo/prnjXPODplIgrBy6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ShYcV1ZxnmRnuLfFaR7dMU7lgCnSlR5MrVlkwOT79vogrgIqhMG+cSgRv6oA5/16x
	 /3HGKlkDREz6M4K4NW5aLk9I154uIzzK3Gdqkh/IiH4PS1m5OjpCjOZ8+8L5hG0r5T
	 dMeYOPEToYj3+1Jf/VUXz0swyzezEOXJe2kc6qSejxMBr4m+XTIpryWQ+1t0wk5vPZ
	 WGhoyCY/+UDcPOrh8QGa5g/DCNwQqifgAzTlRS4rPkpyj/m/nEflsuYJ8QnkW5x2EV
	 Xo0e8IeYSpLNW1yylXShWTlfP9bKOloH5NTqG85J4g24E7tmo9OdOhO3kfASylbrWQ
	 2+voWarUxoiLg==
Date: Fri, 22 Aug 2025 14:34:48 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, James.Bottomley@hansenpartnership.com, 
	martin.petersen@oracle.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH V3 1/5] ufs: ufs-qcom: Streamline UFS MCQ resource mapping
Message-ID: <ljgirap5pa74fchujk3wrg7wt66x2pub7ezdhuxfbqswymepbe@cu6o5mqg4lak>
References: <20250821112403.12078-1-quic_rdwivedi@quicinc.com>
 <20250821112403.12078-2-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821112403.12078-2-quic_rdwivedi@quicinc.com>

On Thu, Aug 21, 2025 at 04:53:59PM GMT, Ram Kumar Dwivedi wrote:
> From: Nitin Rawat <quic_nitirawa@quicinc.com>
> 
> The current MCQ resource configuration involves multiple resource
> mappings and dynamic resource allocation.
> 
> Simplify the resource mapping by directly mapping the single "mcq"
> resource from device tree to hba->mcq_base instead of mapping multiple
> separate resources (RES_UFS, RES_MCQ, RES_MCQ_SQD, RES_MCQ_VS).
> 
> It also uses predefined offsets for MCQ doorbell registers (SQD,
> CQD, SQIS, CQIS) relative to the MCQ base,providing clearer memory
> layout clarity.
> 
> Additionally update vendor-specific register offset UFS_MEM_CQIS_VS
> offset from 0x8 to 0x4008 to align with the hardware programming guide.
> 
> The new approach assumes the device tree provides a single "mcq"
> resource that encompasses the entire MCQ configuration space, making
> the driver more maintainable and less prone to resource mapping errors.
> 

Also make it clear that the binding only requires a single 'mcq' region and not
the separate ones as the driver is using. Otherwise, it sounds like a breakage.

> Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>

Tag order is messed up. Please fix it.

> ---
>  drivers/ufs/host/ufs-qcom.c | 146 +++++++++++++-----------------------
>  drivers/ufs/host/ufs-qcom.h |  22 +++++-
>  2 files changed, 73 insertions(+), 95 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 9574fdc2bb0f..6c6a385543ef 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -1910,116 +1910,73 @@ static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
>  	hba->clk_scaling.suspend_on_no_request = true;
>  }
>  
> -/* Resources */
> -static const struct ufshcd_res_info ufs_res_info[RES_MAX] = {
> -	{.name = "ufs_mem",},
> -	{.name = "mcq",},
> -	/* Submission Queue DAO */
> -	{.name = "mcq_sqd",},
> -	/* Submission Queue Interrupt Status */
> -	{.name = "mcq_sqis",},
> -	/* Completion Queue DAO */
> -	{.name = "mcq_cqd",},
> -	/* Completion Queue Interrupt Status */
> -	{.name = "mcq_cqis",},
> -	/* MCQ vendor specific */
> -	{.name = "mcq_vs",},
> -};
> -
>  static int ufs_qcom_mcq_config_resource(struct ufs_hba *hba)
>  {
>  	struct platform_device *pdev = to_platform_device(hba->dev);
> -	struct ufshcd_res_info *res;
> -	struct resource *res_mem, *res_mcq;
> -	int i, ret;
> -
> -	memcpy(hba->res, ufs_res_info, sizeof(ufs_res_info));
> -
> -	for (i = 0; i < RES_MAX; i++) {
> -		res = &hba->res[i];
> -		res->resource = platform_get_resource_byname(pdev,
> -							     IORESOURCE_MEM,
> -							     res->name);
> -		if (!res->resource) {
> -			dev_info(hba->dev, "Resource %s not provided\n", res->name);
> -			if (i == RES_UFS)
> -				return -ENODEV;
> -			continue;
> -		} else if (i == RES_UFS) {
> -			res_mem = res->resource;
> -			res->base = hba->mmio_base;
> -			continue;
> -		}
> +	struct resource *res;
>  
> -		res->base = devm_ioremap_resource(hba->dev, res->resource);
> -		if (IS_ERR(res->base)) {
> -			dev_err(hba->dev, "Failed to map res %s, err=%d\n",
> -					 res->name, (int)PTR_ERR(res->base));
> -			ret = PTR_ERR(res->base);
> -			res->base = NULL;
> -			return ret;
> -		}
> +	/* Map the MCQ configuration region */
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mcq");
> +	if (!res) {
> +		dev_err(hba->dev, "MCQ resource not found in device tree\n");
> +		return -ENODEV;
>  	}
>  
> -	/* MCQ resource provided in DT */
> -	res = &hba->res[RES_MCQ];
> -	/* Bail if MCQ resource is provided */
> -	if (res->base)
> -		goto out;
> -
> -	/* Explicitly allocate MCQ resource from ufs_mem */
> -	res_mcq = devm_kzalloc(hba->dev, sizeof(*res_mcq), GFP_KERNEL);
> -	if (!res_mcq)
> -		return -ENOMEM;
> -
> -	res_mcq->start = res_mem->start +
> -			 MCQ_SQATTR_OFFSET(hba->mcq_capabilities);
> -	res_mcq->end = res_mcq->start + hba->nr_hw_queues * MCQ_QCFG_SIZE - 1;
> -	res_mcq->flags = res_mem->flags;
> -	res_mcq->name = "mcq";
> -
> -	ret = insert_resource(&iomem_resource, res_mcq);
> -	if (ret) {
> -		dev_err(hba->dev, "Failed to insert MCQ resource, err=%d\n",
> -			ret);
> -		return ret;
> +	hba->mcq_base = devm_ioremap_resource(hba->dev, res);
> +	if (IS_ERR(hba->mcq_base)) {
> +		dev_err(hba->dev, "Failed to map MCQ region: %ld\n",

Do you really need to print errnos of size 'long int'?

> +			PTR_ERR(hba->mcq_base));
> +		return PTR_ERR(hba->mcq_base);
>  	}
>  
> -	res->base = devm_ioremap_resource(hba->dev, res_mcq);
> -	if (IS_ERR(res->base)) {
> -		dev_err(hba->dev, "MCQ registers mapping failed, err=%d\n",
> -			(int)PTR_ERR(res->base));
> -		ret = PTR_ERR(res->base);
> -		goto ioremap_err;
> -	}
> -
> -out:
> -	hba->mcq_base = res->base;
>  	return 0;
> -ioremap_err:
> -	res->base = NULL;
> -	remove_resource(res_mcq);
> -	return ret;
>  }
>  
>  static int ufs_qcom_op_runtime_config(struct ufs_hba *hba)
>  {
> -	struct ufshcd_res_info *mem_res, *sqdao_res;
>  	struct ufshcd_mcq_opr_info_t *opr;
>  	int i;
> +	u32 doorbell_offsets[OPR_MAX];
>  
> -	mem_res = &hba->res[RES_UFS];
> -	sqdao_res = &hba->res[RES_MCQ_SQD];
> -
> -	if (!mem_res->base || !sqdao_res->base)
> +	if (!hba->mcq_base) {
> +		dev_err(hba->dev, "MCQ base not mapped\n");
>  		return -EINVAL;
> +	}

Is it possible to hit this error?

> +
> +	/*
> +	 * Configure doorbell address offsets in MCQ configuration registers.
> +	 * These values are offsets relative to mmio_base (UFS_HCI_BASE).
> +	 *
> +	 * Memory Layout:
> +	 * - mmio_base = UFS_HCI_BASE
> +	 * - mcq_base  = MCQ_CONFIG_BASE = mmio_base + (UFS_QCOM_MCQCAP_QCFGPTR * 0x200)
> +	 * - Doorbell registers are at: mmio_base + (UFS_QCOM_MCQCAP_QCFGPTR * 0x200) +
> +	 * -				UFS_QCOM_MCQ_SQD_OFFSET
> +	 * - Which is also: mcq_base +  UFS_QCOM_MCQ_SQD_OFFSET
> +	 */
> +
> +	doorbell_offsets[OPR_SQD] = UFS_QCOM_SQD_ADDR_OFFSET;
> +	doorbell_offsets[OPR_SQIS] = UFS_QCOM_SQIS_ADDR_OFFSET;
> +	doorbell_offsets[OPR_CQD] = UFS_QCOM_CQD_ADDR_OFFSET;
> +	doorbell_offsets[OPR_CQIS] = UFS_QCOM_CQIS_ADDR_OFFSET;
>  
> +	/*
> +	 * Configure MCQ operation registers.
> +	 *
> +	 * The doorbell registers are physically located within the MCQ region:
> +	 * - doorbell_physical_addr = mmio_base + doorbell_offset
> +	 * - doorbell_physical_addr = mcq_base + (doorbell_offset - MCQ_CONFIG_OFFSET)
> +	 */
>  	for (i = 0; i < OPR_MAX; i++) {
>  		opr = &hba->mcq_opr[i];
> -		opr->offset = sqdao_res->resource->start -
> -			      mem_res->resource->start + 0x40 * i;
> -		opr->stride = 0x100;
> -		opr->base = sqdao_res->base + 0x40 * i;
> +		opr->offset = doorbell_offsets[i];  /* Offset relative to mmio_base */
> +		opr->stride = UFS_QCOM_MCQ_STRIDE;  /* 256 bytes between queues */
> +
> +		/*
> +		 * Calculate the actual doorbell base address within MCQ region:
> +		 * base = mcq_base + (doorbell_offset - MCQ_CONFIG_OFFSET)
> +		 */
> +		opr->base = hba->mcq_base + (opr->offset - UFS_QCOM_MCQ_CONFIG_OFFSET);
>  	}
>  
>  	return 0;
> @@ -2034,12 +1991,13 @@ static int ufs_qcom_get_hba_mac(struct ufs_hba *hba)
>  static int ufs_qcom_get_outstanding_cqs(struct ufs_hba *hba,
>  					unsigned long *ocqs)
>  {
> -	struct ufshcd_res_info *mcq_vs_res = &hba->res[RES_MCQ_VS];
> -
> -	if (!mcq_vs_res->base)
> +	if (!hba->mcq_base) {
> +		dev_err(hba->dev, "MCQ base not mapped\n");
>  		return -EINVAL;
> +	}

Same here.

>  
> -	*ocqs = readl(mcq_vs_res->base + UFS_MEM_CQIS_VS);
> +	/* Read from MCQ vendor-specific register in MCQ region */
> +	*ocqs = readl(hba->mcq_base + UFS_MEM_CQIS_VS);
>  
>  	return 0;
>  }
> diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
> index e0e129af7c16..8c2c94390a50 100644
> --- a/drivers/ufs/host/ufs-qcom.h
> +++ b/drivers/ufs/host/ufs-qcom.h
> @@ -33,6 +33,25 @@
>  #define DL_VS_CLK_CFG_MASK GENMASK(9, 0)
>  #define DME_VS_CORE_CLK_CTRL_DME_HW_CGC_EN             BIT(9)
>  
> +/* Qualcomm MCQ Configuration */
> +#define UFS_QCOM_MCQCAP_QCFGPTR     224  /* 0xE0 in hex */
> +#define UFS_QCOM_MCQ_CONFIG_OFFSET  (UFS_QCOM_MCQCAP_QCFGPTR * 0x200)  /* 0x1C000 */
> +
> +/* Doorbell offsets within MCQ region (relative to MCQ_CONFIG_BASE) */
> +#define UFS_QCOM_MCQ_SQD_OFFSET     0x5000
> +#define UFS_QCOM_MCQ_CQD_OFFSET     0x5080
> +#define UFS_QCOM_MCQ_SQIS_OFFSET    0x5040
> +#define UFS_QCOM_MCQ_CQIS_OFFSET    0x50C0
> +#define UFS_QCOM_MCQ_STRIDE         0x100
> +
> +/* Calculated doorbell address offsets (relative to mmio_base) */
> +#define UFS_QCOM_SQD_ADDR_OFFSET    (UFS_QCOM_MCQ_CONFIG_OFFSET + UFS_QCOM_MCQ_SQD_OFFSET)
> +#define UFS_QCOM_CQD_ADDR_OFFSET    (UFS_QCOM_MCQ_CONFIG_OFFSET + UFS_QCOM_MCQ_CQD_OFFSET)
> +#define UFS_QCOM_SQIS_ADDR_OFFSET   (UFS_QCOM_MCQ_CONFIG_OFFSET + UFS_QCOM_MCQ_SQIS_OFFSET)
> +#define UFS_QCOM_CQIS_ADDR_OFFSET   (UFS_QCOM_MCQ_CONFIG_OFFSET + UFS_QCOM_MCQ_CQIS_OFFSET)
> +
> +#define REG_UFS_MCQ_STRIDE          UFS_QCOM_MCQ_STRIDE
> +
>  /* QCOM UFS host controller vendor specific registers */
>  enum {
>  	REG_UFS_SYS1CLK_1US                 = 0xC0,
> @@ -96,7 +115,8 @@ enum {
>  };
>  
>  enum {
> -	UFS_MEM_CQIS_VS		= 0x8,
> +	UFS_MEM_VS_BASE         = 0x4000,
> +	UFS_MEM_CQIS_VS		= 0x4008,

Why are these offsets 'enum'? Can't they be fixed definitions like other
offsets?

- Mani
-- 
மணிவண்ணன் சதாசிவம்

