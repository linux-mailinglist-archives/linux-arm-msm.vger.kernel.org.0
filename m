Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE891BF3FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 11:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgD3JRx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 05:17:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:50442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726127AbgD3JRw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 05:17:52 -0400
Received: from localhost (unknown [122.182.217.38])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AEA4E2137B;
        Thu, 30 Apr 2020 09:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588238272;
        bh=u6tbeYdCysZTKvCddp61M5PPIVhI7wlanjgxY5jjmvE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N1LViV+3PXY8ydGA2ugK8Ve24zMTRWS0ijTfQMOFuW0fvXTcwCEWd0g5tLZ8K+0gU
         qjAIerB6dx+IB9SA2Z1K72VNfAhmALILto17JXL1FDRYoKjqfBVh7YZQobUq7kOcy4
         ZAA74UIor1LMQt/nv29kkAu4wTcrsLWHBrPb8tD8=
Date:   Thu, 30 Apr 2020 14:47:47 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        John Stultz <john.stultz@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Andreas =?iso-8859-1?Q?B=F6hler?= <dev@aboehler.at>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 4/5] usb: renesas-xhci: Add ROM loader for uPD720201
Message-ID: <20200430091747.GH948789@vkoul-mobl.Dlink>
References: <20200424101410.2364219-1-vkoul@kernel.org>
 <20200424101410.2364219-5-vkoul@kernel.org>
 <94266bc2-ae44-d7a2-61e9-4e09c29bd18d@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94266bc2-ae44-d7a2-61e9-4e09c29bd18d@linux.intel.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29-04-20, 17:39, Mathias Nyman wrote:
> On 24.4.2020 13.14, Vinod Koul wrote:
> > uPD720201 supports ROM and allows software to program the ROM and boot
> > from it. Add support for detecting if ROM is present, if so load the ROM
> > if not programmed earlier.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > Cc: Christian Lamparter <chunkeey@googlemail.com>
> > ---
> >  drivers/usb/host/xhci-pci-renesas.c | 342 +++++++++++++++++++++++++++-
> >  1 file changed, 341 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/host/xhci-pci-renesas.c b/drivers/usb/host/xhci-pci-renesas.c
> > index 402e86912c9f..6bb537999754 100644
> > --- a/drivers/usb/host/xhci-pci-renesas.c
> > +++ b/drivers/usb/host/xhci-pci-renesas.c
> > @@ -50,6 +50,22 @@
> >  #define RENESAS_RETRY	10000
> >  #define RENESAS_DELAY	10
> >  
> > +#define ROM_VALID_01 0x2013
> > +#define ROM_VALID_02 0x2026
> > +
> > +static int renesas_verify_fw_version(struct pci_dev *pdev, u32 version)
> > +{
> > +	switch (version) {
> > +	case ROM_VALID_01:
> > +	case ROM_VALID_02:
> > +		return 0;
> > +	default:
> > +		dev_err(&pdev->dev, "FW has invalid version :%d\n", version);
> > +		return 1;
> > +	}
> > +	return -EINVAL;
> 
> This never returns -EINVAL
> Maybe just get rid of the default case and print
> the error message before returning

Correct, this seems to be leftover, have cleaned it up now.

> > +static bool renesas_download_rom(struct pci_dev *pdev,
> > +				 const u32 *fw, size_t step)
> > +{
> > +	bool data0_or_data1;
> > +	u8 fw_status;
> > +	size_t i;
> > +	int err;
> > +
> > +	/*
> > +	 * The hardware does alternate between two 32-bit pages.
> > +	 * (This is because each row of the firmware is 8 bytes).
> > +	 *
> > +	 * for even steps we use DATA0, for odd steps DATA1.
> > +	 */
> > +	data0_or_data1 = (step & 1) == 1;
> > +
> > +	/* Read "Set DATAX" and confirm it is cleared. */
> > +	for (i = 0; i < RENESAS_RETRY; i++) {
> > +		err = pci_read_config_byte(pdev, RENESAS_ROM_STATUS_MSB,
> > +					   &fw_status);
> > +		if (err) {
> > +			dev_err(&pdev->dev, "Read ROM Status failed: %d\n",
> > +				pcibios_err_to_errno(err));
> > +			return false;
> > +		}
> > +		if (!(fw_status & BIT(data0_or_data1)))
> > +			break;
> > +
> > +		udelay(RENESAS_DELAY);
> > +	}
> > +	if (i == RENESAS_RETRY) {
> > +		dev_err(&pdev->dev, "Timeout for Set DATAX step: %zd\n", step);
> > +		return false;
> > +	}
> > +
> > +	/*
> > +	 * Write FW data to "DATAX".
> > +	 * "LSB is left" => force little endian
> > +	 */
> > +	err = pci_write_config_dword(pdev, data0_or_data1 ?
> > +				     RENESAS_DATA1 : RENESAS_DATA0,
> > +				     (__force u32)cpu_to_le32(fw[step]));
> > +	if (err) {
> > +		dev_err(&pdev->dev, "Write to DATAX failed: %d\n",
> > +			pcibios_err_to_errno(err));
> > +		return false;
> > +	}
> > +
> > +	udelay(100);
> > +
> > +	/* Set "Set DATAX". */
> > +	err = pci_write_config_byte(pdev, RENESAS_ROM_STATUS_MSB,
> > +				    BIT(data0_or_data1));
> > +	if (err) {
> > +		dev_err(&pdev->dev, "Write config for DATAX failed: %d\n",
> > +			pcibios_err_to_errno(err));
> > +		return false;
> > +	}
> > +
> > +	return true;
> > +}
> 
> The above function is almost identical to renesas_fw_download_image() added in a 
> previous patch.
> To avoid code duplication I'm sure one function that handles both cases would be possible. 

The registers are different, but that doesn't mean it can't be done. I
have added additional argument for rom and select the register to use
(ROM/RAM) and reused the rest of the fn

Thanks
-- 
~Vinod
