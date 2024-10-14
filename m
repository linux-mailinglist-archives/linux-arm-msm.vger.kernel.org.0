Return-Path: <linux-arm-msm+bounces-34331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F9D99CAE4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 15:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 485E11F21BCD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 13:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20FEB1A7AE3;
	Mon, 14 Oct 2024 13:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="FOXrXD9Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22ED16190B
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 13:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728910899; cv=none; b=PmY7C/1n+KNYXVYul/YKPxSrl6zZZZaKZKxxZCbaSvFrJtllCd8cHKqWcYeEG6RSkgRR5h42PDKhDDbbwwuXqUgRYRX9x/rhcE8EYhy1+EBKKf6mFHNAsTxemmWBImRQl5JnssyJete/FcEyaEIFFRcA5WfXIKIMNgGGy9jKpB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728910899; c=relaxed/simple;
	bh=++dcIeDFDIn2Ao7fa3l8I6kCkaljhMOysKS1UQX8IyI=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=BFLXHkZgdXpaslCpYXkfNokpmksW4UuZkBBLbXA3s6ueiZLGPf6achS4PQJJo6+e7x6Lyfz8JVy0SKC6ha7nX2Kz/+0LsHrUZFFvdRVC6dB15owBjDdG3z5ItMT6pKGqsYpL/pTJyg8NIxYn70pgSNID+mfVNGbf08p5gaP5wFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=FOXrXD9Y; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7b111003738so356471685a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 06:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1728910895; x=1729515695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9RHxE4BwKc3ZjDQztQ5oMassHpRi7zp5cvhCSidmTTk=;
        b=FOXrXD9Yi/AC4n/KEvhIWyGLWXnG4sepYNGZby9xrlR/v6XwIcOI/iIzL5e7NUrcDu
         ILAh2+lJTnxrJ4cmTobwt/sXB8MB1JzuHRpIP4jzsYED1gIFKzHNPkcQ9L2x+m4cBF7u
         kXArpHKo48BKhUVTU74QM8XdLSnEcs0kEQNbRx5W05zNWhPoDH3CEK9chaS88bZcCUUQ
         eSc8iGcC443wWVUiqtHrxNE+Ib/520SZWzQFyd71tQTV+EYF1pqAqM4FPaSORewwOits
         zH7x7SvRNAtbtwgObgnv6RlD1Ro8mDXoBymEsI8ZIGZFX1NFCxakc8nnApFmwV2wNX0T
         UQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728910895; x=1729515695;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9RHxE4BwKc3ZjDQztQ5oMassHpRi7zp5cvhCSidmTTk=;
        b=cIHP4F85Ifxe1zxhFtmr65fKgNzmRtvQy9mXFFiPrOAX/k7+L0tPIgwaqIFzspe17Q
         xOWHXzbDSN44sWt/320FU2YYSkDYyFpiCkOwiUpFQEdepVqHvRteZyHacE9zcSDu9KMr
         +h+JuNJUWFOQi/VfQ3+mdV1pZjnkk0P5Hl+75sKOE4XH/aprpC09iI+EHLftW3L+7W/7
         wqeSMTuYgQ6kPoRYsP7ylWr6/hOglBFuo4ORrOBsyjjZB5MOY7Lf7Lpv5zxN09DW53w1
         XTutPDg9MNcLegK7j25mpUriQj8nubxeX1j5YZfnh0NcP5Jk5EAEZVfpQOxpjr+AEyPb
         Zftg==
X-Gm-Message-State: AOJu0YwTQVM8CT6iZujsLDJKQWshzzbia4E5uKb426buLgYZmoOc/f8i
	wS5oROGck6kkMjsFedakF8OJI9r84LYdWYvRxEMERQ1XmpGVsluGk/9FMM6Jhp8=
X-Google-Smtp-Source: AGHT+IGh0QuJA6b0OOwNfoiRKhU3ExuhAHzAqesdDNj776vJw3RQWyW54B6RNyGsIvJBrvQs2fM8Ww==
X-Received: by 2002:a05:620a:190f:b0:7ac:a077:6a1e with SMTP id af79cd13be357-7b11a352f87mr1621830785a.9.1728910895574;
        Mon, 14 Oct 2024 06:01:35 -0700 (PDT)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b11497d799sm413618885a.117.2024.10.14.06.01.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 06:01:35 -0700 (PDT)
Subject: Re: [PATCH v2 2/5] dt-bindings: rtc: qcom-pm8xxx: document no-alarm
 flag
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Satya Priya <quic_c_skakit@quicinc.com>,
 "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20241013051859.22800-1-jonathan@marek.ca>
 <20241013051859.22800-3-jonathan@marek.ca>
 <gpika7a5ho36gx3pz7k5t4rz5spvpnmnvzs277r64z2npdmfmg@4vcmw6x5zvwn>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <f3b4bb12-d025-1cc9-6dbd-04913b951425@marek.ca>
Date: Mon, 14 Oct 2024 08:58:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <gpika7a5ho36gx3pz7k5t4rz5spvpnmnvzs277r64z2npdmfmg@4vcmw6x5zvwn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/14/24 3:34 AM, Krzysztof Kozlowski wrote:
> On Sun, Oct 13, 2024 at 01:15:27AM -0400, Jonathan Marek wrote:
>> Qualcomm x1e80100 firmware sets the ownership of the RTC alarm to ADSP.
>> Thus writing to RTC alarm registers and receiving alarm interrupts is not
>> possible.
>>
>> Add a no-alarm flag to support RTC on this platform.
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
>> index d274bb7a534b5..210f76a819e90 100644
>> --- a/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
>> +++ b/Documentation/devicetree/bindings/rtc/qcom-pm8xxx-rtc.yaml
>> @@ -40,6 +40,11 @@ properties:
>>       description:
>>         Indicates that the setting of RTC time is allowed by the host CPU.
>>   
>> +  no-alarm:
>> +    $ref: /schemas/types.yaml#/definitions/flag
>> +    description:
>> +      Indicates that RTC alarm is not owned by HLOS (Linux).
> 
> This is not even properly used/tested, because you disable the RTC
> entirely in your DTS.
> 

What? The next patch in this series is enabling RTC on x1e using this flag

> I expect here unified property for all Qualcomm devices for this case.
> We already have "remotely-controlled" and other flavors. I don't want
> each device to express the same with different name...
> 
> Also: missing vendor prefix.
> 

I don't care what the property is named (as long as its a bool 
property), if you have a name you prefer I will use it.

The existing 'allow-set-time' property (also related to HLOS permissions 
to the RTC) is also specific to this driver doesn't have a vendor prefix.

> Best regards,
> Krzysztof
> 

