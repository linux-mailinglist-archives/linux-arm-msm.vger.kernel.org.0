Return-Path: <linux-arm-msm+bounces-17781-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AE48A8F8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 01:39:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 889271F215DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 23:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2524885948;
	Wed, 17 Apr 2024 23:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EbOPbH5r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D778563E
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 23:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713397194; cv=none; b=vDycV/lcHQ/JpKKBsQI35kj5Gush5HB+3B95EYrHhhou0HVsDmrMtHcxB1XUPvdr3yCntLmYccJbet+K4G6mkf5Rm9/MkKbUOOUE0HN5cmcgVJPeKHM4risQe1NmWnlQFvc37+bhM2UyzvWSOzi8hBZ/W/cIyz9UWyW2AUShi2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713397194; c=relaxed/simple;
	bh=1o5HeHJHlx5R3sy2wEoF07WFMXrzF1sR8x8kIpOdkTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WxudkM9N0qyi2ED9xSuG1r5im5ydVKhHYT98QEULNyzyp7+AdS9fE4i8xKN3PMKRIAjPmRuPVjQIGQQ9fYKlfDabVP913flMKc/fxjI6MkKeYnAvgBXpnj5ZyZCY1e0Zx0MuDg9flDkLJpLmAUHME9td8BzJOeVrKepsyW5M1q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EbOPbH5r; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5196fe87775so79869e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 16:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713397190; x=1714001990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sixR/gBOEBj5qXOGxidlJSRG/Di+AE5aPpjezwvz9zc=;
        b=EbOPbH5rw0tSTJxEOSrD8MyUr/2Es/5qQk3W1NdR/0Yn+n2Z39j7YBFruoAwfzvIw8
         KVWJ39pKWOhFmIAZtCPTfbuOBQWFoOK9snpQfpeG2kkNXvgbQFSSwz8bQ0f0DdDRh1go
         usv46w6T9xNVTM+W+m3pPJSXTUufVW9DOIIFhXvG8mKCKUqwyXaNniNqEPK05k3iQ4fv
         HHmzjE0nnnlMDCrQCYzcKrf+KJfP5rC58Zv+Xl/Ci8iXB1t1ciAGGp6DsAbd3G70LZt2
         tiMfPo/Q8AU5NHFscERr23kZe6R3O+gbQa3xMRfIJk3PjTgPgyLSYoDNVZrFevDFtl5/
         +ltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713397190; x=1714001990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sixR/gBOEBj5qXOGxidlJSRG/Di+AE5aPpjezwvz9zc=;
        b=TvnqaIuDlvd0C8EnkSjinaVPRydbUqXrFC9htQOTSOeEzow0c0i+euOlDm5/g47+bX
         x1ybAzPKIMH0YFVZ0qPFi1nbWNuFI+O0Bq9ECr4w6s6TtDx2qVkm/+kRrGCHvR0bl1ud
         sudgXZ+0mEPh3XGXV5WtplDeJJTHthuHTr7JesF0fs1R59M4fvcB3apN7B/uAAsTzvMZ
         /tpKtKaAfbib9ozlnb6IriJjaqbt9Ibwhtb8Vvo/izwE/RCP9Re4sGJvX/WIriRdcNK9
         TSKjIcUUAJredoN/nphczH29LkV3+77iknKM5DW5cxPYnUPoEx3Msoul7yt5qAQWvR56
         63CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVturuR+epFChb+WnjT52fvoCOq28TM0HBXEOZ+xdtnIRaL1+LTe1N8vhceTQi9vEhYY3IIJ02PdBLwmbiTP6akLMLM+31xMaOgjDxKIg==
X-Gm-Message-State: AOJu0Yz+8cdsxZn5QOtaWXL+birOhldoRS74iDkTkqH/K/yeiNb0D9nJ
	wzA8a6psD8btnjz1R3jXR6POsRd9P78BK8XucUcXk1FPj4uNIBbQZsX9YM7W/zQ=
X-Google-Smtp-Source: AGHT+IFKufzXZ2Gsb5UM4eMIb+d0hKtHZUWXaUXnT14pNS5nm7ekyhYyeZIFtXrBF22KdOM7pdZbOw==
X-Received: by 2002:ac2:5b9c:0:b0:513:21a9:79a8 with SMTP id o28-20020ac25b9c000000b0051321a979a8mr463106lfn.62.1713397190424;
        Wed, 17 Apr 2024 16:39:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 19-20020ac24833000000b00518c3a390dfsm36302lft.67.2024.04.17.16.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 16:39:50 -0700 (PDT)
Date: Thu, 18 Apr 2024 02:39:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/7] soc: qcom: smem: Add a feature code getter
Message-ID: <mg6ojmzl3snj3k6fuyi6opkbdovs7xna6sn65pjh52ii4yy7u6@ny2spvjjbfpu>
References: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
 <20240404-topic-smem_speedbin-v2-2-c84f820b7e5b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404-topic-smem_speedbin-v2-2-c84f820b7e5b@linaro.org>

