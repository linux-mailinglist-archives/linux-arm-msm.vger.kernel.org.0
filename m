Return-Path: <linux-arm-msm+bounces-56243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B1FAA49AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 13:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 530673B42D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 11:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07280248F41;
	Wed, 30 Apr 2025 11:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E+04w3u9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA575201017
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 11:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746011924; cv=none; b=TPLrODzacDa4Gr1Xsl4mnzPFGA4MOdSku7ATkP7ogCK1hzqM1cRu/XaNaQGmBn0/DmMBWMVIm7pczuRvhnhlY9HawthZh9+TFCQ/ZzbZtGC+tTzPpdGJL2SiI6Fnr3UPddfVZp3THYH0B1TN8IczyfWGntlxj+jVZjJPiCBXF7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746011924; c=relaxed/simple;
	bh=qHVzRzYAX/G0uh2vhOZ3aWaU/ZOWTDKyqUKeO1jnO5c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ihvXeJCStbnSApN7/qzcGq7dPJFLTxZtzIWPVkPfvU7VIWwh+/GRGTCV7emVDFO/pokWT8u6IZHvu5ScTtUFnwlh64kRbSSShcwMRKO3DEUCVqD54PvRepbWXzo/gqiX+Wb68Q3/OI9BWOX01e0zPm6oAY4TLx1fR3W6tZL+OcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E+04w3u9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-440668acbf3so9620715e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Apr 2025 04:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746011921; x=1746616721; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XeqJL94ThFHVPWwTL6Id1PoIB6EHm0lFkz8p7+A1PcI=;
        b=E+04w3u94AfDVehvRgQnaVZhXEjysF4OtMh0i0VFNLZlHvil0oM9tAbuBbIXWQ5yDh
         rHLtCjce6Cr7XDOjUWCQhhv5agbBD9BfQWOC6yn32XKvDWD3qUMgS/uIAvnpNMWLkuCO
         mTz8vKngnhpJqQxBYOFEJSgGVoJLUehqsKzgniZ1g0WqOEeICvS6EGuI0s8CDqR6abJJ
         mEwh3S6KdmmbW6OKmO/Ol8gikVPZ6WcYlHZwvItri401dA8XmYAzy/ZbfRLyieEPmrLQ
         44Cm9s1Ei23pEeOBKmMqQBM5+jdwMQWlGyw8/rOo04uF4XoieR4SRrCZDUIY+xn0ddJo
         q46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746011921; x=1746616721;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XeqJL94ThFHVPWwTL6Id1PoIB6EHm0lFkz8p7+A1PcI=;
        b=kqULPheKc1EsQdabDOoUCsiTCQ+ffO6k2459aQ0xbDKDBpYBAcwnP6vcRKXTqlohsf
         TBEq4MC3ILD7kEWoWX5kk6VZaxztyvdRop6yJcG9qy9C97XC61XqlPa8QzbSe/6S3tF7
         tBSEYFbLzEY25OlXVIGGZ3oJXrmoVTOkjHTPOlLJYXcbqpUZWMCBmZhfk/Pul68xo0h+
         zDxrAuk46OL7c9tf9oILesQwnsIQhU7WGlY/dPpHUxi0HThWoAkjHI80km1oF2O1cuO0
         snMMqDR3w75RXi0R3h+SD9IwSi0U1HmxcHieGDeIDa7QkJGFDLQzUJ6s4VCek2E/2OJY
         NpFA==
X-Gm-Message-State: AOJu0Yx59BznT0ofXq3C0JfXfW67d28xTB/wy9BaAS8pF/WhO0++tsi8
	J3+yuQLMyM8P5bDO4nIcwfTb1T2U4J2Ka+hTID3vPbShG0PpSyMLzzLn7TnYbp0=
