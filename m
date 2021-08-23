Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 026EC3F4D59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Aug 2021 17:21:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230380AbhHWPWe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 11:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbhHWPWe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 11:22:34 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2CC0C061575;
        Mon, 23 Aug 2021 08:21:51 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id j187so15662448pfg.4;
        Mon, 23 Aug 2021 08:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nMC47Ws8/3+IS1dfmrDboZCOs/IMnqcveU9oBYbSlCc=;
        b=W0sbUjNzVJxK723QQwl9y+dxePcbgZmgY4c5xPppItZH1I5Y3C01hpwbsW3a7GcBBm
         0Hq6Uy18H9QZLmv9fjLtUSxDGz5g6w0EVv10NJk59+/IpVrnHpqP8Cw8HNX99O7BHp9w
         ylUUlkjRl57Um8tkhGFNmgXGL09vl841zaqOj5qV6m5b2do78+LiiSBip/97CrlqLpI9
         vlRFMq96KYI4V6coNiYLIaOxkAu1m7y58BkIssWhB9EQmFE+uLgRbEAgcMx4w1N1ASJY
         OBX597k3fXrPmVIKN/2WGgVvQ4C1iWEvddLM0uB99eHObXkNlrJ6jnFUKMO0inUyutx6
         PCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nMC47Ws8/3+IS1dfmrDboZCOs/IMnqcveU9oBYbSlCc=;
        b=WDPkOapzg5xW0fcndEZLnankM/Q+VB8JAy/3xFQkYxF3BmqGYCoYSRzYOr8Np577TY
         CBjuuH+AN+k8X6cNGjA8TJYYurdhQ82b40CYE7gTkY2mLVnmjZngtuRmvUnQMumJTAH+
         BLIiSaNEH+Il7gz41hJ1Z7FnG4DkWfWDX/0dWGKDqEpPU6y9P22+bgRC73f6FwyO3WcO
         0SR4e9AlnnLOtxKljIM9qe58lBk4mjsaV5Jnt8WZ7n6NflkXYfATAjjRfyugvxGJs/IX
         FiGcIp/Bn/ej/UEud3GWPQV/qqUZ9x6qjRqinRTV19GRmiGldBjZfBt8Itv1kzh47aWs
         qcOw==
X-Gm-Message-State: AOAM530tMj/Ehvwon4qnone1K8h4OfSuxAJ0yR/yPJnj2IQFJ76eZyQZ
        mWxhaIHXU0O4wNugr4Biqaz+PDkLhIURhC35sNs=
X-Google-Smtp-Source: ABdhPJxthONvJTTn3DdQlicHRYKFgTLzGAsdhfwPO/YO3Ef3vQ0Z0tlOG+qQgTWVpl/hBeR1GxcTaEzvmHr1xoBE+i8=
X-Received: by 2002:a05:6a00:d41:b0:3e1:3316:2ef with SMTP id
 n1-20020a056a000d4100b003e1331602efmr34908253pfv.40.1629732111030; Mon, 23
 Aug 2021 08:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <1623923899-16759-1-git-send-email-wcheng@codeaurora.org>
 <2e01c435-9ecc-4e3b-f55c-612a86667020@codeaurora.org> <2ae9fa6a-3bb1-3742-0dd3-59678bdd8643@gmail.com>
 <ebea75fe-5334-197b-f67a-cb6e1e30b39e@codeaurora.org> <bafa93bb-11e3-c8a5-e14a-b0a6d5695055@gmail.com>
 <87v951ldlt.fsf@kernel.org> <d9aef50c-4bd1-4957-13d8-0b6a14b9fcd0@gmail.com>
 <87pmv9l1dv.fsf@kernel.org> <9dc6cd83-17b9-7075-0934-6b9d41b6875d@gmail.com>
 <87a6mbudvc.fsf@kernel.org> <6e8bb4ad-fe68-ad36-7416-2b8e10b6ae96@gmail.com>
 <877dhev68a.fsf@kernel.org> <cca69e90-b0ef-00b8-75d3-3bf959a93b45@gmail.com>
 <874kchvcq0.fsf@kernel.org> <e59f1201-2aa2-9075-1f94-a6ae7a046dc1@gmail.com>
 <8735raj766.fsf@kernel.org> <b3417c2c-613b-8ef6-2e2d-6e2cf9a5d5fd@gmail.com>
 <b3e820f0-9c94-7cba-a248-3b2ec5378ab0@gmail.com> <d298df65-417b-f318-9374-b463a15d8308@ivitera.com>
 <a7d7f0dd-dfbb-5eef-d1da-8cbdab5fc4a7@gmail.com> <c4e29ac0-1df1-3c64-1218-3687f07e7f77@ivitera.com>
 <1fb52c92-9319-c035-722f-695ab34723dd@gmail.com> <702c72cd-40e4-e641-797a-764e7e611afb@ivitera.com>
