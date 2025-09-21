Return-Path: <linux-arm-msm+bounces-74377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E87B8E867
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 00:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48FEB16C7F7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 22:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03015253359;
	Sun, 21 Sep 2025 22:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ixnAr8KK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D7E2857FA;
	Sun, 21 Sep 2025 22:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758492901; cv=none; b=CRF6uJ4tRYbKr0xZDiGRIPTaNQx9CTx6irJW4j2a9gMdpmSr9YlD2FxY6ugmOi1wBOMdsm7B2ssxd17DvVLwVdrh5UIFM/4NqksBQd7lyKV3CrTlt0Jirlrd+d8YEvHfE/Hrmqa9Fr16JejKDuhzAAYN2zMPEwfZ3dhl3D07vDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758492901; c=relaxed/simple;
	bh=FWsP+1Qbixet1w7C8wLBcLuwCOkBhkHcQUWhKaNmR2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mEAJ7qt1+YD0EATkzmhDAts6NKKSqf33PQ4EaENKOLKKICdhZ5UtAIpNpZlGXfxPT0oHitbjlJ8GxkdmtwVE8a2JetBeXCvOB6sWz7odx0bmNuzeE+GVcjZe2o58SO8r4scK54e2yxnvysRwzhggtxi+DU2nQqsKuXWJh0RxWKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixnAr8KK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DCBEC4CEE7;
	Sun, 21 Sep 2025 22:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758492901;
	bh=FWsP+1Qbixet1w7C8wLBcLuwCOkBhkHcQUWhKaNmR2E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ixnAr8KKqH2EcNvaWp0YRqxtEvLOyHL6MwaQyn2TE0uahSahZwq5eOYXOM5Ql38q+
	 Nij3JzVH1pYVVFOov8m4f3emWbe5304b6P8doP7yDaTmmomimd0+6tgBzdrDeVOWg7
	 ClS6J+1I6bClpsjwu195XVenH86cb479DBSEMSsUydFVeFE19LVtYwnE2PeBuuBpJQ
	 mUfDk4ukM4DHjkUtqIMvqoY4amnyKjK+WJM9SrKp/9upMQ6EQ4U6eyb4WxhX+KPyL3
	 ggYudOq6rtXu4WrZJWRWYqmaUjZ3ULkHS6peiAwuMs5Bfjj0N72W7ngJgEECa4ZIQv
	 E9tg8rbviDLAw==
Message-ID: <8d9338dd-86da-4e40-8d0e-4431896e65eb@kernel.org>
Date: Sun, 21 Sep 2025 23:14:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/12] remoteproc: pas: Use PAS context awareness in
 smc and mdt functions
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
 <pr18fQ8x6XmfMDmz4vwZRIjSBKG85N5bhtUXB5qzFCWU3kqA6z6AUojPaPK_bZjgJG5yuj9LQnhF8uS7oyveDQ==@protonmail.internalid>
 <20250921-kvm_rproc_pas-v3-5-458f09647920@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20250921-kvm_rproc_pas-v3-5-458f09647920@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/09/2025 20:41, Mukesh Ojha wrote:

I think this patch title should say "Use PAS context handle" or "context 
pointer" also should SMC and MDT be higher case ?
 > Since, we have introduced PAS context data structure to better handle

"We have introduced a PAS context data-structure struct qcom_scm_pas_ctx 
which facilitates running both with and without the Gunywayh hypervisor. 
Convert to using "

> the code when SoC run with Gunyah or in absence. Let's put these
> awareness in some of SMC and meta data functions and replace metadata
> context as PAS context structure is superset and will help in unifying
> remoteproc and non-remoteproc subsystem uses same set of functions for
> Secure PAS method.

"Convert methods and code to using struct qcom_scm_pas_ctx * where 
necessary"

> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>   drivers/firmware/qcom/qcom_scm.c       | 32 +++++++++--------
>   drivers/remoteproc/qcom_q6v5_pas.c     | 66 +++++++++++++++++++---------------
>   drivers/soc/qcom/mdt_loader.c          |  6 ++--
>   include/linux/firmware/qcom/qcom_scm.h |  4 +--
>   include/linux/soc/qcom/mdt_loader.h    |  5 ++-
>   5 files changed, 62 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 1c6b4c6f5513..917341308873 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -620,7 +620,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_destroy);
>    *		and optional blob of data used for authenticating the metadata
>    *		and the rest of the firmware
>    * @size:	size of the metadata
> - * @ctx:	optional metadata context
> + * @ctx:	optional pas context
>    *
>    * Return: 0 on success.
>    *
> @@ -629,8 +629,9 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_destroy);
>    * qcom_scm_pas_metadata_release() by the caller.
>    */
>   int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
> -			    struct qcom_scm_pas_metadata *ctx)
> +			    struct qcom_scm_pas_ctx *ctx)
>   {
> +	struct qcom_scm_pas_metadata *mdt_ctx;
>   	dma_addr_t mdata_phys;
>   	void *mdata_buf;
>   	int ret;
> @@ -681,10 +682,11 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
>   out:
>   	if (ret < 0 || !ctx) {
>   		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
> -	} else if (ctx) {
> -		ctx->ptr = mdata_buf;
> -		ctx->phys = mdata_phys;
> -		ctx->size = size;
> +	} else if (ctx && ctx->metadata) {
> +		mdt_ctx = ctx->metadata;
> +		mdt_ctx->ptr = mdata_buf;
> +		mdt_ctx->phys = mdata_phys;
> +		mdt_ctx->size = size;
>   	}
> 
>   	return ret ? : res.result[0];
> @@ -693,18 +695,20 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_init_image);
> 
>   /**
>    * qcom_scm_pas_metadata_release() - release metadata context
> - * @ctx:	metadata context
> + * @ctx:	pas context
>    */
> -void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
> +void qcom_scm_pas_metadata_release(struct qcom_scm_pas_ctx *ctx)
>   {
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
>   }
>   EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 55a7da801183..ad87e0334a7d 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -115,8 +115,8 @@ struct qcom_pas {
>   	struct qcom_rproc_ssr ssr_subdev;
>   	struct qcom_sysmon *sysmon;
> 
> -	struct qcom_scm_pas_metadata pas_metadata;
> -	struct qcom_scm_pas_metadata dtb_pas_metadata;
> +	struct qcom_scm_pas_ctx *pas_ctx;
> +	struct qcom_scm_pas_ctx *dtb_pas_ctx;
>   };
> 
>   static void qcom_pas_segment_dump(struct rproc *rproc,
> @@ -209,9 +209,9 @@ static int qcom_pas_unprepare(struct rproc *rproc)
>   	 * auth_and_reset() was successful, but in other cases clean it up
>   	 * here.
>   	 */
> -	qcom_scm_pas_metadata_release(&pas->pas_metadata);
> +	qcom_scm_pas_metadata_release(pas->pas_ctx);
>   	if (pas->dtb_pas_id)
> -		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
> +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> 
>   	return 0;
>   }
> @@ -235,15 +235,8 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>   			return ret;
>   		}
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
>   		if (ret)
>   			goto release_dtb_metadata;
>   	}
> @@ -251,9 +244,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>   	return 0;
> 
>   release_dtb_metadata:
> -	qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
> -
> -release_dtb_firmware:
> +	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
>   	release_firmware(pas->dtb_firmware);
> 
>   	return ret;
> @@ -301,14 +292,8 @@ static int qcom_pas_start(struct rproc *rproc)
>   		}
>   	}
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
>   	if (ret)
>   		goto release_pas_metadata;
> 
> @@ -328,9 +313,9 @@ static int qcom_pas_start(struct rproc *rproc)
>   		goto release_pas_metadata;
>   	}
> 
> -	qcom_scm_pas_metadata_release(&pas->pas_metadata);
> +	qcom_scm_pas_metadata_release(pas->pas_ctx);
>   	if (pas->dtb_pas_id)
> -		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
> +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> 
>   	/* firmware is used to pass reference from qcom_pas_start(), drop it now */
>   	pas->firmware = NULL;
> @@ -338,9 +323,9 @@ static int qcom_pas_start(struct rproc *rproc)
>   	return 0;
> 
>   release_pas_metadata:
> -	qcom_scm_pas_metadata_release(&pas->pas_metadata);
> +	qcom_scm_pas_metadata_release(pas->pas_ctx);
>   	if (pas->dtb_pas_id)
> -		qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
> +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
>   disable_px_supply:
>   	if (pas->px_supply)
>   		regulator_disable(pas->px_supply);
> @@ -774,12 +759,33 @@ static int qcom_pas_probe(struct platform_device *pdev)
>   	}
> 
>   	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
> +
> +	pas->pas_ctx = qcom_scm_pas_ctx_init(pas->dev, pas->pas_id, pas->mem_phys,
> +					     pas->mem_size);
> +	if (IS_ERR(pas->pas_ctx)) {
> +		ret = PTR_ERR(pas->pas_ctx);
> +		goto remove_ssr_sysmon;
> +	}
> +
> +	pas->dtb_pas_ctx = qcom_scm_pas_ctx_init(pas->dev, pas->dtb_pas_id,
> +						 pas->dtb_mem_phys, pas->dtb_mem_size);
> +	if (IS_ERR(pas->dtb_pas_ctx)) {
> +		ret = PTR_ERR(pas->dtb_pas_ctx);
> +		goto destroy_pas_ctx;
> +	}
> +
>   	ret = rproc_add(rproc);
>   	if (ret)
> -		goto remove_ssr_sysmon;
> +		goto destroy_dtb_pas_ctx;
> 
>   	return 0;
> 
> +destroy_dtb_pas_ctx:
> +	qcom_scm_pas_ctx_destroy(pas->dtb_pas_ctx);
> +
> +destroy_pas_ctx:
> +	qcom_scm_pas_ctx_destroy(pas->pas_ctx);
> +
>   remove_ssr_sysmon:
>   	qcom_remove_ssr_subdev(rproc, &pas->ssr_subdev);
>   	qcom_remove_sysmon_subdev(pas->sysmon);
> @@ -802,6 +808,8 @@ static void qcom_pas_remove(struct platform_device *pdev)
>   {
>   	struct qcom_pas *pas = platform_get_drvdata(pdev);
> 
> +	qcom_scm_pas_ctx_destroy(pas->dtb_pas_ctx);
> +	qcom_scm_pas_ctx_destroy(pas->pas_ctx);
>   	rproc_del(pas->rproc);
> 
>   	qcom_q6v5_deinit(&pas->q6v5);
> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> index 2ef079797f05..24da6e49b2ad 100644
> --- a/drivers/soc/qcom/mdt_loader.c
> +++ b/drivers/soc/qcom/mdt_loader.c
> @@ -234,13 +234,13 @@ EXPORT_SYMBOL_GPL(qcom_mdt_read_metadata);
>    * @fw_name:	name of the firmware, for construction of segment file names
>    * @pas_id:	PAS identifier
>    * @mem_phys:	physical address of allocated memory region
> - * @ctx:	PAS metadata context, to be released by caller
> + * @ctx:	PAS context, ctx->metadata to be released by caller
>    *
>    * Returns 0 on success, negative errno otherwise.
>    */
>   int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
>   		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
> -		      struct qcom_scm_pas_metadata *ctx)
> +		      struct qcom_scm_pas_ctx *ctx)

