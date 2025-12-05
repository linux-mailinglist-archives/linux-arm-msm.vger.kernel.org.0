Return-Path: <linux-arm-msm+bounces-84524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE6FCA9817
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 23:35:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 646AC312BC96
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 22:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967482C158E;
	Fri,  5 Dec 2025 22:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EJCLvTdJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA2D12B93;
	Fri,  5 Dec 2025 22:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764974073; cv=none; b=TRF58i0/J7C0itvAuxBqxaXyPM5FE+zljtF48BaojEUBPTaKaURdp3dNmzLQ73vckDSYVvHFszEaxz1skS938kq6T+yGy0UVe3lBFgkuCtPGVHIyrR3+qMZaybYEIXF80l5gct/irZzyht910DF0GRtX+tFmlHPIwcdpOmsS5dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764974073; c=relaxed/simple;
	bh=RABbv9GwEg7DPryg7oc4rJN1593IjpxeldoG4MZbklo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LbjojBehTUQiY+3Pu7z7brkp9fjcsd6Kss9hKcfrx5lhr4dvfG7zn6ubhojcmsZdvtYTvaP54GkByBDOv+JK4gQs2fZsJ4J7BA3saCoRMFzu3UEGbHyTvDHQudNEh2WcF4ZiWiVZqzc5x7K1BsmOLwv09YWqmyLw35sHxDxAjZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EJCLvTdJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF3EFC4CEF1;
	Fri,  5 Dec 2025 22:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764974072;
	bh=RABbv9GwEg7DPryg7oc4rJN1593IjpxeldoG4MZbklo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EJCLvTdJ5ci81/WoidY8Ml53jOQB8NH4xhMJYwcMnoyyG8regY870dMSOKC5ts1kv
	 QemGXDxFuOH+Igv1aqRwt6Mhu17vImV1zQCTEn4lH0YK+zsJcp9pOLTNrLTmBApUAv
	 B3yBE+udo4BtjkppBU+pcKVOR/mwXXB6fcoMHONEnX9o1YSM70OWsglWWEUaG43lnd
	 e5Xjs7BhRFMftHiW5JTRx3RBKdk1wqnEUasEUGyaQgF6uSEdgpBbe65U33xoKDDWZz
	 WicOUQhIj8LpbsspGOnQtdlIdqsNJyxljwHLkZxAmMAqoLAXCyKjb9/DECKRHaBkpe
	 SO5MKzge3Lz1A==
Date: Fri, 5 Dec 2025 16:40:51 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 11/14] firmware: qcom_scm: Add
 qcom_scm_pas_get_rsc_table() to get resource table
Message-ID: <igedl65pnenmeiybzktsw7toeqtb5mhbk7ks5dkavevko6e5yq@2tyakacovx7f>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <20251121-kvm_rproc_v8-v8-11-8e8e9fb0eca0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121-kvm_rproc_v8-v8-11-8e8e9fb0eca0@oss.qualcomm.com>

On Fri, Nov 21, 2025 at 04:31:13PM +0530, Mukesh Ojha wrote:
> Qualcomm remote processor may rely on Static and Dynamic resources for
> it to be functional. Static resources are fixed like for example,
> memory-mapped addresses required by the subsystem and dynamic
> resources, such as shared memory in DDR etc., are determined at
> runtime during the boot process.
> 
> For most of the Qualcomm SoCs, when run with Gunyah or older QHEE
> hypervisor, all the resources whether it is static or dynamic, is
> managed by the hypervisor. Dynamic resources if it is present for a
> remote processor will always be coming from secure world via SMC call
> while static resources may be present in remote processor firmware
> binary or it may be coming qcom_scm_pas_get_rsc_table() SMC call along
> with dynamic resources.
> 
> Some of the remote processor drivers, such as video, GPU, IPA, etc., do
> not check whether resources are present in their remote processor
> firmware binary. In such cases, the caller of this function should set
> input_rt and input_rt_size as NULL and zero respectively. Remoteproc
> framework has method to check whether firmware binary contain resources
> or not and they should be pass resource table pointer to input_rt and
> resource table size to input_rt_size and this will be forwarded to
> TrustZone for authentication. TrustZone will then append the dynamic
> resources and return the complete resource table in output_rt
> 
> More about documentation on resource table format can be found in
> include/linux/remoteproc.h
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c       | 158 +++++++++++++++++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.h       |   1 +
>  include/linux/firmware/qcom/qcom_scm.h |   4 +
>  3 files changed, 163 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 84498d0d2f0c..c4420b79fb57 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -27,6 +27,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/reset-controller.h>
> +#include <linux/remoteproc.h>
>  #include <linux/sizes.h>
>  #include <linux/types.h>
>  
> @@ -111,6 +112,10 @@ enum qcom_scm_qseecom_tz_cmd_info {
>  	QSEECOM_TZ_CMD_INFO_VERSION		= 3,
>  };
>  
> +enum qcom_scm_rsctable_resp_type {
> +	RSCTABLE_BUFFER_NOT_SUFFICIENT		= 20,
> +};
> +
>  #define QSEECOM_MAX_APP_NAME_SIZE		64
>  #define SHMBRIDGE_RESULT_NOTSUPP		4
>  
> @@ -766,6 +771,159 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_pas_mem_setup);
>  
> +static int __qcom_scm_pas_get_rsc_table(u32 pas_id, void *input_rt, size_t input_rt_size,
> +					void **output_rt, size_t *output_rt_size)

