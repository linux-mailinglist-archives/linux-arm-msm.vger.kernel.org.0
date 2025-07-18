Return-Path: <linux-arm-msm+bounces-65632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2EFB0A086
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 12:21:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D1D31AA60B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 10:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C5F29E118;
	Fri, 18 Jul 2025 10:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J/wWWskB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7794529CB40
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 10:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752834073; cv=none; b=G0ckhwcRKz5s1D/qzo1KoR6OYoKNzrAZKvxZLpV00h3WQewC2n0gM0ZsqwajTtvoqPHMvxEJS7PtAsUbxEVw5aOktgiDikMibpxhnWJtb3W64qtjS6HlGxIwT799BlllNUYU6yXVt/euDfu/FJz+7zvoNz1B3gzwuTNUk7m1yns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752834073; c=relaxed/simple;
	bh=g0MCGJ7YaYbAjDt3WhSX/LOOkU6F6Pxo7BkKvNMJkvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nl0N86wXKM391/9eHAoLQQtkQI7vi1ZfMSdKdry281bcMsGyu+DqtcryWE8txSqV1DFOP1bh2N/vux6Q/1NMlChjXhis8zkg+qkQX4R/8Iw1O6qIgfSk8TItTe/eRzvEl4GM+27IBzdUv3ianLPQyFHMBmI84rWKIIYMWIoey7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J/wWWskB; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso1165969f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 03:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752834070; x=1753438870; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0OAIcBL70630f3jMfmSHdEwCAV/8PODlKAUzq5Lxgf4=;
        b=J/wWWskBzPKPx1yaR7a+bWgJi8A/MIVn7ItK7/YQCis1Xz+EY+YQKZAX0kgMHw/OKO
         jERX7ACjBL0auwz409G0hE/JClq/5/Y8kMUCPU9B5e2E54eXhyXGrXwBfvWoZpoYPfhy
         +YPW/szg4MpecksdbkFdvkKAmZ5GMYYMuVlA4FGplKVfPmg46y4NC2Vr0AlJGn5H9JqJ
         l9Da2T7Xv8UjiNlf9gGKhTausYqcspHyHCZWNnRKShJlg4MyaW+m07P6H/HZzwmOxCgc
         w7DMVzmRNhYzA7NGZMIdtFEsElqijKyHldkztsn1vLf+DIdvpi580AObPJRJt/0RY/4v
         ir0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752834070; x=1753438870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0OAIcBL70630f3jMfmSHdEwCAV/8PODlKAUzq5Lxgf4=;
        b=IsWe36iyjav3Y1WJVsSo6cCl7q6XnGi2aGyvo9DxU1q6rlzuZQpQNPFSLk9q5pELw5
         RLCGR2UhMbjyw6t23lTgyqXUbKIrqcxEoaet7jx3zEAGDRB1gKf04OUavfBrpwf4Ls/0
         mlPSHSfdvoqkLDuUpWa05aQ1IaaTu3G2dY86Lst1ntdup1VHa6T7MAxesJcS9uF3imf9
         0jSl9502JGfcGW9Gv3HQBL73Kw+QI/R64ua4/U/f8+ryVCXOd5dUcZfGhpr8sv+V4GxK
         RDBMv8WVscmT05AgC2EPrjUo24RwnL5mQdhQ8tGLj2MtPvpgV34/Z0uZQ/NcsNEYUu9O
         EXcA==
X-Forwarded-Encrypted: i=1; AJvYcCU+2wjb1dlcyB9mmf3Yj57EqTYfZYNCm5MYe2KS8qEov1YCebaxg1i3v3CN6W+ykTsT1kyqabrHByk6ajnP@vger.kernel.org
X-Gm-Message-State: AOJu0YzFOekTa4uFy/+7+tePIKevYINQYjXm5I8f1Blbx5L1aGK7rb2E
	JIT9R6O6wppjjvnqUHP1//lET7UEyFn196T4UkxUc8HN52S6I5+MhjTee2sPNB2tV5Y=
