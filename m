Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5ED424DFCD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2019 06:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbfFUEpy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jun 2019 00:45:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:37344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725832AbfFUEpy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jun 2019 00:45:54 -0400
Received: from localhost (unknown [106.201.116.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3365F2083B;
        Fri, 21 Jun 2019 04:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561092352;
        bh=Mhw2ACRYptcCFbtFmoBv2yAE619tqf6iPtrxajbwUZ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q0IPszvkSKTbvzSTsC/RZHyy+SqY6C+g5XHtTFfT1RrgVZK/gSs3/gyq20TSOOmSL
         M39OaieIlhYsty+eRXMDjvwZDfmwrbUkd22+YWil+mSd+xdy/eE48VbQkF2fmx4Z0c
         DEYyshSCPE4kqhNpWQD0LuECpywKZ/evzLtPUXR4=
Date:   Fri, 21 Jun 2019 10:12:42 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Christian Lamparter <chunkeey@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Christian Lamparter <chunkeey@googlemail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 1/5] usb: xhci: add firmware loader for uPD720201 and
 uPD720202 w/o ROM
Message-ID: <20190621044242.GQ2962@vkoul-mobl>
References: <20190620102154.20805-1-vkoul@kernel.org>
 <20190620121902.GD19295@kroah.com>
 <20190620170358.GO2962@vkoul-mobl>
 <2465888.R7Jb3LzrEU@debian64>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2465888.R7Jb3LzrEU@debian64>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-06-19, 21:12, Christian Lamparter wrote:
> On Thursday, June 20, 2019 7:03:58 PM CEST Vinod Koul wrote:
> > On 20-06-19, 14:19, Greg Kroah-Hartman wrote:
> > > On Thu, Jun 20, 2019 at 03:51:50PM +0530, Vinod Koul wrote:
> > > > From: Christian Lamparter <chunkeey@googlemail.com>
> > > > 
> > > > This patch adds a firmware loader for the uPD720201K8-711-BAC-A
> > > > and uPD720202K8-711-BAA-A variant. Both of these chips are listed
> > > > in Renesas' R19UH0078EJ0500 Rev.5.00 "User's Manual: Hardware" as
> > > > devices which need the firmware loader on page 2 in order to
> > > > work as they "do not support the External ROM".
> > > > 
> > > > The "Firmware Download Sequence" is describe in chapter
> > > > "7.1 FW Download Interface" R19UH0078EJ0500 Rev.5.00 page 131.
> > > > 
> > > > The firmware "K2013080.mem" is available from a USB3.0 Host to
> > > > PCIe Adapter (PP2U-E card) "Firmware download" archive. An
> > > > alternative version can be sourced from Netgear's WNDR4700 GPL
> > > > archives.
> > > > 
> > > > The release notes of the PP2U-E's "Firmware Download" ver 2.0.1.3
> > > > (2012-06-15) state that the firmware is for the following devices:
> > > >  - uPD720201 ES 2.0 sample whose revision ID is 2.
> > > >  - uPD720201 ES 2.1 sample & CS sample & Mass product, ID is 3.
> > > >  - uPD720202 ES 2.0 sample & CS sample & Mass product, ID is 2.
> > > > 
> > > > If someone from Renesas is listening: It would be great, if these
> > > > firmwares could be added to linux-firmware.git.
> > > 
> > > That paragraph does not need to be in the changelog :)
> > 
> > Sure will drop :)
> 
> ... those this mean that there is a firmware now? Do you have a link to it?

Unfortunately it is not public yet!

> > > >  #include <linux/slab.h>
> > > >  #include <linux/module.h>
> > > >  #include <linux/acpi.h>
> > > > +#include <linux/firmware.h>
> > > > +#include <asm/unaligned.h>
> > > 
> > > asm/ in a driver?  Are you sure???
> > 
> > Not sure :D, will check and remove
> 
> I think, as long as there is a "get_unaligned_le16" defined somewhere
> it should be fine.
> 
> This was a loong ago, the loader was developped on a PowerPC 464, but
> from what I remember it was checkpatch that didn't like the "unaligned"
> poking around in the firmware below.

It seems we have this in include/linux/unaligned/access_ok.h, so I will
add that instead

> > > > +static int renesas_fw_download_image(struct pci_dev *dev,
> > > > +				     const u32 *fw,
> > > > +				     size_t step)
> > > > +{
> > > > +	size_t i;
> > > > +	int err;
> > > > +	u8 fw_status;
> > > > +	bool data0_or_data1;
> > > > +
> > > > +	/*
> > > > +	 * The hardware does alternate between two 32-bit pages.
> > > > +	 * (This is because each row of the firmware is 8 bytes).
> > > > +	 *
> > > > +	 * for even steps we use DATA0, for odd steps DATA1.
> > > > +	 */
> > > > +	data0_or_data1 = (step & 1) == 1;
> > > > +
> > > > +	/* step+1. Read "Set DATAX" and confirm it is cleared. */
> > > > +	for (i = 0; i < 10000; i++) {
> > > > +		err = pci_read_config_byte(dev, 0xF5, &fw_status);
> > > > +		if (err)
> > > > +			return pcibios_err_to_errno(err);
> > > > +		if (!(fw_status & BIT(data0_or_data1)))
> > > > +			break;
> > > > +
> > > > +		udelay(1);
> > > > +	}
> > > > +	if (i == 10000)
> > > > +		return -ETIMEDOUT;
> > > > +
> > > > +	/*
> > > > +	 * step+2. Write FW data to "DATAX".
> > > > +	 * "LSB is left" => force little endian
> > > > +	 */
> > > > +	err = pci_write_config_dword(dev, data0_or_data1 ? 0xFC : 0xF8,
> > > > +				     (__force u32) cpu_to_le32(fw[step]));
> > > > +	if (err)
> > > > +		return pcibios_err_to_errno(err);
> > > > +
> > > > +	udelay(100);
> > > > +
> > > > +	/* step+3. Set "Set DATAX". */
> > > > +	err = pci_write_config_byte(dev, 0xF5, BIT(data0_or_data1));
> > > > +	if (err)
> > > > +		return pcibios_err_to_errno(err);
> > > > +
> > > 
> > > Shouldn't you just do a read after the write to be sure the write
> > > actually went out on the wire?  Then you shouldn't have to do the
> > > udelay, right?
> > 
> > Well I am not sure that is how it works. The register is a DATA register
> > on the controller. We are writing to the memory of the controller here
> > and after writing DATA0 and DATA1 we check the Set DATA0 & Set DATA1
> > bits and write subsequenly only when controller is ready to accept more
> > data.
> > 
> > I do recall at least for ROM load (writing to NOR flash attached to
> > controller), we need to wait considerably more before the SetData0/1 was
> > set and ready for subsequent write
> 
> OffTopic: There's some leeway here. From what I remember you could just push
> the data through DATA0 and cut down on the logic. But this was slower than
> using both DATA0 and DATA1.
> 
> The udelay was placed because I vaguely remember that polling SET DATA0
> over and over slowed down the firmware download.
> So the intention was to have the 100µs as a baseline and then we don't
> slow down and waste more cycles in "step+1".

Yes I have seen that as well, lesser polling helps. I will reduce cycles
and add delay.

Btw would it be possible for you to test the series?

Thanks for quick reply, will post v2 shortly

-- 
~Vinod
