Return-Path: <linux-arm-msm+bounces-65024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECF7B0584A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 13:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C372165C40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 11:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2943A2D6414;
	Tue, 15 Jul 2025 11:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ikpqn+2i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253B2258CF2
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 11:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752577387; cv=none; b=fp3ENI5xOCig9RWVuQHe5CFsHh6+MZWXrkjDX/5KusbJn4UQfi6hmYNysf6ME1qUot6BBtijlbGRBJqfxwqC2PSi3/VH7AJvNELyyL9PLlHjT8sN1QIHfn2Ge/THS8eBDne2yK2YRIDOW3jRYJE3MpIMUj4K4xhyJDiaHHQ2VN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752577387; c=relaxed/simple;
	bh=JeULfLoO61COXgY9TRNEBynJYaRj3dtYVdnwXi9Urio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LFCkt/Rta1msRZ1Djf1F2OeFXtWf4qhkxJKEQ7C5tLmP9U/eHvmTIQ5LMahFtawCnXKqPdhoQ2SaU4kqv8WweRSX13Nq+rHDyr5SgqRWxlt9sXg/Z1g2aBzvxcT7KIDApVYqLKf4Vq9hihN+glmD2wetMuo4aUUCa1hDd6+y2TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ikpqn+2i; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-455ecacfc32so16916845e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 04:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752577383; x=1753182183; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BKUkKIualjoy9v95vK8+BtLhU3lx0OJMWJq7rT63AXY=;
        b=ikpqn+2ib7w+K48082h24IVK3H6n0IIDYGVoUM5G313XtQn1LoLCvVE472qVwH2ZaD
         5WgTvN0WElGFJa0hPup0Bc9iXrnTSM9cuWsF5ncRVPi50jTBhFy/qrH9EpfjFY4Jxky/
         as2EVYDnYYRpIG5LAZyGH1NNQhCkxQxDmYhzadDX7hqSGxJ3tU1Mk43xNdEfuvryYI/b
         KYvinPusrbWrdYjwK5gqNH7yu2301Z/wx35DVgIhKvJG1relVlBxIfoimmB5XRWZ7SkJ
         5wZ/a+NtkuemwR+wQFsg4oFTTlU8wuuBm8F/7DHgML4k6K3m0sPX8cOj298gYxuf8WHd
         eV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752577383; x=1753182183;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BKUkKIualjoy9v95vK8+BtLhU3lx0OJMWJq7rT63AXY=;
        b=lrPT/AtUAhosoe7b/ZKI7zKwdu8cAjfKqq8StD02oSU35jrkfltXIWPvtqIaRFM+Ns
         xAf2EL4FeAzvqUqDOXmhNt93x+bFvAP/WZUAPe3EHUyLFnkp0egIZ5Kgqd7pptOL2Ouq
         HwhMRPbC3j+/+zI/eanMf9d7lRPVWQ4q+6rnK2zA3ksyxgkFLQ8vs+UsZzlrS1GaisV9
         TkHsAzDkzT0bHvjUO1v1Y4z0V3EHkIKUAcRPf/qRKwmFs+PIkD545K5BZn69jrzOorGa
         4FhrpsdgRMywXa/ZU3pr0H0VzY/73lFHhPjZ2gP3i4Zu3UqKbqBgaFlUa/U3CuGbJ1Lz
         7cOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA+GqXOmZImVMy5xGvo4SmRW16gPsGvbXrpur5P6cfhDy6XaDNl4JKF3Oign2S5/ibORbbc31ZgoVne63G@vger.kernel.org
X-Gm-Message-State: AOJu0YwzbOKtUJ5WvUygqhV1s+bzGkj80RuQW1KtcEHT7qH/T+/luY/n
	NYYw5ZogQ4zk7+eV09LqBGJd8idZSZP1U/tsOrobZY5tcfi+93fo/S3R0GRHnbTOQTdzbTUzeHC
	9LOpuD3QiFyth
X-Gm-Gg: ASbGncv/iEn2CeppEytM2org53Qo5f5e3+h3n4gDgLRnPfIWSSuh6pfYKzZiDVQbvDZ
	fak1yZR8K/14KQq30++EgZ3InkhixWZMdHaHLgUwZvLe0HpNj/znTj0lcVjC+sdo/rl8hMdDe8r
	PJQf4zbYpCUKLB8FL6EJVOrpvPq+4zh/wgtguorb2LU5jyFCN9BznRI5y5FMZXqCta7xqmjM+ZR
	GaTV7vluvjs0OosAVs+I+r/PkSDZtuwXS2YsealtQgl1jAmBE08Z/KzPWq+EZrh3Nxxw0+FUDlb
	nH+sisxwK2rEs4i4JJXDVFDtb/BeHAtE7bWLlwMi1bcd8Ko5iOwQcTYeBjdcGk62S2T49/c6vH0
	/x9lPfVSIHps+J16VtjP3bs8SDklPXcwLpF6ALO3Epy5AMzhTaIcZVRP9HdmIACI=
