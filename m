Return-Path: <linux-arm-msm+bounces-58662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBF5ABD239
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 10:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 539F47A2982
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 08:43:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 808A72641C8;
	Tue, 20 May 2025 08:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z0Vw/Gvg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A226263C75
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 08:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747730686; cv=none; b=IABAu9r3SUnWqh1flWpZX3t9fEHWAXx+O3c9FwQRBTA3UtI1JXppBplACn0I/xNq+9buJeE+qArxgjNxgNkpZCI85uQxvmnLiGQd/7LmlJ1Zej5tGlPLwTzJnp9yNomVyps39gfdpH2nmHV69lSTnKFtgfdGhGR7HokcQ9OJPYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747730686; c=relaxed/simple;
	bh=0Xj5LvDMQmjQ3ns62cVS3HXkgT/48XqUKBDRmHe1VEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MrJPgXb+CDKC5j8xabhXWdZGLPTdNGqLSJY/en/PjRsv1jpGAPiH9Oi/DgK6j/47ESnIGNH33cehIbaHkOGPofwBmZE3yNhLQGsM0cwyebFW8EpBmJOjrXy9NiUbY+lUo15B5tB7aG535E0iOfu/emdQ6gGOZ5iOmbW4ypyVtEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z0Vw/Gvg; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so57968775e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 01:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747730683; x=1748335483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yWeDYPzer5lvmBWhpmwPGHZjl/AR9knlnJlWeNFa6z8=;
        b=z0Vw/GvggXMPg5Tb7PfNlyIZwPymP/sKOoMu8WZ2eMbyNYg7fiskP31/hH9+eV6Ngn
         +z5n+YmFDLJVS2IYejKgoculwr2ItvEz5K6GEymJM9TGr4JDJ+cg6+RiKvk+u4dfLUht
         3GvL+m8tmAdG7LQR+eJOpgL4wdt7tOZvwLEzYir+dOcEFmWqJy260+iAgfa1jr4aMhrK
         ZA+ZSXxneX8U9n03i6Y0ZI6lLCWDDur2Dx4KXLzkGTwWaOyjiaX/0Ooow8Br5U9Z8WGM
         8sGhZk+PeJx6g561GNwNAopYpF5G19HlQ6fW9G0jY3PDZGOhUkQzEERHyjhgOSMIgSBH
         QutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747730683; x=1748335483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yWeDYPzer5lvmBWhpmwPGHZjl/AR9knlnJlWeNFa6z8=;
        b=D405oV4VhF7vJmPFDlZSfSl3mA7mcOVaHw668GSffxrQLNL8YiKsFEpxkitYbB/GCk
         L1TPErcKKYRkJ0VfbRuWuapJXcNkkS5p6qnd/Z6huMC2xm85sVWICmO76L9R4NCRkrkr
         00qMpHM5B5szzzlwKJnGG7M4hqbUqpO8yDGt1mE/FGzDKNfKQLqQvefnoJbJ6nBEHy0x
         rWURrRoew+Y9YS+N18Bg1Oh0ygXvi4boRSTVznb1PwDGe3UWjIv+WQ1uy/h2lu9KPw6H
         I3nmGkKbYEeTxsvDK7P9Aie/nRSsB4tq1JWEYGTo6zwKgz6mSBpcAeJYy3TFAnOUlJms
         DVgg==
X-Forwarded-Encrypted: i=1; AJvYcCXqeDet6x3SIzV4Ojnkff65wzEMfaSCXNkEfu9+odkZCul1Cph/jGR1XoliOYROh6rpo6emFZUHrlAmD4dr@vger.kernel.org
X-Gm-Message-State: AOJu0YxbXMuiuOLvX0/7TOkk3X8m61kPDhsQ/4LsDaowWawg8Eug5uBv
	t8B66HJGmmnBwpnkscCdc7Xq6x/zkG5T1CMEvglOCc12/8u8EUl3UNso4zbG0KvE+3hzAfbDZLz
	naSIeQUc=
X-Gm-Gg: ASbGncsu7KT0uh3alz0UkB1tD65knryUnMGW75Sb3WJ8lV/Zl07nM+nLgmE0WS/93rj
	i34sP4h5qqMFeoUagd6q2iasrih8+c6wqNAYAzX6+JnQn69faLFK+1cLlGZNcmfaqdE1uQCxzPQ
	sq9Gv7e5oxL+RVkSRwHlcXS5FJYPWWnjBWoUKgMe3fTzYKDedcPcgvhzAUtXG3v1lLDY4HtJpVT
	WDEWBYvYCHaNgX/P2OP9YxGANYTtM/ArQLJG1kZ6pGyTi140diz2TX0gdfbssUOjvyzwXLj2Z8r
	exB30RhmRr3tJpLe+0yfaAlxEPK9aGfm6tpDFFR5TK+DyQcR5AkpMCevdO+1gFuIZgHea8yuXaM
	7PwN/ndZcU7TUqisOAcjOpWUKNrE=
