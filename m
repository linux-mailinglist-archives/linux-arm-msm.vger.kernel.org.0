Return-Path: <linux-arm-msm+bounces-26832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC5F9396F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 01:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A8BA1F21DF8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 23:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EED36A342;
	Mon, 22 Jul 2024 23:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fXU4+Uhb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD3B4655D
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 23:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721690678; cv=none; b=u9XEuGMbWLLN3cW8lLJJwMFBGjwQJv979sposy5xzLCLAaiKg3s78oltjSYVtlF570xj8MVcGrEUEjPgXOeBlwA+pRkAuyi5BWbn/lyB6bL1zVhbneTGWjf+ELQSpCcsTKkn4T35yOf2hHLAzxDjPIZ8gREiC0y6Wy1EXs+7Lag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721690678; c=relaxed/simple;
	bh=65vcZfe+X2D7K66tGyX/6NXm8MnT7ujuN3Zk8dWVUm0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JOtiByjcfjsoYKTEtolbmj7RJtkAz6YVkEBqSOAZvUNuq87s37+ofbtKivIzoqqk1z9Obix3FJYCyseBxuIJaHbs1/xrhk3Oo3svBuCVUlND+F7Mirm2kNRf19yoXXkc7ceCqQmqvaltbnSV3kCGQUnFigUEuNAnFJIZp9+yfCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fXU4+Uhb; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5a167b9df7eso4787758a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 16:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721690674; x=1722295474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QHY7LVQ9VS89skGmYWWLZmlYO6sTp7t0lYuztXraa3g=;
        b=fXU4+UhbqEvYiB+FOnRLP4SpYvmfB2eHI3UW+k+XVMIIVJVKu8NeEiaFHEnLARwM7K
         POUFYJjMiEXHxDL6O4Bp15v5bGxatmjE2Tt/IJo8YiOoClBy7D4e/V2KWsIJNkw8UpCS
         5YcbgHpy8TC6eNur2mfAgBU4iG/8wyRbbTNXT96tqRsvTiSCaQNXoQcK4n+1YtUZViGI
         XSI3urBC/rVEg8+sk9uCOdj/MKirwnLQsAqFuSDsGH4yGDXCd9tq0rTBETkqcs7mPdFj
         BzSx5paEGY7NPNeixzvi+ag9u/G7f0dg2A26a7i4mXaJocs+wBHJrHqqrUMBBxaEj0J0
         ypIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721690674; x=1722295474;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QHY7LVQ9VS89skGmYWWLZmlYO6sTp7t0lYuztXraa3g=;
        b=DHxadlgz8ACdAJGkjMWXbG+kaYFRFMAzRROxPLgFSiudLc6Mw12JwDpzZ4ud5iRxAd
         vLVhq0V4iWGijdzXsgC/mwRFaCZJ3mhjChAosHL+bHEqhTGLKe0vlulvdZDssS/fCDLP
         rlqlce2dZi/5DMK/1F8ADZ2lchH5y15Dj+cY2it4sSBgMUdsTHjW2SG/ghbl6/VlIhlk
         bdAnNjy+Nv7kpWXSv/DBWUwr3z4Bl9oPN+zyQoBqI7WKpVlcHrhInNE3050NCROdmZcZ
         sq+yFYsQCK2T/XNmqeVFnd+AIOW02DN+FMwLpg5VmZIx8OjsG5JHCkPrOOa6pRM26jyP
         oHCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWM8NbEZcWDX1/7AQjrG5BX74PKXjFMs0AX+zFSariSwKYzo7HUQteK5JiYkl+WO1jOEaKZhjLBywgYSdP5NprJaa4uuUhjGeufGaXTg==
X-Gm-Message-State: AOJu0YyUetE7dG2VTIGPnpDWV2q7qr8RA7bQIMroCwBlrjHu5e87g+t5
	BfFTp4UVKwT8G3zvKWtzalSi7ySkvsCMif3q0Q8jU7+wGIRRQ5ReFA6diTnKzzE=
X-Google-Smtp-Source: AGHT+IGJw/vJIhVMaEzsx4J0r9DllfCdRb+baxSifLDV9YumAooFiZdEOLIUQN3F1JKYmCVBvO6Y0A==
X-Received: by 2002:a17:906:6a06:b0:a77:c3b5:9e5d with SMTP id a640c23a62f3a-a7a4c43a7d4mr588904666b.47.1721690673290;
        Mon, 22 Jul 2024 16:24:33 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a3c8bebd6sm471789266b.138.2024.07.22.16.24.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 16:24:33 -0700 (PDT)
Message-ID: <3a257754-2118-4a7f-9753-f1a2392f9279@linaro.org>
Date: Tue, 23 Jul 2024 01:24:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: msm8998-lenovo-miix-630: enable
 VolumeUp button
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240722-miix630-support-v1-0-a6483cfe8674@linaro.org>
 <20240722-miix630-support-v1-3-a6483cfe8674@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240722-miix630-support-v1-3-a6483cfe8674@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2024 1:57 PM, Dmitry Baryshkov wrote:
> Add gpio-keys device, responsible for a single button: Volume Up.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../boot/dts/qcom/msm8998-lenovo-miix-630.dts      | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
> index f585bc8ba2ce..bca309ac0cb8 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
> @@ -3,12 +3,27 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include "msm8998-clamshell.dtsi"
>  
>  / {
>  	model = "Lenovo Miix 630";
>  	compatible = "lenovo,miix-630", "qcom,msm8998";
>  	chassis-type = "convertible";
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		autorepeat;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vol_up_pin_a>;

property-n
property-names
	
> +
> +		key-vol-up {
> +			label = "Volume Up";
> +			linux,code = <KEY_VOLUMEUP>;
> +			gpios = <&pm8998_gpios 6 GPIO_ACTIVE_LOW>;

No debounce-interval?

Konrad

