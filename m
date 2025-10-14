Return-Path: <linux-arm-msm+bounces-77109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04496BD8283
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 10:24:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8875B3E8975
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 08:24:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85F5630F551;
	Tue, 14 Oct 2025 08:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xZk8uUNb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3193330F812
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760430275; cv=none; b=X1RVKmZKlOreUCjP9nFyag66gqeZ2+yL5GmaOhGOtFLmiTSNQzlELwMlel8Qz+CCpGvhQfLd0npet6ksOLRDcXzTontaoHCYLn2o35oYK6OIBU9Mj1heVnWEFHPj26Vmwpu4sGjmDB0UDCOYSUrALFwy5YSEYFgV3/jxS/f/4dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760430275; c=relaxed/simple;
	bh=omBQDlN0SNSXKstrq0O2kRGJ7zOFZ+fJkN3e0IgV1JA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RrCy2P2FPozWUjdjRNvNy6HzqfVNeiebLTLjdPdnhVpwU0KP8dDf7vcS37DGTXHKHzSXPEW1X3PIIhaKlQgTt+VgJtZhGLH846dgLUfdXlsr5DIghz+MEv0xizu5eGnKZKNR7aRheKh+cBAg1m+jqh3h/3Qr5ePQXH61vW52CZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xZk8uUNb; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46faa5b0372so30483855e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 01:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760430271; x=1761035071; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g1WLMyC6KZHho1k1eIZ+qKx3AxLZ35CnRGvjdbXTrhs=;
        b=xZk8uUNbzSr2yOOstpXtq1eHNwsSuz1u652GVVYIqCMjBSQz4i7AT3eiodhRppomfB
         iwaqArrGX65/YLIGHHJx90TsQOKe9LsH0azL+jYb3wFT/pzTSaWxsFleqA1aHktVzwEx
         +MoqVC99YfFpHQ4+3wass/C3uKra9YOnlb7ctBQ9Q7R6l4EYJM4UJyZvwToHkF9Y2Lha
         O8oBPXJ3+2f5I+zUbxOSSKIRT0w0Z292skf8hfEIKs1MPP6xFdngUfgxAGLG6Qoa470W
         OXGP66IR5gAL4AGRF197Hjishz9d3L6/CMSTr9efF6VHEDC95bI8/fSkW28qE3ZtUsDM
         jq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760430271; x=1761035071;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g1WLMyC6KZHho1k1eIZ+qKx3AxLZ35CnRGvjdbXTrhs=;
        b=L03IHl+9kyFjwL/Q5pkLKg9fj6WJys4SCM2RQj0g5VlOfodAws62hVOIxwfcmoi/7C
         +Im4mXGX9aSeTH3wy0DxSjl4SL4Oyk9vz+xko9zT+ekwsx0rxJlVK6IJFJROqqhjo8Fj
         hrLOld5kJyzpf3o6oMTQj9uUbIdUoWaSwAxP13VlDrkEM+6uQ2JKTxCJyp2niAhy8Gy1
         gbn3CvlDD+cKWqQfekWT16HJ+VrArzHn8eYvEtE5fvPqHH+Y+hEpgi6uHaoFJW4y9ynu
         P55VIap05oVah04rgd823uYZNlmQwBfFiezhgjkby4kG2cVojHjgd20GPiTMv1taXNtW
         jPXw==
X-Gm-Message-State: AOJu0YxHbwF9Qsp/D1bLXX+cmh1A8ekuCi+x7tOU54R0OIjVcUk4ZyYI
	aZJu3wl63C+6X0MP7J8gxQffyi5Xnabq30mB71FrMTh2TwIvKQDiMXlEV9jG3EnPUjY=
X-Gm-Gg: ASbGncsO0c8//599J9UDtVoZNDBO0FMREgmDuBOtX7IEdWkSeDgKM0GfGQgFOyO4eVw
	yHJKhE+hWuN0djSNZw4Himl1g9wkuxVwQcAYFPd4YOMR7lIwhYVNrLO43Cdtjt5E0Df5h0izdEd
	CXxiluEWbIzJLOu6YjZ9p+vJhx/LmO43UR5vtx5O7YuUxtgNy0Up+sIdQY8JXyliSFZivA8XUeQ
	KL18DO8ts1c9LcJZ7DrkLkgaVqKJ1viyzyGoxnu2ipkiob0bNODYQH/N1miLMfDX/HB7mlkqLoY
	DZkJaXHTDl4A5HmevE4Qpcm6PAf1WF/bN0tj5SVVFBC285eh/tnZIkAeuajroIx/cEPRdFOe3Gn
	c/6glUrJ3U6keYtHLSs5IEzJK4Bvne6BvhFg0jw3yU2OZkAneun6ASdZb34zwIHYH27az99gIub
	PIUe49gZ1Rd7k=