X-Google-Smtp-Source: AGHT+IH0nRGAW3eKLJ/DUVNlwgthSfHL2WGPa6jyeTIprfdCexkNpPIzlaJ5b41PyW8SbA84yckY8Q==
X-Received: by 2002:a05:600c:8b70:b0:456:fc1:c286 with SMTP id 5b1f17b1804b1-4560fc1c49amr79262565e9.1.1752577383065;
        Tue, 15 Jul 2025 04:03:03 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45617f18d99sm66247625e9.8.2025.07.15.04.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 04:03:02 -0700 (PDT)
Message-ID: <2b5ececb-fbf7-4901-8efb-03744f740836@linaro.org>
Date: Tue, 15 Jul 2025 12:03:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: iris: MAINTAINERS: Document actual maintainership
 by Bryan O'Donoghue
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
References: <20250714151609.354267-2-krzysztof.kozlowski@linaro.org>
 <8772c48f-348b-8a68-2099-562a29b9dd8d@quicinc.com>
 <b83cc20b-44d2-4635-a540-7a9c0d36cdb5@linaro.org>
 <a4dfc82b-79df-3e3c-0964-a99db222c6e6@quicinc.com>
 <4f79424f-0005-4978-8c6d-6b726ee7e4ab@linaro.org>
 <c70fd6c6-1a65-41ee-b0e1-f6c792867009@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <c70fd6c6-1a65-41ee-b0e1-f6c792867009@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/07/2025 10:20, Krzysztof Kozlowski wrote:
> On 15/07/2025 09:06, Krzysztof Kozlowski wrote:
>> On 15/07/2025 09:00, Vikash Garodia wrote:
>>>
>>> On 7/15/2025 12:14 PM, Krzysztof Kozlowski wrote:
>>>> On 15/07/2025 07:51, Vikash Garodia wrote:
>>>>>
>>>>> On 7/14/2025 8:46 PM, Krzysztof Kozlowski wrote:
>>>>>> Bryan O'Donoghue reviews and applies patches for both Iris and Venus
>>>>>> Qualcomm SoC video codecs (visible in git log as his Signed-off-by and
>>>>>> in pull requests like [1]), so he is de facto the maintainer responsible
>>>>>> for the code.  Reflect this actual state my changing his entry from
>>>>>> reviewer to maintainer and moving the entry to alphabetical position by
>>>>>> first name.
>>>>>
>>>>> NAK.
>>>>>
>>>>> The roles and responsibilities are well agreed by media maintainer(Hans), with
>>>>> Bryan part of that discussion, w.r.t code contributions to iris and sending
>>>>> patches to media tree. The only reason Bryan post the patches is that Hans wants
>>>>> single PR for patches across Qualcomm media drivers (Camss/Videoss)
>>>>
>>>> That's the maintainer role, so Bryan is the maintainer. I am documenting
>>>> actual status and your NAK is naking what? That Bryan cannot handle patches?
>>> I would say, you are reading too much into it, i updated what we have discussed
>>> and agreed upon the different roles for managing venus and iris drivers.
>>
>> Reading too much? Bryan HANDLES THE PATCHES.
>>
>> That's it.
>>
>> There is nothing "too much here".
>>
>> Person handling the patches IS the maintainer. Full stop.
> 
> Based on email you forwarded to me and some more feedback I got, I think
> I understood what would be the solution to satisfy your point of not
> changing existing entry and solve my problem of maintainer handling
> patches not being listed anywhere as maintainer. I will solve it v2.
> 
> Best regards,
> Krzysztof

Doh, this is definitely my bad, I should have made a _new_ entry in 
MAINTAIENRS similar to this.

AIROHA PCIE PHY DRIVER
M:      Lorenzo Bianconi <lorenzo@kernel.org>
L:      linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
S:      Maintained
F:      Documentation/devicetree/bindings/phy/airoha,en7581-pcie-phy.yaml
F:      drivers/phy/phy-airoha-pcie-regs.h
F:      drivers/phy/phy-airoha-pcie.c

GENERIC PHY FRAMEWORK
M:      Vinod Koul <vkoul@kernel.org>
M:      Kishon Vijay Abraham I <kishon@kernel.org>
L:      linux-phy@lists.infradead.org
S:      Supported
Q:      https://patchwork.kernel.org/project/linux-phy/list/
T:      git git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git
F:      Documentation/devicetree/bindings/phy/
F:      drivers/phy/
F:      include/dt-bindings/phy/
F:      include/linux/phy/

scripts/get_maintainer.pl drivers/phy/phy-airoha-pcie.c
Lorenzo Bianconi <lorenzo@kernel.org> (maintainer:AIROHA PCIE PHY DRIVER)
Vinod Koul <vkoul@kernel.org> (maintainer:GENERIC PHY FRAMEWORK)
Kishon Vijay Abraham I <kishon@kernel.org> (maintainer:GENERIC PHY 
FRAMEWORK)
linux-arm-kernel@lists.infradead.org (moderated list:AIROHA PCIE PHY DRIVER)
linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK)
linux-kernel@vger.kernel.org (open list)
GENERIC PHY FRAMEWORK status: Supported

Its 1:1 what we have for drivers/media/platform/qcom

I'll add that entry and leave the Iris/Venus entries as-is.

---
bod

