Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ECFFCB4CD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2019 09:05:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbfJDHFT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Oct 2019 03:05:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:59526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726523AbfJDHFT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Oct 2019 03:05:19 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 227882133F;
        Fri,  4 Oct 2019 07:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570172718;
        bh=EjRNR4eRniZcSYrm5e4VBrDZH9+iTf12cEb32bKYfqg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b6eJ2Wc4XpGdHfkBkVkiimZDdG2d3CVEPwSVgLHow7S4fB6vVxS84o2WN4uJY2qp3
         QBX1xvBiuAiWgUufXuQImrUH09Segx6uAJ2PQUxmPmhrHJJOFSHmMiokZAE/Xft//H
         DcySNG75Gwg5saGyEzZVuU5XqiVlxMMPQG9ATPB8=
Date:   Fri, 4 Oct 2019 09:05:16 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Murali Nalajala <mnalajal@codeaurora.org>, rafael@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] base: soc: Handle custom soc information sysfs entries
Message-ID: <20191004070516.GA6371@kroah.com>
References: <1570146710-13503-1-git-send-email-mnalajal@codeaurora.org>
 <5d96daca.1c69fb81.fe5e4.e623@mx.google.com>
 <20191004055057.GH63675@minitux>
 <5d96e40a.1c69fb81.5a60f.fd3a@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d96e40a.1c69fb81.5a60f.fd3a@mx.google.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 03, 2019 at 11:17:45PM -0700, Stephen Boyd wrote:
> Quoting Bjorn Andersson (2019-10-03 22:50:57)
> > On Thu 03 Oct 22:38 PDT 2019, Stephen Boyd wrote:
> > 
> > > Quoting Murali Nalajala (2019-10-03 16:51:50)
> > > > @@ -151,14 +156,16 @@ struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr
> > > >  
> > > >         ret = device_register(&soc_dev->dev);
> > > >         if (ret)
> > > > -               goto out3;
> > > > +               goto out4;
> > > >  
> > > >         return soc_dev;
> > > >  
> > > > -out3:
> > > > +out4:
> > > >         ida_simple_remove(&soc_ida, soc_dev->soc_dev_num);
> > > >         put_device(&soc_dev->dev);
> > > >         soc_dev = NULL;
> > > > +out3:
> > > > +       kfree(soc_attr_groups);
> > > 
> > > This code is tricky. put_device(&soc_dev->dev) will call soc_release()
> > > so we set soc_dev to NULL before calling kfree() on the error path. This
> > > way we don't doubly free a pointer that the release function will take
> > > care of. I wonder if the release function could free the ida as well,
> > > and then we could just make the device_register() failure path call
> > > put_device() and return ERR_PTR(ret) directly. Then the error path is
> > > simpler because we can avoid changing two pointers to NULL to avoid the
> > > double free twice. Or just inline the ida remove and put_device() call
> > > in the if and then goto out1 to consolidate the error pointer
> > > conversion.
> > > 
> > 
> > But if we instead allocates the ida before the soc_dev, wouldn't the
> > error path be something like?:
> > 
> > foo:
> >         put_device(&soc_dev->dev);
> > bar:
> >         ida_simple_remove(&soc_ida, soc_num);
> >         return err;
> > 
> > 
> > I think we still need two exit paths from soc_device_register()
> > regardless of moving the ida_simple_remove() into the release, but we
> > could drop it from the unregister(). So not sure if this is cleaner...
> > 
> 
> It doesn't seem "safe" to let the number be reused before the device is
> destroyed by put_device(). It would be clearer to do all the cleanup
> from the release function so that the soc_device_unregister() path isn't
> racy with another device being registered and reusing the same ID.
> 
> Of course this probably doesn't matter because the race I'm talking
> about is extremely unlikely given there's only ever one soc device.
> Reordering the put and remove would be fine too.

As the number is "owned" by the device, yes, it should just be removed
in the release function that frees the device memory, making this all
much simpler overall.

thanks,

greg k-h
