Return-Path: <linux-arm-msm+bounces-76266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A57A1BC2BCE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 23:23:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 52D9B34F55F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 21:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A83246BA8;
	Tue,  7 Oct 2025 21:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ihzs86AC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3288C22D7B0;
	Tue,  7 Oct 2025 21:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759872233; cv=none; b=BA4uXJZJI0A4STOtI5YNMFeJxRUEfS6w7Ws7Fl07iuniBMJZeoiJasfQqxD+UVUKTuPrkEaEMrO2xLQ7LNI1/n6jRtM3Wwe4tydK4eT4r2qsCl4ff2bBRo05oVOTEKnN9DAkR4zCIB9mj65MP9SdS1iClqaydAtwktFLvifgYG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759872233; c=relaxed/simple;
	bh=69ijyAfCBhCy/la9cHmNgArv/3+e/aGmt2iZx0hPf7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZoWmtDifUZvCMMnAqBQext9+/Cm21xaV9n8PHj8BAvNL0meiAcDCu/C5fzczqrp2tDM252C2+SVO+4u9GvcC7eVvP1OOUZsTAGCfx162MptZ40cfNL+5tseIeYY7tU3GQ4SwrlY19WWbLNVbZuBLMEk+Y5A0kS3j8jDH7j6ZmCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ihzs86AC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D10C4CEF1;
	Tue,  7 Oct 2025 21:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759872232;
	bh=69ijyAfCBhCy/la9cHmNgArv/3+e/aGmt2iZx0hPf7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ihzs86ACQTys3AFYZDF/woXhVgBudJbYjWSpG3zuh7hYMjOTgBRXq5MdJW7icwT4D
	 v0oFfyROyqaLETti60zZex3garuSylq/4tnEXgJKQATDWmpWwXdlEVF3K5I44xQuvH
	 IjFqXPiA0n2EkwLY1RJRVbn4UfViGKmfO4FypSG0vZWjjZPF0/bF2B67ViEXE1Rd1O
	 JbVAyETIjquby/koMb8FIVj6TBt/I/rUpsXl/0y2Ilna+15NIbb1G87Ic/WaZo+K3A
	 DFFkW82aw9H0eNy2owDfgLSEOndkIATLn1oL8WacnPhueALufFTVvodz3Gml9A7e0C
	 Dz4KvPmxSV/Hg==
Date: Tue, 7 Oct 2025 14:23:51 -0700
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 03/12] firmware: qcom_scm: Introduce PAS context
 initialization and destroy helper
Message-ID: <qqjynnzjhpe6elglh3xb4ghbtesfkr4ssxyq5flhcy7a5jp6ym@3viy7jyesamq>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-3-de841623af3c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251007-kvm_rprocv4_next-20251007-v4-3-de841623af3c@oss.qualcomm.com>

On Tue, Oct 07, 2025 at 10:18:48PM +0530, Mukesh Ojha wrote:
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
> Add PAS context data structure and helper functions to initialize and
> destroy it.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c       | 54 ++++++++++++++++++++++++++++++++++
>  include/linux/firmware/qcom/qcom_scm.h | 11 +++++++
>  2 files changed, 65 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 3379607eaf94..b8ce4fc34dbe 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -558,6 +558,60 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
>  		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
>  }
>  
> +/**
> + * qcom_scm_pas_context_init() - Initialize peripheral authentication service
> + *				 context for a given peripheral and it can be
> + *				 destroyed with qcom_scm_pas_context_destroy()
> + *				 to release the context
> + *
> + * @dev:	  PAS firmware device
> + * @pas_id:	  peripheral authentication service id
> + * @mem_phys:	  Subsystem reserve memory start address
> + * @mem_size:	  Subsystem reserve memory size
> + *
> + * Upon successful, returns the PAS context or ERR_PTR() of the error otherwise.
> + */
> +void *qcom_scm_pas_context_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
> +				size_t mem_size)
> +{
> +	struct qcom_scm_pas_context *ctx;
> +
> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ctx->dev = dev;
> +	ctx->pas_id = pas_id;
> +	ctx->mem_phys = mem_phys;
> +	ctx->mem_size = mem_size;
> +
> +	ctx->metadata = kzalloc(sizeof(*ctx->metadata), GFP_KERNEL);
> +	if (!ctx->metadata) {
> +		kfree(ctx);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	return ctx;
> +}
> +EXPORT_SYMBOL_GPL(qcom_scm_pas_context_init);
> +
> +/**
> + * qcom_scm_pas_context_destroy() - release PAS context
> + *
> + * @ctx:	PAS context
> + */
> +void qcom_scm_pas_context_destroy(struct qcom_scm_pas_context *ctx)
> +{
> +	kfree(ctx->metadata);
> +	ctx->metadata = NULL;
> +	ctx->dev = NULL;
> +	ctx->pas_id = 0;
> +	ctx->mem_phys = 0;
> +	ctx->mem_size = 0;

Why do you need to zero initialize these fields before freeing? Are they
carrying any sensitive data that warrants zero initialization?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

