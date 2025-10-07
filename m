Return-Path: <linux-arm-msm+bounces-76268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57995BC2C23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 23:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05FEF3E1A36
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 21:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B07C24A069;
	Tue,  7 Oct 2025 21:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="haM99sNo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FA5182B4;
	Tue,  7 Oct 2025 21:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759872871; cv=none; b=Taz4sHyCPEBshL3Hqpyw7DR2rCyx6al9A55WUDv8AtxjnTiqgdLADd2tWcAi8glOxyiF0LDMxMezpGcnLjExjSKsXQwcl1vnHcc1YylLwZ79yFWZ3HtRZotFCCPW4veze2iqQSlBFbEB8y5GOKkCl3q9+86WLM3/HVbXwk0736s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759872871; c=relaxed/simple;
	bh=tscCPRebAvHk8TFKNWfDkNDXDXSKCm3qs9ZLWOUGrG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RpM+2j2qsPVKfSW+cF5tqTi7zsuJr7PpuLUABXTyCCIVvVIcPuzrr2uW46IuXOj3GvhKi8oTBH5ekUF2FKb69oOGqx3+6q7n/YDGcBl4a5UeDWPayRZ0kb1StTuEZINdOQ+EVPTYzVCHjfJQy7n/7tIQ/QAgpN+ucZ8cuVyo6So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=haM99sNo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1616CC4CEF1;
	Tue,  7 Oct 2025 21:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759872870;
	bh=tscCPRebAvHk8TFKNWfDkNDXDXSKCm3qs9ZLWOUGrG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=haM99sNo2WDwVyiqGrZIfVVXDMubSRH9BOF1YfD8lFh41k9ysGJZCkw1KIhtkf858
	 0R8Wn+kKf7NP96lLSWIsabIRKRJ2iKyHn6Kk9zC2G4IS6RgrOccKF9MMeEGrfPiOy2
	 T1ghCP3WBK2G2RnKpiZjBTiQ8t7HblEIcegSDEI9xtNMtDr9SThHU1zTyqatECxxFl
	 RrM/6PTXHcoc+hDJUUjk8xf9Lc5vAL0uKLMGIlwLlsKEvhn0OwZ3iLTq1bUGLaMUUS
	 L8ZYpfmk+EdG4MeeEial62QzCIpL08jjvWOo/VnyTGplTmtGw6l4CttBbO20ZInD9x
	 GyxXYCJ2jEvgA==
Date: Tue, 7 Oct 2025 14:34:29 -0700
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 05/12] remoteproc: pas: Replace metadata context with
 PAS context structure
Message-ID: <kws3pzpygv3i4fzusnw6nbgw7lrr74hhg43h77232s7s7otgvu@lem5qdzarl6r>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-5-de841623af3c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251007-kvm_rprocv4_next-20251007-v4-5-de841623af3c@oss.qualcomm.com>

On Tue, Oct 07, 2025 at 10:18:50PM +0530, Mukesh Ojha wrote:
> As a superset of the existing metadata context, the PAS context
> structure enables both remoteproc and non-remoteproc subsystems to
> better support scenarios where the SoC runs with or without the Gunyah
> hypervisor. To reflect this, relevant SMC and metadata functions are

SCM?

- Mani

