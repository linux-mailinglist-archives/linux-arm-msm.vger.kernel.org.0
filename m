Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E611C32DA73
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 20:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237786AbhCDTeL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 14:34:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46507 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229558AbhCDTdq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 14:33:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614886340;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wrPAflFGNHOXutzM/wry07r42DdisR9sPKXbgj55UKc=;
        b=izg/ZaJAwHgeeIDLYrpX6P/WVeB09cmVt18DqlXIdI4tinvczLChjtD7WoDNwbOfjsb38Q
        1R2GUnhg2E+QNXPTRSulypgaNDCsrrcjE5VCSMadRlzU0DoWf7chwJhhxn0GI1KpYmbF4w
        eDTNzVDzeIJXpd4+1TGsK3VNL0ekUR4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-a9KfA5FbOxezgprhVgZDgg-1; Thu, 04 Mar 2021 14:32:18 -0500
X-MC-Unique: a9KfA5FbOxezgprhVgZDgg-1
Received: by mail-ej1-f69.google.com with SMTP id v19so4578721ejc.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Mar 2021 11:32:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wrPAflFGNHOXutzM/wry07r42DdisR9sPKXbgj55UKc=;
        b=dlQNm9rjm0+oAP++boAwcMWdyPFL6ZxGJg99cf2UlbcraHdj9utrq4pf/vWYMs3vpW
         iX0ccygGHoQ5wgUN2cXPgI465l/pn0QkVbdzZ/o0KvNJUFKV66uq5ZQ0JD4Yn/X+XjkH
         U1MrdT0aP9VTrbMpkC9b3TLTf1khppRJY32vuBj0HHlFgyJ6OCFDumiof0hbJ3mBeVOz
         vJjJXe/F/ZlBfpgUQHhytC1c8oOHICjhFjh3ITXWnubkQLsDcmyyN7NVOnRFnpQYTae0
         MESWPTXFOGIYazvZlRdq8hE8aTGGR5LzwLX3kr3F2sWQQYoI5SpUH2C+2YQXVj/9JFc9
         M7bw==
X-Gm-Message-State: AOAM530DbKlPOq4x09dEnbOZLqMKYb/um58LLhX9PKSwncq4VUcpnYzL
        BrtCejPQGaVxYr3A9tnpeS0mv1Cwyt55MLoEeNzjy6CLs9r19IfEM+sd5KXRFzack3MxR0HVtuB
        novGpgVoNp5+3afrn2Udb0Q0+XmPI8wnRxWNnt5sg8dHCiM9qyXSAet4XUNLx9/V7gf20ac2gZZ
        D1Hw==
X-Received: by 2002:a05:6402:646:: with SMTP id u6mr6302910edx.250.1614886336810;
        Thu, 04 Mar 2021 11:32:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyuucKpF2WrPMi/NcdJCn1dAHIe6ryR+51VfWliz/aifrAH633s+zLkKmPjsJM9f4VsLejYqQ==
X-Received: by 2002:a05:6402:646:: with SMTP id u6mr6302888edx.250.1614886336593;
        Thu, 04 Mar 2021 11:32:16 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id u14sm119725ejx.60.2021.03.04.11.32.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 11:32:15 -0800 (PST)
Subject: Re: [PATCH] gpiolib: acpi: support override broken GPIO number in
 ACPI table
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Shawn Guo <shawn.guo@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20210226033919.8871-1-shawn.guo@linaro.org>
 <YD9bQXBD+9k3Lf/4@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2ed0d4dc-2756-9a55-3f54-1377732e35fc@redhat.com>
Date:   Thu, 4 Mar 2021 20:32:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YD9bQXBD+9k3Lf/4@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 3/3/21 10:47 AM, Andy Shevchenko wrote:
> On Fri, Feb 26, 2021 at 11:39:19AM +0800, Shawn Guo wrote:
>> Running kernel with ACPI on Lenovo Flex 5G laptop, touchpad is just
>> not working.  That's because the GpioInt number of TSC2 node in ACPI
>> table is simply wrong, and the number even exceeds the maximum GPIO
>> lines.  As the touchpad works fine with Windows on the same machine,
>> presumably this is something Windows-ism.  Although it's obviously
>> a specification violation, believe of that Microsoft will fix this in
>> the near future is not really realistic.
>>
>> It adds the support of overriding broken GPIO number in ACPI table
>> on particular machines, which are matched using DMI info.  Such
>> mechanism for fixing up broken firmware and ACPI table is not uncommon
>> in kernel.  And hopefully it can be useful for other machines that get
>> broken GPIO number coded in ACPI table.
> 
> 
> +Cc: Hans.
> 
> Hans, would appreciate your opinion on this thread. Maybe I'm mistaken in my
> conclusions.

So I've read the entire thread here:
https://lore.kernel.org/linux-gpio/20210226033919.8871-1-shawn.guo@linaro.org/T/#u

And I agree wih Andy, this is not something which should be fixed up in the
generic gpiolib-acpi code.

Note that we have similar things going on on x86 platforms. There are cases
there where there are e.g. holes in the GPIO ranges advertised by the Intel
pinctrl drivers. And in the beginning as i2c (and thus GpioIRQ) HID devices
started to become more common there were also several rounds of work to make
sure that the GPIO numbering (per ACPI-device / island) exported to the rest
of the kernel (and thus to gpiolib-acpi) matched with the numbering which
the ACPI tables expected (so the numbering which the Windows driver use).

It seems to me, esp. in the light that there are a lot of "crazy high" GPIO
indexes in the DSDT of the Lenovo Flex 5G, that the right thing to do here
is to fix the qualcom pinctrl/GPIO driver to number its GPIOs in the way
expected by these ACPI tables. This will break use of existing devicetrees,
so it will likely need to detect if the main firmware of the system is ACPI
or DT based and then use 2 different numbering schemes depending on the
outcome of that check.

Please also do not try ti fix this with some quirks in e.g. the i2c-hid driver,
I will definitely NACK such attempts. From what we can see now any fix clearly
should be done inside the qualcom GPIO driver.

Regards,

Hans

