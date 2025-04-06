Return-Path: <linux-arm-msm+bounces-53293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E43A7CE2B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 15:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89CE53B1FB3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 13:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6711218AAA;
	Sun,  6 Apr 2025 13:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WyVbZWmx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAAC218587
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Apr 2025 13:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743946978; cv=none; b=E8VsTDpYaxD9n9aUiesyZXbZploeM2uxsCFaMZeSNqil4sPNZQ6/qKVLiMmTZRMDqSWjXLAXg27FnYNo+fDrUPAc7CRaK0KHwodzlm1QTmMxgIZGsLNDHr2TfpFARPxr/Ell9E8xZYjf2ULHtwdyQpSTb0l2EyHF9gm/SQc1h5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743946978; c=relaxed/simple;
	bh=PD9GNIrrnrt2kMfBmhXn7JrpnwAp6se47WiAoF1e78g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L9iti93/UaZ0elSxtfUXU9ho6rXB9nidSK5VT8ZLRd84tVdmqo3QIVDdBqb2eb3VcZ699HInKLXPtKc4dvrFUrQAc8mW0CHcDG2zhfj6LBWH7cw/SQyLLJoM7jFwta15w2DnhH4Lq8hBdSvQ1eRW3iqJ2yjjIUqEr3FCePCB+6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WyVbZWmx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so28127325e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Apr 2025 06:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743946975; x=1744551775; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eKSh/Lkr7vxqs+CQ/v3pTweJchjYC4e1pzyu9PYjl1w=;
        b=WyVbZWmxpopzV59+JmmxRf4FhPw1bbZi2wpxhj7nBV3jfPbs2ffgDy/uKrAjc4ceVr
         8q1t9jmWtlCpj9BjbTDyjSd6roO3do/JASDaY0U+oW/jzZrf7Lluwy8hwss9hloXxtEE
         6SoHKtyur+iguKqYaPwk7fX9H17k3nXrZWFzUmFG+Pm7VH8CfCTgds2tgFGQvMUsx9VY
         zhRNZgRjSTy8TaYHxkgmDbQr4/++JLGrsvviWRafFejbCMs9OhJwcYFy6ugIvh0whavX
         LYv58WMCLZ0cpvJyqIvs6DZR3oGNvJpw7ArOHWwOJPASxs9tYssM/ij7m4g/+9Ydtw0K
         m5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743946975; x=1744551775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eKSh/Lkr7vxqs+CQ/v3pTweJchjYC4e1pzyu9PYjl1w=;
        b=Qd+3IO7Xs6kQDIBOoT+EV/RHBWrCSr/30/Lb6LKAzS/qGbTzbFhGNdcmbB0ydfbNrU
         8AegypyQF6QjdSXdPDhPdzXlZynZdv6c85ChKmagOJCZyLsvshs6l9yCgWaVGK+hpsxb
         7NHUUyhN2G+/mWcXKhp4iRcFYgOXd5E8ofPUa3ZhuwbbCoDwoTtDVU7xIpgNcEMdRHaw
         PfB+qoTvSApCSbfMZBVdSei6mjvw/L2X1VStPOI9d5QQ0XTZcYAzBbRhtMR13HVGAvYM
         W76YVnumcBoCqmSnZ06X4+7h+WaADofmnBAERTgO4VWlFoWQ3iE/aeTQ9onWQEFF3mtl
         g9Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWFcNP6qccDUNN3TgiPq8JXs7SULPR7kIMHIAeHXKuLxCUclYf29EMitmrwL+yzwOEBccWoliy6ZmZzutO7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2lTfcfbC+q6j59DOwvfN8euQ8zMRNdLnUksB7QIyo4OBe5XEb
	H8eV9GQjbwSFSMmFw1P/0d6ovc1KwhvOifCfF7qAGQDbF4d5+PL/wc+njxnsvWo=
X-Gm-Gg: ASbGncuJopX15Uvq1TUiWcIpY+NHnzVi9+pmOf8JatSd8mPmu1tnHbG4oTd5EphkRzz
	7VIMfT92kraIf3p8oRLKZP0ApXnkxgg+m+vYrKRc/8TyAee2K0/jYMJ+1DTlr93sSLMZhQnWkhR
	xi+p0nITaHRcdQ0YL6jNTQ/U7OxsO49Cdcvj4s+v3E4bd5Cd8YCGUb5Jr+XR6NFjcJ5b4jAAg4Q
	EwgHMV9UKrBnf1RQgCgFVPmqROaGomkjpTCnvFIknPKuqP+BJqVtnvL/Gle/EusVKrg/8AXbPuh
	PddsCULPFRtCMkFYLHULWr/psq/04aE1jMOg15kO8vBJr8MVuli0DU5U3sc4JnUtjUAahJRN49L
	T0dG8dO2VCg==
X-Google-Smtp-Source: AGHT+IENivBk2jsjBaWq+wSNsl1e7Aq00Uqgt50LmnMarcev0yDMmtMA3gEheom2v6QN12Lg/N3F2g==
X-Received: by 2002:a05:600c:350b:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-43ed0d6b07cmr67764825e9.20.1743946974670;
        Sun, 06 Apr 2025 06:42:54 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea8d16d35sm117529675e9.0.2025.04.06.06.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 06:42:53 -0700 (PDT)
