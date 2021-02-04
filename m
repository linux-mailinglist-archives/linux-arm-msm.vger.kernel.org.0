Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5709830EE21
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 09:16:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234732AbhBDIOj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 03:14:39 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:60335 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234658AbhBDIOZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 03:14:25 -0500
Received: from xps13 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr [86.210.203.150])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id DC160100012;
        Thu,  4 Feb 2021 08:13:37 +0000 (UTC)
Date:   Thu, 4 Feb 2021 09:13:36 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>, richard@nod.at,
        vigneshr@ti.com, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH] mtd: rawnand: Do not check for bad block if bbt is
 unavailable
Message-ID: <20210204091336.1406ca3b@xps13>
In-Reply-To: <F55F9D7B-0542-448E-A711-D1035E467ACA@linaro.org>
References: <20210130035412.6456-1-manivannan.sadhasivam@linaro.org>
        <20210201151824.5a9dca4a@xps13>
        <20210202041614.GA840@work>
        <20210202091459.0c41a769@xps13>
        <AFD0F5A6-7876-447B-A089-85091225BE11@linaro.org>
        <20210203110522.12f2b326@xps13>
        <EBDAB319-549F-4CB1-8CE3-9DFA99DBFBC0@linaro.org>
        <20210203111914.1c2f68f6@collabora.com>
        <8A2468D5-B435-4923-BA4F-7BF7CC0FF207@linaro.org>
        <20210203122422.6963b0ed@collabora.com>
        <F55F9D7B-0542-448E-A711-D1035E467ACA@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Manivannan,

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote on Wed,
03 Feb 2021 17:11:31 +0530:

> On 3 February 2021 4:54:22 PM IST, Boris Brezillon <boris.brezillon@collabora.com> wrote:
> >On Wed, 03 Feb 2021 16:22:42 +0530
> >Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> >  
> >> On 3 February 2021 3:49:14 PM IST, Boris Brezillon  
> ><boris.brezillon@collabora.com> wrote:  
> >> >On Wed, 03 Feb 2021 15:42:02 +0530
> >> >Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> >> >    
> >> >> >> 
> >> >> >> I got more information from the vendor, Telit. The access to  
> >the    
> >> >3rd      
> >> >> >partition is protected by Trustzone and any access in non  
> >privileged  
> >> >> >mode (where Linux kernel runs) causes kernel panic and the device
> >> >> >reboots.     
> >> >
> >> >Out of curiosity, is it a per-CS-line thing or is this section
> >> >protected on all CS?
> >> >    
> >> 
> >> Sorry, I didn't get your question.   
> >
> >The qcom controller can handle several chips, each connected through a
> >different CS (chip-select) line, right? I'm wondering if the firmware
> >running in secure mode has the ability to block access for a specific
> >CS line or if all CS lines have the same constraint. That will impact
> >the way you describe it in your DT (in one case the secure-region
> >property should be under the controller node, in the other case it
> >should be under the NAND chip node).  
> 
> Right. I believe the implementation is common to all NAND chips so the property should be in the controller node. 

Looks weird: do you mean that each of the chips will have a secure area?
