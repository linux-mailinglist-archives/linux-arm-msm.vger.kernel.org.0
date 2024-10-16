Return-Path: <linux-arm-msm+bounces-34589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3489A0B25
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 15:15:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEF86283BF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 13:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ACB21534E9;
	Wed, 16 Oct 2024 13:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="Lw5HtMEg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633A71EB5B
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2024 13:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729084538; cv=none; b=X96AeZOSLaRYkyW/w2+I5KBqdtV1ESsj+AkjBQnidVD2j3I2k0FbhBGk9FrttcbsOQkC/Oj+SkQoQrQoovOf0PQ+KdgxVdMuTQSv2n1po3Fx+Aq7TB8DpRc6VNFucrAG0aVDllFYEoNCvXrGepAOSmnaRHeiAxDfFZl9/e8soJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729084538; c=relaxed/simple;
	bh=pbHJdYq3Cl6bsiTqD2H2t0/S+/hLDft0ZLgCKnlO4+U=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=OyM8Qy7gViORCLYCFDGVjovh7Do3ac5k5Gbw6fpSFdyWyqzwH2OQwemPX0QGGxLYmIQJw7zCDP3MBWz0Ikpr1ppRQz9otxLa20/XLjv1mBo6R55uMgvGm+I0W1AZ9sWFhkahkbfpCcdfIrAV0vcYK3L7mrIYH6mRd3zHKxoJEKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=Lw5HtMEg; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b115d0d7f8so79849085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2024 06:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1729084536; x=1729689336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pnXUgF95/LKVBB0GjZAyL4bfQKFXiH3SHgWxlYsd26k=;
        b=Lw5HtMEgtKKgdH4eyuePsNtzM375boN+RAI5i+ophGeBNWrJF0qRGUN19VTE56a1O9
         +tU4X6ad7Y8CR4n4zf2uiTb8RwmVFPIS/9Pbsofh5T2d415gyyjC3gkwMLmILDJZqHhJ
         dnHATqJ9fpM/jlRmZ7EeqZZI0Yrmis2z4P9zi4mBDIbrWNhy5sB7Woww6JDCI3TPZVVv
         xx3RKlg8NyXFGQathvxiX4G13A5AdXzbkOFlDzt0c/0t4udC+LPDc4wTox/f28OxkD6A
         i36iIwCObRlh61WxD7wDGeRZGQ6+2Hv1cirWhL26pbhkBvn1RCISgLN27Sr1RUn/1YM9
         lGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729084536; x=1729689336;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pnXUgF95/LKVBB0GjZAyL4bfQKFXiH3SHgWxlYsd26k=;
        b=H2miqw07xz56vFw/F8yF9acBlvaHru2VwvcWsx41trNJ9ib/qgExSj3bUypGAHRrpE
         Y88vunbto2CChYhlMJuN8NOWxGgm99c82KI9GBzKmBOGiwAmmp2nbOnE5aO3k8b6eXn6
         xVmnLsxbwWXWflPovS6M5Hfcdn7ft9a+90ngOZZUq84XmqfC9NAeO9IFnlPJHgxHEfEO
         f0eunJBHUryNslJAcLN426OHif91GcUa8qL/BnbyMgYAlKMh/UsgivFEUAI2hvriCHHs
         daB6TDLA8MYSqHodlR4Eb5kDElGZmwQEwHpKhq1392gY1LzRU3Olo6z63t3w417/KoGP
         VITw==
X-Gm-Message-State: AOJu0YzieJlAzWqRubEFVxzZ5+g/Mhd3jUVqnYX9knfblqOokcIDJDmN
	ptjWWTkEJc2Ne3SzIZnqrE1xSHgnln3wXt+PVImn/ZvgUdiGzvqeQe4SEAJ6/eI=
X-Google-Smtp-Source: AGHT+IGS5fUx6e6JC++mu954E0arTgZMh5pUZB0wjKyczky28hg9nAS8gt4UigcgEiM5CHpaQq/Idg==
X-Received: by 2002:a05:620a:29c3:b0:7a9:ae0c:b6d5 with SMTP id af79cd13be357-7b11a3792b9mr3022886585a.9.1729084536316;
        Wed, 16 Oct 2024 06:15:36 -0700 (PDT)
Received: from [192.168.0.189] (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b1418e4725sm127984985a.125.2024.10.16.06.15.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 06:15:35 -0700 (PDT)
Subject: Re: [PATCH v3 1/5] rtc: pm8xxx: implement qcom,no-alarm flag for
 non-HLOS owned alarm
To: Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20241015004945.3676-1-jonathan@marek.ca>
 <20241015004945.3676-2-jonathan@marek.ca>
 <Zw9gZkLPMB9ZBQlh@hovoldconsulting.com>
 <682acd15-58c5-6bdf-f913-0940a2733451@marek.ca>
 <Zw-5TA9SZtZ_gSIP@hovoldconsulting.com>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <8c8df288-cb8c-2e59-a570-e8dcf39a367f@marek.ca>
Date: Wed, 16 Oct 2024 09:12:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <Zw-5TA9SZtZ_gSIP@hovoldconsulting.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/16/24 9:02 AM, Johan Hovold wrote:
>>>>    	int alarm_irq;
>>>>    	const struct pm8xxx_rtc_regs *regs;
>>>>    	struct device *dev;
>>>> @@ -473,9 +474,14 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
>>>>    	if (!rtc_dd->regmap)
>>>>    		return -ENXIO;
>>>>    
>>>> -	rtc_dd->alarm_irq = platform_get_irq(pdev, 0);
>>>> -	if (rtc_dd->alarm_irq < 0)
>>>> -		return -ENXIO;
>>>> +	rtc_dd->no_alarm = of_property_read_bool(pdev->dev.of_node,
>>>> +						 "qcom,no-alarm");
>>>> +
>>>
>>> Stray newline.
>>>
>>
>> That's not a stray newline?
> 
> There was no empty line between the assignment and check before this
> change, but now there is even though there should not be.
>   

There was no empty line between the "alarm_irq" assignment and check, 
and there still isn't. That empty line separating the new 
of_property_read_bool() line.

I could move both of_property_read_bool() lines together to make it look 
better.

>>>> +	if (!rtc_dd->no_alarm) {
>>>> +		rtc_dd->alarm_irq = platform_get_irq(pdev, 0);
>>>> +		if (rtc_dd->alarm_irq < 0)
>>>> +			return -ENXIO;
>>>> +	}
> 
> Johan
> 

