Return-Path: <linux-arm-msm+bounces-8005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5381C83971E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 19:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7713E1C276E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 18:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02A981AB6;
	Tue, 23 Jan 2024 18:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WSyyzlYs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBA081AAA
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 18:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706032823; cv=none; b=VihepoEqLpzQEhV6AW6RTRTdzeqTh8IlOPCB7LbxAPlI83kyPBgOb1IzW7aH2leLrBgM/PyeJS64pqN6gBN3Ef5Jf0WP+wCIx8z136NkpBISKrujVgD2A3hnDTGHi5ppQYPojqj0W1PakbJeNHaW0iBnDzpo2CN3huUnhZW1hY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706032823; c=relaxed/simple;
	bh=MtJ/HqiEUxScIQTHutFj2dKX6h9i2hpJKWEAmQsLjIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J4pvI0Hjy41Gc1jhyqf2zeN2MNMEBQ2aZ/UmfkP5FrdGKe0exC//oEbopREusF7Ybq2/bf1ShTbAlRyZQArkbnYNCMMHMhv0tzawaVVPmnbiqhEJkYqvCUR28fV1RlxJHzlZKh+DywdQlf3YKhqbIVqVlhw3p81IzerrzdX/pIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WSyyzlYs; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cf1c3b23aeso1505831fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 10:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706032820; x=1706637620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TnoRqNG9BylPXm1qN1DFm/eBxnmuuTJ523N0hc6cFDs=;
        b=WSyyzlYsQvy0asmn23QNx/AhxlktRfpIZ4/nyEWv9tmccquD7/I/t3vVyG4qzGeZ84
         Vi4Vg5hT+E6fwgoNZaEBS/HTqI0HykXm7dHJkFdp5kqdAZmvBk28ECHqZZh6zHYomLew
         l6QLYPLkWfNAvj233fq5BjNKDg9p3Bt8FW2uLytHAD3Fffw/3MD7wNqpTpB/JkenPWqs
         th6hJkuNv2douaf0kSGZhIAOsHBH6O6wV15sO26P0K6u8tB+ygqj1DUV3/qiFJ3VZj3Y
         EKlDrfJ/ntqsFoMwO/SW+xHeU3QEzSF5pGlB7gFZ7RUIUb6s73qQD4C2p+4BlSzj7Qk6
         wMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706032820; x=1706637620;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TnoRqNG9BylPXm1qN1DFm/eBxnmuuTJ523N0hc6cFDs=;
        b=LN+HEtS+ZfulrbUaUUfAk0nmxWzqyenXbba85Ks4haD4niRSn7VjKPgoPZJ5RPbBAs
         bT43K/A9d4MouICc/I30mL67GCXpWW43Ua/KwpGXtAPrMYMeIxXRXanxmksod6p/o/x8
         r+urkAZsxtYVhkY46w0srYsyZWz1OImPgZAkPjXAE1/0qKpxxD0QqLnTZ1uC/l4YO785
         krE8VfDW3uZe3tW0ojKha+lN7EKM9qd2MtJ6HiDQlS4Abotmw7pojBLyjCjpOpBxoHnM
         FC1ViZ5lDcThoFzWf+e4AzpbppOC/PfoXgIgXQk8IpQVbFAVqOISPyO/gY3Sc2wRDZaL
         XpgQ==
X-Gm-Message-State: AOJu0YxqQ5XQNPEhftLLLr0aI05SHea27GxGuYkRHXB4e79UvaQyqXZn
	HLTwnbIWqw0aFBgIPWPz3CrcqZS3Kqg14oTpwOoVExSQ6wUm6/6ZNjx5GbXhNMA=
