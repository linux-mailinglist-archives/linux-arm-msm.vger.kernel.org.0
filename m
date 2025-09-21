Return-Path: <linux-arm-msm+bounces-74378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F63B8E8B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 00:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B328C3A5DD3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 22:23:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5705025DB1A;
	Sun, 21 Sep 2025 22:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gUNkmknw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2798A1805E;
	Sun, 21 Sep 2025 22:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758493426; cv=none; b=Fdbh2FBDI/mM/ycmL8UQattAsWmbRdBrRMafZL2srHdiNyP+Q2sTXSjow6ZlogS/dzhqfobxluLmupzDRTmAjrMLoEex1zHuzCwYZLYErE0gvE2sePnWwLdZ6d3lnPOh3/hGalDNHwHoPQepLyjaBKbMMj1pEv7yu7w5ZWTn8Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758493426; c=relaxed/simple;
	bh=yLUC/8eaPxJorHHRllDGSZthLNwWMC6Frp9CsadlAoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PzTbtvW1JYTabu2bJVz5BBZixQkYPz5APffsFbduMJO5mjZ4PC09uWicjAmlHe1wHlwzV59u7vA0Kxd0cEM6MLE+uC4XRu65EQZ0WYAwvgAgBhV0u14chYqU8UEXw/LGwGIV+Cp/bNptRne/1ZJwhGeaoSiCPN7NvfLuitWDLl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gUNkmknw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DBCDC4CEE7;
	Sun, 21 Sep 2025 22:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758493426;
	bh=yLUC/8eaPxJorHHRllDGSZthLNwWMC6Frp9CsadlAoc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gUNkmknwAy0iMcnCV2L4cj78qFai8fMb3bEZe3Ale2uSGBXhE7bauYmrYWBevHyPS
	 xoGghZTP2NHVzsa7zQ8ahyYTTrKTYecVeaaHeNCClSDu1dxR4Dt/GlmlUkppA0sRCH
	 AUvIOS5X/knzUwoSwHIkuJBdA4Mu4fZQYV+aMSC4MkhdJEANBCI2v5a0VDmxfDQObJ
	 OMvxN/t+d3TsPhpCo7OKJ24azQ0HoDrIG/q1lI4iZmDyxvPkoVpy+ZmL8QKmr5ApU0
	 x2wvYspFuK0gHwSsNBBLzOdsCw6GrV5yS1tvTyIgFdcrTmR2rp3KRuP89kBUw0uqSP
	 RErrr1ndecRwA==
Message-ID: <591289e2-a5e3-4941-b8d4-85edac281013@kernel.org>
Date: Sun, 21 Sep 2025 23:23:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/12] firmware: qcom_scm: Add a prep version of
 auth_and_reset function
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
 <_EY7CMwY6zRmzmm13Bo2V7im-VNhJRkSEhPkwo3PQnrA6Gxd5fVTyT_wRbBbN0VB7Nt8DKXVU88AwGEi0OYEvw==@protonmail.internalid>
 <20250921-kvm_rproc_pas-v3-6-458f09647920@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20250921-kvm_rproc_pas-v3-6-458f09647920@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/09/2025 20:41, Mukesh Ojha wrote:
