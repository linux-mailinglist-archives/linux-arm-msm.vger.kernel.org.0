Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFA444D485
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 19:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbfFTRHK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 13:07:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:42440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726562AbfFTRHK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 13:07:10 -0400
Received: from localhost (unknown [106.51.107.82])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8DA8220675;
        Thu, 20 Jun 2019 17:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561050428;
        bh=Nfavi00IkuMYAzCY6l3FBh3gikpBiq6TtUEzGfP7zHE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=npWRTXHUJprhuEIxiYycR0zLTYfVgT4IGruuPrJV1ySOe7z8Bs1LHY3/inR6nzw9A
         jfV0TECsf9gzRLnWvS1O4CiWNystn9BUXTsi+q78zXD5deGXub5uny2LJqTJQO1Vu6
         qJzmMBc2DB0WGGm6seiFfM70dyZd5ujmxnJUs9R8=
Date:   Thu, 20 Jun 2019 22:33:58 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Christian Lamparter <chunkeey@googlemail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 1/5] usb: xhci: add firmware loader for uPD720201 and
 uPD720202 w/o ROM
Message-ID: <20190620170358.GO2962@vkoul-mobl>
References: <20190620102154.20805-1-vkoul@kernel.org>
 <20190620102154.20805-2-vkoul@kernel.org>
 <20190620121902.GD19295@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190620121902.GD19295@kroah.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Greg for a quick review :)

On 20-06-19, 14:19, Greg Kroah-Hartman wrote:
> On Thu, Jun 20, 2019 at 03:51:50PM +0530, Vinod Koul wrote:
> > From: Christian Lamparter <chunkeey@googlemail.com>
> > 
> > This patch adds a firmware loader for the uPD720201K8-711-BAC-A
> > and uPD720202K8-711-BAA-A variant. Both of these chips are listed
> > in Renesas' R19UH0078EJ0500 Rev.5.00 "User's Manual: Hardware" as
> > devices which need the firmware loader on page 2 in order to
> > work as they "do not support the External ROM".
> > 
> > The "Firmware Download Sequence" is describe in chapter
> > "7.1 FW Download Interface" R19UH0078EJ0500 Rev.5.00 page 131.
> > 
> > The firmware "K2013080.mem" is available from a USB3.0 Host to
> > PCIe Adapter (PP2U-E card) "Firmware download" archive. An
> > alternative version can be sourced from Netgear's WNDR4700 GPL
> > archives.
> > 
> > The release notes of the PP2U-E's "Firmware Download" ver 2.0.1.3
> > (2012-06-15) state that the firmware is for the following devices:
> >  - uPD720201 ES 2.0 sample whose revision ID is 2.
> >  - uPD720201 ES 2.1 sample & CS sample & Mass product, ID is 3.
> >  - uPD720202 ES 2.0 sample & CS sample & Mass product, ID is 2.
> > 
> > If someone from Renesas is listening: It would be great, if these
> > firmwares could be added to linux-firmware.git.
> 
> That paragraph does not need to be in the changelog :)

Sure will drop :)

> >  #include <linux/slab.h>
> >  #include <linux/module.h>
> >  #include <linux/acpi.h>
> > +#include <linux/firmware.h>
> > +#include <asm/unaligned.h>
> 
> asm/ in a driver?  Are you sure???

Not sure :D, will check and remove

> > +static const struct renesas_fw_entry {
> > +	const char *firmware_name;
> > +	u16 device;
> > +	u8 revision;
> > +	u16 expected_version;
> > +} renesas_fw_table[] = {
> > +	/*
> > +	 * Only the uPD720201K8-711-BAC-A or uPD720202K8-711-BAA-A
> > +	 * are listed in R19UH0078EJ0500 Rev.5.00 as devices which
> > +	 * need the software loader.
> > +	 *
> > +	 * PP2U/ReleaseNote_USB3-201-202-FW.txt:
> > +	 *
> > +	 * Note: This firmware is for the following devices.
> > +	 *  - uPD720201 ES 2.0 sample whose revision ID is 2.
> > +	 *  - uPD720201 ES 2.1 sample & CS sample & Mass product, ID is 3.
> > +	 *  - uPD720202 ES 2.0 sample & CS sample & Mass product, ID is 2.
> > +	 */
> > +	{ "K2013080.mem", 0x0014, 0x02, 0x2013 },
> > +	{ "K2013080.mem", 0x0014, 0x03, 0x2013 },
> > +	{ "K2013080.mem", 0x0015, 0x02, 0x2013 },
> > +};
> 
> No MODULE_FIRMWARE() entries as well?

