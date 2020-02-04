Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39D5C151E53
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 17:31:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727317AbgBDQbt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 11:31:49 -0500
Received: from mga07.intel.com ([134.134.136.100]:17209 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727307AbgBDQbt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 11:31:49 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Feb 2020 08:31:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,402,1574150400"; 
   d="scan'208";a="311093473"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga001.jf.intel.com with ESMTP; 04 Feb 2020 08:31:45 -0800
Subject: Re: [PATCH v6 0/5] usb: xhci: Add support for Renesas USB controllers
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Christian Lamparter <chunkeey@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        John Stultz <john.stultz@linaro.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20200113084005.849071-1-vkoul@kernel.org>
 <20200121064608.GA2841@vkoul-mobl>
 <CAAd0S9Dd7Ygx7TgV3E_A6z29efG7jsE1-xy48_cHotroWuk_ZA@mail.gmail.com>
 <5878067.luYmtVZgP3@debian64> <20200125053237.GG2841@vkoul-mobl>
 <64340358-6682-4ae0-9c06-d72d5a4ff259@linux.intel.com>
 <20200131084041.GI2841@vkoul-mobl>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <1ce257f5-df10-73ac-53ea-1c771abe70f2@linux.intel.com>
Date:   Tue, 4 Feb 2020 18:33:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200131084041.GI2841@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31.1.2020 10.40, Vinod Koul wrote:
> Hi Mathias,
> 
> On 30-01-20, 19:07, Mathias Nyman wrote:
>> On 25.1.2020 7.32, Vinod Koul wrote:
>>>>>>>>
>>>>>>>> On Mon, Jan 13, 2020 at 12:42 AM Vinod Koul <vkoul@kernel.org> wrote:
>>>>>>>>>
>>>>>>>>> This series add support for Renesas USB controllers uPD720201 and uPD720202.
>>>>>>>>> These require firmware to be loaded and in case devices have ROM those can
>>>>>>>>> also be programmed if empty. If ROM is programmed, it runs from ROM as well.
>>>>>>>>>
>>>>>>>>> This includes two patches from Christian which supported these controllers
>>>>>>>>> w/o ROM and later my patches for ROM support and multiple firmware versions,
>>>>>>>>> debugfs hook for rom erase and export of xhci-pci functions.
>>>>>>>>>

...

>>
>> There are a few other opens regarding this series. Mostly because I'm not (yet)
>> familiar with all the details, so I'll just just list them here.
>>
>> - Is it really enough to add the Renesas driver to Makefile before xhci-pci
>>    driver to make sure it gets matched and probed based on vendor/device id
>>    before xhci-pci driver is matched and probed based on pci class?
>>    What if the Renesas driver is a module and xhci-pci compiled in?
> 
> The driver loading rules are based on level and makefile order. So
> renesas will always be loaded before xhci driver. This is required since
> xhci claims all devices, so we need to make sure it loads before.
> 
> I think we should make it inbuilt driver rather than a module. xhci
> driver is only inbuilt.
> 
> If there is a better way to handle this, am all for it.
> 
>> - Previously probe didn't return before hcd's were added and everything set up.
>>    Now with request_firmware_nowait() probe returns early successfully, and the
>>    old xhci_pci_probe() which sets up everything is called later by the request
>>    firmware callback. So there could be whole new set of races possible.
>>    For example pci remove can be called mid firmware loading, or when the old
>>    xhci_pci_probe is still setting up things.
> 
> I think this is a valid concern. Let me think about how to solve this..
> maybe add a flag in remove which ensure remove doesnt run untill the
> probe/firmware callback is completed.

How about initiating async firmware loading before probe is called by using
DECLARE_PCI_FIXUP_*() hooks?

Probe would then just check if there is a valid running firmware, if not just
defer probe until later (return -EPROBE_DEFER).

No need for a separate Renesas xhci driver, no worries about which driver
claims the device first, no races because of probe returning successfully
too early.

Can we check the device for a valid running firmware without disrupting a
ongoing firmware write?

-Mathias
