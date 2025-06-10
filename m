Return-Path: <linux-arm-msm+bounces-60879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 357CAAD4492
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 23:13:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95A52189CBB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 21:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E380274658;
	Tue, 10 Jun 2025 21:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KwXFrcy4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B402641EA
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 21:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749589994; cv=none; b=tCoUyPGrM88UMgil0Faw6zSxoWNDajsrkx/XeiZB+FJH4BYcZ5KYjUpEO89O4DsBCanDtG5KTEFZa0zZfj2P8yYIZmMdl46jJakY7VtqV/GgcgpLpsfsfPyJaxESr5eSTVEPs6IM1fZA49fnSHELdPKvWC3L3ctsC5bbnbmkIoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749589994; c=relaxed/simple;
	bh=LKWM/AKNK8qV65zQK7Jy6+2LGnIoiSxOh8JQeCjGVoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d18S6l4DHTD4FnV8H1Uk/UkXSCt5MfL0l5ChiCatSQLR6iC5hdCiL+CGnuLdVwrBWqPtQnW58F1vUplhtz9HReNz+kvCLT8b3ew3CUG9bF9nFAv6HsrD1DC7dWRoRuy41HRZoCyTNRiGf/7Zz9xjFHMvLAY3UdSGgzf6JgSVOvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KwXFrcy4; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55324e1a297so550533e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 14:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749589989; x=1750194789; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Jm3QNJuhpnWPil7MXWGSQJymiOAg47jty10YrAXHYA=;
        b=KwXFrcy460yCn7r6faVdnqJ6U2Ht5DCc9sZMY/Xui2HztaOriVCYRN6MG0NRyVpt4N
         Z6j8IP16+UQXuLlWPk0CuzUxfcQWlmi2qxfp30YBIyWb5rS0McZ1Yz7uWMxz+7EPLQH/
         OVUpo6DfgMehivtbVBhZmkUWGrR6q3usOyHZel6VoXoP19rcybLalrk/UVb+KOB4vJhm
         FnSWilA4xgqLuKTXcDlwTsXUzbiwrLoQH+wRZvll5lT8WUj2xo9B1mSNKeX4wXl3J3xS
         EBgIubWNU+ytE7DQKWYmUegbQ0lsOp6D4Slbgx7T3PvhCbwXE1/TrmI9J64CqkT6hyV5
         JsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749589989; x=1750194789;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Jm3QNJuhpnWPil7MXWGSQJymiOAg47jty10YrAXHYA=;
        b=QERomMsRr3V4LeUGXujpXo4PICK1VhrO8L/N1w5kDyrxU8iwkMNq7IWuzzLW8OEREF
         3aM9s177a9Pt/MGXIx2qf5fhNvqtKmsk6JCKDGV6OHp0QbptVXUxHc0Kdh0ETHC/TcZc
         DXeMsv0gaFC5lL0XKQ+P4HAEUDrt73igdQQXyeq+FJ23CJL71Ys8gWHJ+/esDCl5mJS9
         dVKJOTG/1a+ENVlxUeSnpRvDDP4ZdV2Qhar2QTAiMDrQMbquZQz5Bd5UzKwMmhbHbQP/
         I9F9JKS0A2ig2o/ZrF6gOjgNijQm3xQMGF7yoXDQXC+sh92MbKXkkk9smwSnLnzlw45J
         kGlA==
X-Gm-Message-State: AOJu0YxPgnCMN7D36Y8ZpCK3AcTsz0nYEYoBGaFkqn7NHXJUs0ul3iNY
	CJEnDu4KMD4kpazrW98qeT4xLS/nVh/VtBbUkGtvYmOCvJCr7JnqdKqFwCCJ3+wxbJw=
