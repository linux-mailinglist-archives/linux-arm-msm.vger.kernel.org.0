Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9138A27A5FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 05:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbgI1Dsc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Sep 2020 23:48:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726469AbgI1Dsc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Sep 2020 23:48:32 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24FCAC0613CF
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 20:48:32 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id 7so7093212pgm.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2020 20:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=n3PKvxcf0xOpv07h99HZS3W0ZPOaLh7oGZA//wHBTpo=;
        b=jkiXQdAPSWlMQN7x82Ln4w2+w8fj5JK9yjI6mfDgzgg4JDHsEBKZ8k+glqfzU9CFik
         N1I83B/SWvp7qhT58SX+zmi+UofAxWkyCw8rLk0lG0HUfOWySltXT2EJuDEYBwoxqBir
         KcfenZMwOPxKKCEUssRdWNg4oeJUQxl7Rxm8hRdA5gjN+ang6yVBIT2X/a3pgGeo0eGy
         ElXeaD5g3TE8dok0zfTfeAfDOC7SSy7QbkPFxnid8xmNSM9mEyTruk/CAkd0IYpAnQfa
         AOfs5BKmh4ITZI+pvY40f3O4Q/ER7X0uH9Fp+DSjlygDIAMGvkzqSYbv3kT/9HN+N8aT
         DkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=n3PKvxcf0xOpv07h99HZS3W0ZPOaLh7oGZA//wHBTpo=;
        b=cJx0OK1i6hjEZle1Pigaa6Ooj1WYFYmtb8+tUArB505j7e7/nZb6+iPODmlSV5++PY
         VvUbSZlgSjiI+YNXZYet4gH/2Dd7/+L0MS9NxocYQ/nh1tyjJ3ItG17FCEIuPqlW6dx7
         ZIFCLW2wtmPpnnFPW7yzG2FRNTI6oOhgmVHHE7IUcCHuW8ABYpC7LVDPdcLqPrQ/ixWK
         BcMr+YcvBhHqA9MTY9L0RREQRTVmplY2eEej3oQYFZDfiW3x+Zck1kd5IvxJ3LZJF1He
         PWFGmYpSJ80tySW/npKKBJDKQ8g/2Px9AU28UGLTH4l4hdlsRaiKRKPMcXTKhkk+KAHC
         G5eg==
X-Gm-Message-State: AOAM530mtqvoWUodhpALfzQ9uwuNEEHa/wKuhwI2TuTpKeaGTtFQUAsZ
        JT5JUOh+OB73kkM4KgrJ1xL0
X-Google-Smtp-Source: ABdhPJwtYMtZcDzo0Umz8HpkvvM57d2uAZCqTmuOGuYXJz9lhTrbMCkM1gclUZSGURCbcLyXK0eX5w==
X-Received: by 2002:a63:c1e:: with SMTP id b30mr7533227pgl.345.1601264911480;
        Sun, 27 Sep 2020 20:48:31 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6003:40df:7c40:5a87:eb86:87b0])
        by smtp.gmail.com with ESMTPSA id w14sm9097268pfu.87.2020.09.27.20.48.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 27 Sep 2020 20:48:30 -0700 (PDT)
Date:   Mon, 28 Sep 2020 09:18:25 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] bus: mhi: core: debugfs: Use correct format
 specifiers for addresses
Message-ID: <20200928034825.GC3605@Mani-XPS-13-9360>
References: <20200927033652.11789-1-manivannan.sadhasivam@linaro.org>
 <20200927033652.11789-2-manivannan.sadhasivam@linaro.org>
 <20200927102310.GB87283@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200927102310.GB87283@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Sep 27, 2020 at 12:23:10PM +0200, Greg KH wrote:
> On Sun, Sep 27, 2020 at 09:06:48AM +0530, Manivannan Sadhasivam wrote:
> > For exposing the addresses of read/write pointers and doorbell register,
> > let's use the correct format specifiers. This fixes the following issues
> > generated using W=1 build in ARM32 and reported by Kbuild bot:
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> drivers/bus/mhi/core/debugfs.c:75:7: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
> >                               mhi_event->db_cfg.db_val);
> >                               ^~~~~~~~~~~~~~~~~~~~~~~~
> >    drivers/bus/mhi/core/debugfs.c:123:7: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
> >                               mhi_chan->db_cfg.db_val);
> >                               ^~~~~~~~~~~~~~~~~~~~~~~
> >    2 warnings generated.
> > 
> > drivers/bus/mhi/core/debugfs.c: In function ‘mhi_debugfs_events_show’:
> > drivers/bus/mhi/core/debugfs.c:74:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> >    seq_printf(m, " local rp: 0x%llx db: 0x%pad\n", (u64)ring->rp,
> >                                                    ^
> > drivers/bus/mhi/core/debugfs.c: In function ‘mhi_debugfs_channels_show’:
> > drivers/bus/mhi/core/debugfs.c:122:7: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> >        (u64)ring->rp, (u64)ring->wp,
> >        ^
> > drivers/bus/mhi/core/debugfs.c:122:22: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> >        (u64)ring->rp, (u64)ring->wp,
> >                       ^
> > drivers/bus/mhi/core/debugfs.c:121:62: warning: format ‘%llx’ expects argument of type ‘long long unsigned int’, but argument 5 has type ‘dma_addr_t {aka unsigned int}’ [-Wformat=]
> >    seq_printf(m, " local rp: 0x%llx local wp: 0x%llx db: 0x%llx\n",
> >                                                            ~~~^
> >                                                            %x
> > drivers/bus/mhi/core/debugfs.c:123:7:
> >        mhi_chan->db_cfg.db_val);
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/bus/mhi/core/debugfs.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> Ah, this is against your first set of patches, that's the confusion on
> my part.
> 
> Please just fix them all up and resend 1 series of patches, that isn't
> broken, and I will be glad to review and take that.
> 

Sure, will merge this patch with debugfs one. I submitted this patch as I got
error report from Kbuild bot and I thought you applied the series to
char-misc-testing branch.

Thanks,
Mani

> thanks,
> 
> greg k-h
