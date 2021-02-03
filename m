Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73F2E30D702
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 11:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233520AbhBCKGL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>); Wed, 3 Feb 2021 05:06:11 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:47809 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233404AbhBCKGK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 05:06:10 -0500
X-Originating-IP: 86.210.203.150
Received: from xps13 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr [86.210.203.150])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 6CF792000E;
        Wed,  3 Feb 2021 10:05:23 +0000 (UTC)
Date:   Wed, 3 Feb 2021 11:05:22 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     richard@nod.at, vigneshr@ti.com, boris.brezillon@collabora.com,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org
Subject: Re: [PATCH] mtd: rawnand: Do not check for bad block if bbt is
 unavailable
Message-ID: <20210203110522.12f2b326@xps13>
In-Reply-To: <AFD0F5A6-7876-447B-A089-85091225BE11@linaro.org>
References: <20210130035412.6456-1-manivannan.sadhasivam@linaro.org>
        <20210201151824.5a9dca4a@xps13>
        <20210202041614.GA840@work>
        <20210202091459.0c41a769@xps13>
        <AFD0F5A6-7876-447B-A089-85091225BE11@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Manivannan,

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote on Wed,
03 Feb 2021 15:28:20 +0530:

> Hi Miquel, 
> 
> On 2 February 2021 1:44:59 PM IST, Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >Hi Manivannan,
> >
> >Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote on Tue,
> >2 Feb 2021 09:46:14 +0530:
> >  
> >> Hi,
> >> 
> >> On Mon, Feb 01, 2021 at 03:18:24PM +0100, Miquel Raynal wrote:  
> >> > Hi Manivannan,
> >> > 
> >> > Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote on  
> >Sat,  
> >> > 30 Jan 2021 09:24:12 +0530:
> >> >     
> >> > > The bbt pointer will be unavailable when NAND_SKIP_BBTSCAN option  
> >is  
> >> > > set for a NAND chip. The intention is to skip scanning for the  
> >bad  
> >> > > blocks during boot time.    
> >> > 
> >> > I don't have the same understanding: this flag skips the bad block
> >> > table scan, not the bad block scan. We do want to scan all the  
> >devices  
> >> > in order to construct a RAM based table.
> >> >     
> >> > > However, the MTD core will call
> >> > > _block_isreserved() and _block_isbad() callbacks unconditionally  
> >for  
> >> > > the rawnand devices due to the callbacks always present while  
> >collecting  
> >> > > the ecc stats.
> >> > > 
> >> > > The _block_isreserved() callback for rawnand will bail out if bbt
> >> > > pointer is not available. But _block_isbad() will continue  
> >without  
> >> > > checking for it. So this contradicts with the NAND_SKIP_BBTSCAN  
> >option  
> >> > > since the bad block check will happen anyways (ie., not much  
> >difference  
> >> > > between scanning for bad blocks and checking each block for bad  
> >ones).  
> >> > > 
> >> > > Hence, do not check for the bad block if bbt pointer is  
> >unavailable.    
> >> > 
> >> > Not checking for bad blocks at all feels insane. I don't really get  
> >the  
> >> > scope and goal of such change?
> >> >     
> >> 
> >> The issue I encountered is, on the Telit FN980 device one of the
> >> partition seems to be protected. So trying to read the bad blocks in
> >> that partition makes the device to reboot during boot.  
> >
> >o_O
> >
> >Reading a protected block makes the device to reboot?
> >
> >What is the exact device? Can you share the datasheet? Is this behavior
> >expected? Because it seems really broken to me, a read should not
> >trigger *anything* that bad.
> >  
> 
> I got more information from the vendor, Telit. The access to the 3rd partition is protected by Trustzone and any access in non privileged mode (where Linux kernel runs) causes kernel panic and the device reboots. 

Ok, so this is not a chip feature but more a host constraint.

In this case it would be a good idea to add a host DT property which
describes the zone to avoid accessing it. Something like:

	secure-area/secure-section = <start length>;

From the core perspective, we should parse this property early enough
and return -EIO when trying to access this area.

Does this solution sound reasonable to you?

Thanks,
Miquèl
