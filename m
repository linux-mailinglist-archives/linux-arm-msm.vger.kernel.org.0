Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43BC019AEEC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2020 17:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732929AbgDAPkL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Apr 2020 11:40:11 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44954 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732651AbgDAPkL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Apr 2020 11:40:11 -0400
Received: by mail-wr1-f65.google.com with SMTP id m17so549463wrw.11;
        Wed, 01 Apr 2020 08:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7LhY+xgdF/kTo0yqSoNNI08Cln8Sgej67du4avA4Iik=;
        b=ms/2VCoQImC4vOVpi0xT1QMP+mrGcgqm99NuifOyiBQl67q/G6i9UNBJ+jvaO03nWk
         Ph9lCPvNC0kjTgdmf87Oom6DGtemW2e6l95AJkOw26/UNeQPp5+03wDEQFW3vJxEyEB0
         NORdFyP4nuou+axyZ7fk17BgzeXgptHQNjvtjmkaSCsGGpJYlAvoyKgjHCO4vP9TG7y2
         T0jy7XtsfPpLJZsXoiBZymDeb5HFH+aBivnsGu3LiMTHWtat4+gMr5Ye5+9iICwsce9F
         7QyX0u5jUSj17ZGuDnh5Jg4NDY5RtQnhjT/gB/Opj69D78BHxXvK3k9WG9tCIFkugGqb
         JcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7LhY+xgdF/kTo0yqSoNNI08Cln8Sgej67du4avA4Iik=;
        b=iJpe17KTL5Pm6wvaYVM/aVFkkXU4fuGo1I4st0/FHK0tFHVim0RN+FWh/AFSHUb7cH
         muHT2/5mnQIs8n5k75w4ArqNVfRd83Jp9mIkedeybWh4jBZOXYrU/7JJGVstYMlPjHm7
         Scnzoih2W8q4+6/IC6PQ0uUtvLLR4IqxfT/jBOfdTI6KV/iRT8Hsvh1vShqOQgg6RqQg
         FoHOBOOGcOL3THv98DxVwncjAFb2S3n+HExkiD8zpQ52Aj08+8L20t77vmEv79jLX9L9
         pmzGOt+WfLMtFccbYWm24sDQlkm4Bz/jlRrhOoyrQNNIKAev99GNBGesFVGmzayGolf3
         dI9w==
X-Gm-Message-State: ANhLgQ3Ebus8BnScvmPTQoGtoBgocyLCd8e925XbU++8r5I5KYPWPsSr
        aG8qbHPg/aYaNH4QK3Zvgs4=
X-Google-Smtp-Source: ADFU+vs9jCJ2ZIqDbK8bA0l9KhzK94UsEetS8e0dQ+8/GEeB638PFXkXf072aP0upyrzo+OIF+4exA==
X-Received: by 2002:a5d:5106:: with SMTP id s6mr26128767wrt.24.1585755608685;
        Wed, 01 Apr 2020 08:40:08 -0700 (PDT)
Received: from debian64.daheim (p5B0D7F77.dip0.t-ipconnect.de. [91.13.127.119])
        by smtp.gmail.com with ESMTPSA id a124sm3029186wmd.37.2020.04.01.08.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 08:40:07 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1] helo=debian64.localnet)
        by debian64 with esmtp (Exim 4.93)
        (envelope-from <chunkeey@gmail.com>)
        id 1jJfTF-00089J-Uj; Wed, 01 Apr 2020 17:40:01 +0200
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
Date:   Wed, 01 Apr 2020 17:39:55 +0200
Message-ID: <9854066.43zovN3OMW@debian64>
In-Reply-To: <20200401125748.GC72691@vkoul-mobl>
References: <20200323170601.419809-1-vkoul@kernel.org> <20200326115117.GZ72691@vkoul-mobl> <20200401125748.GC72691@vkoul-mobl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

