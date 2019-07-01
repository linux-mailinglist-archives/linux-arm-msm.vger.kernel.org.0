Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8725B3B1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2019 06:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727441AbfGAEtM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jul 2019 00:49:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:48430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726869AbfGAEtM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jul 2019 00:49:12 -0400
Received: from localhost (unknown [122.167.76.109])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C86A2208C4;
        Mon,  1 Jul 2019 04:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561956550;
        bh=MeibqhTdDfCAsqbjKRdLjxNC4WKCBVBalhxKXZkM3xA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uxcgjBa53h6MnwAqx+DpOxr8zzl8zZKgza8Qz6oMV0g8bkC6akU+d09GsjUwpO/kE
         fSKYuFXI0Fc7yjLP4uvmrXZjihr/ICtTN/uui1N60RQENzn4+GGB1P3UoqWPfPHlTM
         BcT4eTweWb2BygsIn5tq6qqa6eYanbakRry1OecA=
Date:   Mon, 1 Jul 2019 10:15:56 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Christian Lamparter <chunkeey@googlemail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH v4 1/4] usb: xhci: add firmware loader for uPD720201 and
 uPD720202 w/o ROM
Message-ID: <20190701044556.GG2911@vkoul-mobl>
References: <20190626075509.20445-1-vkoul@kernel.org>
 <20190626075509.20445-2-vkoul@kernel.org>
 <77f83bc3-f265-14f7-716b-695560c9ef4e@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77f83bc3-f265-14f7-716b-695560c9ef4e@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29-06-19, 00:40, Mathias Nyman wrote:
> On 26.6.2019 10.55, Vinod Koul wrote:
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
> >   - uPD720201 ES 2.0 sample whose revision ID is 2.
> >   - uPD720201 ES 2.1 sample & CS sample & Mass product, ID is 3.
> >   - uPD720202 ES 2.0 sample & CS sample & Mass product, ID is 2.
> > 
> > Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > [vkoul: fixed comments:
> > 	used macros for timeout count and delay
> > 	removed renesas_fw_alive_check
> > 	cleaned renesas_fw_callback
> > 	removed recurion for renesas_fw_download
> > 	added MODULE_FIRMWARE]
> > Tested-by: Christian Lamparter <chunkeey@gmail.com>
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >   drivers/usb/host/xhci-pci.c | 454 ++++++++++++++++++++++++++++++++++++
> >   1 file changed, 454 insertions(+)
> > 
> > diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> > index c2fe218e051f..237df5c47fca 100644
> > --- a/drivers/usb/host/xhci-pci.c
> > +++ b/drivers/usb/host/xhci-pci.c
> > @@ -12,6 +12,8 @@
> >   #include <linux/slab.h>
> >   #include <linux/module.h>
> >   #include <linux/acpi.h>
> > +#include <linux/firmware.h>
> > +#include <linux/unaligned/access_ok.h>
> >   #include "xhci.h"
> >   #include "xhci-trace.h"
> > @@ -55,6 +57,9 @@
> >   #define PCI_DEVICE_ID_AMD_PROMONTORYA_1			0x43bc
> >   #define PCI_DEVICE_ID_ASMEDIA_1042A_XHCI		0x1142
> > +#define RENESAS_RETRY	10000
> > +#define RENESAS_DELAY	10
> > +
> >   static const char hcd_name[] = "xhci_hcd";
> >   static struct hc_driver __read_mostly xhci_pci_hc_driver;
> > @@ -279,6 +284,429 @@ static void xhci_pme_acpi_rtd3_enable(struct pci_dev *dev)
> >   static void xhci_pme_acpi_rtd3_enable(struct pci_dev *dev) { }
> >   #endif /* CONFIG_ACPI */
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
> > +
> > +MODULE_FIRMWARE("K2013080.mem");
> > +
> > +static const struct renesas_fw_entry *renesas_needs_fw_dl(struct pci_dev *dev)
> > +{
> > +	const struct renesas_fw_entry *entry;
> > +	size_t i;
> > +
> > +	/* This loader will only work with a RENESAS device. */
> > +	if (!(dev->vendor == PCI_VENDOR_ID_RENESAS))
> > +		return NULL;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(renesas_fw_table); i++) {
> > +		entry = &renesas_fw_table[i];
> > +		if (entry->device == dev->device &&
> > +		    entry->revision == dev->revision)
> > +			return entry;
> > +	}
> > +
> > +	return NULL;
> > +}
> > +
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
> > +	for (i = 0; i < RENESAS_RETRY; i++) {
> > +		err = pci_read_config_byte(dev, 0xF5, &fw_status);
> > +		if (err)
> > +			return pcibios_err_to_errno(err);
> > +		if (!(fw_status & BIT(data0_or_data1)))
> > +			break;
> > +
> > +		udelay(RENESAS_DELAY);
> > +	}
> > +	if (i == RENESAS_RETRY)
> > +		return -ETIMEDOUT;
> > +
> > +	/*
> > +	 * step+2. Write FW data to "DATAX".
> > +	 * "LSB is left" => force little endian
> > +	 */
> > +	err = pci_write_config_dword(dev, data0_or_data1 ? 0xFC : 0xF8,
> > +				     (__force u32)cpu_to_le32(fw[step]));
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
> > +	return 0;
> > +}
> > +
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
> > +	/*
> > +	 * The bootrom chips of the big brother have sizes up to 64k, let's
> > +	 * assume that's the biggest the firmware can get.
> > +	 */
> > +	if (length < 0x1000 || length >= 0x10000) {
> > +		dev_err(&dev->dev, "firmware is size %zd is not (4k - 64k).",
> > +			length);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* The First 2 bytes are fixed value (55aa). "LSB on Left" */
> > +	if (get_unaligned_le16(fw_data) != 0x55aa) {
> > +		dev_err(&dev->dev, "no valid firmware header found.");
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* verify the firmware version position and print it. */
> > +	fw_version_pointer = get_unaligned_le16(fw_data + 4);
> > +	if (fw_version_pointer + 2 >= length) {
> > +		dev_err(&dev->dev,
> > +			"firmware version pointer is outside of the firmware image.");
> > +		return -EINVAL;
> > +	}
> > +
> > +	fw_version = get_unaligned_le16(fw_data + fw_version_pointer);
> > +	dev_dbg(&dev->dev, "got firmware version: %02x.", fw_version);
> > +
> > +	if (fw_version != entry->expected_version) {
> > +		dev_err(&dev->dev,
> > +			"firmware version mismatch, expected version: %02x.",
> > +			entry->expected_version);
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int renesas_fw_check_running(struct pci_dev *pdev)
> > +{
> > +	int err;
> > +	u8 fw_state;
> > +
> > +	/*
> > +	 * Test if the device is actually needing the firmware. As most
> > +	 * BIOSes will initialize the device for us. If the device is
> > +	 * initialized.
> > +	 */
> > +	err = pci_read_config_byte(pdev, 0xF4, &fw_state);
> > +	if (err)
> > +		return pcibios_err_to_errno(err);
> > +
> > +	/*
> > +	 * Check if "FW Download Lock" is locked. If it is and the FW is
> > +	 * ready we can simply continue. If the FW is not ready, we have
> > +	 * to give up.
> > +	 */
> > +	if (fw_state & BIT(1)) {
> > +		dev_dbg(&pdev->dev, "FW Download Lock is engaged.");
> > +
> > +		if (fw_state & BIT(4))
> > +			return 0;
> > +
> > +		dev_err(&pdev->dev,
> > +			"FW Download Lock is set and FW is not ready. Giving Up.");
> > +		return -EIO;
> > +	}
> > +
> > +	/*
> > +	 * Check if "FW Download Enable" is set. If someone (us?) tampered
> > +	 * with it and it can't be resetted, we have to give up too... and
> > +	 * ask for a forgiveness and a reboot.
> > +	 */
> > +	if (fw_state & BIT(0)) {
> > +		dev_err(&pdev->dev,
> > +			"FW Download Enable is stale. Giving Up (poweroff/reboot needed).");
> > +		return -EIO;
> > +	}
> > +
> > +	/* Otherwise, Check the "Result Code" Bits (6:4) and act accordingly */
> > +	switch ((fw_state & 0x70)) {
> > +	case 0: /* No result yet */
> > +		dev_dbg(&pdev->dev, "FW is not ready/loaded yet.");
> > +
> > +		/* tell the caller, that this device needs the firmware. */
> > +		return 1;
> > +
> > +	case BIT(4): /* Success, device should be working. */
> > +		dev_dbg(&pdev->dev, "FW is ready.");
> > +		return 0;
> > +
> > +	case BIT(5): /* Error State */
> > +		dev_err(&pdev->dev,
> > +			"hardware is in an error state. Giving up (poweroff/reboot needed).");
> > +		return -ENODEV;
> > +
> > +	default: /* All other states are marked as "Reserved states" */
> > +		dev_err(&pdev->dev,
> > +			"hardware is in an invalid state %x. Giving up (poweroff/reboot needed).",
> > +			(fw_state & 0x70) >> 4);
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> > +static int renesas_fw_download(struct pci_dev *pdev,
> > +			       const struct firmware *fw)
> > +{
> > +	const u32 *fw_data = (const u32 *)fw->data;
> > +	size_t i;
> > +	int err;
> > +	u8 fw_status;
> > +
> > +	/*
> > +	 * For more information and the big picture: please look at the
> > +	 * "Firmware Download Sequence" in "7.1 FW Download Interface"
> > +	 * of R19UH0078EJ0500 Rev.5.00 page 131
> > +	 */
> > +
> > +	/*
> > +	 * 0. Set "FW Download Enable" bit in the
> > +	 * "FW Download Control & Status Register" at 0xF4
> > +	 */
> > +	err = pci_write_config_byte(pdev, 0xF4, BIT(0));
> > +	if (err)
> > +		return pcibios_err_to_errno(err);
> > +
> > +	/* 1 - 10 follow one step after the other. */
> > +	for (i = 0; i < fw->size / 4; i++) {
> > +		err = renesas_fw_download_image(pdev, fw_data, i);
> > +		if (err) {
> > +			dev_err(&pdev->dev,
> > +				"Firmware Download Step %zd failed at position %zd bytes with (%d).",
> > +				i, i * 4, err);
> > +			return err;
> > +		}
> > +	}
> > +
> > +	/*
> > +	 * This sequence continues until the last data is written to
> > +	 * "DATA0" or "DATA1". Naturally, we wait until "SET DATA0/1"
> > +	 * is cleared by the hardware beforehand.
> > +	 */
> > +	for (i = 0; i < RENESAS_RETRY; i++) {
> > +		err = pci_read_config_byte(pdev, 0xF5, &fw_status);
> 
> RENESAS_RETRY is 10000 (ten thousand),
> 
> wasn't there a discussion in the previous revision to have and a longer delay
> and fewer retries instead?

Yes and I reduced and posted that on v3 but then we started to see device
failures and timeout while loading. So yes it take a while sometime to
load the data on ram and rom for these devices, that why v4 goes back to
older values

> 
> > +		if (err)
> > +			return pcibios_err_to_errno(err);
> > +		if (!(fw_status & (BIT(0) | BIT(1))))
> > +			break;
> > +
> > +		udelay(RENESAS_DELAY);
> > +	}
> > +	if (i == RENESAS_RETRY)
> > +		dev_warn(&pdev->dev, "Final Firmware Download step timed out.");
> > +
> > +	/*
> > +	 * 11. After finishing writing the last data of FW, the
> > +	 * System Software must clear "FW Download Enable"
> > +	 */
> > +	err = pci_write_config_byte(pdev, 0xF4, 0);
> > +	if (err)
> > +		return pcibios_err_to_errno(err);
> > +
> > +	/* 12. Read "Result Code" and confirm it is good. */
> > +	for (i = 0; i < RENESAS_RETRY; i++) {
> > +		err = pci_read_config_byte(pdev, 0xF4, &fw_status);
> > +		if (err)
> > +			return pcibios_err_to_errno(err);
> > +		if (fw_status & BIT(4))
> > +			break;
> > +
> > +		udelay(RENESAS_DELAY);
> > +	}
> > +	if (i == RENESAS_RETRY) {
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
> > +		case 1: /* (No result yet! */
> > +			return -ETIMEDOUT;
> > +
> > +		default:
> > +			return err;
> > +		}
> > +	}
> > +	/*
> > +	 * Optional last step: Engage Firmware Lock
> > +	 *
> > +	 * err = pci_write_config_byte(pdev, 0xF4, BIT(2));
> > +	 * if (err)
> > +	 *	return pcibios_err_to_errno(err);
> > +	 */
> > +
> > +	return 0;
> > +}
> > +
> > +struct renesas_fw_ctx {
> > +	struct pci_dev *pdev;
> > +	const struct pci_device_id *id;
> > +	bool resume;
> > +};
> > +
> > +static int xhci_pci_probe(struct pci_dev *pdev,
> > +			  const struct pci_device_id *id);
> > +
> > +static void renesas_fw_callback(const struct firmware *fw,
> > +				void *context)
> > +{
> > +	struct renesas_fw_ctx *ctx = context;
> > +	struct pci_dev *pdev = ctx->pdev;
> > +	struct device *parent = pdev->dev.parent;
> > +	int err;
> > +
> > +	if (!fw) {
> > +		dev_err(&pdev->dev, "firmware failed to load\n");
> > +
> > +		goto cleanup;
> > +	}
> > +
> > +	err = renesas_fw_verify(pdev, fw->data, fw->size);
> > +	if (err)
> > +		goto cleanup;
> > +
> > +	err = renesas_fw_download(pdev, fw);
> > +	release_firmware(fw);
> > +	if (err) {
> > +		dev_err(&pdev->dev, "firmware failed to download (%d).", err);
> > +		goto cleanup;
> > +	}
> > +	if (ctx->resume)
> > +		return;
> > +
> > +	err = xhci_pci_probe(pdev, ctx->id);
> 
> hmm, so xhci_pci_probe() calls request_firmware_nowait(callback), and the request firmware callback
> calls xhci_pci_probe()
> 
> Could there be some other design option than this recursive probe calling?
> maybe splitting the probe function into two parts could work?

Well we do not complete the probe for Renesas devices and wait for
firmware to be available. Once firmware is loaded (callback), we
continue probe,. I think this is simpler design and ensure device is
initialized only when the required firmware is available.

Btw for devices with ROM (patch 3) we check if ROM load and skip
request_firmware and continue.
> 
> 
> > +	if (!err) {
> > +		/* everything worked */
> > +		devm_kfree(&pdev->dev, ctx);
> > +		return;
> > +	}
> > +
> > +cleanup:
> > +	/* in case of an error - fall through */
> > +	dev_info(&pdev->dev, "Unloading driver");
> > +
> > +	if (parent)
> > +		device_lock(parent);
> > +
> > +	device_release_driver(&pdev->dev);
> > +
> > +	if (parent)
> > +		device_unlock(parent);
> > +
> > +	pci_dev_put(pdev);
> > +}
> > +
> > +static int renesas_fw_alive_check(struct pci_dev *pdev)
> > +{
> > +	const struct renesas_fw_entry *entry;
> > +
> > +	/* check if we have a eligible RENESAS' uPD720201/2 w/o FW. */
> > +	entry = renesas_needs_fw_dl(pdev);
> > +	if (!entry)
> > +		return 0;
> > +
> > +	return renesas_fw_check_running(pdev);
> > +}
> > +
> > +static int renesas_fw_download_to_hw(struct pci_dev *pdev,
> > +				     const struct pci_device_id *id,
> > +				     bool do_resume)
> > +{
> > +	const struct renesas_fw_entry *entry;
> > +	struct renesas_fw_ctx *ctx;
> > +	int err;
> > +
> > +	/* check if we have a eligible RENESAS' uPD720201/2 w/o FW. */
> > +	entry = renesas_needs_fw_dl(pdev);
> > +	if (!entry)
> > +		return 0;
> > +
> > +	err = renesas_fw_check_running(pdev);
> > +	/* Continue ahead, if the firmware is already running. */
> > +	if (err == 0)
> > +		return 0;
> > +
> > +	if (err != 1)
> > +		return err;
> > +
> > +	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
> > +	if (!ctx)
> > +		return -ENOMEM;
> > +	ctx->pdev = pdev;
> > +	ctx->resume = do_resume;
> > +	ctx->id = id;
> > +
> > +	pci_dev_get(pdev);
> > +	err = request_firmware_nowait(THIS_MODULE, 1, entry->firmware_name,
> > +				      &pdev->dev, GFP_KERNEL,
> > +				      ctx, renesas_fw_callback);
> > +	if (err) {
> > +		pci_dev_put(pdev);
> > +		return err;
> > +	}
> > +
> > +	/*
> > +	 * The renesas_fw_callback() callback will continue the probe
> > +	 * process, once it aquires the firmware.
> > +	 */
> > +	return 1;
> > +}
> > +
> >   /* called during probe() after chip reset completes */
> >   static int xhci_pci_setup(struct usb_hcd *hcd)
> >   {
> > @@ -317,6 +745,22 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
> >   	struct hc_driver *driver;
> >   	struct usb_hcd *hcd;
> > +	/*
> > +	 * Check if this device is a RENESAS uPD720201/2 device.
> > +	 * Otherwise, we can continue with xhci_pci_probe as usual.
> > +	 */
> > +	retval = renesas_fw_download_to_hw(dev, id, false);
> > +	switch (retval) {
> > +	case 0:
> > +		break;
> > +
> > +	case 1: /* let it load the firmware and recontinue the probe. */
> > +		return 0;
> > +
> > +	default:
> > +		return retval;
> > +	};
> > +
> 
> Downloading firmware to Renesas xHCI controllers should be a special case, but this
> makes it looks like its the normal procedure for probing PCI xHCI controllers.

These devices cannot work without firmware so it is a must have. Only
after the  firmware is loaded and initialized we can continue device
initialization.

> I might be missing some bigger picture but could the whole struct renesas_fw_entry array
> and constantly walking and matching it be skipped?
> There didn't seem to be that many firmware options.
> 
> Wouldn't it be enough to store the firmware name once?

Typically yes, but we have multiple versions (patch 4) for same device
and different names provided by the vendor.

So the table finds the name using device id, revision etc.
> 
> pseudo idea:
> 
> xhci_pci_probe()
> {
>   if (pdev->vendor == PCI_VENDOR_ID_RENESAS)
>     return renesas_load_fw();
>   else
>     return xhci_pci_probe_continue();
> }
> 
> renesas_load_fw()
>   switch(pdev->device) {
>   case 0x0014:
>     fw_name = "K20130xx.mem"
>   case 0x0015:
>     if (pdev->revision == yy)
>       fw_name = "K20130yy.mem"
>     else if (pdev->revision == zz)
>       fw_name = "K20130zz.mem"

problem is this doesnt scale (patch 4) when we add new version and in
future if we get newer versions from vendor. Table scales nicely that
way

>   default: /* no need to load firmware */
>     return xhci_pci_probe_continue()
>   }
>   if (firmware_already_loaded())
>     return xhci_pci_probe_continue()
>   request_firmware_nowait(..., fw_name, renesas_fw_cb)
> }
> 
> renesas_fw_cb()
> {
>   if (firmware_load_error())
>     return -ERROR
>   return xhci_pci_probe_continue()
> }
> 
> 
> I'll be away on vacation the next 3 weeks, so my
> response time is really slow
> 
> -Mathias
-- 
~Vinod
