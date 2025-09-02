Return-Path: <linux-arm-msm+bounces-71689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0ADB40FF2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 00:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DEBE700F19
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 22:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A2312773C2;
	Tue,  2 Sep 2025 22:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YD1WzfPb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4C6275AE9
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 22:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756851535; cv=none; b=TpGVBh3y3xpVv3YXQr0wg/SYRYtmWqNtjYcUK+G4jZOv5cenOoUKhqH1dc89IbWL6bX+UL6j388tXpSA9v9Deb1xbsHe//zl+RRh4yd1/W9z23aN+zJGlJ7zjTWZY9uRDCEpwBacFvEq9A9RQnQUvxZBHE3Cya9ftkWaNeMFJxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756851535; c=relaxed/simple;
	bh=LFMNs2f11salGKakRkwUCy3h9YxD320vvtitkLmtiDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KMdP01kgDdcrvnHl/fFVcmNY5oxqX7Bnr0VI25pRaG5KNaOaSf7NsN2Ye+75VtmYE3kBNhwWk6HzMwSWVtxpcDhn01QsYzuOibD3f4DhittpRdAeshwj/nzdP8b5zVBM762cj3UpI4NvzsDGQbQTdAKO52AQWTe3FPHV4ycWA+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YD1WzfPb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45a1b065d59so40588235e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 15:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756851529; x=1757456329; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sXt/asDYq3TH0BdNCcvYeBRn6iTRyQGujHraDlSoCSw=;
        b=YD1WzfPb0XRgyEWM7PKx3LyjWLnUur4NW83nrJ3tUpQtjE8ruziMYP8s2ww2UYf8IT
         /Qt94QIbCzI2q7mCa9ngsRX+O09V/EWwi1643oRucXXKw3qjNDSb2FY7KmGbcCrVEiW1
         ruDvRndetLBbAjH2N2KVt7OgXto7g2sVSDWr1clluGfXWnAGepStHfnQ1hhYnFpgR7fs
         GHNtZ5Ll6q+02XyRbAWr2hplCO0xRShiT0L3XNLWpJEJT1IpOkroyzYrXaCV7T7Pvmfi
         ZbBDAxa52sEtr1tXIVryWoiPxD5VWgqQtDQq+DbZqgGF3wh6e7J/mwyPBoS7n4y8sKxJ
         7pDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756851529; x=1757456329;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sXt/asDYq3TH0BdNCcvYeBRn6iTRyQGujHraDlSoCSw=;
        b=f5C0/HH/aYjBFI5bfwKvKfQaA1MMuPh83aE1e8EY475jP+1bb/tHgdYSdNDW3UVXH7
         ojNJRYlXHq5UT8VtWqf5Tk2nvK/KR81uTOdUEGl27g9qL6XphF1/HFDzdIkGEEmzj7FW
         drctfWCidZlmQrplKgQDcD0pWR5nkdDRZiroMQpcVJGju9tKowVo8PZlrwtjVKZnQc6O
         gARUhjZibM0E3qu98LhGudt7fIE4tA6tFsBMworbUfG16gLyLRnky3kBmTU3I1qOPppu
         6LEehkN6LnMbbLQUlb+2SJDl2B9FI3eDvq2WToIiBiepl9vw5TDAi10SI+ub167XD7pj
         8y5w==
X-Forwarded-Encrypted: i=1; AJvYcCXPGjEyjN2HvrjdN4Wxlqt+45aRQjMJGDd+I9LhpyS0oTMX8RfQvPttJqZoqBRGIK/EPgFpDF3yqMdvkwpw@vger.kernel.org
X-Gm-Message-State: AOJu0YxJBZWBiT8t4q66XoXQcM/8BsGAkHbZ2FdwKcWFkQ5TosMqmYkd
	6WNYfnHFrS2zLC3SJGZ/+kvftMgU6RpfHWdk9BWMEFUgaATLhSHRCbBj18ckuQNs0ew=
X-Gm-Gg: ASbGnctbFMfm8j3UF6nygcXGEHF7cwb/GGSPSstFPzE7Q+pHXkpdR1nAA7FnfB5U7UG
	8KGnacdRIdjO/dSXeeWGHlKh3Lpo6QZ9m6qQgiIOFE4PKLMc86OwAnoXLeFUsqhQFy2Bl9z4fZT
	lW91sOXH7ppwPapEl/48ksqwHHJyPo1mYZKR18MbSw5Q3c3YRbIcirlAV4m30tk4u7gF8yoCCg2
	2TVXpeqm3Zibn+azGoWhPsmcuoOFibPd7FFByHxmTRBHTzvW/CTip/0yQ+2tr0n7vO8TD7HJXQz
	QuV1UtuyYjpNb91AjkheHpJ410IC54Gf5CbzcFJRjJfaKax99pTepjzg4lh6kXeNzfxGLfrutLH
	BUFihhps0G08r1ey6+qV3+MouJIxbxR72oMDr6aiWmN+lY2ZpAf7t8KJSRLsgJ7ndwmC1TyhSbh
	8xhSGhl+v7/MDudr2tv338
X-Google-Smtp-Source: AGHT+IEv98rJqJ2A4oCVv+NELsk8v/jt/2Wf6G4aJXvzDZjrvT8K/3C3HFkWNuYtV6VM7Zam4DOwyw==
X-Received: by 2002:a05:600c:a0a:b0:456:1824:4808 with SMTP id 5b1f17b1804b1-45b855aeb67mr98417305e9.32.1756851529334;
        Tue, 02 Sep 2025 15:18:49 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d701622b92sm9842168f8f.58.2025.09.02.15.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 15:18:48 -0700 (PDT)
