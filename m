Return-Path: <linux-arm-msm+bounces-66870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B58B13CD6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 16:19:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E8F14E08DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 14:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4B82BD04;
	Mon, 28 Jul 2025 14:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rwjtLgVF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62934263F2D
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 14:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753711965; cv=none; b=d74tMLON8lgteIt0LNGG8+WB+af6in9UTYrEdrxToxLdAB0xx6OJzjdOzVKW8fbU/bCzGSXFvrpJ3dpLSIgqBCsXL1UBZQG915BGZU/iPRKP9CrQPnvRpn9sYmMyWZbMZJtN8CXLSv+iTKdTJZicfEBH4oz2ideFkWRACedUFCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753711965; c=relaxed/simple;
	bh=O7XVb7+2KL6hxl5QjIDAgpMPkeKC+T641Z452dT9/kI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a958ddDbKtPTAjCUOAAcYRm7fQf0dVfL7X58OPIOzwOs2hv/z65NmvcNA1Tx8nH5BNNGut4YJOh2PpeIQ5WRJQZH7PVtb7Y4lsOKtvy2qHR8it4ZybCPNA7QZjCFapz5sgIhCEG4xKMsiNubMCiCKvhGLyQR20OmB4KHiUahfGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rwjtLgVF; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae0bc7aa21bso896824866b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 07:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753711962; x=1754316762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jk6mSRTMsB/OIBvGlw4Rzm6kh4ycxWxzbNU2i/NsHgM=;
        b=rwjtLgVFRhgPeEOXCawtsdOndAAR3Mp0vqNuV0dlpSrV6fUFteop5xUfn+7a8/PN/M
         yT9D6/sqXRCYQb7x6UZEnG50jJvAZr1MJG7+QQXVag0P57a1kBpFlbahaBvNkTXRfhyp
         CUwC8eWDONwmmtPIQ8Io0URNCtwU459kuZ7g/RNFb4w4lAtmiZobOWtGP7bcyZR2FrI1
         vjA2J9ajX7OPuJu9YXOei0s81JFLIeA8ANuhr4kpoSenuKRzDI/hNc+nZ3DUYedHVmlw
         ur9XpHleISj4cVcbIWda5iNUUbFlpLHiD71ucHypIqMkKoaIMB3c0/bAvqjHoQHTF6dh
         EPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753711962; x=1754316762;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jk6mSRTMsB/OIBvGlw4Rzm6kh4ycxWxzbNU2i/NsHgM=;
        b=vi1z52E8pud08XYkaIHgVqYCvycVLs5kC6KClzSYom14UjvYwpavmfrMgHrkztH5s/
         INBjoGHiOj/n7U8FDXbhYsJvzjcooGFlsvtP24xLjAd8xvC33x9nV20W2zHFWM99CAlB
         q075CsSKY17/pdp4gz/B2b1uGO7TzfhP+hPmpOVNCPZdvpL+MBgcDs99iGe6gCs0Vrnx
         2O17YKJXSWCxWKfMPxeDIcm2rMp/RgoLb6KFb93DKSX3VSCbGOJfOvPn4dauB8xwrCns
         3KUOVQ6cL7zbXpqbCqwBUDDzeVWzyowHSobKFWGfrQNrSO+ZZuTTfs2wJ2kbHdrQ/xEO
         yzxw==
X-Forwarded-Encrypted: i=1; AJvYcCW2xayV2BsGooW4GNsLhw8Wr1ToAmcV2U/y4xToXoaGFfkE4IjjBATvkOEgl/zBjW2wrQ7zdGjmE4HuqJFf@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9vOlrtxlaUVkX1hYg7GFo+HhOQzJWa+UtEjFbmGkpjuPRjN9Q
	i/SXz6HAOM3q0wPaGu6gUTlt4hcRrpu/ul7YGsoSOoaIA0jfnRrXPuhdujsUtHEDV6Q=
