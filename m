Return-Path: <linux-arm-msm+bounces-74372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A87B8E63D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 23:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 408097A2992
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 21:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B992C21ED;
	Sun, 21 Sep 2025 21:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NP5Y6sVj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A984B229B16
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 21:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758490271; cv=none; b=bS6nam0CW9C9G8UbEoTa+ZkWl1g/1ANi8oLDZ6De6pDxvybj3Z/EN8qA0jDqrYgyGvAuBYJkXxHGTFzKBSNr9Q1Ae+6y/DtZu4mtY17LeuqIrkSG8Nd3wpVQAz0BVHup1c/py2vt+uYUfJIojxdK+b0poMM66dLle0CRgx4Qnw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758490271; c=relaxed/simple;
	bh=DZpkHI4TD2hvKTQKBnBvZs/BblBW5gA4aYkqMLJjl5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NWqijf3LPanPCTw3npHqQzg/t3p/sHn8pOVwsO3wCzv8wyt/CjiAE94VVFJiyuvw80/OXe9a+aBb1Kqc/XJbiqYZ6L9OtHJh1ZL5IlcNMfo0wnyXngjAdNp8utzJb2Jer+gIwKzyAYP2Y2iPXARHsbRH7NVXEUvtuexylOAR1nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NP5Y6sVj; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45f2313dd86so32283385e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 14:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758490266; x=1759095066; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rbZQorlrgA6b5A6SBj4ZBWzjR7Vw60RlID9QDg6+Jl0=;
        b=NP5Y6sVj36oU6fN92/xtCrZ6OAlf7AcTqY3omPIlLwr01wX6cXkYOItLz34qzq73cV
         s+MR+JcOv35XKG1/0rVfIex8u5755wSMXSbIMQfH6/lr+8smjIbSolW8sSJJQiJnskja
         JSWuzH2P57A9p3KQxrfWcJa0u34qt5tUYM4M+wcRrcAaa90YIwPDKNyu9uJiCltHOnMZ
         jhbzKsDQUUUm57u+CmA696QMzr9vRdzyOX0s4SowzTZ99QDILJ+b+WXwME+ioc8RR2JC
         3YCe9zhIip2LxYnZ5jODsyiybhseXiwFLaYLCHe8AJzxcZG19iIAWxX7Wjpupb9aKsmx
         zvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758490266; x=1759095066;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rbZQorlrgA6b5A6SBj4ZBWzjR7Vw60RlID9QDg6+Jl0=;
        b=bXExJ7ZVo4KlBxE68YsiWNBH3lzieZ+sk1RQjuDFQ326G9g4v4MMtKrXrs5u1Yc6xp
         O242b9NvLGU04XtW00HFiersi0oUwDsMKdbsWEvCoAALGF4cHb8a68DmvAkelXz5jWOd
         Ajf9yyKdeZ1UKVYTb6kzMABu5WDwASRluOh2KGMdcyVKYkMGzuCQXUIjnNWkAqrygpr9
         kLK0BZotlpfoBHLJEDGJVyXyXqZZiTIyCSn/Oxmshy8jSf6OW1+EJPk410DQWdGL4rAj
         7wmN+kKmoAofzDLfNvEeRUAUzCiPrsO/LDDd3caw2XT63S1H5k8K1U1ohexhrDDibgQq
         3Agg==
X-Gm-Message-State: AOJu0YxpnmdtRp8CyirnV2Hy+pUxo1wYDbrXdLlX6L1j1qLXfWerNvuq
	CZMKkU5C4ngMFJn58RfE7JAUSvN2CW3n3fVUQOmXUWXfjRKnZsBBA/QUytxZGECx5zs=
X-Gm-Gg: ASbGncvRNlTPD+F834+ISvcFqooDcNSRI7woMfT4+tS/1h3D3AmQ/oxSAR/KSAIRD6v
	6qY9c0RtJB0hYjGIGeHL2rhdcaX40GJIf/ybDwCiHoyJ9gvKDwLyTTXx8rPo931RUHr2aoaPkNK
	Ekjt0+4WWVsTLYZczoJzGJwdaWKBf/H0pHHPcCQf0FbFYMtxuXTDlR9YzZv0/CoOkrFT8sGlAvk
	A/OJ8cTdUAP/83bBCMoQcy2QlNQi4UtBGP3acVgRTjR1fvE641IXPKJN95PATFNNBg+EsliU0QT
	tGR5qCQYI9W76Cscu0/nGnlRnD3m8pIKfhp/nfuE2SxDPYWDJVtFD7AWQL7aLOScffoX4Hqk3Td
	eqolPOTzo12Cv2uiown+axbil7y3/jpVkAVd/+ZJAmvwD8tRjHQ/1g5fRjrRGKZTR+BiNTCcv49
	VVtQ9DOnFw1ERF4UOSquA=
