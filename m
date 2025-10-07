Return-Path: <linux-arm-msm+bounces-76197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F489BC13BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 13:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 87DD534E500
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 11:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E10B32DA76C;
	Tue,  7 Oct 2025 11:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wo2smy7v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0245F2D9796
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 11:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759837095; cv=none; b=r63wudyoFCc/AgZOLQvVWmYQgT+YVxoDbpBpQcQV126vxtjECGdPekgRXeg95iqEBgsCENoe+bz/3cPlNxdbs/Td1prVAFbDwvCU7fi0NK1c3VC74DWTvfTGa7QMcEDX3HrMxSE4cmnlVlQaZd4uMxuo4J0F+DGJRuahkahA0C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759837095; c=relaxed/simple;
	bh=AR4v9eUGDhYNQtY1HeNc04PQ//e5S/yDedZGfJKBHh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WNiSp8I0VeHQUokBGExwGp2Av1wTkHFKV3NVaa6ryQeVK8GZLN5MxmUc3j8T1ar6PlBjDrJ3hX3vV5jxhCdFQHAeHRW58Ek8s71la4F7rOJ9eB+g7yDturEEzd5HqUHXLk0syub9a/QoImlbgzdMsBedcWshaINalEJ1qPM+/Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wo2smy7v; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6318855a83fso12637483a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 04:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759837091; x=1760441891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ml4LEpVTJVXyrvhWASdbj9I+fhI5yZyg6wx5UdWe8k8=;
        b=wo2smy7vYZrTD9Q0Cx5Z5mqKasYKeeG7J1IOXsE2sMUfSwXiUG0nWjZZlnx+bObFma
         zlaXZFdGKz1nvMMHzK3mksdabpzXNYx8V9Yy/hMtFpODdkE2/9n6wkOQDpxjOHeshYTB
         +iWFPXXsfUOgqErrgY8yftdbIQHi6RGjifvNhly7N8pLmY4WWz4YsxRBSr6/46HFXUdP
         9/BbPlqqxRxw4tTV8Zn+L21B8SBhxvQJGSz26cmr+2wsYo96DCRajLOUnvyQMYmhzjJR
         yD10lzALjZYAb1Ww/bcRenMCzWhmZTFj2gW2fJXTOVuGkh1wY8JbVddYljVxhzoDFwqt
         XBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759837091; x=1760441891;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ml4LEpVTJVXyrvhWASdbj9I+fhI5yZyg6wx5UdWe8k8=;
        b=LwdFneYzYk9pgrr3/CUudOAyOMDav9wZ6oAo2kj4oo6S6SQ1Ug9u6+2RdYHJbdoiQu
         t0c2HruH+t+v5TvNdJ5csakky2bQdmYuEZP/7zkrfkFK4cue82hxLYnzqLVfuzvfqy+M
         Ryaf8V3P/wts0lcOuxMB0G303FBa9+QdqpV2XBvrnV2CohwzcgL3iWXd4dwTjPfvK7Bd
         mK3mHig3SHAoLgcAROIor/V3atGGunkmWbo2P6bAtT7+wvedloSoJgW5Dqi5cj10Emji
         u/GtSQXxXsMzZeWKuD53Ff6otZbAh5U1/MfS2HdWBJulBdqQ+55qj2mou7DURyzLzojp
         dwug==
X-Forwarded-Encrypted: i=1; AJvYcCWVpKzsi5Qi1VQX40gib3Se4z3iZCw0QLvgOYGiUMPYTbYPOH2Pqs2hgkWqqq55RYD596JIk6zpAgLCdycs@vger.kernel.org
X-Gm-Message-State: AOJu0YxKJjVw9kGkImPZyy/8MwCC7fW3uubjUe+XSGkCXGAy+tBORxKu
	gRKURVuI+8DaoO2BrMATXdlPO+QTUyWDv2wSDIH1nCwwIZX59w9/TB+vCzM7M2VARviggtbJN8y
	cdd0aEdM=
X-Gm-Gg: ASbGncvY0nyE26wTX77LzyzTGDFGHAXuXYUNonFKUSr1YCfjLcQy6mmecrSU+UG1pmu
	Yb62ljgh/rv7Msj23OpBWda/yhZVQ8nmN4HTKGZylE/3N5uQELzD2sQQGSfPejHYlAWiLj72xkr
	ozZnU9wSvITnNUGLBHr8CoZN0yb5oY13uymh0kr/QS7Yeu1xD4rgR3oUDL90IKFUpk9B6vMOylo
	8RoTn83dAjGKA0nLyprxOVibbzfGFl38pnPrMJXMdnHxQFvY+c6wwgCvm8xg59d+RNMY4MklnR7
	ZXHKiWvHRTINcatoLkI6/MaYM0FeC+hq6bEvJQ0HmrFSFnvnG0JerbEryh+wIZLxLsrPLWe5PCv
	iYzmxOd+bhLPDifTJejqUHnXtloKbj4ukHjNPR8npS6JW3kCWEheu7oPDFOVfIaKSuUaP6KUreM
	iT6U7DyHqAbxUrN5rA
