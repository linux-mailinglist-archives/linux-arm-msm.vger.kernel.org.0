Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA0DE279778
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 09:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbgIZHQM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 03:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgIZHQL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 03:16:11 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE8FBC0613CE
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2020 00:16:11 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id l126so5217631pfd.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2020 00:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=weak8dM0R5pKV3SDFvWdkknohBwvGyV0fCb3T4dKQi0=;
        b=kOXkd8iQRuYj4j1tGMK1mcdzOh+hgWyfv8vxRmTy6mPWOUiPxzvy0OWFnsoXI4k+ya
         ptobp8M8P+kyQysda/ouuBXOHJ1aXnnmpfzibI4afRfbQEaBgTC8RurVdC/46YmNRpfV
         ntcIFMPiiIdYPkXIRPAocbPhxdQTjIIsUa16eQUjZit7u5h9KSjS/spVo2rsyLsDPnyj
         rrPcrE6B01konwGmzZo0DWxNgDlAbCqY5gGU6SDTGb947VfOmN7PpE4jYkjY9lNKj3Q/
         aY4yd3Ig26B9vX1CNWggIx8g6Ud4QVCxOuJajpiAW2jB2GTMN0us/d8Tkm/trNoP1act
         Henw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=weak8dM0R5pKV3SDFvWdkknohBwvGyV0fCb3T4dKQi0=;
        b=oAx7C2exkO6w/ous1NhpjYD2IEB7YtRR+xU1A0jQYE3+mji8sv2Tb6I/zC2tJ3Gaf/
         3trX0ChvBrtqxMgCzhKUATK1cehuBfbLgUKdc9/505Ao8AO6tevGEXKq8mn7RUQDVwtO
         l89WJAL2nC1NKMtq77xZPxhKU1zEAYb0ymnM86qBQcwpesp1ndH8tQh4VeC3NJhUjiBs
         mpqcJngcsOoNGYegf8BlL5AgkafEX7jovjz+yg0sXJAKEJxH2Z6wa/T27nXx6+GfH3S2
         chaRaJ3613Wt3LVQiI5vkLoCcNdgLOCtFGVQEx1g49Ri7qixsQEmRzXwHM7FFxWYmiTQ
         CxTQ==
X-Gm-Message-State: AOAM532DBLhe8WAhOthdNCQeUkJJP0BCNkccm6HP2o9x9t6OMDKDP8Vl
        NyuRYraKas+JlKftsddNAHht
X-Google-Smtp-Source: ABdhPJyJ/P4qekNQ0ZtH1HhB3ONRmGpEwpbdqw2GUcK89yubMkc/QE3z8i0BaAvYaCgC2k4b8heFWQ==
X-Received: by 2002:a63:4f17:: with SMTP id d23mr1921682pgb.319.1601104571177;
        Sat, 26 Sep 2020 00:16:11 -0700 (PDT)
Received: from linux ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id v128sm4256926pgv.72.2020.09.26.00.16.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 26 Sep 2020 00:16:10 -0700 (PDT)
Date:   Sat, 26 Sep 2020 12:46:04 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>, hemantk@codeaurora.org,
        bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: core: debugfs: Use correct format specifiers
 for addresses
Message-ID: <20200926071604.GC9302@linux>
References: <20200925171608.30881-1-manivannan.sadhasivam@linaro.org>
 <c63ae2c3-43ae-6a94-cf27-efb6cc038f83@codeaurora.org>
 <20200926052742.GB9302@linux>
 <20200926053914.GA631346@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200926053914.GA631346@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Sep 26, 2020 at 07:39:14AM +0200, Greg KH wrote:
