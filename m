Return-Path: <linux-arm-msm+bounces-24470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A413791A812
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 15:40:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C84CC1C216C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 13:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0824D1946B3;
	Thu, 27 Jun 2024 13:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X5dkkpkb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B061946AA
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 13:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719495606; cv=none; b=kJy/oI9M1EfEUhB/RwEpA6uu+uhHinSvuYeLkYqDXf1A8e8uo4jVQfm4FAdv2DUif1LcODUwIFkxzTMaiI6jmxiRwNF43llWvDGYZdO5FvtN2zMjoPpI8/2GAZI7VfIJLRR8+I0VWvtKAZjWvUfwUzi7IIHT5vMRa2aIKSsxsDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719495606; c=relaxed/simple;
	bh=aGc8aFwRyyZj5ciH2IgK5k1zc3vRQs8wEk0o8RJm4uY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SRNs0ikz54x+d9nKb6arX2Sq59tr/ruITqyfZQJr2gg8HpynXA7a647j8RY2+NNaVwqzM8RvK4qsSovqHjI1Zw6KQdsSiMmNRw4e0M/c/OcwxME5s1CMxiXO5eTYhmaKvrWYUAWk4TsbLLcDMHjDzd5psfGWXuA+QOeKK7i8Cv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X5dkkpkb; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-57cc1c00b97so1744722a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 06:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719495603; x=1720100403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eyQnqPkrN/PCWoa6AOkfJ9CNY96pT7M4vjPSBgYrrI4=;
        b=X5dkkpkbp2GFgV+BtGyHBWMcxiXXxamFahzeg0909f1nFEH26iGzkz9eKzCn9uB5gl
         dSwUuzTXNE6n5MBFrJtlwfvDLq8gehJgCgrB3xsq/LrTzzYXm3MLD5Lkbi4g6SjjUkZ1
         chWse9hcqYMrfvKSh75Kz0KVc/Cygy8A41+ntVNei7UI1yhFR+uakOqNjdb+b4ySE7th
         kdjw6N+oF6pDbguffn+1eOHI5DTJE8HpAO3y2BRAVqVeixXCCU03guE+kh6tfnxkL6I1
         /Q/3/q9iQlKrfN7OF6rQYxXKDN4tfvsNw2+TWKAKu2+8uQW2k33LEF7qJbtAArRHPByk
         VloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719495603; x=1720100403;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyQnqPkrN/PCWoa6AOkfJ9CNY96pT7M4vjPSBgYrrI4=;
        b=GpALUBBsqllj81YIgrhtbFJC5/6NNTgRemSH79IwgyQ5t/0p0qDtYL5ggrzr7G3Oaw
         rJOa670/Z7pU05Mmku6ENeObO3QX4IbBS5TfZQMTgMmZ/CRBRFyDFFZ/cWKAEUAVhMry
         89CX7Bqko53N8Tm19OO3yKBdqcG26p36AgTGDVz2rGkgh1eKuI+EzfQope0rijuNMsGM
         +eonA6h2dw40B1e9dNOXPkF88zVJ0fozh+JG8gIdFFtdyZwZgkhPHeJhVZC8yRyw/DUA
         bXIahWzpRJFcedoiZNToZo0Ej+w/HsHnlp7EG9a6ndAAmW6c8T9lu/7tDLqzkRLQQJbQ
         x/0A==
X-Gm-Message-State: AOJu0Yx3+0RyISw23LFgk/3BxPaDZrZmZ2IfM5kI6i2WY5QOWtTVu7dq
	lb+tEsG5BmwWnQ+sXWbEiveWIYSmqUGPu/bqz13PnoOp1ehy8Sw6lzI+ahOF7Y8=
X-Google-Smtp-Source: AGHT+IFQohyU7wQtUze4hfJ87FjGhz8kuXwcq542ocg5SMq50ay+AdU0n/55RAAiAJFH68bxmEhoDA==
X-Received: by 2002:a50:bb06:0:b0:57d:38c:8102 with SMTP id 4fb4d7f45d1cf-57d4bd71020mr9427112a12.12.1719495603071;
        Thu, 27 Jun 2024 06:40:03 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-584d2c599d7sm878128a12.87.2024.06.27.06.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 06:40:02 -0700 (PDT)
Message-ID: <f5bc86aa-a027-4cfd-9fe4-18a7aed22b7d@linaro.org>
Date: Thu, 27 Jun 2024 15:40:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sm8650-hdk: add port mapping to
 speakers
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240627-topic-sm8650-upstream-was-port-mapping-v1-0-4700bcc2489a@linaro.org>
 <20240627-topic-sm8650-upstream-was-port-mapping-v1-1-4700bcc2489a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240627-topic-sm8650-upstream-was-port-mapping-v1-1-4700bcc2489a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.06.2024 2:57 PM, Neil Armstrong wrote:
> Add appropriate mappings of Soundwire ports of WSA8845 speaker
> to correctly map the Speaker ports to the WSA macro ports.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> index eb2f910b4f58..591e6ab9bf5b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
> @@ -1137,6 +1137,16 @@ north_spkr: speaker@0,0 {
>  		sound-name-prefix = "SpkrLeft";
>  		vdd-1p8-supply = <&vreg_l15b_1p8>;
>  		vdd-io-supply = <&vreg_l3c_1p2>;
> +
> +		/*
> +		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 1 (SPKR_L)
> +		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 2 (SPKR_L_COMP)
> +		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 3 (SPKR_L_BOOST)
> +		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7 (PBR)
> +		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 10 (SPKR_L_VI)
> +		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
> +		 */
> +		qcom,port-mapping = <1 2 3 7 10 13>;
>  	};
>  
>  	/* WSA8845, Speaker South */
> @@ -1150,6 +1160,16 @@ south_spkr: speaker@0,1 {
>  		sound-name-prefix = "SpkrRight";
>  		vdd-1p8-supply = <&vreg_l15b_1p8>;
>  		vdd-io-supply = <&vreg_l3c_1p2>;
> +
> +		/*
> +		 * WSA8845 Port 1 (DAC)     <=> SWR0 Port 4 (SPKR_R)
> +		 * WSA8845 Port 2 (COMP)    <=> SWR0 Port 5 (SPKR_R_COMP)
> +		 * WSA8845 Port 3 (BOOST)   <=> SWR0 Port 6 (SPKR_R_BOOST)
> +		 * WSA8845 Port 4 (PBR)     <=> SWR0 Port 7 (PBR)
> +		 * WSA8845 Port 5 (VISENSE) <=> SWR0 Port 11 (SPKR_R_VI)
> +		 * WSA8845 Port 6 (CPS)     <=> SWR0 Port 13 (CPS)
> +		 */
> +		qcom,port-mapping = <4 5 6 7 11 13>;

I'm assuming PBR and CPS being common is intentional

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

