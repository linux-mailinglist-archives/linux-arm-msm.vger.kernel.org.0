Return-Path: <linux-arm-msm+bounces-7357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8318C82EF25
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 13:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D94B285B5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 12:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B52D1BC47;
	Tue, 16 Jan 2024 12:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bNYZs5c8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767061BC2C
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jan 2024 12:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50ea9daac4cso10059225e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jan 2024 04:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705408940; x=1706013740; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+EKrm2JO+zcDUrpvnESCba76qUcUIJTz/jyzkgv6D5k=;
        b=bNYZs5c85GVuDZlN/D67ZdQvXxNkpQqgl1diz8rdzKa7aTm6lELLTY7vTB6IVHEdnN
         lgC0GPnU7jfSE6mUXjS3HHp6+pVyNORvcaSSkXY16iIw1GUChTyeRZuhqWENCb9LCH2/
         z/gygFduGiohc6cHh1KIPikVLwtuzjTVHCzCb10Fa+mtQ6qDmFG1Ovt7mIyqATTzturS
         RjdzRFzPD5KafdZLJOVfZi2G4Myg5TC7oHVR0/3AQWwVFJuuOOvK4fLpvtAMiTvVY1Az
         AngX9Ho1CqFjvGWHRkTgxNFvZ+JbVlUq7w7PiKL3+ar9LWEVSv3Od6H6H+xL/1VKq84E
         cW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705408940; x=1706013740;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+EKrm2JO+zcDUrpvnESCba76qUcUIJTz/jyzkgv6D5k=;
        b=jCo3rk8HSwAip95kktVQsropEatUzqVTBV6oE5lCczZrwl2elpAVtwZbHqHlcywQEM
         UCYXY6uMlNJLY3iYyWNllmpiT4dXOZ3sjsDuqMPVDUqydLfS1YkxiiZmDXAj4LlWV9+L
         o+ofST3kCadhL2Y6M7Gv+c+wO4Jlw5XFQG5iib/aKt9tDOC2b7UHsV7yVKh16XE1Kfh3
         k7EoN4l2TmBrc1hAJqeGYqKWtaYnAXZ2aOtU52uvdQg3itP3W/+fe/KEkjZZ5Cdr2R2l
         7+2tU+wujQUMmzChYt6d2E6rdKCWQY3YwskpJO28FeDy19tMyBtiA6LbYGPJEPs8M748
         kZaA==
X-Gm-Message-State: AOJu0YwbHWFWNYiL2hDaKIBJuJU0Ld6C+rSM0vpVee8ci3f7dF/gyuG9
	1jTppD7OYqupmRGW2xlbtUyHTGrJtSRLCg==
X-Google-Smtp-Source: AGHT+IFlNMNId0iaZItO0V8VSaiL7I1mJzSPu7gjYOhbLEcWbsUx5dyGejHJionR3QYOqAif9med+Q==
X-Received: by 2002:a05:6512:3987:b0:50e:e1e6:e1c8 with SMTP id j7-20020a056512398700b0050ee1e6e1c8mr3978085lfu.35.1705408940482;
        Tue, 16 Jan 2024 04:42:20 -0800 (PST)
Received: from [172.30.204.234] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id h12-20020a0565123c8c00b0050e87c5b837sm1742064lfv.263.2024.01.16.04.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 04:42:20 -0800 (PST)
Message-ID: <efadbf5d-bec9-4127-8928-ea0def4326fc@linaro.org>
Date: Tue, 16 Jan 2024 13:42:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] media: qcom: camss: Add sc8280xp resources
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240111-linux-next-24-01-09-sc8280xp-camss-changes-v1-0-b92a650121ba@linaro.org>
 <20240111-linux-next-24-01-09-sc8280xp-camss-changes-v1-3-b92a650121ba@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240111-linux-next-24-01-09-sc8280xp-camss-changes-v1-3-b92a650121ba@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/11/24 20:57, Bryan O'Donoghue wrote:
> This commit describes the hardware layout for the sc8280xp for the
> following hardware blocks:
> 
> - 4 x VFE, 4 RDI per VFE
> - 4 x VFE Lite, 4 RDI per VFE
> - 4 x CSID
> - 4 x CSID Lite
> - 4 x CSI PHY
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> ---

[...]

> +static const struct camss_subdev_resources csiphy_res_sc8280xp[] = {
> +	/* CSIPHY0 */

Are there any cases where a platform has PHYs with different
capabilities? Might be another nice thing to clean up in the
future..

[...]

> +
> +static const struct camss_subdev_resources vfe_res_sc8280xp[] = {
> +	/* IFE0 */
> +	{
> +		.regulators = {},
> +		.clock = { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb", "camnoc_axi", "vfe0", "vfe0_axi" },

VFE->IFE?

> +		.clock_rate = { { 0 },
> +				{ 0 },
> +				{ 19200000, 80000000},

Missing space

Also, the source of this clock has shared_ops, which means it's
parked to XO on disable.. Is the first frequency here useful?

> +				{ 19200000, 150000000, 266666667, 320000000, 400000000, 480000000 },

Similar story here

> +				{ 400000000, 558000000, 637000000, 760000000 },

And you (perhaps correctly) omitted 19.2MHz here

Same story for all other IFE/_LITEs in this patch

> +
> +static const struct resources_icc icc_res_sc8280xp[] = {
> +	{
> +		.name = "cam_ahb",
> +		.icc_bw_tbl.avg = 150000,
> +		.icc_bw_tbl.peak = 300000,
> +	},
> +	{
> +		.name = "cam_hf_mnoc",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +	{
> +		.name = "cam_sf_mnoc",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +	{
> +		.name = "cam_sf_icp_mnoc",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,

Mbps_to_icc()?


>   static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
>   	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
>   	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
>   	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
>   	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
> +	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
"sc" < "sd"

Konrad

