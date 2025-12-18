Return-Path: <linux-arm-msm+bounces-85708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E952CCCC520
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 15:43:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81E1230562FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 14:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7D0286D4E;
	Thu, 18 Dec 2025 14:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="npRJQJ+n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1E42773DE;
	Thu, 18 Dec 2025 14:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766068624; cv=none; b=LVgp5WgFE1LsHQrKDbHYk2HQkbg0ocmFkU/x2zIC9FrDJkEmTHy79LpMuNCZs3t1tf9VIsC9TbF7Lyljfl9T9fudpwcLjcYh000W5neieoV2S1o9vRZmXGun49cOjAsJWLvX6Z4mBQiTdfzOFux9jiAAvKmVfUT2XpiNC86Nm4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766068624; c=relaxed/simple;
	bh=C4aVgHKLH2zwboXazAOmsuS2KMJ4bZLNfRZH48TA7KE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PvZ4X2eDN1oZg9+0iF89WM5aX1ACj5U02SkATrq2rH5nhoiZOHM5LBz+XXerOictbIaSB951risZYyaTyO/YXFmofqgCH+xFvMa0SDcby72uBub5X76YOhRBBIqK37FBsCBgqVdNOuibKUyWPUs7Ovuu/+QMkzyqnK3pRvIMfI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=npRJQJ+n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F5EC4CEFB;
	Thu, 18 Dec 2025 14:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766068622;
	bh=C4aVgHKLH2zwboXazAOmsuS2KMJ4bZLNfRZH48TA7KE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=npRJQJ+n2T/y2apPKRagp7AdUodJQ+cnhwXusv0lE9gGgbwlz0954GPVGSKPAHWd9
	 LVy1zbS+vOC6cwzkMiFLj7DTzuYmfw1bvM4cxa/0YKs+qjdPXEWUJ28QRCnCKSvoAn
	 x0hSws9giSplsSa1/mYO6XmU2YFo7g+xGqIRwrNR8KJZvQBoepGEGVcoMkt8AEvHvp
	 SsQkxMeqq/do0L9W5gu61tDSApWdwHnQt43I/1P4xq/M1dQXgrisx4q5V2taXjDz+c
	 Rm2m8PDJvfSffQSCfuYdEvinoawcZRRncf50vHTjUTjgN13U8l7LFPhJHzLBwd83Gr
	 VoqJUQ0qXZAbA==
Date: Thu, 18 Dec 2025 08:37:00 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 11/14] firmware: qcom_scm: Add
 qcom_scm_pas_get_rsc_table() to get resource table
Message-ID: <2332azku3gvlm7vwuu6xvhdtr3nhbbjsnpgclh3m4mk6gvotjs@h4cizwnu6dkl>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <20251121-kvm_rproc_v8-v8-11-8e8e9fb0eca0@oss.qualcomm.com>
 <igedl65pnenmeiybzktsw7toeqtb5mhbk7ks5dkavevko6e5yq@2tyakacovx7f>
 <20251208164926.cwe7arncr6tnan5f@hu-mojha-hyd.qualcomm.com>
 <20251209104525.wtevrvyxqomh63hg@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209104525.wtevrvyxqomh63hg@hu-mojha-hyd.qualcomm.com>

On Tue, Dec 09, 2025 at 04:15:25PM +0530, Mukesh Ojha wrote:
> On Mon, Dec 08, 2025 at 10:19:26PM +0530, Mukesh Ojha wrote:
> > On Fri, Dec 05, 2025 at 04:40:51PM -0600, Bjorn Andersson wrote:
> > > On Fri, Nov 21, 2025 at 04:31:13PM +0530, Mukesh Ojha wrote:
[..]
> > > 
> > > Wouldn't be unreasonable to return an ERR_PTR() with the allocated
> > > buffer, instead of returning through the reference.
> > 
> > We anyway have to return the size through reference, why not do the same for 
> > allocated buffer as well..
> 
> 
> Tried to take care most of the comments apart from above one., let me know if
> below is fine..

It's indeed fine, much better. Thank you.

> 
> ---------------------------------------o<---------------------------------------
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 4ce892d8fb25..a589961f8225 100644
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

This isn't an enumeration, it's the constant 20. So #define would be
more suitable...

