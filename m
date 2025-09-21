Return-Path: <linux-arm-msm+bounces-74376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 359E3B8E78B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 23:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE4B017CD0B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 21:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 629E32C21ED;
	Sun, 21 Sep 2025 21:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IfYCT6Wz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305222AD14;
	Sun, 21 Sep 2025 21:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758491403; cv=none; b=MRVigWlQnvGI7PzOfgBDIz6DUy9UZFWBNnc47Bn5idSDF8q8DVYSbUf1Um9/JjeWN8CYDZIChOsPgG3NH7cC0NUYnxK5NljINWHi1b3BTrKR9SeAWML/InUdM9qAiVbIsH8+evkHWhVOkTVCvrGyENHJD+fs5ReGdgZ62TtxrHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758491403; c=relaxed/simple;
	bh=qOvbqqTyA6OCzbSAoE1K/T3edVqi/WLJQx3ZbFC+UJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NLZloSc3YFU9bETgwW8wVC2lcneNa14jKNgo0ZElc1Hvi3kvl0T24xpsWdPQWCoVTKz5u5SNrbSNbchYZ+63E+AOMy9Emebyr+2Jfv4dn0WKKzyao1fFP3IOG1C4W16KcalVfLPXczXYMfLukHB0jQFjT/0Oqi4XWmLaP9W6F44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IfYCT6Wz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ACD7C113D0;
	Sun, 21 Sep 2025 21:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758491402;
	bh=qOvbqqTyA6OCzbSAoE1K/T3edVqi/WLJQx3ZbFC+UJc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IfYCT6Wz6ln7kXPbzl7x4EHQcoEHfzHmU4IU/SZycdm4zRSRzwsXYBPs7XXFZhzpE
	 EQFlrbkzOMvAXE++iWiZPQzK4oF4bn1r2CmlgtLLCUqCoVmDf1W2NIxDyzyA/CTV8P
	 YsLEQHGffjqZaTF35ewwp4CaATMdju5Zd6++NYHpLyEpGb0oYnJgZIQjMLE+q35BVa
	 tivKBdansnRsz1fb3wSV/3v9XVMKMud8fC338l9wKsw0Y9UcEv/Hx0pouc3ig7N151
	 Eg68Rn0Gic4+sqodT7H0Fb/LiDp5qO8RLzRE32BLpPTRTQ+A748Dgslc0zC+tTqDl3
	 mLB3VCqKbmrfw==
Message-ID: <8ec4743e-363c-414a-a309-7aec9b206c9d@kernel.org>
Date: Sun, 21 Sep 2025 22:49:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] soc: qcom: mdtloader: Add context aware
 qcom_mdt_pas_load() helper
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
 <35fcbmAhT5_3gUt4XfDRyXxLYw8nkNq8Ga2X4ISpsGjmrADoLn0DVR_xvX8ogIknEA28tGNDc0ahMgOI26joMw==@protonmail.internalid>
 <20250921-kvm_rproc_pas-v3-4-458f09647920@oss.qualcomm.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <20250921-kvm_rproc_pas-v3-4-458f09647920@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/09/2025 20:41, Mukesh Ojha wrote:
> Currently, remoteproc and non-remoteproc subsystems use different
> variants of the MDT loader helper API, primarily due to the handling of
> the metadata context. Remoteproc subsystems retain this context until
> authentication and reset, while non-remoteproc subsystems (e.g., video,
> graphics) do not need to retain it and it is freed inside
> qcom_scm_pas_init() based on metadata context parameter being NULL.

The above paragraph seems almost 1:1 with the commit log of the previous 
patch.

You'd be better off describing in the commit log what you mean by 
context here. Not a thread context which is the common meaning of 
context. Instead of restating the paragraph from your previous commit, 
give the reader of your commit log new information - for example - what 
do you mean by context here ?

> Add context aware qcom_mdt_pas_load() function which uses context
> returned from qcom_scm_pas_ctx_init() and use it till subsystems
> is out of set. 

"Add a context function qcom_mdt_pas_load() which uses a context 
pointer/handle? return from qcom_scm_pas_init() then use that handle 
until? a subsystem is out of reset ?

Your commit log doesn't match the code below, which simply provides the 
API you will then subsequently build on.


This will also help in unifying the API used by
> remoteproc and non-remoteproc subsystems drivers in future and
> will also help in early setting context to all the PAS SMC function
> to do appropriate things when SoC is running with gunyah hypervisor
> or in absence of it.

Your argument for unification should go into the cover letter - this 
specific commit is adding a function - not performing that unification 
so in my opinion - as a reviewer I should see this argument for 
unification @ the cover-letter level and/or at the commit which 
implements the unification not the commit that adds the API to 
facilitate the unification.
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>   drivers/soc/qcom/mdt_loader.c       | 15 +++++++++++++++
>   include/linux/soc/qcom/mdt_loader.h | 10 ++++++++++
>   2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> index a5c80d4fcc36..2ef079797f05 100644
> --- a/drivers/soc/qcom/mdt_loader.c
> +++ b/drivers/soc/qcom/mdt_loader.c
> @@ -486,5 +486,20 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
>   }
>   EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
> 
> +int qcom_mdt_pas_load(struct qcom_scm_pas_ctx *ctx, const struct firmware *fw,
> +		      const char *firmware, void *mem_region, phys_addr_t *reloc_base)
> +{
> +	int ret;
> +
> +	ret = qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id,
> +				  ctx->mem_phys, ctx->metadata);
> +	if (ret)
> +		return ret;
> +
> +	return __qcom_mdt_load(ctx->dev, fw, firmware, mem_region, ctx->mem_phys,
> +			       ctx->mem_size, reloc_base);
> +}
> +EXPORT_SYMBOL_GPL(qcom_mdt_pas_load);
> +
>   MODULE_DESCRIPTION("Firmware parser for Qualcomm MDT format");
>   MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
> index 8ea8230579a2..36b8b331ce5f 100644
> --- a/include/linux/soc/qcom/mdt_loader.h
> +++ b/include/linux/soc/qcom/mdt_loader.h
> @@ -11,6 +11,7 @@
>   struct device;
>   struct firmware;
>   struct qcom_scm_pas_metadata;
> +struct qcom_scm_pas_ctx;
> 
>   #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
> 
> @@ -23,6 +24,9 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
>   		  phys_addr_t mem_phys, size_t mem_size,
>   		  phys_addr_t *reloc_base);
> 
> +int qcom_mdt_pas_load(struct qcom_scm_pas_ctx *ctx, const struct firmware *fw,
> +		      const char *firmware, void *mem_region, phys_addr_t *reloc_base);
> +
>   int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
>   			  const char *fw_name, void *mem_region,
>   			  phys_addr_t mem_phys, size_t mem_size,
> @@ -52,6 +56,12 @@ static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
>   	return -ENODEV;
>   }
> 
> +int qcom_mdt_pas_load(struct qcom_scm_pas_ctx *ctx, const struct firmware *fw,
> +		      const char *firmware, void *mem_region, phys_addr_t *reloc_base)
> +{
> +	return -ENODEV;
> +}
> +
>   static inline int qcom_mdt_load_no_init(struct device *dev,
>   					const struct firmware *fw,
>   					const char *fw_name, void *mem_region,
> 
> --
> 2.50.1
> 
> 


