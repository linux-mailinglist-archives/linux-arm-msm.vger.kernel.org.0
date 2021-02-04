Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F415730EF13
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 09:55:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234783AbhBDIxL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 03:53:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234712AbhBDIxK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 03:53:10 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A702C061573
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Feb 2021 00:52:30 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id j11so1377367plt.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Feb 2021 00:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3GYc3j0LV6uWWeY9tuYUCxyV+hFD6RVupRGibO/7f98=;
        b=LU9+t/+6TpnqCyJxyc5la5O0NK5DxLuzM20lcBxz3KoUXOFtQWBOhjAxqOnFVJkYmN
         Sos2ltry4CR1JQXRQW5+8O/RdCKzotTxq02FqCNEusjCkhWDIgiNuWiNTOBsXDn5o1vR
         XaA0PGHtDR4WoiQoE5DLS4UW4SuWqbyx4pb+n9vtPyibKFZE5sd8ElCXrM844vetV64M
         2QPmwVpHzHQqNcIBl7mY7V5p9sfch8UDQogFW8VgSZVXCLey8IejjxIf9g8QIfKWIFqg
         he0p3DSGOjjmM4u37MBY6w1uk74723A0/+4ME9qwZ7Ga87YSz7ELn3dYqFoCxu5uU1Gd
         pXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3GYc3j0LV6uWWeY9tuYUCxyV+hFD6RVupRGibO/7f98=;
        b=gJ+mXklmdzfCYx2KCbvosT93ZcdZtziKHnU+AWv+mYj1E7DrGRiFDXWVIlcfMbApLC
         q0DO4JykL979H98RHiquS2bdW93K3YSmPFHJgR2KRLO5WoCrXMCPH7TY/1lilVCTiXvc
         YcGaXx6oAJ61cBq7z8QIYshjCz6Mf/c+V9PqT/+xzIL0OfOTMaQpB9fPYfItjuxIKJma
         /9ZqrPFikhuHRa6IYcCZ2YdZWHaPxVrRsrCMmN2/fQ1/FNNG76bUCXIxbXcwBROzTdKU
         ynW4orN9x2h8H5V6KkDOx8D3vYeXLbMDekflb9OctEc+CyYXc4MIzQsTGrtpLBKiaEis
         GzFw==
X-Gm-Message-State: AOAM531UVsdKjGg4gotK8PMOGqpmIlYNWiLEh7jmw3BT3amf7qRONypg
        Fjymi1IeysmUViQLmCG0tNWP
X-Google-Smtp-Source: ABdhPJwFRfv+E9t3nw8/umSWCNIlyd5aUrs4h9KN7me07HwrpyiQgKNxbD0cp5qXBcb73+tmScx2xw==
X-Received: by 2002:a17:90a:5a86:: with SMTP id n6mr7711124pji.65.1612428750089;
        Thu, 04 Feb 2021 00:52:30 -0800 (PST)
Received: from thinkpad ([2409:4072:502:e1e4:2c42:3883:f540:5b9c])
        by smtp.gmail.com with ESMTPSA id y26sm5604528pgk.42.2021.02.04.00.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 00:52:29 -0800 (PST)
Date:   Thu, 4 Feb 2021 14:22:21 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>, richard@nod.at,
        vigneshr@ti.com, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH] mtd: rawnand: Do not check for bad block if bbt is
 unavailable
Message-ID: <20210204085221.GB8235@thinkpad>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210204091336.1406ca3b@xps13>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 04, 2021 at 09:13:36AM +0100, Miquel Raynal wrote:
> Hi Manivannan,
> 
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote on Wed,
> 03 Feb 2021 17:11:31 +0530:
> 
> > On 3 February 2021 4:54:22 PM IST, Boris Brezillon <boris.brezillon@collabora.com> wrote:
> > >On Wed, 03 Feb 2021 16:22:42 +0530
> > >Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> > >  
> > >> On 3 February 2021 3:49:14 PM IST, Boris Brezillon  
> > ><boris.brezillon@collabora.com> wrote:  
> > >> >On Wed, 03 Feb 2021 15:42:02 +0530
> > >> >Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:
> > >> >    
> > >> >> >> 
> > >> >> >> I got more information from the vendor, Telit. The access to  
> > >the    
> > >> >3rd      
> > >> >> >partition is protected by Trustzone and any access in non  
> > >privileged  
> > >> >> >mode (where Linux kernel runs) causes kernel panic and the device
> > >> >> >reboots.     
> > >> >
> > >> >Out of curiosity, is it a per-CS-line thing or is this section
> > >> >protected on all CS?
> > >> >    
> > >> 
> > >> Sorry, I didn't get your question.   
> > >
> > >The qcom controller can handle several chips, each connected through a
> > >different CS (chip-select) line, right? I'm wondering if the firmware
> > >running in secure mode has the ability to block access for a specific
> > >CS line or if all CS lines have the same constraint. That will impact
> > >the way you describe it in your DT (in one case the secure-region
> > >property should be under the controller node, in the other case it
> > >should be under the NAND chip node).  
> > 
> > Right. I believe the implementation is common to all NAND chips so the property should be in the controller node. 
> 
> Looks weird: do you mean that each of the chips will have a secure area?

I way I said is, the "secure-region" property will be present in the controller
node and not in the NAND chip node since this is not related to the device
functionality.

But for referencing the NAND device, the property can have the phandle as below:

secure-region = <&nand0 0xffff>;

Thanks,
Mani
