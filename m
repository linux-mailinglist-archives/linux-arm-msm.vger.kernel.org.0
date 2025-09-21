Return-Path: <linux-arm-msm+bounces-74375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DCFB8E69A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 23:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91FEC3B92A4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 21:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09DB3270EC3;
	Sun, 21 Sep 2025 21:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IEFagO3U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFBF17A5BE
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 21:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758490861; cv=none; b=NiTyQaFyxixkwN1l+43UMW7Iu5u/GSIQ4/fkdv7UBzWuHBVDHzf4e7VGCpdpnaprTS+kH5Sg0R8ESkh0Qnv+1tOmGdI+6nDeT+faMB2hrmqt9Sy0U8ox0DMf/tNa2wvkskKph4mplcewupiGrg41Dy95WWn5x/OExcLRX6VxYmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758490861; c=relaxed/simple;
	bh=1oNc0sJYdb9rX45c7syeiBdncY9kKRBhqLifXQ83cWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aw+Av8v8J7WvdWqg0KcryymKNE9nFTNTGh4FiE4LtVRxd6+fAqUlxdWS2CtL64uuTny2Xf4B/phqh/7osMV9ZSxHJskRxSLOBLa14bpyIWI2MZzA5WfVxCB4eRoRvLdKBPse44OZ1ZhraqzHsdY2FUuLdntpVHYy1pTl8X+a/8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IEFagO3U; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45de56a042dso23352335e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 14:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758490858; x=1759095658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WosRKVT+AD3vASAmC7vYIumBFhKj0WFw859hR7TLepU=;
        b=IEFagO3U5hCLobCInDoUWdX+cA1L5BKqe7vFziLOlDQyrCIDGn404BS8nLOcd0LDXz
         MvIHk8jfT8ThEk7/VU5icdcJtU3OXQvyYVhBwPm9ftck7jbr88B70PIb0ClkiVaHz9fQ
         xSWOxwtchvSAzKP273aAWRSuqFDYyK61bp6TxIqOQ/3Ou7f1a8YWTmMRG15xG+pXkcJI
         dFlmlY4Qt2SFF/ssHHgA+8BuLtW80Ywt8h5lUXK/A0dwzGPjCOP2JlM5lD/Qz9cOzjE5
         hHRBqaV3FasUJz5r7RFIe/XnfLkSdWmRYdAnNwOqByxh/BwmgEvKOBSUX0p9RzIspj7v
         kizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758490858; x=1759095658;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WosRKVT+AD3vASAmC7vYIumBFhKj0WFw859hR7TLepU=;
        b=WJUFIplYRaRnhjKmH/CV7EWDyFz7OcoRoH5i2Ue7EPAjBMOXiLnGkJjB1Sq1sj+Url
         pNNBfRiuwY36jkYqDsqfsbRoOSpkgCraXb8/E8z5K2rv1pyEjJTovlZdP3yHARXhqhOF
         cj5nnor/qMBgn5vlC5m4YZBRbADl358T8FTXgy7cg0KGXN/4THalDzSNQVqqgeB8jMIl
         Cp6uibQuxloJfUgQlRarhrzJmkIphBxpiX+CsbSkvHPlPClYohA27YaFDBrd/frVAnSG
         sLesAynEwEqMnArPnMVi1HzEbZ8ApiawkUfnvGXxX+l/SQjYMA3XasDv3q6TkghGdMTu
         dGKw==
X-Gm-Message-State: AOJu0YzW5UIv3JjhMhaLwCJ/y/JZHe3CJbgpuz26iOlBpak0NDm8ZdiR
	C4vY9kL0Oy+m98Pp/fCdh5Yv3ODUXZWF4/CB60Wj1TsvNqqisbRe9mqIvTOh4Tq1jas=
X-Gm-Gg: ASbGncvqtZ2MNqDay6E4R5QCxCeWBl3vR7BRu3o27oTGO5bBKRYW7H1lfbVfH7kLb4t
	vSayMQJzK4xSxJrT6Q0JT0C+4DDXV0Cy6HV2RnRLFJBwMYnHgbQ+uc/ZLuoXheKNh7I6kwIU+Dj
	MNBcPpkrpxsSM+FBEcuNd1VAm25jLMMwyd1nx/RVDQODZ1tbZupHjZvPFo64n/axI4m+9Kvh3Xu
	LTQKhQNYfeaUN5AD9/re+KRGfct2zcD9Jrc1yxQMH0fuR+FuemIZfdzxuJ6ewKP4fulPZqXrC2x
	W+zMQsqIRkQx4KJKWdGI0M2StMMmhgwOdeI79sIcZQOxV94kfSKBjet6briyAT/HCjNXZb6wxwQ
	CPGsbl12iQE6x+bNP3XKFJldp4VZd1ZkhinVUS0kWZYF17iXKIsd8tHhMGWIdok40ZuR/DhGYOe
	EgYMPt12XgDn8WpNLR/2I=
X-Google-Smtp-Source: AGHT+IFxQ7JkZZfaB476dGmISNTL1lZ3jMkfAy+OvS9OYEaehjoDsIOQ0nLG6IoE+CEVTZH9/YurZA==
X-Received: by 2002:a05:600c:4ed1:b0:45d:d291:5dc1 with SMTP id 5b1f17b1804b1-467eb8e216emr94817635e9.15.1758490857615;
        Sun, 21 Sep 2025 14:40:57 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f64ad30csm201206795e9.23.2025.09.21.14.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Sep 2025 14:40:57 -0700 (PDT)