output_rt is not going to be modified, only its content, so it can be
void * (single pointer).

> +{
> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_PIL,
> +		.cmd = QCOM_SCM_PIL_PAS_GET_RSCTABLE,
> +		.arginfo = QCOM_SCM_ARGS(5, QCOM_SCM_VAL, QCOM_SCM_RO, QCOM_SCM_VAL,
> +					 QCOM_SCM_RW, QCOM_SCM_VAL),
> +		.args[0] = pas_id,
> +		.owner = ARM_SMCCC_OWNER_SIP,
> +	};
> +	void *input_rt_buf, *output_rt_buf;

I do one prefer one variable per line, preferably in reverse xmas order.

> +	struct resource_table *rsc;

Calling this "empty_rsc" will make its purpose obvious.

> +	struct qcom_scm_res res;
> +	int ret;
> +
> +	ret = qcom_scm_clk_enable();
> +	if (ret)
> +		return ret;
> +
> +	ret = qcom_scm_bw_enable();
> +	if (ret)
> +		goto disable_clk;
> +
> +	/*
> +	 * TrustZone can not accept buffer as NULL value as argument Hence,
> +	 * we need to pass a input buffer indicating that subsystem firmware
> +	 * does not have resource table by filling resource table structure.
> +	 */
> +	if (!input_rt)
> +		input_rt_size = sizeof(*rsc);

If you overwrite input_rt here, you don't need to repeat this
conditional below, like:

	struct resource_table empty_rsc = {};
	
	...
	
	if (!input_rt) {
		input_rt = &empty_rsc;
		input_rt_size = sizeof(rsc);
	}
	
	qcom_tzmem_alloc(input_rt_size)
	
	memcpy(input_rt_buf, input_rt);

> +
> +	input_rt_buf = qcom_tzmem_alloc(__scm->mempool, input_rt_size, GFP_KERNEL);
> +	if (!input_rt_buf) {
> +		ret = -ENOMEM;
> +		goto disable_scm_bw;
> +	}
> +
> +	if (!input_rt) {
> +		rsc = input_rt_buf;
> +		rsc->num = 0;
> +	} else {
> +		memcpy(input_rt_buf, input_rt, input_rt_size);
> +	}
> +

Reading this patch once more, it looks reasonable, but few of the things
in this function actually depend on *output_rt_size, yet we perform them
in the loop below.

We're expecting, with some certainty, that this sequence will be called
more than once, so I think it would be preferable to slice this
differently, and only repeat the <loop></loop> part.

<loop>

> +	output_rt_buf = qcom_tzmem_alloc(__scm->mempool, *output_rt_size, GFP_KERNEL);
> +	if (!output_rt_buf) {
> +		ret = -ENOMEM;
> +		goto free_input_rt_buf;
> +	}
> +
> +	desc.args[1] = qcom_tzmem_to_phys(input_rt_buf);
> +	desc.args[2] = input_rt_size;
> +	desc.args[3] = qcom_tzmem_to_phys(output_rt_buf);
> +	desc.args[4] = *output_rt_size;
> +
> +	/*
> +	 * Whether SMC fail or pass, res.result[2] will hold actual resource table
> +	 * size.
> +	 *
> +	 * if passed 'output_rt_size' buffer size is not sufficient to hold the
> +	 * resource table TrustZone sends, response code in res.result[1] as
> +	 * RSCTABLE_BUFFER_NOT_SUFFICIENT so that caller can retry this SMC call with
> +	 * output_rt buffer with res.result[2] size.
> +	 */
> +	ret = qcom_scm_call(__scm->dev, &desc, &res);
> +	*output_rt_size = res.result[2];
> +	if (!ret)
> +		memcpy(*output_rt, output_rt_buf, *output_rt_size);
> +
> +	if (ret && res.result[1] == RSCTABLE_BUFFER_NOT_SUFFICIENT)
> +		ret = -EAGAIN;

