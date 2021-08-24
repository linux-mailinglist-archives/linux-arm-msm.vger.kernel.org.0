Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 612043F57A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Aug 2021 07:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230081AbhHXFk1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Aug 2021 01:40:27 -0400
Received: from cable.insite.cz ([84.242.75.189]:39532 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229885AbhHXFkZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Aug 2021 01:40:25 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 5E706A1A3D403;
        Tue, 24 Aug 2021 07:39:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1629783579; bh=ZqNx3U1aIGV13rkQp+VB34ijO0GCIA3x/Xr3oxij54E=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=T3QrPPizSJV93tNQuENTmj76a4cfsGiraooDWOABTtFlyIMRB7SYb8SLDxYfY99jh
         LSdLf4VZeQDzZURQG698TfaY0PySYx3k/Usv9dFFaHfrZvKprYu10YTiBOtq7jaAhd
         MWKNW3DYtDAS4ru0Z0ehXulBRpapb8wnPjwrRymg=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 5CU-FVQD_vhl; Tue, 24 Aug 2021 07:39:33 +0200 (CEST)
Received: from [192.168.105.119] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id CCFCFA1A3D400;
        Tue, 24 Aug 2021 07:39:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1629783573; bh=ZqNx3U1aIGV13rkQp+VB34ijO0GCIA3x/Xr3oxij54E=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=XR7TDdnacdv9dUIcWo4SaaQ6kGJ1btfBdZG1FWiktVtRB13IC3VmJziZUucfKKn1N
         hdmfqcBkNpf9iyGK7ys7o7e1ZG3aMh38nJu4/eOYaAd0WffM+E5fpR0HOE8Sr5d8jX
         a1nN64hG24MoAjGDtWtTRpL9cXlTCiXBTQH5nM70=
Subject: Re: [PATCH v10 0/6] Re-introduce TX FIFO resize for larger EP
 bursting
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Ferry Toth <fntoth@gmail.com>, Felipe Balbi <balbi@kernel.org>,
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
 <d9aef50c-4bd1-4957-13d8-0b6a14b9fcd0@gmail.com> <87pmv9l1dv.fsf@kernel.org>
 <9dc6cd83-17b9-7075-0934-6b9d41b6875d@gmail.com> <87a6mbudvc.fsf@kernel.org>
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
From:   Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <c84135c3-c730-208b-dde8-916c7bde1d73@ivitera.com>
Date:   Tue, 24 Aug 2021 07:39:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <7ad8b755-1fa0-3be4-3f2e-a4d95858e450@synopsys.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



Dne 24. 08. 21 v 0:50 Thinh Nguyen napsal(a):
> Pavel Hofman wrote:
>>
>>
>> Dne 23. 08. 21 v 17:21 Andy Shevchenko napsal(a):
>>> On Mon, Aug 23, 2021 at 5:59 PM Pavel Hofman
>>> <pavel.hofman@ivitera.com> wrote:
>>>> Dne 22. 08. 21 v 21:43 Ferry Toth napsal(a):
>>>>> Op 19-08-2021 om 23:04 schreef Pavel Hofman:
>>>>>> Dne 19. 08. 21 v 22:10 Ferry Toth napsal(a):
>>>>>>> Op 19-08-2021 om 09:51 schreef Pavel Hofman:
>>>>>>>> Dne 18. 08. 21 v 21:07 Ferry Toth napsal(a):
>>>>>>>>> Op 18-08-2021 om 00:00 schreef Ferry Toth:
>>>
>>> ...
>>>
>>>>>>>>> So, where do we go from here?
>>>>>>>>
>>>>>>>> I know the patches have been tested on dwc2 (by me and others).  I
>>>>>>>> do not know if Ruslan or Jerome tested them on dwc3 but probably
>>>>>>>> not. Ruslan has talked about RPi (my case too) and BeagleboneBlack,
>>>>>>>> both with dwc2. Perhaps the dwc2 behaves a bit differently than
>>>>>>>> dwc3?
>>>>>>>>
>>>>>>>> The patches add a new EP-IN for async feedback. I am sorry I have
>>>>>>>> not followed your long thread (it started as unrelated to uac). Does
>>>>>>>> the problem appear with f_uac1 or f_uac2? Please how have you
>>>>>>>> reached the above problem?
>>>>>>>
>>>>>>> I'm sorry too. I first believed the issue was related to the patch
>>>>>>> mentioned in the subject line.
>>>>>>>
>>>>>>> The problem appaers with f_uac2. I bost Edison_Arduino board in host
>>>>>>> mode (there is a switch allowing to select host/device mode). When
>>>>>>> flipping the switch to device mode udev run a script:
>>>>>>> But as I am using configfs (excerpt follows) and just disabling the
>>>>>>> last 2 line resolves the issue, I'm guessing uac2 is the issue. Or
>>>>>>> exceeding the available resources.
>>>>>>>
>>>>>>> # Create directory structure
>>>>>>> mkdir "${GADGET_BASE_DIR}"
>>>>>>> cd "${GADGET_BASE_DIR}"
>>>>>>> mkdir -p configs/c.1/strings/0x409
>>>>>>> mkdir -p strings/0x409
>>>>>>>
>>>>>>> # Serial device
>>>>>>> mkdir functions/gser.usb0
>>>>>>> ln -s functions/gser.usb0 configs/c.1/
>>>>>>> ###
>>>>>>>
>>>>>>> # Ethernet device
>>>>>>> mkdir functions/eem.usb0
>>>>>>> echo "${DEV_ETH_ADDR}" > functions/eem.usb0/dev_addr
>>>>>>> echo "${HOST_ETH_ADDR}" > functions/eem.usb0/host_addr
>>>>>>> ln -s functions/eem.usb0 configs/c.1/
>>>>>>>
>>>>>>> # Mass Storage device
>>>>>>> mkdir functions/mass_storage.usb0
>>>>>>> echo 1 > functions/mass_storage.usb0/stall
>>>>>>> echo 0 > functions/mass_storage.usb0/lun.0/cdrom
>>>>>>> echo 0 > functions/mass_storage.usb0/lun.0/ro
>>>>>>> echo 0 > functions/mass_storage.usb0/lun.0/nofua
>>>>>>> echo "${USBDISK}" > functions/mass_storage.usb0/lun.0/file
>>>>>>> ln -s functions/mass_storage.usb0 configs/c.1/
>>>>>>>
>>>>>>> # UAC2 device
>>>>>>> mkdir functions/uac2.usb0
>>>>>>> ln -s functions/uac2.usb0 configs/c.1
>>>>>>> ....
>>>>>>
>>>>>> As you say, could perhaps the reason be that the extra EP-IN added in
>>>>>> those patches (previously 1, now 2 with the default config you use)
>>>>>> exceeds your EP-IN max count or available fifos somehow?  You have a
>>>>>> number of functions initialized. If you change the load order of the
>>>>>> functions, do you get the error later with a different function? Just
>>>>>> guessing...
>>>>>>
>>>>>> You should be able to switch the default async EP-OUT (which
>>>>>> configures the new feedback EP-IN ) to adaptive EP-OUT (which requires
>>>>>> no feedback EP) with c_sync=8 parameter of f_uac2.
>>>>>>
>>>>>> https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.14-rc6/source/drivers/usb/gadget/function/f_uac2.c*L47__;Iw!!A4F2R9G_pg!LBySrM_zgMGV0x-zZ7nSrs54yJw1GlnpUVUVxdQE8PeszSMZ6OkFX8lSoigwRbWQzLcU$
>>>>>>
>>>>>> https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.14-rc6/source/drivers/usb/gadget/function/f_uac2.c*L830__;Iw!!A4F2R9G_pg!LBySrM_zgMGV0x-zZ7nSrs54yJw1GlnpUVUVxdQE8PeszSMZ6OkFX8lSoigwRfP5TdZC$
>>>>>>
>>>>>> https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.14-rc6/source/include/uapi/linux/usb/ch9.h*L453__;Iw!!A4F2R9G_pg!LBySrM_zgMGV0x-zZ7nSrs54yJw1GlnpUVUVxdQE8PeszSMZ6OkFX8lSoigwRejzMbWO$
>>>>>>
>>>>>> Does that fix the problem?
>>>>>
>>>>> Not sure how to do that. Do you mean the module should have a parameter
>>>>> called c_sync? `modinfo` list no parameters for usb_f_uac2.
>>>>
>>>> Those are configfs params, not available in modinfo.
>>>>
>>>> I checked and the value is "adaptive"
>>>> https://urldefense.com/v3/__https://elixir.bootlin.com/linux/v5.14-rc7/source/drivers/usb/gadget/function/f_uac2.c*L1312__;Iw!!A4F2R9G_pg!LBySrM_zgMGV0x-zZ7nSrs54yJw1GlnpUVUVxdQE8PeszSMZ6OkFX8lSoigwRTETcbsN$
>>>
>>>
>>>> In your configfs script:
>>>
>>> Kernel shouldn't crash with any available set of configuration
>>> parameters, right? So, even if the parameter would fix the crash the
>>> series is buggy and has to be reverted in my opinion.
>>
>> Sure, no problem with reverting. I am just trying to start up some
>> troubleshooting. A resource exhaustion was mentioned here, that's why I
>> suggested a way to test the patch with the original number of endpoints
>> allocated. I do not get any crashes on my setup which uses fewer gadget
>> functions. That's why I asked what happens if the functions load order
>> is changed. I am afraid this thread is so complex that the actual
>> problem has been burried in the history.
>>
> 
> As I pointed out previously, the crash is probably because of f_uac2
> prematurely freeing feedback request before its completion.
> usb_ep_dequeue() is asynchronous. dwc2() may treat it as a synchronous
> call so you didn't get a crash.

Thanks for your hint, it greatly helps.
>>
> 
> I'm not sure how easy it is for you to obtain/test a device with dwc3,
> but it would be great to also have it as part of your testing suite. :)

Can you recommend a reasonably priced device with viable kernel updates 
for the testing? Optionally with SS which you mentioned last time? Thanks.

Best regards,

Pavel.
