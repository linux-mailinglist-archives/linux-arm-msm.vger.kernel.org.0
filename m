Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED7414DF97
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2020 18:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727193AbgA3RFf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jan 2020 12:05:35 -0500
Received: from mga09.intel.com ([134.134.136.24]:16487 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727158AbgA3RFf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jan 2020 12:05:35 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Jan 2020 09:05:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,382,1574150400"; 
   d="scan'208";a="309759519"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga001.jf.intel.com with ESMTP; 30 Jan 2020 09:05:13 -0800
Subject: Re: [PATCH v6 0/5] usb: xhci: Add support for Renesas USB controllers
To:     Vinod Koul <vkoul@kernel.org>,
        Christian Lamparter <chunkeey@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     John Stultz <john.stultz@linaro.org>,
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
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <64340358-6682-4ae0-9c06-d72d5a4ff259@linux.intel.com>
Date:   Thu, 30 Jan 2020 19:07:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200125053237.GG2841@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25.1.2020 7.32, Vinod Koul wrote:
>>>>>>
>>>>>> On Mon, Jan 13, 2020 at 12:42 AM Vinod Koul <vkoul@kernel.org> wrote:
>>>>>>>
>>>>>>> This series add support for Renesas USB controllers uPD720201 and uPD720202.
>>>>>>> These require firmware to be loaded and in case devices have ROM those can
>>>>>>> also be programmed if empty. If ROM is programmed, it runs from ROM as well.
>>>>>>>
>>>>>>> This includes two patches from Christian which supported these controllers
>>>>>>> w/o ROM and later my patches for ROM support and multiple firmware versions,
>>>>>>> debugfs hook for rom erase and export of xhci-pci functions.
>>>>>>>
...
> 
> Mathias, any comments on this series..?
> 

Hi Vinod

Sorry about the delay.

Maybe a firmware loading driver like this that wraps the xhci pci driver could
work.

One benefit is that we could skip searching for the right firmware name based
on PCI ID. Each of these Renesas controllers now have their own pci_device_id
entry in the pci_ids[] table, and could have the supported firmware name(s)
in .driver_data. This way we wouldn't need to add the renesas_fw_table[] or
maybe even the renesas_needs_fw_dl() function in this series.

I realize this can't be easily changed because usb_hcd_pci_probe() takes the
pci_device_id pointer as an argument, and expects id.driver_data to be a
HC driver pointer.

So this turns out to be a question for Greg and Alan:

Would it make sense to change usb_hcd_pci_probe() to take a HC driver pointer
as an argument instead of a pointer to pci_device_id?
pci_device_id pointer is only used to extract the HC driver handle.
This way the driver_data could be used for, well, driver data.

Heikki actually suggested this some time ago to me, back then the idea was to
improve xhci quirks code by using driver_data for quirk flags instead of
finding and setting them later.

There are a few other opens regarding this series. Mostly because I'm not (yet)
familiar with all the details, so I'll just just list them here.

- Is it really enough to add the Renesas driver to Makefile before xhci-pci
   driver to make sure it gets matched and probed based on vendor/device id
   before xhci-pci driver is matched and probed based on pci class?
   What if the Renesas driver is a module and xhci-pci compiled in?

- Previously probe didn't return before hcd's were added and everything set up.
   Now with request_firmware_nowait() probe returns early successfully, and the
   old xhci_pci_probe() which sets up everything is called later by the request
   firmware callback. So there could be whole new set of races possible.
   For example pci remove can be called mid firmware loading, or when the old
   xhci_pci_probe is still setting up things.

   I understood that a synchronous request_firmware() in probe has its own
   issues, not sure if there is a good solution for this.

- Before the firmware is written to the controller the firmware version is
   compared against a hardcoded number in the drivers renesas_fw_table[].
   This means new firmware versions can't be supported without patching the driver.
   Is this intentional?

- Mathias
