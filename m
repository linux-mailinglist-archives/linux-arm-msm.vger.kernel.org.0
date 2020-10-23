Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1D42975DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 19:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753609AbgJWRin (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 13:38:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:35646 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753608AbgJWRim (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 13:38:42 -0400
Received: from kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net (unknown [163.114.132.6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 426F921527;
        Fri, 23 Oct 2020 17:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603474721;
        bh=10O4uc6pV6KD59oydIH3GBuIwPrNvEt9O4uEKzdaHw8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PAAMF4PP0JRie9zR23MwTCy9ni2h5VUcxGG9cRAxOIAHna/8c7xKqyndZvIS9SYhj
         M7bXyBSvG+9dG/Paokx03wtONM6PE+0F4yeBAlUra3s6jBjcmlXUAwWvWMakQnGufd
         V4UpJmbI99r04G8HQ+ymYMgDnwub2KEptqAaBRf4=
Date:   Fri, 23 Oct 2020 10:38:40 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     manivannan.sadhasivam@linaro.org, gregkh@linuxfoundation.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH v8 0/4] userspace MHI client interface driver
Message-ID: <20201023103840.296091f9@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
In-Reply-To: <58b8c981-491e-3d02-3adc-7224c5692d61@codeaurora.org>
References: <1603354958-24025-1-git-send-email-hemantk@codeaurora.org>
        <20201023093734.7b06694e@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
        <58b8c981-491e-3d02-3adc-7224c5692d61@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 23 Oct 2020 10:22:19 -0700 Hemant Kumar wrote:
> On 10/23/20 9:37 AM, Jakub Kicinski wrote:
> > On Thu, 22 Oct 2020 01:22:34 -0700 Hemant Kumar wrote:  
> >> This patch series adds support for UCI driver. UCI driver enables userspace
> >> clients to communicate to external MHI devices like modem and WLAN. UCI driver
> >> probe creates standard character device file nodes for userspace clients to
> >> perform open, read, write, poll and release file operations. These file
> >> operations call MHI core layer APIs to perform data transfer using MHI bus
> >> to communicate with MHI device. Patch is tested using arm64 based platform.  
> > 
> > Until you CC netdev on this (as suggested [1]), here's my:
> > 
> > Nacked-by: Jakub Kicinski <kuba@kernel.org>
> > 
> > [1]
> > https://lore.kernel.org/netdev/20201016183759.7fa7c0ef@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com/
> >   
> 
> UCI driver patch series includes following patches
> 
> 1)   bus: mhi: core: Add helper API to return number of free TREs
> 2)   bus: mhi: core: Move MHI_MAX_MTU to external header file
> 3)   docs: Add documentation for userspace client interface
> 4)   bus: mhi: Add userspace client interface driver
> 
> mhi net driver can use  #1 and #2 and these two are part of MHI core 
> driver change. These are helper API/macro which can be used by any mhi 
> clients like UCI or mhi net dev.
> 
> #3 and #4 are MHI UCI character driver completely unrelated to netdev.
> 
> How about splitting the patch series between #1,#2 and #3, #4 and add 
> netdev to #1, #2?
> 
> #1,#2 were already reviewed by two folks in community so it would be 
> much easier for netdev folks to refer that in context of mhi net device 
> driver.
> 
> Please let me know what do you think about this idea.

CC netdev on the entire series.

We will judge what is and isn't related to networking.
