Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DDCB4DA03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 21:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbfFTTMt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 15:12:49 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38467 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbfFTTMt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 15:12:49 -0400
Received: by mail-wm1-f68.google.com with SMTP id s15so4206501wmj.3;
        Thu, 20 Jun 2019 12:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y4d2TTY7mSr277lgDdMkDVjGzhj2N4s+8wNSpS9iUIA=;
        b=qUBgf+pd7kJjzpwKQUKDJeGuVn3UQw7yuhypZ2qpO5FywswqGvzPBEzswdZMFykUoO
         DJq1FwM84EmhqaNWwIlHx3ZIPrwfiiSfWdcvRnnflKb9X/r/ZVlCvPCGLbZ2pDfJbQm9
         Q190EFz6Zu6FaohtXLYSnXpfaMtbOhRu9gvWegWLS/Yn9XD8nXpky+ejlL5H+PGP8yxc
         hKRMYy/A9ra4eWjfUkYPLYLWl2TDj95wHODmP3c4f8hgW3IrLgfuJcfS8IYUn22gjIU8
         LFJUF5+fLAZLe2swjt7i+gbYDXY/u/V0c1wuQukGj/lTTYoh+8dUZ+4d6jCfaaAYqUfa
         Dprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y4d2TTY7mSr277lgDdMkDVjGzhj2N4s+8wNSpS9iUIA=;
        b=FCcZYRQZH0kTacACT3tGiihUo3ShmINmcsZ+K+1B8mYLEwW8Q+de5QIWx94MaGp1vU
         lIvG5O1ItLpBgijOlLHI/690+RDi3mV4aTRZ6CwYxvvQy3CraOxakA7isYH1XkfYkrxt
         toWwRldl4A0abXvQZMMU11WByCFBeQ9BSVOwtP6Dxv7rCl0f12a6AkkmHGfz+m+4q7aK
         UMJZFhYKt2B63R+zm/oGXNU21neYv5435GXZUwq2GltDwV6zUczD71D8jwajtWPwBG3j
         rpfh/rHOUKT+o2rVu+h7weAKWPHRVL4bNQxB80o5IBSD2I/PmuvPu6V39ps/chxYtBSY
         Puwg==
X-Gm-Message-State: APjAAAUASgxhLHMjclobnOdY/FjF2Z7+l4SgoQjm1QMMxO1pLmjfEkKk
        q782gAVuhJA2fii36hBJKuw=
X-Google-Smtp-Source: APXvYqypdSTzfRtXCn4ujhA6kTClU7x/5hIydCI3Czd2BgJpOuUoc1UAXW0JlNC/howV9fVr8YXBwQ==
X-Received: by 2002:a1c:4c1a:: with SMTP id z26mr344925wmf.2.1561057965778;
        Thu, 20 Jun 2019 12:12:45 -0700 (PDT)
Received: from debian64.daheim (pD9E29A96.dip0.t-ipconnect.de. [217.226.154.150])
        by smtp.gmail.com with ESMTPSA id y17sm797691wrg.18.2019.06.20.12.12.44
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 12:12:44 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1] helo=debian64.localnet)
        by debian64.daheim with esmtp (Exim 4.92)
        (envelope-from <chunkeey@gmail.com>)
        id 1he2UF-0005g1-U3; Thu, 20 Jun 2019 21:12:43 +0200
