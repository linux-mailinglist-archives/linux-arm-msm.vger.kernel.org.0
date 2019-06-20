Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 576E54CD99
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 14:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731359AbfFTMUQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 08:20:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:44524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726874AbfFTMUQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 08:20:16 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0755F2080C;
        Thu, 20 Jun 2019 12:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561033215;
        bh=n0G/+6qb7qw5DGnYI2pT1g29VJVpYzQKudyEs0DE8DI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oWEOibzHy+eUwIi7JgpV2fKCniqoviMJXdixyunQECR1sDvbhoi/xw3z0xMQfQbOP
         ieFZ03NknkPs4BTWhH8hKZdPEjNu7xo9zi5pNJ8Z9zBcCQNiJEXcI32IXQU0hc2bnf
         072dIUUHeoJq4x9eGU1igMCt+OUOdvoGW0fbvgmU=
Date:   Thu, 20 Jun 2019 14:20:13 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>
Subject: Re: [PATCH 5/5] usb: xhci: allow multiple firmware versions
Message-ID: <20190620122013.GE19295@kroah.com>
References: <20190620102154.20805-1-vkoul@kernel.org>
 <20190620102154.20805-6-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190620102154.20805-6-vkoul@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 20, 2019 at 03:51:54PM +0530, Vinod Koul wrote:
> Allow multiple firmware file versions in table and load them in
> increasing order as we find them in the file system.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: Christian Lamparter <chunkeey@googlemail.com>
> ---
>  drivers/usb/host/xhci-pci.c | 39 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 3574afac44c5..2ee9e6bbabcb 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -333,9 +333,12 @@ static const struct renesas_fw_entry {
>  	 *  - uPD720201 ES 2.0 sample whose revision ID is 2.
>  	 *  - uPD720201 ES 2.1 sample & CS sample & Mass product, ID is 3.
>  	 *  - uPD720202 ES 2.0 sample & CS sample & Mass product, ID is 2.
> +	 *
> +	 *  Entry expected_version should be kept in increasing order

Why?

>  	 */
>  	{ "K2013080.mem", 0x0014, 0x02, 0x2013 },
>  	{ "K2013080.mem", 0x0014, 0x03, 0x2013 },
> +	{ "K2026090.mem", 0x0014, 0x03, 0x2026 },
>  	{ "K2013080.mem", 0x0015, 0x02, 0x2013 },

Just put a { } entry here at the end and then you don't care about the
order at all.  Much simpler and easier to maintain over time.

thanks,

greg k-h
