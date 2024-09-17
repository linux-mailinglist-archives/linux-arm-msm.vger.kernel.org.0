Return-Path: <linux-arm-msm+bounces-31940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 060C197B5D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 00:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 725A81F21EEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 22:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A872F16630E;
	Tue, 17 Sep 2024 22:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qptWSB0R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D13135417
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2024 22:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726612830; cv=none; b=K7bU3A8L1LWdvZT2Mvt3w1/N7JYMMqldnAs6+iVPjJvunIhRozidiww5PWeb8SKMM5klRq5CNKN7jjuefiwHM7Ljbkh5DQpj3Aei4sD15xh39yhSeEy7auWSa2+e99VW7XlPYLi2oWcxbIN782IPk7FkMeNf8LrsqsptAv6dGWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726612830; c=relaxed/simple;
	bh=swxROHGBOQwTMcDCgjqL8DLK48S6IR6xf/yufIyqLkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dNJ8IPDSEt+Sf2oaxw76wbvCjeTPQAFQ/wvvebpLtzBUW56r7lQKdZM/AWTXTns1G0wpXNbCVe9qnHN+BCwBi7buRtOo22Ah31U85mZ0J5BHN9nBJyTe7kAAptq0J5yTnt+MX2syupxnMDmW2J/pvNEDoEncyAA+qr+J2Po49sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qptWSB0R; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a8ce5db8668so1056187266b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Sep 2024 15:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726612827; x=1727217627; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CjZpdfv4P2hHCjsU7XxJ4hyGhQ9pjUlUIY0HPHLeOyM=;
        b=qptWSB0RZg4DA9a3/WkJXoNv6PLloq34qNiwNhTlcyOD5vRjGiMW8qoPMDeDjrvYal
         ZU9Qx5UfCKcQm8bR8dB+b+992fQ9NDwhyA9/5fAgjN7IXVUr2sLcq8p57SvbacUtvkQF
         G6axkrTztrlNTrmLDdSElMFhu5kF39UaKDwKp/VBqjk9J0kO6UMCdRXMXvF8rc2TcFAG
         v70jW0c3BJYLQztidLlP4l1h0du+NqN35xQOoOlyXokGENIXsYxBwDU+dU6/ThK6GNob
         W/irvfUKYnEMqttEo2MBeM6QSDYMHrVTGzQv3E003FZHBI8umsQyK0HEN8zMKS2HliTD
         ZJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726612827; x=1727217627;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CjZpdfv4P2hHCjsU7XxJ4hyGhQ9pjUlUIY0HPHLeOyM=;
        b=IvUnNF1BmD1CDMslUf5ndI+Y5mE02xbqLJM90yEI3Ljm3Ry0sNOwI9YJKN7B+hmI67
         59pLT36ttanEpCc++SYuWoqXbfu0gqPrZIokOh9Tp68asASHB/+W3WUzTY5VcJTIqGl4
         KQobQGAK5FHf1OkixvrsubXaZAVdON51WgdIrCW7HIE8wYm2EOrSP2JiwX2LR5CLOplQ
         OMRxXGtKxyx42ytOEPm3Ek7pthSEVO3e6m6stfrCukizlrI+e/hF0sWjD5IoDQGClKuJ
         4YDSIIwNovmms/QEAnkqvaqR0oiEWcB4zWk2OtN9fielEOZfRZodbF7WvfFJjNFIN4pV
         5+Qw==
X-Gm-Message-State: AOJu0YzUb2aXBmFouDTMc8W/t+D0WzkIz+9rgi5cAKXDfeNgEn6AaMIE
	DVXx4p+nX3Y0rWs7s2iMKRMG1/aJiEEiCdtX3kyfhsV8wM48Kx/hJUh2SVuFcjA=
X-Google-Smtp-Source: AGHT+IEuuG5BzCGQ7pmXlfxdxtwrWJds6DmXr7d1iwy2Tum8R8ba0KsEaDFGlJgE3NUk3rVYWit7wQ==
X-Received: by 2002:a17:907:60d4:b0:a8a:794b:9891 with SMTP id a640c23a62f3a-a9029620387mr2219746866b.51.1726612827072;
        Tue, 17 Sep 2024 15:40:27 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b3eb6sm502564666b.105.2024.09.17.15.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2024 15:40:26 -0700 (PDT)
Message-ID: <4e94106d-5ca9-485b-8c51-c18dcd4e64b0@linaro.org>
Date: Tue, 17 Sep 2024 23:40:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] dt-bindings: media: camss: Add qcom,sm8550-camss
 binding
To: Vladimir Zapolskiy <vz@mleia.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, Yongsheng Li <quic_yon@quicinc.com>
References: <20240812144131.369378-1-quic_depengs@quicinc.com>
 <20240812144131.369378-8-quic_depengs@quicinc.com>
 <b1b4a866-fa64-4844-a49b-dfdcfca536df@linaro.org>
 <82dd61ab-83c0-4f9c-a2ee-e00473f4ff23@linaro.org>
 <da60cf71-13a4-465d-a0ee-ca2ad3775262@linaro.org>
 <97e4f888-1ed7-4d82-b972-3e0b95610198@linaro.org>
 <6eadc285-f413-4bf0-8795-59ff19c734da@linaro.org>
 <6562a958-47e9-4a49-b235-fe8deba3c051@linaro.org>
 <cab95caa-9ffb-446a-858b-342939e80811@mleia.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <cab95caa-9ffb-446a-858b-342939e80811@mleia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/09/2024 06:06, Vladimir Zapolskiy wrote:
> On 9/13/24 01:41, Bryan O'Donoghue wrote:
>> On 12/09/2024 21:57, Vladimir Zapolskiy wrote:
>>>> 3. Required not optional in the yaml
>>>>
>>>>       => You can't use the PHY without its regulators
>>>
>>> No, the supplies shall be optional, since it's absolutely possible to 
>>> have
>>> such a board, where supplies are merely not connected to the SoC.
>>
>> For any _used_ PHY both supplies are certainly required.
>>
>> That's what the yaml/dts check for this should achieve.
> 
> I believe it is technically possible by writing an enormously complex
> scheme, when all possible "port" cases and combinations are listed.
> 
> Do you see any simpler way? Do you insist that it is utterly needed?

I asked Krzysztof about this offline.

He said something like

Quote:
This is possible, but I think not between child nodes.
https://elixir.bootlin.com/linux/v6.11-rc7/source/Documentation/devicetree/bindings/example-schema.yaml#L194

You could require something in children, but not in parent node. For
children something around:
https://elixir.bootlin.com/linux/v6.4-rc7/source/Documentation/devicetree/bindings/net/qcom,ipa.yaml#L174

allOf:
   - if:
       required:
         - something-in-parent
     then:
       properties:
         child-node:
           required:
             - something-in-child

I will see if I can turn that into a workable proposal/patch.

---
bod

