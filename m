Return-Path: <linux-arm-msm+bounces-84526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AB3CA987D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 23:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D97E309AA48
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 22:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603C62E8DEC;
	Fri,  5 Dec 2025 22:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rpAgb+C3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F5339FCE;
	Fri,  5 Dec 2025 22:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764974654; cv=none; b=Uaj0jBte1KDeqf79nvxCHbrQemNG8aCvhse/9YkNBLIvCDN2myDZe9WRQoprM+IKvMS/b6lQwX5+JJ3KOx/ORN9aOLA/cGskFE+pbQZOLPlrHdCL+mNfyueUGUGESJEQoS2a/hKjmXaQb2IB8PPeXUj6zh1wTiaxBsBJe9x1W24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764974654; c=relaxed/simple;
	bh=SfMTlrnwvly/vkxH6ONkFIT0K1p6Gzas0t4LGNc9lRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=daUjwc1aD5XdRXAd8EzD2H4cm/HOu/FrRz8vlirEdgnxkugfAGsnelTU63cyhdWJOK+WFON2ve2+2BHuaqzjBblHLiX1tOvam9Tl35kKktNAaCpJduq7IQ3GytsLJ6UCgC6x0iJ8L53P7EO0zvotVEe+goIIbNDu9oDI0xrctxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rpAgb+C3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9055C4CEF1;
	Fri,  5 Dec 2025 22:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764974654;
	bh=SfMTlrnwvly/vkxH6ONkFIT0K1p6Gzas0t4LGNc9lRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rpAgb+C3vQq14dSFLrodznTb61jSWdjuZYuUIkwgdaQN4XN/Is/lh60MdSMlXVLZq
	 j1GPgIl1W+yhe6+4QQ4/VOR9xmGcDTvo1p1FlqeQQzIy76HxK1Ry/lp+Z/VkHwqyJN
	 uX8hg/ljxMmFQfX2j0ppJzqmC91oNMjCpV0a72vTFU36ZzcQB0qN248yr2TerwYV6U
	 p99yphRoWvpgiPq+jeJIhRBvNIff+IjE6OLtN67Qr4hrggwnRapLgg3eoIMZLW8k0z
	 SjDDsNB6xoWBWn/C8Cb5vy6AcsTVwdHava6sB2lWDENIhhY8B3Erh6IvkUC5qvqln/
	 WS2LZhnl8EXFg==
Date: Fri, 5 Dec 2025 16:50:32 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 08/14] firmware: qcom_scm: Add a prep version of
 auth_and_reset function
Message-ID: <ghladclj5xqlw3gzrleclkxk6cn4vhosfillx3wfgbf2tbe4iy@kgjzgg7j5gzh>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <20251121-kvm_rproc_v8-v8-8-8e8e9fb0eca0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121-kvm_rproc_v8-v8-8-8e8e9fb0eca0@oss.qualcomm.com>

On Fri, Nov 21, 2025 at 04:31:10PM +0530, Mukesh Ojha wrote:
> For memory passed to TrustZone (TZ), it must either be part of a pool
> registered with TZ or explicitly registered via SHMbridge SMC calls.
> When Gunyah hypervisor is present, PAS SMC calls from Linux running at
> EL1 are trapped by Gunyah running @ EL2, which handles SHMbridge
> creation for both metadata and remoteproc carveout memory before
> invoking the calls to TZ.
> 
> On SoCs running with a non-Gunyah-based hypervisor, Linux must take
> responsibility for creating the SHM bridge before invoking PAS SMC
> calls. For the auth_and_reset() call, the remoteproc carveout memory
> must first be registered with TZ via a SHMbridge SMC call and once
> authentication and reset are complete, the SHMbridge memory can be
> deregistered.
> 
> Introduce qcom_scm_pas_prepare_and_auth_reset(), which sets up the SHM
> bridge over the remoteproc carveout memory when Linux operates at EL2.
> This behavior is indicated by a new field added to the PAS context data
> structure. The function then invokes the auth_and_reset SMC call.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c       | 48 ++++++++++++++++++++++++++++++++++
>  include/linux/firmware/qcom/qcom_scm.h |  2 ++
>  2 files changed, 50 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 5fa974683ee0..fdb736d839db 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -765,6 +765,54 @@ int qcom_scm_pas_auth_and_reset(u32 pas_id)
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
>  
> +/**
> + * qcom_scm_pas_prepare_and_auth_reset() - Prepare, authenticate, and reset the
> + *					   remote processor
> + *
> + * @ctx:	Context saved during call to qcom_scm_pas_context_init()
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
> +int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx)
> +{
> +	u64 handle;
> +	int ret;
> +
> +	if (!ctx->has_iommu)
> +		return qcom_scm_pas_auth_and_reset(ctx->pas_id);
> +
> +	/*
> +	 * When Linux running @ EL1, Gunyah hypervisor running @ EL2 traps the
> +	 * auth_and_reset call and create an shmbridge on the remote subsystem
> +	 * memory region and then invokes a call to TrustZone to authenticate.

The above three lines explain why we take the path above, and the next
two lines explains why we didn't.

So I think it would be better to move the above 3 lines above the
!has_iommu, and just keep the two here.

> +	 * When Linux runs @ EL2 Linux must create the shmbridge itself and then
> +	 * subsequently call TrustZone for authenticate and reset.
> +	 */
> +	ret = qcom_tzmem_shm_bridge_create(ctx->mem_phys, ctx->mem_size, &handle);
> +	if (ret) {
> +		dev_err(__scm->dev, "Failed to create shmbridge for PAS ID (%u): %d\n",
> +			ctx->pas_id, ret);

We already print an error in qcom_tzmem_shm_bridge_create() and we print
another one in qcom_pas_start(), so I think we can omit this one.

Regards,
Bjorn

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
>  /**
>   * qcom_scm_pas_shutdown() - Shut down the remote processor
>   * @pas_id:	peripheral authentication service id
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> index b10b1aeb32c6..ccb8b2e42237 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -74,6 +74,7 @@ struct qcom_scm_pas_context {
>  	void *ptr;
>  	dma_addr_t phys;
>  	ssize_t size;
> +	bool has_iommu;
>  };
>  
>  struct qcom_scm_pas_context *devm_qcom_scm_pas_context_init(struct device *dev,
> @@ -87,6 +88,7 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
>  int qcom_scm_pas_auth_and_reset(u32 pas_id);
>  int qcom_scm_pas_shutdown(u32 pas_id);
>  bool qcom_scm_pas_supported(u32 pas_id);
> +int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx);
>  
>  int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
>  int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);
> 
> -- 
> 2.50.1
> 