Message-ID: <ae06a3a3-bf7b-41ba-9c2c-8754c5c7c8a2@linaro.org>
Date: Sun, 6 Apr 2025 14:42:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] media: platform: qcom/iris: introduce optional
 controller_rst_tbl
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250305-topic-sm8x50-iris-v10-v2-0-bd65a3fc099e@linaro.org>
 <BvlsGF1XePEGyPlecg4xIRy_z4TPBsWUwm6cTT4NIsOjkxTILIsopQ5js4omlx--7OLkNHUDehSVQ36pGvhkyA==@protonmail.internalid>
 <20250305-topic-sm8x50-iris-v10-v2-4-bd65a3fc099e@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250305-topic-sm8x50-iris-v10-v2-4-bd65a3fc099e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/03/2025 19:05, Neil Armstrong wrote:
> Introduce an optional controller_rst_tbl use to store reset lines
> used to reset part of the controller.
> 
> This is necessary for the vpu3 support, when the xo reset line
> must be asserted separately from the other reset line
> on power off operation.
> 
> Factor the iris_init_resets() logic to allow requesting
> multiple reset tables.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/media/platform/qcom/iris/iris_core.h       |  1 +
>   .../platform/qcom/iris/iris_platform_common.h      |  2 ++
>   drivers/media/platform/qcom/iris/iris_probe.c      | 39 +++++++++++++++-------
>   3 files changed, 30 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index 37fb4919fecc62182784b4dca90fcab47dd38a80..78143855b277cd3ebdc7a1e7f35f6df284aa364c 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -82,6 +82,7 @@ struct iris_core {
>   	struct clk_bulk_data			*clock_tbl;
>   	u32					clk_count;
>   	struct reset_control_bulk_data		*resets;
> +	struct reset_control_bulk_data		*controller_resets;
>   	const struct iris_platform_data		*iris_platform_data;
>   	enum iris_core_state			state;
>   	dma_addr_t				iface_q_table_daddr;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index f6b15d2805fb2004699709bb12cd7ce9b052180c..fdd40fd80178c4c66b37e392d07a0a62f492f108 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -156,6 +156,8 @@ struct iris_platform_data {
>   	unsigned int clk_tbl_size;
>   	const char * const *clk_rst_tbl;
>   	unsigned int clk_rst_tbl_size;
> +	const char * const *controller_rst_tbl;
> +	unsigned int controller_rst_tbl_size;
>   	u64 dma_mask;
>   	const char *fwname;
>   	u32 pas_id;
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index aca442dcc153830e6252d1dca87afb38c0b9eb8f..4f8bce6e2002bffee4c93dcaaf6e52bf4e40992e 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -91,25 +91,40 @@ static int iris_init_clocks(struct iris_core *core)
>   	return 0;
>   }
> 
> -static int iris_init_resets(struct iris_core *core)
> +static int iris_init_reset_table(struct iris_core *core,
> +				 struct reset_control_bulk_data **resets,
> +				 const char * const *rst_tbl, u32 rst_tbl_size)
>   {
> -	const char * const *rst_tbl;
> -	u32 rst_tbl_size;
>   	u32 i = 0;
> 
> -	rst_tbl = core->iris_platform_data->clk_rst_tbl;
> -	rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
> -
> -	core->resets = devm_kzalloc(core->dev,
> -				    sizeof(*core->resets) * rst_tbl_size,
> -				    GFP_KERNEL);
> -	if (!core->resets)
> +	*resets = devm_kzalloc(core->dev,
> +			       sizeof(struct reset_control_bulk_data) * rst_tbl_size,
> +			       GFP_KERNEL);
> +	if (!*resets)
>   		return -ENOMEM;
> 
>   	for (i = 0; i < rst_tbl_size; i++)
> -		core->resets[i].id = rst_tbl[i];
> +		(*resets)[i].id = rst_tbl[i];
> +
> +	return devm_reset_control_bulk_get_exclusive(core->dev, rst_tbl_size, *resets);
> +}
> +
> +static int iris_init_resets(struct iris_core *core)
> +{
> +	int ret;
> +
> +	ret = iris_init_reset_table(core, &core->resets,
> +				    core->iris_platform_data->clk_rst_tbl,
> +				    core->iris_platform_data->clk_rst_tbl_size);
> +	if (ret)
> +		return ret;
> +
> +	if (!core->iris_platform_data->controller_rst_tbl_size)
> +		return 0;
> 
> -	return devm_reset_control_bulk_get_exclusive(core->dev, rst_tbl_size, core->resets);
> +	return iris_init_reset_table(core, &core->controller_resets,
> +				     core->iris_platform_data->controller_rst_tbl,
> +				     core->iris_platform_data->controller_rst_tbl_size);
>   }
> 
>   static int iris_init_resources(struct iris_core *core)
> 
> --
> 2.34.1
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

