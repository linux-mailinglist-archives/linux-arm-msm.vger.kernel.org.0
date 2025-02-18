Return-Path: <linux-arm-msm+bounces-48403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1179A3A3EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 18:18:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F8CB3A564E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 17:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14A7126FA53;
	Tue, 18 Feb 2025 17:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EVNvjlRT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351EA26FA40
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 17:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739899087; cv=none; b=YDtg6DrkDIz6TVsA6KR5d3Bf3NuWTD42huCt0YdsBndc1547+9XtEYslKA/9hYFzp8S44JZnhLjYV75fhwgwkaCa4xrlz4NHAO+5McciWWhkERaGE0eW+PzVu5+FdnKu211TfyIQDpRfZm4EzqjcvP/tRpSxnqcuBXsei8nX8xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739899087; c=relaxed/simple;
	bh=+HqbUx3NMhsdQmv5gJG5aY4LXcTPtScM4DxHwm+OZQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uiKA4wcmFjWR6hSWsX+5XRhrFr5gWavk2SFtsGxU+O3ad1nuiEoczqtFkWDCUX09zrAOECW86muUOlH2XOOC7l9uRdzabw26MLBEvs2q6noU7FXY0FziI4hyubsZQ2n4NJXbwFsB+67tqAzuqH4bBZh104Z5AYn34d3QQakhGGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EVNvjlRT; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-307325f2436so48833541fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2025 09:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739899083; x=1740503883; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vFCpXaDjW046OAnqXzChWWxg9c6BmmKNGNdZCuQPouY=;
        b=EVNvjlRTUjkWqiPgbRWJw+S1FY9HkvT9IlDK2h1m0AJwDk16lysLtGRpnmF6DDGZ/u
         wA1eVgnaopeOtemJJSeb+neL4Xf+y63zfagZhIEiSEzYDwlXQiabOLHkJ5DQdR+vkglT
         RATECJW+hfCEci9yB+imfuLfJen7QC6TP2si8Vc86GA0FauTPr6rzMWaTw+hKJFkV+DA
         8x3PvFxtfec23ZKgOPtaRvQzj7gUXJgaXuFDdecqiowCO4AmkaUjfXPtYb8g+MCCbL4+
         LEtn6VylQrUhQc8Dg+BwO12JvMA/IiByyvbaNotBh+gTHGqHzgULgOqpRDYfaCqzfbsC
         YDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739899083; x=1740503883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFCpXaDjW046OAnqXzChWWxg9c6BmmKNGNdZCuQPouY=;
        b=SQxj5sCJieDa+pqzNZq4vPYCEmw/TTumMH3YwQ+8Dny79dVaifrH796DhV6XT5lY7B
         apB56k8jbjybs1BlhdCxwOTNrsPH+356WwDF8eh17MBf5JDulbQkFPWt6CbMsFqZBcTS
         N0tQPoOnGWZ0iErBXsDpy2i8z6l5DdW3wx2I0ze+7V9axK5/FseHxpjEsgBGnQvdPHuq
         zoIRNE2yVPn82kQE2Q/wzuPqnUjvkshJRaAWwcPf6K+G70XPTPvP17aAS5+oblyMSHs8
         +xtEyFbYYIjsyZhcvV/v5lgoVufdeYsS6epm5DdPWEIqW041tLWuTFhq37o8xWFvBZoU
         +tFA==
X-Forwarded-Encrypted: i=1; AJvYcCUMF8g5/fbW7KN65sF24RGlKnHEcXRx+Y2QgTLXWi7myMLzvTkcoec9P9o8Z+Y/5s7Jnrohz4GRDrJzN3lI@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo25LIbtzq+RI7KI6GjXdHi064YCPKoJhDwbbbD5Y8ZzaroQ/4
	wHGA8ijUjBuOAaumU5OEYsQvP5mwiNfb2Y60tHGiM4bF2lhMDpIzNkNePVwzrP8=
X-Gm-Gg: ASbGnctRdcZ5npa6qhtjz4sQMBkPIUwf4iHV+pWD1ziL81t7/G+TGfKNAP2n4IBtoQM
	EmVPD8SPGeYaoZKwO9SWVM576bBhe94a464O3wo8bui4QKlreL3wZgFzo2LBezx5+zEKNYTJ3Bx
	CMN131TaV7tyzOnhvunVIFpAtTAh1Ehz0pq7ez3czPU+mRRqjwpR9c6Axsx26UWqbfCbX5iNrDp
	oIScJifVZ+JT3UTCVtdJCN16bZGwTxCixM794buKFHG/NiSmditqgUsErMxtzTZs65EjP7qAgHG
	x8cAbBEDFfxDzdwCMb6vzEM0G81yB5W/OJJ0Saa9eUzL2KmISDsM4PmIxInthdDKwjzq34Y=
X-Google-Smtp-Source: AGHT+IE6rXImPRtO7WIVZArsGTCop6s7h35hJORLydABfahalgPYT5N99LSGxqzFHXrjk0jBaudiMg==
X-Received: by 2002:a05:651c:94:b0:309:1c03:d2d3 with SMTP id 38308e7fff4ca-30a45035a02mr559491fa.25.1739899083255;
        Tue, 18 Feb 2025 09:18:03 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-309311777a8sm12756301fa.25.2025.02.18.09.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 09:18:02 -0800 (PST)
Date: Tue, 18 Feb 2025 19:18:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] clk: qcom: common: Attach clock power domains
 conditionally
Message-ID: <2c5rbbpe5muw53oemyq6vhsmhzpzcpn7on4ujl5v7i7s3fdlob@eh37gy5dpfnp>
References: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
 <20250218-videocc-pll-multi-pd-voting-v1-3-cfe6289ea29b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218-videocc-pll-multi-pd-voting-v1-3-cfe6289ea29b@quicinc.com>

On Tue, Feb 18, 2025 at 07:56:48PM +0530, Jagadeesh Kona wrote:
> Attach clock power domains in qcom_cc_really_probe() only
> if the clock controller has not already attached to them.

Squash this to the previous patch and call the new function. No need to
duplicate the code.

> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  drivers/clk/qcom/common.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index ec27f70b24bdec24edd2f6b3df0d766fc1cdcbf0..eb7e2a56d1d135f839fd9bd470ba6231ce775a8c 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -300,9 +300,12 @@ int qcom_cc_really_probe(struct device *dev,
>  	if (!cc)
>  		return -ENOMEM;
>  
> -	ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);
> -	if (ret < 0 && ret != -EEXIST)
> -		return ret;
> +	cc->pd_list = desc->pd_list;
> +	if (!cc->pd_list) {
> +		ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);
> +		if (ret < 0 && ret != -EEXIST)
> +			return ret;
> +	}
>  
>  	reset = &cc->reset;
>  	reset->rcdev.of_node = dev->of_node;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

