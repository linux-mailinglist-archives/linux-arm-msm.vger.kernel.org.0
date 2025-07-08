Return-Path: <linux-arm-msm+bounces-64021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F603AFC948
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 13:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40C0F5629DC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 11:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E8E62D8764;
	Tue,  8 Jul 2025 11:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPsjkJaR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6231378F59;
	Tue,  8 Jul 2025 11:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751973233; cv=none; b=TrPbMjDBQomtzWJB4tKOSzKEX3NmjZNEcshUCTRsHNfSo6U3qmFDxMlmdCzlH36fw2l0QZIis8wf3W/aoyss3l5eHpHs/AcI3IdEIDQnpB/PAw7XzpGXun77qHr8XnA0chqCBD8RID+1WaUbtWI09ku3eqSrgkPdwnkK2pFRgvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751973233; c=relaxed/simple;
	bh=0l2+kSAOtLK9DJWI/UspcnAaGXDxspqYx8T+mmX/caE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qSOkPqShqOm6mn1HoJWfLa6v8ZMvVi59LWQIL7PCVvY13uMgkgyq7T4pAfWhAmr55uLdWf7ZHVaqdrpI7PRssFWK9x6x55BbHifBNaIhz1qIFLD/OR2OkQHoBuIklaYTjxbvdV02925aqVJDLCc1wXiZk0gybIhg92kE6XSIw7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPsjkJaR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A47AC4CEED;
	Tue,  8 Jul 2025 11:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751973232;
	bh=0l2+kSAOtLK9DJWI/UspcnAaGXDxspqYx8T+mmX/caE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PPsjkJaRTme6O0vYeb/0rQs+UprSCM9AU5zeUG64CAgWLuOtf/p8YGjJilxOHpGix
	 PRvM5U+N/G/mlpzKRFkQhy6telClOHLrGugY8iKcTK4fzsBt0OLaTJN7dJyHyYJbWo
	 OLyqU4iZXawm2KCwz32iEX0l2Pcn21nNdxCjz78YXnrOV9FdJlMf+chq5ZLpkoZCsV
	 oE/7WbWEqVdO+bvz6q5Zf3C/mUY6esS5b/Ic6e0WQGnKrQdZTvN6c7TXYCMyiVDaTX
	 /G766ucl8r6dKagc96AJ78FZaBsY0ZL7I3NLJAvxaYi45TbMpk8U2PeOiGWBI6smdr
	 pHbyzycqACluA==
Date: Tue, 8 Jul 2025 16:43:43 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Asutosh Das <quic_asutoshd@quicinc.com>, 
	Bart Van Assche <bvanassche@acm.org>, Stanley Chu <stanley.chu@mediatek.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Can Guo <quic_cang@quicinc.com>, 
	Nitin Rawat <quic_nitirawa@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC/RFT 2/5] ufs: ufs-qcom: Remove inferred MCQ mappings
Message-ID: <7cdpetp3fuxpu2eeqctc5f7kytfpvoquopfsr7ea5non6bo74z@pu45jowjzwrt>
References: <20250704-topic-qcom_ufs_mcq_cleanup-v1-0-c70d01b3d334@oss.qualcomm.com>
 <20250704-topic-qcom_ufs_mcq_cleanup-v1-2-c70d01b3d334@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704-topic-qcom_ufs_mcq_cleanup-v1-2-c70d01b3d334@oss.qualcomm.com>

On Fri, Jul 04, 2025 at 07:36:10PM GMT, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Stop acquiring the base HCI memory region twice. Instead, because of
> the need of getting the offset of MCQ regions from the controller base,
> get the resource for the main region and store it separately.
> 
> Demand all the regions are provided in DT and don't try to make
> guesses, circumventing the memory map provided in FDT.
> 

IIRC, during the MCQ review, Can/Asutosh justified the manual resource parsing
due to some platforms just having a flat 'MCQ' region. So they ended up manually
allocating the rest of the regions based on hw capabilities.

So there is no such requirement to support those platforms now?

- Mani

