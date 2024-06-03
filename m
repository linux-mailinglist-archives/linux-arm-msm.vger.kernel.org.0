Return-Path: <linux-arm-msm+bounces-21530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8D88FA613
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 00:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2462C285E08
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 22:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1C1813CA87;
	Mon,  3 Jun 2024 22:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="argiK7Y4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8AE135A46
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jun 2024 22:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717455318; cv=none; b=eU4Qf8AHzVRCtWVe3Qm22uEiKlSHzaVSrwm+xPaQ58uygQ6v9HcJ/62hJlhBK8g8gGhnRXOVm43tsz+X6X9f2GWGhK2ExnURIEm5BhB9JWx3T7Utj3dmo2A8PaKbOVE0PZVIMxgdxcC9YeTbtM8ssZ3r7cxbxVgnIhZf87V2S1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717455318; c=relaxed/simple;
	bh=uUbiWIjwnnGE6VWkkFj4PFE3J9rXzgN/ZesvHz0u+zo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pwX5iBE3l3Hu4ZLd0PX/dnKkngHpN2KOortZ/5ibm7elWYv62mMcssOkDFXIf4CKj5Rx43S5/WkzggFHwl0YIZl3ELIhQ+FlguHmSlEm6Zm3rlnCcYEsG/+tuuARQ+3wwXzcpT7EzaNxOiVR/Ag1aPVN4pb/ViGC0lrZdlz7+M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=argiK7Y4; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-354f14bd80cso319312f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jun 2024 15:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717455315; x=1718060115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=66zY39LuniQpXMC6sct7mSumsbMOEu9OY3PNKc/iLhU=;
        b=argiK7Y43S4/T4Tq4ssNzcHubcu7iGTjyukkEbc2Y3/77L+Ufi/j4GG6h2rvPD8+sY
         zfdgd3mso7zcN5hrh2K72oZefcGrZbWXytTZLbUqnyZeEUJH9eMnwxcnITrj7OXQ2kDS
         nivLkD3NSfm9mGReQK873Zl91hP92ph2AJG1AGef08fx3fA65LBrvnNXl9MAq/ONKgGK
         T4cvgqxSpgjyEEL9bnyaFUaot/Sj9+WnLgibZDkbmNy+Mcs88gtZayi9jHYsUEf50FyH
         BmXg0yV0xIqU7v1HqTr1fBluJe/lhB8rcTmRuIuUZYO0hIroJzw0bvkoBTHaZQlvSNjx
         Onrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717455315; x=1718060115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=66zY39LuniQpXMC6sct7mSumsbMOEu9OY3PNKc/iLhU=;
        b=w8nas4oWAqXYqUE532fJUFD41EoJCYSw+LgoyH/xzMwYza3wVVOMoSfD9fZbpf6Y3k
         VTpeDdGIxMQHfOHlivAQv4yOJmDmSbXn+ZjIU2uZ4txJcZ8LFpIvDdzu3bhdwsHR0B1S
         ncyzn9RVtHzu+mr2MuG5o+C6BiaHk/wfxZ4RjNPELwVbjioxnYygC7/ae1PpfcrbuX5N
         lyrW11hmNfG3F4I/ajsipym3NOGpHYTE4CPLHT2XGiqF+CX2poImuZV7YWbFXT+rTgNw
         +RSU1LLZDtdLIlo+SSJeYA3OPaKbdMWaK5iHvs0B1SVeet4zB01dIThkpaGr7g/3KnOC
         NV8A==
X-Forwarded-Encrypted: i=1; AJvYcCUlvkk/fywRdmE6PyOKrsk3O9//gHTsOPY61HYauzJCpyPlHyPKlAMpdjoF4JWi1JsZizwFwIQKaOUoNuNlCdzwvxQhfqJMjtLh8xFP5Q==
X-Gm-Message-State: AOJu0YwYcMWhDyDyArFkojvQwTm111lxNOwXlo0rrGHH99ISNkyoJ3QT
	TSLed0PdVZUFQUXo4cQwVjzAMYozOY0EDJ8lqeR3sAhQfxUQaD/JMvqsCy+DukM=
X-Google-Smtp-Source: AGHT+IGGN+mWxdfrjGi7BHgtB6aslWvzMResDhy0EjjDkTN33ABYVuWgC9EC7xzQoCZklpTQpsh2VQ==
X-Received: by 2002:a5d:6d05:0:b0:354:dde1:aae4 with SMTP id ffacd0b85a97d-35e0f30c091mr10202766f8f.46.1717455315523;
        Mon, 03 Jun 2024 15:55:15 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04c0f57sm10066765f8f.12.2024.06.03.15.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 15:55:15 -0700 (PDT)
Message-ID: <29f03864-518a-46bd-b37f-635b0e3ea4e7@linaro.org>
Date: Mon, 3 Jun 2024 23:55:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: enable several Qualcomm interconnects
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240603-icc-msm8996-builtin-v1-1-3e3d1b0a78ee@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240603-icc-msm8996-builtin-v1-1-3e3d1b0a78ee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/06/2024 13:51, Dmitry Baryshkov wrote:
> Enable drivers for interconnects on Qualcomm MSM8996 (Dragonboard 820c)
> and SM8150 (SM8150 HDK) to be built-in. Otherwise boot time issues are
> observed on these platforms.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm64/configs/defconfig | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 9a467dec78b7..d4d0f8e05dce 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1597,7 +1597,7 @@ CONFIG_INTERCONNECT_IMX8MQ=m
>   CONFIG_INTERCONNECT_IMX8MP=y
>   CONFIG_INTERCONNECT_QCOM=y
>   CONFIG_INTERCONNECT_QCOM_MSM8916=m
> -CONFIG_INTERCONNECT_QCOM_MSM8996=m
> +CONFIG_INTERCONNECT_QCOM_MSM8996=y
>   CONFIG_INTERCONNECT_QCOM_OSM_L3=m
>   CONFIG_INTERCONNECT_QCOM_QCM2290=y
>   CONFIG_INTERCONNECT_QCOM_QCS404=m
> @@ -1610,7 +1610,7 @@ CONFIG_INTERCONNECT_QCOM_SC8280XP=y
>   CONFIG_INTERCONNECT_QCOM_SDM845=y
>   CONFIG_INTERCONNECT_QCOM_SDX75=y
>   CONFIG_INTERCONNECT_QCOM_SM6115=y
> -CONFIG_INTERCONNECT_QCOM_SM8150=m
> +CONFIG_INTERCONNECT_QCOM_SM8150=y
>   CONFIG_INTERCONNECT_QCOM_SM8250=y
>   CONFIG_INTERCONNECT_QCOM_SM8350=y
>   CONFIG_INTERCONNECT_QCOM_SM8450=y
> 
> ---
> base-commit: 0e1980c40b6edfa68b6acf926bab22448a6e40c9
> change-id: 20240603-icc-msm8996-builtin-c2fef8752d1f
> 
> Best regards,
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

