Return-Path: <linux-arm-msm+bounces-29953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CF99640CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:01:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96E7C1C22784
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 10:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4703218E026;
	Thu, 29 Aug 2024 10:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ALkcPi6i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4252718CBF9
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 10:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724925703; cv=none; b=TpdO5mSrPM0S5mqUDF30wOZVncd+bW5nCkbTy5ochL4Jofa+9jd54PUuyZ8bUtAPV/7LxLmAKFN9cp2LWTrZOutSBDCDXhygC4O86cgOiUOd3+dHAQR/G0PPsqmq+vpNwOTYSfR9TcKCx/kVYmnefb0T8Qb6+wG6+hyEjmLz2rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724925703; c=relaxed/simple;
	bh=QkJs4CrekP9zveKcRB8E5vMSHA3LUXNSKxF0D4rR54c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=eaAr5PySusk19UyHmna2LOLdvPSpoz/rQpK9hLXz3IvxvLIp08Q5VIWWpOe2FBWtGRTsooNHcEl51MKoctBUVNcUKvnqOTDeOzi63aWId2FS60GszoTQtKBoajO1Vcp/MP50OpacQAwOcJghqNYekafW5uMTKtLuV3kBrBURAvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ALkcPi6i; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a868831216cso52056866b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 03:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724925698; x=1725530498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fs/w7RGOKoomepefPnSh95RXx0WMdJK0RxeYg2QBR8I=;
        b=ALkcPi6iS284ReEG/KdFqgsz8bufWmYqO/IMdvW1sdD4DDjtAQUSGKpsDBpvbpCJCv
         LRhRQwuDQZVMVL2AktOeg5Vda11oZY8pDsZMoCxcgCzL3wf10gee3P2iD8tXf5/Pl/T3
         Q4qn4V4+7oCBrOX1JnP1ingQKA4RrSrxuFQZ6staeDNAT+uJLF8QT5CTW36GpwhAJyeM
         ns1BevueBbpolsmfUa+xYDMLPI7Cl4bmGoZAb2fAGROK7xGWF49N/kGMi2lxFO2N7TBu
         rwt4jOGnrYz+0mh80gXWwVddLMyQmfU+XNlt5+Hzdo+nq5wxI0LZESUlZYLgDlOQyKvQ
         wwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724925698; x=1725530498;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fs/w7RGOKoomepefPnSh95RXx0WMdJK0RxeYg2QBR8I=;
        b=M1p22DeS0mCps8Z42MIrCNpDObHratv4A0tMsfylBKMXlxEV2WN/VssaX+JRf3bmMN
         XMwPDMpovPuDHN9khAFTYvvQ3IZsZKy0KmL2Gk1sIGxdaFDhIPZRyQ+fXzSI6Y+8GPgS
         tioHIG0XV34S94KJs7YtXzK1ib+PSWdY2tC6aNr4b48+6XCBGvNpAHMLtAwplYKkQfUv
         Ljh/u0XVyXPCMnI2+6q3vMDnadpT72lt6jxcX2X58dFpKiqxRSZeNWDTPtlAoHYE8hN/
         6O/DHQm8hBmKcsrQ+VrmM0TNScG7d45X3MavbgcHzkDYoISwR358IXvu7oI1goFLAmPv
         XL1A==
X-Forwarded-Encrypted: i=1; AJvYcCWRF2XwLsbMcqLtWbWgy2FufFTb3a5XAYLL3X7h/ICQCqiHQjGh2WFQXCwllP+e0GA1yHn3IEkIHj4Kyrj6@vger.kernel.org
X-Gm-Message-State: AOJu0YyGEIH68zpUhvY+F5sJjvmZ63S87U7d7vd+1aEGbnD12vipFPe0
	eYbfgLUhvR0lpAoWBUCpOiXSSzePYkhAyjCJ8QjwWFEkSgqESWkMMRDF7DiY2Es=
X-Google-Smtp-Source: AGHT+IFiJjRLJqEBHrBxAeKhFuSOYhxbp+eWk1q/oUNun9oHTLDnVUAlE6tWzNqyPEolTRb6dSK1Pw==
X-Received: by 2002:a17:907:1c28:b0:a86:9058:c01b with SMTP id a640c23a62f3a-a897fad6fdemr162051766b.65.1724925698450;
        Thu, 29 Aug 2024 03:01:38 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988feb32asm57927366b.23.2024.08.29.03.01.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 03:01:38 -0700 (PDT)
Message-ID: <b2cfda34-f8e2-4db2-b4d4-9c707bfc8417@linaro.org>
Date: Thu, 29 Aug 2024 11:01:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] dt-bindindgs: i2c: qcom,i2c-geni: Document shared
 flag
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc: quic_vdadhani@quicinc.com
References: <20240829092418.2863659-1-quic_msavaliy@quicinc.com>
 <20240829092418.2863659-2-quic_msavaliy@quicinc.com>
 <9af7518c-45e5-44a2-bbb7-19ce7ed899c3@linaro.org>
Content-Language: en-US
In-Reply-To: <9af7518c-45e5-44a2-bbb7-19ce7ed899c3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/08/2024 10:58, Bryan O'Donoghue wrote:
> On 29/08/2024 10:24, Mukesh Kumar Savaliya wrote:
>> Adds qcom,shared-se flag usage. Use this when particular I2C serial
>> controller needs to be shared between two subsystems.
>>
>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>> ---
>>   Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml 
>> b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> index 9f66a3bb1f80..ae423127f736 100644
>> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
>> @@ -60,6 +60,10 @@ properties:
>>     power-domains:
>>       maxItems: 1
>> +  qcom,shared-se:
>> +    description: True if I2C needs to be shared between two or more 
>> subsystems.
>> +    type: boolean
>> +
>>     reg:
>>       maxItems: 1
> 
> SE = shared execution ?
> 
> ---
> bod
> 

Serial Engines

This is a good example of defining TLAs

commit eddac5af06546d2e7a0730e3dc02dde3dc91098a
Author: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
Date:   Fri Mar 30 11:08:17 2018 -0600

     soc: qcom: Add GENI based QUP Wrapper driver

     This driver manages the Generic Interface (GENI) firmware based
     Qualcomm Universal Peripheral (QUP) Wrapper. GENI based QUP is the
     next generation programmable module composed of multiple Serial
     Engines (SE)

...