I think the ctx abbreviation is an informational regression

"struct qcom_scm_pas_context *ctx"

We are converting from a structure which tells me by way of its name 
that it contains pas metadata to a structure that tells me by way of its 
name that it contains pas ctx.

Hmm far more informative to give the structure some vowels we can 
abbreviate the variable names galore.

struct qcom_scm_pas_context {}; please

>   {
>   	const struct elf32_phdr *phdrs;
>   	const struct elf32_phdr *phdr;
> @@ -492,7 +492,7 @@ int qcom_mdt_pas_load(struct qcom_scm_pas_ctx *ctx, const struct firmware *fw,
>   	int ret;
> 
>   	ret = qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id,
> -				  ctx->mem_phys, ctx->metadata);
> +				  ctx->mem_phys, ctx);
>   	if (ret)
>   		return ret;
> 
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> index e3e9e9e9077f..9ca3218f0948 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -84,8 +84,8 @@ void *qcom_scm_pas_ctx_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys
>   			    size_t mem_size);
>   void qcom_scm_pas_ctx_destroy(struct qcom_scm_pas_ctx *ctx);
>   int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
> -			    struct qcom_scm_pas_metadata *ctx);
> -void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);
> +			    struct qcom_scm_pas_ctx *ctx);
> +void qcom_scm_pas_metadata_release(struct qcom_scm_pas_ctx *ctx);
>   int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
>   int qcom_scm_pas_auth_and_reset(u32 pas_id);
>   int qcom_scm_pas_shutdown(u32 pas_id);
> diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
> index 36b8b331ce5f..ce2346b66af6 100644
> --- a/include/linux/soc/qcom/mdt_loader.h
> +++ b/include/linux/soc/qcom/mdt_loader.h
> @@ -10,7 +10,6 @@
> 
>   struct device;
>   struct firmware;
> -struct qcom_scm_pas_metadata;
>   struct qcom_scm_pas_ctx;
> 
>   #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
> @@ -18,7 +17,7 @@ struct qcom_scm_pas_ctx;
>   ssize_t qcom_mdt_get_size(const struct firmware *fw);
>   int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
>   		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
> -		      struct qcom_scm_pas_metadata *pas_metadata_ctx);
> +		      struct qcom_scm_pas_ctx *pas_ctx);
>   int qcom_mdt_load(struct device *dev, const struct firmware *fw,
>   		  const char *fw_name, int pas_id, void *mem_region,
>   		  phys_addr_t mem_phys, size_t mem_size,
> @@ -43,7 +42,7 @@ static inline ssize_t qcom_mdt_get_size(const struct firmware *fw)
> 
>   static inline int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
>   				    const char *fw_name, int pas_id, phys_addr_t mem_phys,
> -				    struct qcom_scm_pas_metadata *pas_metadata_ctx)
> +				    struct qcom_scm_pas_ctx *pas_ctx)
>   {
>   	return -ENODEV;
>   }
> 
> --
> 2.50.1
> 
> 