In-Reply-To: <702c72cd-40e4-e641-797a-764e7e611afb@ivitera.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 23 Aug 2021 18:21:11 +0300
Message-ID: <CAHp75VeZBLgf8YhEjdOV1Hva_dJh_=VHRGyVb=r44yh-9n+F4A@mail.gmail.com>
Subject: Re: [PATCH v10 0/6] Re-introduce TX FIFO resize for larger EP bursting
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     Ferry Toth <fntoth@gmail.com>, Felipe Balbi <balbi@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        gregkh@linuxfoundation.org, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, frowand.list@gmail.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jackp@codeaurora.org, heikki.krogerus@linux.intel.com,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 23, 2021 at 5:59 PM Pavel Hofman <pavel.hofman@ivitera.com> wrote:
> Dne 22. 08. 21 v 21:43 Ferry Toth napsal(a):
> > Op 19-08-2021 om 23:04 schreef Pavel Hofman:
> >> Dne 19. 08. 21 v 22:10 Ferry Toth napsal(a):
> >>> Op 19-08-2021 om 09:51 schreef Pavel Hofman:
> >>>> Dne 18. 08. 21 v 21:07 Ferry Toth napsal(a):
> >>>>> Op 18-08-2021 om 00:00 schreef Ferry Toth:

...

> >>>>> So, where do we go from here?
> >>>>
> >>>> I know the patches have been tested on dwc2 (by me and others).  I
> >>>> do not know if Ruslan or Jerome tested them on dwc3 but probably
> >>>> not. Ruslan has talked about RPi (my case too) and BeagleboneBlack,
> >>>> both with dwc2. Perhaps the dwc2 behaves a bit differently than dwc3?
> >>>>
> >>>> The patches add a new EP-IN for async feedback. I am sorry I have
> >>>> not followed your long thread (it started as unrelated to uac). Does
> >>>> the problem appear with f_uac1 or f_uac2? Please how have you
> >>>> reached the above problem?
> >>>
> >>> I'm sorry too. I first believed the issue was related to the patch
> >>> mentioned in the subject line.
> >>>
> >>> The problem appaers with f_uac2. I bost Edison_Arduino board in host
> >>> mode (there is a switch allowing to select host/device mode). When
> >>> flipping the switch to device mode udev run a script:
> >>> But as I am using configfs (excerpt follows) and just disabling the
> >>> last 2 line resolves the issue, I'm guessing uac2 is the issue. Or
> >>> exceeding the available resources.
> >>>
> >>> # Create directory structure
> >>> mkdir "${GADGET_BASE_DIR}"
> >>> cd "${GADGET_BASE_DIR}"
> >>> mkdir -p configs/c.1/strings/0x409
> >>> mkdir -p strings/0x409
> >>>
> >>> # Serial device
> >>> mkdir functions/gser.usb0
> >>> ln -s functions/gser.usb0 configs/c.1/
> >>> ###
> >>>
> >>> # Ethernet device
> >>> mkdir functions/eem.usb0
> >>> echo "${DEV_ETH_ADDR}" > functions/eem.usb0/dev_addr
> >>> echo "${HOST_ETH_ADDR}" > functions/eem.usb0/host_addr
> >>> ln -s functions/eem.usb0 configs/c.1/
> >>>
> >>> # Mass Storage device
> >>> mkdir functions/mass_storage.usb0
> >>> echo 1 > functions/mass_storage.usb0/stall
> >>> echo 0 > functions/mass_storage.usb0/lun.0/cdrom
> >>> echo 0 > functions/mass_storage.usb0/lun.0/ro
> >>> echo 0 > functions/mass_storage.usb0/lun.0/nofua
> >>> echo "${USBDISK}" > functions/mass_storage.usb0/lun.0/file
> >>> ln -s functions/mass_storage.usb0 configs/c.1/
> >>>
> >>> # UAC2 device
> >>> mkdir functions/uac2.usb0
> >>> ln -s functions/uac2.usb0 configs/c.1
> >>> ....
> >>
> >> As you say, could perhaps the reason be that the extra EP-IN added in
> >> those patches (previously 1, now 2 with the default config you use)
> >> exceeds your EP-IN max count or available fifos somehow?  You have a
> >> number of functions initialized. If you change the load order of the
> >> functions, do you get the error later with a different function? Just
> >> guessing...
> >>
> >> You should be able to switch the default async EP-OUT (which
> >> configures the new feedback EP-IN ) to adaptive EP-OUT (which requires
> >> no feedback EP) with c_sync=8 parameter of f_uac2.
> >>
> >> https://elixir.bootlin.com/linux/v5.14-rc6/source/drivers/usb/gadget/function/f_uac2.c#L47
> >>
> >> https://elixir.bootlin.com/linux/v5.14-rc6/source/drivers/usb/gadget/function/f_uac2.c#L830
> >>
> >> https://elixir.bootlin.com/linux/v5.14-rc6/source/include/uapi/linux/usb/ch9.h#L453
> >>
> >> Does that fix the problem?
> >
> > Not sure how to do that. Do you mean the module should have a parameter
> > called c_sync? `modinfo` list no parameters for usb_f_uac2.
>
> Those are configfs params, not available in modinfo.
>
> I checked and the value is "adaptive"
> https://elixir.bootlin.com/linux/v5.14-rc7/source/drivers/usb/gadget/function/f_uac2.c#L1312

