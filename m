Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4016430201
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 12:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240056AbhJPK03 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 06:26:29 -0400
Received: from smtprelay0029.hostedemail.com ([216.40.44.29]:36398 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235031AbhJPK02 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 06:26:28 -0400
Received: from omf19.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id 0B04439BA7;
        Sat, 16 Oct 2021 10:24:20 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf19.hostedemail.com (Postfix) with ESMTPA id 9523220D764;
        Sat, 16 Oct 2021 10:24:18 +0000 (UTC)
Message-ID: <6ddc01b24b1c72f7e92174a037043b5cfffa3431.camel@perches.com>
Subject: Re: [PATCH 3/3] bus: mhi: replace snprintf in show functions with
 sysfs_emit
From:   Joe Perches <joe@perches.com>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org, wangqing@vivo.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
Date:   Sat, 16 Oct 2021 03:24:17 -0700
In-Reply-To: <YWqBTj4slHq7HexS@kroah.com>
References: <20211016065734.28802-1-manivannan.sadhasivam@linaro.org>
         <20211016065734.28802-4-manivannan.sadhasivam@linaro.org>
         <YWqBTj4slHq7HexS@kroah.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.38
X-Stat-Signature: 91sxoiniyzum7wdgd7kangjd88gejuj5
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 9523220D764
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18mqnsmvmciBIb4oKRgjUfrWQOVP9NORno=
X-HE-Tag: 1634379858-169333
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 2021-10-16 at 09:37 +0200, Greg KH wrote:
> On Sat, Oct 16, 2021 at 12:27:34PM +0530, Manivannan Sadhasivam wrote:
> > From: Qing Wang <wangqing@vivo.com>
> > coccicheck complains about the use of snprintf() in sysfs show functions.
[]
> > diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
[]
> > @@ -94,7 +94,7 @@ static ssize_t serial_number_show(struct device *dev,
> >  	struct mhi_device *mhi_dev = to_mhi_device(dev);
> >  	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> >  
> > -	return snprintf(buf, PAGE_SIZE, "Serial Number: %u\n",
> > +	return sysfs_emit(buf, "Serial Number: %u\n",
> >  			mhi_cntrl->serial_number);
> 
> The text "Serial Number: " should not be in here, right?  It's obvious
> this is a serial number, that's what the documentation and file name
> says.  Userspace should not have to parse sysfs files.

sysfs is ABI right?  Parsing or not, it's what's already there.


