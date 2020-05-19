Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 787D51D9DEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 19:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729185AbgESRd0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 13:33:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:57922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726059AbgESRd0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 13:33:26 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6FCB4207D3;
        Tue, 19 May 2020 17:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589909605;
        bh=RbUlIvE4LT0SUt6DmGmYa7lxdWF2Wy9aH9szc8JNaGM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VDgmFIJAzKKktnniXeaBnmhzP17wlvliuYaaV9Ry3Y67tMakXT2pIKGmll+EOsO7j
         3KsWdb+dYvNTb0MxgnDtpV1Tz/uItHsg6dwU7pqNx1RnV5DbAsnC3atg+zqwTOfDaF
         o7LRVU2FD/AyURy0P1NnIa77sqCfXwIc25JCr4WM=
Date:   Tue, 19 May 2020 19:33:23 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Dave Airlie <airlied@gmail.com>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>, Arnd Bergmann <arnd@arndb.de>,
        manivannan.sadhasivam@linaro.org, bjorn.andersson@linaro.org,
        wufan@codeaurora.org, pratanan@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 0/8] Qualcomm Cloud AI 100 driver
Message-ID: <20200519173323.GB1158284@kroah.com>
References: <1589465266-20056-1-git-send-email-jhugo@codeaurora.org>
 <CAPM=9txXskVu_yD3DNuR0HgSUsE2v1Pv98dm=AHGvv_z2XKTAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9txXskVu_yD3DNuR0HgSUsE2v1Pv98dm=AHGvv_z2XKTAQ@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 19, 2020 at 03:08:42PM +1000, Dave Airlie wrote:
> On Fri, 15 May 2020 at 00:12, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
> >
> > Introduction:
> > Qualcomm Cloud AI 100 is a PCIe adapter card which contains a dedicated
> > SoC ASIC for the purpose of efficently running Deep Learning inference
> > workloads in a data center environment.
> >
> > The offical press release can be found at -
> > https://www.qualcomm.com/news/releases/2019/04/09/qualcomm-brings-power-efficient-artificial-intelligence-inference
> >
> > The offical product website is -
> > https://www.qualcomm.com/products/datacenter-artificial-intelligence
> >
> > At the time of the offical press release, numerious technology news sites
> > also covered the product.  Doing a search of your favorite site is likely
> > to find their coverage of it.
> >
> > It is our goal to have the kernel driver for the product fully upstream.
> > The purpose of this RFC is to start that process.  We are still doing
> > development (see below), and thus not quite looking to gain acceptance quite
> > yet, but now that we have a working driver we beleive we are at the stage
> > where meaningful conversation with the community can occur.
> 
> 
> Hi Jeffery,
> 
> Just wondering what the userspace/testing plans for this driver.
> 
> This introduces a new user facing API for a device without pointers to
> users or tests for that API.
> 
> Although this isn't a graphics driver, and Greg will likely merge
> anything to the kernel you throw at him, I do wonder how to validate
> the uapi from a security perspective. It's always interesting when
> someone wraps a DMA engine with user ioctls, and without enough
> information to decide if the DMA engine is secure against userspace
> misprogramming it.

Hey, I'll not merge just anything!

Oh, well, maybe, if it's in staging :)

> Also if we don't understand the programming API on board the device,
> we can't tell if the "core" on the device are able to reprogram the
> device engines either.
> 
> Figuring this out is difficult at the best of times, it helps if there
> is access to the complete device documentation or user space side
> drivers in order to faciliate this.
> 
> The other area I mention is testing the uAPI, how do you envisage
> regression testing and long term sustainability of the uAPI?

I agree with this request, we should have some code that we can run in
order to test that things work properly.

thanks,

greg k-h
