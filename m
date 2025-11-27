Return-Path: <linux-arm-msm+bounces-83552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C61F8C8DA06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 10:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B0B2A4E323C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 09:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5066E31C59F;
	Thu, 27 Nov 2025 09:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yqYJuLdl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949E3318152
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 09:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764236825; cv=none; b=hnpn0yiDzkVwZWlZjnMf2GmqesEli7T+5ExoPoIS0XwuGk/fnfeqsWnURO8oe6jEv44+AeL0X+gUGE7p54chdCJeiYHATgam2XGCrVwk/DiSSiqTZrP8ARmr3v3H2RGLSsszAHlBnOYbwthfuvq67+NMLvNiYkxYVDl+ow3pTl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764236825; c=relaxed/simple;
	bh=l0pWWw6Mtmjrm4XRyoFPCA6/H8zhWTKK2uTxTZwTm2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y/WAENatIDusvS2lnkOxzyGJVSZ8HHTzrK4m08QsyahxTLGdc09beHJOExB8NsAXarY867YMDcchLo66rBGK39/cee5Y36TY+hbhrba9N0ofTmryeGaiFzEzKLWvZpZ2D4hR1EuBSH2meedyC8HjK7IpyIWbTVdwuzk8gITjc6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yqYJuLdl; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so4697135e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 01:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764236821; x=1764841621; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fmZ/TSWvciVxsfI7+nFXv4lsvTUtblkMB8z0XYw5/n8=;
        b=yqYJuLdlHFdilFVLXqNjPRyIJOOXZXHDfq/+4ZK8aPUhFi+W9EqA/jispuZPxFtoKO
         rFJPWADK8vw9q99c1CiBErS32tFGKod3NzfKjBjaaFxvRS3IO/s3K2i+mzKVtljiz+IO
         0XAPymzRcadB/nXg4N1/x1gs2di8cbD1GIzOfxqlw54iN0AQpsB2R3QFX9W2deUGAQGV
         ja78UQsZgbrhb0e628lmQDNog2UzHJQndtNQqP+8tbzE54VDa04Ib7JCX1NvzwuaC8/0
         NydRgwc4tresEBklEFxLY4SW1CzNBqkaUnlrpiBwgq7SK41gC0XtwLJKUZA9Qxjj08rK
         fKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764236821; x=1764841621;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fmZ/TSWvciVxsfI7+nFXv4lsvTUtblkMB8z0XYw5/n8=;
        b=uyblSwzpuYRWZnQb4Wr2StIPVnj7JuNduhsyfTzSfQh2vEKgtHkeFwU5InH2sPHUZG
         HT1CP/G8kYdzMSidS1nsWLAQfWrfEcro+WmwB5qzcXdQnsW7uoYl7G1IKM4snyW+jPp6
         utn1fNVaFK+ECCN1zpWwvpyz0lSQgn2vhVCKY6GKTZAsCcSAzaNK2fYSn1Adt2BJgbE0
         NBz+Q6NlzUXh8BXFHnZL+PUnhiUNQl92C8UfurxB3Bg4Q67dkHPaxv5UZ7trEiEuYkdb
         qeRfrt3t/L9Kq980eF5KCoZgN8ZtPVy+E138fC/Nos+zu7t1WRO2HzrRFYInyARmJIto
         GJgg==
X-Forwarded-Encrypted: i=1; AJvYcCX8HhN3Kvb3eIFjVWdynW940Kl6/TxsuY7Kxm3llRXFHJvVfP2RusZgcH59OXYUZTPFBRzBmIS6eCmyhlMY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn0fn7vYAXfhbt67eM8qLLUBnlrCDHh4fp7UdPltPOVfbog83Q
	PEve/pMAKLEOMO0bFqS4G9TYxoFVsBoH0JnXJMSeetY6k/zX7ogWkrTpLyCMuUwltFo=
