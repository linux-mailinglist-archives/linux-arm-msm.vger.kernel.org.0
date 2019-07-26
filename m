Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8BF7635B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2019 12:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbfGZKT3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jul 2019 06:19:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:43746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725815AbfGZKT3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jul 2019 06:19:29 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 89186229F9;
        Fri, 26 Jul 2019 10:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564136368;
        bh=rnzZTI3R4YtevXWLIMuEjKk8X83MUvmSjfijAT5kr/U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1we1DI8LpBv9/chtOSAbouY4rmVorOqsSHMGGPjxkJxt7btRY+Q4o55aFtMwoAAsi
         cRrgHskOaAglnpzfunZqY5pUd3/99JHsKEyPFGKlniwvrfet6Oe42JwlKLhCwtpi1d
         76w3RRINTAdfi6dJKljuLT9YmFJLSfm1W5D9tHB4=
Date:   Fri, 26 Jul 2019 12:19:25 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Leo Yan <leo.yan@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Regression] Missing device nodes for ETR, ETF and STM after
 CONFIG_UEVENT_HELPER=n
Message-ID: <20190726101925.GA22476@kroah.com>
References: <cfe09a46-462f-633a-37c2-52f8bfc0ffb2@codeaurora.org>
 <20190726070429.GA15714@kroah.com>
 <165028a7-ff12-dd28-cc4c-57a3961dbb40@codeaurora.org>
 <20190726084127.GA28470@kroah.com>
 <097942a1-6914-2542-450f-65a6147dc7aa@codeaurora.org>
 <6d48f996-6297-dc69-250b-790be6d2670c@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d48f996-6297-dc69-250b-790be6d2670c@codeaurora.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 26, 2019 at 03:44:40PM +0530, Sai Prakash Ranjan wrote:
> On 7/26/2019 3:14 PM, Sai Prakash Ranjan wrote:
> > On 7/26/2019 2:11 PM, Greg Kroah-Hartman wrote:
> > > On Fri, Jul 26, 2019 at 01:50:27PM +0530, Sai Prakash Ranjan wrote:
> > > > On 7/26/2019 12:34 PM, Greg Kroah-Hartman wrote:
> > > > > On Fri, Jul 26, 2019 at 11:49:19AM +0530, Sai Prakash Ranjan wrote:
> > > > > > Hi,
> > > > > > 
> > > > > > When trying to test my coresight patches, I found that etr,etf and stm
> > > > > > device nodes are missing from /dev.
> > > > > 
> > > > > I have no idea what those device nodes are.
> > > > > 
> > > > > > Bisection gives this as the bad commit.
> > > > > > 
> > > > > > 1be01d4a57142ded23bdb9e0c8d9369e693b26cc is the first bad commit
> > > > > > commit 1be01d4a57142ded23bdb9e0c8d9369e693b26cc
> > > > > > Author: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > > Date:   Thu Mar 14 12:13:50 2019 +0100
> > > > > > 
> > > > > >       driver: base: Disable CONFIG_UEVENT_HELPER by default
> > > > > > 
> > > > > >       Since commit 7934779a69f1184f ("Driver-Core:
> > > > > > disable /sbin/hotplug by
> > > > > >       default"), the help text for the /sbin/hotplug fork-bomb says
> > > > > >       "This should not be used today [...] creates a
> > > > > > high system load, or
> > > > > >       [...] out-of-memory situations during bootup". 
> > > > > > The rationale for this
> > > > > >       was that no recent mainstream system used this
> > > > > > anymore (in 2010!).
> > > > > > 
> > > > > >       A few years later, the complete uevent helper
> > > > > > support was made optional
> > > > > >       in commit 86d56134f1b67d0c ("kobject: Make support
> > > > > > for uevent_helper
> > > > > >       optional.").  However, if was still left enabled
> > > > > > by default, to support
> > > > > >       ancient userland.
> > > > > > 
> > > > > >       Time passed by, and nothing should use this
> > > > > > anymore, so it can be
> > > > > >       disabled by default.
> > > > > > 
> > > > > >       Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > >       Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > > 
> > > > > >    drivers/base/Kconfig | 1 -
> > > > > >    1 file changed, 1 deletion(-)
> > > > > > 
> > > > > > 
> > > > > > Any idea on this?
> > > > > 
> > > > > That means that who ever created those device nodes is relying on udev
> > > > > to do this, and is not doing the correct thing within the kernel and
> > > > > using devtmpfs.
> > > > > 
> > > > > Any pointers to where in the kernel those devices are trying to be
> > > > > created?
> > > > > 
> > > > 
> > > > Somewhere in drivers/hwtracing/coresight/* probably. I am not sure,
> > > > Mathieu/Suzuki would be able to point you to the exact code.
> > > > 
> > > > Also just to add on some more details, I am using *initramfs*
> > > 
> > > Are you using devtmpfs for your /dev/ mount?
> > > 
> > 
> > I am not mounting devtmpfs. However
> > 
> >   CONFIG_DEVTMPFS=y
> >   CONFIG_DEVTMPFS_MOUNT=y
> > 
> 
> Ok my initramfs is using mdev:
> 
> */sbin/mdev -s*
> 
> This somehow is not mounting etr, etf, stm devices when uevent-helper is
> disabled. Anyways as Suzuki mentioned, using devtmpfs does fix the issue.

Last I looked (many years ago) mdev requires uevent-helper in order for
it to work.  I recommend that if you rely on mdev to keep that option
enabled, or to just use devtmpfs and udev :)

thanks,

greg k-h
