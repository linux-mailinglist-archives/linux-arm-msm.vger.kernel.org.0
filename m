Return-Path: <linux-arm-msm+bounces-76270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBCEBC2CA6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 23:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E41B034F804
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 21:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB7E257437;
	Tue,  7 Oct 2025 21:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uoLyNor3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBE4248891;
	Tue,  7 Oct 2025 21:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759873707; cv=none; b=IgaVSVd8wqvI5c7gJHcdxa/6Gpn9QiIxFXUvny3ANts+QIqzFfwnoHBFyfLqOEPn+g2VFMwgOTRvUCODz38tSGJW3aaL9YBkIURqNo25SXfPDJEAMZ+9o4gV4GxVDX50DMceslVHRfrTfYkD0XcsMy5ByWlbf9dgKhLYdmE5+fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759873707; c=relaxed/simple;
	bh=M6gCrkYqmgJrQ5nUPLjNat3j6PfE4QacRl1VuEuqkMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JgjBGSCA6HgAHOKBvVrzbFIw+Au4KWDm9jPnFr2GegoHCtPrFzLPmgbhc/NWR8ByzHTYULEbzNSkc0XqkpIILR0R/troRt8vatXEgiREAdhgKVS8LL2oUDCJJucMRCzLJ6F+18/woSnmXUbiiLFHuhdvSJs67tDLUbLC4H4e/lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uoLyNor3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF1EC4CEF1;
	Tue,  7 Oct 2025 21:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759873707;
	bh=M6gCrkYqmgJrQ5nUPLjNat3j6PfE4QacRl1VuEuqkMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uoLyNor3OsiQo5FiOU1RmQmGXetqZoWCgXYQjiiIth5Chc/AtY8wFF0iesZbs2gmz
	 CUEqvUXubk9TNh7M2yy9zxDA7ikF4pPddpqSr0sSt88U+gp7eGV4xM/OK4ut6ivSp2
	 1WKA1gSpPZRCnoV5zaK9htMGgsGwKSp9gK5X/PmCi3XDFA+UjKwn4n6gPUNjOCFU91
	 SSN3xuhek1EqQIdhsE00owjmWWE6mm4u/3ksoRO+OWn1kF+Pq7VVdirzdGvoypZg8N
	 CJslh2NdzJQdbjttRfdQ9lOB4+c+bfyOkp44CUyQ3QzbCqrWAD9pCGg5onn1GH0uaR
	 2/CMFQ78IKr8A==
Date: Tue, 7 Oct 2025 14:48:26 -0700
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/12] remoteproc: pas: Extend parse_fw callback to
 fetch resources via SMC call
Message-ID: <hwjfb7rudsdsxxoluxyu4n7wumzyyn73xnzi2ww4fkkfkpg3a3@esvajcrmhcus>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-10-de841623af3c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251007-kvm_rprocv4_next-20251007-v4-10-de841623af3c@oss.qualcomm.com>

On Tue, Oct 07, 2025 at 10:18:55PM +0530, Mukesh Ojha wrote:
> Qualcomm remote processor may rely on static and dynamic resources for
> it to be functional. For most of the Qualcomm SoCs, when run with Gunyah
> or older QHEE hypervisor, all the resources whether it is static or
> dynamic, is managed by the hypervisor. Dynamic resources if it is
> present for a remote processor will always be coming from secure world
> via SMC call while static resources may be present in remote processor
> firmware binary or it may be coming from SMC call along with dynamic
> resources.
> 
> Remoteproc already has method like rproc_elf_load_rsc_table() to check
> firmware binary has resources or not and if it is not having then we
> pass NULL and zero as input resource table and its size argument
> respectively to qcom_scm_pas_get_rsc_table() and while it has resource
> present then it should pass the present resources to Trustzone(TZ) so that
> it could authenticate the present resources and append dynamic resource
> to return in output_rt argument along with authenticated resources.
> 
> Extend parse_fw callback to include SMC call to get resources from
> Trustzone and to leverage resource table parsing and mapping and
> unmapping code from the remoteproc framework.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 60 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 58 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 46a23fdefd48..ed7bd931dfd5 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -34,6 +34,7 @@
>  #define QCOM_PAS_DECRYPT_SHUTDOWN_DELAY_MS	100
>  
>  #define MAX_ASSIGN_COUNT 3
> +#define MAX_RSCTABLE_SIZE	SZ_16K
>  
>  struct qcom_pas_data {
>  	int crash_reason_smem;
> @@ -412,6 +413,61 @@ static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is
>  	return pas->mem_region + offset;
>  }
>  
> +static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *fw)
> +{
> +	size_t output_rt_size = MAX_RSCTABLE_SIZE;
> +	struct qcom_pas *pas = rproc->priv;
> +	struct resource_table *table = NULL;
> +	void *output_rt;
> +	size_t table_sz;
> +	int ret;
> +
> +	ret = qcom_register_dump_segments(rproc, fw);
> +	if (ret) {
> +		dev_err(pas->dev, "Error in registering dump segments\n");
> +		return ret;
> +	}
> +
> +	if (!rproc->has_iommu)
> +		return ret;
> +
> +	ret = rproc_elf_load_rsc_table(rproc, fw);
> +	if (ret)
> +		dev_info(&rproc->dev, "Error in loading resource table from firmware\n");
> +
> +	table = rproc->table_ptr;
> +	table_sz = rproc->table_sz;

Are 'rproc->table_ptr' and 'rproc->table_sz' guaranteed to be 0 in the case of
above error?

> +
> +	/*
> +	 * Qualcomm remote processor may rely on static and dynamic resources for
> +	 * it to be functional. For most of the Qualcomm SoCs, when run with Gunyah
> +	 * or older QHEE hypervisor, all the resources whether it is static or dynamic,
> +	 * is managed by present hypervisor. Dynamic resources if it is present for
> +	 * a remote processor will always be coming from secure world via SMC call
> +	 * while static resources may be present in remote processor firmware binary
> +	 * or it may be coming from SMC call along with dynamic resources.
> +	 *
> +	 * Here, we call rproc_elf_load_rsc_table() to check firmware binary has resources
> +	 * or not and if it is not having then we pass NULL and zero as input resource
> +	 * table pointer and size respectively to the argument of qcom_scm_pas_get_rsc_table()
> +	 * and this is even true for Qualcomm remote processor who does follow remoteproc
> +	 * framework.
> +	 */
> +	ret = qcom_scm_pas_get_rsc_table(pas->pas_ctx, table, table_sz, &output_rt,
> +					 &output_rt_size);
> +	if (ret) {
> +		dev_err(pas->dev, "error %d getting resource_table\n", ret);

	"Error in getting resource table: %d\n"

> +		return ret;
> +	}
> +
> +	kfree(rproc->cached_table);
> +	rproc->cached_table = output_rt;
> +	rproc->table_ptr = rproc->cached_table;
> +	rproc->table_sz = output_rt_size;
> +
> +	return ret;

	return 0;

- Mani

-- 
மணிவண்ணன் சதாசிவம்

