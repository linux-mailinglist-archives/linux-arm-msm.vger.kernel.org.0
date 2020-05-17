Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7506F1D6667
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2020 09:14:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbgEQHOV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 May 2020 03:14:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:44028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727002AbgEQHOV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 May 2020 03:14:21 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EA36520735;
        Sun, 17 May 2020 07:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589699660;
        bh=1NXTVdhTm9Mn+zSk8eASvguz0HCxxJOBrSMmsTfIQVI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bv4DPDZOcNzVDkNjkMZatlVIPdoV/UuqP7zB8RS5rDQcXXrmL3Qr8FZC32ri0gIZx
         leh3hrxSDHo48OtoglmI26OAHK7Ghi0FAf0tI5NmDGM5z7b4pUkkR3frNAoFDJt5Pg
         9vYQ042UJnIqxzOvd7NW0Gwq3md1D4EP9m0SM1n0=
Date:   Sun, 17 May 2020 09:14:17 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     arnd@arndb.de, manivannan.sadhasivam@linaro.org,
        bjorn.andersson@linaro.org, wufan@codeaurora.org,
        pratanan@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 3/8] qaic: Create char dev
Message-ID: <20200517071417.GA3090070@kroah.com>
References: <1589465266-20056-1-git-send-email-jhugo@codeaurora.org>
 <1589465266-20056-4-git-send-email-jhugo@codeaurora.org>
 <20200514141211.GA2643665@kroah.com>
 <0421a64a-10f3-08df-9ef1-14fdb570db0d@codeaurora.org>
 <20200514155615.GA2963499@kroah.com>
 <4be546d3-b571-0659-0140-f34ec88f95ff@codeaurora.org>
 <4683046a-c6b5-30a5-ef02-2f610523ae1c@codeaurora.org>
 <20200516070131.GB3964535@kroah.com>
 <8e06c718-8b8a-f09a-4685-11c0c1581a0c@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e06c718-8b8a-f09a-4685-11c0c1581a0c@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, May 16, 2020 at 03:29:19PM -0600, Jeffrey Hugo wrote:
> On 5/16/2020 1:01 AM, Greg KH wrote:
> > On Fri, May 15, 2020 at 03:08:59PM -0600, Jeffrey Hugo wrote:
> > > 2. There are a limited number of dynamic minor numbers for misc devs (64),
> > > so if you are expecting more devices than that, a misc dev is not
> > > appropiate.  Also, these minors are shared with other misc dev users, so
> > > depending on the system configuration, you might have significantly less
> > > than 64 minors available for use.
> > 
> > I'm pretty sure we can have more than 64 misc devices, that limitation
> > should have been removed a while ago.  Try it and see :)
> 
> In total, there can be more tha 64 misc devices.  However my previous
> comment was specific to dynamic minors (ie devices which do not have an
> assigned minor).  The limit on dynamic minors still apears to be 64. Looking
> at the code -
> 
> DYNAMIC_MINORS is still 64
> https://elixir.bootlin.com/linux/v5.7-rc5/source/drivers/char/misc.c#L63
> 
> I see the same in -next
> 
> DYNAMIC_MINORS is used to size a bitmap - one bit for each dynamic minor
> misc device that exists at one particular point in time.  After all 64 bits
> are consumed by misc_register() by clients requesting a dynamic minor, no
> more dynamic minor misc devices can be registered until some are
> unregistered.
> 
> What am I missing?

Oops, nothing, my fault.  We fixed up the allocation of more dynamic
majors for chardev in 2017 and for some reason I thought we also
increased the number of misc dynamic minors at the same time, but that
was incorrect.

I'll gladly take patches that bump up the number of misc minors if
needed.

But to get back to the main issue here, you are only going to have 1 or
maybe 2 of these devices in a system at a time, right?  So "burning" a
whole major number for that feels like a waste.

thanks,

greg k-h