From:   Christian Lamparter <chunkeey@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Christian Lamparter <chunkeey@googlemail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 1/5] usb: xhci: add firmware loader for uPD720201 and uPD720202 w/o ROM
Date:   Thu, 20 Jun 2019 21:12:43 +0200
Message-ID: <2465888.R7Jb3LzrEU@debian64>
In-Reply-To: <20190620170358.GO2962@vkoul-mobl>
References: <20190620102154.20805-1-vkoul@kernel.org> <20190620121902.GD19295@kroah.com> <20190620170358.GO2962@vkoul-mobl>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thursday, June 20, 2019 7:03:58 PM CEST Vinod Koul wrote:
> On 20-06-19, 14:19, Greg Kroah-Hartman wrote:
> > On Thu, Jun 20, 2019 at 03:51:50PM +0530, Vinod Koul wrote:
> > > From: Christian Lamparter <chunkeey@googlemail.com>
> > >=20
> > > This patch adds a firmware loader for the uPD720201K8-711-BAC-A
> > > and uPD720202K8-711-BAA-A variant. Both of these chips are listed
> > > in Renesas' R19UH0078EJ0500 Rev.5.00 "User's Manual: Hardware" as
> > > devices which need the firmware loader on page 2 in order to
> > > work as they "do not support the External ROM".
> > >=20
> > > The "Firmware Download Sequence" is describe in chapter
> > > "7.1 FW Download Interface" R19UH0078EJ0500 Rev.5.00 page 131.
> > >=20
> > > The firmware "K2013080.mem" is available from a USB3.0 Host to
> > > PCIe Adapter (PP2U-E card) "Firmware download" archive. An
> > > alternative version can be sourced from Netgear's WNDR4700 GPL
> > > archives.
> > >=20
> > > The release notes of the PP2U-E's "Firmware Download" ver 2.0.1.3
> > > (2012-06-15) state that the firmware is for the following devices:
> > >  - uPD720201 ES 2.0 sample whose revision ID is 2.
> > >  - uPD720201 ES 2.1 sample & CS sample & Mass product, ID is 3.
> > >  - uPD720202 ES 2.0 sample & CS sample & Mass product, ID is 2.
> > >=20
> > > If someone from Renesas is listening: It would be great, if these
> > > firmwares could be added to linux-firmware.git.
> >=20
> > That paragraph does not need to be in the changelog :)
>=20
> Sure will drop :)

=2E.. those this mean that there is a firmware now? Do you have a link to i=
t?

>=20
> > >  #include <linux/slab.h>
> > >  #include <linux/module.h>
> > >  #include <linux/acpi.h>
> > > +#include <linux/firmware.h>
> > > +#include <asm/unaligned.h>
> >=20
> > asm/ in a driver?  Are you sure???
>=20
> Not sure :D, will check and remove

I think, as long as there is a "get_unaligned_le16" defined somewhere
it should be fine.

This was a loong ago, the loader was developped on a PowerPC 464, but
from what I remember it was checkpatch that didn't like the "unaligned"
poking around in the firmware below.

