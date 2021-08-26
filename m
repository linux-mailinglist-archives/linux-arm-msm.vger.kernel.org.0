Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BEF13F8325
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 09:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240087AbhHZHbN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 03:31:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239566AbhHZHbM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 03:31:12 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A192C061757;
        Thu, 26 Aug 2021 00:30:25 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id ia27so4126843ejc.10;
        Thu, 26 Aug 2021 00:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Bdj/wusn1eXQqZxo/AC5e0eJbPu8MDy46PFfyqFnyE0=;
        b=kw7Ghli/l5oFHFnq3YP9fqaC5+U2Xf0DazLfpIQsKlc/EFKEL4AuwyfOQRSohx2X/U
         taY9NlXWRGfc7R1Syb7NJSCLqp4J/TKd0DKsTFC1va7USa0gbFliu3BIjj6g9KqUhTP6
         jxqa/37YAcOAZ8jydG27Px5rJzea1A43K4LocyaYLFGJ4L+uKVV+ZvChh6WoXJe2fmM3
         5f9KqknTQf6OwyhlAi0T/LjXsrryXTjdmtx/R8kTrg3JAlgbCnCBURLJZ23U8SjNB3iz
         itv7bwkpd6MMeGGeIGvZhqNNXU64TnlMVXkhaOc3l2Agzzg11//GENe7V5pkQuTOBcXw
         pluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Bdj/wusn1eXQqZxo/AC5e0eJbPu8MDy46PFfyqFnyE0=;
        b=f6hSozJDkOjjhNPzX3oLT5ghbo3LXqOm2Y6kzs/bqeB6KthCLC/OA5ZgU8fw2Rone8
         g7TnRdfEMxk+Jxf87kPWgxbkSey4cBAe0aaaYeu1slJNsfsquulb6TGxtppE+wmSM2BQ
         i3OUtsO20VMiXNwqbSdfUNCsJmf3pkxDgdTdv42ZaNBZjWr4cv31AdmTVI4akNWxtcr8
         igCOT2Ff3Wty71nQxeTIXuVyyh8HZxEwsJCfVPseBN83TlUCuCHGuGl96xFBzSaGb1LT
         nq5aICm2psyJUNusaVLuiR7mMpZe96LuXj9Am2tG5ze8JX+Cx1aAyGVlRNtTj90sWMJb
         32Xw==
X-Gm-Message-State: AOAM531c9bGooUSTkebxo3pqt5rRv3ThRcJ0hu9dMSHyCJMBAoy3uuGG
        4E/0iVjzMhyKDWwnevDxug0=
X-Google-Smtp-Source: ABdhPJxWCB38upxidksY0zsnHFL9P+CJlmX+De1yDcZk57fI5oW/4rWYoodAOBd/Co8WoJo/qGykzg==
X-Received: by 2002:a17:906:f987:: with SMTP id li7mr2813549ejb.238.1629963023963;
        Thu, 26 Aug 2021 00:30:23 -0700 (PDT)
Received: from ?IPv6:2001:981:6fec:1:eee1:c96e:7429:5eb1? ([2001:981:6fec:1:eee1:c96e:7429:5eb1])
        by smtp.gmail.com with ESMTPSA id gz22sm891090ejb.15.2021.08.26.00.30.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Aug 2021 00:30:23 -0700 (PDT)
