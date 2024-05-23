Return-Path: <linux-arm-msm+bounces-20285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E89A8CCBF6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 08:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 186921F20FAF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2024 06:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70DE6BB39;
	Thu, 23 May 2024 06:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LebcymsR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25686224DC
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 May 2024 06:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716444138; cv=none; b=jRwHQIgBwu5AqpT5EQo5ssUPyzL2ouEP1iorelE9elkbgOsEkrIgUwiwvaYWXnimxabP7ryAlV9/M5UfpiFEE71NyKXOSxJb6ftp6hhp3Cj7VswBbSsSFzmk1bSybUOXWCx+ws1GgkJqrdpUWExvwSNCfjlj30zQMsuyBlZkwwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716444138; c=relaxed/simple;
	bh=2gmKtc+dZO5bDPMUobHzDeKPQg4fDrYmuDcbFtmuwk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cDOERZ0v22+pwaXoL94iTi229QgRlWvlucDCZWXdG/MEuTSu++TW3Wj+CBJ0F4G2DNQ8wcP4oQernZZiPJ3oBiiUoGwwOwFkgXt5IJz0fhDXTXeYwvt/A8LnddO2/j5o4VruSfynMHB2+bD7dLecn6R8hrykFvfZqSdhbk8FHdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LebcymsR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-420180b58c5so15890745e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2024 23:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716444135; x=1717048935; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4X7BoLbMdMqQ1pM0nUAVzFWjxzrTvVPMC5L9TnHQ9rg=;
        b=LebcymsR3oC0hrj4SUOU7MnKoc24fe8OO/kDpokvMvjbKXrtrYXcFFK0X0SiGTQCVi
         vNWwKOO1smVtHKIvLrfeZQdQa9vkElDXEk+BlLxJ9H4YdH4q4cackvbso+ioG6p0XMcF
         juUqd2O5fwd3LKah0kSxvyTHX/wV3DoCakXBpe1b0ltfhS8vKo8Uch8oX2su2pCwpx+O
         T/6LmiZfTXsJY2G+no+Z6PD4BTZMhFdadzmJt8WXKAbPMdOP5CN5sLnc0nekW9JSiuDb
         kX3ua2Oa2YLheKg7AT8bQR8MF20HsMHKtu/kRKm8eA8m00WUfsTnp3PkrJwChb3dSsAx
         tbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716444135; x=1717048935;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4X7BoLbMdMqQ1pM0nUAVzFWjxzrTvVPMC5L9TnHQ9rg=;
        b=AJQMZdRsnd7aOWsAg9M4E6WthmtbycK5ktEHoumQc+920wjYOmZnWyYANAxjhBNhOK
         D2NxDUPl8Ea86gC+YWjXRhnq6UmRTqsSu6S4xffLfR13aV9E7eheI2fyiYDFOXWEwrMj
         9MxeINJMA8dnbauzikaWULJ2KWPP7w9AL11vjr2bh6O2wnQO6Yeh1OrWNWdjzKZmNTYr
         m9b7ClgiHNZmylYVmYlPEuhHz0UdUCu6NIet+rBU1GpYtnUbF0sHg7upVv2BWghG9qYq
         tbhEyrJ/WWNk4ciR+iQtihbELdS8U2E5geroAX4uqAq3gOeVrZ4bkzGMwPfuxr3yDRoV
         dksQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrhLFBdovKD0U0o6gZ/xCu22ATnoi4umIOBeBRToopwWqg53PYKWWrxiz6jdvjBnVzcuqimht//aD//yTAz2juxKWR78r8mwjRATkfIg==
X-Gm-Message-State: AOJu0Yw7tHx7aPiGcyw7LVgi5qhKMYQjdRUGzATJJeQmR2e3UMTK0iqG
	H1uHMZcgXU8DLr4Mi41TQN3j5D2SRbQRtsk91NGVR5MOzYAkfdCFM5el7hWoI0U=
X-Google-Smtp-Source: AGHT+IH+Yyh7MGsCftvGjwNM71yhQHJe6ieTfmevs7FGjmgK0uGBnTLTxGnFm1/0fYuMPKGVlL1pmA==
X-Received: by 2002:a7b:cd17:0:b0:418:fb6f:5f59 with SMTP id 5b1f17b1804b1-420fd2dd186mr31257765e9.2.1716444135435;
        Wed, 22 May 2024 23:02:15 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f759f0sm14493435e9.28.2024.05.22.23.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 23:02:14 -0700 (PDT)
