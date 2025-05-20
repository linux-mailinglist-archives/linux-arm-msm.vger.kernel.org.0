Return-Path: <linux-arm-msm+bounces-58716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6338EABD81A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 14:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D79C33A6FED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 12:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE5C21D554;
	Tue, 20 May 2025 12:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cvJUbteA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02304A06
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 12:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747743577; cv=none; b=fDP8rZVy55wzCSTIx8yQ4Mf13XQ2vc+QkESe6JpFakFCxy9fkDvANlI5eeXUqbnJDMwHyVeoxuDTHNBBph/wIq6kBv+5uR3zKcPezBnz4SYstn1P5XA6XgnuNgYgAEIvBdyXwg3yBWl8NAiYxDLZdNH4dkiiSgNJed6btGyxHT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747743577; c=relaxed/simple;
	bh=yN2oz4RGfjWsr3L/yxfEwmYkVPvraUmd8R28Gu6B0Yc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fcQRe18pHaYKiRdyDpxiMBFOct0ILyOi7rWhUbnDigneCp7t1AQ5SdZ37eAtcP2hsCQMIHetqeYm8fmW4SeNJW90eWZMXDDPTNXgGzC2O7OrUOlvomF82UMqVpgHy1g66xHzisTy11YwzgFC3AgV5eswVphmS7qzE1HuJWstTDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cvJUbteA; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54b0da81302so478224e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 05:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747743574; x=1748348374; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LGxzwmCx0aVZaskSD1cvnXeY9ifmH8LA11mbYYh9vMI=;
        b=cvJUbteAf8Xw1WV0DNcfrB6Gq7qu3YaAU2jIeoXNxuwobYZJaM9B92l7zNJOqQ7tGE
         stjLqXPn001yaYEfc53tGjDzdqAGecNhLq19p8afw4UyVsNZWuGFpv2QdL90Q5KFqoj0
         KpXJRO10E0uhPM94iUjgwPzYjGhGHjYHOa9XNYDme7MzhPg+aM/Ek4Za3RBGg6dUeNSl
         yp3S02zp6aioPjUmWbytHsQOtJp/gSgFtFEo3oKcr36DW6woZ3VGCpZ6yk9+yTRDgnxt
         a09+1o9CkJubWKQWFqg8TUOZhOjbBr6RgKCD2SUO4HwMiEma8QiIYfTaxfi6pbImVEnz
         Z6Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747743574; x=1748348374;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LGxzwmCx0aVZaskSD1cvnXeY9ifmH8LA11mbYYh9vMI=;
        b=pjR3WgIdlWQw6IpKItJPEw2j4Ig16T6gk0XW8cWBPqJUjdJJkHAMkyvuPVdV701V5I
         JyCfmFvlnrqHwcOIfZWwHxGfC78DyGKB60mOMEDwkRFNkBWDiGPzHBwASRXE+4iTb4EY
         LrsHiH7MKJ5V5g0qhNXXzdFIQw/CBJUiOLVAGikNe4zo7jh8RE0xuzz9///OThLBicu4
         iwbiZ7hPe3duOKcDMQkdkNyloSaluMz0e+0NCFPB8TQD9lDYYpNYBmkv1SYgU6klkojy
         FXLHLrup5W0fxC4cmMuh9ZCrpyiz+JFH2HPwc9GKJrEuNZSfWJSMuLoii9BIp3fjYzFU
         LTuA==
X-Gm-Message-State: AOJu0YzS3ytCSXJfBHZvLxDFytHqOUfgEzynV34scgrpkBRVduC60tLB
	oJDvjPn/K/V4pcT6+7Iv/7GKQWklxbjlr7s0ycWXt200nymAVBNPVs1mwJP+pJmb07Q=
X-Gm-Gg: ASbGncu2O36KoGIWDI06Vd0GX1xAuY2TzZmKhW35pcDzM+8W079vtu9DWzggLzOFng0
	wmCN3CoTTpoMG/XPerwwdAJKVqjTEwCdPZV+zqNJFIS0CNiJymFYnxEJNxL4yW8W6vkwiYZfZJj
	nVUB2UsM67LYg9PXN+M2npGwjB1kmTMPdvsf2owsnsk878xXFh/UQZ7Lcdja659Uygor9cwQA8O
	uoVAgAAu3kfinUYx4tU2yFU9X4nOdBeWiXzgZe3a0gS3EgYp8yRDgtwnqfuUKAOPDFXSxs58LOD
	wu3N5WEXqxTqxWhJ7G74K7+RY8J/Nyww3lUputwB2SbFVveiw/PkKHnxbtu+PfjdLHjtFBRNItg
	26AvSkqvJtK0x2odgGzBGPHq/h3EnMg==
X-Google-Smtp-Source: AGHT+IFHmFbjhmDs8JEJN8j6pzPYHRP0s5f+jZkbENRKCNk16g6eKwVvixfcndrmuMQxR0FYU+h/Iw==
X-Received: by 2002:a05:6512:2909:b0:550:ed9e:1b32 with SMTP id 2adb3069b0e04-550ed9e1fbfmr1194001e87.1.1747743573823;
        Tue, 20 May 2025 05:19:33 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f2fcb3sm2327121e87.86.2025.05.20.05.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 05:19:33 -0700 (PDT)
Message-ID: <748f96f7-d690-4823-845f-67642db97a06@linaro.org>
Date: Tue, 20 May 2025 15:19:25 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs615: Enable camss for
 qcs615-adp-air
Content-Language: ru-RU
To: Wenmeng Liu <quic_wenmliu@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, bryan.odonoghue@linaro.org, todor.too@gmail.com,
 rfoss@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250520-qcs615-adp-air-camss-v1-0-ac25ca137d34@quicinc.com>
 <20250520-qcs615-adp-air-camss-v1-2-ac25ca137d34@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250520-qcs615-adp-air-camss-v1-2-ac25ca137d34@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Wenmeng,

On 5/20/25 11:56, Wenmeng Liu wrote:
> This change enables camera driver for QCS615 ADP AIR board.

what is the rationale of enabling CAMSS on the board without giving any
description of any sensors connected to the SoC?

> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/qcs615-ride.dts | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index 2b5aa3c66867676bda59ff82b902b6e4974126f8..be8b829ec508d7de7a4cd6be6d1d4e83b09734bb 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -211,6 +211,13 @@ vreg_l17a: ldo17 {
>   	};
>   };
>   
> +&camss {
> +	vdda-phy-supply = <&vreg_l5a>;
> +	vdda-pll-supply = <&vreg_l12a>;
> +
> +	status = "ok";
> +};
> +

--
Best wishes,
Vladimir

