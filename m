Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0304C159999
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2020 20:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729934AbgBKTU4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Feb 2020 14:20:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:37246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729800AbgBKTU4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Feb 2020 14:20:56 -0500
Received: from localhost (unknown [104.133.9.100])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 69B6B2465D;
        Tue, 11 Feb 2020 19:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581448855;
        bh=FPnZuYXGNfI9DnJJwwdEqftI4D003QQkxbvVmqvW0uA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jY87CbT2FrZqH9dfgB7Ca3cqkAAQa1w5bB4t1lxEp981drSTF1rdupYPCqRtNrJBH
         xV+LM4BL4lIaDa30WISJl2lvFGHiPmNHB6+0XQ9qA/qZla13gJJf2dh+WL0HivQDo9
         QB5b78UN28Kb5Ajpf/u1VUiqKjUy1rxQQcQcHFrk=
Date:   Tue, 11 Feb 2020 11:20:55 -0800
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     arnd@arndb.de, smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/16] bus: mhi: core: Add support for registering MHI
 controllers
Message-ID: <20200211192055.GA1962867@kroah.com>
References: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
 <20200131135009.31477-3-manivannan.sadhasivam@linaro.org>
 <20200206165755.GB3894455@kroah.com>
 <20200211184130.GA11908@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200211184130.GA11908@Mani-XPS-13-9360>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 12, 2020 at 12:11:30AM +0530, Manivannan Sadhasivam wrote:
> Hi Greg,
> 
> On Thu, Feb 06, 2020 at 05:57:55PM +0100, Greg KH wrote:
> > On Fri, Jan 31, 2020 at 07:19:55PM +0530, Manivannan Sadhasivam wrote:
> > > --- /dev/null
> > > +++ b/drivers/bus/mhi/core/init.c
> > > @@ -0,0 +1,407 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
> > > + *
> > > + */
> > > +
> > > +#define dev_fmt(fmt) "MHI: " fmt
> > 
> > This should not be needed, right?  The bus/device name should give you
> > all you need here from what I can tell.  So why is this needed?
> > 
> 
> The log will have only the device name as like PCI-E. But that won't specify
> where the error is coming from. Having "MHI" prefix helps the users to
> quickly identify that the error is coming from MHI stack.

If the driver binds properly to the device, the name of the driver will
be there in the message, so I suggest using that please.

No need for this prefix...

thanks,

greg k-h
