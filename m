Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5423330A97F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Feb 2021 15:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbhBAOTQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>); Mon, 1 Feb 2021 09:19:16 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:59123 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbhBAOTP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Feb 2021 09:19:15 -0500
Received: from xps13 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr [86.210.203.150])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 90F55200008;
        Mon,  1 Feb 2021 14:18:25 +0000 (UTC)
Date:   Mon, 1 Feb 2021 15:18:24 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     richard@nod.at, vigneshr@ti.com, boris.brezillon@collabora.com,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org
Subject: Re: [PATCH] mtd: rawnand: Do not check for bad block if bbt is
 unavailable
Message-ID: <20210201151824.5a9dca4a@xps13>
In-Reply-To: <20210130035412.6456-1-manivannan.sadhasivam@linaro.org>
References: <20210130035412.6456-1-manivannan.sadhasivam@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Manivannan,

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote on Sat,
30 Jan 2021 09:24:12 +0530:

> The bbt pointer will be unavailable when NAND_SKIP_BBTSCAN option is
> set for a NAND chip. The intention is to skip scanning for the bad
> blocks during boot time.

I don't have the same understanding: this flag skips the bad block
table scan, not the bad block scan. We do want to scan all the devices
in order to construct a RAM based table.

> However, the MTD core will call
> _block_isreserved() and _block_isbad() callbacks unconditionally for
> the rawnand devices due to the callbacks always present while collecting
> the ecc stats.
> 
> The _block_isreserved() callback for rawnand will bail out if bbt
> pointer is not available. But _block_isbad() will continue without
> checking for it. So this contradicts with the NAND_SKIP_BBTSCAN option
> since the bad block check will happen anyways (ie., not much difference
> between scanning for bad blocks and checking each block for bad ones).
> 
> Hence, do not check for the bad block if bbt pointer is unavailable.

Not checking for bad blocks at all feels insane. I don't really get the
scope and goal of such change?

> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/mtd/nand/raw/nand_base.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index c33fa1b1847f..f18cd1db79a9 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -4286,6 +4286,9 @@ static int nand_block_isbad(struct mtd_info *mtd, loff_t offs)
>  	int chipnr = (int)(offs >> chip->chip_shift);
>  	int ret;
>  
> +	if (!chip->bbt)
> +		return 0;
> +
>  	/* Select the NAND device */
>  	ret = nand_get_device(chip);
>  	if (ret)

Cheers,
Miquèl
