Return-Path: <linux-arm-msm+bounces-28552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C16E1952355
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 22:26:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82FC9281934
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 20:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 609CB1C3794;
	Wed, 14 Aug 2024 20:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/0296B2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A850139CE3;
	Wed, 14 Aug 2024 20:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723667159; cv=none; b=NcS5r8fI9NTst3/D4uN2KngDmgv3Q6M0zLEF99Qg6xwmIfFNozDSCX36AHISK6qe1dZi5Er3H3CoPkpDx6PG0kooQ2QdbVxaj7z2NZ2zD19iuqYD6pv5cPPknc5Yp3ZICL2YlCbvBO+zuN/L7j3LXawf9567iUe6WTJp39QYqKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723667159; c=relaxed/simple;
	bh=5THrZT91Dka8vE3WCfMHCQnwH9ElY7cqZ5CXLdQYm9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HNojS4oN5npURYpdzH6EWcyJwwXX3UC29dyuqOuDg00VkeW8KXnpr9W2xFO7M9+QA2uopE2EJK1Iq+6/hO8uubWA4S5EUKkGnyYXQMfCoAgcIyO77v7tJfPmo+g//2exmwnOP4jMyDm6MY7JX64GAxWylxk/4ijF43qs+dvyzwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/0296B2; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a7a9185e1c0so31989866b.1;
        Wed, 14 Aug 2024 13:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723667156; x=1724271956; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e+7imTotiuh7U0ostSpwsXZ2DttMOuddO+8MDxDc62k=;
        b=L/0296B2VWjpQcZwLzW33xfUyn1dv8oIBHaMFNs4yAc+iasvdGFBYR4A1Nj7mN40pC
         EANw0xhyCVcgQoI8T8wy/xe9E2gjv4J8oSlompFrdL186M+omhIFSVX8j73uSBeZ1i+d
         DDpXczm88dA+M4Jn4L60hA3mV4IIrhTBcw2ZQV9LYo/k6cr3mvLhoJPTE+WGsXNnh+Gf
         fTiqj/uUUlkC7KjvpEP/0NNLKlB2HBxYgnmDfphyCMABlHpX4ldgL2IYgtAJ6Kx6UVQh
         vq3zkefJNB3AsUpaoGQJoUogxY+CmwjubH+NTTJEPrlDo6OA4uv3drrhq2KgZA+MvjY2
         fSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723667156; x=1724271956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e+7imTotiuh7U0ostSpwsXZ2DttMOuddO+8MDxDc62k=;
        b=O1a7j41YRtxEqFAWFWmwd51gg84ZzWvQC1COaqhg8j1Vxbq5i/1gqeFQz04UAg1C3C
         zf7dc1r5Vz4XNdy0KssV6adyQijr2lLK8+0T7fTdl71PvyokRsIOxCpO616Ia5iRUaEz
         7PveLLoN98f1qyDr4NObTNHZQ94bqDFSFk8g8agQGNu1cb2p5fH0Y2sQxL/x8Tgk4mGh
         hEasDhjOQu5u5k4D1o0vDIaAhiNpIhLtTib45fTdvihiCvoGh6Mfl+6X27MItTuSCNy3
         2qyeW7LhKsxkDcyJrQ4pMAsqTnaj36YKWjJyjGIMAoxICtJ2oJPCIKsOTA8uZLvyE9CK
         iWTg==
X-Forwarded-Encrypted: i=1; AJvYcCUG6sE6LmT9JnbDf+A6QWcaTC++iKQNCOE4umnKMGKAuHg0agubqKeNvcOSIg7tUrlZDjOu4Zt/Vtnb+Ok1w5wOAFP8t8Yzd2pyYC2LB0egdePxmvB6xgBvr6YR+saQgkW4/osfS3H1G/di7jzD++F7rjzYYleWO3NnpJX5QCREOmYAv+Y1uLJirCph/0de4YhJp047D4FhrA7IbeeTWHNotMY=
X-Gm-Message-State: AOJu0YyE1IMwWp0lvRa9yDrmt9HWtUcSHVINNaS75GHXF2XraiMueW6y
	JBSoVejqXI7vNiCYnJoV1SJxy8E3MgWzkl47SGkOjM1jCFqsXX8w
