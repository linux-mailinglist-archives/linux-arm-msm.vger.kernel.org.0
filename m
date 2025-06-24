Return-Path: <linux-arm-msm+bounces-62244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8DDAE7285
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 00:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFA4E5A5287
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 22:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258D625B30D;
	Tue, 24 Jun 2025 22:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SRAljMDx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501ED25A625
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 22:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750805606; cv=none; b=MOJaGIu5s5YwixbfVBlan5gXLE0q8aUOaNBJygs1UPBM0xftpHZj7q1bnP/bO7IsWFqWblfacrW8A8L7yxlUEGTnRYwO7NVgyG5QvQSWA1YaeOQTxobcDynMKTxz+jS/fIabp+mCX6OqxV7J/EknNrOelU2T2gzRvQ6JcWySyx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750805606; c=relaxed/simple;
	bh=ii+hIQEk5KPpp9Rn+sMvSqUQf1xudg6b3gBT7fQQSZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TDi/7bzTX37v1pxWAO4uoYNqLlVjGotvkZ3k6Ps10Zm8bcMmSzl5xgtTXuYoYByTPrRzacrcEH7ZPZOcKwlICNGbrP9VkGjvm/AsNwDPgXR2+jnAkHwyXLHwrt4l58jQEsgG6ihsE+nnZM24MbI9d1W6WCzGrY4nbNy5xQfmhqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SRAljMDx; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so67116925e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 15:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750805602; x=1751410402; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XwW9cC5wHVHau0v/JAk5tSGRFiIcBmMVN4B9SoOsJMk=;
        b=SRAljMDxjawpsCW5wMRo+gfIMyOqMl8JfUAvTR5MARboBkvCpE4RG3DRwM+MaDocuE
         7SrjzdCM8eDHEk6/W9UliAJrvRV06yrC7AYgC6UfElhdrvb0rzh4uJTId1Z3KCCuv8jY
         ISA9oBUemY9MjYWTPccCwsTVGXSsR8Wnfn3LcKgH8alN8LuQ6T/s1dZDfFKirYVVh/sH
         9rSwPRFVoGyC6SSjEf2lXr/4PSIG/YViK2sU7szoVKh55P67bhq4go3YF1CekojB4ZwT
         hfQwHIpf9gWk7XA70WTqkC+/BpPfRvo6vMrEEZmAgfD73A00l62dHTmR0hI0oRkVQYJY
         U2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750805602; x=1751410402;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XwW9cC5wHVHau0v/JAk5tSGRFiIcBmMVN4B9SoOsJMk=;
        b=bEzPjw9u3bwGcEfFZlcK6tfeWrgAlT9y1q9FYtWyyJSknL+aDaPyEQAcIMfFsbReWf
         YTX67a4cyzOLfD7nvdPzZDhMZyjrQ4gSeMd6lWdQVJ8LOIo4NsooQO7IVpdw/2tLgQov
         OVKtTm90NzAd/KwUvJskW+PD2+pOdSiTpQEj79Llqst0uWboLAiOt0Tzg+AH70qs6QZ8
         hU+nh08k9orRJxOe3DNC909ecRe5H2tWRw8mFHxJBP6fVwAn99jpwBQI0NZBKhR1kcli
         XZkro2uEQS5BTg48aYi1fudkhLxg8XVlrhHflMGl/PST2c35i9zQkCXUlXllpgENHbXL
         tHVg==
X-Forwarded-Encrypted: i=1; AJvYcCWhCp/UFa98hCzI3eNkjnzvnm+WD8CIxL7taM+ydCvEGv9sDXP82JZEnOdMFAlMPhvGA72KyJ6Mo7Wzxv+z@vger.kernel.org
X-Gm-Message-State: AOJu0YzgSTxNbWXPgh6FDT7lZ7uoMyjp2dpB3NLG5YM5bTTrO91pA37v
	agkziwqtH9/Vemts9d2dVUAyq1A1LnyM/OjKltnQzdqNqAsqEnIbRbuKWNQkVPeInxc=
X-Gm-Gg: ASbGnctyIXpx8SPeYcO9wvdRRZ7lc4sqxVMiWzPrfv1oqf3S6xUYeeYP+vejKW5EPEQ
	HEvkR3c5g0EaHy8bcspKtHunmHqoPsNVNvch1rl1LtvZl1qN6xghJJCObmwBy6Mn5Ri1nvORFUO
	PeYBdt2UOfSgQfuJNLLxJ4jlnMmjH5HtARPdBc0CNptAh2os++wcvkixlB1ncvX9kuTN9BULD36
	dps/RDMTU2l8EDcyvMl97A+arK4sS+0hHThM8FFTHKESwpR2bauNt3g8YJxSazaWIScLy9Q6G75
	8aeA0SKkbCMGz4opUV/KLgTKZdIzJvuYx+Oc8VxVkT9BbQkXSx0SBAYhH82U58qt3yDJfKbwWto
	QlO/ZujtX0vVPvVOItoBwpgw3SLs=
X-Google-Smtp-Source: AGHT+IH8P6BDbTrJ0EiAo7KibXe1ky3Gx/YMDChSZawMD4kyG+0v0v3ZS0ATCr23xT6TbXCSVhiztw==
X-Received: by 2002:a05:6000:25ca:b0:3a4:f379:65bc with SMTP id ffacd0b85a97d-3a6ed64a81emr351747f8f.40.1750805602432;
        Tue, 24 Jun 2025 15:53:22 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad0fesm2055835e9.25.2025.06.24.15.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 15:53:21 -0700 (PDT)
Message-ID: <fac65b9f-d95d-4e7a-a82d-223f3297d9e3@linaro.org>
Date: Tue, 24 Jun 2025 23:53:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: x1e80100-pmics: Disable pm8010
 by default
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, laurentiu.tudor1@dell.com, abel.vesa@linaro.org,
 jens.glathe@oldschoolsolutions.biz
References: <20250624225056.1056974-1-alex.vinarskis@gmail.com>
 <20250624225056.1056974-2-alex.vinarskis@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250624225056.1056974-2-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/06/2025 23:41, Aleksandrs Vinarskis wrote:
> pm8010 is a camera specific PMIC, and may not be present on some
> devices. These may instead use a dedicated vreg for this purpose (Dell
> XPS 9345, Dell Inspiron..) or use USB webcam instead of a MIPI one
> alltogether (Lenovo Thinbook 16, Lenovo Yoga..).
> 
> Disable pm8010 by default, let platforms that actually have one onboard
> enable it instead.
> 
> This fixes dmesg errors of PMIC failing to probe, and on Dell XPS 9345
> fixes the issue of power button not working as power off/suspend (only
> long press cuts the power).
> 
> Fixes: 2559e61e7ef4 ("arm64: dts: qcom: x1e80100-pmics: Add the missing PMICs")
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> index e3888bc143a0..621890ada153 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
> @@ -475,6 +475,8 @@ pm8010: pmic@c {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   
> +		status = "disabled";
> +
>   		pm8010_temp_alarm: temp-alarm@2400 {
>   			compatible = "qcom,spmi-temp-alarm";
>   			reg = <0x2400>;
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

