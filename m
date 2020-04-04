Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7318A19E468
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2020 12:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbgDDKIt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Apr 2020 06:08:49 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36421 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbgDDKIt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Apr 2020 06:08:49 -0400
Received: by mail-wm1-f67.google.com with SMTP id d202so10488820wmd.1;
        Sat, 04 Apr 2020 03:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k19yJNcLZwMmdgmupRO5KsWO4QfHOYro/tYovVHgC3Y=;
        b=YSIPidUk/oTQWZpDza0hrpNyBx97HDJ/wmCYAxSpI19LEAUDT+rsQ0bMjdFDPJCqZN
         pYuVRJGs5iIqj2z2oERMydTKwhtgUmLmJmtYCfmgeAN4xL2J3SZ2rZA7tAka8ox2pDy9
         QKj02xMWsJqZ/RCmHKODoKcsQ44R2J+JagH4WiAV6HnyZy3Uo6BThcUeJy/cIBKkQnGe
         sL52N9WoUvs1bLJepcvAQ+r1iLFa4HitrnuW+emaQeUAvhezcdJ7dWlAUlI4qUfJpwLI
         M74uvKo50gSuTTN8Zf/Nh0UAHHtQQVOuj2/T1yGOyRgles18x3E6Yx2y9U9pQAV+TTsp
         tP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k19yJNcLZwMmdgmupRO5KsWO4QfHOYro/tYovVHgC3Y=;
        b=DTbYV1NUhxt/IKqB4n6TKKax/PxPGxGSfiOgbS4+iN52NYPOx7kOSAl+j1CtCKMQc6
         rPgyPkJQx2zoqfEWNO/A4cDMCAhamm4rjHjieL+9RnhcVxUrc27WEadQqjMygd/tUfkG
         fj1PsMSDJJziaH6Y1w+5974YLGuDIewTnZgLq9YW5Gnp+EAguXFJEG5jcNlS9n7ZK6RJ
         iGmOSMwmUKvXQhcXU6xzAflo3KockYq3clVNfL41OzQhpS4DYpoZVn9YJwmYcQVDKW4z
         g/H14uxek1UAqYtGEcQDnhYDWmMUqXm6Nl9OxeuKvK/ClPkwlO8iEZ/a1/5nZcjbcAGz
         c2eQ==
X-Gm-Message-State: AGi0PuaX8CuGUMSP7OMHqIetAQ6mlmXfcu4Q8EyYlE8BDz3nokTRglfD
        ZrgxFhySvx2obnC47q0jCHI4S93EH7U=
X-Google-Smtp-Source: APiQypIdwL9uZrcwcpY9k0V31zPZlwVuis0vnZlRmrZk+h21HMxt5HUQDLYQem/NbTY2O3XDl0gE4A==
X-Received: by 2002:a1c:740a:: with SMTP id p10mr13328690wmc.46.1585994925667;
        Sat, 04 Apr 2020 03:08:45 -0700 (PDT)
Received: from debian64.daheim (p5B0D7489.dip0.t-ipconnect.de. [91.13.116.137])
        by smtp.gmail.com with ESMTPSA id r3sm16233561wrm.35.2020.04.04.03.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 03:08:45 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1] helo=debian64.localnet)
        by debian64.daheim with esmtp (Exim 4.93)
        (envelope-from <chunkeey@gmail.com>)
        id 1jKfj8-00020y-DI; Sat, 04 Apr 2020 12:08:34 +0200
