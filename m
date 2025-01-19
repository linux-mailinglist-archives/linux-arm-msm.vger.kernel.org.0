Return-Path: <linux-arm-msm+bounces-45523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E27F0A16308
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 17:57:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 107EC164156
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 16:57:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7111DF973;
	Sun, 19 Jan 2025 16:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QytANKqB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3761DF742
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jan 2025 16:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737305859; cv=none; b=TFsAyWsncKdu+dIVnDh89XBFID10sGMFYl8LnJ+5IazWTpajCIrjJSU3/o2opywAPZDNbTMOMJorjDd6wJnzwmra1RbCj8m7yqlw07tvmPUPfwxjvDDsL+SX2nsrGvpKr3e2bx3NsX/v+n7DRWPgGMqvHn0SC+zzMPYCVlg41l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737305859; c=relaxed/simple;
	bh=OXYO0T7rIEvVXR1OPVg2/XaOdqsk7JqB0nHWGkAq3C0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DsHCqJXBl/SiTEmXcsGtBKFwUMSctPfyGy8WjaDFhrnXpgXSJfPLmF7jOiGHZr0eiDrlK4tTwHDsxF3uXngZb7XKj8G2LsXPpZQ3ZsfgNOcQycJSnMUNFXUAZYenOX85QdJAsnpG8WurvcD2ENWt5WXSiueCrxIGSWJ40MyX5rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QytANKqB; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43618283d48so25630495e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jan 2025 08:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737305856; x=1737910656; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qmmb4zqZ9p+siFdSZXdznAkxBlMcr3SpDaxiDo2SWyU=;
        b=QytANKqBNlhgeQUeujFznb2OissSo02RNtBCnzCZxx27YQD1qgVOA54c1ckXBlg52o
         mDxOkRy44Z8/XgLS9EGVHplM+Geljq/TzsFx3nlZm/jwhxNO8Xdatcc6v8Vnol0f37It
         MPpeEcwPk+wQ2XNUbV1XsMC0qZRDCFr88GA9zNEc5nNf18zzI48cBPz0Uk9BvKntt1l3
         pACuYSykRTCEWjvDeHle2pue/ky27x/fpcdp/3B/hoArQ0Wex9Kz3JBtSMtdgvYqsvpV
         rjGquyAnKyHH90txJXEPm0uFMGQR1qP0IKs9/FXAq3Afget/dL5LlhY09WOUtrfB98Ev
         IBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737305856; x=1737910656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmmb4zqZ9p+siFdSZXdznAkxBlMcr3SpDaxiDo2SWyU=;
        b=wH6pQrSfrl1rSLoSPwFYMx83EwoCD9jVjRlrHJgRTF7vfwlVwsRYO58bzIYKZzszx5
         SWROVg+KX5WjjfYjF5RMlACmJZQ1sc6qAImiSnC1BIsFZmqlxGXpp9VcIfcAPsPqdK42
         O1DiocD9kGhmZ24UmaIvzlolPKVb8AuAW7oBZlYYPWKW8hvgMiHsMGi3dfnlM0rM/dmn
         Tj41stdph9cyNsaE+aChU4Yi18i6xp7N+tOuC/yzF6ZxMZhkPIDwJtxBzWNsq6oghxig
         fIY89ByhLmZcqfuCvX6NJTtpkPK1SEE0grV6UdKKvudNx0VDsuct1E3jlIpqLTN+mWLZ
         eziQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeqVn45WWSlHq5z50gTGPa/+upy5DAWtE6Kb+Sdr6gJjnw/a+Q7kszURKG2jBFKHwq12Z8fijLmecYjo2W@vger.kernel.org
X-Gm-Message-State: AOJu0YwS+W454zAtMX5ihdvsOvb/E7CU8n/s+F1CFZ7Xqt52X92MgEBY
	iOHWourFqLXlYVONj8f4v0M8K/BJCXJyrebtIOy+rqMb2wnWpIuknXN8FBaXTaQ=
X-Gm-Gg: ASbGncu17pg7lvaDL11DDVUhf/I/G5raV9ytNwEUQShChTUtXrHv6TdpuQ4Q0B+yyAf
	UPtuxeuKt1RwUwGoeY1ekhjxm9UEyVrIyL+SoPF2AY7cVFRfehKviZF0dVQwddpde7PRQ1Oc6vp
	EX79WyXRNXHIKFzKPowcx4NVssbq0oVAqy/I2w+mjeZ6N9DJ76JRFp4g7omHZWbIlsmdsEreGl8
	JuArvjCJnRVzhZ9hFdlpGiOpIUy0FvjamPSlB+NxGBofgwpCvlE1i3Uob7zzbI4CaPi
