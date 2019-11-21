Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C2641049B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2019 05:55:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726568AbfKUEzD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Nov 2019 23:55:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:58314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726014AbfKUEzD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Nov 2019 23:55:03 -0500
Received: from localhost (unknown [106.200.225.208])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C9AE72084D;
        Thu, 21 Nov 2019 04:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574312102;
        bh=EHOrsfRdI53kt2AZnYvdC6eT8fyjKvcaa2iGnH8NEY0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VNfuYb2PfVhyh8HHNdtuOcHapqSB8yKuWt5IiN3JAUMA3b1TbPmlyPecfPFCdDKjU
         qg8TnUmgLrp8xopFJFF9ZPmLcF2knUKTNRU7kWBRk3YiFWWNovMNXIPIo/spTYZ8l2
         zvfyJIvUfcJgIQhDnZfCLCQnuZ4eDn203z5FsE2s=
Date:   Thu, 21 Nov 2019 10:24:57 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/4] usb: xhci: Add support for Renesas USB controllers
Message-ID: <20191121045457.GH82508@vkoul-mobl>
References: <20191106083843.1718437-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191106083843.1718437-1-vkoul@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06-11-19, 14:08, Vinod Koul wrote:
> This series add support for Renesas USB controllers uPD720201 and uPD720202.
> These require firmware to be loaded and in case devices have ROM those can
> also be programmed if empty. If ROM is programmed, it runs from ROM as well.
> 
> This includes two patches from Christian which supported these controllers
> w/o ROM and later my patches for ROM support and multiple firmware versions.

Greg, Mathias

Any feedback on this?

> 
> Changes in v5:
>  Added a debugfs rom erase patch, helps in debugging
>  Squashed patch 1 & 2 as requested by Mathias
> 
> Changes in v4:
>  Rollback the delay values as we got device failures
> 
> Changes in v3:
>   Dropped patch 2 as discussed with Christian
>   Removed aligned 8 bytes check
>   Change order for firware search from highest version to lowest
>   Added entry for new firmware for device 0x14 as well
>   Add tested by Christian
> 
> Changes in v2:
>   used macros for timeout count and delay
>   removed renesas_fw_alive_check
>   cleaned renesas_fw_callback
>   removed recurion for renesas_fw_download
>   added MODULE_FIRMWARE
>   added comment for multiple fw order
> 
> Christian Lamparter (1):
>   usb: xhci: add firmware loader for uPD720201 and uPD720202 w/o ROM
> 
> Vinod Koul (3):
>   usb: xhci: Add ROM loader for uPD720201
>   usb: xhci: allow multiple firmware versions
>   usb: xhci: provide a debugfs hook for erasing rom
> 
>  drivers/usb/host/xhci-pci.c | 911 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 911 insertions(+)
> 
> -- 
> 2.23.0

-- 
~Vinod