X-Gm-Gg: ASbGncuUl3WfNwitlfWLRt+hMJwBPSh8yxd5zCK8ns0cG+mTj0MxcDkxwXOtqnYmFaZ
	cCpA4UfFQ9OGAsCa9/vzBd1iRN8/pYp4XhlWdSHyRs7LNvhgJf5aQ/4LxY6k+KHaOF05B4P5FX+
	sF6Nq7CYvf5xfoGbHuBk929gy4CN1CDxU9FRg9VF4pjmEdfZJEyA2PscD9ytPEOkZGZ2+XFbG1v
	bxEzLR6gU70WSdzc/h1kDuM6jUtLB+M95ALYbJFPzbxhnt6tqyQCfSO+u2aTzpLtg+xlBJmhsSa
	VcYWuu08p6hlEiBOFpv3BXDKo+cKq64ciMj8Zpvub5V8cLhsBy5J6biABLXUJYWhuQEHBtvKz//
	MoFePVrXaI1Yr/Laug6LxLVTv5OpyOMQBhFOuZU4C
X-Google-Smtp-Source: AGHT+IETS+TB0TrvfrEPPA2p4kx9c0fT3yVUwc0NfXrGV2E7vpHmY4Len4elBMuw0mxhWpUCsDohWQ==
X-Received: by 2002:a05:6512:3daa:b0:54f:c51b:d828 with SMTP id 2adb3069b0e04-5539c0c55b3mr101719e87.4.1749589988651;
        Tue, 10 Jun 2025 14:13:08 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772a9d2sm1710622e87.186.2025.06.10.14.13.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 14:13:08 -0700 (PDT)
Message-ID: <b4a7aed0-a05e-4d1b-965f-78e0c5e0709b@linaro.org>
Date: Wed, 11 Jun 2025 00:13:07 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: qcom: sm8550: Add support for camss
Content-Language: ru-RU
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Wenmeng Liu <quic_wenmliu@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 quic_depengs@quicinc.com
References: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
 <0367d5bd-a42e-4b6c-b841-ba20190b3127@linaro.org>
 <dc4720a8-2f15-44aa-9a52-8440c7518328@linaro.org>
 <739bad1b-f26d-44a6-9cc1-eee28023474f@linaro.org>
 <dc82457e-de2b-43ec-a50c-08f7d8bdeff1@linaro.org>
 <1883d9d7-26d4-40b1-9848-ae0477cf95c7@linaro.org>
 <6bbd526c-3193-40c7-91be-e629949dca8a@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <6bbd526c-3193-40c7-91be-e629949dca8a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Konrad.

On 6/11/25 00:04, Konrad Dybcio wrote:
> On 6/10/25 11:02 PM, Vladimir Zapolskiy wrote:
>> On 6/10/25 22:02, Bryan O'Donoghue wrote:
>>> On 10/06/2025 13:49, Vladimir Zapolskiy wrote:
>>>>>
>>>>> List feedback from DT people is isp@ is the correct prefix.
>>>>>
>>>>
>>>> My bad, but I don't understand this comment, it seems irrelevant...
>>>>
>>>> The expressed concern is about the novel label name.
>>>
>>> I mean to say the feedback from Krzysztof was that we should use isp@
>>> not camss@ and I agree.
>>>
>>
>> Let me repeat it thrice, it's okay...
>>
>> I don't object against the properly selected device tree node name "isp",
>> here I object against a never used and very questionable label name "isp".
>>
>> Please feel free to ask more questions, if you still find it confusing.
>>
>> Again, I may missed a discussion about the need to get and use a novel
>> label name, then please share a link to it, it'll be very much appreciated.
> 
> To hopefully help out:
> 
> label: node-name@unit-address {
> 	property = value;
> };
> 

Thank you, here is a link to the wanted section of the dt specification
for Bryan's comprehension:

* https://github.com/devicetree-org/devicetree-specification/blob/main/source/chapter6-source-language.rst.

If for whatever reason a proposed "isp" label is preferred, then
since a label rename is not an ABI change, it would make sense to
do a massive change of renaming all camss labels. Otherwise there will
be an outstanding incorrespondence/confusion of the label names in
board .dts files, and that's bad.

--
Best wishes,
Vladimir