X-Google-Smtp-Source: AGHT+IH+SZrWskCFaBKMcil9L0FX4p7V/d1rSz8qFi4Xab5CoLt/Ip1kZb8rju6bwMrlzWibwGzJAA==
X-Received: by 2002:a17:906:4fc7:b0:a7a:a5ae:11bd with SMTP id a640c23a62f3a-a83670723e6mr288279266b.67.1723667155199;
        Wed, 14 Aug 2024 13:25:55 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f3fa784fsm214857666b.61.2024.08.14.13.25.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 13:25:54 -0700 (PDT)
Message-ID: <0eca6755-a2ec-404f-b98c-ee6c9f6fb55f@gmail.com>
Date: Wed, 14 Aug 2024 22:25:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: soc: qcom: eud: Update compatible
 strings for eud
To: Melody Olvera <quic_molvera@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Trilok Soni <quic_tsoni@quicinc.com>,
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
 Elson Serrao <quic_eserrao@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20240807183205.803847-1-quic_molvera@quicinc.com>
 <20240807183205.803847-2-quic_molvera@quicinc.com>
 <dfb1ac84-f011-45ea-9fb1-b8c6bc36cabc@kernel.org>
 <46d0627d-877b-41f3-83f6-4c33b562f460@quicinc.com>
 <0ebb1ca3-722d-422f-9f71-fcc61c3470b0@kernel.org>
 <2b118a49-2229-4346-ab21-0aa5377d7a4e@kernel.org>
 <8bb412f8-4fe1-40ca-8414-bb77c66899ae@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <8bb412f8-4fe1-40ca-8414-bb77c66899ae@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.08.2024 7:33 PM, Melody Olvera wrote:
> 
> 
> On 8/14/2024 3:30 AM, Konrad Dybcio wrote:
>> On 14.08.2024 8:15 AM, Krzysztof Kozlowski wrote:
>>> On 13/08/2024 22:03, Melody Olvera wrote:
>>>>
>>>> On 8/8/2024 4:00 AM, Krzysztof Kozlowski wrote:
>>>>> On 07/08/2024 20:32, Melody Olvera wrote:
>>>>>> The EUD can more accurately be divided into two types; a secure type
>>>>>> which requires that certain registers be updated via scm call and a
>>>>>> nonsecure type which must access registers nonsecurely. Thus, change
>>>>>> the compatible strings to reflect secure and nonsecure eud usage.
>>>>>>
>>>>>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>>>>>> ---
>>>>>>    Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml | 6 +++---
>>>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>>>>>> index f2c5ec7e6437..476f92768610 100644
>>>>>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
>>>>>> @@ -17,8 +17,8 @@ properties:
>>>>>>      compatible:
>>>>>>        items:
>>>>>>          - enum:
>>>>>> -          - qcom,sc7280-eud
>>>>>> -      - const: qcom,eud
>>>>>> +          - qcom,secure-eud
>>>>>> +          - qcom,eud
>>>>> Commit msg did not explain me why DT bindings rules are avoided here and
>>>>> you drop existing SoC specific compatible.
>>>>>
>>>>> This really does not look like having any sense at all, I cannot come up
>>>>> with logic behind dropping existing users. You could deprecate it, but
>>>>> then why exactly this device should have exception from generic bindings
>>>>> rule?
>>>> Understood. I won't drop this compatible string. Is alright to add the
>>>> additional compatible as is?
>>> You always need SoC specific compatible.
>> Melody, is there any way to discover (that won't crash the board if we
>> guess wrong) whether secure accessors are needed?
>>
> 
> Unfortunately, no. We considered several options, but none guarantee that we will avoid
> a crash if we try non-securely. The secure call also won't give a specific error if it fails either
> (for security reasons) so we can't know if a secure access failed because it's supposed to be
> accessed non-securely or for another reason; hence this approach. If there's
> another way to achieve this functionality that might be better, I'm all ears.

Can we read some fuse values and decide based on that?

Konrad