From:   Christian Lamparter <chunkeey@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        John Stultz <john.stultz@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andreas =?ISO-8859-1?Q?B=F6hler?= <dev@aboehler.at>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 3/5] usb: xhci: Add support for Renesas controller with memory
Date:   Sat, 04 Apr 2020 12:08:32 +0200
Message-ID: <226575470.unBdNOV7p8@debian64>
In-Reply-To: <20200401161852.GD72691@vkoul-mobl>
References: <20200323170601.419809-1-vkoul@kernel.org> <9854066.43zovN3OMW@debian64> <20200401161852.GD72691@vkoul-mobl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wednesday, 1 April 2020 18:18:52 CEST Vinod Koul wrote:
> On 01-04-20, 17:39, Christian Lamparter wrote:
> > On Wednesday, 1 April 2020 14:57:48 CEST Vinod Koul wrote:
> > > On 26-03-20, 17:21, Vinod Koul wrote:
> > > > On 26-03-20, 13:29, Mathias Nyman wrote:
> > > > > On 23.3.2020 19.05, Vinod Koul wrote:
> > > > > > Some rensas controller like uPD720201 and uPD720202 need firmware to be
> > > > > > loaded. Add these devices in table and invoke renesas firmware loader
> > > > > > functions to check and load the firmware into device memory when
> > > > > > required.
> > > > > > 
> > > > > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > > > > ---
> > > > > >  drivers/usb/host/xhci-pci-renesas.c |  1 +
> > > > > >  drivers/usb/host/xhci-pci.c         | 29 ++++++++++++++++++++++++++++-
> > > > > >  drivers/usb/host/xhci-pci.h         |  3 +++
> > > > > >  3 files changed, 32 insertions(+), 1 deletion(-)
> > > > > > 
> > > > > 
> > > > > It's unfortunate if firmware loading couldn't be initiated in a PCI fixup hook
> > > > > for this Renesas controller. What was the reason it failed?
> > > > > 
> > > > > Nicolas Saenz Julienne just submitted a solution like that for Raspberry Pi 4
> > > > > where firmware loading is initiated in pci-quirks.c quirk_usb_early_handoff()
> > > > > 
> > > > > https://lore.kernel.org/lkml/20200324182812.20420-1-nsaenzjulienne@suse.de
> > > > > 
> > > > > Is he doing something different than what was done for the Renesas controller?
> > > > 
> > > > I tried and everytime ended up not getting firmware. Though I did not
> > > > investigate a lot. Christian seemed to have tested sometime back as
> > > > well.
> > > > 
> > > > Another problem is that we dont get driver_data in the quirk and there
> > > > didnt seem a way to find the firmware name.
> > > > 
> > > > > > diff --git a/drivers/usb/host/xhci-pci-renesas.c b/drivers/usb/host/xhci-pci-renesas.c
> > > > > > index c588277ac9b8..d413d53df94b 100644
> > > > > > --- a/drivers/usb/host/xhci-pci-renesas.c
> > > > > > +++ b/drivers/usb/host/xhci-pci-renesas.c
> > > > > > @@ -336,6 +336,7 @@ static void renesas_fw_callback(const struct firmware *fw,
> > > > > >  		goto cleanup;
> > > > > >  	}
> > > > > >  
> > > > > > +	xhci_pci_probe(pdev, ctx->id);
> > > > > >  	return;
> > > > > 
> > > > > I haven't looked into this but instead of calling xhci_pci_probe() here in the async fw
> > > > > loading callback could we just return -EPROBE_DEFER until firmware is loaded when
> > > > > xhci_pci_probe() is originally called?
> > > > 
> > > > Hmm, initially my thinking was how to tell device core to probe again,
> > > > and then digging up I saw wait_for_device_probe() which can be used, let
> > > > me try that
> > > 
> > > Sorry to report back that it doesn't work as planned :(
> > > 
> > > I modified the code to invoke the request_firmware_nowait() which will load
> > > the firmware and provide the firmware in callback. Meanwhile return -EPROBE_DEFER.
> > > 
> > > After a bit, the core invokes the driver probe again and we hit the
> > > roadblock. The request_firmware uses devres and allocates resources for
> > > loading the firmware. The problem is that device core checks for this:
> > > 
> > > bus: 'pci': really_probe: probing driver xhci_hcd_pci with device 0000:01:00.0
> > > pci 0000:01:00.0: Resources present before probing
> > > 
> > > And here the probe fails. In some cases the firmware_callback finishes
> > > before this and we can probe again, but that is not very reliable.
> > > 
> > > I tested another way to use request_firmware() (sync version) and then
> > > load the firmware in probe and load. The request is done only for
> > > renesas devices if they dont have firmware already running.
> > > So rest of the devices wont have any impact.
> > > 
> > > Now should we continue this way in the patchset or move to sync version.
> > > Am okay either way.
> > 
> > Just a word of caution.
> > 
> > The problem with the usage of "sync" request_firmware in drivers is that if the
> > code is built into the kernel the request_firmware() could be called before the
> > (root) filesystem on which the firmware resides is ready.... So this will get
> > weird during boot because what is the sync request_firmware() going to do? From what
> > I know, this is why the funny _async firmware request APIs are even a thing...
> 
> So is your usage a module or inbuilt. I am using it as a module, so
> seems okay. For inbuilt, someone needs to do make it in kernel or make
> sure the initramfs has this :)

Yes, after testing on the device, I can state that everything went as intended :-).

Cheers,
Christian