Subject: Re: [PATCH v10 0/6] Re-introduce TX FIFO resize for larger EP
 bursting
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Pavel Hofman <pavel.hofman@ivitera.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "agross@kernel.org" <agross@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "frowand.list@gmail.com" <frowand.list@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "jackp@codeaurora.org" <jackp@codeaurora.org>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>
References: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
 <6e8bb4ad-fe68-ad36-7416-2b8e10b6ae96@gmail.com> <877dhev68a.fsf@kernel.org>
 <cca69e90-b0ef-00b8-75d3-3bf959a93b45@gmail.com> <874kchvcq0.fsf@kernel.org>
 <e59f1201-2aa2-9075-1f94-a6ae7a046dc1@gmail.com> <8735raj766.fsf@kernel.org>
 <b3417c2c-613b-8ef6-2e2d-6e2cf9a5d5fd@gmail.com>
 <b3e820f0-9c94-7cba-a248-3b2ec5378ab0@gmail.com>
 <d298df65-417b-f318-9374-b463a15d8308@ivitera.com>
 <a7d7f0dd-dfbb-5eef-d1da-8cbdab5fc4a7@gmail.com>
 <c4e29ac0-1df1-3c64-1218-3687f07e7f77@ivitera.com>
 <1fb52c92-9319-c035-722f-695ab34723dd@gmail.com>
 <702c72cd-40e4-e641-797a-764e7e611afb@ivitera.com>
 <CAHp75VeZBLgf8YhEjdOV1Hva_dJh_=VHRGyVb=r44yh-9n+F4A@mail.gmail.com>
 <d1fb0ad5-e304-8864-a2e4-42d5f652a6a7@ivitera.com>
 <7ad8b755-1fa0-3be4-3f2e-a4d95858e450@synopsys.com>
 <c84135c3-c730-208b-dde8-916c7bde1d73@ivitera.com>
 <7ffab777-0f77-f949-f70f-7bf34c504381@gmail.com>
 <ff6d7385-a6d7-8920-dbe6-9018432392fa@synopsys.com>
From:   Ferry Toth <fntoth@gmail.com>
Message-ID: <c83e4225-a8e7-4a0b-ba44-ba72ab6206b1@gmail.com>
Date:   Thu, 26 Aug 2021 09:30:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ff6d7385-a6d7-8920-dbe6-9018432392fa@synopsys.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi

Op 26-08-2021 om 03:18 schreef Thinh Nguyen:
> Ferry Toth wrote:
>> Hi
>>
>> Op 24-08-2021 om 07:39 schreef Pavel Hofman:
>>>
>>>
>>> Dne 24. 08. 21 v 0:50 Thinh Nguyen napsal(a):
>>>> Pavel Hofman wrote:
>>>>>
>>>>>
>>>>> Dne 23. 08. 21 v 17:21 Andy Shevchenko napsal(a):
>>>>>> On Mon, Aug 23, 2021 at 5:59 PM Pavel Hofman
>>>>>> <pavel.hofman@ivitera.com> wrote:
>>>>>>> Dne 22. 08. 21 v 21:43 Ferry Toth napsal(a):
>>>>>>>> Op 19-08-2021 om 23:04 schreef Pavel Hofman:
>>>>>>>>> Dne 19. 08. 21 v 22:10 Ferry Toth napsal(a):
>>>>>>>>>> Op 19-08-2021 om 09:51 schreef Pavel Hofman:
>>>>>>>>>>> Dne 18. 08. 21 v 21:07 Ferry Toth napsal(a):
>>>>>>>>>>>> Op 18-08-2021 om 00:00 schreef Ferry Toth:
>>>>>>
>>>>>> ...
>>>>>>
>>>>>>>>>>>> So, where do we go from here?
>>>>>>>>>>>
>>>>>>>>>>> I know the patches have been tested on dwc2 (by me and
>>>>>>>>>>> others).  I
>>>>>>>>>>> do not know if Ruslan or Jerome tested them on dwc3 but probably
>>>>>>>>>>> not. Ruslan has talked about RPi (my case too) and
>>>>>>>>>>> BeagleboneBlack,
>>>>>>>>>>> both with dwc2. Perhaps the dwc2 behaves a bit differently than
>>>>>>>>>>> dwc3?
>>>>>>>>>>>
>>>>>>>>>>> The patches add a new EP-IN for async feedback. I am sorry I have
>>>>>>>>>>> not followed your long thread (it started as unrelated to
>>>>>>>>>>> uac). Does
>>>>>>>>>>> the problem appear with f_uac1 or f_uac2? Please how have you
>>>>>>>>>>> reached the above problem?
>>>>>>>>>>
>>>>>>>>>> I'm sorry too. I first believed the issue was related to the patch
>>>>>>>>>> mentioned in the subject line.
>>>>>>>>>>
>>>>>>>>>> The problem appaers with f_uac2. I bost Edison_Arduino board in
>>>>>>>>>> host
>>>>>>>>>> mode (there is a switch allowing to select host/device mode). When
>>>>>>>>>> flipping the switch to device mode udev run a script:
>>>>>>>>>> But as I am using configfs (excerpt follows) and just disabling
>>>>>>>>>> the
>>>>>>>>>> last 2 line resolves the issue, I'm guessing uac2 is the issue. Or
>>>>>>>>>> exceeding the available resources.
>>>>>>>>>>
>>>>>>>>>> # Create directory structure
>>>>>>>>>> mkdir "${GADGET_BASE_DIR}"
>>>>>>>>>> cd "${GADGET_BASE_DIR}"
>>>>>>>>>> mkdir -p configs/c.1/strings/0x409
>>>>>>>>>> mkdir -p strings/0x409
>>>>>>>>>>
>>>>>>>>>> # Serial device
>>>>>>>>>> mkdir functions/gser.usb0
>>>>>>>>>> ln -s functions/gser.usb0 configs/c.1/
>>>>>>>>>> ###
>>>>>>>>>>
>>>>>>>>>> # Ethernet device
>>>>>>>>>> mkdir functions/eem.usb0
>>>>>>>>>> echo "${DEV_ETH_ADDR}" > functions/eem.usb0/dev_addr
>>>>>>>>>> echo "${HOST_ETH_ADDR}" > functions/eem.usb0/host_addr
>>>>>>>>>> ln -s functions/eem.usb0 configs/c.1/
>>>>>>>>>>
>>>>>>>>>> # Mass Storage device
>>>>>>>>>> mkdir functions/mass_storage.usb0
>>>>>>>>>> echo 1 > functions/mass_storage.usb0/stall
>>>>>>>>>> echo 0 > functions/mass_storage.usb0/lun.0/cdrom
>>>>>>>>>> echo 0 > functions/mass_storage.usb0/lun.0/ro
>>>>>>>>>> echo 0 > functions/mass_storage.usb0/lun.0/nofua
>>>>>>>>>> echo "${USBDISK}" > functions/mass_storage.usb0/lun.0/file
>>>>>>>>>> ln -s functions/mass_storage.usb0 configs/c.1/
>>>>>>>>>>
>>>>>>>>>> # UAC2 device
>>>>>>>>>> mkdir functions/uac2.usb0
>>>>>>>>>> ln -s functions/uac2.usb0 configs/c.1
>>>>>>>>>> ....
>>>>>>>>>
>>>>>>>>> As you say, could perhaps the reason be that the extra EP-IN
>>>>>>>>> added in
>>>>>>>>> those patches (previously 1, now 2 with the default config you use)
>>>>>>>>> exceeds your EP-IN max count or available fifos somehow?  You
>>>>>>>>> have a
>>>>>>>>> number of functions initialized. If you change the load order of
>>>>>>>>> the
>>>>>>>>> functions, do you get the error later with a different function?
>>>>>>>>> Just
>>>>>>>>> guessing...
>>>>>>>>>
>>>>>>>>> You should be able to switch the default async EP-OUT (which
>>>>>>>>> configures the new feedback EP-IN ) to adaptive EP-OUT (which
>>>>>>>>> requires
>>>>>>>>> no feedback EP) with c_sync=8 parameter of f_uac2.
>>>>>>>>>
>>>>>>>>> https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.14-rc6/source/drivers/usb/gadget/function/f_uac2.c*L47__;Iw!!A4F2R9G_pg!LBySrM_zgMGV0x-zZ7nSrs54yJw1GlnpUVUVxdQE8PeszSMZ6OkFX8lSoigwRbWQzLcU$
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.14-rc6/source/drivers/usb/gadget/function/f_uac2.c*L830__;Iw!!A4F2R9G_pg!LBySrM_zgMGV0x-zZ7nSrs54yJw1GlnpUVUVxdQE8PeszSMZ6OkFX8lSoigwRfP5TdZC$
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.14-rc6/source/include/uapi/linux/usb/ch9.h*L453__;Iw!!A4F2R9G_pg!LBySrM_zgMGV0x-zZ7nSrs54yJw1GlnpUVUVxdQE8PeszSMZ6OkFX8lSoigwRejzMbWO$
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Does that fix the problem?
>>>>>>>>
>>>>>>>> Not sure how to do that. Do you mean the module should have a
>>>>>>>> parameter
>>>>>>>> called c_sync? `modinfo` list no parameters for usb_f_uac2.
>>>>>>>
>>>>>>> Those are configfs params, not available in modinfo.
>>>>>>>
>>>>>>> I checked and the value is "adaptive"
>>>>>>> https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.14-rc7/source/drivers/usb/gadget/function/f_uac2.c*L1312__;Iw!!A4F2R9G_pg!LBySrM_zgMGV0x-zZ7nSrs54yJw1GlnpUVUVxdQE8PeszSMZ6OkFX8lSoigwRTETcbsN$
>>>>>>>
>>>>>>
>>>>>>
>>>>>>> In your configfs script:
>>>>>>
>>>>>> Kernel shouldn't crash with any available set of configuration
>>>>>> parameters, right? So, even if the parameter would fix the crash the
>>>>>> series is buggy and has to be reverted in my opinion.
>>>>>
>>>>> Sure, no problem with reverting. I am just trying to start up some
>>>>> troubleshooting. A resource exhaustion was mentioned here, that's why I
>>>>> suggested a way to test the patch with the original number of endpoints
>>>>> allocated. I do not get any crashes on my setup which uses fewer gadget
>>>>> functions. That's why I asked what happens if the functions load order
>>>>> is changed. I am afraid this thread is so complex that the actual
>>>>> problem has been burried in the history.
>>>>>
>>>>
>>>> As I pointed out previously, the crash is probably because of f_uac2
>>>> prematurely freeing feedback request before its completion.
>>>> usb_ep_dequeue() is asynchronous. dwc2() may treat it as a synchronous
>>>> call so you didn't get a crash.
>>>
>>> Thanks for your hint, it greatly helps.
>>>>>
>>>>
>>>> I'm not sure how easy it is for you to obtain/test a device with dwc3,
>>>> but it would be great to also have it as part of your testing suite. :)
>>>
>>> Can you recommend a reasonably priced device with viable kernel
>>> updates for the testing? Optionally with SS which you mentioned last
>>> time? Thanks.
>>>
>> Edison-Arduino kit 2nd hand with display on ebay ~$100 :-)
>>
> 
> Ferry can correct me if I'm wrong, but I think Edison-Arduino kit only
> supports up to highspeed. Regardless, Edison-Arduino seems to work well
> with the latest Linux kernel.

The usb phy TUSB1211 is built into the Edison module so the high speed 
limitation applies not only to Edison-Arduino kit. The kit does have a 
HW switch to switch between host / device mode which makes it perfect 
for testing. Other then that, Edison-Arduino currently receives acpi 
tables from U-Boot and configfs and works well in i686 and x86_64 since 
4.19. USB device mode works well since 5.13 with one patch to extcon or 
with a few patches to 5.10. The extcon patch landed in 5.14.

> I see that there are various development kits with rk3399 that supports
> up to SuperSpeed at reasonable price, but I think they all require some
> effort to bring up to the latest Linux kernel and in device mode.
> 
> Maybe Ferry/Felipe/anyone can provide more recommendations?
> 
> Thanks,
> Thinh
> 
