Return-Path: <linux-arm-msm+bounces-46330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4266A2054D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 08:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0D793A21D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 07:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A83B1DE3BE;
	Tue, 28 Jan 2025 07:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zQ6+2S+x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EAB1DDC0B
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 07:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738050962; cv=none; b=fXAV3oku85lu0VY3swzldHUI2BIYaC2/rUtDTQhxuEiYON1NeI9P7TummVAvEtuk8jM07kSoRGpLn1qj/TP+wf1A0xIDpjste6weDL6B1oweVbQNy+WECvS0gZVPDTWxkJX37S4pbtgVFTRWWobmWnbH9GSsmx5M2FkZ+LBZoTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738050962; c=relaxed/simple;
	bh=dyJMWoTyFqDpIWaShZkM/vjq7+zr/o67BwNI6Pz2B20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DspJ40nLHLNHFse0d6BWwXC40SGvyJivo6LZDMwBMJyZ7F1Ij15vgj7XlfyUp75UdGeeh6D0/TQ9BW/BHSGTLXwafd8l7+w+juKBYX6QKKyI5OxyzlVI3gqL/7YOW2UwQnFTYzcgXPBbI3i6YVexrrtt480U2+N8MHB5x4zh10k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zQ6+2S+x; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38a88ba968aso5196742f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 23:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738050958; x=1738655758; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SeMt2qiOiq2TY1WkHPRX1449FB8tJAQ1ui2jFxzGFaA=;
        b=zQ6+2S+xmLqrhQgJIPFz7SSY6iWUngl9Te2n9CzB57z4yXUuEFv2UdFPJTAVFY8UXQ
         IC1qh91CDFQIJkGNTCvx/ccJ4xVYP+BWZLY8kr1TltMhteTatznUJg/pzp2MiE4C1Fzs
         zcudldI9fHkYmJFjvn4sS3DhEVJCuH5oR+csslYjqFugpR1v9lwtvx974oAwVN4rl4lE
         3vn8o8bvgtbKSS8lLZddGO+PTRQaR8R1tm4BHl+/8BWS1RvIpkaZf0f8m4R75KiJAh1t
         JT6cL9Xarl0Hp5yxZCoN1Bc2QbC+T28hjHRx+Aia6i+zRgGPxJeHRKt/G9Mavovw/oRW
         DeXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738050958; x=1738655758;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SeMt2qiOiq2TY1WkHPRX1449FB8tJAQ1ui2jFxzGFaA=;
        b=CSfdDvj0lfaPt3b4bXuHEa3IKJi3nAC5R9XsuKOEjGcAD1VTe07DJM+EauQ2RbkDqH
         7KSNmyNtBDVwAbXqYTmmZ6dm8F9g+V1PTmFtWNTC5rhT7/E+xo9E+nMFTjfmu3xewcLN
         m8mfxsBlBpZBhULsHYmXhZrk89GewqqI2hmZ/IRRPJTxbQNRnJBoZDyT0G8Vx8Jsm1Rt
         Oh9LgQQssxAtemd2yK03Sy/X16+K9EJwAg0RVQLTQdqnraDdO6s5VCnRHy4Lra2xvf/H
         XfxcvM6J6epqS3nH512C3YuXYaTvFtcbq0eooJ7gQq6QdW86pOJ7EbAgpl0yutv/Y5EV
         eEUA==
X-Forwarded-Encrypted: i=1; AJvYcCWenO0kzlqkjpnuJqpP7dLasfyy7CPC3691UJCGfKw+zCkb71TDbEJ8QfesKK/sG2QUgVVMY6d4i/ukNEvP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1JXFgkqshuHwhNFLGE9pu4fAWf6Ye4Qmm+ikqoJPIFgt2aLcd
	/XuG+Ps/EmtZLZ8VSU73RPmU5Xmwz2i2qVsx75eM3Ag11zpghIf+9TygA0/V0Cs=
X-Gm-Gg: ASbGncvaqrZD/UijTlofJRItOAODAT1/a3TfnvKRyCywuEfDBMdrc7Fe684ciIzcnFj
	jqmfZobpPIoCvUGkjnkgNLETNj87d+N6LnlJ404hkFYK7OKnDPu5uFdcTQ+LQwB7XC2AzEHoPpn
	q+csvgy5CATcowpmhAKqS6e9plOxifLKRC1ZBogYQe6+SkejG27YhjSldS6gxwOslJ1CsaDhaiW
	a9p/q4tSz2/Bj5S3juZZVUPDjHTZCa9xPCRlyw8rl6D2Y0r3Qk2TZN8gAoKEBhN5EktxnB1Ijh9
	54p3dfIgsCbQ7SD4dfqvAiTClRQ=