X-Gm-Gg: ASbGnctgXyFhv4ZTnf79lzHPb2rOrirr8dPUp4vBtzrOKjTNQKedJhymdImGlSV0/Xe
	fvD09TI0dQ8Z4qo8XF+GPLWJnPcOx9Jx3YueMJ/25qRY1yqK1NCHTyVgIC9CttDtTfMSFwuUgDL
	it8AqxRlb9cs9phCOcZT2Zb/13H6rifK529C70JC/1TTPrHfgwlg0R81Sq8x/3UnUoUgsAXA4ch
	0UtmkSfL3YUsd4MwJnzDbok0trISTYhN1L5JI2Zvblz7g/ev9ZUMrGDA/92Txb05rOdMFo7MVV9
	hsR6D61Utw/SCGsMYSgG/l/KALBBghLh9FlNcrEJENRAu69//4nOAODT4SJKPu2W0g43CVb8e4L
	4oM/lw6zE+CgcZCcRA335690EqZV5OMZDQuOshzYyK0TAEnlv6BGdNyPCWKDV538=
X-Google-Smtp-Source: AGHT+IFqxJRE1QKHYBFZxQpyOgr6z9UdMOEOO88xTViMCt0rV+PU4AVbmvZ0211adT45N0kyk5+wKg==
X-Received: by 2002:a17:907:96a0:b0:ae3:7058:7b48 with SMTP id a640c23a62f3a-af61ce932camr1392836266b.25.1753711961420;
        Mon, 28 Jul 2025 07:12:41 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af6358a1858sm431613166b.45.2025.07.28.07.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 07:12:40 -0700 (PDT)
Message-ID: <dca47ca3-d5f7-4b2e-9611-dd195ee149fc@linaro.org>
Date: Mon, 28 Jul 2025 15:12:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] media: qcom: camss: Add qcs8300 compatible
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250711131134.215382-1-quic_vikramsa@quicinc.com>
 <20250711131134.215382-4-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250711131134.215382-4-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/07/2025 14:11, Vikram Sharma wrote:
> Add CAMSS_8300 enum, QCS8300 compatible and qcs8300 camss driver
> private data, the private data just include some basic information
> for now, later changes will enumerate with csiphy, tpg, csid and
> vfe resources.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 21 +++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h |  1 +
>   2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 6f5b70bcf488..5211367b535d 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2898,6 +2898,19 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
>   	},
>   };
>   
> +static const struct resources_icc icc_res_qcs8300[] = {
> +	{
> +		.name = "ahb",
> +		.icc_bw_tbl.avg = 38400,
> +		.icc_bw_tbl.peak = 76800,
> +	},
> +	{
> +		.name = "hf_0",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +};
> +
>   static const struct resources_icc icc_res_sa8775p[] = {
>   	{
>   		.name = "ahb",
> @@ -4180,6 +4193,13 @@ static const struct camss_resources msm8996_resources = {
>   	.link_entities = camss_link_entities
>   };
>   
> +static const struct camss_resources qcs8300_resources = {
> +	.version = CAMSS_8300,
> +	.pd_name = "top",
> +	.icc_res = icc_res_qcs8300,
> +	.icc_path_num = ARRAY_SIZE(icc_res_qcs8300),
> +	.link_entities = camss_link_entities
> +};
>   
>   static const struct camss_resources sa8775p_resources = {
>   	.version = CAMSS_8775P,
> @@ -4308,6 +4328,7 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
>   	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
>   	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
> +	{ .compatible = "qcom,qcs8300-camss", .data = &qcs8300_resources },
>   	{ .compatible = "qcom,sa8775p-camss", .data = &sa8775p_resources },
>   	{ .compatible = "qcom,sc7280-camss", .data = &sc7280_resources },
>   	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 345479f6feba..b5600a8b2c4b 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -84,6 +84,7 @@ enum camss_version {
>   	CAMSS_8x96,
>   	CAMSS_8250,
>   	CAMSS_8280XP,
> +	CAMSS_8300,
>   	CAMSS_845,
>   	CAMSS_8550,
>   	CAMSS_8775P,
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