> There are currently no platforms with MCQ enabled, so there is no
> functional change.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/ufs/host/ufs-qcom.c      | 58 ++++------------------------------------
>  drivers/ufs/host/ufshcd-pltfrm.c |  4 ++-
>  include/ufs/ufshcd.h             |  2 +-
>  3 files changed, 9 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 8dd9709cbdeef6ede5faa434fcb853e11950721f..67929a3e6e6242a93ed4c84cb2d2f7f10de4aa5e 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -28,12 +28,6 @@
>  #include "ufshcd-pltfrm.h"
>  #include "ufs-qcom.h"
>  
> -#define MCQ_QCFGPTR_MASK	GENMASK(7, 0)
> -#define MCQ_QCFGPTR_UNIT	0x200
> -#define MCQ_SQATTR_OFFSET(c) \
> -	((((c) >> 16) & MCQ_QCFGPTR_MASK) * MCQ_QCFGPTR_UNIT)
> -#define MCQ_QCFG_SIZE	0x40
> -
>  /* De-emphasis for gear-5 */
>  #define DEEMPHASIS_3_5_dB	0x04
>  #define NO_DEEMPHASIS		0x0
> @@ -1899,7 +1893,6 @@ static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
>  
>  /* Resources */
>  static const struct ufshcd_res_info ufs_res_info[RES_MAX] = {
> -	{.name = "std",},
>  	{.name = "mcq",},
>  	/* Submission Queue DAO */
>  	{.name = "mcq_sqd",},
> @@ -1917,7 +1910,6 @@ static int ufs_qcom_mcq_config_resource(struct ufs_hba *hba)
>  {
>  	struct platform_device *pdev = to_platform_device(hba->dev);
>  	struct ufshcd_res_info *res;
> -	struct resource *res_mem, *res_mcq;
>  	int i, ret;
>  
>  	memcpy(hba->res, ufs_res_info, sizeof(ufs_res_info));
> @@ -1929,12 +1921,6 @@ static int ufs_qcom_mcq_config_resource(struct ufs_hba *hba)
>  							     res->name);
>  		if (!res->resource) {
>  			dev_info(hba->dev, "Resource %s not provided\n", res->name);
> -			if (i == RES_UFS)
> -				return -ENODEV;
> -			continue;
> -		} else if (i == RES_UFS) {
> -			res_mem = res->resource;
> -			res->base = hba->mmio_base;
>  			continue;
>  		}
>  
> @@ -1948,63 +1934,29 @@ static int ufs_qcom_mcq_config_resource(struct ufs_hba *hba)
>  		}
>  	}
>  
> -	/* MCQ resource provided in DT */
>  	res = &hba->res[RES_MCQ];
> -	/* Bail if MCQ resource is provided */
>  	if (res->base)
> -		goto out;
> +		return -EINVAL;
>  
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
> -	}
> -
> -	res->base = devm_ioremap_resource(hba->dev, res_mcq);
> -	if (IS_ERR(res->base)) {
> -		dev_err(hba->dev, "MCQ registers mapping failed, err=%d\n",
> -			(int)PTR_ERR(res->base));
> -		ret = PTR_ERR(res->base);
> -		goto ioremap_err;
> -	}
> -
> -out:
>  	hba->mcq_base = res->base;
> +
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
> +	struct ufshcd_res_info *sqdao_res;
>  	struct ufshcd_mcq_opr_info_t *opr;
>  	int i;
>  
> -	mem_res = &hba->res[RES_UFS];
>  	sqdao_res = &hba->res[RES_MCQ_SQD];
> -
> -	if (!mem_res->base || !sqdao_res->base)
> +	if (!sqdao_res->base)
>  		return -EINVAL;
>  
>  	for (i = 0; i < OPR_MAX; i++) {
>  		opr = &hba->mcq_opr[i];
>  		opr->offset = sqdao_res->resource->start -
> -			      mem_res->resource->start + 0x40 * i;
> +			      hba->hci_res->start + 0x40 * i;
>  		opr->stride = 0x100;
>  		opr->base = sqdao_res->base + 0x40 * i;
>  	}
> diff --git a/drivers/ufs/host/ufshcd-pltfrm.c b/drivers/ufs/host/ufshcd-pltfrm.c
> index ffe5d1d2b2158882d369e4d3c902633b81378dba..0ba13ab59eafe6e5c4f8db61691628a4905eb52f 100644
> --- a/drivers/ufs/host/ufshcd-pltfrm.c
> +++ b/drivers/ufs/host/ufshcd-pltfrm.c
> @@ -463,8 +463,9 @@ int ufshcd_pltfrm_init(struct platform_device *pdev,
>  	void __iomem *mmio_base;
>  	int irq, err;
>  	struct device *dev = &pdev->dev;
> +	struct resource *hci_res;
>  
> -	mmio_base = devm_platform_ioremap_resource(pdev, 0);
> +	mmio_base = devm_platform_get_and_ioremap_resource(pdev, 0, &hci_res);
>  	if (IS_ERR(mmio_base))
>  		return PTR_ERR(mmio_base);
>  
> @@ -479,6 +480,7 @@ int ufshcd_pltfrm_init(struct platform_device *pdev,
>  	}
>  
>  	hba->vops = vops;
> +	hba->hci_res = hci_res;
>  
>  	err = ufshcd_parse_clock_info(hba);
>  	if (err) {
> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
> index 9b3515cee71178c96f42f757a01d975606f64c9e..28132ff759afbd3bf8977bc481da225d95fd461c 100644
> --- a/include/ufs/ufshcd.h
> +++ b/include/ufs/ufshcd.h
> @@ -808,7 +808,6 @@ struct ufshcd_res_info {
>  };
>  
>  enum ufshcd_res {
> -	RES_UFS,
>  	RES_MCQ,
>  	RES_MCQ_SQD,
>  	RES_MCQ_SQIS,
> @@ -970,6 +969,7 @@ enum ufshcd_mcq_opr {
>   */
>  struct ufs_hba {
>  	void __iomem *mmio_base;
> +	struct resource *hci_res;
>  
>  	/* Virtual memory reference */
>  	struct utp_transfer_cmd_desc *ucdl_base_addr;
> 
> -- 
> 2.50.0
> 

-- 
மணிவண்ணன் சதாசிவம்

