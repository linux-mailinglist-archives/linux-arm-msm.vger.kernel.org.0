Return-Path: <linux-arm-msm+bounces-77462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72088BE0526
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 21:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3596D427BF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 19:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F12302CCD;
	Wed, 15 Oct 2025 19:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pJG/aXgq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A011283686
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 19:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760555547; cv=none; b=EjvmNl8Cy/WtGCpntHZGN9kX8FQV1bDuzfoYuHYAU0TvuUqaC+5vl3WUGPl5tY3gnegIjoi9248jzyYsbARb7BF5mzMIIcWy6Smv+sYbNkf9diOJX1qjNWguFXcNKWc5rhcC2R6AQsIucLq/g3kmDOGDNXwRZGrH4ZUhcCM0TT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760555547; c=relaxed/simple;
	bh=4QK2T6kGZyFylzPYSzPxH+9bXfmmQQta6fIUzxi82kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DpS/+ccwCMswY9/SxsOUuaJ6NQ+62QpsBzmlOueR37tRtsPlJSsk/TddoRZms4xM4i9aMcWqwFr3KRIEoc5aLELAsG/o2wJdbK49ar4lgql0OgWNA7ahZp8EpVnfHslU20YsKt7QS6jdC9EABM6tU5CpZ1MP3f523/hmPxmLjaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pJG/aXgq; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e6a689bd0so52332945e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 12:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760555544; x=1761160344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zX0FQJMNOkesxTSiczvMscK9aHeUEgUhQXWADwrmqhs=;
        b=pJG/aXgqTPZ6GB70+XnOb3h9OZZnIcsS0otLdSaGUVnkmYKNx3qz8fuMEtTm+nec2i
         356bG56xys9klBWxh+4vX/HXlMhSQesz0UeFhRVLfCd86ms8XizN40N8lANcmaQ5cggX
         PWVdsrcL85RtAIW15UT+Xw+fE+JssJhyDjAMydB5o2wcIA8XIeVg8fEhCTYQTG/DmYoU
         RMWyfK43dGV5ApmMTKCg5zZg2q1RR1rjVZG2FMJ1DziiKwmRvEmr4BCFvCEeR1jJ56uq
         GrBOfA0e+EJg+3VQSbQYmQq74bOpbyYcSeh/3e6KTt/KyaEnkEHj5RjdpV4m4F0Pjcqt
         Euvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760555544; x=1761160344;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zX0FQJMNOkesxTSiczvMscK9aHeUEgUhQXWADwrmqhs=;
        b=t6Vw0XqGCPGy0tKY5wYWFfxBsJYzqCEPNp0e3qqxxFWF9nD07BqOoZo3z9xS/DhZcg
         WtcNL+UIs0W2gha7U6lY9koXEil5qKlcxJJYL53tM6LAUoaOSb6OXMDpDk5QQQTd8PHO
         rZB8WuczE5hhshPYBNtYd0qF7VclSnd9eEZ58N7n9lOU6tkJZeEPiCPx9v25jBpRsqAd
         agYMAVl/AWcLRYfOffdSlxIHVDZj7sGSEk5pFBUO9fsMNEOWYoJdvQRlOrnnMlUnhAXA
         vKxILMOQFXRZJEyU5hneFiCbCMPc4IrRr0Anxo28Y4q8AGpxr+Dj9rIeevXFndKAFhAb
         zmGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZIshSXO6KgM4g/V6r7LQuwthvomEP5Jri7LOU2eAyzRaXV+hba1Gj26oVWYNOTUFY53CBoQHVdP9kJg7l@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4TrNBXA3/NpqKC0/bTGCDS33XBKwqjwBI2yyIeCtncJi4GhyV
	rtK8DOkPdBA951HGwxUwI/ddm0WEU2AROC6HBOgLrme42hpCvNeQ8RlO149nraGgfA0=
X-Gm-Gg: ASbGncu+6s35MEmnVG2C07QnaSfdCSZ5TJ3xzKkjrSElohorUzc5sDkd6fEOnOiZjR4
	H0l9RqTzdHxEFPdULLprU/UNmzHI9Az/64ldgDraWq+/QOdSen2zM3WrDKkNRyXrv7vxHZf0DKy
	HDMtvSg8J/stthc/4cOALR2eF68N/qkoO0xn3BCzflcoo9yZse+4WVgB5qdVMXYdjcT7zHu7iiS
	MzX0nauFWk6ZJg5P9jPNP8mB097BBul9bpBxao3sRPNMQMC9k1dgWpivuzGMZ6Xg1ke8+sm/cua
	OW2mGEuE6EjZa97vwKTsDNfiFqO6DxSEENUzpW1ctVTfNFv5CgUszgC+3T49LArJLhqK8Kasz7B
	ZF1ScVdg4gr7NmjWNHY1xrNrf+vEKlzq8SUQ/oAQ4RfHayGh/lRqe/AU+tTVZB1cXvVScyVdYqh
	XRr2JPSsKPi8/3Fv1AfkNnGA==
X-Google-Smtp-Source: AGHT+IHbd0cW44W3/gflLhZW99H6UzVn2a320v+osYcGxzgftCt49JmvdlRHRiYyZeC4FCtJAzNpwA==
X-Received: by 2002:a05:600c:6383:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-46fa9a8b48dmr229438345e9.6.1760555543790;
        Wed, 15 Oct 2025 12:12:23 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d49bsm32016093f8f.10.2025.10.15.12.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 12:12:23 -0700 (PDT)
Message-ID: <15b35191-eaff-4971-bae5-2d5a8cb9f864@linaro.org>
Date: Wed, 15 Oct 2025 20:12:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: media: qcom,qcs8300-camss: Add
 missing power supplies
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
References: <20251015130130.2790829-1-quic_vikramsa@quicinc.com>
 <20251015130130.2790829-2-quic_vikramsa@quicinc.com>
 <bfa0d4f2-45c6-463e-8afc-d90edcf8cf2f@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <bfa0d4f2-45c6-463e-8afc-d90edcf8cf2f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/10/2025 19:41, Vladimir Zapolskiy wrote:
> On 10/15/25 16:01, Vikram Sharma wrote:
>> Add support for vdda-phy-supply and vdda-pll-supply in the QCS8300
>> CAMSS binding to reflect camera sensor hardware requirements.
> 
> What are "camera sensor hardware requirements"? You do add properties
> to the ISP.
> 
>>
>> Co-developed-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>> ---
>>   .../bindings/media/qcom,qcs8300-camss.yaml          | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcs8300- 
>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs8300- 
>> camss.yaml
>> index 80a4540a22dc..dce0a1fcb10c 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
>> @@ -120,6 +120,14 @@ properties:
>>       items:
>>         - const: top
>> +  vdda-phy-supply:
>> +    description:
>> +      Phandle to a regulator supply to PHY core block.
> 
> What is "PHY core block" here?

I mean come on, I think the meaning is clear.

>> +
>> +  vdda-pll-supply:
>> +    description:
>> +      Phandle to 1.8V regulator supply to PHY refclk pll block.
> 
> This is a copy-paste example of a known to be wrong pattern.

You're right about the name, please align with this commit

git show cba308979b012664c7fe7c5baa818fcb68e86363

Thanks for spotting.

---
bod

