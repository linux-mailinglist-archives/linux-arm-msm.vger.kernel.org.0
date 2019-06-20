Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF66C4CD94
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 14:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731695AbfFTMTG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 08:19:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:44198 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731756AbfFTMTG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 08:19:06 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4C54C2080C;
        Thu, 20 Jun 2019 12:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561033144;
        bh=9Vux5wAbBU7Bq4itv05sQDJHjsazKgjTw5ANO58U53o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XuBBmK1+4VsYmnc5Id6qv0EmOccJLhRogocATGKti5K2/M7YcxMCc0AMbCVxPZR5O
         G+P0qah5hM+7Pjk/brfbNFu6fvILx0aTePn4zYOv4ATJKDmJwdBazGR5EmS5IOBoq0
         Dj1nvnssStnRQcX6bzJE0/0jb6k9GjtKaa13UOtY=
Date:   Thu, 20 Jun 2019 14:19:02 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Christian Lamparter <chunkeey@googlemail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 1/5] usb: xhci: add firmware loader for uPD720201 and
 uPD720202 w/o ROM
Message-ID: <20190620121902.GD19295@kroah.com>
References: <20190620102154.20805-1-vkoul@kernel.org>
 <20190620102154.20805-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190620102154.20805-2-vkoul@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 20, 2019 at 03:51:50PM +0530, Vinod Koul wrote:
> From: Christian Lamparter <chunkeey@googlemail.com>
> 
> This patch adds a firmware loader for the uPD720201K8-711-BAC-A
> and uPD720202K8-711-BAA-A variant. Both of these chips are listed
> in Renesas' R19UH0078EJ0500 Rev.5.00 "User's Manual: Hardware" as
> devices which need the firmware loader on page 2 in order to
> work as they "do not support the External ROM".
> 
> The "Firmware Download Sequence" is describe in chapter
> "7.1 FW Download Interface" R19UH0078EJ0500 Rev.5.00 page 131.
> 
> The firmware "K2013080.mem" is available from a USB3.0 Host to
> PCIe Adapter (PP2U-E card) "Firmware download" archive. An
> alternative version can be sourced from Netgear's WNDR4700 GPL
> archives.
> 
> The release notes of the PP2U-E's "Firmware Download" ver 2.0.1.3
> (2012-06-15) state that the firmware is for the following devices:
>  - uPD720201 ES 2.0 sample whose revision ID is 2.
>  - uPD720201 ES 2.1 sample & CS sample & Mass product, ID is 3.
>  - uPD720202 ES 2.0 sample & CS sample & Mass product, ID is 2.
> 
> If someone from Renesas is listening: It would be great, if these
> firmwares could be added to linux-firmware.git.

That paragraph does not need to be in the changelog :)

> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/usb/host/xhci-pci.c | 480 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 480 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index c2fe218e051f..a400cf7b39da 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -12,6 +12,8 @@
>  #include <linux/slab.h>
>  #include <linux/module.h>
>  #include <linux/acpi.h>
> +#include <linux/firmware.h>
> +#include <asm/unaligned.h>

asm/ in a driver?  Are you sure???

>  
>  #include "xhci.h"
>  #include "xhci-trace.h"
> @@ -279,6 +281,458 @@ static void xhci_pme_acpi_rtd3_enable(struct pci_dev *dev)
>  static void xhci_pme_acpi_rtd3_enable(struct pci_dev *dev) { }
>  #endif /* CONFIG_ACPI */
>  
> +static const struct renesas_fw_entry {
> +	const char *firmware_name;
> +	u16 device;
> +	u8 revision;
> +	u16 expected_version;
> +} renesas_fw_table[] = {
> +	/*
> +	 * Only the uPD720201K8-711-BAC-A or uPD720202K8-711-BAA-A
> +	 * are listed in R19UH0078EJ0500 Rev.5.00 as devices which
> +	 * need the software loader.
> +	 *
> +	 * PP2U/ReleaseNote_USB3-201-202-FW.txt:
> +	 *
> +	 * Note: This firmware is for the following devices.
> +	 *  - uPD720201 ES 2.0 sample whose revision ID is 2.
> +	 *  - uPD720201 ES 2.1 sample & CS sample & Mass product, ID is 3.
> +	 *  - uPD720202 ES 2.0 sample & CS sample & Mass product, ID is 2.
> +	 */
> +	{ "K2013080.mem", 0x0014, 0x02, 0x2013 },
> +	{ "K2013080.mem", 0x0014, 0x03, 0x2013 },
> +	{ "K2013080.mem", 0x0015, 0x02, 0x2013 },
> +};

No MODULE_FIRMWARE() entries as well?

