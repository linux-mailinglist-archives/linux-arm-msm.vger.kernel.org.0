Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF6C24EF98
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2019 21:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbfFUTrC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jun 2019 15:47:02 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39174 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfFUTrC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jun 2019 15:47:02 -0400
Received: by mail-wr1-f67.google.com with SMTP id x4so7644105wrt.6;
        Fri, 21 Jun 2019 12:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fFsmg5teo3Xbt4jw00pmFQG645DUxEriV9yh6ddPSms=;
        b=HSm9STpbDeNJKSug1CYd2ntln3teYS8VCj+5BsFyJVQJumut2n8y5fVWDD+3ERkIEX
         Ix51HyCwLWL1+bvLXw3nwX4MVP6cXttJxEnivRuFBNgv6pDuWy/lc18sbItGwRwhCOR7
         cRpXWxc5kxjri20nM1KTGOHMI2Rt/6HcldBzqifW/lD4cqm0JA68rZkFkefkwkPFQAjt
         V/KoLrAuCEt+Idq0U0pgbuawMu4llWe43sLMP8qHJ1+8sA7ritGGIUrtWfaIsJxSCuhB
         RJna1Ixn8rjpLB3JAkq3J2VQpa1zs3mbV51o7SIuNhf/9Smmgd+VxItXsTIN2aU7eW8O
         T/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fFsmg5teo3Xbt4jw00pmFQG645DUxEriV9yh6ddPSms=;
        b=jp2PKY3+k4zhvwa3rWYmb+mVEiADOEE07x5zFX6e35SQviP0Tq+JUKFN0rds7jiiWv
         Z8w41fTut+uH7NaN2xPHotygALFuS4RHz1advrOnsefED9eC7teWAVR9+FlSN7P0amp0
         x5voT1P2/swwxZproSe/YCoQ/yVgGXDSF0/BTlOagXQZ3/dDZ/uFjEo+D1WS1iZa9d4e
         cHHkLL6+DXTlOA+cRKKs1h0ravIK7UCw+bI0rRBl8IkhDgx4PLQiwHQGxYRwQ4/ly/Zs
         nziJd129b8oiTLzQqDMXGnlR0PafAjOOCF2nrvrlMSMBT8EYxXb4ouLmgdMnhdVATVGG
         Wllg==
X-Gm-Message-State: APjAAAXmiMP+IOMALQHE+2BAfxSAiSTM9nxGj15M7yrfz/+bsHWE3bWH
        N9n6/eLyBtMIUk+QGJpwUL4=
X-Google-Smtp-Source: APXvYqy9xjFwxxk/6uXq3GEa1BXMW+Ouq8bpQAz0X3ZDljdnnMPpaOjcjQ6OnU00TMs2HnLTjYGimg==
X-Received: by 2002:adf:c506:: with SMTP id q6mr82678405wrf.219.1561146419265;
        Fri, 21 Jun 2019 12:46:59 -0700 (PDT)
Received: from debian64.daheim (pD9E297F7.dip0.t-ipconnect.de. [217.226.151.247])
        by smtp.gmail.com with ESMTPSA id l1sm3652046wmg.13.2019.06.21.12.46.58
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 21 Jun 2019 12:46:58 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1] helo=debian64.localnet)
        by debian64.daheim with esmtp (Exim 4.92)
        (envelope-from <chunkeey@gmail.com>)
        id 1hePUv-0006ct-Q6; Fri, 21 Jun 2019 21:46:57 +0200
