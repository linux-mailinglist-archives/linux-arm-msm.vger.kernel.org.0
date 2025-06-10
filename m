Return-Path: <linux-arm-msm+bounces-60784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA08AD37AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 15:00:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93BA89E3555
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 12:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39576295D97;
	Tue, 10 Jun 2025 12:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bhm5/DLv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221CB2957C1
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 12:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559755; cv=none; b=jb1dKcL9drxsnO91G/WT3uIQ+oSHHgRQULApkNnIY7I7bGtnYm84Vs2MVdHcdepHTBJeOvudcHoyg07tOi1S6muazn8s55lZ+vaxyyHui8kZOwxlGiDrPWpxKuOaGV3pmQYcZivdbMaQMuClrXsu8K4MFKWEX9g8GSQmc4fpEbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559755; c=relaxed/simple;
	bh=8pGLEakmr5aQtq0MNQDWSHLHa7dbD9TZs7Ms+ip8HFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uCGu3QmqCzUF3jRkjJ4na6KBtpk28tH9jQ6FmX7QuxNZX+0VG2AtDYWzYPPJwHjg+TuyTqRQeV5+6eaaLpGvNBbHCP/D8lC0ta7WSAjcg5G1yqN1noN3yqiiEHBv6PY9XzbcXLSipDBO55gmF2spMspFQxZ8Bp58LcRQSgYGdYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bhm5/DLv; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55324e1a297so501288e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 05:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749559751; x=1750164551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SMSrvswUbazeYbvuGhFOqonwWDg71HMAispluXuK8zE=;
        b=Bhm5/DLvjaW7Lzd2TrS1xdXkF4QN/1Kj5tZuUxkAr48g7SwiTdS+236ISfos/7uzUT
         K4nsyz6XH2RXYlDoqvQazhA7kytzjNDRQWUZNOwC1mxcANVeCVs5MgeVvfTC4apAhgPP
         YLUgAT/K+IOeuhOBvq0Z18IlzfBZEt+Nxl+2yhpIYKYocs6ElD7plIjPKt10xZ8QREDY
         AZYafGM4N9tR6xRBZWDo9FtRYsrF4RU0kMfd+jF0ogJA14hEWYPj/kOssvG3G6BdWQ7q
         iEDa/qLT61X33uQb6BguiUlYh3zbkH6FGov0oxVd8HNdVnvYc7ljcJYJAoOPrPfz0QUY
         eQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559751; x=1750164551;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SMSrvswUbazeYbvuGhFOqonwWDg71HMAispluXuK8zE=;
        b=PFgrCtbRZavPPbEO7/u4m6Ckdhu6uU3AeRqcaJmgitiTDQlRciUpmRSWaEavfBvfzz
         xUibc1878nEHZDQDwLpHaAfNh5RR8ovRLmUHV7CTbT2F482AeTixIpFZypZNolgJ85IY
         sKUyqS04tFeAahmjAKygltN3d08jDP0ypL7wd3IhEHMgUeZd+YjWHxPFxrrO9gjVWd/R
         L1JDQUhB3FP/Wv6TPQan8XAux+3FePULmJC+HZ4lMdNtKCviyXFppbXeyTXGGvEJNZFp
         6305VssBHt/QsJcta7XrYYlBqhXWFZ0h0Ikhf+bgz4gBi3xDivvSqKGL2YVRSkwZ1ksd
         RN8Q==
X-Gm-Message-State: AOJu0YzcbItDLbT2tJ7bw6JqCenItHyyDkrIhAKHE0evkOcTSz8ENUqc
	JJRC4GIjcLPZFx4PWy/C9GCs7/582XbEiLRTKRwyhZ8sIpI4c/rtscO3msgJCaYA/Mw=