On Wednesday, 1 April 2020 14:57:48 CEST Vinod Koul wrote:
> On 26-03-20, 17:21, Vinod Koul wrote:
> > On 26-03-20, 13:29, Mathias Nyman wrote:
> > > On 23.3.2020 19.05, Vinod Koul wrote:
> > > > Some rensas controller like uPD720201 and uPD720202 need firmware to be
> > > > loaded. Add these devices in table and invoke renesas firmware loader
> > > > functions to check and load the firmware into device memory when
> > > > required.
> > > > 
> > > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > > ---
> > > >  drivers/usb/host/xhci-pci-renesas.c |  1 +
> > > >  drivers/usb/host/xhci-pci.c         | 29 ++++++++++++++++++++++++++++-
> > > >  drivers/usb/host/xhci-pci.h         |  3 +++
> > > >  3 files changed, 32 insertions(+), 1 deletion(-)
> > > > 
> > > 
> > > It's unfortunate if firmware loading couldn't be initiated in a PCI fixup hook
> > > for this Renesas controller. What was the reason it failed?
> > > 
> > > Nicolas Saenz Julienne just submitted a solution like that for Raspberry Pi 4
> > > where firmware loading is initiated in pci-quirks.c quirk_usb_early_handoff()
> > > 
> > > https://lore.kernel.org/lkml/20200324182812.20420-1-nsaenzjulienne@suse.de
> > > 
> > > Is he doing something different than what was done for the Renesas controller?
> > 
> > I tried and everytime ended up not getting firmware. Though I did not
> > investigate a lot. Christian seemed to have tested sometime back as
> > well.
> > 
> > Another problem is that we dont get driver_data in the quirk and there
> > didnt seem a way to find the firmware name.
> > 
> > > > diff --git a/drivers/usb/host/xhci-pci-renesas.c b/drivers/usb/host/xhci-pci-renesas.c
> > > > index c588277ac9b8..d413d53df94b 100644
> > > > --- a/drivers/usb/host/xhci-pci-renesas.c
> > > > +++ b/drivers/usb/host/xhci-pci-renesas.c
> > > > @@ -336,6 +336,7 @@ static void renesas_fw_callback(const struct firmware *fw,
> > > >  		goto cleanup;
> > > >  	}
> > > >  
> > > > +	xhci_pci_probe(pdev, ctx->id);
> > > >  	return;
> > > 
> > > I haven't looked into this but instead of calling xhci_pci_probe() here in the async fw
> > > loading callback could we just return -EPROBE_DEFER until firmware is loaded when
> > > xhci_pci_probe() is originally called?
> > 
> > Hmm, initially my thinking was how to tell device core to probe again,
> > and then digging up I saw wait_for_device_probe() which can be used, let
> > me try that
> 
> Sorry to report back that it doesn't work as planned :(
> 
> I modified the code to invoke the request_firmware_nowait() which will load
> the firmware and provide the firmware in callback. Meanwhile return -EPROBE_DEFER.
> 
> After a bit, the core invokes the driver probe again and we hit the
> roadblock. The request_firmware uses devres and allocates resources for
> loading the firmware. The problem is that device core checks for this:
> 
> bus: 'pci': really_probe: probing driver xhci_hcd_pci with device 0000:01:00.0
> pci 0000:01:00.0: Resources present before probing
> 
> And here the probe fails. In some cases the firmware_callback finishes
> before this and we can probe again, but that is not very reliable.
> 
> I tested another way to use request_firmware() (sync version) and then
> load the firmware in probe and load. The request is done only for
> renesas devices if they dont have firmware already running.
> So rest of the devices wont have any impact.
> 
> Now should we continue this way in the patchset or move to sync version.
> Am okay either way.

Just a word of caution.

The problem with the usage of "sync" request_firmware in drivers is that if the
code is built into the kernel the request_firmware() could be called before the
(root) filesystem on which the firmware resides is ready.... So this will get
weird during boot because what is the sync request_firmware() going to do? From what
I know, this is why the funny _async firmware request APIs are even a thing...

(I took a quick peek into the RPI 4 code, but unlike this code it seems to fetch
from nvmem/eeprom, is this right? I had a tons-of-fun dealing with caldata and
firmware on UBIFS in UBI Volumes. So I'm prepared to test this cases. :D )

(Another possibility would be to use request_firmware_direct() here.
Though, I don't know if it would be considered API Abuse to -EPROBE_DEFER
on errors of request_firmware_direct() in order to wait for FSes to appear )

Regards,
Christian


