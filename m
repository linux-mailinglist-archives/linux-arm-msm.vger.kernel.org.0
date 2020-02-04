Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B49C11523A0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 00:54:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727706AbgBDXyD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 18:54:03 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53371 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727461AbgBDXyD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 18:54:03 -0500
Received: by mail-wm1-f67.google.com with SMTP id s10so450166wmh.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2020 15:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cvoP7lZgiwSyZwuJ6SgoCnR+QwZx+ZUXmOk9VybwWHc=;
        b=TLCMKNZ0axj3G166T58C7Sp4+/lPY9ERE4TqklTXOUd1T5UYNseLgzUkR0vgGtRRkV
         kNcrF2cDKVlBBGtuMpbLwkXyOb8rZRQ6y2dPEwbpQ9bIE3kajAlVA3soOdK1lNyjlrDA
         WGJmxCrJvnt30F5kraxb7BbzIaP0m/IL9zTm+GVXjdSqyskpvlTiDbNQjzQbgt5ij25d
         w3M8iG8ti11aQeSWIHyxkmRuA4R5EZ217lUskN7dfSjSZxeohHZGcW4Y+ZhTLDIvlMz0
         K6YpG1C+DDO60oNVoj0oh9NOgECcCj4m89UEzBf0vUmNlq3l86Zk2OpU9vUSzqv85j8q
         7oSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cvoP7lZgiwSyZwuJ6SgoCnR+QwZx+ZUXmOk9VybwWHc=;
        b=uBCGh2+c/Frq5HHjruhM5gBojV0eJibNYZfESXgOGOc8EirL3esaL7+K153AZS7oTk
         SUd7LqV5jXKi8TtdU9P8BffR0ywADZZ7GRbBOTNvBfditUhT86a9mT0SJgJfX4QPrmmm
         RFzlplqeZp1e59eBJHtjU+6hd7tFAcjvNz1acg8F0sSdaSj1T2bKceWf0qA9IakT8lyE
         vhWAYfq29WCft4S1OJe1u5iDZbk/tZZgByn9uKDzyKJIXL3Rw/orgQsIl2LwcRLSD+ye
         C3rdj73yNrTtp2xMmTr1qs3CfrUSC9KYYrP9midvXDlkqcQY470nhYfigX/At0yHZ05G
         /i+w==
X-Gm-Message-State: APjAAAW7Dad7cCu9eClusa+UQ0QgOBno9/GOChuoQV/kFNlhhFcDxKn6
        W2p45ta4kocHq71Sq+aX71mweg==
X-Google-Smtp-Source: APXvYqyOXzkai8qWgypxtKPWk6WKI4lwtfqFxlYd+cqmJP1x94P3MZO3zqLYUDXUsWBTP/ztsSlKnA==
X-Received: by 2002:a05:600c:20f:: with SMTP id 15mr1491633wmi.128.1580860440987;
        Tue, 04 Feb 2020 15:54:00 -0800 (PST)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id d204sm5718653wmd.30.2020.02.04.15.53.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 15:54:00 -0800 (PST)
Subject: Re: [PATCH v3 06/19] dt-bindings: usb: dwc3: Add a gpio-usb-connector
 description
To:     Rob Herring <robh@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
References: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
 <20200122185610.131930-7-bryan.odonoghue@linaro.org>
 <20200127184347.GA27080@bogus>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <25c146fd-26f9-dee5-a693-45cc5774dbef@linaro.org>
Date:   Tue, 4 Feb 2020 23:54:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200127184347.GA27080@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/01/2020 18:43, Rob Herring wrote:
> On Wed, Jan 22, 2020 at 06:55:57PM +0000, Bryan O'Donoghue wrote:
>> A USB connector should be a child node of the USB controller
>> connector/usb-connector.txt. This patch adds a property
>> "gpio_usb_connector" which declares a connector child device. Code in the
>> DWC3 driver will then
>>
>> - Search for "gpio_usb_controller"
>> - Do an of_platform_populate() if found
>>
>> This will have the effect of making the declared node a child of the USB
>> controller and will make sure that USB role-switch events detected with the
>> gpio_usb_controller driver propagate into the DWC3 controller code
>> appropriately.
> 
> This is all driver specifics. This is a binding patch.
> 
>>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: linux-usb@vger.kernel.org
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/usb/dwc3.txt | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
>> index 66780a47ad85..b019bd472f83 100644
>> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
>> +++ b/Documentation/devicetree/bindings/usb/dwc3.txt
>> @@ -108,6 +108,9 @@ Optional properties:
>>   			When just one value, which means INCRX burst mode enabled. When
>>   			more than one value, which means undefined length INCR burst type
>>   			enabled. The values can be 1, 4, 8, 16, 32, 64, 128 and 256.
>> + - gpio_usb_connector: Declares a USB connector named 'gpio_usb_connector' as a
>> +		       child node of the DWC3 block. Use when modelling a USB
>> +		       connector based on the gpio-usb-b-connector driver.
> 
> Should be just 'connector'. That's already implicitly allowed for any
> USB controller, so you don't really need a binding change. And the
> specific type of connector is outside the scope of the DWC3 binding.
> 
>>   
>>    - in addition all properties from usb-xhci.txt from the current directory are
>>      supported as well
>> @@ -121,4 +124,12 @@ dwc3@4a030000 {
>>   	interrupts = <0 92 4>
>>   	usb-phy = <&usb2_phy>, <&usb3,phy>;
>>   	snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
>> +	usb_con: gpio_usb_connector {
>> +		compatible = "gpio-usb-b-connector";
>> +		id-gpio = <&tlmm 116 GPIO_ACTIVE_HIGH>;
>> +		vbus-gpio = <&pms405_gpios 12 GPIO_ACTIVE_HIGH>;
> 
> *-gpios is the preferred form and should be what's documented.

Hi Rob,

If I've understood you right here you don't favour documenting a new 
binding but you're OK with adding an example ?

---
bod