X-Google-Smtp-Source: AGHT+IGqFUiCUYgfnAodCkYRdOYe88jnjHMAVwRc+cHVKvA44NreuIhB2IHj2+gqeBMuaZ+h+lm2Ow==
X-Received: by 2002:a05:600c:450b:b0:45b:9a46:69e9 with SMTP id 5b1f17b1804b1-467eaa86fddmr108599635e9.31.1758490265825;
        Sun, 21 Sep 2025 14:31:05 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4613e09f879sm214454715e9.19.2025.09.21.14.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Sep 2025 14:31:05 -0700 (PDT)
Message-ID: <fb4ce572-5fd7-4533-a783-f98c191dc910@linaro.org>
Date: Sun, 21 Sep 2025 22:31:03 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] firmware: qcom_scm: Rename peripheral as pas_id
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
 <h5BhHaTRDvnuxhBvoD8fUGJ_NA7Kg29dqnpXWxtR36TI4j3KPZ1lC5cARb92L7F9mPrWcZtsjIb3aI7ASr0V8w==@protonmail.internalid>
 <20250921-kvm_rproc_pas-v3-2-458f09647920@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250921-kvm_rproc_pas-v3-2-458f09647920@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/09/2025 20:41, Mukesh Ojha wrote:
> Peripheral and pas_id refers to unique id for a subsystem and used only
> when peripheral authentication service from secure world is utilized.
> 
> Lets rename peripheral to pas_id to reflect closer to its meaning.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>   drivers/firmware/qcom/qcom_scm.c       | 30 +++++++++++++++---------------
>   include/linux/firmware/qcom/qcom_scm.h | 10 +++++-----
>   2 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index e777b7cb9b12..3379607eaf94 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -562,7 +562,7 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
>    * qcom_scm_pas_init_image() - Initialize peripheral authentication service
>    *			       state machine for a given peripheral, using the
>    *			       metadata
> - * @peripheral: peripheral id
> + * @pas_id:	peripheral authentication service id
>    * @metadata:	pointer to memory containing ELF header, program header table
>    *		and optional blob of data used for authenticating the metadata
>    *		and the rest of the firmware
> @@ -575,7 +575,7 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
>    * track the metadata allocation, this needs to be released by invoking
>    * qcom_scm_pas_metadata_release() by the caller.
>    */
> -int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
> +int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
>   			    struct qcom_scm_pas_metadata *ctx)
>   {
>   	dma_addr_t mdata_phys;
> @@ -585,7 +585,7 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>   		.svc = QCOM_SCM_SVC_PIL,
>   		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
>   		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
> -		.args[0] = peripheral,
> +		.args[0] = pas_id,
>   		.owner = ARM_SMCCC_OWNER_SIP,
>   	};
>   	struct qcom_scm_res res;
> @@ -658,20 +658,20 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
>   /**
>    * qcom_scm_pas_mem_setup() - Prepare the memory related to a given peripheral
>    *			      for firmware loading
> - * @peripheral:	peripheral id
> + * @pas_id:	peripheral authentication service id
>    * @addr:	start address of memory area to prepare
>    * @size:	size of the memory area to prepare
>    *
>    * Returns 0 on success.
>    */
> -int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr, phys_addr_t size)
> +int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size)
>   {
>   	int ret;
>   	struct qcom_scm_desc desc = {
>   		.svc = QCOM_SCM_SVC_PIL,
>   		.cmd = QCOM_SCM_PIL_PAS_MEM_SETUP,
>   		.arginfo = QCOM_SCM_ARGS(3),
> -		.args[0] = peripheral,
> +		.args[0] = pas_id,
>   		.args[1] = addr,
>   		.args[2] = size,
>   		.owner = ARM_SMCCC_OWNER_SIP,
> @@ -699,18 +699,18 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_mem_setup);
>   /**
>    * qcom_scm_pas_auth_and_reset() - Authenticate the given peripheral firmware
>    *				   and reset the remote processor
> - * @peripheral:	peripheral id
> + * @pas_id:	peripheral authentication service id
>    *
>    * Return 0 on success.
>    */
> -int qcom_scm_pas_auth_and_reset(u32 peripheral)
> +int qcom_scm_pas_auth_and_reset(u32 pas_id)
>   {
>   	int ret;
>   	struct qcom_scm_desc desc = {
>   		.svc = QCOM_SCM_SVC_PIL,
>   		.cmd = QCOM_SCM_PIL_PAS_AUTH_AND_RESET,
>   		.arginfo = QCOM_SCM_ARGS(1),
> -		.args[0] = peripheral,
> +		.args[0] = pas_id,
>   		.owner = ARM_SMCCC_OWNER_SIP,
>   	};
>   	struct qcom_scm_res res;
> @@ -735,18 +735,18 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_auth_and_reset);
> 
>   /**
>    * qcom_scm_pas_shutdown() - Shut down the remote processor
> - * @peripheral: peripheral id
> + * @pas_id:	peripheral authentication service id
>    *
>    * Returns 0 on success.
>    */
> -int qcom_scm_pas_shutdown(u32 peripheral)
> +int qcom_scm_pas_shutdown(u32 pas_id)
>   {
>   	int ret;
>   	struct qcom_scm_desc desc = {
>   		.svc = QCOM_SCM_SVC_PIL,
>   		.cmd = QCOM_SCM_PIL_PAS_SHUTDOWN,
>   		.arginfo = QCOM_SCM_ARGS(1),
> -		.args[0] = peripheral,
> +		.args[0] = pas_id,
>   		.owner = ARM_SMCCC_OWNER_SIP,
>   	};
>   	struct qcom_scm_res res;
> @@ -772,18 +772,18 @@ EXPORT_SYMBOL_GPL(qcom_scm_pas_shutdown);
>   /**
>    * qcom_scm_pas_supported() - Check if the peripheral authentication service is
>    *			      available for the given peripherial
> - * @peripheral:	peripheral id
> + * @pas_id:	peripheral authentication service id
>    *
>    * Returns true if PAS is supported for this peripheral, otherwise false.
>    */
> -bool qcom_scm_pas_supported(u32 peripheral)
> +bool qcom_scm_pas_supported(u32 pas_id)
>   {
>   	int ret;
>   	struct qcom_scm_desc desc = {
>   		.svc = QCOM_SCM_SVC_PIL,
>   		.cmd = QCOM_SCM_PIL_PAS_IS_SUPPORTED,
>   		.arginfo = QCOM_SCM_ARGS(1),
> -		.args[0] = peripheral,
> +		.args[0] = pas_id,
>   		.owner = ARM_SMCCC_OWNER_SIP,
>   	};
>   	struct qcom_scm_res res;
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> index a55ca771286b..a13f703b16cd 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -72,13 +72,13 @@ struct qcom_scm_pas_metadata {
>   	ssize_t size;
>   };
> 
> -int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
> +int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
>   			    struct qcom_scm_pas_metadata *ctx);
>   void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);
> -int qcom_scm_pas_mem_setup(u32 peripheral, phys_addr_t addr, phys_addr_t size);
> -int qcom_scm_pas_auth_and_reset(u32 peripheral);
> -int qcom_scm_pas_shutdown(u32 peripheral);
> -bool qcom_scm_pas_supported(u32 peripheral);
> +int qcom_scm_pas_mem_setup(u32 pas_id, phys_addr_t addr, phys_addr_t size);
> +int qcom_scm_pas_auth_and_reset(u32 pas_id);
> +int qcom_scm_pas_shutdown(u32 pas_id);
> +bool qcom_scm_pas_supported(u32 pas_id);
> 
>   int qcom_scm_io_readl(phys_addr_t addr, unsigned int *val);
>   int qcom_scm_io_writel(phys_addr_t addr, unsigned int val);
> 
> --
> 2.50.1
> 
> 

Thanks, thats a more comprehensive patch than I had expected.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