> > > +static int renesas_fw_download_image(struct pci_dev *dev,
> > > +				     const u32 *fw,
> > > +				     size_t step)
> > > +{
> > > +	size_t i;
> > > +	int err;
> > > +	u8 fw_status;
> > > +	bool data0_or_data1;
> > > +
> > > +	/*
> > > +	 * The hardware does alternate between two 32-bit pages.
> > > +	 * (This is because each row of the firmware is 8 bytes).
> > > +	 *
> > > +	 * for even steps we use DATA0, for odd steps DATA1.
> > > +	 */
> > > +	data0_or_data1 =3D (step & 1) =3D=3D 1;
> > > +
> > > +	/* step+1. Read "Set DATAX" and confirm it is cleared. */
> > > +	for (i =3D 0; i < 10000; i++) {
> > > +		err =3D pci_read_config_byte(dev, 0xF5, &fw_status);
> > > +		if (err)
> > > +			return pcibios_err_to_errno(err);
> > > +		if (!(fw_status & BIT(data0_or_data1)))
> > > +			break;
> > > +
> > > +		udelay(1);
> > > +	}
> > > +	if (i =3D=3D 10000)
> > > +		return -ETIMEDOUT;
> > > +
> > > +	/*
> > > +	 * step+2. Write FW data to "DATAX".
> > > +	 * "LSB is left" =3D> force little endian
> > > +	 */
> > > +	err =3D pci_write_config_dword(dev, data0_or_data1 ? 0xFC : 0xF8,
> > > +				     (__force u32) cpu_to_le32(fw[step]));
> > > +	if (err)
> > > +		return pcibios_err_to_errno(err);
> > > +
> > > +	udelay(100);
> > > +
> > > +	/* step+3. Set "Set DATAX". */
> > > +	err =3D pci_write_config_byte(dev, 0xF5, BIT(data0_or_data1));
> > > +	if (err)
> > > +		return pcibios_err_to_errno(err);
> > > +
> >=20
> > Shouldn't you just do a read after the write to be sure the write
> > actually went out on the wire?  Then you shouldn't have to do the
> > udelay, right?
>=20
> Well I am not sure that is how it works. The register is a DATA register
> on the controller. We are writing to the memory of the controller here
> and after writing DATA0 and DATA1 we check the Set DATA0 & Set DATA1
> bits and write subsequenly only when controller is ready to accept more
> data.
>=20
> I do recall at least for ROM load (writing to NOR flash attached to
> controller), we need to wait considerably more before the SetData0/1 was
> set and ready for subsequent write

OffTopic: There's some leeway here. From what I remember you could just push
the data through DATA0 and cut down on the logic. But this was slower than
using both DATA0 and DATA1.

The udelay was placed because I vaguely remember that polling SET DATA0
over and over slowed down the firmware download.
So the intention was to have the 100=B5s as a baseline and then we don't
slow down and waste more cycles in "step+1".

>=20
> > > +static int renesas_hw_check_run_stop_busy(struct pci_dev *pdev)
> > > +{
> > > +#if 0
> > > +	u32 val;
> > > +
> > > +	/*
> > > +	 * 7.1.3 Note 3: "... must not set 'FW Download Enable' when
> > > +	 * 'RUN/STOP' of USBCMD Register is set"
> > > +	 */
> > > +	val =3D readl(hcd->regs + 0x20);
> > > +	if (val & BIT(0)) {
> > > +		dev_err(&pdev->dev, "hardware is busy and can't receive a FW.");
> > > +		return -EBUSY;
> > > +	}
> > > +#endif
> > > +	return 0;
> > > +}
> > > +
> >=20
> > Is this function still really needed anymore?
>=20
> Nope I will drop it unless Christian objects

You can drop it. From what I remember it was used for a minimal backup
solution that would simply prevent stuck the xhci-pci modules. (never
heard from Greg or Filipe)

> > > +	/*
> > > +	 * 11. After finishing writing the last data of FW, the
> > > +	 * System Software must clear "FW Download Enable"
> > > +	 */
> > > +	err =3D pci_write_config_byte(pdev, 0xF4, 0);
> > > +	if (err)
> > > +		return pcibios_err_to_errno(err);
> > > +
> > > +	/* 12. Read "Result Code" and confirm it is good. */
> > > +	for (i =3D 0; i < 10000; i++) {
> > > +		err =3D pci_read_config_byte(pdev, 0xF4, &fw_status);
> > > +		if (err)
> > > +			return pcibios_err_to_errno(err);
> > > +		if (fw_status & BIT(4))
> > > +			break;
> > > +
> > > +		udelay(1);
> > > +	}
> >=20
> > 1000 reads???  I've heard of having to read a few times to ensure
> > something "latched" in the device, but not 1000.  Why so many?
>=20
> For ROM load it did need significant time, I will check if we can go down
> to 100 here
yes, it takes a while! Though you could use a bigger udelay here and do
less retries.=20

> > > +	if (i =3D=3D 10000) {
> > > +		/* Timed out / Error - let's see if we can fix this */
> > > +		err =3D renesas_fw_check_running(pdev);
> > > +		switch (err) {
> > > +		case 0: /*
> > > +			 * we shouldn't end up here.
> > > +			 * maybe it took a little bit longer.
> > > +			 * But all should be well?
> > > +			 */
> > > +			break;
> > > +
> > > +		case 1: /* (No result yet? - we can try to retry) */
> > > +			if (retry_counter < 10) {
> > > +				retry_counter++;
> > > +				dev_warn(&pdev->dev, "Retry Firmware download: %d try.",
> > > +					  retry_counter);
> > > +				return renesas_fw_download(pdev, fw,
> > > +							   retry_counter);
> >=20
> > recursion?
>=20
> I didnt encounter the need, we should remove it unless Christian objects

Sure, I think it should be safe to just say that there was a timeout and th=
en abort.

Cheers,
Christian



