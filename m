Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6645330D8A5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 12:29:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234261AbhBCL1x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 06:27:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234255AbhBCL0R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 06:26:17 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA156C061794;
        Wed,  3 Feb 2021 03:24:32 -0800 (PST)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C06581F451BB;
        Wed,  3 Feb 2021 11:24:28 +0000 (GMT)
Date:   Wed, 3 Feb 2021 12:24:22 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        richard@nod.at
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>, vigneshr@ti.com,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org
Subject: Re: [PATCH] mtd: rawnand: Do not check for bad block if bbt is
 unavailable
Message-ID: <20210203122422.6963b0ed@collabora.com>
In-Reply-To: <8A2468D5-B435-4923-BA4F-7BF7CC0FF207@linaro.org>
References: <20210130035412.6456-1-manivannan.sadhasivam@linaro.org>
        <20210201151824.5a9dca4a@xps13>
        <20210202041614.GA840@work>
        <20210202091459.0c41a769@xps13>
        <AFD0F5A6-7876-447B-A089-85091225BE11@linaro.org>
        <20210203110522.12f2b326@xps13>
        <EBDAB319-549F-4CB1-8CE3-9DFA99DBFBC0@linaro.org>
        <20210203111914.1c2f68f6@collabora.com>
        <8A2468D5-B435-4923-BA4F-7BF7CC0FF207@linaro.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 03 Feb 2021 16:22:42 +0530
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:

> On 3 February 2021 3:49:14 PM IST, Boris Brezillon <boris.brezillon@collabora.com> wrote:
> >On Wed, 03 Feb 2021 15:42:02 +0530
> >Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> >  
> >> >> 
> >> >> I got more information from the vendor, Telit. The access to the  
> >3rd    
> >> >partition is protected by Trustzone and any access in non privileged
> >> >mode (where Linux kernel runs) causes kernel panic and the device
> >> >reboots.   
> >
> >Out of curiosity, is it a per-CS-line thing or is this section
> >protected on all CS?
> >  
> 
> Sorry, I didn't get your question. 

The qcom controller can handle several chips, each connected through a
different CS (chip-select) line, right? I'm wondering if the firmware
running in secure mode has the ability to block access for a specific
CS line or if all CS lines have the same constraint. That will impact
the way you describe it in your DT (in one case the secure-region
property should be under the controller node, in the other case it
should be under the NAND chip node).
