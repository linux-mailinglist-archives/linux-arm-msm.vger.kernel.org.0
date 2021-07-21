Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E0803D0D39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 13:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239398AbhGUKcM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 06:32:12 -0400
Received: from mail-ed1-f51.google.com ([209.85.208.51]:36462 "EHLO
        mail-ed1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239337AbhGUKE7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 06:04:59 -0400
Received: by mail-ed1-f51.google.com with SMTP id h2so1824690edt.3;
        Wed, 21 Jul 2021 03:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CsZM1CfjhLJfO+t2snLUwKYMUTmPfGepMKzYin3Vu1E=;
        b=gSVdr4TJ/lklGYfK05WidslHIgI8EkYtjmQDnbv8fvB510kE6QFaP3abr1QelJN70I
         Tdevr+Jjhb50LnrrgiHnrRgpNseF2+rExlyOxD2TqOkNJorZ2AFccDzRLPIl9sWDMC5J
         uynhOyMhczQHfNRy85xnl8vQTeuiPT4JYLVxsUIGOjTZIoce8VzLSqAQxOYEHgRPurTJ
         Zz5s0W55eyqWFltkwc/6bxwdVBiFU8l3A+vMi8HUbwO3n3IS6Y8PZC70A1BM4So3l+1O
         28TFB6Ia6FKxxcDvdG5VrosigWIOoPyCezcin1lwUDMVf08QPTNYwP6CEcsZUnuUX0yV
         HbDw==
X-Gm-Message-State: AOAM533IIp9D9kmTdGhUVdMTmWmIcb8FgwGzoM6j4mO0kd7WUvRZqVaA
        yOoJdP8cGSOXEZiS6KUweJ4=
X-Google-Smtp-Source: ABdhPJy/C2t5Jq8nueMNq08HKDpGrkfsGKnVJn4GHRfVKb7DJDMRWcKg3bmraPoKmeLkt0JQEr585Q==
X-Received: by 2002:aa7:dc55:: with SMTP id g21mr38319448edu.129.1626864335334;
        Wed, 21 Jul 2021 03:45:35 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.47.9])
        by smtp.googlemail.com with ESMTPSA id b10sm10415810edd.91.2021.07.21.03.45.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jul 2021 03:45:34 -0700 (PDT)
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Serge Semin <fancer.lancer@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        John Stultz <john.stultz@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Amit Pundir <amit.pundir@linaro.org>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-30-Sergey.Semin@baikalelectronics.ru>
 <CALAqxLX_FNvFndEDWtGbFPjSzuAbfqxQE07diBJFZtftwEJX5A@mail.gmail.com>
 <20210714124807.o22mottsrg3tv6nt@mobilestation> <YPfPDqJhfzbvDLvB@kroah.com>
 <20210721100220.ddfxwugivsndsedv@mobilestation> <YPf29+ewbrYgHxRP@kroah.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 29/29] arm64: dts: qcom: Harmonize DWC USB3 DT nodes name
