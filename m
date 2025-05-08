Return-Path: <linux-arm-msm+bounces-57240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFBAAAF824
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 12:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01843178B60
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 10:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1AD217BA5;
	Thu,  8 May 2025 10:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HYP3ht8/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E9D214A76
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 10:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746700638; cv=none; b=BjJrRQjGNBSPS1fMaIdOoCpF2j7KBl5Qy72WH/m78YFxNGvG/l3ITMSN4dOk/tY8OKHN3TFHCVdSn6b2Q7iSgjz3SF2vIMZGWHCbDCj4JckiBrtHmw1eyRDCRRRWskuP0HlD+aQMVZGHVTIicCKLs8/CjNoeHjgwvBzZ7NmhWBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746700638; c=relaxed/simple;
	bh=k61Wm8fICEDBJQkkSOr2DXiyI/ba/fX2/3gztAkXCZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K/pKDSUDUGPKBkym6WgDBjPIg4WmgjN0u8JJW4cnyEVCLgpQ3MgkPY7b9DYYrLPJT/+ZVEkuois+lWoU+hRhAczYFbFKpB02xCtuB+LfDdCzP6ExJZF7RxUtTThtbJXXCwf8CyANe3GQC3JRG7Y7uRUpmc5GmA/u+dTHu1YML4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HYP3ht8/; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a0b77ea855so125864f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 03:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746700635; x=1747305435; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EMe64DLuaUvItiJTh5N7eJuZ39Bu2jaMquPSmf78ahY=;
        b=HYP3ht8/5XDFUonI5yFbyGLd4az+CSueXHhTOF2ydpGOdU2yenbJ9Ln/mA/7Uf3aIn
         mSWkrBd4L0wVwnxnDBqSezKynTn02u1RIw891dwst6b6UBrzE7vFMKi6k94idnjE3smM
         gWvAuOLLDlvUqAfNF8FLs6yooTd+VtsIhAItHwVOQ0ffT6oC5QkFGUPcF2EYhnqONq2m
         7WWyv3GgzxhIdJkHsETccECEwzriX8Dq6JW3rgTGns9lmUiGmf4jxC27m7WiyOLDX8TL
         c5gjTWfsY3KZcT8YeGCDGIngqJCLJfK4RhjzLBT06YFOn+4/x3Z5Xp7Q/JsroJ0qyky8
         i1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746700635; x=1747305435;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EMe64DLuaUvItiJTh5N7eJuZ39Bu2jaMquPSmf78ahY=;
        b=oECIuqfm9NfgKzvCHDSwTO+LEea6IcZKcwu5uXzTdZ9uqw4kgEWW2MKq2vjNXSzOFn
         hA3rQ4WuUoFfWH3sjffHPJ1ZgQmd7VtrQ8IQnqpNXsvAberY72GuqwteFr7d46RqFHZu
         z80qLY9exTe2+GsYcfAtu2d06ZenxHRZtfhVNd9XpTKKjefIOmf2SD+lFPSTHhoGRUuR
         MAd60fmayEtwV69HpaOkSJgofvpgUQcIxt7b6CzFZrV1P/4sfIhN0wZ4TX3MwObAUOno
         aBbWW5mSH8AIM+QYDhkcb6rSemxmFxoHZTThQOc7SsOZHsk1xkY+N1I1OsQTPhRIKvPf
         Jr6Q==
X-Gm-Message-State: AOJu0Yysco1DKxGQRsKhQfCvpJGaDBUSBxX0E9oZLayd1IY0ncTT/lAe
	7bs5qGhW01Fs6wnmTE087a5C+KdF4392sA/JZ64Tbm5NUTWLLj+/EK7Dvp2lZfg=
X-Gm-Gg: ASbGnctegUEZK0OzQrSC6HOzElyguBNTi7Xx9R69S1ydrcKAZbl+7MKtarY5m2eRp1W
	ZdUJTVTXbwe8IFXQFqkLiiNfseVsLOR9eeQ425w0ZK7BVfYJu5OTz9wpKdvgQ1IwHii+/2mMvCN
	A1XPzBRo8kfUTw8V5MYykczRy5fkapr+jyvLE1ginTHTKEorSOTDaLY5/7jHXhra1ujh77XUiCd
	kim4q5phTsExDd+mO2riAl1IImlpvNJNkonFl8Am5No4ejWTyzjv4WMwheW6EvJPWM/NE/uG5aC
	gk3lLHvghRo6IdrE7aOdXif3f4e2Xb5esz32RLxsCWDtr5PIo0ig2BDNpQs=
X-Google-Smtp-Source: AGHT+IEmRNQLIu6YqEm6R0RqMgKIlZ6E5GBW/10pHPAdewCUEFyBQMiQkoUKVy6kElqpING9uXiYLw==
X-Received: by 2002:a5d:588b:0:b0:3a0:782e:9185 with SMTP id ffacd0b85a97d-3a0b49e9e45mr2266519f8f.2.1746700635034;
        Thu, 08 May 2025 03:37:15 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b840737bsm3175324f8f.67.2025.05.08.03.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 03:37:14 -0700 (PDT)
Message-ID: <afda790f-0b5e-4569-a92b-904df936df85@linaro.org>
Date: Thu, 8 May 2025 12:37:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8750: Add Soundwire nodes
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org>
 <20250424-sm8750-audio-part-2-v1-1-50133a0ec35f@linaro.org>
 <e83b58ea-0124-4619-82a5-35134dc0a935@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <e83b58ea-0124-4619-82a5-35134dc0a935@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/04/2025 11:24, Konrad Dybcio wrote:
> On 4/24/25 11:40 AM, Krzysztof Kozlowski wrote:
>> Add Soundwire controllers on SM8750, fully compatible with earlier
>> SM8650 generation.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 122 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 122 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> index 149d2ed17641a085d510f3a8eab5a96304787f0c..1e7aa25c675e76ce6aa571e04d7117b8c2ab25f8 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> @@ -2257,6 +2257,36 @@ lpass_wsa2macro: codec@6aa0000 {
>>  			#sound-dai-cells = <1>;
>>  		};
>>  
>> +		swr3: soundwire@6ab0000 {
>> +			compatible = "qcom,soundwire-v2.0.0";
> 
> They're v2.1.0, same on 8650, there's a number of new registers

Sorry, but no. This the "generic" compatible and it is correct. Devices
expose versions, which is perfectly usable, thus changing compatible to
different one is not useful. We could go with soc specific compatibles
and new generic one, but what would that solve? This one is generic
enough - the device is compatible with v2.0.


> 
> [...]
> 
> 
>> +		swr2: soundwire@7630000 {
>> +			compatible = "qcom,soundwire-v2.0.0";
>> +			reg = <0 0x07630000 0 0x10000>;
>> +			interrupts = <GIC_SPI 761 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 785 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "core", "wakeup";
>> +			clocks = <&lpass_txmacro>;
>> +			clock-names = "iface";
>> +			label = "TX";
>> +
>> +			pinctrl-0 = <&tx_swr_active>;
>> +			pinctrl-names = "default";
>> +
>> +			qcom,din-ports = <4>;
>> +			qcom,dout-ports = <0>;
> 
> There's 1 OUT port on this instance
> 
> otherwise (modulo the settings I don't have a reference for)

Omitted on purpose, no port configuration available.


Best regards,
Krzysztof