X-Google-Smtp-Source: AGHT+IF2nh8wX/8xS6xnvjff0xiiobDKtkMDK+CZSyPFZvqZoCQ8OqTQRSGwMzPpVRnLz4p9dqoSOg==
X-Received: by 2002:a05:600c:6818:b0:46e:36fa:6b40 with SMTP id 5b1f17b1804b1-46fa9af915emr162139705e9.24.1760430270637;
        Tue, 14 Oct 2025 01:24:30 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426dac0ab7bsm13291015f8f.46.2025.10.14.01.24.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 01:24:30 -0700 (PDT)
Message-ID: <27b9a906-3348-4b75-b5e4-12edad91b93f@linaro.org>
Date: Tue, 14 Oct 2025 09:24:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/13] remoteproc: pas: Replace metadata context with
 PAS context structure
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251013-kvm_rprocv5-v5-0-d609ed766061@oss.qualcomm.com>
 <20251013-kvm_rprocv5-v5-4-d609ed766061@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251013-kvm_rprocv5-v5-4-d609ed766061@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2025 11:03, Mukesh Ojha wrote:
> As a superset of the existing metadata context, the PAS context
> structure enables both remoteproc and non-remoteproc subsystems to
> better support scenarios where the SoC runs with or without the Gunyah
> hypervisor. To reflect this, relevant SCM and metadata functions are
> updated to incorporate PAS context awareness.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>   drivers/firmware/qcom/qcom_scm.c       | 32 ++++++++++++++++-------------
>   drivers/remoteproc/qcom_q6v5_pas.c     | 37 ++++++++++++++++++++++++----------
>   drivers/soc/qcom/mdt_loader.c          |  4 ++--
>   include/linux/firmware/qcom/qcom_scm.h |  4 ++--
>   include/linux/soc/qcom/mdt_loader.h    |  6 +++---
>   5 files changed, 51 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 6d22b2ac7880..b11a21797d46 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -600,7 +600,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_context_init);
>    *		and optional blob of data used for authenticating the metadata
>    *		and the rest of the firmware
>    * @size:	size of the metadata
> - * @ctx:	optional metadata context
> + * @ctx:	optional pas context
>    *
>    * Return: 0 on success.
>    *
> @@ -609,8 +609,9 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_context_init);
>    * qcom_scm_pas_metadata_release() by the caller.
>    */
>   int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
> -			    struct qcom_scm_pas_metadata *ctx)
> +			    struct qcom_scm_pas_context *ctx)
>   {
> +	struct qcom_scm_pas_metadata *mdt_ctx;
>   	dma_addr_t mdata_phys;
>   	void *mdata_buf;
>   	int ret;
> @@ -661,10 +662,11 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
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

Suspicious looking code..

The second check for ctx is redundant as it cannot ever be false. You have

if (ret < 0 || !ctx) {
} else if (ctx && ctx->mdatadata) {
}

The old code was wrong but, that's no reason to continue to be wrong.

Is it currently possible for ctx to be true but ctx->metadata to be false..

void *qcom_scm_pas_context_init(struct device *dev, u32 pas_id, 
phys_addr_t mem_phys,
                                 size_t mem_size)
{
         struct qcom_scm_pas_context *ctx;

         ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
         if (!ctx)
                 return ERR_PTR(-ENOMEM);

         ctx->dev = dev;
         ctx->pas_id = pas_id;
         ctx->mem_phys = mem_phys;
         ctx->mem_size = mem_size;

         ctx->metadata = devm_kzalloc(dev, sizeof(*ctx->metadata), 
GFP_KERNEL);
         if (!ctx->metadata)
                 return ERR_PTR(-ENOMEM);

         return ctx;
}
EXPORT_SYMBOL_GPL(qcom_scm_pas_context_init);

No.

Lets fix the ctx checking logic in this code as we modify the patch.
>   	}
>   
>   	return ret ? : res.result[0];
> @@ -673,18 +675,20 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_init_image);
>   
>   /**
>    * qcom_scm_pas_metadata_release() - release metadata context
> - * @ctx:	metadata context
> + * @ctx:	pas context
>    */
> -void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
> +void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx)
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

If we have established that mdt_ctx->ptr is the fulcurm of truth for 
this data then setting ->phys and ->size to anything after setting ->ptr 
= NULL are wasted bus cycles.

