Return-Path: <linux-arm-msm+bounces-46475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E496A218D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 09:19:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F1847A23E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 08:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB4619CC22;
	Wed, 29 Jan 2025 08:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LVQPQi6s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB2119C578
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 08:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738138739; cv=none; b=ZP7AcwmtBFpzQxxMQYK7YM6E3spQ/DjGWR4SsNmnts5ybOsFJYjZstOrbVrPIYIFFSe1NsIc9FEyW/U+cwqdPBkSOiJZ9fW0dzvho/A3pZsjxPsUe3zf4cM/UlNQWR0JbwEaWsngD7h0AGOtE51odhPNdlPcIG0gNGbkfeYBKTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738138739; c=relaxed/simple;
	bh=q9PcrzMuPfzgLcPzUpwqZmNu5XymU513cnx6sVwWVFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hhtESkwsqhTUcqQbJPjoXTyCqx+juFqPZfgzflP0fdwWxWkwai4qt0djeC8DMiMi8z58RWP+MWaFkfPcOMo/0D8J3ikTeWDFo+rl9YYwk6rh1F3J360YKZMqJQTjN6d85wuOaS3VJPSHk0jVhqx2OiGyEGazv5bFxLlE/4QOqD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LVQPQi6s; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38be3bfb045so278235f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 00:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738138736; x=1738743536; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sBd/IvDhQt1+2TptVTpiJN0NIdUgTEfHIRo89ZFgCVk=;
        b=LVQPQi6sNCb7mX5kgBxlrNFrqxlYx7PpCL/oZyUHeB0wjRtCv9znVMIJfwREwKQVeL
         DVBPF6Dogv3MexTgLpO1lP0awAjim5pThUbSWLmp6d5FO/z4zFTOEYIjfbINyuWN9c0G
         46gvuDSP9vmyOeA0kNvKqltYjkRj+93wKtYX+gs8ebGIYn/q7mbaDtWXSLlySpevrkGC
         OhMYdfNssrzmuNc1nqIkfzTbYO7f3qB65fZYVctET0phQ8iaLyBA9SgB3ePvXrqzJc6B
         NbBRX5AIU/UCrHXDBHM2Qrcg5vk1OpaXJ38bASdxtKZGOdnwFcTYjbU1YcLoi92kA7Cd
         P/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738138736; x=1738743536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBd/IvDhQt1+2TptVTpiJN0NIdUgTEfHIRo89ZFgCVk=;
        b=u0R+pOeoO6oKxanCqrxAlVM3/Pxs7r8A5lcRkvJ4jgF04YT7caSnCIg6z87iaS4A6L
         vZ9WBydAfEQv9yrXHAasXFgXkFkD6xARyu4zlIJ4Mp8wxULGcmYGmgEgP4rvVwYoGvAU
         DHtMRf4edJMl5jVVYSAWNpVUEmgp8pJzZXY0Bs8IKf0O4z0ezcRO7mqMhGNyleJ+5pCb
         r6tYv/0KYK8mdXGPvuBn6UMEJxyHwfWvvYzIkFt8Zchyjdig2vt1kiEpfLONfBoliDt9
         Ia4lSVNzaQpw9HIazMBaPdcMXetesxZ70jq0ZiTDeM5nYNK0GKgSyXoK9/VCjgPITGGZ
         /YhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyFWhjdG+oAT3rQOBdJAol3mNDx65NP71/W4IAe5Y87L8SjuaTYP2cMNLfe2QgPZIjk5xBLPeEF/dxGf3e@vger.kernel.org
X-Gm-Message-State: AOJu0YxY/na9RzvYRBoY4ctc6ZEXzASKBLz6WTeGIm3deCWtljLov72z
	FlnjePKVF/gXjJzZVJ+9gzD/XqvU8i1YkZsT975vWwQcUSZ160kFDV4yJlAqvD0=
X-Gm-Gg: ASbGncuiGlsI8q7lhEiKW/PnU1w3emAb9k2CiGxwjTkwXszSiS/9Ik0LBvoL/9tLT2o
	Dwsb/De9gQj9FGDpdv1k5tabjlUFQ48xDqb90hXoODXGNb3zadNV1PmzW8bDMqyxe6o+LHNbxoN
	AzLWGrO+vxEeG/ubX924nZBrf7BfWjSlXqjW3d9ggT2HALMnpQlyV2l0+cv/Hffx///aFMN5CyE
	kEm+5ClOyep5SP3vXGe3dgAc/yAQcE4DJAKIikr6x2ldjKpulasl4AaI6/S3xyKmyvd5psKFiwm
	ZlciUlph+LLon1LgnsseEQ==
X-Google-Smtp-Source: AGHT+IGmg5YJ8EYXcU1LFQKEauB6McbRp8WqEK3RkkgOQScrIqPuhUbg3IfCBmWCpqf/pdOzRDnMyA==
X-Received: by 2002:a05:6000:156d:b0:38c:24c6:5bdc with SMTP id ffacd0b85a97d-38c50fdff42mr1517193f8f.4.1738138735865;
        Wed, 29 Jan 2025 00:18:55 -0800 (PST)
Received: from linaro.org ([77.64.147.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a189283sm16542483f8f.59.2025.01.29.00.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 00:18:55 -0800 (PST)
Date: Wed, 29 Jan 2025 09:18:51 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom_q6v5_pas: Make single-PD handling
 more robust
Message-ID: <Z5nka5pi-e3Jcrbg@linaro.org>
References: <20250128-pas-singlepd-v1-0-85d9ae4b0093@lucaweiss.eu>
 <20250128-pas-singlepd-v1-2-85d9ae4b0093@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-pas-singlepd-v1-2-85d9ae4b0093@lucaweiss.eu>

On Tue, Jan 28, 2025 at 10:54:00PM +0100, Luca Weiss wrote:
> Only go into the if condition for single-PD handling when there's
> actually just one power domain specified there. Otherwise it'll be an
> issue in the dts and we should fail in the regular code path.
> 
> This also mirrors the latest changes in the qcom_q6v5_mss driver.
> 
> Suggested-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Fixes: 17ee2fb4e856 ("remoteproc: qcom: pas: Vote for active/proxy power domains")
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>

Not sure if Reviewed-by makes sense if I already did Suggested-by, but
anyway:

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Thanks for making these fixes!

> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index aca44bb6522f00cb525c4b816040445287444434..c1e9bbae61770ccad3e22d132a411bc6ced7180f 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -509,16 +509,16 @@ static int adsp_pds_attach(struct device *dev, struct device **devs,
>  	if (!pd_names)
>  		return 0;
>  
> +	while (pd_names[num_pds])
> +		num_pds++;
> +
>  	/* Handle single power domain */
> -	if (dev->pm_domain) {
> +	if (num_pds == 1 && dev->pm_domain) {
>  		devs[0] = dev;
>  		pm_runtime_enable(dev);
>  		return 1;
>  	}
>  
> -	while (pd_names[num_pds])
> -		num_pds++;
> -
>  	for (i = 0; i < num_pds; i++) {
>  		devs[i] = dev_pm_domain_attach_by_name(dev, pd_names[i]);
>  		if (IS_ERR_OR_NULL(devs[i])) {
> @@ -543,7 +543,7 @@ static void adsp_pds_detach(struct qcom_adsp *adsp, struct device **pds,
>  	int i;
>  
>  	/* Handle single power domain */
> -	if (dev->pm_domain && pd_count) {
> +	if (pd_count == 1 && dev->pm_domain) {
>  		pm_runtime_disable(dev);
>  		return;
>  	}
> 
> -- 
> 2.48.1
> 