X-Gm-Gg: ASbGncs1D5dF5qW51ASUW2iOJpH3uS35fDq+iNf/W31Mwo2RkBxI44iZ1SXcpG7U/mR
	Bt/ayHQxwfs8kwWdgbGObHF/kYyVNv0PKbJietwIeOb/cZKthsN+kSj/pgeSMvsIQVxjo59Zx7P
	mwVF1to2yA2Fi7x5MTlAQOcEfeFn1EZly61+OLi8XMdto5sA3owmUiPxoJK2HnQtFM9pTLM36Oi
	sJpPxmpZ2FwgU0aVZyuK3HNhWw/VNIbfP9hxMITLzTmW4dk5p1FqBzSGWes/jPIF8crhXJ1ate4
	qJjH/+8EnkJq5b9KHQVajBtQcuLbakiL6PGH6KxQa9OqqSAarqqtkWirbn7FXDpbkndWZ2GaOCQ
	tGLjAtn0TAt/jnV5O7q6zBsppZBmsYbO/yxsKm1Ay/nIf7K/ORiPly4WJEH8KjrQrAEH5A/gysi
	I=
X-Google-Smtp-Source: AGHT+IFb4UrEaIgReWQNYtGNnuAGOrUAMETqNaFcLfwK/JPQUJ9ADxpbWpnghscMDuTHhPHpfNW4tw==
X-Received: by 2002:a05:6000:26c9:b0:3a5:3b03:3bc6 with SMTP id ffacd0b85a97d-3b613e983bemr5609226f8f.28.1752834069708;
        Fri, 18 Jul 2025 03:21:09 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca2b945sm1427254f8f.22.2025.07.18.03.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 03:21:09 -0700 (PDT)
Message-ID: <1402a52f-639c-4872-a153-b549603c13a7@linaro.org>
Date: Fri, 18 Jul 2025 11:21:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/7] media: dt-bindings: venus: Add qcm2290 dt schema
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com, krzk+dt@kernel.org,
 konradybcio@kernel.org, mchehab@kernel.org, andersson@kernel.org,
 conor+dt@kernel.org, amit.kucheria@oss.qualcomm.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250715204749.2189875-1-jorge.ramirez@oss.qualcomm.com>
 <20250715204749.2189875-2-jorge.ramirez@oss.qualcomm.com>
 <8a63f517-a443-48e4-9b9c-0c4b362f59f8@linaro.org> <aHiZpnFhhR5O0h97@trex>
 <0bb2867a-393b-46f9-ad6f-1aeee5a3a9d4@kernel.org> <aHjbjw8Z79Xcd/ZJ@trex>
 <aHksJum91s4ZmI56@trex> <5afbaf46-bbb1-47d8-84aa-29b18987564f@kernel.org>
 <18d013e5-352e-457b-ba96-3dd19f1cbaed@oss.qualcomm.com>
 <56d4e911-5bec-458e-acd1-3594a6d8b91d@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <56d4e911-5bec-458e-acd1-3594a6d8b91d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/07/2025 11:04, Krzysztof Kozlowski wrote:
> On 18/07/2025 12:02, Konrad Dybcio wrote:
>> On 7/18/25 8:27 AM, Krzysztof Kozlowski wrote:
>>> On 17/07/2025 19:00, Jorge Ramirez wrote:
>>>> On 17/07/25 13:16:31, Jorge Ramirez wrote:

>>>> Not sure if I’ve shared this before, but following an internal
>>>> discussion, I think it’s worth highlighting a functional dependency in
>>>> the current kernel:
>>>>
>>>>   - the driver only works if the first two IOMMUs in the list — the
>>>> non-secure ones — are placed at the beginning. Reordering them breaks
>>>> functionality, which introduces unexpected fragility.
>>>>
>>>> Regardless, this seems like a valid concern to me — a driver shouldn't
>>>> rely on the order of phandles — and I just wanted to make sure you're
>>>> aware of it before I post a v8 (likely sometime next week or the
>>>> following, as I’ll be taking a short break soon).
>>>
>>>
>>> Hm? Order of lists is strictly defined. That's actually an overlook that
>>> we never do it for iommus, but the core rule stays.
>>
>> (FWIW "items:" is an ordered list, "enum:" is unordered)
> 
> enum is not a list, but enumeration, meaning one item of multiple values.
> 
> Best regards,
> Krzysztof

As Krzysztof says the ordering is strict.

I think the right-thing-to-do is to document in the commit log the 
dependency.

The final three entries are secure entries and the ordering is important.

---
bod