>   EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
>   
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 158bcd6cc85c..e9dcab94ea0c 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -117,8 +117,8 @@ struct qcom_pas {
>   	struct qcom_rproc_ssr ssr_subdev;
>   	struct qcom_sysmon *sysmon;
>   
> -	struct qcom_scm_pas_metadata pas_metadata;
> -	struct qcom_scm_pas_metadata dtb_pas_metadata;
> +	struct qcom_scm_pas_context *pas_ctx;
> +	struct qcom_scm_pas_context *dtb_pas_ctx;
>   };
>   
>   static void qcom_pas_segment_dump(struct rproc *rproc,
> @@ -211,9 +211,9 @@ static int qcom_pas_unprepare(struct rproc *rproc)
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
> @@ -241,7 +241,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>   
>   		ret = qcom_mdt_pas_init(pas->dev, pas->dtb_firmware, pas->dtb_firmware_name,
>   					pas->dtb_pas_id, pas->dtb_mem_phys,
> -					&pas->dtb_pas_metadata);
> +					pas->dtb_pas_ctx);
>   		if (ret)
>   			goto release_dtb_firmware;
>   
> @@ -255,7 +255,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
>   	return 0;
>   
>   release_dtb_metadata:
> -	qcom_scm_pas_metadata_release(&pas->dtb_pas_metadata);
> +	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
>   
>   release_dtb_firmware:
>   	release_firmware(pas->dtb_firmware);
> @@ -306,7 +306,7 @@ static int qcom_pas_start(struct rproc *rproc)
>   	}
>   
>   	ret = qcom_mdt_pas_init(pas->dev, pas->firmware, rproc->firmware, pas->pas_id,
> -				pas->mem_phys, &pas->pas_metadata);
> +				pas->mem_phys, pas->pas_ctx);
>   	if (ret)
>   		goto disable_px_supply;
>   
> @@ -332,9 +332,9 @@ static int qcom_pas_start(struct rproc *rproc)
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
> @@ -342,9 +342,9 @@ static int qcom_pas_start(struct rproc *rproc)
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
> @@ -779,6 +779,21 @@ static int qcom_pas_probe(struct platform_device *pdev)
>   	}
>   
>   	qcom_add_ssr_subdev(rproc, &pas->ssr_subdev, desc->ssr_name);
> +
> +	pas->pas_ctx = qcom_scm_pas_context_init(pas->dev, pas->pas_id, pas->mem_phys,
> +						 pas->mem_size);
> +	if (IS_ERR(pas->pas_ctx)) {
> +		ret = PTR_ERR(pas->pas_ctx);
> +		goto remove_ssr_sysmon;
> +	}
> +
> +	pas->dtb_pas_ctx = qcom_scm_pas_context_init(pas->dev, pas->dtb_pas_id,
> +						     pas->dtb_mem_phys, pas->dtb_mem_size);
> +	if (IS_ERR(pas->dtb_pas_ctx)) {
> +		ret = PTR_ERR(pas->dtb_pas_ctx);
> +		goto remove_ssr_sysmon;
> +	}
> +
>   	ret = rproc_add(rproc);
>   	if (ret)
>   		goto remove_ssr_sysmon;
> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> index a5c80d4fcc36..fe35038c5342 100644
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
> +		      struct qcom_scm_pas_context *ctx)
>   {
>   	const struct elf32_phdr *phdrs;
>   	const struct elf32_phdr *phdr;
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> index 75dec515c5d2..7c58d26ede24 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -83,8 +83,8 @@ struct qcom_scm_pas_context {
>   void *qcom_scm_pas_context_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
>   				size_t mem_size);
>   int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
> -			    struct qcom_scm_pas_metadata *ctx);
> -void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);
> +			    struct qcom_scm_pas_context *ctx);
> +void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx);
>   int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
>   int qcom_scm_pas_auth_and_reset(u32 pas_id);
>   int qcom_scm_pas_shutdown(u32 pas_id);
> diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
> index 8ea8230579a2..07c278841816 100644
> --- a/include/linux/soc/qcom/mdt_loader.h
> +++ b/include/linux/soc/qcom/mdt_loader.h
> @@ -10,14 +10,14 @@
>   
>   struct device;
>   struct firmware;
> -struct qcom_scm_pas_metadata;
> +struct qcom_scm_pas_context;
>   
>   #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
>   
>   ssize_t qcom_mdt_get_size(const struct firmware *fw);
>   int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
>   		      const char *fw_name, int pas_id, phys_addr_t mem_phys,
> -		      struct qcom_scm_pas_metadata *pas_metadata_ctx);
> +		      struct qcom_scm_pas_context *pas_ctx);
>   int qcom_mdt_load(struct device *dev, const struct firmware *fw,
>   		  const char *fw_name, int pas_id, void *mem_region,
>   		  phys_addr_t mem_phys, size_t mem_size,
> @@ -39,7 +39,7 @@ static inline ssize_t qcom_mdt_get_size(const struct firmware *fw)
>   
>   static inline int qcom_mdt_pas_init(struct device *dev, const struct firmware *fw,
>   				    const char *fw_name, int pas_id, phys_addr_t mem_phys,
> -				    struct qcom_scm_pas_metadata *pas_metadata_ctx)
> +				    struct qcom_scm_pas_context *pas_ctx)
>   {
>   	return -ENODEV;
>   }
> 