> On Sat, Sep 26, 2020 at 10:57:42AM +0530, Manivannan Sadhasivam wrote:
> > On Fri, Sep 25, 2020 at 12:01:54PM -0600, Jeffrey Hugo wrote:
> > > On 9/25/2020 11:16 AM, Manivannan Sadhasivam wrote:
> > > > For exposing the addresses of read/write pointers and doorbell register,
> > > > let's use the correct format specifiers. This fixes the following issues
> > > > generated using W=1 build in ARM32 and reported by Kbuild bot:
> > > > 
> > > > All warnings (new ones prefixed by >>):
> > > > 
> > > > > > drivers/bus/mhi/core/debugfs.c:75:7: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
> > > >                                mhi_event->db_cfg.db_val);
> > > >                                ^~~~~~~~~~~~~~~~~~~~~~~~
> > > >     drivers/bus/mhi/core/debugfs.c:123:7: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
> > > >                                mhi_chan->db_cfg.db_val);
> > > >                                ^~~~~~~~~~~~~~~~~~~~~~~
> > > >     2 warnings generated.
> > > > 
> > > > drivers/bus/mhi/core/debugfs.c: In function ‘mhi_debugfs_events_show’:
> > > > drivers/bus/mhi/core/debugfs.c:74:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> > > >     seq_printf(m, " local rp: 0x%llx db: 0x%pad\n", (u64)ring->rp,
> > > >                                                     ^
> > > > drivers/bus/mhi/core/debugfs.c: In function ‘mhi_debugfs_channels_show’:
> > > > drivers/bus/mhi/core/debugfs.c:122:7: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> > > >         (u64)ring->rp, (u64)ring->wp,
> > > >         ^
> > > > drivers/bus/mhi/core/debugfs.c:122:22: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> > > >         (u64)ring->rp, (u64)ring->wp,
> > > >                        ^
> > > > drivers/bus/mhi/core/debugfs.c:121:62: warning: format ‘%llx’ expects argument of type ‘long long unsigned int’, but argument 5 has type ‘dma_addr_t {aka unsigned int}’ [-Wformat=]
> > > >     seq_printf(m, " local rp: 0x%llx local wp: 0x%llx db: 0x%llx\n",
> > > >                                                             ~~~^
> > > >                                                             %x
> > > > drivers/bus/mhi/core/debugfs.c:123:7:
> > > >         mhi_chan->db_cfg.db_val);
> > > > 
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > ---
> > > > 
> > > > Greg: This fixes the issue seen while testing the char-misc/char-misc-testing
> > > > branch.
> > > > 
> > > >   drivers/bus/mhi/core/debugfs.c | 10 +++++-----
> > > >   1 file changed, 5 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/drivers/bus/mhi/core/debugfs.c b/drivers/bus/mhi/core/debugfs.c
> > > > index 53d05a8e168d..2536ff92b76f 100644
> > > > --- a/drivers/bus/mhi/core/debugfs.c
> > > > +++ b/drivers/bus/mhi/core/debugfs.c
> > > > @@ -71,8 +71,8 @@ static int mhi_debugfs_events_show(struct seq_file *m, void *d)
> > > >   		seq_printf(m, " rp: 0x%llx wp: 0x%llx", er_ctxt->rp,
> > > >   			   er_ctxt->wp);
> > > > -		seq_printf(m, " local rp: 0x%llx db: 0x%llx\n", (u64)ring->rp,
> > > > -			   mhi_event->db_cfg.db_val);
> > > > +		seq_printf(m, " local rp: 0x%px db: 0x%pad\n", ring->rp,
> > > > +			   &mhi_event->db_cfg.db_val);
> > > >   	}
> > > >   	return 0;
> > > > @@ -118,9 +118,9 @@ static int mhi_debugfs_channels_show(struct seq_file *m, void *d)
> > > >   		seq_printf(m, " base: 0x%llx len: 0x%llx wp: 0x%llx",
> > > >   			   chan_ctxt->rbase, chan_ctxt->rlen, chan_ctxt->wp);
> > > > -		seq_printf(m, " local rp: 0x%llx local wp: 0x%llx db: 0x%llx\n",
> > > > -			   (u64)ring->rp, (u64)ring->wp,
> > > > -			   mhi_chan->db_cfg.db_val);
> > > > +		seq_printf(m, " local rp: 0x%px local wp: 0x%px db: 0x%pad\n",
> > > > +			   ring->rp, ring->wp,
> > > > +			   &mhi_chan->db_cfg.db_val);
> > > >   	}
> > > >   	return 0;
> > > > 
> > > 
> > > Documentation/printk-formats.txt seems to point out that %px is "insecure"
> > > and thus perhaps not preferred.  Are we assuming that debugfs is only
> > > accessible by root, and thus the %px usage here is effectively the same as
> > > %pK?
> > > 
> > 
> > No, this debugfs entry can be read by non-root users also.
> 
> How, the mount point of debugfs is restricted to root only :)
> 

Sigh... I just went with the file permission of 444 :/

> > But the idea here
> > is to effectively show the addresses to everyone so I don't think we need to
> > hide it. The term "insecure" applies to kernel log where exposing the address
> > doesn't make much sense (except for few obvious reasons).
> 
> Why does normal users need to see a kernel address?  What can they do
> with this?  Why can't we use the "normal" hashed way of showing a kernel
> address instead?
> 

It was the original implementation and as you brushed my memory, only root can
mount and read the content, so why we should hide?

Thanks,
Mani

> thanks,
> 
> greg k-h