> updated to incorporate PAS context awareness.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c       | 32 +++++++++--------
>  drivers/remoteproc/qcom_q6v5_pas.c     | 66 +++++++++++++++++++---------------
>  drivers/soc/qcom/mdt_loader.c          |  7 ++--
>  include/linux/firmware/qcom/qcom_scm.h |  4 +--
>  include/linux/soc/qcom/mdt_loader.h    |  5 ++-
>  5 files changed, 62 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index b8ce4fc34dbe..7b4ff3cb26ed 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -621,7 +621,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_context_destroy);
>   *		and optional blob of data used for authenticating the metadata
>   *		and the rest of the firmware
>   * @size:	size of the metadata
> - * @ctx:	optional metadata context
> + * @ctx:	optional pas context
>   *
>   * Return: 0 on success.
>   *
> @@ -630,8 +630,9 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_context_destroy);
>   * qcom_scm_pas_metadata_release() by the caller.
>   */
>  int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
> -			    struct qcom_scm_pas_metadata *ctx)
> +			    struct qcom_scm_pas_context *ctx)
>  {
> +	struct qcom_scm_pas_metadata *mdt_ctx;
>  	dma_addr_t mdata_phys;
>  	void *mdata_buf;
>  	int ret;
> @@ -682,10 +683,11 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
>  out:
>  	if (ret < 0 || !ctx) {
>  		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
> -	} else if (ctx) {
> -		ctx->ptr = mdata_buf;
> -		ctx->phys = mdata_phys;
> -		ctx->size = size;
> +	} else if (ctx && ctx->metadata) {
> +		mdt_ctx = ctx->metadata;
> +		mdt_ctx->ptr = mdata_buf;
> +		mdt_ctx->phys = mdata_phys;
> +		mdt_ctx->size = size;
>  	}
>  
>  	return ret ? : res.result[0];
> @@ -694,18 +696,20 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_init_image);
>  
>  /**
>   * qcom_scm_pas_metadata_release() - release metadata context
> - * @ctx:	metadata context
> + * @ctx:	pas context
>   */
> -void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
> +void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx)
>  {
> -	if (!ctx->ptr)
> -		return;
> +	struct qcom_scm_pas_metadata *mdt_ctx;
>  
> -	dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
> +	mdt_ctx = ctx->metadata;
> +	if (!mdt_ctx->ptr)
> +		return;
>  
> -	ctx->ptr = NULL;
> -	ctx->phys = 0;
> -	ctx->size = 0;
> +	dma_free_coherent(__scm->dev, mdt_ctx->size, mdt_ctx->ptr, mdt_ctx->phys);
> +	mdt_ctx->ptr = NULL;
> +	mdt_ctx->phys = 0;
> +	mdt_ctx->size = 0;
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
>  
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 158bcd6cc85c..46a23fdefd48 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -117,8 +117,8 @@ struct qcom_pas {
>  	struct qcom_rproc_ssr ssr_subdev;
>  	struct qcom_sysmon *sysmon;
>  
> -	struct qcom_scm_pas_metadata pas_metadata;
> -	struct qcom_scm_pas_metadata dtb_pas_metadata;
> +	struct qcom_scm_pas_context *pas_ctx;
> +	struct qcom_scm_pas_context *dtb_pas_ctx;
>  };
>  
>  static void qcom_pas_segment_dump(struct rproc *rproc,
> @@ -211,9 +211,9 @@ static int qcom_pas_unprepare(struct rproc *rproc)
>  	 * auth_and_reset() was successful, but in other cases clean it up
>  	 * here.
>  	 */
> -	qcom_scm_pas_metadata_release(&pas->pas_metadata);
> +	qcom_scm_pas_metadata_release(pas->pas_ctx);
>  	if (pas->dtb_pas_id)
> -		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
> +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
>  
>  	return 0;
>  }
> @@ -239,15 +239,8 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>  			return ret;
>  		}
>  
> -		ret = qcom_mdt_pas_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
> -					pas->dtb_pas_id, pas->dtb_mem_phys,
> -					&pas->dtb_pas_metadata);
> -		if (ret)
> -			goto release_dtb_firmware;
> -
> -		ret = qcom_mdt_load_no_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
> -					    pas->dtb_mem_region, pas->dtb_mem_phys,
> -					    pas->dtb_mem_size, &pas->dtb_mem_reloc);
> +		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware, pas->dtb_firmware_name,
> +					pas->dtb_mem_region, &pas->dtb_mem_reloc);
>  		if (ret)
>  			goto release_dtb_metadata;
>  	}
> @@ -255,9 +248,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>  	return 0;
>  
>  release_dtb_metadata:
> -	qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
> -
> -release_dtb_firmware:
> +	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
>  	release_firmware(pas->dtb_firmware);
>  
>  	return ret;
> @@ -305,14 +296,8 @@ static int qcom_pas_start(struct rproc *rproc)
>  		}
>  	}
>  
> -	ret = qcom_mdt_pas_init(pas->dev, pas->firmware, rproc->firmware, pas->pas_id,
> -				pas->mem_phys, &pas->pas_metadata);
> -	if (ret)
> -		goto disable_px_supply;
> -
> -	ret = qcom_mdt_load_no_init(pas->dev, pas->firmware, rproc->firmware,
> -				    pas->mem_region, pas->mem_phys, pas->mem_size,
> -				    &pas->mem_reloc);
> +	ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
> +				pas->mem_region, &pas->dtb_mem_reloc);
>  	if (ret)
>  		goto release_pas_metadata;
>  
> @@ -332,9 +317,9 @@ static int qcom_pas_start(struct rproc *rproc)
>  		goto release_pas_metadata;
>  	}
>  
> -	qcom_scm_pas_metadata_release(&pas->pas_metadata);
> +	qcom_scm_pas_metadata_release(pas->pas_ctx);
>  	if (pas->dtb_pas_id)
> -		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
> +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
>  
>  	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
>  	pas->firmware = NULL;
> @@ -342,9 +327,9 @@ static int qcom_pas_start(struct rproc *rproc)
>  	return 0;
>  
>  release_pas_metadata:
> -	qcom_scm_pas_metadata_release(&pas->pas_metadata);
> +	qcom_scm_pas_metadata_release(pas->pas_ctx);
>  	if (pas->dtb_pas_id)
> -		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
> +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
>  disable_px_supply:
>  	if (pas->px_supply)
>  		regulator_disable(pas->px_supply);
> @@ -779,12 +764,33 @@ static int qcom_pas_probe(struct platform_device *pdev)
>  	}
>  
>  	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
> +
> +	pas->pas_ctx = qcom_scm_pas_context_init(pas->dev, pas->pas_id, pas->mem_phys,
> +						 pas->mem_size);
> +	if (IS_ERR(pas->pas_ctx)) {
> +		ret = PTR_ERR(pas->pas_ctx);
> +		goto remove_ssr_sysmon;
> +	}
> +
> +	pas->dtb_pas_ctx = qcom_scm_pas_context_init(pas->dev, pas->dtb_pas_id,
> +						     pas->dtb_mem_phys, pas->dtb_mem_size);
> +	if (IS_ERR(pas->dtb_pas_ctx)) {
> +		ret = PTR_ERR(pas->dtb_pas_ctx);
> +		goto destroy_pas_ctx;
> +	}
> +
>  	ret = rproc_add(rproc);
>  	if (ret)
> -		goto remove_ssr_sysmon;
> +		goto destroy_dtb_pas_ctx;
>  
>  	return 0;
>  
> +destroy_dtb_pas_ctx:
> +	qcom_scm_pas_context_destroy(pas->dtb_pas_ctx);
> +
> +destroy_pas_ctx:
> +	qcom_scm_pas_context_destroy(pas->pas_ctx);
> +
>  remove_ssr_sysmon:
>  	qcom_remove_ssr_subdev(rproc, &pas->ssr_subdev);
>  	qcom_remove_sysmon_subdev(pas->sysmon);
> @@ -807,6 +813,8 @@ static void qcom_pas_remove(struct platform_device *pdev)
>  {
>  	struct qcom_pas *pas = platform_get_drvdata(pdev);
>  
> +	qcom_scm_pas_context_destroy(pas->dtb_pas_ctx);
> +	qcom_scm_pas_context_destroy(pas->pas_ctx);
>  	rproc_del(pas->rproc);
>  
>  	qcom_q6v5_deinit(&pas->q6v5);
> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> index 31855836b251..105a44f42ba7 100644
> --- a/drivers/soc/qcom/mdt_loader.c
> +++ b/drivers/soc/qcom/mdt_loader.c
> @@ -234,13 +234,13 @@ EXPORT_SYMBOL_GPL(qcom_mdt_read_metadata);
>   * @fw_name:	name of the firmware, for construction of segment file names
>   * @pas_id:	PAS identifier
>   * @mem_phys:	physical address of allocated memory region
> - * @ctx:	PAS metadata context, to be released by caller
> + * @ctx:	PAS context, ctx->metadata to be released by caller
>   *
>   * Returns 0 on success, negative errno otherwise.
>   */
>  int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
>  		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
> -		      struct qcom_scm_pas_metadata *ctx)
> +		      struct qcom_scm_pas_context *ctx)
>  {
>  	const struct elf32_phdr *phdrs;
>  	const struct elf32_phdr *phdr;
> @@ -505,8 +505,7 @@ int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *f
>  {
>  	int ret;
>  
> -	ret = qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys,
> -				ctx->metadata);
> +	ret = qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys, ctx);
>  	if (ret)
>  		return ret;
>  
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> index e82fdc200df7..af6ab837ad5a 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -84,8 +84,8 @@ void *qcom_scm_pas_context_init(struct device *dev, u32 pas_id, phys_addr_t mem_
>  				size_t mem_size);
>  void qcom_scm_pas_context_destroy(struct qcom_scm_pas_context *ctx);
>  int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
> -			    struct qcom_scm_pas_metadata *ctx);
> -void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);
> +			    struct qcom_scm_pas_context *ctx);
> +void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx);
>  int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
>  int qcom_scm_pas_auth_and_reset(u32 pas_id);
>  int qcom_scm_pas_shutdown(u32 pas_id);
> diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
> index 2832e0717729..7d57746fbbfa 100644
> --- a/include/linux/soc/qcom/mdt_loader.h
> +++ b/include/linux/soc/qcom/mdt_loader.h
> @@ -10,7 +10,6 @@
>  
>  struct device;
>  struct firmware;
> -struct qcom_scm_pas_metadata;
>  struct qcom_scm_pas_context;
>  
>  #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
> @@ -18,7 +17,7 @@ struct qcom_scm_pas_context;
>  ssize_t qcom_mdt_get_size(const struct firmware *fw);
>  int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
>  		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
> -		      struct qcom_scm_pas_metadata *pas_metadata_ctx);
> +		      struct qcom_scm_pas_context *pas_ctx);
>  int qcom_mdt_load(struct device *dev, const struct firmware *fw,
>  		  const char *fw_name, int pas_id, void *mem_region,
>  		  phys_addr_t mem_phys, size_t mem_size,
> @@ -43,7 +42,7 @@ static inline ssize_t qcom_mdt_get_size(const struct firmware *fw)
>  
>  static inline int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
>  				    const char *fw_name, int pas_id, phys_addr_t mem_phys,
> -				    struct qcom_scm_pas_metadata *pas_metadata_ctx)
> +				    struct qcom_scm_pas_context *pas_ctx)
>  {
>  	return -ENODEV;
>  }
> 
> -- 
> 2.50.1
> 

-- 
மணிவண்ணன் சதாசிவம்