Message-ID: <896d8e1c-b761-4111-aa28-e78836d22352@linaro.org>
Date: Tue, 2 Sep 2025 23:18:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] media: iris: Split power on per variants
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250902-sm8750-iris-v3-0-564488b412d2@linaro.org>
 <20250902-sm8750-iris-v3-2-564488b412d2@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250902-sm8750-iris-v3-2-564488b412d2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2025 13:45, Krzysztof Kozlowski wrote:
> Current devices use same power up sequence, but starting with Qualcomm
> SM8750 (VPU v3.5) the sequence will grow quite a bit, so allow
> customizing it.  No functional change so far for existing devices.
> 
> Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu2.c       | 2 ++
>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 4 ++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 8 ++++----
>   drivers/media/platform/qcom/iris/iris_vpu_common.h | 4 ++++
>   4 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
> index 7cf1bfc352d34b897451061b5c14fbe90276433d..de7d142316d2dc9ab0c4ad9cc8161c87ac949b4c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu2.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
> @@ -34,6 +34,8 @@ static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
>   
>   const struct vpu_ops iris_vpu2_ops = {
>   	.power_off_hw = iris_vpu_power_off_hw,
> +	.power_on_hw = iris_vpu_power_on_hw,
>   	.power_off_controller = iris_vpu_power_off_controller,
> +	.power_on_controller = iris_vpu_power_on_controller,
>   	.calc_freq = iris_vpu2_calc_freq,
>   };
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> index bfc52eb04ed0e1c88efe74a8d27bb95e8a0ca331..27b8589afe6d1196d7486b1307787e4adca8c2aa 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
> @@ -292,12 +292,16 @@ static u64 iris_vpu3x_calculate_frequency(struct iris_inst *inst, size_t data_si
>   
>   const struct vpu_ops iris_vpu3_ops = {
>   	.power_off_hw = iris_vpu3_power_off_hardware,
> +	.power_on_hw = iris_vpu_power_on_hw,
>   	.power_off_controller = iris_vpu_power_off_controller,
> +	.power_on_controller = iris_vpu_power_on_controller,
>   	.calc_freq = iris_vpu3x_calculate_frequency,
>   };
>   
>   const struct vpu_ops iris_vpu33_ops = {
>   	.power_off_hw = iris_vpu33_power_off_hardware,
> +	.power_on_hw = iris_vpu_power_on_hw,
>   	.power_off_controller = iris_vpu33_power_off_controller,
> +	.power_on_controller = iris_vpu_power_on_controller,
>   	.calc_freq = iris_vpu3x_calculate_frequency,
>   };
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 42a7c53ce48eb56a4210c7e25c707a1b0881a8ce..6c51002f72ab3d9e16d5a2a50ac712fac91ae25c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -271,7 +271,7 @@ void iris_vpu_power_off(struct iris_core *core)
>   		disable_irq_nosync(core->irq);
>   }
>   
> -static int iris_vpu_power_on_controller(struct iris_core *core)
> +int iris_vpu_power_on_controller(struct iris_core *core)
>   {
>   	u32 rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
>   	int ret;
> @@ -302,7 +302,7 @@ static int iris_vpu_power_on_controller(struct iris_core *core)
>   	return ret;
>   }
>   
> -static int iris_vpu_power_on_hw(struct iris_core *core)
> +int iris_vpu_power_on_hw(struct iris_core *core)
>   {
>   	int ret;
>   
> @@ -337,11 +337,11 @@ int iris_vpu_power_on(struct iris_core *core)
>   	if (ret)
>   		goto err;
>   
> -	ret = iris_vpu_power_on_controller(core);
> +	ret = core->iris_platform_data->vpu_ops->power_on_controller(core);
>   	if (ret)
>   		goto err_unvote_icc;
>   
> -	ret = iris_vpu_power_on_hw(core);
> +	ret = core->iris_platform_data->vpu_ops->power_on_hw(core);
>   	if (ret)
>   		goto err_power_off_ctrl;
>   
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> index 93b7fa27be3bfa1cf6a3e83cc192cdb89d63575f..d95b305ca5a89ba8f08aefb6e6acd9ea4a721a8b 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
> @@ -14,7 +14,9 @@ extern const struct vpu_ops iris_vpu33_ops;
>   
>   struct vpu_ops {
>   	void (*power_off_hw)(struct iris_core *core);
> +	int (*power_on_hw)(struct iris_core *core);
>   	int (*power_off_controller)(struct iris_core *core);
> +	int (*power_on_controller)(struct iris_core *core);
>   	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
>   };
>   
> @@ -23,6 +25,8 @@ void iris_vpu_raise_interrupt(struct iris_core *core);
>   void iris_vpu_clear_interrupt(struct iris_core *core);
>   int iris_vpu_watchdog(struct iris_core *core, u32 intr_status);
>   int iris_vpu_prepare_pc(struct iris_core *core);
> +int iris_vpu_power_on_controller(struct iris_core *core);
> +int iris_vpu_power_on_hw(struct iris_core *core);
>   int iris_vpu_power_on(struct iris_core *core);
>   int iris_vpu_power_off_controller(struct iris_core *core);
>   void iris_vpu_power_off_hw(struct iris_core *core);
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