X-Google-Smtp-Source: AGHT+IFnEfC3oawTRwTitOxgaBUV+CKV0/WT2dwdHRRdkvC9cRcn6wvyopZjVpQbq/DqeMFnxofbKg==
X-Received: by 2002:a05:651c:8e:b0:2cd:285f:7d39 with SMTP id 14-20020a05651c008e00b002cd285f7d39mr115795ljq.15.1706032820038;
        Tue, 23 Jan 2024 10:00:20 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id f17-20020a05651c03d100b002cdfc29b46dsm1514699ljp.88.2024.01.23.10.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 10:00:19 -0800 (PST)
Message-ID: <0069beea-72d6-4a31-8f8b-282dbdd4bf94@linaro.org>
Date: Tue, 23 Jan 2024 19:00:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Remove QDF2xxx pinctrl drivers
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240122-topic-qdf_cleanup_pinctrl-v1-0-0c619ea25091@linaro.org>
 <8c9b157b-4698-70a3-57b7-c588998eeda7@quicinc.com>
 <CAA8EJprDk=HnqWJ_F5zdUKMPFPpx1RD9KN-KQP9yopP6LMh_fw@mail.gmail.com>
 <52479377-ff61-7537-e4aa-064ab4a77c03@quicinc.com>
 <CAA8EJpr2g=b8+M9r20KJoK+VVTabgctvB9eLmwivmi5qgBddFQ@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpr2g=b8+M9r20KJoK+VVTabgctvB9eLmwivmi5qgBddFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/22/24 20:23, Dmitry Baryshkov wrote:
> On Mon, 22 Jan 2024 at 20:44, Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>>
>> On 1/22/2024 10:56 AM, Dmitry Baryshkov wrote:
>>> On Mon, 22 Jan 2024 at 19:43, Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>>>>
>>>> On 1/22/2024 4:57 AM, Konrad Dybcio wrote:
>>>>> The SoC line was never productized, remove the maintenance burden.
>>>>>
>>>>> Compile-tested only.
>>>>>
>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>> ---
>>>>> Konrad Dybcio (2):
>>>>>          pinctrl: qcom: Remove QDF2xxx support
>>>>>          arm64: defconfig: Remove QDF24XX pinctrl
>>>>>
>>>>>     arch/arm64/configs/defconfig           |   1 -
>>>>>     drivers/pinctrl/qcom/Kconfig.msm       |   7 --
>>>>>     drivers/pinctrl/qcom/Makefile          |   1 -
>>>>>     drivers/pinctrl/qcom/pinctrl-qdf2xxx.c | 164 ---------------------------------
>>>>>     4 files changed, 173 deletions(-)
>>>>> ---
>>>>> base-commit: 319fbd8fc6d339e0a1c7b067eed870c518a13a02
>>>>> change-id: 20240122-topic-qdf_cleanup_pinctrl-98e17cdb375b
>>>>>
>>>>> Best regards,
>>>>
>>>> NACK.
>>>>
>>>> This was productized, there are some out in the wild, and the platform
>>>> is still in (limited) use.
>>>>
>>>> I'd like to see support hang around for a few more years yet.
>>>
>>> The problem is that... its support is pretty strange. I can see
>>> pinctrl, ethernet and quirks for the platform in GIC-ITS and PL011
>>> drivers. Is this enough to get the platform into the useful state? I
>>> can imagine that "QCOM2430" ACPI handle was used for USB hosts on that
>>> platform, but I don't remember when we last tested DWC3 with the ACPI.
>>>
>>> So, all this boils down to the question whether mainline (or something
>>> close by, LTS for example) is actually used and tested on these
>>> devices?
>>
>> Its an ACPI system, so you won't see all of the fun DTisms of a MSM chip.
>>
>> The platform was fully functional upstream, and had an Ubuntu
>> certification.  I run Ubuntu on the two that I have in my office.  I
>> haven't strictly checked out mainline in a while, but I could.  I still
>> have access to the documentation.
>>
>> There is a small, but active set of users including myself.  From what
>> I've seen, they've been happy with things.
> 
> Thanks for the information! It looks like it has a small but stable
> user base. I think we should keep it, maybe ensuring that we are able
> to test the kernel.

Alright, please make sure it still boots etc. then!

Konrad

