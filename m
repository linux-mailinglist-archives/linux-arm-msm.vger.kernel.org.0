Return-Path: <linux-arm-msm+bounces-41628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 157CE9EDCF3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 02:09:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 115922832A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 01:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970D536AEC;
	Thu, 12 Dec 2024 01:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OXXgCV+X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0D118028
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 01:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733965777; cv=none; b=k14hryHfiFAG+lvtUCjnr7OD/iNCLUevgp+hZOmAg3lkv9x7tBgPAcgc3sWG9Lpuxbl4BYEZMpv/AekaC0E4o18e5GUz6yrrSsesUQmFm3C2/aCdk2xefaUisJxWM+ZvBD1mZXnfBTL9pRHl0Ks7hyIFR3P8oZIJs9xNdo8RL8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733965777; c=relaxed/simple;
	bh=qv6OvIXWsYjVmNDnmi27QYO7K3Ldrx/3qmudjTkRhOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S05s0gfgU9LOwtI1L9jVvy4ARy0tbXnhGi8y5Q5GEg7+/MEHyX55a3AqwVxQamneudflvMCj/GA7YyBi1htB682fD8ciu0eAb1vF1TDfioemcaM5oztT8OM35gjjAgKotATq258/zLWtMNfeJgEOCVWZ8v1QTTlulp4PItxNySo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OXXgCV+X; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53e395932c6so12048e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 17:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733965772; x=1734570572; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gn9/HJ6VMzSGcGaxW/y8OLh9unHBkAJxM422iTplG24=;
        b=OXXgCV+XyDKtnMBAUy67lAsg+jul86ow4DOlxcLS/FMXKnZ7i+I/HwGf20cNrf39FV
         v4DJDy5CYG181Z/J1sAN9MsbyebJPfsorHlpsGWLyZ+Sp7NSXaaesQ3comF2vj84MWz0
         JchqiFBkRp1v3tKi0Hg6sDkaxGxRMNN8N7JrhV1qNNe4Hqs2nJ4LM1uUzjFKfm14JJir
         qc8uQGvPYsgVwp0yrUTIZaESYjruWk7eB4VnecGkMTQJ1GP/eA+uzWQ3/jC/j1/H/kE9
         vmaoe1EDNy/b+X7nPJOHCK9AEOIuPbmw+MnU2bDzVanFt3s/omSfFfyHX8F0o19BUvUi
         +jsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733965772; x=1734570572;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gn9/HJ6VMzSGcGaxW/y8OLh9unHBkAJxM422iTplG24=;
        b=YJ8q/ylywXIRChltAHu1hKepZV2EIlLx7/oU2NttCUvC9mUsmx0Oj9qTbE5gMFmPhO
         3Ioz47TjM0oOXY+FWsgVnqG3V4uUK9dIRkR9+tUx3oO1bU8KNmYvu1/85sPLXW/XgaKQ
         VAHt1H/eGb7pnhHPmdPqMN4pon9u9nlnFXNx8+VyfT9FbDwCaABJM2RnccvyC1oGhWDM
         jQ4tmN4aOGV9vcKkmmZDum4haqFFPrGKjlAOCljFMV4Pv13wDkKXGwkKvEBsmenovb3s
         9cpCCNpkwR+RzqJUL5kmg2q/0MN9+JdU4Nu0y62UTF+3uFwoE1SwhWu/xlZoSDDFCpKM
         5jZg==
X-Forwarded-Encrypted: i=1; AJvYcCWLDr0jl5JD044Aa7SI/INQyag8IsBRYkdQ1Zitd8F5Qr8JrvkTBH1CODpm7w9lKPesew5Z4LFoxsorUwvR@vger.kernel.org
X-Gm-Message-State: AOJu0YzKM2OKdGFC8rPalQswfMXMTeQKqS3IVmCyx72u4rLYv9EYGjFA
	rqtn40zXesEeOxpUZrwrwqmVl2IKraC5l26OYFwuhPHH53vTQKKsLl3o4lzU5mE=
X-Gm-Gg: ASbGncu94K6NV4aILrMFfDXVgvjzs2maHh8/1Etw+uNhXl+PL/RR6c0VvIj/1sqwqde
	Y6Q4TkdEfWn8scL07lBkAncTcod388iPY4dZDVxGILxK++8kYFvJ5ju2SQT1CVCBO0rN8TnLHgx
	5/CkcoQvGpOFKr1wfITJZlNdB9vtHZXwsx2/gEHwe8TBaRfJxX8lJy4nnUA66mIBsDEG2lerxS0
	wL7jvGIrKgyghFF2AKsVhF2M/puu8LjDIPtJcECv6IuldI9k2/Aq1QoRH545Ny+u93HYBsIgVyr
	GYLZIJlHouiSF6m8lUAju0J6mFq3zWqEK40=
