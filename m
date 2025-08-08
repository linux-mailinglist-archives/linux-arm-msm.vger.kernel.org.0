Return-Path: <linux-arm-msm+bounces-68106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E262BB1E561
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 11:11:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7E11188A8BD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 09:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF04826A0E7;
	Fri,  8 Aug 2025 09:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JJg83/Zu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E864825A353
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Aug 2025 09:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754644294; cv=none; b=dD7A+fZVgiQDw+cZijes6XooPg53B6Sak2k+6wAoAxR/Gq9n+7neYd6DrgrKzsfByqlMOLM7keWbX8VL5Trn9ZBjvOaAjgHrz6NjNTuHi29wAK20JnlwoKNyq5IUb4hPS8ycyWmCiShV8L3tH0FovK9c1eg6Gsx8RkQVgDxOrmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754644294; c=relaxed/simple;
	bh=yO5R5g4RRRQ9fylhV15S4TlG43LV0nzy1cjPY86UEqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fFqVa6XasPLQoJPjDHHliiWqhU7csD6BMvIDK/AJSp3HdTlG0RUmMZfwznE/YjCOYKiZcxnSW7MW9d+q+xIpFkS2wwCiQ5xfuL1z0RqDAomJSnh54Go5d0MlleVbH/prrUJ/NuKQ1UdSVe+T8zoRvN8e0VY8bRV+J8UXy2nccn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JJg83/Zu; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b7862bd22bso1459105f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Aug 2025 02:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754644291; x=1755249091; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kQHZz2yokMkgkwlKNquoPo8xw5GL1brCMiREVSCGCgU=;
        b=JJg83/Zu1uZJYskpUVR9qjcGv6WphJLWnmEyrMtPPOUSHWJ0wv9N4tWLV8uCWx4quX
         RgK9bA8oaHhfj89/HDePBmCzFG8OeG131mBhtT/0i6FutIZKvN+RvZNp7dCCG8dOxo0e
         JPHP4ebN/+JgBKt4m6hTLgDmAJry+n+ft+DZ0Zup6TV/Q4V5QtZmLjblG9MixK9nFTS4
         5PoXsyTkZZ3fv+FtqEKkvQ5mw/iCWoyqDM86qGDlQeFqXW/evSyUz2epNRfmVFJKdhWX
         bpC1HiH924dmKpsFgHTJc60GRepFOCSAw3r12EYJnjVG9hbFxWTnqCaEupb58l+XXD4b
         CIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754644291; x=1755249091;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kQHZz2yokMkgkwlKNquoPo8xw5GL1brCMiREVSCGCgU=;
        b=jNVM/gD9l5UH3vn5ebuF0tW05iwYbLVRu4frqOu4EVJYhJuck+PB+jqnwS8dK0Idwy
         4UNS32Xz5B9cor0SOHcuwEmWrScY/d02gTtXjVHgRf2uk6TKwY6RJvADWuhAGK47bk5R
         jLLk8qmWTNxp1yFqOs4hpA1HQ+OktGP8CfXolqk04a/C5tJFu/QSz4UeNt/ukdlJ573G
         LVCUGPLa37REyYAm6VBqVUdfetsrJ6PAEKeIc8YSoU6ZA8s91JoyQeuDKElbKCZDg9oj
         RSSmEpvz+uLlOux4q3uznzys7wRjMxruYHqWDXkvNhV1ktAgbByiBuH6eiM98xhTKbet
         L/pg==
X-Gm-Message-State: AOJu0Yz1XUYeceAwEXd5znbNuNH6/ylFLC3JSbGaxN4uveAnlSNlSZG4
	kJKhZc9nBo0dM47jvdJqWcWmPpww/LHdS1hiUmUI7V11vmbW0gPqLbAiYbemkIG/TBI=
X-Gm-Gg: ASbGncttevANVsVk34WMxxDPhu0dwZnQdzKNyOGJPnjvu28EtZGgy7zgUoXGZ843nZF
	E2LHiRHnwIoto53qT3R9PQJUV68fi2upyauDpEyDCF7DuDa8w4pSvgWuyZNnLkFrIh/aau8XLgc
	HECwCJLcYV2NKnt67WVY6dcpkPPukjURtNl67a6Vo4FPHFAZnkgY6bBSX8y0sDYtHsu6DhajfBP
	kfddLe7R+2Gvyj05ZJ/HayUc9F776O9F8IfJEpqptUSasts6kPYHB5M2mVF/yV/NzpDZ5D16QgK
	guP/4hSWSFSGQjSrf1Q2rohc0sobk0mzkG8+30OiDybzmThzNs5VDT60+t6E+NQbLwqv83oF1BZ
	Xx0gw8TWG5ozOUZoDml+GzvXxkdcee+Be713wApM1o2huEHaeT6iNer7VGlgNC6M=
X-Google-Smtp-Source: AGHT+IHDbCe6jjj6r9hyHFmBI+bqB412fjCUIPMbbqAd89xsBc/7FSoiXU2imCpUAZvEXTUCmX66eA==
X-Received: by 2002:a05:6000:40e1:b0:3b7:8842:89f5 with SMTP id ffacd0b85a97d-3b8f97bbfa9mr5683297f8f.1.1754644291208;
        Fri, 08 Aug 2025 02:11:31 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458b501f22dsm165801695e9.0.2025.08.08.02.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 02:11:30 -0700 (PDT)
Message-ID: <343c1606-75c5-4b2a-9d45-160a6a8fe255@linaro.org>
Date: Fri, 8 Aug 2025 10:11:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/8] media: venus: core: Sort dt_match alphabetically.
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, krzk+dt@kernel.org,
 konradybcio@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
 mchehab@kernel.org, robh@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250808085300.1403570-1-jorge.ramirez@oss.qualcomm.com>
 <20250808085300.1403570-6-jorge.ramirez@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250808085300.1403570-6-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2025 09:52, Jorge Ramirez-Ortiz wrote:
> From: Jorge Ramirez-Ortiz <jorge@foundries.io>
> 
> Correctly sort the array of venus_dt_match entries.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
> ---
>   drivers/media/platform/qcom/venus/core.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
> index adc38fbc9d79..9604a7eed49d 100644
> --- a/drivers/media/platform/qcom/venus/core.c
> +++ b/drivers/media/platform/qcom/venus/core.c
> @@ -1074,11 +1074,11 @@ static const struct of_device_id venus_dt_match[] = {
>   	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
>   	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
>   	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
> +	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
> +	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
>   	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
>   	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
>   	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
> -	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
> -	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
>   	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
>   	{ }
>   };
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