Ah I wasnt even aware we had that, thanks for pointing it out, will add.

> > +static int renesas_fw_download_image(struct pci_dev *dev,
> > +				     const u32 *fw,
> > +				     size_t step)
> > +{
> > +	size_t i;
> > +	int err;
> > +	u8 fw_status;
> > +	bool data0_or_data1;
> > +
> > +	/*
> > +	 * The hardware does alternate between two 32-bit pages.
> > +	 * (This is because each row of the firmware is 8 bytes).
> > +	 *
> > +	 * for even steps we use DATA0, for odd steps DATA1.
> > +	 */
> > +	data0_or_data1 = (step & 1) == 1;
> > +
> > +	/* step+1. Read "Set DATAX" and confirm it is cleared. */
> > +	for (i = 0; i < 10000; i++) {
> > +		err = pci_read_config_byte(dev, 0xF5, &fw_status);
> > +		if (err)
> > +			return pcibios_err_to_errno(err);
> > +		if (!(fw_status & BIT(data0_or_data1)))
> > +			break;
> > +
> > +		udelay(1);
> > +	}
> > +	if (i == 10000)
> > +		return -ETIMEDOUT;
> > +
> > +	/*
> > +	 * step+2. Write FW data to "DATAX".
> > +	 * "LSB is left" => force little endian
> > +	 */
> > +	err = pci_write_config_dword(dev, data0_or_data1 ? 0xFC : 0xF8,
> > +				     (__force u32) cpu_to_le32(fw[step]));
> > +	if (err)
> > +		return pcibios_err_to_errno(err);
> > +
> > +	udelay(100);
> > +
> > +	/* step+3. Set "Set DATAX". */
> > +	err = pci_write_config_byte(dev, 0xF5, BIT(data0_or_data1));
> > +	if (err)
> > +		return pcibios_err_to_errno(err);
> > +
> 
> Shouldn't you just do a read after the write to be sure the write
> actually went out on the wire?  Then you shouldn't have to do the
> udelay, right?

Well I am not sure that is how it works. The register is a DATA register
on the controller. We are writing to the memory of the controller here
and after writing DATA0 and DATA1 we check the Set DATA0 & Set DATA1
bits and write subsequenly only when controller is ready to accept more
data.

I do recall at least for ROM load (writing to NOR flash attached to
controller), we need to wait considerably more before the SetData0/1 was
set and ready for subsequent write

> > +static int renesas_fw_verify(struct pci_dev *dev,
> > +			     const void *fw_data,
> > +			     size_t length)
> > +{
> > +	const struct renesas_fw_entry *entry = renesas_needs_fw_dl(dev);
> > +	u16 fw_version_pointer;
> > +	u16 fw_version;
> > +
> > +	if (!entry)
> > +		return -EINVAL;
> > +
> > +	/*
> > +	 * The Firmware's Data Format is describe in
> > +	 * "6.3 Data Format" R19UH0078EJ0500 Rev.5.00 page 124
> > +	 */
> > +
> > +	/* "Each row is 8 bytes". => firmware size must be a multiple of 8. */
> > +	if (length % 8 != 0) {
> > +		dev_err(&dev->dev, "firmware size is not a multipe of 8.");
> 
> "multiple"

Yes will fix

> > +static int renesas_hw_check_run_stop_busy(struct pci_dev *pdev)
> > +{
> > +#if 0
> > +	u32 val;
> > +
> > +	/*
> > +	 * 7.1.3 Note 3: "... must not set 'FW Download Enable' when
> > +	 * 'RUN/STOP' of USBCMD Register is set"
> > +	 */
> > +	val = readl(hcd->regs + 0x20);
> > +	if (val & BIT(0)) {
> > +		dev_err(&pdev->dev, "hardware is busy and can't receive a FW.");
> > +		return -EBUSY;
> > +	}
> > +#endif
> > +	return 0;
> > +}
> > +
> 
> Is this function still really needed anymore?

Nope I will drop it unless Christian objects

> > +	/*
> > +	 * 11. After finishing writing the last data of FW, the
> > +	 * System Software must clear "FW Download Enable"
> > +	 */
> > +	err = pci_write_config_byte(pdev, 0xF4, 0);
> > +	if (err)
> > +		return pcibios_err_to_errno(err);
> > +
> > +	/* 12. Read "Result Code" and confirm it is good. */
> > +	for (i = 0; i < 10000; i++) {
> > +		err = pci_read_config_byte(pdev, 0xF4, &fw_status);
> > +		if (err)
> > +			return pcibios_err_to_errno(err);
> > +		if (fw_status & BIT(4))
> > +			break;
> > +
> > +		udelay(1);
> > +	}
> 
> 1000 reads???  I've heard of having to read a few times to ensure
> something "latched" in the device, but not 1000.  Why so many?

For ROM load it did need significant time, I will check if we can go down
to 100 here

> > +	if (i == 10000) {
> > +		/* Timed out / Error - let's see if we can fix this */
> > +		err = renesas_fw_check_running(pdev);
> > +		switch (err) {
> > +		case 0: /*
> > +			 * we shouldn't end up here.
> > +			 * maybe it took a little bit longer.
> > +			 * But all should be well?
> > +			 */
> > +			break;
> > +
> > +		case 1: /* (No result yet? - we can try to retry) */
> > +			if (retry_counter < 10) {
> > +				retry_counter++;
> > +				dev_warn(&pdev->dev, "Retry Firmware download: %d try.",
> > +					  retry_counter);
> > +				return renesas_fw_download(pdev, fw,
> > +							   retry_counter);
> 
> recursion?

I didnt encounter the need, we should remove it unless Christian objects

> > +static void renesas_fw_callback(const struct firmware *fw,
> > +				void *context)
> > +{
> > +	struct renesas_fw_ctx *ctx = context;
> > +	struct pci_dev *pdev = ctx->pdev;
> > +	struct device *parent = pdev->dev.parent;
> > +	int err = -ENOENT;
> > +
> > +	if (fw) {
> > +		err = renesas_fw_verify(pdev, fw->data, fw->size);
> > +		if (!err) {
> > +			err = renesas_fw_download(pdev, fw, 0);
> > +			release_firmware(fw);
> > +			if (!err) {
> > +				if (ctx->resume)
> > +					return;
> > +
> > +				err = xhci_pci_probe(pdev, ctx->id);
> > +				if (!err) {
> > +					/* everything worked */
> > +					devm_kfree(&pdev->dev, ctx);
> > +					return;
> > +				}
> > +
> > +				/* in case of an error - fall through */
> > +			} else {
> > +				dev_err(&pdev->dev, "firmware failed to download (%d).",
> > +					err);
> > +			}
> > +		}
> > +	} else {
> > +		dev_err(&pdev->dev, "firmware failed to load (%d).", err);
> > +	}
> 
> This can be cleaned up a lot by just erroring out when something
> happens, and then jumping to the end.  Not this nested if mess.

will do

> > +	err = renesas_fw_check_running(pdev);
> > +	/* Also go ahead, if the firmware is running */
> > +	if (err == 0)
> > +		return 0;
> > +
> > +	/* At this point, we can be sure that the FW isn't ready. */
> > +	return err;
> 
> Why not just:
> 	return renesas_fw_check_running(pdev);

sounds good, will change :)

-- 
~Vinod