> +static const struct renesas_fw_entry *renesas_needs_fw_dl(struct pci_dev *dev)
> +{
> +	const struct renesas_fw_entry *entry;
> +	size_t i;
> +
> +	/* This loader will only work with a RENESAS device. */
> +	if (!(dev->vendor == PCI_VENDOR_ID_RENESAS))
> +		return NULL;
> +
> +	for (i = 0; i < ARRAY_SIZE(renesas_fw_table); i++) {
> +		entry = &renesas_fw_table[i];
> +		if (entry->device == dev->device &&
> +		    entry->revision == dev->revision)
> +			return entry;
> +	}
> +
> +	return NULL;
> +}
> +
> +static int renesas_fw_download_image(struct pci_dev *dev,
> +				     const u32 *fw,
> +				     size_t step)
> +{
> +	size_t i;
> +	int err;
> +	u8 fw_status;
> +	bool data0_or_data1;
> +
> +	/*
> +	 * The hardware does alternate between two 32-bit pages.
> +	 * (This is because each row of the firmware is 8 bytes).
> +	 *
> +	 * for even steps we use DATA0, for odd steps DATA1.
> +	 */
> +	data0_or_data1 = (step & 1) == 1;
> +
> +	/* step+1. Read "Set DATAX" and confirm it is cleared. */
> +	for (i = 0; i < 10000; i++) {
> +		err = pci_read_config_byte(dev, 0xF5, &fw_status);
> +		if (err)
> +			return pcibios_err_to_errno(err);
> +		if (!(fw_status & BIT(data0_or_data1)))
> +			break;
> +
> +		udelay(1);
> +	}
> +	if (i == 10000)
> +		return -ETIMEDOUT;
> +
> +	/*
> +	 * step+2. Write FW data to "DATAX".
> +	 * "LSB is left" => force little endian
> +	 */
> +	err = pci_write_config_dword(dev, data0_or_data1 ? 0xFC : 0xF8,
> +				     (__force u32) cpu_to_le32(fw[step]));
> +	if (err)
> +		return pcibios_err_to_errno(err);
> +
> +	udelay(100);
> +
> +	/* step+3. Set "Set DATAX". */
> +	err = pci_write_config_byte(dev, 0xF5, BIT(data0_or_data1));
> +	if (err)
> +		return pcibios_err_to_errno(err);
> +

Shouldn't you just do a read after the write to be sure the write
actually went out on the wire?  Then you shouldn't have to do the
udelay, right?

> +	return 0;
> +}
> +
> +static int renesas_fw_verify(struct pci_dev *dev,
> +			     const void *fw_data,
> +			     size_t length)
> +{
> +	const struct renesas_fw_entry *entry = renesas_needs_fw_dl(dev);
> +	u16 fw_version_pointer;
> +	u16 fw_version;
> +
> +	if (!entry)
> +		return -EINVAL;
> +
> +	/*
> +	 * The Firmware's Data Format is describe in
> +	 * "6.3 Data Format" R19UH0078EJ0500 Rev.5.00 page 124
> +	 */
> +
> +	/* "Each row is 8 bytes". => firmware size must be a multiple of 8. */
> +	if (length % 8 != 0) {
> +		dev_err(&dev->dev, "firmware size is not a multipe of 8.");

"multiple"

> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * The bootrom chips of the big brother have sizes up to 64k, let's
> +	 * assume that's the biggest the firmware can get.
> +	 */
> +	if (length < 0x1000 || length >= 0x10000) {
> +		dev_err(&dev->dev, "firmware is size %zd is not (4k - 64k).",
> +			length);
> +		return -EINVAL;
> +	}
> +
> +	/* The First 2 bytes are fixed value (55aa). "LSB on Left" */
> +	if (get_unaligned_le16(fw_data) != 0x55aa) {
> +		dev_err(&dev->dev, "no valid firmware header found.");
> +		return -EINVAL;
> +	}
> +
> +	/* verify the firmware version position and print it. */
> +	fw_version_pointer = get_unaligned_le16(fw_data + 4);
> +	if (fw_version_pointer + 2 >= length) {
> +		dev_err(&dev->dev, "firmware version pointer is outside of the firmware image.");
> +		return -EINVAL;
> +	}
> +
> +	fw_version = get_unaligned_le16(fw_data + fw_version_pointer);
> +	dev_dbg(&dev->dev, "got firmware version: %02x.", fw_version);
> +
> +	if (fw_version != entry->expected_version) {
> +		dev_err(&dev->dev, "firmware version mismatch, expected version: %02x.",
> +			 entry->expected_version);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int renesas_hw_check_run_stop_busy(struct pci_dev *pdev)
> +{
> +#if 0
> +	u32 val;
> +
> +	/*
> +	 * 7.1.3 Note 3: "... must not set 'FW Download Enable' when
> +	 * 'RUN/STOP' of USBCMD Register is set"
> +	 */
> +	val = readl(hcd->regs + 0x20);
> +	if (val & BIT(0)) {
> +		dev_err(&pdev->dev, "hardware is busy and can't receive a FW.");
> +		return -EBUSY;
> +	}
> +#endif
> +	return 0;
> +}
> +

Is this function still really needed anymore?


> +	/*
> +	 * 11. After finishing writing the last data of FW, the
> +	 * System Software must clear "FW Download Enable"
> +	 */
> +	err = pci_write_config_byte(pdev, 0xF4, 0);
> +	if (err)
> +		return pcibios_err_to_errno(err);
> +
> +	/* 12. Read "Result Code" and confirm it is good. */
> +	for (i = 0; i < 10000; i++) {
> +		err = pci_read_config_byte(pdev, 0xF4, &fw_status);
> +		if (err)
> +			return pcibios_err_to_errno(err);
> +		if (fw_status & BIT(4))
> +			break;
> +
> +		udelay(1);
> +	}

1000 reads???  I've heard of having to read a few times to ensure
something "latched" in the device, but not 1000.  Why so many?

> +	if (i == 10000) {
> +		/* Timed out / Error - let's see if we can fix this */
> +		err = renesas_fw_check_running(pdev);
> +		switch (err) {
> +		case 0: /*
> +			 * we shouldn't end up here.
> +			 * maybe it took a little bit longer.
> +			 * But all should be well?
> +			 */
> +			break;
> +
> +		case 1: /* (No result yet? - we can try to retry) */
> +			if (retry_counter < 10) {
> +				retry_counter++;
> +				dev_warn(&pdev->dev, "Retry Firmware download: %d try.",
> +					  retry_counter);
> +				return renesas_fw_download(pdev, fw,
> +							   retry_counter);

recursion?

> +			}
> +			return -ETIMEDOUT;
> +
> +		default:
> +			return err;
> +		}
> +	}
> +	/*
> +	 * Optional last step: Engage Firmware Lock
> +	 *
> +	 * err = pci_write_config_byte(pdev, 0xF4, BIT(2));
> +	 * if (err)
> +	 *	return pcibios_err_to_errno(err);
> +	 */
> +
> +	return 0;
> +}
> +
> +struct renesas_fw_ctx {
> +	struct pci_dev *pdev;
> +	const struct pci_device_id *id;
> +	bool resume;
> +};
> +
> +static int xhci_pci_probe(struct pci_dev *pdev,
> +			  const struct pci_device_id *id);
> +
> +static void renesas_fw_callback(const struct firmware *fw,
> +				void *context)
> +{
> +	struct renesas_fw_ctx *ctx = context;
> +	struct pci_dev *pdev = ctx->pdev;
> +	struct device *parent = pdev->dev.parent;
> +	int err = -ENOENT;
> +
> +	if (fw) {
> +		err = renesas_fw_verify(pdev, fw->data, fw->size);
> +		if (!err) {
> +			err = renesas_fw_download(pdev, fw, 0);
> +			release_firmware(fw);
> +			if (!err) {
> +				if (ctx->resume)
> +					return;
> +
> +				err = xhci_pci_probe(pdev, ctx->id);
> +				if (!err) {
> +					/* everything worked */
> +					devm_kfree(&pdev->dev, ctx);
> +					return;
> +				}
> +
> +				/* in case of an error - fall through */
> +			} else {
> +				dev_err(&pdev->dev, "firmware failed to download (%d).",
> +					err);
> +			}
> +		}
> +	} else {
> +		dev_err(&pdev->dev, "firmware failed to load (%d).", err);
> +	}

This can be cleaned up a lot by just erroring out when something
happens, and then jumping to the end.  Not this nested if mess.

> +
> +	dev_info(&pdev->dev, "Unloading driver");
> +
> +	if (parent)
> +		device_lock(parent);
> +
> +	device_release_driver(&pdev->dev);
> +
> +	if (parent)
> +		device_unlock(parent);
> +
> +	pci_dev_put(pdev);
> +}
> +
> +static int renesas_fw_alive_check(struct pci_dev *pdev)
> +{
> +	const struct renesas_fw_entry *entry;
> +	int err;
> +
> +	/* check if we have a eligible RENESAS' uPD720201/2 w/o FW. */
> +	entry = renesas_needs_fw_dl(pdev);
> +	if (!entry)
> +		return 0;
> +
> +	err = renesas_fw_check_running(pdev);
> +	/* Also go ahead, if the firmware is running */
> +	if (err == 0)
> +		return 0;
> +
> +	/* At this point, we can be sure that the FW isn't ready. */
> +	return err;

Why not just:
	return renesas_fw_check_running(pdev);
?

thanks,

greg k-h