> In your configfs script:

Kernel shouldn't crash with any available set of configuration
parameters, right? So, even if the parameter would fix the crash the
series is buggy and has to be reverted in my opinion.

> # UAC2 device
> mkdir functions/uac2.usb0
> ln -s functions/uac2.usb0 configs/c.1
>
>
> On the USB Host:
> cat /proc/asound/Gadget/stream:
> Playback:
>    Status: Stop
>    Interface 1
>      Altset 1
>      Format: S16_LE
>      Channels: 2
>      Endpoint: 0x01 (1 OUT) (ASYNC)
>      Rates: 64000
>      Data packet interval: 125 us
>      Bits: 16
>      Channel map: FL FR
>      Sync Endpoint: 0x82 (2 IN)
>      Sync EP Interface: 1
>      Sync EP Altset: 1
>      Implicit Feedback Mode: No
>
> lsusb -v -d 1d6b:0104 | | grep EP.*IN
>          bEndpointAddress     0x81  EP 1 IN
>          bEndpointAddress     0x82  EP 2 IN
>          bEndpointAddress     0x83  EP 3 IN
>
> I have additional patches applied which define controls via EP IN
> interrupt mode, not part of that patchset.
>
> Switching to the adaptive mode:
> # UAC2 device
> mkdir functions/uac2.usb0
> echo "adaptive" > functions/uac2.usb0/c_sync
> ln -s functions/uac2.usb0 configs/c.1
>
> On the USB Host:
> cat /proc/asound/Gadget/stream:
> Playback:
>    Status: Stop
>    Interface 1
>      Altset 1
>      Format: S16_LE
>      Channels: 2
>      Endpoint: 0x01 (1 OUT) (ADAPTIVE)
>      Rates: 64000
>      Data packet interval: 125 us
>      Bits: 16
>      Channel map: FL FR
>
> lsusb -v -d 1d6b:0104 | grep EP.*IN
>          bEndpointAddress     0x81  EP 1 IN
>          bEndpointAddress     0x82  EP 2 IN
>
> The feedback EP-IN is gone because the mode is adaptive now.
>
> If you think the new input endpoints should not be created by default
> for resource-compatibility reasons, the adaptive mode can be set by
> default in a fixed patch.

Would it be possible to change the mode? If so, then the user may
configure it and crash again.

> Also the patches defining the new interrupt endpoints can have the
> controls disabled by default (and not allocate the EP-IN). These patches
> on top of the async patches are already accepted by Greg for usb-next
> branch
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/gregkh/usb/+/eaf6cbe0992052a46d93047dc122fad5126aa3bd
> . That's why I was trying to sort out the async patches without
> reverting them as it will call for more reverts.

-- 
With Best Regards,
Andy Shevchenko