X-Google-Smtp-Source: AGHT+IHRJbCRF9Jm0y8nQsEY/6+MzdeRL4pBScxOAhsjaPVS6Xq51uBxkCQytZMf4/xdGli7wFb9qQ==
X-Received: by 2002:a05:651c:b28:b0:302:27c6:fc7b with SMTP id 38308e7fff4ca-30249e053bcmr1830891fa.6.1733965772467;
        Wed, 11 Dec 2024 17:09:32 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30231594b18sm7330921fa.16.2024.12.11.17.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 17:09:31 -0800 (PST)
Message-ID: <1ac23fa1-fc35-45fb-9338-d5f304c869ba@linaro.org>
Date: Thu, 12 Dec 2024 03:09:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/16] media: qcom: camss: Add callback API for RUP update
 and buf done
Content-Language: ru-RU
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
 <20241211140738.3835588-10-quic_depengs@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241211140738.3835588-10-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Depeng and Bryan.

On 12/11/24 16:07, Depeng Shao wrote:
> The RUP registers and buf done irq are moved from the IFE to CSID register
> block on recent CAMSS implementations. Add callbacks structure to wrapper
> the location change with minimum logic disruption.
> 
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

It's unexpected to see two your Signed-off-by: tags, either one is invalid
or the authorship of the change shall be changed appropriately.

> ---
>   .../media/platform/qcom/camss/camss-csid.h    |  9 ++++++++
>   drivers/media/platform/qcom/camss/camss.c     | 22 +++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h     |  3 +++
>   3 files changed, 34 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index f52209b96583..1369e7ea7219 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -152,6 +152,14 @@ struct csid_hw_ops {
>   	 * @csid: CSID device
>   	 */
>   	void (*subdev_init)(struct csid_device *csid);
> +
> +	/*
> +	 * reg_update - receive message from other sub device
> +	 * @csid: CSID device
> +	 * @port_id: Port id
> +	 * @is_clear: Indicate if it is clearing reg update or setting reg update
> +	 */
> +	void (*reg_update)(struct csid_device *csid, int port_id, bool is_clear);
>   };
>   
>   struct csid_subdev_resources {
> @@ -168,6 +176,7 @@ struct csid_device {
>   	struct media_pad pads[MSM_CSID_PADS_NUM];
>   	void __iomem *base;
>   	u32 irq;
> +	u32 reg_update;
>   	char irq_name[30];
>   	struct camss_clock *clock;
>   	int nclocks;
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 9fb31f4c18ad..e24084ff88de 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2087,6 +2087,28 @@ static int camss_link_entities(struct camss *camss)
>   	return 0;
>   }
>   
> +void camss_reg_update(struct camss *camss, int hw_id, int port_id, bool is_clear)
> +{
> +	struct csid_device *csid;
> +
> +	if (hw_id < camss->res->csid_num) {
> +		csid = &camss->csid[hw_id];
> +
> +		csid->res->hw_ops->reg_update(csid, port_id, is_clear);
> +	}
> +}
> +
> +void camss_buf_done(struct camss *camss, int hw_id, int port_id)
> +{
> +	struct vfe_device *vfe;
> +
> +	if (hw_id < camss->res->vfe_num) {
> +		vfe = &camss->vfe[hw_id];
> +
> +		vfe->res->hw_ops->vfe_buf_done(vfe, port_id);
> +	}
> +}
> +
>   /*
>    * camss_register_entities - Register subdev nodes and create links
>    * @camss: CAMSS device
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 9da7f48f5dd7..6dceff8ce319 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -161,5 +161,8 @@ void camss_pm_domain_off(struct camss *camss, int id);
>   int camss_vfe_get(struct camss *camss, int id);
>   void camss_vfe_put(struct camss *camss, int id);
>   void camss_delete(struct camss *camss);
> +void camss_buf_done(struct camss *camss, int hw_id, int port_id);
> +void camss_reg_update(struct camss *camss, int hw_id,
> +		      int port_id, bool is_clear);
>   
>   #endif /* QC_MSM_CAMSS_H */

--
Best wishes,
Vladimir