> +};
> +
>  #define QSEECOM_MAX_APP_NAME_SIZE		64
>  #define SHMBRIDGE_RESULT_NOTSUPP		4
>  
> @@ -766,6 +771,171 @@ int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_pas_mem_setup);
>  
> +static int __qcom_scm_pas_get_rsc_table(u32 pas_id, void *input_rt,
> +					size_t input_rt_size, void *output_rt,
> +					size_t *output_rt_size)
> +{
> +	struct qcom_scm_desc desc = {
> +		.svc = QCOM_SCM_SVC_PIL,
> +		.cmd = QCOM_SCM_PIL_PAS_GET_RSCTABLE,
> +		.arginfo = QCOM_SCM_ARGS(5, QCOM_SCM_VAL, QCOM_SCM_RO, QCOM_SCM_VAL,
> +					 QCOM_SCM_RW, QCOM_SCM_VAL),
> +		.args[0] = pas_id,
> +		.owner = ARM_SMCCC_OWNER_SIP,
> +	};
> +	struct qcom_scm_res res;
> +	int ret;
> +
> +	desc.args[1] = qcom_tzmem_to_phys(input_rt);
> +	desc.args[2] = input_rt_size;
> +	desc.args[3] = qcom_tzmem_to_phys(output_rt);
> +	desc.args[4] = *output_rt_size;
> +
> +	/*
> +	 * Whether SMC fail or pass, res.result[2] will hold actual resource table
> +	 * size.
> +	 *
> +	 * If passed 'output_rt_size' buffer size is not sufficient to hold the
> +	 * resource table TrustZone sends, response code in res.result[1] as
> +	 * RSCTABLE_BUFFER_NOT_SUFFICIENT so that caller can retry this SMC call
> +	 * with output_rt buffer with res.result[2] size however, It should not
> +	 * be of unresonable size.
> +	 */
> +	ret = qcom_scm_call(__scm->dev, &desc, &res);
> +	if (res.result[2] > SZ_1G) {
> +		ret = -E2BIG;
> +		return ret;
> +	}
> +
> +	*output_rt_size = res.result[2];
> +	if (ret && res.result[1] == RSCTABLE_BUFFER_NOT_SUFFICIENT)
> +		ret = -EOVERFLOW;
> +
> +	return ret ? : res.result[0];
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
> +	struct resource_table empty_rsc = {};
> +	size_t size = SZ_16K;
> +	void *output_rt_tzm;
> +	void *input_rt_tzm;
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

Lowercase 'h' in Hence, please.

> +	 * we need to pass a input buffer indicating that subsystem firmware
> +	 * does not have resource table by filling resource table structure.
> +	 */
> +	if (!input_rt) {
> +		input_rt = &empty_rsc;
> +		input_rt_size = sizeof(empty_rsc);
> +	}
> +
> +	input_rt_tzm = qcom_tzmem_alloc(__scm->mempool, input_rt_size, GFP_KERNEL);
> +	if (!input_rt_tzm) {
> +		ret = -ENOMEM;
> +		goto disable_scm_bw;
> +	}
> +
> +	memcpy(input_rt_tzm, input_rt, input_rt_size);
> +
> +	do {
> +		output_rt_tzm = qcom_tzmem_alloc(__scm->mempool, size, GFP_KERNEL);
> +		if (!output_rt_tzm) {
> +			ret = -ENOMEM;
> +			goto free_input_rt;
> +		}
> +
> +		ret = __qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt_tzm,
> +						   input_rt_size, output_rt_tzm,
> +						   &size);
> +		if (ret)
> +			qcom_tzmem_free(output_rt_tzm);
> +
> +	} while (ret == -EOVERFLOW);
> +
> +	if (!ret) {
> +		void *tbl_ptr;
> +
> +		tbl_ptr = kzalloc(size, GFP_KERNEL);
> +		if (!tbl_ptr)
> +			goto free_output_rt;
> +
> +		memcpy(tbl_ptr, output_rt_tzm, size);
> +		*output_rt = tbl_ptr;
> +		*output_rt_size = size;
> +	}
> +
> +free_output_rt:
> +	if (!ret)
> +		qcom_tzmem_free(output_rt_tzm);
> +
> +free_input_rt:
> +	qcom_tzmem_free(input_rt_tzm);
> +
> +disable_scm_bw:
> +	qcom_scm_bw_disable();
> +
> +disable_clk:
> +	qcom_scm_clk_disable();
> +
> +	return ret;

I still think it would be nice to match the prototype of
rproc_find_loaded_rsc_table() and return the pointer our resource table.

Effectively:
  return ret ? ERR_PTR(ret) : tbl_ptr;

(although return tbl_ptr; after making sure it's either the allocated
memory or ERR_PTR() would be nicer)

Should be able to make the return type struct resource_table * (even
though struct resource_table is a opaque type here).

But, my concrete concerns have been addressed, so I'm happy either way.

Regards,
Bjorn

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
> index d6d83888bb75..7c331598ea15 100644
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
>  
> 
> > 
> > 
> > -- 
> > -Mukesh Ojha
> 
> -- 
> -Mukesh Ojha