X-Gm-Gg: ASbGncvLxz0b+GZ7wU4P9+BjNWzRAPsKi2UT1hJMdhmIscC6T5jwlUEaN3mAzkZaszx
	IEasyDrBoTySsXkTqYgTp8vxyE8PS2OQvAzES7kZ9VUZs4YaiGIRNhCVbrO6deA68skulQ48Bfu
	AIjTUDXd03MuYDYiwK7VMktrFCsEod+IPKr43reKODjAcwrf/va4pXrS+3UnQeCb6EwKs7ZKBa8
	Kthv7FoT8D48edjV9F0a/ydsrvxbbs7XaRvwdLdYP5QpIkhJ94iBub6kOY3dzr0djFTM8b0Cjqn
	v8QGU8DaL1LjwxT98+yKmKBwzsISBW0shnfRATLPUJDZWUjO5BPGnuQV1NEIFXLOHNputZxDr/4
	1W0Gh5Uabvpi+lHA/OM6aWiHFbmRtb2VEGMjlx2aM3NxjJU0MtJGP6wUi8egVw8lMePunf3Nikn
	MxtltGWKWQdCcgODIFSJopOyViIT0qdDUNW9thbyLpqb2Q/UeAr0Pu
X-Google-Smtp-Source: AGHT+IEpUyF0VjHlDdG/aKA0MuFt9g6fIOEp400ZPRyMSjrw9CzcZ6BZWLodT9J4oQm4t1k8+PHNwg==
X-Received: by 2002:a05:600c:3152:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-47904ace283mr97268665e9.6.1764236820813;
        Thu, 27 Nov 2025 01:47:00 -0800 (PST)
Received: from [192.168.0.27] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c3041sm2422058f8f.6.2025.11.27.01.46.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 01:47:00 -0800 (PST)
Message-ID: <e0ad09b4-0bfc-467d-b93e-892ef8a44a94@linaro.org>
Date: Thu, 27 Nov 2025 09:46:59 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] media: qcom: camss: Add SM8750 compatible camss
 driver
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20251126-add-support-for-camss-on-sm8750-v1-0-646fee2eb720@oss.qualcomm.com>
 <20251126-add-support-for-camss-on-sm8750-v1-3-646fee2eb720@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251126-add-support-for-camss-on-sm8750-v1-3-646fee2eb720@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/11/2025 09:38, Hangxiang Ma wrote:
> Add support for SM8750 in the camss driver. Add high level resource
> information along with the bus bandwidth votes. Module level detailed
> resource information will be enumerated in the following patches of the
> series.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h |  1 +
>   2 files changed, 23 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 5ee43c8a9ae4..805e2fbd97dd 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3870,6 +3870,20 @@ static const struct resources_icc icc_res_sa8775p[] = {
>   	},
>   };
>   
> +static const struct resources_icc icc_res_sm8750[] = {
> +	{
> +		.name = "ahb",
> +		.icc_bw_tbl.avg = 150000,
> +		.icc_bw_tbl.peak = 300000,
> +	},
> +	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
> +	{
> +		.name = "hf_mnoc",
> +		.icc_bw_tbl.avg = 471860,
> +		.icc_bw_tbl.peak = 925857,
> +	},
> +};
> +
>   static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
>   	/* CSIPHY0 */
>   	{
> @@ -5283,6 +5297,13 @@ static const struct camss_resources sm8650_resources = {
>   	.vfe_num = ARRAY_SIZE(vfe_res_sm8650),
>   };
>   
> +static const struct camss_resources sm8750_resources = {
> +	.version = CAMSS_8750,
> +	.pd_name = "top",
> +	.icc_res = icc_res_sm8750,
> +	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
> +};
> +
>   static const struct camss_resources x1e80100_resources = {
>   	.version = CAMSS_X1E80100,
>   	.pd_name = "top",
> @@ -5314,6 +5335,7 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
>   	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>   	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
> +	{ .compatible = "qcom,sm8750-camss", .data = &sm8750_resources },
>   	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
>   	{ }
>   };
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index b1cc4825f027..f87b615ad1a9 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -91,6 +91,7 @@ enum camss_version {
>   	CAMSS_845,
>   	CAMSS_8550,
>   	CAMSS_8650,
> +	CAMSS_8750,
>   	CAMSS_8775P,
>   	CAMSS_KAANAPALI,
>   	CAMSS_X1E80100,
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

