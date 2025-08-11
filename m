Return-Path: <linux-arm-msm+bounces-68383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6288B20C66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 16:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB6D4621983
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 14:41:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7F4253B42;
	Mon, 11 Aug 2025 14:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ROPE4Lmu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C757E255E27
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 14:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754923214; cv=none; b=LxlKknamIXU0BmS+j4lm0+pgqLHLZ8+UkrjC+TtBaiEFIqxftgY6bdfILvv+IEzmMaFaGqo1gnwQGgUp+oVGdstT74WvXZ4rNL/YegbhG0E0d6D5xLU1SuGx4onDf8dhNw3pBU7te1zkDVvem6SLvDIfxARQwjE3eroUqpr4o30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754923214; c=relaxed/simple;
	bh=XJWd5IdN79RA8pQqXQglHEIm6gL7Et7/eo5qs/8ouT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q+IOONB1nP8zpc1astaJbrS8xf4JVPRFNLuv15t47aI7Z1hKPoa0my38la3wnUWhMRvoC0K7uKCs+X2JVjyXGeD87/tjl/EOhcfXw6HB8wX1GcNnI0zYvsGfd85Pc8ZRoxX8pceuBQ6h4CYUUme2Ic4COpBPdzsxcASLJ9BrY/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ROPE4Lmu; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-61539f6815fso701968a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 07:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754923211; x=1755528011; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wPGM/XAicP9eB6er4DkfkNkeKtu4+BWcAaTp0rZb5YA=;
        b=ROPE4Lmuv/2zEXEWhCc74bXmp27GiqaJ2faZjBylNvOsSkiIF/Chcxx+bm/y0mU/9L
         CzOV07vWVAFoDWbQovR2LIiI1V5NSMbGj3bpnbnwq7G/A5QU65C57RCBpGMEYjPFz9fL
         uwpvcCDedDQjemGHqRqq65j6CG9v0I0OSjlQ30dbei4UWgapJYyU6PlQupNMQX/Qaq+a
         fYsLxB0eY6VbLeIo7gEoFmuUupw5vq6ds1D5i2Xb0bJJS+QZhZOa4XnUPeMVcyCsJRSv
         TnzGKUFMP4SQIb6ll718tbchLkHA9FryrlU8ztB0D9NYu4No9d/CG5M+EC0H40bpifbr
         WheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754923211; x=1755528011;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPGM/XAicP9eB6er4DkfkNkeKtu4+BWcAaTp0rZb5YA=;
        b=pzVnjPrn0EP3gLNrz8TNQbihFAsXBS351dt8xFgiRBrUFF+mV86gy5EuXyzMhjU6hg
         cXnicpo8IGUfedSQlnuPMST8VgBOLd1/MKNUt3fukJPylK/eskg3Tc9yaVFxhE0NCRzk
         0V7c7dUPaQF7AeO88T58j5uGDltUypbHm9fEUz5b6d7cSgSvLtIT8ZfbvY4xQFDOsJ7o
         A/NvHaoqdRaRYiP30uTKpU4Pb5rXJoA9PccjUmn4kvx5visKsh7CEaeKOYjtSCQyPMXe
         rdqX2NsbSkQ1pvrYCtIB6izK0wSk+1my+0pHrG6zLWb2ktGss77ApfQmWT7+injgtaMq
         HNUw==
X-Forwarded-Encrypted: i=1; AJvYcCUWoPhQPATCYsyTTs0ZdpXuyFEym70Sm6NjilhYHy6EZS0OVWEWEP+1dWmkSLBTQVCEmBNeKL2rYAn/q0c2@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+RuNu5BYsed8yfXJhHW0wd1jpV0+HUFjbLOSMObi5AW76UStJ
	cDknSglEAG6nJVsilLpVrtldNGaaZA4JieMqvvG5Fdt7efNHIjOUc1Q9lOuyJT15lwo=
X-Gm-Gg: ASbGncubapgAaVZ67/HCaF1T1fP+ZDFww7epP31+SQmAvXWj36riBWIHdqJMu4HaA+6
	dmP7UKnTHxq5srP6/oMEaQ4i1FGG1DmRGBBCzLeXr1YbiUoMZWKUaBOnmLLg+Of3h79sWalmwS8
	+5npmxnwWOkJENCV8uQcBBDW/LCXhS02AWmd7Fs4yraD+N1W1YgZWxwC1deBUqXQ31bbVSDsIa1
	E+bkQsi+UtSz5tRpMGxQvHjj6jSp/tfvVsyH3k7Cd7++jKFuIfJoCXXZUn1t22m98NiEJhpsBNh
	AN7WXsNVLYlqirzWbWPiwtWBfKF7qmja7fCm9A8jb37QUWGpzNStXl0JC6hFPDQtPDp7GIALnxG
	2Yo271ElpIEFL/HiIxiLjRohtwrret35sN4BtXcXeeDZXSrlToMUKsg==
X-Google-Smtp-Source: AGHT+IF4KkrG81LtPOKJMZYG+jvMiuaFlo4iH6Gm6PzXokd0bzNuWYmLerp9cwa8UeFhQmYblLXdUQ==
X-Received: by 2002:a17:907:d8b:b0:ad8:8200:ecf7 with SMTP id a640c23a62f3a-af9e1b5eceemr328286266b.4.1754923211153;
        Mon, 11 Aug 2025 07:40:11 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a23bedcsm2034775066b.120.2025.08.11.07.40.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 07:40:10 -0700 (PDT)
Message-ID: <f7704cc1-95b4-4860-86ea-96ec18f61c8a@linaro.org>
Date: Mon, 11 Aug 2025 16:40:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] arm64: dts: qcom: sm8750-mtp: Add WiFi and
 Bluetooth
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250811131055.154233-2-krzysztof.kozlowski@linaro.org>
 <l6u4y3suv3dpylexbiiznhcuyanlc4ouizhzj2cchblaf6o4wg@fe4laxrioaj5>
 <481985cb-fa84-4b09-9b95-948ee70b557a@linaro.org>
 <k7mw7rj7cno3con2t57nps23y7evd3da6gahyl5gnrxss7e3s4@qncnuekxr7lb>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <k7mw7rj7cno3con2t57nps23y7evd3da6gahyl5gnrxss7e3s4@qncnuekxr7lb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/08/2025 16:33, Dmitry Baryshkov wrote:
> On Mon, Aug 11, 2025 at 04:25:47PM +0200, Krzysztof Kozlowski wrote:
>> On 11/08/2025 16:22, Dmitry Baryshkov wrote:
>>> On Mon, Aug 11, 2025 at 03:10:56PM +0200, Krzysztof Kozlowski wrote:
>>>> MTP8750 rev 2.0 (power grid v8) boards come as two different variants
>>>> with different WiFi chips: WCN7850 and WCN786x.  WCN7850 is already
>>>> supported by the kernel, but WCN786x is not.  Both of the board variants
>>>> are considered newest revisions and the difference is only in MCN
>>>> numbers and internal codenames.
>>>
>>> Are they soldered on board, installed via add-on cards or installed via
>>> M.2 slot?
>>
>> This is MTP, so same answer as other MTPs - these are replaceable parts,
>> just like you can replace display or modem.
>>
>>>
>>> Are they going to be somewhat compatible (e.g. on the BT side?)
>>
>> No clue, you need to ask Qualcomm people - it's their hardware.
> 
> And you (hopefully) have access to the docs.


No, fought with that for 1 year, got some basic docs only. It is very
difficult to get any access to these docs. I assume you mean the MTP board.

If you mean Bluetooth or WiFi - I have 0 access there.

Best regards,
Krzysztof