On Wed, Apr 17, 2024 at 10:02:54PM +0200, Konrad Dybcio wrote:
> Recent (SM8550+ ish) Qualcomm SoCs have a new mechanism for precisely
> identifying the specific SKU and the precise speed bin (in the general
> meaning of this word, anyway): a pair of values called Product Code
> and Feature Code.
> 
> Based on this information, we can deduce the available frequencies for
> things such as Adreno. In the case of Adreno specifically, Pcode is
> useless for non-prototype SoCs.
> 
> Introduce a getter for the feature code and export it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/soc/qcom/smem.c          | 33 +++++++++++++++++++++++++++++++++
>  include/linux/soc/qcom/smem.h    |  1 +
>  include/linux/soc/qcom/socinfo.h | 26 ++++++++++++++++++++++++++
>  3 files changed, 60 insertions(+)
> 
> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index 7191fa0c087f..29e708789eec 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -795,6 +795,39 @@ int qcom_smem_get_soc_id(u32 *id)
>  }
>  EXPORT_SYMBOL_GPL(qcom_smem_get_soc_id);
>  
> +/**
> + * qcom_smem_get_feature_code() - return the feature code
> + * @code: On success, return the feature code here.
> + *
> + * Look up the feature code identifier from SMEM and return it.
> + *
> + * Return: 0 on success, negative errno on failure.
> + */
> +int qcom_smem_get_feature_code(u32 *code)
> +{
> +	struct socinfo *info;
> +	u32 raw_code;
> +
> +	info = qcom_smem_get(QCOM_SMEM_HOST_ANY, SMEM_HW_SW_BUILD_ID, NULL);
> +	if (IS_ERR(info))
> +		return PTR_ERR(info);
> +
> +	/* This only makes sense for socinfo >= 16 */
> +	if (__le32_to_cpu(info->fmt) < SOCINFO_VERSION(0, 16))
> +		return -EOPNOTSUPP;
> +
> +	raw_code = __le32_to_cpu(info->feature_code);
> +
> +	/* Ensure the value makes sense */
> +	if (raw_code >= SOCINFO_FC_INT_MAX)
> +		raw_code = SOCINFO_FC_UNKNOWN;
> +
> +	*code = raw_code;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(qcom_smem_get_feature_code);
> +
>  static int qcom_smem_get_sbl_version(struct qcom_smem *smem)
>  {
>  	struct smem_header *header;
> diff --git a/include/linux/soc/qcom/smem.h b/include/linux/soc/qcom/smem.h
> index a36a3b9d4929..0943bf419e11 100644
> --- a/include/linux/soc/qcom/smem.h
> +++ b/include/linux/soc/qcom/smem.h
> @@ -13,5 +13,6 @@ int qcom_smem_get_free_space(unsigned host);
>  phys_addr_t qcom_smem_virt_to_phys(void *p);
>  
>  int qcom_smem_get_soc_id(u32 *id);
> +int qcom_smem_get_feature_code(u32 *code);
>  
>  #endif
> diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
> index 10e0a4c287f4..52439f48428f 100644
> --- a/include/linux/soc/qcom/socinfo.h
> +++ b/include/linux/soc/qcom/socinfo.h
> @@ -3,6 +3,8 @@
>  #ifndef __QCOM_SOCINFO_H__
>  #define __QCOM_SOCINFO_H__
>  
> +#include <linux/types.h>
> +
>  /*
>   * SMEM item id, used to acquire handles to respective
>   * SMEM region.
> @@ -82,4 +84,28 @@ struct socinfo {
>  	__le32 boot_core;
>  };
>  
> +/* Internal feature codes */
> +enum qcom_socinfo_feature_code {
> +	/* External feature codes */
> +	SOCINFO_FC_UNKNOWN = 0x0,
> +	SOCINFO_FC_AA,
> +	SOCINFO_FC_AB,
> +	SOCINFO_FC_AC,
> +	SOCINFO_FC_AD,
> +	SOCINFO_FC_AE,
> +	SOCINFO_FC_AF,
> +	SOCINFO_FC_AG,
> +	SOCINFO_FC_AH,
> +};
> +
> +/* Internal feature codes */
> +/* Valid values: 0 <= n <= 0xf */
> +#define SOCINFO_FC_Yn(n)		(0xf1 + n)
> +#define SOCINFO_FC_INT_MAX		SOCINFO_FC_Yn(0x10)

This is 0x101 rather than 0x100 or 0xff. Is that expected?

> +
> +/* Product codes */
> +#define SOCINFO_PC_UNKNOWN		0
> +#define SOCINFO_PCn(n)			(n + 1)
> +#define SOCINFO_PC_RESERVE		(BIT(31) - 1)

This patch works on fcodes, why do we have PCode defines here?

> +
>  #endif
> 
> -- 
> 2.44.0
> 

-- 
With best wishes
Dmitry

