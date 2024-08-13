Return-Path: <linux-arm-msm+bounces-28406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8839508E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 17:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 430DEB2108F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 15:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E45B21A071F;
	Tue, 13 Aug 2024 15:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vnqxgvog"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3749E19EEBF;
	Tue, 13 Aug 2024 15:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723562473; cv=none; b=h8+N4Mayb6hMuUtZE3+WvphiXPH34O24XTyJ9emunYYjpevZpV8uuuSGftuHjVdyv/fMXw135qzrxHL0EGbt+q3c/C+MIjQXIbf4FRWpF4h+/RCkYhSzFGNac9vCmkaHyWOaQSt3N+qCCVyDq4FH0a5OyyzYh//gjDynRUm5fYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723562473; c=relaxed/simple;
	bh=1BSUdd59mysyWxqDsiUP2dOC6TXhkJDBjk+j0hKgjP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DWk7qn2tBgPhbjWgHTcGeD3xJX9nvGtTXFREKyMNSXy1yGS4hv/pF2Z8pz6lsDyOFj/u9aLIjecqJd2XYcXU0NS0WmQ3AZRpPjfPDyg9XCwjnRDSwKTdjxsCc0uf3gNCu6YGgZaLWAHewW5yh1YINjavK98ldu7lWumbzT5jVI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vnqxgvog; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5af6a1afa63so6540705a12.0;
        Tue, 13 Aug 2024 08:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723562470; x=1724167270; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4x0dVDfwbSqaUedgnNXWXrQ7FZEd54+Hc1EubL/44o0=;
        b=Vnqxgvog6JkkkFLhl7eLq1rE62Bg2+niV5HHBtG8SfBDB5vmHp0SNbvIohXscPfYXx
         uBjs2NoAYhhAjgM8IlKCuBfMITnPblex1ghFlrUF+hVjhY5rUg9Ps62j7cA6eXjPki9/
         tW8zYJrpiMpSGCV2ziprgl4RIe+TxhFFxMqiEes3HN6hXGJcFX+NzCwj07s6JvoNW+f4
         Kd+XJAjzihDB/mdTLYd5TRvvk+cgUiHe2k8aIFIssc329cgqnTfHDCSYnh5kWSaCI2F3
         Y0tTJwtGy7+EkzQJ/nWAM5tbFlS0v9pKW2cZUETLDGelFM0LhznhJO1qSjp+l4ReSUi3
         4vFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723562470; x=1724167270;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4x0dVDfwbSqaUedgnNXWXrQ7FZEd54+Hc1EubL/44o0=;
        b=IENODJVlr6OXQx1TZzCtLtotqwZH+Qkic1nYYuhGfBGmT3MjCcpeZ6itltHEmRHQfQ
         Q51ck8bsFiMcYZFxAjVmkK9+RE5VVBLYHYdDdkjp9jKknvjQ/AahKKpGBBeTrfzdOJAq
         xC4Sj0i0VG/Xii/d5rK0Owwnk/eLOTuOLHhnzc/N6CLdnoMpBK4RM7sF0gMIyYevDwPM
         +kCxX4winVwc91qbly02uq0JchjtT5/VHdAzHlX0DNvaaz9FfWSnQ1aMfpLbM1h9vXvx
         4YOJOZDUV/FIof4WJ1qKt9mzyzBxsZ7rBfSDzjEn3pSQVteWli1/i9xU28/QphAFstlZ
         ldNw==
X-Forwarded-Encrypted: i=1; AJvYcCUOktdZ768/ef4Urplt6mfGoXHvd9cIqTJ1R8t4uzHQCgE+aIYaPYNbhkTCbeAAUm17GsZuhaNDymf7ItlwTD5NBy710R3Lo+VWozhiLYL/7T1b573KsHFpFOR3WyyyMDXeCtKAqWnWXvgYb2rS9wieGw+XSF0GKsgKnr8iNX2XfrgK5wb8hgmVUHeIHFUh7I+6UAeqJKgdnmzF9DjRGskIQ0s=
X-Gm-Message-State: AOJu0Yz5SKSNPFCd5U+Z5zHJJuZLWCEg21Y+5W1hbQCU0rKmCfDFUc9u
	FA2b8d7A/W6tddGjlHbrYukY3VRcPkwmLWuwNIGpImh5S0HgR9yq
X-Google-Smtp-Source: AGHT+IEqsRq8kcguYCvhmMX5/WeINV2T7VkBCkorS2ILWnba0PniCP+uXxhmexjhhY3Z34j1nEhX4Q==
X-Received: by 2002:a17:907:f7a3:b0:a7a:84ec:8785 with SMTP id a640c23a62f3a-a80ed258d0emr322919866b.40.1723562469387;
        Tue, 13 Aug 2024 08:21:09 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f418434bsm76093766b.204.2024.08.13.08.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Aug 2024 08:21:08 -0700 (PDT)
Message-ID: <9ddd4b22-61eb-453d-8680-70065541878c@gmail.com>
Date: Tue, 13 Aug 2024 17:21:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100: Add USB Multiport
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krishna Kurapati <quic_kriskura@quicinc.com>,
 Konrad Dybcio <quic_kdybcio@quicinc.com>
References: <20240809-topic-h_mp-v1-0-3c5f468566d8@quicinc.com>
 <20240809-topic-h_mp-v1-2-3c5f468566d8@quicinc.com>
 <b37b3c8e-902f-4a62-8a6a-ab9b8cb6cadb@kernel.org>
 <cec50e6e-aa5e-42a0-886c-82f3f1062d3a@kernel.org>
 <b337ce5e-78f8-4ecf-a270-2d2a29e6df5b@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <b337ce5e-78f8-4ecf-a270-2d2a29e6df5b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.08.2024 4:35 PM, Krzysztof Kozlowski wrote:
> On 13/08/2024 16:09, Konrad Dybcio wrote:
>> On 10.08.2024 2:48 PM, Krzysztof Kozlowski wrote:
>>> On 09/08/2024 15:18, Konrad Dybcio wrote:
>>>> X1E80100 has a multiport controller with 2 HS (eUSB) and 2 SS PHYs
>>>> attached to it. It's commonly used for USB-A ports and internally
>>>> routed devices. Configure it to support such functionality.
>>>>
>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>
>>> You have from and SoB mismatch. This was sent some odd way, because both
>>> b4 and git send-email would produce correct From field.
>>
>> So, I'm:
>>
>> - sending from @kernel because it has a good email server
>> - authoring from @quicinc because that's my employer
>> - sending some older @linaro patches because I made them before
>>   switching jobs and it's only fair to do so like this
>> (and I sometimes reply from @gmail because thunderbird works funnily)
> 
> This is all fine, but you created commit with one identity and signed
> off with other. That's not fine.
> 
>>
>> I noticed locally that if you switch emails & edit author too often, git
>> gets confused and `git show` Author: / `git send` From: don't get updated
>> properly, but if you do git format-patch, the resulting file has what you
>> would expect..
>>
>> Should I resend this?
> 
> Yes, so there will be proper From field with proper author matching at
> least one SoBs.

OK I know why it happens.. since my linaro address is in .mailmap, I can't
do any new git operations with it.. Removing it "fixes" it.. but then b4
base-commit needs to be altered..

Konrad