X-Google-Smtp-Source: AGHT+IF6NhADUfXiocDJ+6PeTfYhBqXsTDb3TbAMg5ZVulgBv551nMiYfKj8WbDC+p8XrLioJ6C1Bw==
X-Received: by 2002:a05:600c:1e1c:b0:442:c98f:d8cf with SMTP id 5b1f17b1804b1-44302934f7bmr139974495e9.16.1747730682773;
        Tue, 20 May 2025 01:44:42 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d4b68sm21711235e9.23.2025.05.20.01.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 01:44:42 -0700 (PDT)
Message-ID: <f4de3ab5-b40a-4d87-916b-8d1a1fb607b2@linaro.org>
Date: Tue, 20 May 2025 09:44:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe: Stop spamming logs with
 version
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Johan Hovold <johan@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250429180828.950219-4-krzysztof.kozlowski@linaro.org>
 <aBHQejn_ksLyyUm1@hovoldconsulting.com>
 <3e34ce09-1207-4dba-bff8-38c01cad9b78@linaro.org>
 <4d942a6c-cbff-41ac-af8b-12a1ff5181aa@linaro.org>
 <883eb54a-fcaf-443c-a4d7-e1278fd43f5a@linaro.org>
 <ea9f570c-b135-4a98-91ea-ceeb2f48a0e5@linaro.org>
 <aCw09Vci12txhYj-@hovoldconsulting.com>
 <190100e7-8a59-4cf3-8434-bcb6292cacb2@linaro.org>
 <aCw78CRda6VS6ost@hovoldconsulting.com>
 <8a2f2269-d07f-42b2-ab6c-dcff30a1f431@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <8a2f2269-d07f-42b2-ab6c-dcff30a1f431@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/05/2025 09:30, Krzysztof Kozlowski wrote:
> On 20/05/2025 10:23, Johan Hovold wrote:
>> On Tue, May 20, 2025 at 10:02:32AM +0200, Krzysztof Kozlowski wrote:
>>> On 20/05/2025 09:53, Johan Hovold wrote:
>>
>>>> Spamming the logs as the driver currently does is clearly broken and
>>>> should be fixed. Keeping a hw version dev_dbg() is generally perfectly
>>>> fine, though.
>>
>>> My main argument, expressed in the commit msg to which no one objected,
>>> is that this debug is 100% useless: deducible from the compatible,
>>> always known upfront, always the same.
>>
>> To me that deduction does not seem straightforward, at least not without
>> access to internal qualcomm docs, for example:
>>
>> 	compatible = "qcom,sc8280xp-camss";
>>
>>          qcom-camss ac5a000.camss: VFE:0 HW Version = 1.2.2
>> 	qcom-camss ac5a000.camss: VFE:1 HW Version = 1.2.2
>>          qcom-camss ac5a000.camss: VFE:2 HW Version = 1.2.2
>>          qcom-camss ac5a000.camss: VFE:3 HW Version = 1.2.2
>>          qcom-camss ac5a000.camss: VFE:4 HW Version = 1.3.0
>>          qcom-camss ac5a000.camss: VFE:5 HW Version = 1.3.0
>>          qcom-camss ac5a000.camss: VFE:6 HW Version = 1.3.0
>>          qcom-camss ac5a000.camss: VFE:7 HW Version = 1.3.0
>>
> 
> I understand that deduction is not straightforward, but it is also a
> fixed one, meaning it will be always sc8280xp -> (vFOO, vBAR), thus the
> only usefulness of above is to map each compatible to pair of two HW
> versions. This can be done via debugfs interface once and stored in
> public docs. No need to do that mapping every time driver probes and my
> patches drop nice chunk of code, including indirect function calls.
> 
> At least so far no one objected that same compatible maps to same pairs
> of HW versions.
> 
>> Whether the hw version is actually useful to anyone debugging this
>> driver I can't say, but keeping it printed *once* seems perfectly
>> alright if someone wants to keep it (e.g. as we have a long history of
>> working around hw bugs based on revision information like this).
> 
> Now if you claim that one needs access to qcom docs to deduce it, I
> claim this version would be useful only to qcom people (or
> qcom-NDA-access-to-HPG) folks.
> 
> 
> Best regards,
> Krzysztof

I find the debug prints useful in that I know the hardware block has 
been powered on, clocked etc. I agree the number of those prints seems 
excessive.

The reason it is printed out multiple time is the blocks get powered on/off.

Personally I agree with Johan - it would be nice/useful to print it out 
once with DEBUG on, so that we know we have successfully powered-on and 
identified the blocks once.

Doing it over and over again is excessive as failure to power-on will 
surely produce error messages anyway.

---
bod