Message-ID: <9139706a-708c-4be6-a994-120cce0cd0e6@linaro.org>
Date: Sun, 21 Sep 2025 22:40:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/12] firmware: qcom_scm: Introduce PAS context
 initialization and destroy helper
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
 <VaE1QImrKf8gxtMr-dFBEHJ0Mv9-1ugwsOz5I1Uaz1PXt6aJMrWR7G3c5bN74hJYzy5v6_obB1OqKgtgdbCUcw==@protonmail.internalid>
 <20250921-kvm_rproc_pas-v3-3-458f09647920@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250921-kvm_rproc_pas-v3-3-458f09647920@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/09/2025 20:41, Mukesh Ojha wrote:
> When Secure Peripheral Authentication Service (PAS) method runs on a
> SoC where Linux runs at EL2 (Gunyah absence) where reset sequences

"i.e. runs without the Gynyah Hypervisor then, reset sequences"

> move to EL3 and Linux need to do some extra stuff before calling PAS
> SMC calls like creating SHMbridge. So, PAS SMC call need awareness and
> need handling of things required when Linux run at EL2.

"Therefore the PAS SMC call"

> 
> Currently, remoteproc and non-remoteproc subsystems use different

"Currently remoteproc"

> variants of the MDT loader helper API, primarily due to the handling of
> the metadata context. Remoteproc subsystems retain metadata context
> until authentication and reset is done, while non-remoteproc subsystems
> (e.g., video, graphics, ipa etc.) do not need to retain it and can free

"do not need to retain metadata context"

> the context right inside qcom_scm_pas_init() call based on passed context
> parameter as NULL.
> 
> So, in an attempt to unify the metadata API process for both remoteproc

"In an attempt to unify"

> and non-remoteproc subsystems and to make the SMC helper function
> cleaner whether SoC running with Gunyah presence or absence by introducing
> a dedicated PAS context initialization and destroy function. Context
> initialization beforehand would help all SMC function to carry it and do
> the right thing whether SoC is running with Gunyah presence or absence.

Since you need to do another version of this patch re: below, please 
tidy up the commit log here a bit too.

> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>   drivers/firmware/qcom/qcom_scm.c       | 53 ++++++++++++++++++++++++++++++++++
>   include/linux/firmware/qcom/qcom_scm.h | 11 +++++++
>   2 files changed, 64 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 3379607eaf94..1c6b4c6f5513 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -558,6 +558,59 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
>   		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
>   }
> 
> +/**
> + * qcom_scm_pas_ctx_init() - Initialize peripheral authentication service
> + *			     context for a given peripheral and it can be
> + *			     destroyed with qcom_scm_pas_ctx_destroy() to
> + *			     release the context
> + *
> + * @dev:	  PAS firmware device
> + * @pas_id:	  peripheral authentication service id
> + * @mem_phys:	  Subsystem reserve memory start address
> + * @mem_size:	  Subsystem reserve memory size
> + *
> + * Upon successful, returns the PAS context or ERR_PTR() of the error otherwise.
> + */
> +void *qcom_scm_pas_ctx_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
> +			    size_t mem_size)
> +{
> +	struct qcom_scm_pas_ctx *ctx;
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
> +EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_init);
> +
> +/**
> + * qcom_scm_pas_ctx_destroy() - release PAS context
> + * @ctx:	PAS context
> + */
> +void qcom_scm_pas_ctx_destroy(struct qcom_scm_pas_ctx *ctx)
> +{
> +	kfree(ctx->metadata);
> +	ctx->metadata = NULL;
> +	ctx->dev = NULL;
> +	ctx->pas_id = 0;
> +	ctx->mem_phys = 0;
> +	ctx->mem_size = 0;
> +	kfree(ctx);
> +}

This looks a bit strange, manually destructing an object you then free. 
I get the argument you might make about use-after-free but, I don't 
think this level of defensive coding is necessary.

> +EXPORT_SYMBOL_GPL(qcom_scm_pas_ctx_destroy);
> +
>   /**
>    * qcom_scm_pas_init_image() - Initialize peripheral authentication service
>    *			       state machine for a given peripheral, using the
> diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
> index a13f703b16cd..e3e9e9e9077f 100644
> --- a/include/linux/firmware/qcom/qcom_scm.h
> +++ b/include/linux/firmware/qcom/qcom_scm.h
> @@ -72,6 +72,17 @@ struct qcom_scm_pas_metadata {
>   	ssize_t size;
>   };
> 
> +struct qcom_scm_pas_ctx {
> +	struct device *dev;
> +	u32 pas_id;
> +	phys_addr_t mem_phys;
> +	size_t mem_size;
> +	struct qcom_scm_pas_metadata *metadata;
> +};
> +
> +void *qcom_scm_pas_ctx_init(struct device *dev, u32 pas_id, phys_addr_t mem_phys,
> +			    size_t mem_size);
> +void qcom_scm_pas_ctx_destroy(struct qcom_scm_pas_ctx *ctx);
>   int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
>   			    struct qcom_scm_pas_metadata *ctx);
>   void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx);
> 
> --
> 2.50.1
> 
> 

Once fixed.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

