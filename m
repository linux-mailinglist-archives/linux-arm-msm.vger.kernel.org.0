Return-Path: <linux-arm-msm+bounces-76269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9CDBC2C31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 23:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA4023E1C01
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 21:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B422522BA;
	Tue,  7 Oct 2025 21:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WluchkVM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7EA24676C;
	Tue,  7 Oct 2025 21:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759873062; cv=none; b=PDH6Uuee4R+rYsYqn+fnp8GEcC/Up4g04sA2RSRR/lVUCF51Jg8hiAiV4Fkiv1H0DW3kNexQYrJ3XqcIRldGg5zk8ybVrQ2WiAWw6tVxNUiL/tkety6qb1j29d5kf8c+Gg/6zyDbOmfInzgVcEncifl3kfA8xsiJx54wftznzS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759873062; c=relaxed/simple;
	bh=mVzY1I+ol36+2mhFwo0Zu60YnowWxzQUdxoPsbySwr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XM6qqUFy+qAySWaQ5svoZaOdjIH3B/ybBF1NbX391ob9hOEESqqXdQ4Vqb+qtxPB4CgVBXT0jmkqrLRVkcg8XRwycLDBcmgvoTKGPzC9HB7jI1YV+JlL4OrJVUBKDUfjJqdRseV+klaoNeAJ30nrTcbNLfbgO3KAwiFu0r0n/Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WluchkVM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093A4C4CEF1;
	Tue,  7 Oct 2025 21:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759873061;
	bh=mVzY1I+ol36+2mhFwo0Zu60YnowWxzQUdxoPsbySwr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WluchkVMNWSDwxHbEqVjWBtDz9GvgHQ8P6JaSBI5bpHIq/fN2nW5zZnE5WP/Zu163
	 Uxv6Qe0jSRwz8cBeAWTebGhcxOEroJc2X6/fjI4Kxl0LSIGMxgCUotRneUWHYqw9FH
	 yBak66pPhEmExfAlxcgHGEaOpobTtg6YxEGwNdyWh2Tgc+mfTUR2Azl2Wvj7IYCwY4
	 2aZGknKujayuJp8PpiFv8f78TSbDMzcjnxQzPgezYyag1w0qmee1C0OAzBOXXEOwKR
	 B2CtdKwk/V8bhiK5d8FbBkU+9uOQyj2yMdCr/j/bi6eIwtmeGy0dpoHgwAH3O5uQGB
	 hbc8iadhv2jtg==
Date: Tue, 7 Oct 2025 14:37:40 -0700
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/12] firmware: qcom_scm: Add a prep version of
 auth_and_reset function
Message-ID: <juirzpdb7ltx32fdiu37q3fd543fctvtssnro5qv4satninz2z@3bxup227lvvy>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-6-de841623af3c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251007-kvm_rprocv4_next-20251007-v4-6-de841623af3c@oss.qualcomm.com>

On Tue, Oct 07, 2025 at 10:18:51PM +0530, Mukesh Ojha wrote:
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
> index 7b4ff3cb26ed..ab2543d44097 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -791,6 +791,54 @@ int qcom_scm_pas_auth_and_reset(u32 pas_id)
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
> +	 * When Linux runs @ EL2 Linux must create the shmbridge itself and then
> +	 * subsequently call TrustZone for authenticate and reset.
> +	 */
> +	ret = qcom_tzmem_shm_bridge_create(ctx->mem_phys, ctx->mem_size, &handle);
> +	if (ret) {
> +		dev_err(__scm->dev, "Failed to create shmbridge ret=%d %u\n",

	"Failed to create shmbridge for PAS ID (%u): %d\n"

> +			ret, ctx->pas_id);
> +		return ret;
> +	}
> +
> +	ret = qcom_scm_pas_auth_and_reset(ctx->pas_id);
> +	qcom_tzmem_shm_bridge_delete(handle);
> +
> +	return ret;

	return 0;

- Mani

-- 
மணிவண்ணன் சதாசிவம்