Message-ID: <0064cb2c-5ca6-e693-2e89-8f045c8f7502@kernel.org>
Date:   Wed, 21 Jul 2021 12:45:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPf29+ewbrYgHxRP@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/07/2021 12:29, Greg Kroah-Hartman wrote:
> On Wed, Jul 21, 2021 at 01:02:20PM +0300, Serge Semin wrote:
>> Hi Greg,
>> @Krzysztof, @Rob, please join the discussion so to finally get done
>> with the concerned issue.
>>
>> On Wed, Jul 21, 2021 at 09:38:54AM +0200, Greg Kroah-Hartman wrote:
>>> On Wed, Jul 14, 2021 at 03:48:07PM +0300, Serge Semin wrote:
>>>> Hello John,
>>>>
>>>> On Tue, Jul 13, 2021 at 05:07:00PM -0700, John Stultz wrote:
>>>>> On Tue, Oct 20, 2020 at 5:10 AM Serge Semin
>>>>> <Sergey.Semin@baikalelectronics.ru> wrote:
>>>>>>
>>>>>> In accordance with the DWC USB3 bindings the corresponding node
>>>>>> name is suppose to comply with the Generic USB HCD DT schema, which
>>>>>> requires the USB nodes to have the name acceptable by the regexp:
>>>>>> "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
>>>>>> named.
>>>>>>
>>>>>> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
>>>>>
>>>>
>>>>> I know folks like to ignore this, but this patch breaks AOSP on db845c. :(
>>>>
>>>> Sorry to hear that. Alas there is no much can be done about it.
>>>
>>> Yes there is, we can revert the change.  We do not break existing
>>> configurations, sorry.
>>
>> By reverting this patch we'll get back to the broken dt-bindings
>> since it won't comply to the current USB DT-nodes requirements
>> which at this state well describe the latest DT spec:
>> https://github.com/devicetree-org/devicetree-specification/releases/tag/v0.3
>> Thus the dtbs_check will fail for these nodes.
>>
>> Originally this whole patchset was connected with finally getting the
>> DT-node names in order to comply with the standard requirement and it
>> was successful mostly except a few patches which still haven't been
>> merged in.
>>
>> Anyway @Krzysztof has already responded to the complain regarding this
>> issue here:
>> https://lore.kernel.org/lkml/20201221210423.GA2504@kozik-lap/
>> but noone cared to respond on his reasonable questions in order to
>> get to a suitable solution for everyone. Instead we are
>> getting another email with the same request to revert the changes.
>> Here is the quote from the Krzysztof email so we could continue the
>> discussion:
>>
>> On Mon, 21 Dec 2020 13:04:27 -0800 (PST), Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>> On Mon, Dec 21, 2020 at 12:24:11PM -0800, John Stultz wrote:
>>>> On Sat, Dec 19, 2020 at 3:06 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>> ...
>>>>>
>>>>> The node names are not part of an ABI, are they? I expect only
>>>>> compatibles and properties to be stable. If user-space looks for
>>>>> something by name, it's a user-space's mistake.  Not mentioning that you
>>>>> also look for specific address... Imagine remapping of addresses with
>>>>> ranges (for whatever reason) - AOSP also would be broken? Addresses are
>>>>> definitely not an ABI.
>>>>
>>>> Though that is how it's exported through sysfs.
>>>
>>> The ABI is the format of sysfs file for example in /sys/devices. However
>>> the ABI is not the exact address or node name of each device.
>>>
>>>> In AOSP it is then used to setup the configfs gadget by writing that
>>>> value into /config/usb_gadget/g1/UDC.
>>>>
>>>> Given there may be multiple controllers on a device, or even if its
>>>> just one and the dummy hcd driver is enabled, I'm not sure how folks
>>>> reference the "right" one without the node name?
>>>
>>> I think it is the same type of problem as for all other subsystems, e.g.
>>> mmc, hwmon/iio.  They usually solve it either with aliases or with
>>> special property with the name/label.
>>>
>>>> I understand the fuzziness with sysfs ABI, and I get that having
>>>> consistent naming is important, but like the eth0 -> enp3s0 changes,
>>>> it seems like this is going to break things.
>>>
>>> One could argue whether interface name is or is not ABI. But please tell
>>> me how the address of a device in one's representation (for example DT)
>>> is a part of a stable interface?
>>>
>>>> Greg? Is there some better way AOSP should be doing this?
>>>
>>> If you need to find specific device, maybe go through the given bus and
>>> check compatibles?
>>>
>>> Best regards,
>>> Krzysztof
>>
>> So the main question is how is the DT-node really connected with ABI
>> and is supposed to be stable in that concern?
>>
>> As I see it even if it affects the configfs node name, then we may
>> either need to break that connection and somehow deliver DT-node-name
>> independent interface to the user-space or we have no choice but to
>> export the node with an updated name and ask of user-space to deal
>> with it. In both suggested cases the DT-node name will still conform
>> to the USB-node name DT spec. Currently we are at the second one.
> 
> I really do not care what you all decide on, but you CAN NOT break
> existing working systems, sorry.  That is why I have reverted this
> change in my tree and will send it to Linus soon.

I had impression that kernel defines interfaces which should be used and
are stable (e.g. syscalls, sysfs and so on). This case is example of
user-space relying on something not being marked as part of ABI. Instead
they found something working for them and now it is being used in "we
cannot break existing systems". Basically, AOSP unilaterally created a
stable ABI and now kernel has to stick to it.

Really, all normal systems depend on aliases or names and here we have
dependency on device address. I proposed way how AOSP should be fixed.
Anything happened? Nope.

The device address can change. The node name can change. Reverting such
changes is incorrect but my arguments why we can break existing systems
who use weird, incorrect and not stable interfaces were not accepted and
I do not have anything new in this matter.

Greg,
You also did not join the discussion but use simple revert. It's not
cooperative... what next? Serge sends the same patch to SoC tree and it
gets merged and then you revert it again?

Best regards,
Krzysztof
