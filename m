Return-Path: <linux-arm-msm+bounces-73954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 759F1B7FF06
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 16:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58F5D7BE672
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726D2292936;
	Wed, 17 Sep 2025 14:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ltyK/UcQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99C61C5F10
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 14:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758118847; cv=none; b=VSSW9RG7SrHLk0SpP9S0QATaMyOCNoZnmyYsLOrFSOCTdXV1CxX7c+58Ta+Jj/E8cWr/jExkmunVlnbHIoLo03INGKj1n2pZjnt4VYiO32C+9oJwR1VAqc+ifqEUUQPJRwW9v37VMioExK9AgicWHqSa71EP0F3VJH1DIIm8bug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758118847; c=relaxed/simple;
	bh=7tyu4GJKF9jfMUGs6khpicxMq2EWEgv3/XUYIqCVjms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gghUiSFI2d7CGI6kCnsDjzyp0iFs3HqDEC7wUylSruZRjLGhxZ/L5IYIzlS79znUw2jIqZqankNy8v+l1Z2yciZAsiWvkqMkWrAA5A2SZEtGBBnFmxShKAW4OqpD5lKvumTHi6iXDfKCp7dKX+KHoIEIOPKh3YBZCJiEUaZJiK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ltyK/UcQ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3c6abcfd142so3381202f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 07:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758118843; x=1758723643; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tCrL7wxnMl0L/XqccWsWX7taz8R7Z22xZ9qyTaEV5wU=;
        b=ltyK/UcQvqRKGSj/gBQlc8JU+uAzJlLKYo1BraTD4AgGmYDjs8SP7SonVAW1E+SWM0
         cKIrJJBLbhUYNSU24KQwc4Tlx+XMa/rEwv+IEuvIAJsQ9Ik0O7Omv+V00XY4LR0n7y7D
         vaPnmPVrP9yUPDjOEYM9vDvBBiglR/SJc76O2u8GcWfd/roD9lpj9CWGVGWHNwaSJH7K
         wL7KUpTQQzZfcpMM8dnOtn5ofn4BhP1TxzlCyUVqwS35giAbbUw393OYPJ3Me66Bmtde
         5/0qx6IA8wZA6F3Zxyje4PVAh2+lvwyRwFsYhw34PzEWl5PtM/mpyD6o3WOn30UKcFdE
         VJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758118843; x=1758723643;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tCrL7wxnMl0L/XqccWsWX7taz8R7Z22xZ9qyTaEV5wU=;
        b=XAYl8IGGdAcnpC0yLDVlSlKK7twWtgf3GcSZ59X4EzqItRn5ZVhbam3CxfTRfo9tvd
         A7a1J/0xqBcepGpuT1MYNPoCaEEPqAxtsM7GE0YARWcmQwrt/+v+NyhwSrYfyoKQT0LR
         fiaAX5JNUDtVphSaIIzzOlqxDWziivgbG7kcKJ959xaDG4w8VnPqEYUpJ8+au9ow9qY8
         ug5H8161SYOBN1rlffeTTrIPDqqzlOcKONdQevOH6BQL85VBpAHpNieYm5zZU3NwVyvc
         t+GQssmbqd7ueCEY2PLq9oa13/6HP8wzgGe/Edtjcqz5rJ7x1IhzIdlsm3RGhLUk8C5h
         3DyA==
X-Forwarded-Encrypted: i=1; AJvYcCXp4bs3MLKzIE4Q4ulH6Bks0Chh9m4dkWV/Ea6Mkw6gItulfl2zJuWvtsRhSjVMflKQ4c4FicGdcuZzyInH@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgq8uBMHmwz6cjTs4IAXfl6LSFGfqP/qOylvCRA/IJcl+tb7TS
	rOt3R89wwIqBqZWLU9MZmIM9QAZw7peU4wuKVQhOJknFVxfnipQvA1TlFtqBVCCfRz/JmdRfmC+
	Rqa53szY=
X-Gm-Gg: ASbGncuXc+MMx7bhVFDvduZah9CfwtuuR6GM+N03Cpc58zC+56QCAyuxAWKrllOri35
	2NLhRrp726GryjKG2ZhxlpX4yNM9k7QaCXkJpWeSHghQfoO1/PV+OlLMXWreTLrqc5y1gU2cR+K
	uEzolVylfMqYPNV89oLvok8RChhj29UzBomBcpgqIgpiLJe8JPJF8JcyW7hqE6y8UbqM625rQGs
	zU+LQsSKFpYxbL+mKcRuvZ8chSnwodo5Ggxnaaw9AWfhrlpj98V/5SBFP9atMut/Hj0iSefrTXl
	xWHiJbQ1MKatURatz7MZ8qvybi5KAjzGDwAg+fiQcUqk3sUc3Ae+nds5BvIQi+abnSEI6Tg1azC
	k/LxPkMqn5lKv3gDCh/lGRADUte+NC92VyAus8IrYpAlNwM/VICyFJHIodlZK9tK08iyY82fhwJ
	v0F33pSiyvxM0cIcB0V2Ea
X-Google-Smtp-Source: AGHT+IHEtV11s8uvtBLrJw8cjrZiY8F5DmYwYUXY/HIpzKvSZ9vbcJvZoOTcnaZt2GP4VtSI3q41dA==
X-Received: by 2002:a05:6000:2511:b0:3e9:b7a5:5dd6 with SMTP id ffacd0b85a97d-3ecdfa3f4f6mr1925882f8f.40.1758118843125;
        Wed, 17 Sep 2025 07:20:43 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46139e87614sm39965525e9.23.2025.09.17.07.20.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 07:20:42 -0700 (PDT)
Message-ID: <5810c9a2-634e-4abe-86f4-f8e1e349622c@linaro.org>
Date: Wed, 17 Sep 2025 15:20:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: vfe: Fix BPL alignment for QCM2290
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 vladimir.zapolskiy@linaro.org
References: <20250917124312.675996-1-loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250917124312.675996-1-loic.poulain@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/09/2025 13:43, Loic Poulain wrote:
> VFE-340 requires 8-byte alignment instead of 16-byte. This adjustment
> prevents image corruption/misaligment when padding is needed.
> 
> Example: For SRGGB10_1X10/3280x2464, aligned BPL was 4112 instead of 4104
> 
> Fixes: 9e89149a19ed ("media: qcom: camss: add support for QCM2290 camss")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index ee08dbbddf88..dff8d0a1e8c2 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1989,7 +1989,6 @@ static int vfe_bpl_align(struct vfe_device *vfe)
>   	int ret = 8;
>   
>   	switch (vfe->camss->res->version) {
> -	case CAMSS_2290:
>   	case CAMSS_7280:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