X-Google-Smtp-Source: AGHT+IFIEiBSMQ4j5lMnpSAdnhTiXrPNymMtDHfM0cHBf/ZM58+IWBa3SM92dBvbDqsFvOWiTieU0Q==
X-Received: by 2002:a05:600c:510c:b0:434:a1e7:27b0 with SMTP id 5b1f17b1804b1-438913ccd4amr117549975e9.11.1737305855586;
        Sun, 19 Jan 2025 08:57:35 -0800 (PST)
Received: from linaro.org ([86.123.96.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4389041fe29sm107187745e9.22.2025.01.19.08.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 08:57:34 -0800 (PST)
Date: Sun, 19 Jan 2025 18:57:32 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Eric Biggers <ebiggers@google.com>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-scsi@vger.kernel.org, andre.draszik@linaro.org,
	peter.griffin@linaro.org, willmcvicker@google.com,
	kernel-team@android.com
Subject: Re: [PATCH v2 1/4] soc: qcom: ice: introduce devm_of_qcom_ice_get
Message-ID: <Z40u/DkEQIK9naI2@linaro.org>
References: <20250117-qcom-ice-fix-dev-leak-v2-0-1ffa5b6884cb@linaro.org>
 <20250117-qcom-ice-fix-dev-leak-v2-1-1ffa5b6884cb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117-qcom-ice-fix-dev-leak-v2-1-1ffa5b6884cb@linaro.org>

On 25-01-17 14:18:50, Tudor Ambarus wrote:
> Callers of of_qcom_ice_get() leak the device reference taken by
> of_find_device_by_node(). Introduce devm variant for of_qcom_ice_get().
> Existing consumers need the ICE instance for the entire life of their
> device, thus exporting qcom_ice_put() is not required.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Good catch. LGTM.

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/soc/qcom/ice.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>  include/soc/qcom/ice.h |  2 ++
>  2 files changed, 50 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index 393d2d1d275f..79e04bff3e33 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -11,6 +11,7 @@
>  #include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> +#include <linux/device.h>
>  #include <linux/iopoll.h>
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
> @@ -324,6 +325,53 @@ struct qcom_ice *of_qcom_ice_get(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(of_qcom_ice_get);
>  
> +static void qcom_ice_put(const struct qcom_ice *ice)
> +{
> +	struct platform_device *pdev = to_platform_device(ice->dev);
> +
> +	if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "ice"))
> +		platform_device_put(pdev);
> +}
> +
> +static void devm_of_qcom_ice_put(struct device *dev, void *res)
> +{
> +	qcom_ice_put(*(struct qcom_ice **)res);
> +}
> +
> +/**
> + * devm_of_qcom_ice_get() - Devres managed helper to get an ICE instance from
> + * a DT node.
> + * @dev: device pointer for the consumer device.
> + *
> + * This function will provide an ICE instance either by creating one for the
> + * consumer device if its DT node provides the 'ice' reg range and the 'ice'
> + * clock (for legacy DT style). On the other hand, if consumer provides a
> + * phandle via 'qcom,ice' property to an ICE DT, the ICE instance will already
> + * be created and so this function will return that instead.
> + *
> + * Return: ICE pointer on success, NULL if there is no ICE data provided by the
> + * consumer or ERR_PTR() on error.
> + */
> +struct qcom_ice *devm_of_qcom_ice_get(struct device *dev)
> +{
> +	struct qcom_ice *ice, **dr;
> +
> +	dr = devres_alloc(devm_of_qcom_ice_put, sizeof(*dr), GFP_KERNEL);
> +	if (!dr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ice = of_qcom_ice_get(dev);
> +	if (!IS_ERR_OR_NULL(ice)) {
> +		*dr = ice;
> +		devres_add(dev, dr);
> +	} else {
> +		devres_free(dr);
> +	}
> +
> +	return ice;
> +}
> +EXPORT_SYMBOL_GPL(devm_of_qcom_ice_get);
> +
>  static int qcom_ice_probe(struct platform_device *pdev)
>  {
>  	struct qcom_ice *engine;
> diff --git a/include/soc/qcom/ice.h b/include/soc/qcom/ice.h
> index 5870a94599a2..d5f6a228df65 100644
> --- a/include/soc/qcom/ice.h
> +++ b/include/soc/qcom/ice.h
> @@ -34,4 +34,6 @@ int qcom_ice_program_key(struct qcom_ice *ice,
>  			 int slot);
>  int qcom_ice_evict_key(struct qcom_ice *ice, int slot);
>  struct qcom_ice *of_qcom_ice_get(struct device *dev);
> +struct qcom_ice *devm_of_qcom_ice_get(struct device *dev);
> +
>  #endif /* __QCOM_ICE_H__ */
> 
> -- 
> 2.48.0.rc2.279.g1de40edade-goog
> 