Message-ID: <aced3d43-5f79-4b57-8663-5762db1ad2f6@linaro.org>
Date: Thu, 23 May 2024 08:02:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] dt-bindings: soc: qcom,smsm: Allow specifying
 mboxes instead of qcom,ipc
To: Luca Weiss <luca@z3ntu.xyz>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240424-smsm-mbox-v1-0-555f3f442841@z3ntu.xyz>
 <5780452.DvuYhMxLoT@g550jk> <12896bf6-412c-40af-9ad5-f9391ff81f63@kernel.org>
 <6253429.lOV4Wx5bFT@g550jk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <6253429.lOV4Wx5bFT@g550jk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/05/2024 19:34, Luca Weiss wrote:
> On Mittwoch, 22. Mai 2024 08:49:43 MESZ Krzysztof Kozlowski wrote:
>> On 21/05/2024 22:35, Luca Weiss wrote:
>>> On Dienstag, 21. Mai 2024 10:58:07 MESZ Krzysztof Kozlowski wrote:
>>>> On 20/05/2024 17:11, Luca Weiss wrote:
>>>>> Hi Krzysztof
>>>>>
>>>>> Ack, sounds good.
>>>>>
>>>>> Maybe also from you, any opinion between these two binding styles?
>>>>>
>>>>> So first using index of mboxes for the numbering, where for the known
>>>>> usages the first element (and sometimes the 3rd - ipc-2) are empty <>.
>>>>>
>>>>> The second variant is using mbox-names to get the correct channel-mbox
>>>>> mapping.
>>>>>
>>>>> -               qcom,ipc-1 = <&apcs 8 13>;
>>>>> -               qcom,ipc-2 = <&apcs 8 9>;
>>>>> -               qcom,ipc-3 = <&apcs 8 19>;
>>>>> +               mboxes = <0>, <&apcs 13>, <&apcs 9>, <&apcs 19>;
>>>>>
>>>>> vs.
>>>>>
>>>>> -               qcom,ipc-1 = <&apcs 8 13>;
>>>>> -               qcom,ipc-2 = <&apcs 8 9>;
>>>>> -               qcom,ipc-3 = <&apcs 8 19>;
>>>>> +               mboxes = <&apcs 13>, <&apcs 9>, <&apcs 19>;
>>>>> +               mbox-names = "ipc-1", "ipc-2", "ipc-3";
>>>>
>>>> Sorry, don't get, ipc-1 is the first mailbox, so why would there be <0>
>>>> in first case?
>>>
>>> Actually not, ipc-0 would be permissible by the driver, used for the 0th host
>>>
>>> e.g. from:
>>>
>>> 	/* Iterate over all hosts to check whom wants a kick */
>>> 	for (host = 0; host < smsm->num_hosts; host++) {
>>> 		hostp = &smsm->hosts[host];
>>>
>>> Even though no mailbox is specified in any upstream dts for this 0th host I
>>> didn't want the bindings to restrict that, that's why in the first example
>>> there's an empty element (<0>) for the 0th smsm host
>>>
>>>> Anyway, the question is if you need to know that some
>>>> mailbox is missing. But then it is weird to name them "ipc-1" etc.
>>>
>>> In either case we'd just query the mbox (either by name or index) and then
>>> see if it's there? Not quite sure I understand the sentence..
>>> Pretty sure either binding would work the same way.
>>
>> The question is: does the driver care only about having some mailboxes
>> or the driver cares about each specific mailbox? IOW, is skipping ipc-0
>> important for the driver?
> 
> There's nothing special from driver side about any mailbox. Some SoCs have
> a mailbox for e.g. hosts 1&2&3, some have only 1&3, and apq8064 even has
> 1&2&3&4.
> 
> And if the driver doesn't find a mailbox for a host, it just ignores it
> but then of course it can't 'ring' the mailbox for that host when necessary.
> 
> Not sure how much more I can add here, to be fair I barely understand what
> this driver is doing myself apart from the obvious.

From what you said, it looks like it is enough to just list mailboxes,
e.g. for ipc-1, ipc-2 and ipc-4 (so no ipc-0 and ipc-3):

mboxes = <&apcs 13>, <&apcs 9>, <&apcs 19>;

Best regards,
Krzysztof


