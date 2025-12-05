Return-Path: <linux-arm-msm+bounces-84525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 158A5CA986E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 23:40:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71C19312425F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 22:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A9A2E7F0B;
	Fri,  5 Dec 2025 22:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqghrcSE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4338F277C9D;
	Fri,  5 Dec 2025 22:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764974332; cv=none; b=tCwt8KGf8Xb8BnkHXI/wmVQHqNF1chyr3UtPBoEdoI/pFJbQeaFtDycstOagZi6diI9WAWRTDDpWq+aVA1cdafFgQr7ZcUyzRU2IAR9ZyagqSXP21H0g1ca0dROH/lcyyY/z4xQ5nHzX4yJ357F0+r18sAW7FolWZ4eBlnCzib8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764974332; c=relaxed/simple;
	bh=GsAWgcmcBdDUvM9bPja3eU7qhvdsGz3cjt2fil1+uRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNK9GFViJoJD3BjNlYdIQbC4HurRLg5/G3LixFE4Qmt/IZI55Ay2/VxK59pYOMLBoiu91p+T9ZxXhRVvgtnl6VkxY5BH1FAUghaQBd9fzSrOzSjAS5LRl7hfa0J0+OXzP04aehtj/cTzVrmDnuHPB0+GayvVXNQY2OcNfUsuIEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqghrcSE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FB1BC4CEF1;
	Fri,  5 Dec 2025 22:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764974331;
	bh=GsAWgcmcBdDUvM9bPja3eU7qhvdsGz3cjt2fil1+uRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iqghrcSELPEg2OBRCBrgiNwFvhnEx3z/NO6M1vIWozjQ3DwTY7Lr/TvS61E0WE4OE
	 gKV2fLNYxbfVsF2qYR4Ypz36b22HA63YxbsqD6furOHLgCWlnUmYBkefBCNkJcjNjt
	 mU6ZTHtv/xeHXA5ZkZRMOVKxCLMd9iVp46sQeMyb5iQlp9uTJZ8evIIXicNEMpdo32
	 SgYxlnj0yICiqpopNperfTzcwkS4U7nz/s9P0QOWk0pgU4gd1zUAd/4m4FHu5t9TfM
	 yi4GxSi5tZMmDn+eOdu8A2ZDuv6ORL0YVPadX+w/AUFyd07C8EEn1Tt8oJuLZx2xES
	 YDlxraYJfFptA==
Date: Fri, 5 Dec 2025 16:45:10 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 04/14] firmware: qcom_scm: Introduce PAS context
 initialization helper function
Message-ID: <rmy4ujnut2d65qxlfvdmoh5zkrzrcxtkpfdkjttfhlm45dnche@o3kd2vylonom>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <20251121-kvm_rproc_v8-v8-4-8e8e9fb0eca0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121-kvm_rproc_v8-v8-4-8e8e9fb0eca0@oss.qualcomm.com>

On Fri, Nov 21, 2025 at 04:31:06PM +0530, Mukesh Ojha wrote:
> When the Peripheral Authentication Service (PAS) method runs on a SoC
> where Linux operates at EL2 (i.e., without the Gunyah hypervisor), the
> reset sequences are handled by TrustZone. In such cases, Linux must
> perform additional steps before invoking PAS SMC calls, such as creating
> a SHM bridge. Therefore, PAS SMC calls require awareness and handling of
> these additional steps when Linux runs at EL2.
> 
> To support this, there is a need for a data structure that can be
> initialized prior to invoking any SMC or MDT functions. This structure
> allows those functions to determine whether they are operating in the
> presence or absence of the Gunyah hypervisor and behave accordingly.
> 
> Currently, remoteproc and non-remoteproc subsystems use different
> variants of the MDT loader helper API, primarily due to differences in
> metadata context handling. Remoteproc subsystems retain the metadata
> context until authentication and reset are completed, while
> non-remoteproc subsystems (e.g., video, graphics, IPA, etc.) do not
> retain the metadata context and can free it within the
> qcom_scm_pas_init() call by passing a NULL context parameter and due to
> these differences, it is not possible to extend metadata context
> handling to support remoteproc and non remoteproc subsystem use PAS
> operations, when Linux operates at EL2.
> 
> Add PAS context data structure and initialization helper function.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c       | 34 ++++++++++++++++++++++++++++++++++
>  include/linux/firmware/qcom/qcom_scm.h | 14 ++++++++++++++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 0a0c48fca7cf..e9e9d03ea36a 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -558,6 +558,40 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
>  		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
>  }
>  
> +/**
> + * devm_qcom_scm_pas_context_init() - Initialize peripheral authentication service
> + *				      context for a given peripheral

It doesn't just initialize, it allocates it. So I think it would be
better to name this function devm_qcom_scm_pas_context_alloc().

> + *
> + * PAS context is device-resource managed, so the caller does not need
> + * to worry about freeing the context memory.
> + *
> + * @dev:	  PAS firmware device
> + * @pas_id:	  peripheral authentication service id
> + * @mem_phys:	  Subsystem reserve memory start address
> + * @mem_size:	  Subsystem reserve memory size
> + *
> + * Upon successful, returns the PAS context or ERR_PTR() of the error otherwise.

Returns: The new PAS context, or ERR_PTR() on failure.

Regards,
Bjorn

> + */
> +struct qcom_scm_pas_context *devm_qcom_scm_pas_context_init(struct device *dev,
> +							    u32 pas_id,
> +							    phys_addr_t mem_phys,
> +							    size_t mem_size)
> +{
> +	struct qcom_scm_pas_context *ctx;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ctx->dev = dev;
> +	ctx->pas_id = pas_id;
> +	ctx->mem_phys = mem_phys;
> +	ctx->mem_size = mem_size;
> +
> +	return ctx;
> +}
> +EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_init);
> +
>  /**
>   * qcom_scm_pas_init_image() - Initialize peripheral authentication service
>   *			       state machine for a given peripheral, using the
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> index a13f703b16cd..4a57fa676513 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -72,6 +72,20 @@ struct qcom_scm_pas_metadata {
>  	ssize_t size;
>  };
>  
> +struct qcom_scm_pas_context {
> +	struct device *dev;
> +	u32 pas_id;
> +	phys_addr_t mem_phys;
> +	size_t mem_size;
> +	void *ptr;
> +	dma_addr_t phys;
> +	ssize_t size;
> +};
> +
> +struct qcom_scm_pas_context *devm_qcom_scm_pas_context_init(struct device *dev,
> +							    u32 pas_id,
> +							    phys_addr_t mem_phys,
> +							    size_t mem_size);
>  int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
>  			    struct qcom_scm_pas_metadata *ctx);
>  void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);
> 
> -- 
> 2.50.1
> 

