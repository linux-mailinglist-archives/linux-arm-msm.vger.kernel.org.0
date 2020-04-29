Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD0771BE14C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 16:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727789AbgD2Ogq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 10:36:46 -0400
Received: from mga04.intel.com ([192.55.52.120]:49199 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726691AbgD2Ogp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 10:36:45 -0400
IronPort-SDR: 3V8DQYL1YTPPReGwN+FiNyqAQDDFnbhPW1xe06CgfBCt9IzUBIb0QkXqauzEig3Pc+LsbbxXVq
 bATP79fPHONw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2020 07:36:44 -0700
IronPort-SDR: 8k9b3bLAofBaaIhf/W//xPJxMtvcSIcZp/iFbijN59JDRONpdumn06S7m3Vq4NXwNm8YGMD0KQ
 v0VQCZhRVvqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,332,1583222400"; 
   d="scan'208";a="257978135"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga003.jf.intel.com with ESMTP; 29 Apr 2020 07:36:40 -0700
Subject: Re: [PATCH v10 4/5] usb: renesas-xhci: Add ROM loader for uPD720201
To:     Vinod Koul <vkoul@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        John Stultz <john.stultz@linaro.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        =?UTF-8?Q?Andreas_B=c3=b6hler?= <dev@aboehler.at>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200424101410.2364219-1-vkoul@kernel.org>
 <20200424101410.2364219-5-vkoul@kernel.org>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <94266bc2-ae44-d7a2-61e9-4e09c29bd18d@linux.intel.com>
Date:   Wed, 29 Apr 2020 17:39:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200424101410.2364219-5-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24.4.2020 13.14, Vinod Koul wrote:
> uPD720201 supports ROM and allows software to program the ROM and boot
> from it. Add support for detecting if ROM is present, if so load the ROM
> if not programmed earlier.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: Christian Lamparter <chunkeey@googlemail.com>
> ---
>  drivers/usb/host/xhci-pci-renesas.c | 342 +++++++++++++++++++++++++++-
>  1 file changed, 341 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-pci-renesas.c b/drivers/usb/host/xhci-pci-renesas.c
> index 402e86912c9f..6bb537999754 100644
> --- a/drivers/usb/host/xhci-pci-renesas.c
> +++ b/drivers/usb/host/xhci-pci-renesas.c
> @@ -50,6 +50,22 @@
>  #define RENESAS_RETRY	10000
>  #define RENESAS_DELAY	10
>  
> +#define ROM_VALID_01 0x2013
> +#define ROM_VALID_02 0x2026
> +
> +static int renesas_verify_fw_version(struct pci_dev *pdev, u32 version)
> +{
> +	switch (version) {
> +	case ROM_VALID_01:
> +	case ROM_VALID_02:
> +		return 0;
> +	default:
> +		dev_err(&pdev->dev, "FW has invalid version :%d\n", version);
> +		return 1;
> +	}
> +	return -EINVAL;

This never returns -EINVAL
Maybe just get rid of the default case and print
the error message before returning

> +}
> +
>  static int renesas_fw_download_image(struct pci_dev *dev,
>  				     const u32 *fw,
>  				     size_t step)
> @@ -144,10 +160,84 @@ static int renesas_fw_verify(const void *fw_data,
>  	return 0;
>  }
>  
> -static int renesas_fw_check_running(struct pci_dev *pdev)
> +static bool renesas_check_rom(struct pci_dev *pdev)
>  {
> +	u16 rom_status;
> +	int retval;
> +
> +	/* Check if external ROM exists */
> +	retval = pci_read_config_word(pdev, RENESAS_ROM_STATUS, &rom_status);
> +	if (retval)
> +		return false;
> +
> +	rom_status &= RENESAS_ROM_STATUS_ROM_EXISTS;
> +	if (rom_status) {
> +		dev_dbg(&pdev->dev, "External ROM exists\n");
> +		return true; /* External ROM exists */
> +	}
> +
> +	return false;
> +}
> +
> +static int renesas_check_rom_state(struct pci_dev *pdev)
> +{
> +	u16 rom_state;
> +	u32 version;
>  	int err;
> +
> +	/* check FW version */
> +	err = pci_read_config_dword(pdev, RENESAS_FW_VERSION, &version);
> +	if (err)
> +		return pcibios_err_to_errno(err);
> +
> +	version &= RENESAS_FW_VERSION_FIELD;
> +	version = version >> RENESAS_FW_VERSION_OFFSET;
> +
> +	err = renesas_verify_fw_version(pdev, version);
> +	if (err)
> +		return err;
> +
> +	/*
> +	 * Test if ROM is present and loaded, if so we can skip everything
> +	 */
> +	err = pci_read_config_word(pdev, RENESAS_ROM_STATUS, &rom_state);
> +	if (err)
> +		return pcibios_err_to_errno(err);
> +
> +	if (rom_state & BIT(15)) {
> +		/* ROM exists */
> +		dev_dbg(&pdev->dev, "ROM exists\n");
> +
> +		/* Check the "Result Code" Bits (6:4) and act accordingly */
> +		switch (rom_state & RENESAS_ROM_STATUS_RESULT) {
> +		case RENESAS_ROM_STATUS_SUCCESS:
> +			return 0;
> +
> +		case RENESAS_ROM_STATUS_NO_RESULT: /* No result yet */
> +			return 0;
> +
> +		case RENESAS_ROM_STATUS_ERROR: /* Error State */
> +		default: /* All other states are marked as "Reserved states" */
> +			dev_err(&pdev->dev, "Invalid ROM..");
> +			break;
> +		}
> +	}
> +
> +	return -EIO;
> +}
> +
> +static int renesas_fw_check_running(struct pci_dev *pdev)
> +{
>  	u8 fw_state;
> +	int err;
> +
> +	/* Check if device has ROM and loaded, if so skip everything */
> +	err = renesas_check_rom(pdev);
> +	if (err) { /* we have rom */
> +		err = renesas_check_rom_state(pdev);
> +		if (!err)
> +			return err;
> +	}
>  
>  	/*
>  	 * Test if the device is actually needing the firmware. As most
> @@ -303,11 +393,261 @@ static int renesas_fw_download(struct pci_dev *pdev,
>  	return 0;
>  }
>  
> +static void renesas_rom_erase(struct pci_dev *pdev)
> +{
> +	int retval, i;
> +	u8 status;
> +
> +	dev_dbg(&pdev->dev, "Performing ROM Erase...\n");
> +	retval = pci_write_config_dword(pdev, RENESAS_DATA0,
> +					RENESAS_ROM_ERASE_MAGIC);
> +	if (retval) {
> +		dev_err(&pdev->dev, "ROM erase, magic word write failed: %d\n",
> +			pcibios_err_to_errno(retval));
> +		return;
> +	}
> +
> +	retval = pci_read_config_byte(pdev, RENESAS_ROM_STATUS, &status);
> +	if (retval) {
> +		dev_err(&pdev->dev, "ROM status read failed: %d\n",
> +			pcibios_err_to_errno(retval));
> +		return;
> +	}
> +	status |= RENESAS_ROM_STATUS_ERASE;
> +	retval = pci_write_config_byte(pdev, RENESAS_ROM_STATUS, status);
> +	if (retval) {
> +		dev_err(&pdev->dev, "ROM erase set word write failed\n");
> +		return;
> +	}
> +
> +	/* sleep a bit while ROM is erased */
> +	msleep(20);
> +
> +	for (i = 0; i < RENESAS_RETRY; i++) {
> +		retval = pci_read_config_byte(pdev, RENESAS_ROM_STATUS,
> +					      &status);
> +		status &= RENESAS_ROM_STATUS_ERASE;
> +		if (!status)
> +			break;
> +
> +		mdelay(RENESAS_DELAY);
> +	}
> +
> +	if (i == RENESAS_RETRY)
> +		dev_dbg(&pdev->dev, "Chip erase timedout: %x\n", status);
> +
> +	dev_dbg(&pdev->dev, "ROM Erase... Done success\n");
> +}
> +
> +static bool renesas_download_rom(struct pci_dev *pdev,
> +				 const u32 *fw, size_t step)
> +{
> +	bool data0_or_data1;
> +	u8 fw_status;
> +	size_t i;
> +	int err;
> +
> +	/*
> +	 * The hardware does alternate between two 32-bit pages.
> +	 * (This is because each row of the firmware is 8 bytes).
> +	 *
> +	 * for even steps we use DATA0, for odd steps DATA1.
> +	 */
> +	data0_or_data1 = (step & 1) == 1;
> +
> +	/* Read "Set DATAX" and confirm it is cleared. */
> +	for (i = 0; i < RENESAS_RETRY; i++) {
> +		err = pci_read_config_byte(pdev, RENESAS_ROM_STATUS_MSB,
> +					   &fw_status);
> +		if (err) {
> +			dev_err(&pdev->dev, "Read ROM Status failed: %d\n",
> +				pcibios_err_to_errno(err));
> +			return false;
> +		}
> +		if (!(fw_status & BIT(data0_or_data1)))
> +			break;
> +
> +		udelay(RENESAS_DELAY);
> +	}
> +	if (i == RENESAS_RETRY) {
> +		dev_err(&pdev->dev, "Timeout for Set DATAX step: %zd\n", step);
> +		return false;
> +	}
> +
> +	/*
> +	 * Write FW data to "DATAX".
> +	 * "LSB is left" => force little endian
> +	 */
> +	err = pci_write_config_dword(pdev, data0_or_data1 ?
> +				     RENESAS_DATA1 : RENESAS_DATA0,
> +				     (__force u32)cpu_to_le32(fw[step]));
> +	if (err) {
> +		dev_err(&pdev->dev, "Write to DATAX failed: %d\n",
> +			pcibios_err_to_errno(err));
> +		return false;
> +	}
> +
> +	udelay(100);
> +
> +	/* Set "Set DATAX". */
> +	err = pci_write_config_byte(pdev, RENESAS_ROM_STATUS_MSB,
> +				    BIT(data0_or_data1));
> +	if (err) {
> +		dev_err(&pdev->dev, "Write config for DATAX failed: %d\n",
> +			pcibios_err_to_errno(err));
> +		return false;
> +	}
> +
> +	return true;
> +}

The above function is almost identical to renesas_fw_download_image() added in a 
previous patch.
To avoid code duplication I'm sure one function that handles both cases would be possible. 

-Mathias
