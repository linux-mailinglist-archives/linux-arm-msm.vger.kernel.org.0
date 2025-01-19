Return-Path: <linux-arm-msm+bounces-45525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C494FA16314
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 17:59:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB42E1884895
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 16:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DD831DF99F;
	Sun, 19 Jan 2025 16:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FUChneSB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86491DF733
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jan 2025 16:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737305977; cv=none; b=sSyl7pLpyJ0Zedz/Jr/5MRQZHEUoSGl81O055oc0ceEuCt2CeirsriCVQnaU23B2F0UFeoyi5l/u3iYJqd+BgVLfQZ+JIYbeE55QOmBY16kecP+LJfP72p51FuCQEcM5aGghcryGkfaRkFKyJ+8GRJo9RhfBk2mzI/cycFCQWaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737305977; c=relaxed/simple;
	bh=i8jlXieaT8KmwtG6JYMZ97nlaBgdfnq052Onnm3ehjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0Ng/u5KgLukHvN8+Bi3G1kBMkQLIOH8VXWd/NwwGEQMXOkM8qzHjHTMxpAh1fMsyzL07EnGqCeDiyB8IyZObW+MKh0qgHO2sWia/qfOANf4EmZ+7tobvyHxPgFdExwNJ2XSK79PiYprmNlBT5YzYkEBtjb7InmnrHXsNshKm8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FUChneSB; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so1972479f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jan 2025 08:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737305973; x=1737910773; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ryjgud0Cu35z0KcZwYmKJ/fOZn2jkkwEjHOVTa8VYFo=;
        b=FUChneSB8WMSrip1HVHKA0Q561mFMhPSUJA1Z0H6szMZvIUQifM3FatltyLCCl7v6N
         EP10NuSTsSqy2u8I81TlmCIOjVnNUkv1ixHJ3K8Uag42wakz+YDQPbIWbbOV8/YqYPR+
         on0jYC2oD52kJDkBIBieVl06KyCDIn5ld8F6VFf+WaNg39rkZeZv4Q7VHZeVXny7uuwG
         ucrKzLoJKbLePEL5cG0V/vXw40dHqB13c4n5e+Ckk25S7bukpCReW6QA6UCNNnM3feQ5
         lZ5xJhFTl9Bo7C5br7hJFpcOAGO6HhcuQZwrf2OMDQfEkPO+SUe7m509RT0IBJXz1/Hb
         8oqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737305973; x=1737910773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ryjgud0Cu35z0KcZwYmKJ/fOZn2jkkwEjHOVTa8VYFo=;
        b=k2j1FTbTEevILMcAemn/MfDRTXnfr5yQRSB4EtfC1KhaQ+8eURSccs4saq340Coppu
         h+GmKaNgytDh2J6tXeZtlFxCn2pJYEFWMtqaBqm+vVLK4TGWDlVR2HHEjAN2he/mXx18
         hF8Z/UAywPdxstVwj3h9Mr2WtRLFhSmIZPw6KNBTXw0y6VvjhS90jAASOYte0vhWVRRJ
         n+Vs/P3u0lmiSfkGJQNRepoqmUUmqvz+yC0aGJos7CM4v/hkot1mNjty+oTX8YYeoH7Q
         LRbgQ8YmaQylRejvS9Ck6IfVtO3l+WUuEDV+k5GX8eZO5tmnLHbwWb67OxXzT6k04sjn
         M17A==
X-Forwarded-Encrypted: i=1; AJvYcCXubGX5RDATRe6CV/cbs/39kDahboyC7XH01+Bw6MyPc0Zw/Br3CiwZauLbIrLKEiKdqoOcVUbe1UpFhT/Z@vger.kernel.org
X-Gm-Message-State: AOJu0YzAzA5K4KZo/s+goC03ntAtRY64n0/U3quh1ihm+jz6Cc1SC2EP
	enEnFYGiUSiStKE+fuz9nqqcjJ6Wx3yuIh7OYDM32wXTEnu6GhAzob13vZkgJEk=
X-Gm-Gg: ASbGnctXDkNj3DVDXbRmqicCL/WH2ta4XgCVZCAXYCkR9dhLa8/ti2nmilqTJDjMqR9
	0/1LKESn3AcQ6Bgyxzh35PprImXybm0aL4S13BEu8ZSrglnIX4qSJlTGTR5yW3E7drv6B9U7AIc
	6IY3mKvbovu+dLBbmAGL5z4VhD8AiSUL80hV5HBQLe/gj42Iv3fkado/te5OAj22SfApmcquTRt
	tUhCzuaLrVwDR4Z0kM6nmnXYc7u6jJaQg2DdabSDQjiU+tXs6Q4WSGauEomiEhhcs6E
X-Google-Smtp-Source: AGHT+IEHlfbUYzo6uXopuyotVKVif1ubxn0HrljJb34K7NGGjfxPHjuaD8j+8GTb1rrlbJmGX092oA==
X-Received: by 2002:a5d:4568:0:b0:385:decf:52bc with SMTP id ffacd0b85a97d-38bf5671bc4mr6755803f8f.32.1737305973017;
        Sun, 19 Jan 2025 08:59:33 -0800 (PST)
Received: from linaro.org ([86.123.96.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3214df8sm8077337f8f.4.2025.01.19.08.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 08:59:32 -0800 (PST)
Date: Sun, 19 Jan 2025 18:59:30 +0200
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
	kernel-team@android.com, stable@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 3/4] scsi: ufs: qcom: fix dev reference leaked through
 of_qcom_ice_get
Message-ID: <Z40vcpkMg50OWL/u@linaro.org>
References: <20250117-qcom-ice-fix-dev-leak-v2-0-1ffa5b6884cb@linaro.org>
 <20250117-qcom-ice-fix-dev-leak-v2-3-1ffa5b6884cb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117-qcom-ice-fix-dev-leak-v2-3-1ffa5b6884cb@linaro.org>

On 25-01-17 14:18:52, Tudor Ambarus wrote:
> The driver leaks the device reference taken with
> of_find_device_by_node(). Fix the leak by using devm_of_qcom_ice_get().
> 
> Fixes: 56541c7c4468 ("scsi: ufs: ufs-qcom: Switch to the new ICE API")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/ufs/host/ufs-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 23b9f6efa047..a455a95f65fc 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -125,7 +125,7 @@ static int ufs_qcom_ice_init(struct ufs_qcom_host *host)
>  	int err;
>  	int i;
>  
> -	ice = of_qcom_ice_get(dev);
> +	ice = devm_of_qcom_ice_get(dev);
>  	if (ice == ERR_PTR(-EOPNOTSUPP)) {
>  		dev_warn(dev, "Disabling inline encryption support\n");
>  		ice = NULL;
> 
> -- 
> 2.48.0.rc2.279.g1de40edade-goog
> 