X-Gm-Gg: ASbGncvqcOQeEqH+48+PypIOgjtygAkoG53fU4fWumg25eNwKfOG/roQk96oMtSnIak
	jUcJAWTgiwVQZQlQngvqQKGk9gxgnI05hdioMl6ZhjzMt0LBtafs19+Lam1TKA7Wv9HwS1aHrqs
	ldbdoPixg55+lZcDROzQPj+VT5L5dgZTUPb6vyT9ac897ScVYhy7TJSPKorm+gDP1SL/hizR0zO
	xhkQkBNK2pY5gUNx5Za55g9wz7v+TWLhfxieofaj17egUJtVPWMcwldnDHRNjgsz/fGZS3jIBMq
	Ew27HRgEUWXFX4UZH3iMspNW99UCd+cTJefOe2rPACkkLj9M/KanZhu1XIf+EsbyKzf9zw==
X-Google-Smtp-Source: AGHT+IGMVVqPePXkKCXFynpGT4g2L/ibpr2Dk9WAM/NQR5SfHVcdCwSDcn2Ib1PLbSP35M6anFFqzA==
X-Received: by 2002:a05:600c:4691:b0:43d:fa5d:2675 with SMTP id 5b1f17b1804b1-441b2dfbaa0mr5646845e9.9.1746011921207;
        Wed, 30 Apr 2025 04:18:41 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ba4b1fsm21178325e9.15.2025.04.30.04.18.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 04:18:40 -0700 (PDT)
Message-ID: <07354130-999d-4f8d-9deb-49b72d8e4577@linaro.org>
Date: Wed, 30 Apr 2025 13:18:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8750-mtp: Add sound (speakers,
 headset codec, dmics)
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org>
 <20250424-sm8750-audio-part-2-v1-2-50133a0ec35f@linaro.org>
 <dd271e8c-e430-4e6d-88ca-95eabe61ce94@oss.qualcomm.com>
 <e61e17ca-fed7-4712-96fc-a9a2339de1fb@linaro.org>
 <9b6c5f67-0bbc-490f-9982-4e28218aa6eb@oss.qualcomm.com>
 <0e007f7f-d9ff-4b2d-914d-ad62b9983bba@linaro.org>
 <3a29e34c-d286-4673-adac-1fd8627c3eff@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <3a29e34c-d286-4673-adac-1fd8627c3eff@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/04/2025 12:48, Konrad Dybcio wrote:
>>>>>> +		/*
>>>>>> +		 * WCD9395 RX Port 1 (HPH_L/R)      <=> SWR1 Port 1 (HPH_L/R)
>>>>>> +		 * WCD9395 RX Port 2 (CLSH)         <=> SWR1 Port 2 (CLSH)
>>>>>> +		 * WCD9395 RX Port 3 (COMP_L/R)     <=> SWR1 Port 3 (COMP_L/R)
>>>>>> +		 * WCD9395 RX Port 4 (LO)           <=> SWR1 Port 4 (LO)
>>>>>> +		 * WCD9395 RX Port 5 (DSD_L/R)      <=> SWR1 Port 5 (DSD_L/R)
>>>>>> +		 * WCD9395 RX Port 6 (HIFI_PCM_L/R) <=> SWR1 Port 9 (HIFI_PCM_L/R)
>>>>>> +		 */
>>>>>> +		qcom,rx-port-mapping = <1 2 3 4 5 9>;
>>>>>
>>>>> Does this deserve some dt-bindings constants?
>>>>
>>>> No, because these are hardware details/constants. Drivers do not use them.
>>>
>>> I'd argue it makes sense here - it makes more sense to pass meaningfully
>>> named constants to the driver, rather than blobs with a comment
>>
>> Sense of what? You want to make it a binding then answer what does it
>> bind, what part of ABI for driver is here a binding (answer none:
>> because driver does not use it)?
> 
> Sense of the magic numbers that otherwise require a comment.
> 
> dt-bindings don't exclusively contain enums-turned-defines that are

No, they don't.


Best regards,
Krzysztof

