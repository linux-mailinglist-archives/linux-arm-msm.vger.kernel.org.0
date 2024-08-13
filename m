Return-Path: <linux-arm-msm+bounces-28394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D929505C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 14:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5913F285A5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 12:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D106919B5AC;
	Tue, 13 Aug 2024 12:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="swPR/3bl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E357519AD8E
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 12:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723553844; cv=none; b=mcyG3hPkU4SC58iVujpYVsgDRYZJnSWdp1RXNaFvWeBAO2X7p67NpilgKdBdF/SYdtSP/GgdBnPafQHVpQHC2otlB/uqhNOPgeM5IFbb3djhCXCvi4lMCAgGKsZA+qF9Ind5+pHwrW28FGfLCv92sqnSjh2eAotCZWdlcmLm9nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723553844; c=relaxed/simple;
	bh=TofroUqhS0CIITaImahcaurLCMZLdQJdHZ6gq1QJThQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eqV7zdA3y/ulJIUWaV1IyJrgDrPQNqQ3qgmpexq4hQo4KPawPmTO2y/3ziTM/wbeGAT7582B7HvbXWJQz6MhOfxoUn+fuPhDh1hwVeCFut6971tYpR6BVCihGzr7KjD/gdiWcWNCrP+KF/bAb2Qusu3DV3Ney5q7PfvUD1LyG+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=swPR/3bl; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-368380828d6so2976705f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 05:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723553841; x=1724158641; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rXx95rKB/SR9Bmx/7XeMli10udzlREHhp7NHVB0yfaY=;
        b=swPR/3bl/0FSkpeMfrQEzMLIyLKiwM/fKhCSCLsvy5jBcIXbCvKeCau0FQMn1gv0BE
         8QqwuzNUlBfZpynqg5+2lydQRUz5YKkLs+XqyAK6cNpY3WDZCt6m5aXbkkIDAgJpKEau
         cCyM5/vsL7QLzsAR0784SrrUEeESibZke9ZJobcQ+aOECy1sOUhFJWignAi/Q0GlAa9T
         BoXmcUyCO+dvwxLAjDdoREbVCyAY5uFTjn7Bk7mEFsw6M3ZNa9OpkWdwPYTJYlNR8MEF
         VDNG+X1DiVmTTjyiQyTiI7+eZhh2Qgb11s1m+nvZGpfTv+FTHSqaCiYd5uYNXnqMOqg6
         8ydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723553841; x=1724158641;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rXx95rKB/SR9Bmx/7XeMli10udzlREHhp7NHVB0yfaY=;
        b=algZNqD54eo6/iOB0i8L1KRhtPdbUI857vJW7hEZY57C6gkpvWXILo6n+nnonOUxNq
         QeaqGdchrSR0GB2jrf6ni29jN5J5GHM2PC0NMHpeFq1gcfa3araYdalp2XtLBKDouyAx
         5OPuwGC5a25S7wxN5Lu9uVGJEKasBC4AiHAFwFhUyNmMtiEySIG8m5Hh+WrXrnzW361d
         V8yZL9xuqjtW1bY88bh+UjZJoYflPEuVzMfLsEL1Ten2MymclaoCCDrbEuG69kcV6nVw
         rGDSKiUZXt4YnSQdqHSTEL/M1x6UuVQXSPB1hQ82MXJbgmV9ycVEnEezg7P0xVOLtuv0
         RaNg==
X-Gm-Message-State: AOJu0YydqtbMRuINENqRf4hJEFbz5Xt5ZDCGFy31gdE1uUSlqDrK3/GG
	uHX94xXnNZBUucPUhl0UqGNc4V4iz00ATe8ozYiMPjxdI7jn9WT/H7MSJg0JTXc=
X-Google-Smtp-Source: AGHT+IE/LfQmZSNm6rNNhtleN5aFz1noMcX53DlCIRu8BM4WQvIqpru5JT7ZSX4OlCydEvw9J8tU0Q==
X-Received: by 2002:adf:f950:0:b0:368:420e:b790 with SMTP id ffacd0b85a97d-3716ccf5185mr2430791f8f.14.1723553841192;
        Tue, 13 Aug 2024 05:57:21 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4c937b23sm10203672f8f.35.2024.08.13.05.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 05:57:20 -0700 (PDT)
Message-ID: <74a07065-f10b-42a9-b142-b561de25a082@linaro.org>
Date: Tue, 13 Aug 2024 13:57:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] media: qcom: camss: Add sm8550 compatible
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-11-quic_depengs@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240812144131.369378-11-quic_depengs@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/08/2024 15:41, Depeng Shao wrote:
> Add CAMSS_8550 enum, sm8550 compatible and sm8550 camss drvier private
> data, the private data just include some basic information now, later
> changes will enumerate with csiphy, csid and vfe resources.
> 
> Also add a default case in vfe_src_pad_code to get rid of a compile
> warning since a new hw enum is added.
> 
>    drivers/media/platform/qcom/camss/camss-vfe.c:291:10: warning:
>    enumeration value 'CAMSS_8550' not handled in switch [-Wswitch]
>      291 |         switch (vfe->camss->res->version) {
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c |  4 +++
>   drivers/media/platform/qcom/camss/camss.c     | 32 +++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.h     |  1 +
>   3 files changed, 37 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index f6650694f47e..71bd55e854bb 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -403,6 +403,10 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   			return sink_code;
>   		}
>   		break;
> +	default:
> +		WARN(1, "Unsupported HW version: %x\n",
> +		     vfe->camss->res->version);
> +		break;
>   	}
>   	return 0;
>   }

Please make the addition of the standalone case a standalone patch ;)

Then add.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

To this patch.

> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 51b1d3550421..519b37794745 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1480,6 +1480,29 @@ static const struct resources_icc icc_res_sc8280xp[] = {
>   	},
>   };
>   
> +static const struct resources_icc icc_res_sm8550[] = {
> +	{
> +		.name = "ahb",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +	{
> +		.name = "hf_0_mnoc",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +	{
> +		.name = "icp_mnoc",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +	{
> +		.name = "sf_0_mnoc",
> +		.icc_bw_tbl.avg = 2097152,
> +		.icc_bw_tbl.peak = 2097152,
> +	},
> +};
> +
>   /*
>    * camss_add_clock_margin - Add margin to clock frequency rate
>    * @rate: Clock frequency rate
> @@ -2443,6 +2466,14 @@ static const struct camss_resources sc8280xp_resources = {
>   	.link_entities = camss_link_entities
>   };
>   
> +static const struct camss_resources sm8550_resources = {
> +	.version = CAMSS_8550,
> +	.pd_name = "top",
> +	.icc_res = icc_res_sm8550,
> +	.icc_path_num = ARRAY_SIZE(icc_res_sm8550),
> +	.link_entities = camss_link_entities
> +};
> +
>   static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
>   	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
> @@ -2450,6 +2481,7 @@ static const struct of_device_id camss_dt_match[] = {
>   	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
>   	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
>   	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
> +	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
>   	{ }
>   };
>   
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 73c47c07fc30..5568ab32d5d7 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -79,6 +79,7 @@ enum camss_version {
>   	CAMSS_845,
>   	CAMSS_8250,
>   	CAMSS_8280XP,
> +	CAMSS_8550,
>   };
>   
>   enum icc_count {