> Qualcomm SoCs running with QHEE (Qualcomm Hypervisor Execution
> Environment—a library present in the Gunyah hypervisor) utilize the
> Peripheral Authentication Service (PAS) from TrustZone (TZ) firmware to
> securely authenticate and reset remote processors via a sequence of SMC
> calls such as qcom_scm_pas_init_image(), qcom_scm_pas_mem_setup(), and
> qcom_scm_pas_auth_and_reset().
> 
> For memory passed to Qualcomm TrustZone, it must either be part of a
> pool registered with TZ or be directly registered via SHMbridge SMC
> calls. When QHEE is present, PAS SMC calls from Linux running at EL1 are
> trapped by QHEE (running at EL2), which then creates or retrieves memory
> from the SHMbridge for both metadata and remoteproc carveout memory
> before passing them to TZ. However, when the SoC runs with a
> non-QHEE-based hypervisor, Linux must create the SHM bridge for both
> metadata (before it is passed to TZ in qcom_scm_pas_init_image()) and
> for remoteproc memory (before the call is made to TZ in
> qcom_scm_pas_auth_and_reset()).
> 
> For auth_and_reset() call, first it need to register remoteproc carveout
> memory with TZ via SHMbridge SMC call and then it can trigger
> auth_and_reset SMC call and once the call returns, remoteproc carveout
> memory can be deregisterd with TZ.
> 
> Add qcom_scm_pas_prepare_and_auth_reset() function which does prepare
> the SHMbridge over carveout memory and call auth_and_reset SMC call.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>   drivers/firmware/qcom/qcom_scm.c       | 46 ++++++++++++++++++++++++++++++++++
>   include/linux/firmware/qcom/qcom_scm.h |  2 ++
>   2 files changed, 48 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 917341308873..7a86b27ea666 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -790,6 +790,52 @@ int qcom_scm_pas_auth_and_reset(u32 pas_id)
>   }
>   EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
> 
> +/**
> + * qcom_scm_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the remote processor
> + *
> + * @ctx:	Context saved during call to qcom_scm_pas_ctx_init()
> + *
> + * This function performs the necessary steps to prepare a PAS subsystem,
> + * authenticate it using the provided metadata, and initiate a reset sequence.
> + *
> + * It should be used when Linux is in control setting up the IOMMU hardware
> + * for remote subsystem during secure firmware loading processes. The preparation
> + * step sets up a shmbridge over the firmware memory before TrustZone accesses the
> + * firmware memory region for authentication. The authentication step verifies
> + * the integrity and authenticity of the firmware or configuration using secure
> + * metadata. Finally, the reset step ensures the subsystem starts in a clean and
> + * sane state.
> + *
> + * Return: 0 on success, negative errno on failure.
> + */
> +int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_ctx *ctx)
> +{
> +	u64 handle;
> +	int ret;
> +
> +	if (!ctx->has_iommu)
> +		return qcom_scm_pas_auth_and_reset(ctx->pas_id);
> +
> +	/*
> +	 * When Linux running at EL1, Gunyah(EL2) traps auth_and_reset call and creates
> +	 * shmbridge on remote subsystem memory region before it passes the call to
> +	 * TrustZone to authenticate it while when Linux runs at EL2, it needs to create
> +	 * shmbridge before this call goes to TrustZone.
> +	 */

"When Linux runs @ EL1 the Hypervision Gunyah running @ EL2 traps the 
auth_and_reset call(). Gunyah create an shmbridge on the remote 
subsystem memory and then invokes a call to TrustZone to authenticate. 
When Linux runs @ EL2 Linux must create the shmbridge itself and then 
subsequently invoke TrustZone itself."

Please fix the commit log too.

> +	ret = qcom_tzmem_shm_bridge_create(ctx->mem_phys, ctx->mem_size, &handle);
> +	if (ret) {
> +		dev_err(__scm->dev, "Failed to create shmbridge ret=%d %u\n",
> +			ret, ctx->pas_id);
> +		return ret;
> +	}
> +
> +	ret = qcom_scm_pas_auth_and_reset(ctx->pas_id);
> +	qcom_tzmem_shm_bridge_delete(handle);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(qcom_scm_pas_prepare_and_auth_reset);
> +
>   /**
>    * qcom_scm_pas_shutdown() - Shut down the remote processor
>    * @pas_id:	peripheral authentication service id
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> index 9ca3218f0948..1774584ff5e3 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -78,6 +78,7 @@ struct qcom_scm_pas_ctx {
>   	phys_addr_t mem_phys;
>   	size_t mem_size;
>   	struct qcom_scm_pas_metadata *metadata;
> +	bool has_iommu;
>   };
> 
>   void *qcom_scm_pas_ctx_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
> @@ -90,6 +91,7 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
>   int qcom_scm_pas_auth_and_reset(u32 pas_id);
>   int qcom_scm_pas_shutdown(u32 pas_id);
>   bool qcom_scm_pas_supported(u32 pas_id);
> +int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_ctx *ctx);
> 
>   int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
>   int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);
> 
> --
> 2.50.1
> 
> 

---
bod