X-Google-Smtp-Source: AGHT+IGRGfFEPmDIsh6CnYypDkCoLqPl3lzoN0Kez0PhVDQ7AyOqIyogj/xm1iA3ddUkIdKbeJyTsg==
X-Received: by 2002:a05:6402:27d4:b0:636:21b3:25a4 with SMTP id 4fb4d7f45d1cf-639348ddf20mr18989792a12.10.1759837091307;
        Tue, 07 Oct 2025 04:38:11 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6376b3abcd7sm12224132a12.2.2025.10.07.04.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 04:38:10 -0700 (PDT)
Message-ID: <41899b79-7b12-4f94-a55a-7d365336a147@linaro.org>
Date: Tue, 7 Oct 2025 12:38:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: venus: prevent potential integer overflow in
 decide_core()
To: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <gpZbbJubwhdMWqv7EprxhkTnwMAvvFs-qxjUEDxb-sji4H2XnPw8M02B6QLs7mrG_EXAgAjmhLVaMZfaVRoAKQ==@protonmail.internalid>
 <20251007103043.1969715-1-Pavel.Zhigulin@kaspersky.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251007103043.1969715-1-Pavel.Zhigulin@kaspersky.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/10/2025 11:30, Pavel Zhigulin wrote:
> The function 'decide_core()' contains the following code:
> 
> 	cur_inst_load = load_per_instance(inst);
> 	cur_inst_load *= inst->clk_data.vpp_freq;
> 	...
> 	cur_inst_lp_load = load_per_instance(inst);
> 	cur_inst_lp_load *= inst->clk_data.low_power_freq;
> 
> This can lead to an integer overflow because the variables
> 'cur_inst_load' and 'cur_inst_lp_load' are of type u32.
> 
> The overflow can occur in the following scenario:
> 
>    1. The current FPS is 240 (VENUS_MAX_FPS constant).
>       The processed image frame has a resolution of 4096x4096 pixels.
>    2. According to 'codec_freq_data':
>         - 'inst->clk_data.low_power_freq' can be up to 320
>         - 'inst->clk_data.vpp_freq' can be up to 675
>       (see drivers/media/platform/qcom/venus/hfi_platform_v4.c
>        and drivers/media/platform/qcom/venus/hfi_platform_v6.c)
>    3. 'load_per_instance()' returns 15728640 under these conditions.
>    4. As a result:
>         cur_inst_load *= inst->clk_data.vpp_freq → 10616832000
>         cur_inst_lp_load *= inst->clk_data.low_power_freq → 5033164800
> 
> The proposed fix changes the type of these variables from u32 to u64
> to prevent overflow.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 3cfe5815ce0e ("media: venus: Enable low power setting for encoder")
> Signed-off-by: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
> ---
> v2: Revert min_coreid and min_lp_coreid to u32 as
>      Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com> suggested
> 	during review
> v1: https://lore.kernel.org/all/20251006154041.1804800-1-Pavel.Zhigulin@kaspersky.com/
>   drivers/media/platform/qcom/venus/pm_helpers.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index f0269524ac70..eec49590e806 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -582,9 +582,9 @@ static int move_core_to_power_save_mode(struct venus_core *core,
>   }
> 
>   static void
> -min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u32 *min_load, bool low_power)
> +min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u64 *min_load, bool low_power)
>   {
> -	u32 mbs_per_sec, load, core1_load = 0, core2_load = 0;
> +	u64 mbs_per_sec, load, core1_load = 0, core2_load = 0;
>   	u32 cores_max = core_num_max(inst);
>   	struct venus_core *core = inst->core;
>   	struct venus_inst *inst_pos;
> @@ -639,8 +639,9 @@ static int decide_core(struct venus_inst *inst)
>   {
>   	const u32 ptype = HFI_PROPERTY_CONFIG_VIDEOCORES_USAGE;
>   	struct venus_core *core = inst->core;
> -	u32 min_coreid, min_load, cur_inst_load;
> -	u32 min_lp_coreid, min_lp_load, cur_inst_lp_load;
> +	u32 min_coreid, min_lp_coreid;
> +	u64 min_load, cur_inst_load;
> +	u64 min_lp_load, cur_inst_lp_load;
>   	struct hfi_videocores_usage_type cu;
>   	unsigned long max_freq = ULONG_MAX;
>   	struct device *dev = core->dev;
> --
> 2.43.0
> 

Contingent on passing tests.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