</loop>

> +
> +	qcom_tzmem_free(output_rt_buf);
> +
> +free_input_rt_buf:
> +	qcom_tzmem_free(input_rt_buf);
> +
> +disable_scm_bw:
> +	qcom_scm_bw_disable();
> +
> +disable_clk:
> +	qcom_scm_clk_disable();
> +
> +	return ret ? : res.result[0];

Is there a risk that res.result[0] will carry something meaningful to
the caller (which will be misinterpreted)?

> +}
> +
> +/**
> + * qcom_scm_pas_get_rsc_table() - Retrieve the resource table in passed output buffer
> + *				  for a given peripheral.
> + *
> + * Qualcomm remote processor may rely on both static and dynamic resources for
> + * its functionality. Static resources typically refer to memory-mapped addresses
> + * required by the subsystem and are often embedded within the firmware binary
> + * and dynamic resources, such as shared memory in DDR etc., are determined at
> + * runtime during the boot process.
> + *
> + * On Qualcomm Technologies devices, it's possible that static resources are not
> + * embedded in the firmware binary and instead are provided by TrustZone However,
> + * dynamic resources are always expected to come from TrustZone. This indicates
> + * that for Qualcomm devices, all resources (static and dynamic) will be provided
> + * by TrustZone via the SMC call.
> + *
> + * If the remote processor firmware binary does contain static resources, they
> + * should be passed in input_rt. These will be forwarded to TrustZone for
> + * authentication. TrustZone will then append the dynamic resources and return
> + * the complete resource table in output_rt.
> + *
> + * If the remote processor firmware binary does not include a resource table,
> + * the caller of this function should set input_rt as NULL and input_rt_size
> + * as zero respectively.
> + *
> + * More about documentation on resource table data structures can be found in
> + * include/linux/remoteproc.h
> + *
> + * @ctx:	    PAS context
> + * @pas_id:	    peripheral authentication service id
> + * @input_rt:       resource table buffer which is present in firmware binary
> + * @input_rt_size:  size of the resource table present in firmware binary
> + * @output_rt:	    buffer to which the both static and dynamic resources will
> + *		    be returned.
> + * @output_rt_size: TrustZone expects caller should pass worst case size for
> + *		    the output_rt.
> + *
> + * Return: 0 on success and nonzero on failure.
> + *
> + * Upon successful return, output_rt will have the resource table and output_rt_size
> + * will have actual resource table size,
> + */
> +int qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx, void *input_rt,
> +			       size_t input_rt_size, void **output_rt,
> +			       size_t *output_rt_size)
> +{
> +	unsigned int retry_num = 5;
> +	int ret;
> +
> +	do {
> +		*output_rt = kzalloc(*output_rt_size, GFP_KERNEL);

I'd prefer the output buffer and size to be carried in a local variables
until we determine success, to avoid overwriting the caller's size with
some bogus number and return a pointer to freed memory.

Wouldn't be unreasonable to return an ERR_PTR() with the allocated
buffer, instead of returning through the reference.

Regards,
Bjorn

> +		if (!*output_rt)
> +			return -ENOMEM;
> +
> +		ret = __qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt,
> +						   input_rt_size, output_rt,
> +						   output_rt_size);
> +		if (ret)
> +			kfree(*output_rt);
> +
> +	} while (ret == -EAGAIN && --retry_num);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(qcom_scm_pas_get_rsc_table);
> +
>  /**
>   * qcom_scm_pas_auth_and_reset() - Authenticate the given peripheral firmware
>   *				   and reset the remote processor
> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
> index a56c8212cc0c..50d87c628d78 100644
> --- a/drivers/firmware/qcom/qcom_scm.h
> +++ b/drivers/firmware/qcom/qcom_scm.h
> @@ -105,6 +105,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
>  #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
>  #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
>  #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
> +#define QCOM_SCM_PIL_PAS_GET_RSCTABLE	0x21
>  
>  #define QCOM_SCM_SVC_IO			0x05
>  #define QCOM_SCM_IO_READ		0x01
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> index ccb8b2e42237..814d40d64ab0 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -88,6 +88,10 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
>  int qcom_scm_pas_auth_and_reset(u32 pas_id);
>  int qcom_scm_pas_shutdown(u32 pas_id);
>  bool qcom_scm_pas_supported(u32 pas_id);
> +int qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx, void *input_rt,
> +			       size_t input_rt_size, void **output_rt,
> +			       size_t *output_rt_size);
> +
>  int qcom_scm_pas_prepare_and_auth_reset(struct qcom_scm_pas_context *ctx);
>  
>  int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
> 
> -- 
> 2.50.1
> 

