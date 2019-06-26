Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9848562E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2019 09:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbfFZHKM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jun 2019 03:10:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:49672 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725790AbfFZHKM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jun 2019 03:10:12 -0400
Received: from localhost (unknown [106.201.40.23])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 440012085A;
        Wed, 26 Jun 2019 07:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561533011;
        bh=AUEWjtPdMoOuK2irlTMWvyn/3X6hMlzz74tKCbXQNgE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GZk0dd5D/1FQvDSac92ZUKviP86dIfsRQl2WHoYCuGqQWYeSyFUrrXQuBhMHEX/ZA
         CeJStsNxjsGnI28G7TNBgRkYBRHzC+C9ISPyeTuCLC+lxkpkI+e4epQCO4zA6vH9fr
         6mK9Satqrlew9vRtbJIZ8doQi+Ji2KyPugGjcn3Q=
Date:   Wed, 26 Jun 2019 12:36:58 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Christian Lamparter <chunkeey@googlemail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH v3 1/4] usb: xhci: add firmware loader for uPD720201 and
 uPD720202 w/o ROM
Message-ID: <20190626070658.GP2962@vkoul-mobl>
References: <20190624061126.11938-1-vkoul@kernel.org>
 <20190624061126.11938-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624061126.11938-2-vkoul@kernel.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24-06-19, 11:41, Vinod Koul wrote:
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
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Christian Lamparter <chunkeey@googlemail.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> [vkoul: fixed comments:
> 	used macros for timeout count and delay
> 	removed renesas_fw_alive_check
> 	cleaned renesas_fw_callback
> 	removed recurion for renesas_fw_download
> 	added MODULE_FIRMWARE
> 	removed length check]
> Tested-by: Christian Lamparter <chunkeey@gmail.com>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/usb/host/xhci-pci.c | 454 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 454 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index c2fe218e051f..89ca46dd6825 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -12,6 +12,8 @@
>  #include <linux/slab.h>
>  #include <linux/module.h>
>  #include <linux/acpi.h>
> +#include <linux/firmware.h>
> +#include <linux/unaligned/access_ok.h>
>  
>  #include "xhci.h"
>  #include "xhci-trace.h"
> @@ -55,6 +57,9 @@
>  #define PCI_DEVICE_ID_AMD_PROMONTORYA_1			0x43bc
>  #define PCI_DEVICE_ID_ASMEDIA_1042A_XHCI		0x1142
>  
> +#define RENESAS_RETRY	1000
> +#define RENESAS_DELAY	10

So some devices are exhibiting failure on both ROM programming as well
as RAM load with messages:

ROM Download Step 34 failed at position 136 bytes
Firmware Download Step 2 failed at position 8 bytes with (-110)

So I am going to revert to older delay values! With those we dont get a
failures. yeah looks like ROM load takes a while on these

Thanks

-- 
~Vinod