From:   Christian Lamparter <chunkeey@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>, linux-usb@vger.kernel.org
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] usb: xhci: allow multiple firmware versions
Date:   Fri, 21 Jun 2019 21:46:57 +0200
Message-ID: <4561421.lKpHrRjrp5@debian64>
In-Reply-To: <20190621085913.8722-6-vkoul@kernel.org>
References: <20190621085913.8722-1-vkoul@kernel.org> <20190621085913.8722-6-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Friday, June 21, 2019 10:59:13 AM CEST Vinod Koul wrote:
> Allow multiple firmware file versions in table and load them in
> increasing order as we find them in the file system.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: Christian Lamparter <chunkeey@googlemail.com>
> ---
>  drivers/usb/host/xhci-pci.c | 46 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 44 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 771948ce3d38..1fb890984d6d 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -336,13 +336,19 @@ static const struct renesas_fw_entry {
>  	 *  - uPD720201 ES 2.0 sample whose revision ID is 2.
>  	 *  - uPD720201 ES 2.1 sample & CS sample & Mass product, ID is 3.
>  	 *  - uPD720202 ES 2.0 sample & CS sample & Mass product, ID is 2.
> +	 *
> +	 *  Entry expected_version should be kept in increasing order for a
> +	 *  chip, so that driver will pick first version and if that fails
> +	 *  then next one will be picked

Wouldn't it be better to do that in reverse order and try the latest
firmware first? And then fall back to the older ones?

>  	 */
>  	{ "K2013080.mem", 0x0014, 0x02, 0x2013 },
>  	{ "K2013080.mem", 0x0014, 0x03, 0x2013 },
> +	{ "K2026090.mem", 0x0014, 0x03, 0x2026 },
>  	{ "K2013080.mem", 0x0015, 0x02, 0x2013 },
The uPD720202 (ProductID 0x0015 with rev 0x02) also
works with the K2026090.mem I found online.

so,

+  	{ "K2026090.mem", 0x0015, 0x02, 0x2026 },

>  };
>  
>  MODULE_FIRMWARE("K2013080.mem");
> +MODULE_FIRMWARE("K2026090.mem");
>  
>  static const struct renesas_fw_entry *renesas_needs_fw_dl(struct pci_dev *dev)
>  {
> @@ -363,6 +369,24 @@ static const struct renesas_fw_entry *renesas_needs_fw_dl(struct pci_dev *dev)
>  	return NULL;
>  }
>  
> +static const struct
> +renesas_fw_entry *renesas_get_next_entry(struct pci_dev *dev,
> +					 const struct renesas_fw_entry *entry)
> +{
> +	const struct renesas_fw_entry *next_entry;
> +	size_t i;
> +
> +	for (i = 0; i < ARRAY_SIZE(renesas_fw_table); i++) {
> +		next_entry = &renesas_fw_table[i];
> +		if (next_entry->device == dev->device &&
> +		    next_entry->revision == dev->revision &&
> +		    next_entry->expected_version > entry->expected_version)
> +			return next_entry;
> +	}
> +
> +	return NULL;
> +}
> +
>  static int renesas_fw_download_image(struct pci_dev *dev,
>  				     const u32 *fw,
>  				     size_t step)
> @@ -709,6 +733,7 @@ struct renesas_fw_ctx {
>  	struct pci_dev *pdev;
>  	const struct pci_device_id *id;
>  	bool resume;
> +	const struct renesas_fw_entry *entry;
>  };
>  
>  static int xhci_pci_probe(struct pci_dev *pdev,
> @@ -968,13 +993,29 @@ static void renesas_fw_callback(const struct firmware *fw,
>  	struct renesas_fw_ctx *ctx = context;
>  	struct pci_dev *pdev = ctx->pdev;
>  	struct device *parent = pdev->dev.parent;
> +	const struct renesas_fw_entry *next_entry;
>  	bool rom;
>  	int err;
>  
>  	if (!fw) {
>  		dev_err(&pdev->dev, "firmware failed to load\n");
> -
> -		goto cleanup;
> +		/*
> +		 * we didn't find firmware, check if we have another
> +		 * entry for this device
> +		 */
> +		next_entry = renesas_get_next_entry(ctx->pdev, ctx->entry);
> +		if (next_entry) {
> +			ctx->entry = next_entry;
> +			dev_dbg(&pdev->dev, "Found next entry, requesting: %s\n",
> +				next_entry->firmware_name);
> +			request_firmware_nowait(THIS_MODULE, 1,
> +						next_entry->firmware_name,
> +						&pdev->dev, GFP_KERNEL,
> +						ctx, renesas_fw_callback);
> +			return;
> +		} else {
> +			goto cleanup;
> +		}
>  	}
>  
>  	err = renesas_fw_verify(pdev, fw->data, fw->size);
> @@ -1072,6 +1113,7 @@ static int renesas_fw_download_to_hw(struct pci_dev *pdev,
>  	ctx->pdev = pdev;
>  	ctx->resume = do_resume;
>  	ctx->id = id;
> +	ctx->entry = entry;
>  
>  	pci_dev_get(pdev);
>  	err = request_firmware_nowait(THIS_MODULE, 1, entry->firmware_name,
> 




