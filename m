Return-Path: <linux-arm-msm+bounces-47480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBD6A2F9B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 21:06:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2139C3A1A21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 20:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8497C25C6EE;
	Mon, 10 Feb 2025 20:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b9lowbss"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053E324BCFD
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 20:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739217964; cv=none; b=HYTmQg47Aozt8H8fLq7Fxg+gOk4nbVFtk46waX3HyUiVdYHP2uy9gBwRE9kcw2UbkNzPo0GDfhbTZgRqNtyhkEXjFdAKhlatZPBr83zUqBZIU8NYwIQV3eLTTFiREllZrqdFOkBeJBGWf00lX3wRtnDa/KCYRotlDXIAJbijbU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739217964; c=relaxed/simple;
	bh=1C6majvuXTRgQpweqGpWVKF1omfml9tT/vnejXHKCSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hPWJ0J0hidEIBoKpFgT6tMA2ThFOPpTRX6/7Yd+hBgSniLbYwPO4+j6lFhErUkTVd4tcuk7CgK+nKFc6+7CT+6qcwDAIAWi+lODm+ucerRtLdNU4Y6I6mmcaBc6NXoPdJF0KtcgVPCVDpAvODs4QiRGqFSw99rSHN4iaez/ImJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b9lowbss; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43618283dedso47757475e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 12:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739217960; x=1739822760; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qZge85fGuKAUE9Mz0cTsJLS+63ffaGNjx2RI84r0q6Q=;
        b=b9lowbssvfiQIeoS1HImtjG43vnAJ5RwLZMfgVfRGlgiPeNdd3hnqPN3sd1xhFcm4/
         Fq2ZI/qTuRHVc0qbNDhLGCXROiua1GXocpi5XEmaL76ijPOqVGZngqv+rAvLHyroqt78
         ACNDtNVOjsrq0hbyRGqHNP+u9iPshn7YDQ4wuvqqbQtoDzLML0TYnAx8F4iKjU8qMsR1
         BU/7VVdTI+p9Dl1m3GWQl+BpY4GcrEPQVoG07NoNBbd4TrnE063dcULgcGo27QHJTzDH
         foszrIJY8wHK0lQ0cXzkRak/IkVye9PWJ7JN/Kia46sOSYX2JBGB8ZByt7wxf5Z8Ml2O
         bDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739217960; x=1739822760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qZge85fGuKAUE9Mz0cTsJLS+63ffaGNjx2RI84r0q6Q=;
        b=SSoL93EQ7c/s9JdfEvM4Po72Q8mG5APrdW5Cbj/bbQiuJAZO8Rm1m5eSXhEQb82SsU
         7QXz/L92tVxuDwLEbp2RRMef4o2nQiKiBYSXLIXH0cUwh3OiFVkQOqoStuSW+cpOfqMa
         KeUwJjfxlUD8uZ4eztX/jFpPpLWNjxr/2a52PDBPy6wLxPvPNmU17hHyPl9omxrGoFop
         Fj5uABHuB4MbUPNseDalywf4ts/IypfkQq8YM1CT9Fmw2N+WOXZ5+V/G30PGisRg04i0
         cG7rOrWJm3c04PyQBv50FVqG3S5j5ooBIBizvQVB8G54ogrzfY5u1swThsIznsBg+t7s
         Zn6g==
X-Forwarded-Encrypted: i=1; AJvYcCVYNXgLmE5EZK2z2NzyGRf/1epwJPdBWUF9msU1LkfbDPoPYjqvJOuqKbTagHwDZKFebxrIxQHxaj4grZoY@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ3wbXoBkkvZnwwq0uMTqeK+zPPtY7o6fCuAq8STdDEUaiyWUy
	v4PxhZkvpa/czBRQD4OHUePTELeA+FTqdGeAiZoDlwd4ZWPBUWs3qqhoyM60ZcM=
X-Gm-Gg: ASbGncszsheWM05gMa9rUtBUjw8BLWRmLd+xuOsm2fHzQs0kw5ql1BtNy/W8DygZP+q
	KvcXhKf956Wtp6TGgLIwSLFWDoQOaIozy0WDbY+GM26FJhG56KW5UhN8zI0CPYp2uaAElIIJlyP
	VReTr1ix6+wVMC8/GwoGGBQ33ZkdcXFKO6P+juQnS0miZeRc4VPV3YWSg0z2V0vwQBcrfx9gnnR
	T0vfoX3saa4OWAW2GqoBFpQpvf3KRWcBU7+vxwvDQ4k/GH33lL18VuwOrxfMOKeWFHc8rQlcXuA
	my8ZHHm9LeFgtAxmaSQybbgE3qpcvBnJNWXLoK5I01gzWYOuNnrMzW27+UHufr7+hmkt/v8M
X-Google-Smtp-Source: AGHT+IENZNLlzbHZChxxzkAVFaxoHPFPpaDAe1DrFLA3eP/pNGLyNj0uGx+/p7g39WeC2q/Q0BDnJg==
X-Received: by 2002:a05:600c:a16:b0:439:31e0:d9ab with SMTP id 5b1f17b1804b1-43931e0e01dmr88923185e9.0.1739217960152;
        Mon, 10 Feb 2025 12:06:00 -0800 (PST)
Received: from ?IPV6:2a0a:ef40:1d11:ab01:7693:a594:d8cc:16e9? ([2a0a:ef40:1d11:ab01:7693:a594:d8cc:16e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db110dfsm194277315e9.36.2025.02.10.12.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 12:05:59 -0800 (PST)
Message-ID: <22b42e2a-55f9-40c5-93a2-bd18a5ac3af9@linaro.org>
Date: Mon, 10 Feb 2025 20:05:58 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: use guard pages
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: "Dr. Git" <drgitx@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250207151706.45031-1-caleb.connolly@linaro.org>
 <85c31e1f-20bc-4e48-b179-e44ee8e1f816@oss.qualcomm.com>
 <a22afa6d-18de-4b83-ab08-6b23b9a1d927@linaro.org>
 <3dc16129-6f1a-469a-a4fa-ecbfbeff53cf@oss.qualcomm.com>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <3dc16129-6f1a-469a-a4fa-ecbfbeff53cf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/10/25 18:14, Konrad Dybcio wrote:
> On 8.02.2025 12:49 AM, Caleb Connolly wrote:
>> (resending from not a mobile client, oops)
>>
>> On 2/7/25 21:20, Konrad Dybcio wrote:
>>> On 7.02.2025 4:17 PM, Caleb Connolly wrote:
>>>> From: "Dr. Git" <drgitx@gmail.com>
>>>>
>>>> Rather than manually define the guard pages, use the
>>>> "qcom,use-guard-pages" property for rmtfs.
>>>>
>>>> Signed-off-by: "Dr. Git" <drgitx@gmail.com>
>>>
>>> I'm not sure this ID is acceptable
>>
>>
>> Linus & Greg explicitly allowed for aliases previously. Patches by "Asahi Lina" and others have been merged.
> 
> Correct, however the trust is put into the maintainer. Marcan et al. accepted
> patches by ""Asahi Lina"", as they had enough confidence to put their name
> behind said contributor not being e.g. on the sanctioned lists.

Right, well please let me know your decision and how you'd like to 
proceed if this patch is unacceptable.

Kind regards,
> 
> Konrad
> 
>> Ive spoken with the author several time about this in the previous years and they aren't interested in publicising their legal name. So the only alternative here is that plagiarise these patches which I didn't write, or i have to carry them forever downstream...
> 
> 

-- 
Caleb (they/them)


