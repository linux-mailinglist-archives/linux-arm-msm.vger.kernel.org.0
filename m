Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4219630EFBB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 10:35:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235205AbhBDJcp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>); Thu, 4 Feb 2021 04:32:45 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:43487 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233628AbhBDJcm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 04:32:42 -0500
X-Originating-IP: 86.210.203.150
Received: from xps13 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr [86.210.203.150])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 16E051BF212;
        Thu,  4 Feb 2021 09:31:52 +0000 (UTC)
Date:   Thu, 4 Feb 2021 10:31:52 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH] mtd: rawnand: Do not check for bad block if bbt is
 unavailable
Message-ID: <20210204103152.5d086525@xps13>
In-Reply-To: <20210204102738.3ea8393e@collabora.com>
References: <20210202041614.GA840@work>
        <20210202091459.0c41a769@xps13>
        <AFD0F5A6-7876-447B-A089-85091225BE11@linaro.org>
        <20210203110522.12f2b326@xps13>
        <EBDAB319-549F-4CB1-8CE3-9DFA99DBFBC0@linaro.org>
        <20210203111914.1c2f68f6@collabora.com>
        <8A2468D5-B435-4923-BA4F-7BF7CC0FF207@linaro.org>
        <20210203122422.6963b0ed@collabora.com>
        <F55F9D7B-0542-448E-A711-D1035E467ACA@linaro.org>
        <20210204091336.1406ca3b@xps13>
        <20210204085221.GB8235@thinkpad>
        <20210204095945.51ef0c33@collabora.com>
        <20210204100408.6eb053d8@xps13>
        <20210204102738.3ea8393e@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Boris,

Boris Brezillon <boris.brezillon@collabora.com> wrote on Thu, 4 Feb
2021 10:27:38 +0100:

> On Thu, 4 Feb 2021 10:04:08 +0100
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > Hi Boris,
> > 
> > Boris Brezillon <boris.brezillon@collabora.com> wrote on Thu, 4 Feb
> > 2021 09:59:45 +0100:
> >   
> > > On Thu, 4 Feb 2021 14:22:21 +0530
> > > Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> > >     
> > > > On Thu, Feb 04, 2021 at 09:13:36AM +0100, Miquel Raynal wrote:      
> > > > > Hi Manivannan,
> > > > > 
> > > > > Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote on Wed,
> > > > > 03 Feb 2021 17:11:31 +0530:
> > > > >         
> > > > > > On 3 February 2021 4:54:22 PM IST, Boris Brezillon <boris.brezillon@collabora.com> wrote:        
> > > > > > >On Wed, 03 Feb 2021 16:22:42 +0530
> > > > > > >Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> > > > > > >          
> > > > > > >> On 3 February 2021 3:49:14 PM IST, Boris Brezillon          
> > > > > > ><boris.brezillon@collabora.com> wrote:          
> > > > > > >> >On Wed, 03 Feb 2021 15:42:02 +0530
> > > > > > >> >Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> > > > > > >> >            
> > > > > > >> >> >> 
> > > > > > >> >> >> I got more information from the vendor, Telit. The access to          
> > > > > > >the            
> > > > > > >> >3rd              
> > > > > > >> >> >partition is protected by Trustzone and any access in non          
> > > > > > >privileged          
> > > > > > >> >> >mode (where Linux kernel runs) causes kernel panic and the device
> > > > > > >> >> >reboots.             
> > > > > > >> >
> > > > > > >> >Out of curiosity, is it a per-CS-line thing or is this section
> > > > > > >> >protected on all CS?
> > > > > > >> >            
> > > > > > >> 
> > > > > > >> Sorry, I didn't get your question.           
> > > > > > >
> > > > > > >The qcom controller can handle several chips, each connected through a
> > > > > > >different CS (chip-select) line, right? I'm wondering if the firmware
> > > > > > >running in secure mode has the ability to block access for a specific
> > > > > > >CS line or if all CS lines have the same constraint. That will impact
> > > > > > >the way you describe it in your DT (in one case the secure-region
> > > > > > >property should be under the controller node, in the other case it
> > > > > > >should be under the NAND chip node).          
> > > > > > 
> > > > > > Right. I believe the implementation is common to all NAND chips so the property should be in the controller node.         
> > > > > 
> > > > > Looks weird: do you mean that each of the chips will have a secure area?        
> > > > 
> > > > I way I said is, the "secure-region" property will be present in the controller
> > > > node and not in the NAND chip node since this is not related to the device
> > > > functionality.
> > > > 
> > > > But for referencing the NAND device, the property can have the phandle as below:
> > > > 
> > > > secure-region = <&nand0 0xffff>;      
> > > 
> > > My question was really what happens from a functional PoV. If you have
> > > per-chip protection at the FW level, this property should be under the
> > > NAND node. OTH, if the FW doesn't look at the selected chip before
> > > blocking the access, it should be at the controller level. So, you
> > > really have to understand what the secure FW does.    
> > 
> > I'm not so sure actually, that's why I like the phandle to nand0 -> in
> > any case it's not a property of the NAND chip itself, it's kind of a
> > host constraint, so I don't get why the property should be at the
> > NAND node level?  
> 
> I would argue that we already have plenty of NAND properties that
> encode things controlled by the host (ECC, partitions, HW randomizer,
> boot device, and all kind of controller specific stuff) :P. Having
> the props under the NAND node makes it clear what those things are
> applied to, and it's also easier to parse for the driver (you already
> have to parse each node to get the reg property anyway).

Fair points.

> > Also, we should probably support several secure regions (which could be
> > a way to express the fact that the FW does not look at the CS)?  
> 
> Sure, the secure-region should probably be renamed secure-regions, even
> if it's defined at the NAND chip level.

Absolutely.

Thanks,
Miquèl