X-Gm-Gg: ASbGncvwu/vD6uStALxQKE4/oJxeCenOeuzjA7ceFKRTEa0r5FW9Sh97nQ6GdSbetsB
	QjnCIdoodl05EvQOJaimasszCzxXxxepY2s1BMkvssuRp8Ogn9wIUlj6z91Y+qNkgMWwe7cjwzH
	qG4KeTfBUqOWHTT6IBtL4/s56/82+PlWm3KAfe/sHdYVnZgHF3wtV6AUAdsVsgiuiDQuSbUoGUn
	1TUse0/ekGbC1pMVa6F8UADpKC5aHrnbBA+uGc5PDY48ACV0K9JfSG7D8BVCg0+eCf/hBukyunf
	3r3JR+qI50KTURgCI654EYE4HKC0oulJ5QrFt10h8kh8jkwpOc2HLWoqcGQSP7MYJcPSlwoe11g
	YzHY5iW+AGTDill60bqm7bmjY9KKszlXEMs4GrCaa
X-Google-Smtp-Source: AGHT+IHY1q8YmyvtVFQkg3FZFwHokHT/o2o35vML8BOoO8vhLwLta089+v0mypfDQ7uA7zZsqXirAw==
X-Received: by 2002:a05:651c:2107:b0:32a:85f9:5c0b with SMTP id 38308e7fff4ca-32ae3359b7bmr15305731fa.10.1749559751259;
        Tue, 10 Jun 2025 05:49:11 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b0d1e2sm14474271fa.19.2025.06.10.05.49.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 05:49:10 -0700 (PDT)
Message-ID: <739bad1b-f26d-44a6-9cc1-eee28023474f@linaro.org>
Date: Tue, 10 Jun 2025 15:49:09 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: qcom: sm8550: Add support for camss
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Wenmeng Liu <quic_wenmliu@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 quic_depengs@quicinc.com
References: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
 <0367d5bd-a42e-4b6c-b841-ba20190b3127@linaro.org>
 <dc4720a8-2f15-44aa-9a52-8440c7518328@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <dc4720a8-2f15-44aa-9a52-8440c7518328@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/10/25 12:50, Bryan O'Donoghue wrote:
> On 10/06/2025 10:48, Vladimir Zapolskiy wrote:
>> Hello Wenmeng.
>>
>> On 5/16/25 10:27, Wenmeng Liu wrote:
>>> Add support for the camera subsystem on the SM8550 Qualcomm SoC. This
>>> includes bringing up the CSIPHY, CSID, VFE/RDI interfaces.
>>>
>>> SM8550 provides
>>> - 3 x VFE, 3 RDI per VFE
>>> - 2 x VFE Lite, 4 RDI per VFE
>>> - 3 x CSID
>>> - 2 x CSID Lite
>>> - 8 x CSI PHY
>>>
>>> Co-developed-by: Depeng Shao <quic_depengs@quicinc.com>
>>> Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
>>> Signed-off-by: Wenmeng Liu <quic_wenmliu@quicinc.com>
>>> ---
>>>    arch/arm64/boot/dts/qcom/sm8550.dtsi | 210 +++++++++++++++++++++++++++
>>>    1 file changed, 210 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/
>>> dts/qcom/sm8550.dtsi
>>> index e9bb077aa9f0..722521496a2d 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>>> @@ -3326,6 +3326,216 @@ cci2_i2c1: i2c-bus@1 {
>>>                };
>>>            };
>>> +        isp: isp@acb7000 {
>>> +            compatible = "qcom,sm8550-camss";
>>> +
>>
>> This is the first time, when 'isp' label is used instead of 'camss', it
>> might
>> be I missed the context, is there any particular reason to do such a
>> change?
>>
>> If the label name is changed to the regular 'camss', then
>>
>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>
>> -- 
>> Best wishes,
>> Vladimir
> 
> List feedback from DT people is isp@ is the correct prefix.
> 

My bad, but I don't understand this comment, it seems irrelevant...

The expressed concern is about the novel label name.

--
Best wishes,
Vladimir