X-Google-Smtp-Source: AGHT+IH7IH1478hNlcMLuY4hfHgnnoU18EMTRJjWDJe5Od7uVXg3AOxzEDdA3IpCgEWIWW15nNnM9g==
X-Received: by 2002:a5d:6c61:0:b0:385:fe66:9f32 with SMTP id ffacd0b85a97d-38bf57be5c1mr42327597f8f.52.1738050958263;
        Mon, 27 Jan 2025 23:55:58 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:3210:3bfd:4b47:59da])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d70bsm13703056f8f.33.2025.01.27.23.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 23:55:57 -0800 (PST)
Date: Tue, 28 Jan 2025 08:55:56 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Matti =?iso-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/13] remoteproc: qcom_q6v5_mss: Add modem support on
 MSM8926
Message-ID: <Z5iNjMzKWG4zQkcR@linaro.org>
References: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
 <20250127-msm8226-modem-v3-6-67e968787eef@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127-msm8226-modem-v3-6-67e968787eef@lucaweiss.eu>

On Mon, Jan 27, 2025 at 11:45:38PM +0100, Luca Weiss wrote:
> While MSM8926 being 'just' an LTE-capable variant of MSM8226 it appears
> the modem setup has changed significantly, by requiring mss-supply and
> not using the ext-bhs-reg.
> 
> Add a new compatible and new struct to support that.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>

I wonder if you could reuse &msm8974_mss here. Anyway, I suppose it's
better to not allow the fallback_proxy_supply that MSM8974 has. I think
it's fine as-is. :-)

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 48 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 32f35fe89416f167fe49be7ca02a24af842e0073..cd7ea7bb345f558636f9414c43460b29b3be6f5c 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -257,6 +257,7 @@ enum {
>  	MSS_MSM8226,
>  	MSS_MSM8909,
>  	MSS_MSM8916,
> +	MSS_MSM8926,
>  	MSS_MSM8953,
>  	MSS_MSM8974,
>  	MSS_MSM8996,
> @@ -2621,11 +2622,58 @@ static const struct rproc_hexagon_res msm8226_mss = {
>  	.version = MSS_MSM8226,
>  };
>  
> +static const struct rproc_hexagon_res msm8926_mss = {
> +	.hexagon_mba_image = "mba.b00",
> +	.proxy_supply = (struct qcom_mss_reg_res[]) {
> +		{
> +			.supply = "pll",
> +			.uA = 100000,
> +		},
> +		{
> +			.supply = "mx",
> +			.uV = 1050000,
> +		},
> +		{}
> +	},
> +	.active_supply = (struct qcom_mss_reg_res[]) {
> +		{
> +			.supply = "mss",
> +			.uV = 1050000,
> +			.uA = 100000,
> +		},
> +		{}
> +	},
> +	.proxy_clk_names = (char*[]){
> +		"xo",
> +		NULL
> +	},
> +	.active_clk_names = (char*[]){
> +		"iface",
> +		"bus",
> +		"mem",
> +		NULL
> +	},
> +	.proxy_pd_names = (char*[]){
> +		"cx",
> +		NULL
> +	},
> +	.need_mem_protection = false,
> +	.has_alt_reset = false,
> +	.has_mba_logs = false,
> +	.has_spare_reg = false,
> +	.has_qaccept_regs = false,
> +	.has_ext_bhs_reg = false,
> +	.has_ext_cntl_regs = false,
> +	.has_vq6 = false,
> +	.version = MSS_MSM8926,
> +};
> +
>  static const struct of_device_id q6v5_of_match[] = {
>  	{ .compatible = "qcom,q6v5-pil", .data = &msm8916_mss},
>  	{ .compatible = "qcom,msm8226-mss-pil", .data = &msm8226_mss},
>  	{ .compatible = "qcom,msm8909-mss-pil", .data = &msm8909_mss},
>  	{ .compatible = "qcom,msm8916-mss-pil", .data = &msm8916_mss},
> +	{ .compatible = "qcom,msm8926-mss-pil", .data = &msm8926_mss},
>  	{ .compatible = "qcom,msm8953-mss-pil", .data = &msm8953_mss},
>  	{ .compatible = "qcom,msm8974-mss-pil", .data = &msm8974_mss},
>  	{ .compatible = "qcom,msm8996-mss-pil", .data = &msm8996_mss},
> 
> -- 
> 2.48.1
> 

