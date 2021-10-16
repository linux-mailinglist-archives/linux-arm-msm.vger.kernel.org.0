Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8C84430332
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 17:13:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236663AbhJPPPP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 11:15:15 -0400
Received: from smtprelay0103.hostedemail.com ([216.40.44.103]:54282 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235703AbhJPPPO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 11:15:14 -0400
Received: from omf14.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id E02D01018D5AF;
        Sat, 16 Oct 2021 15:13:05 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf14.hostedemail.com (Postfix) with ESMTPA id 2F15D268E46;
        Sat, 16 Oct 2021 15:13:04 +0000 (UTC)
Message-ID: <400d3fe720e336d5dba6e9b95c75baadf22a6a58.camel@perches.com>
Subject: Re: [PATCH 3/3] bus: mhi: replace snprintf in show functions with
 sysfs_emit
From:   Joe Perches <joe@perches.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        hemantk@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org, wangqing@vivo.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
Date:   Sat, 16 Oct 2021 08:13:03 -0700
In-Reply-To: <YWrqmiT1pC+SbecM@kroah.com>
References: <20211016065734.28802-1-manivannan.sadhasivam@linaro.org>
         <20211016065734.28802-4-manivannan.sadhasivam@linaro.org>
         <YWqBTj4slHq7HexS@kroah.com>
         <6ddc01b24b1c72f7e92174a037043b5cfffa3431.camel@perches.com>
         <YWrqmiT1pC+SbecM@kroah.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.89
X-Stat-Signature: 9uhebz6odwgnyap79pzfzw94x7mhn8a1
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 2F15D268E46
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/lF+a3yNodCoxdxWj3to9HFbSG6J4S2Fs=
X-HE-Tag: 1634397184-28310
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 2021-10-16 at 17:07 +0200, Greg KH wrote:
> On Sat, Oct 16, 2021 at 03:24:17AM -0700, Joe Perches wrote:
> > On Sat, 2021-10-16 at 09:37 +0200, Greg KH wrote:
> > > On Sat, Oct 16, 2021 at 12:27:34PM +0530, Manivannan Sadhasivam wrote:
> > > > From: Qing Wang <wangqing@vivo.com>
> > > > coccicheck complains about the use of snprintf() in sysfs show functions.
> > []
> > > > diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> > []
> > > > @@ -94,7 +94,7 @@ static ssize_t serial_number_show(struct device *dev,
> > > >  	struct mhi_device *mhi_dev = to_mhi_device(dev);
> > > >  	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> > > >  
> > > > -	return snprintf(buf, PAGE_SIZE, "Serial Number: %u\n",
> > > > +	return sysfs_emit(buf, "Serial Number: %u\n",
> > > >  			mhi_cntrl->serial_number);
> > > 
> > > The text "Serial Number: " should not be in here, right?  It's obvious
> > > this is a serial number, that's what the documentation and file name
> > > says.  Userspace should not have to parse sysfs files.
> > 
> > sysfs is ABI right?  Parsing or not, it's what's already there.
> 
> If no tools rely on this, and we can change it, we should at least try.
> 
> We can not change ABI if something breaks.  If nothing relies on it,
> then it is fine to do so.

That's a quite bad way to think of an ABI.

All that does is tempt fate as you don't know if something already
uses it until someone complains and by that time something else may
be written to depend on the new behavior.


