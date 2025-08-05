Return-Path: <linux-arm-msm+bounces-67755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B380EB1B0CC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 11:16:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 640303BFDB9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 09:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 422AE25A2D8;
	Tue,  5 Aug 2025 09:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o2EIacLP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B01A25A347
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 09:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754385384; cv=none; b=CDWoHqItAPg6boIavU2ZezVvV9SC72ebQpeAUUYvknLutlOm2aOqUfWl/3cmbFerhFv8YXV+G3hTZZmZlKShIWoN6xExk3LW2b2hOyfgPNDFYQuX4DGW3cNEFmnDK1ZHN6prFv2HmvoTnlO6YEkD12ZUH14VZO411Cwpy19mMuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754385384; c=relaxed/simple;
	bh=K8e8kSu4ViuuLbZIA9BGUagkO+rSx9GESbp1kx7d7BE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jL3urNqtk1Vxk/u+XPAbz6gqicOtwmeicsTt0ZY8AFVy7O0YxWEwnSHhp0r0NS4R2Y905KkmMDUQunIsKLYKtA2eUj4WptOZdGwyt+4AIdXhBOrkEZJ6ZQgiLERVBPpjBizeY1AofBQlUjkANbCNyRJ4Tt2sgRdKN616kKqiJg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o2EIacLP; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae6f8d3bcd4so1083927466b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 02:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754385380; x=1754990180; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JDojcrGsiLvyGetSooakU+/Jy9s4z/uE44Ez2XuRs8U=;
        b=o2EIacLP0n7hzu9p52l8cQkrO1XSDKqbDvvVBf2ov21fJWQSLpx0HUNJt/1CSsGEew
         Q9pS1QRMDLV2ayR2p35GNAyFziytbH0U7jaYXe19e+wb68CaqQpiBEE8hqBSOsBHTlT+
         IWA8rTTmwXPeNISL5yoBd0dH/hwk/p9OdhdrCqnW0hQK6sLaO4Wqg7kn3lDA3orB1PAA
         nOHUTHWTjIq1U+aU8kF4ADUIn0IyyfPoKzPHePrTvIk8tdjLNjD3mniWe2kXnspx9xiJ
         jJ9Jg+oATz850Whzt8sU0wDfcOmGafT+BZPc/i/g1gkVgqgUGaXtr2yDLbAXOJoTAuft
         uIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754385380; x=1754990180;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JDojcrGsiLvyGetSooakU+/Jy9s4z/uE44Ez2XuRs8U=;
        b=a+EcIeGZhU1f0odyamRxL9G1MK4ULEQBfDrP6BGzLBMfsOi/NHM2Sm80bopEsUMV8z
         8FgyWEJT9FEkqVW6X0rcT5GzvLtmpHWQyXClXb05wYWZoFvrg+se3AxT6m4Z4b90EG/U
         OQSHXP5kb3FWMLAZyp+qsk5F9leXpa6GE1/4ABqxLTKg7ruI4KnvE4Rmo4bok+88F64m
         qBWvz2dkOi/mwQVMr5nzRiTWvm/IQrnEPM4NjaN1vWd/v7zSYpPzefiXf7kYS6R5lSZv
         sL2yZmg7Y2jDdqP/ARLrBaEJwkTDLme5arjDNpZiPrb4wrK+cnADTEwHKKf5MlJ/TmlK
         x5Gg==
X-Forwarded-Encrypted: i=1; AJvYcCU+tZC6cC3toOGFU0u5hyB5AAHh6BC8D7JehOnbWUKoVfhBfPYYFgknktPa6wRayXt8XPWbKIfRvSdrc1mb@vger.kernel.org
X-Gm-Message-State: AOJu0YxtAIhhZnZOJ0LoqyKlu5d/pZl9S+y8rYizECCFe47pQVojuluw
	U5yC8fanAD5tsVGcvhvLAFJPhhNljww7AoqPS5gPqm/b6bwyFFoXiBb/vlfUkxqY2Ou46R0q0Gu
	CoLykf6U=
X-Gm-Gg: ASbGncvg4NgCqEJp2urXIsXLcPV5zCooRIABBEqsN/S0rdAhx7fKniEMhP3Bw+mnlKu
	07vTlm2X5dk5D+qN9Q+HDypUE87mrwQWF+p6dDHguKdK7vf4mGvHwGWQb8wiGPdyR5m+pTFFt88
	HMzYnDbczr1rso1ZkOTN79X8Q4QjgaBxnuphBMQdCLAOZfnDY+9ccj5eh6o5nd15JRgPwFaeTDx
	ksespK+7ZReJfYRtjWwnubnbmNfNSZ2kyDYwgG5oGW8mOuChYafffcirC5AAzOYGyqm+agEYxW4
	ebQdhgo71E288hLk5c5wRuaAeCSVLhi/YykJFH4evpw26tKaGfFdGCIVNTySYqjw3Uaka50Ae+T
	8NXr9jD6B0AHiQ+QXviN2o+0/AseZ8S3Ht0uHJi3aWKyvRjEtkBiycENwM3Kr6Cg=
X-Google-Smtp-Source: AGHT+IGfiOEKnDNaalgfnB3KD7h0EQi2yCZ7mWgv3m5aedKUR5IN315UO5ztIdExPIF/cApsftfQog==
X-Received: by 2002:a17:907:7245:b0:ae0:d019:dac7 with SMTP id a640c23a62f3a-af9400665admr1165035866b.23.1754385380417;
        Tue, 05 Aug 2025 02:16:20 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a3cecsm867039566b.53.2025.08.05.02.16.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 02:16:20 -0700 (PDT)
Message-ID: <38c6b667-2f54-4927-8dbf-1d37b333a648@linaro.org>
Date: Tue, 5 Aug 2025 10:16:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/7] arm64: dts: qcom: qrb2210-rb1: Enable Venus
To: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
 quic_dikshita@quicinc.com, quic_vgarodia@quicinc.com,
 konradybcio@kernel.org, krzk+dt@kernel.org
Cc: mchehab@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-8-jorge.ramirez@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250805064430.782201-8-jorge.ramirez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/08/2025 07:44, Jorge Ramirez-Ortiz wrote:
> Enable Venus on the QRB2210 RB1 development board.
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> index b2e0fc5501c1..e92d0d6ad1b8 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> @@ -698,6 +698,10 @@ &usb_qmpphy_out {
>   	remote-endpoint = <&pm4125_ss_in>;
>   };
>   
> +&venus {
> +	status = "okay";
> +};
> +
>   &wifi {
>   	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
>   	vdd-1.8-xo-supply = <&pm4125_l13>;
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

