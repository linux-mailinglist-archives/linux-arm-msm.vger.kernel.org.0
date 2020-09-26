Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 011F92799FF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 16:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgIZONe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 10:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgIZONe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 10:13:34 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8482DC0613CE
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2020 07:13:34 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 7so4725881pgm.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2020 07:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=J+FRzVQCwSTxnG1vtySOBFjYEzexCz32qY7I4IZiB5U=;
        b=fILCBArfnIDK3Py6giny9fuJb008udeevNgLQQRldQzevU5dMA98mrk9rfVmpPLIzb
         bmG+ol9B/kktHZYrheDRcuA0BjNb1vLNGuZJcwZWDVZcpKyncp0CRzaUF18gF7BZsvVx
         ThGVfIBm1XrS0KveYD+vMrH4Q9QrSCf73dBzl/aQZ4ipaUFtozJqehCMUjkn3V4hu4yw
         UJbek0ogepRCYSMYmgVH5Xm6GJjDmruySSPTELDOLJsnAEHljwKVPov8if2eroe28cL5
         gL/m7xM1+fAIyk47QjtNGLMQLVvt1PRyt5GDV+0g0B7wZw9lR13bHJ4kGWKycNQob7IJ
         wN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=J+FRzVQCwSTxnG1vtySOBFjYEzexCz32qY7I4IZiB5U=;
        b=UC0a/83Q3EjUXv3VYg/sRnyrbAQFHS47EjupXYxmHlaOsBDPtT2IXXMqn7AKlGMJr6
         hG8o8Ya1ddGJCqZAOjCy8BIih89r4muCQwennLWx3Y6kyzaUhYyEdawXaFCdPnLZ7Ve6
         nAxC9+Kg8b8WjVY1NFy1wscvut5KgiUZu6v/FXrhdKbEYaesBOD3+WU9jdOI8VI5d+28
         b/pwN34O48u+VHEW3GGLorzulN4WzmuWeokZolTDygrqtjsR1VUqo/rwCQhZhTDRm+G0
         maKHTtklkIwn6/io6OpfcZgJO2YYUGWwolGIv+uZorL7ADdHB1A3PFrP8t56FJI3tTHX
         losw==
X-Gm-Message-State: AOAM530jfKJq3oVyaSh6EbZuD9ywB7ubPQzHBnYg8AcYgoRmIXBlv5qX
        jtzE+0zMUvIalqi2H/6GfHj4SnycaW0b
X-Google-Smtp-Source: ABdhPJw9uUfPEZk6AVaRJ7lYxiieB97zFpe5rrgRV6O7V76RvPjxVLy2MgrJBMfoNqTvXOUm78Qx4g==
X-Received: by 2002:a63:34ca:: with SMTP id b193mr2851542pga.294.1601129613896;
        Sat, 26 Sep 2020 07:13:33 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:20d:ee7b:91b:1587:faf3:6b2b])
        by smtp.gmail.com with ESMTPSA id h35sm5019145pgl.31.2020.09.26.07.13.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 26 Sep 2020 07:13:32 -0700 (PDT)
Date:   Sat, 26 Sep 2020 19:43:26 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>, hemantk@codeaurora.org,
        bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: core: debugfs: Use correct format specifiers
 for addresses
Message-ID: <20200926141326.GA8720@Mani-XPS-13-9360>
References: <20200925171608.30881-1-manivannan.sadhasivam@linaro.org>
 <c63ae2c3-43ae-6a94-cf27-efb6cc038f83@codeaurora.org>
 <20200926052742.GB9302@linux>
 <20200926053914.GA631346@kroah.com>
 <20200926071604.GC9302@linux>
 <20200926124626.GB3321471@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200926124626.GB3321471@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Sep 26, 2020 at 02:46:26PM +0200, Greg KH wrote:
> On Sat, Sep 26, 2020 at 12:46:04PM +0530, Manivannan Sadhasivam wrote:
> > On Sat, Sep 26, 2020 at 07:39:14AM +0200, Greg KH wrote:
> > > On Sat, Sep 26, 2020 at 10:57:42AM +0530, Manivannan Sadhasivam wrote:
> > > > On Fri, Sep 25, 2020 at 12:01:54PM -0600, Jeffrey Hugo wrote:
> > > > > On 9/25/2020 11:16 AM, Manivannan Sadhasivam wrote:
> > > > > > For exposing the addresses of read/write pointers and doorbell register,
> > > > > > let's use the correct format specifiers. This fixes the following issues
> > > > > > generated using W=1 build in ARM32 and reported by Kbuild bot:
> > > > > > 
> > > > > > All warnings (new ones prefixed by >>):
> > > > > > 
> > > > > > > > drivers/bus/mhi/core/debugfs.c:75:7: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
> > > > > >                                mhi_event->db_cfg.db_val);
> > > > > >                                ^~~~~~~~~~~~~~~~~~~~~~~~
> > > > > >     drivers/bus/mhi/core/debugfs.c:123:7: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
> > > > > >                                mhi_chan->db_cfg.db_val);
> > > > > >                                ^~~~~~~~~~~~~~~~~~~~~~~
> > > > > >     2 warnings generated.
> > > > > > 
> > > > > > drivers/bus/mhi/core/debugfs.c: In function ‘mhi_debugfs_events_show’:
> > > > > > drivers/bus/mhi/core/debugfs.c:74:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> > > > > >     seq_printf(m, " local rp: 0x%llx db: 0x%pad\n", (u64)ring->rp,
> > > > > >                                                     ^
> > > > > > drivers/bus/mhi/core/debugfs.c: In function ‘mhi_debugfs_channels_show’:
> > > > > > drivers/bus/mhi/core/debugfs.c:122:7: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> > > > > >         (u64)ring->rp, (u64)ring->wp,
> > > > > >         ^
> > > > > > drivers/bus/mhi/core/debugfs.c:122:22: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> > > > > >         (u64)ring->rp, (u64)ring->wp,
> > > > > >                        ^
> > > > > > drivers/bus/mhi/core/debugfs.c:121:62: warning: format ‘%llx’ expects argument of type ‘long long unsigned int’, but argument 5 has type ‘dma_addr_t {aka unsigned int}’ [-Wformat=]
> > > > > >     seq_printf(m, " local rp: 0x%llx local wp: 0x%llx db: 0x%llx\n",
> > > > > >                                                             ~~~^
> > > > > >                                                             %x
> > > > > > drivers/bus/mhi/core/debugfs.c:123:7:
> > > > > >         mhi_chan->db_cfg.db_val);
> > > > > > 
> > > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > > > ---
> > > > > > 
> > > > > > Greg: This fixes the issue seen while testing the char-misc/char-misc-testing
> > > > > > branch.
> > > > > > 
> > > > > >   drivers/bus/mhi/core/debugfs.c | 10 +++++-----
> > > > > >   1 file changed, 5 insertions(+), 5 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/bus/mhi/core/debugfs.c b/drivers/bus/mhi/core/debugfs.c
> > > > > > index 53d05a8e168d..2536ff92b76f 100644
> > > > > > --- a/drivers/bus/mhi/core/debugfs.c
> > > > > > +++ b/drivers/bus/mhi/core/debugfs.c
> > > > > > @@ -71,8 +71,8 @@ static int mhi_debugfs_events_show(struct seq_file *m, void *d)
> > > > > >   		seq_printf(m, " rp: 0x%llx wp: 0x%llx", er_ctxt->rp,
> > > > > >   			   er_ctxt->wp);
> > > > > > -		seq_printf(m, " local rp: 0x%llx db: 0x%llx\n", (u64)ring->rp,
> > > > > > -			   mhi_event->db_cfg.db_val);
> > > > > > +		seq_printf(m, " local rp: 0x%px db: 0x%pad\n", ring->rp,
> > > > > > +			   &mhi_event->db_cfg.db_val);
> > > > > >   	}
> > > > > >   	return 0;
> > > > > > @@ -118,9 +118,9 @@ static int mhi_debugfs_channels_show(struct seq_file *m, void *d)
> > > > > >   		seq_printf(m, " base: 0x%llx len: 0x%llx wp: 0x%llx",
> > > > > >   			   chan_ctxt->rbase, chan_ctxt->rlen, chan_ctxt->wp);
> > > > > > -		seq_printf(m, " local rp: 0x%llx local wp: 0x%llx db: 0x%llx\n",
> > > > > > -			   (u64)ring->rp, (u64)ring->wp,
> > > > > > -			   mhi_chan->db_cfg.db_val);
> > > > > > +		seq_printf(m, " local rp: 0x%px local wp: 0x%px db: 0x%pad\n",
> > > > > > +			   ring->rp, ring->wp,
> > > > > > +			   &mhi_chan->db_cfg.db_val);
> > > > > >   	}
> > > > > >   	return 0;
> > > > > > 
> > > > > 
> > > > > Documentation/printk-formats.txt seems to point out that %px is "insecure"
> > > > > and thus perhaps not preferred.  Are we assuming that debugfs is only
> > > > > accessible by root, and thus the %px usage here is effectively the same as
> > > > > %pK?
> > > > > 
> > > > 
> > > > No, this debugfs entry can be read by non-root users also.
> > > 
> > > How, the mount point of debugfs is restricted to root only :)
> > > 
> > 
> > Sigh... I just went with the file permission of 444 :/
> > 
> > > > But the idea here
> > > > is to effectively show the addresses to everyone so I don't think we need to
> > > > hide it. The term "insecure" applies to kernel log where exposing the address
> > > > doesn't make much sense (except for few obvious reasons).
> > > 
> > > Why does normal users need to see a kernel address?  What can they do
> > > with this?  Why can't we use the "normal" hashed way of showing a kernel
> > > address instead?
> > > 
> > 
> > It was the original implementation and as you brushed my memory, only root can
> > mount and read the content, so why we should hide?
> 
> Why shouldn't you?  It's good to have defense in depth, userspace should
> not care about a real kernel pointer value, right?  THat's why we have
> the hashed number instead, please use that.
> 

Okay. Will do it in next revision.

Thanks,
Mani

> thanks,
> 
> greg k-h
