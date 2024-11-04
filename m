Return-Path: <linux-arm-msm+bounces-36887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1279BAE3E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 09:37:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE1B91F23076
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 08:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F77B18BC21;
	Mon,  4 Nov 2024 08:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jMaLcGfQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CA518B498
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 08:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730709413; cv=none; b=Bfzq6xI76Me3AUCVyE1kDEqlCIbmKf1KkBGlvKDiNbQfmPPD+FMQaXLG0mRUtuRKIIC6812opM5iOs55FxtAtCxRmnYuSBlZmND04sxWXTOpQVE/MBKoYF4UuQLQatg0Q8xBIc7crGAJENxpkfjz1/RpT6GdEUih4uwxGdF7cng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730709413; c=relaxed/simple;
	bh=8/FZMXIbfOaPkIGO7KqjyX886ZnwrqD7QAw4b3y66Ys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YX/otoKh2WrVRq3hI8R+BXfh8Ksv6IFv3T/FO71IqcsGyEIDFuUELBvhBieUGWkw0k7vTmWMAZl+Eqgp1ibXO8eS/DF8tljWaUVdqvaB+/LbHMJmiyx6A9za52+tATHPnC2Yk7ZbZL4wG2/t4VM3ZBpLkzSnlKMkARNiAHvVuMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jMaLcGfQ; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d5231f71cso411407f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 00:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730709410; x=1731314210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2BJ9N+6Y09zH0rsuoWY3PT3Lw99cvEyGl0F2//n2sek=;
        b=jMaLcGfQ/IYhWyQVXCLJ13GjzArmTBBXOZxmR3AvI8ztd2evTztJEgvC9kAmWpNBvU
         LniixKdvS8EqIdhoyH/03Mam1ISSDU3IjVDR0Vs96gmfmVxAM/PeKyBS1+BbQND4mQUF
         V2RZjeTU3MHB8MCDAobxW0hGG24AdeKVbilou+ZWU8HYUSl61hPZjj9OOZ6aqyeMRF5Z
         FFthyc+ajm1EEVifibXdTm4JspYRsz+I/hcrqofFwb9DEpXq+yVYdD5h3kJYExGH3UHy
         HRfxqIl/6v0SFdYyuF44Be2QQ/aOHPrXaxoXl6QTnfi8lfCgUnMECnlomsgq5YvQZ5Ef
         80+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730709410; x=1731314210;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2BJ9N+6Y09zH0rsuoWY3PT3Lw99cvEyGl0F2//n2sek=;
        b=fLa5M4VAFefFFATPFqMvLNzH1oZbgvZRjlkavXJz1xEiNocIvcInzPpLAluND+KOEN
         fQbtO5T8o6YoH9YG4KZ36P7lfBuPhPBj+Svx/xFWHm5roNH9E+bjaxwXxXBmBK6af8xr
         iVjnWocfDy2z9c0186iUuc53IrbRXXMBDjeSLY0rSPILcSbkw5B9YgjR7oodwHPxXwxN
         I3qS3wBkLwdRWH+FzIMbZqE5jyWbnXEShn1IxbNmeOjOF8okUNf2zWQqVaydzV9CAR9e
         lIgNhGhNaUVKrVNM8Jee7JEzSLwuy/+sQCNVCQS/bb/7Mfh02lzGb+d5qsQN2rl4rA76
         xQzg==
X-Gm-Message-State: AOJu0YwFuQ9hYuROpAzvKyqMoNx/S8EC4bOQ98MnnfYHYKtJfe8syo8H
	YVpQu5AUL8MJ5v4mIn2V/Xtjc8BZz8EcMIAsamQe68N4JoIdBxSbgREInJiYMhw=
X-Google-Smtp-Source: AGHT+IFfh5KyuqVW9z0nbbhiWu1FWVG1lOA8We1zz4p/P1Q93wWJDqAVTvp7srg+cRzPEm47ahgQ8A==
X-Received: by 2002:a5d:5f94:0:b0:374:bde8:3b46 with SMTP id ffacd0b85a97d-380611a7665mr11841208f8f.2.1730709409926;
        Mon, 04 Nov 2024 00:36:49 -0800 (PST)
Received: from [192.168.1.20] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7e1bsm12628672f8f.1.2024.11.04.00.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 00:36:49 -0800 (PST)
Message-ID: <649f43d5-2d75-45eb-b13c-31fe88d99c8f@linaro.org>
Date: Mon, 4 Nov 2024 09:36:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sm8750: Add IPCC, SMP2P, AOSS and
 ADSP
To: Melody Olvera <quic_molvera@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20241101-sm8750-audio-v1-0-730aec176459@linaro.org>
 <20241101-sm8750-audio-v1-1-730aec176459@linaro.org>
 <0782c956-361b-4109-a8a1-58b8ad396e0b@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <0782c956-361b-4109-a8a1-58b8ad396e0b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/11/2024 19:14, Melody Olvera wrote:
> 
> 
> On 11/1/2024 10:19 AM, Krzysztof Kozlowski wrote:
>> Add nodes for IPCC mailbox, SMP2P for ADSP, AOSS and the ADSP remoteproc
>> PAS loader (compatible with SM8550).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8750.dtsi | 140 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 140 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> index 98ab82caa007ee63c395a3ce0f517e2bbeb0aecb..eb826b154dcb2d8165426ba2225548efd7547da8 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> [...]
>>   
>> @@ -538,6 +566,17 @@ gcc: clock-controller@100000 {
>>   			#power-domain-cells = <1>;
>>   		};
>>   
>> +		ipcc: mailbox@406000 {
>> +			compatible = "qcom,sm8750-ipcc", "qcom,ipcc";
>> +			reg = <0 0x00406000 0 0x1000>;
> 
> nit: unsure, but should thse be 0x0?

No, all recent upstream DTSI files nodes use simplified 0, because it is
shorter. Maybe except few cases, but then these could be corrected instead.

Best regards,
Krzysztof


