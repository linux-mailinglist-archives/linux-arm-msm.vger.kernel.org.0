Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95ED9497296
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jan 2022 16:32:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237690AbiAWPcP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 Jan 2022 10:32:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237694AbiAWPcP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 Jan 2022 10:32:15 -0500
X-Greylist: delayed 540 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 23 Jan 2022 07:32:15 PST
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29A07C06173B
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Jan 2022 07:32:14 -0800 (PST)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 0DD7C100002;
        Sun, 23 Jan 2022 15:32:11 +0000 (UTC)
Date:   Sun, 23 Jan 2022 16:32:10 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
        mani@kernel.org, miquel.raynal@bootlin.com, architt@codeaurora.org,
        bbrezillon@kernel.org, absahu@codeaurora.org
Cc:     baruch@tkos.co.il
Subject: Re: [PATCH v2 1/2] mtd: rawnand: qcom: Fix clock sequencing in
 qcom_nandc_probe()
Message-ID: <20220123163210.3f9ce79a@xps13>
In-Reply-To: <20220123152326.529692-1-miquel.raynal@bootlin.com>
References: <20220103030316.58301-2-bryan.odonoghue@linaro.org>
        <20220123152326.529692-1-miquel.raynal@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


miquel.raynal@bootlin.com wrote on Sun, 23 Jan 2022 16:23:26 +0100:

> On Mon, 2022-01-03 at 03:03:15 UTC, Bryan O'Donoghue wrote:
> > Interacting with a NAND chip on an IPQ6018 I found that the qcomsmem NAND
> > partition parser was returning -EPROBE_DEFER waiting for the main smem
> > driver to load.
> > 
> > This caused the board to reset. Playing about with the probe() function
> > shows that the problem lies in the core clock being switched off before the
> > nandc_unalloc() routine has completed.
> > 
> > If we look at how qcom_nandc_remove() tears down allocated resources we see
> > the expected order is
> > 
> > qcom_nandc_unalloc(nandc);
> > 
> > clk_disable_unprepare(nandc->aon_clk);
> > clk_disable_unprepare(nandc->core_clk);
> > 
> > dma_unmap_resource(&pdev->dev, nandc->base_dma, resource_size(res),
> > 		   DMA_BIDIRECTIONAL, 0);
> > 
> > Tweaking probe() to both bring up and tear-down in that order removes the
> > reset if we end up deferring elsewhere.
> > 
> > Fixes: c76b78d8ec05 ("mtd: nand: Qualcomm NAND controller driver")
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>  
> 
> Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Both patches pushed to mtd/fixes, actually.
