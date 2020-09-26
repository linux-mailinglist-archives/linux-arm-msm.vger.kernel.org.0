Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53DF1279717
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 07:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgIZF1t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 01:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726311AbgIZF1t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 01:27:49 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9847EC0613CE
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2020 22:27:49 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id z19so5099225pfn.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2020 22:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=DgyKo4yPQlWSfaDr10s+mIKwiaixI2RXOvdqoRS7KcE=;
        b=v1VZx1RTWD1ceLz26DTlseeQ2fFLEN2cGsQ9gr3453WUKXYioMi/Or82g7o2+50cRs
         XW5vJm9oasz+g2bBOFyI/4IFC+J95JPqO1LRYvIKeRMZXsbkr7FEpLdpTCm/UPTopO16
         jf3krXqhFiGXeobd6mhs8UfJ8vPgWCbrxF0cmAG2CqRPwGfVbcAHQ7jRZdwRQZ9UhExr
         QghhCMBia537n0FH3d4kPUcFzfhh+fMHZlJfVqw8p2hr4FqNx7YDCDKgW03eJiQ2HwNa
         jGq6TMOApLz1QynO5FbtymHR0wBtBXM88o7Z4umJPavOONxZ/zA1SkmS5Z2X2O0NJZUI
         a0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=DgyKo4yPQlWSfaDr10s+mIKwiaixI2RXOvdqoRS7KcE=;
        b=aicTkP+TqEcPm+4iU7fP39XZegmiaxSFIBRQhG1D6w0gj9AxdFkwnbyU22ifsuzrMS
         SjPGm9p+RHbWF+pDYBokGAbiceSRly/71FqaIU7KsmRWq+pg8fRKBa80UixQ9DBUiP09
         n4BF/o8hmXfpGwNE1z/Gc+sFMGw6Pk64Ic4ivLQslY01bHoecR2+kaqj/l5UqTopu+dn
         MNoRSeM9rOG9ZgOJovIDFpngHdlFCVl2DF6Id4kB1GvbhY0m2Bmf3nzYV0+mEYXmFSxZ
         Jp7z6+AXPOr0EC5OVR2f+ThTsgSjJNhXw9KTw5Uqr7Yy753hzc8IBmtwcESnaYhlDHEn
         jHVg==
X-Gm-Message-State: AOAM532jgQUkgwM4iy/upsQlHNulRKg6qJ72uugK804LV6o1d66E6VXb
        i4Tpole8oud/XWt0z9empaBMqdWj730K5pM=
X-Google-Smtp-Source: ABdhPJxoYTMgchN5ATJKW6BAiFKThcR59agky5RZ5Nxk8Bd9kJxCRQxxwGK7wtxeeKBFMYunDmFtYw==
X-Received: by 2002:a05:6a00:8c5:b029:13e:ce2c:88bd with SMTP id s5-20020a056a0008c5b029013ece2c88bdmr2466698pfu.0.1601098068282;
        Fri, 25 Sep 2020 22:27:48 -0700 (PDT)
Received: from linux ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id r3sm4155999pfh.88.2020.09.25.22.27.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Sep 2020 22:27:47 -0700 (PDT)
Date:   Sat, 26 Sep 2020 10:57:42 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, hemantk@codeaurora.org,
        bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: core: debugfs: Use correct format specifiers
 for addresses
Message-ID: <20200926052742.GB9302@linux>
References: <20200925171608.30881-1-manivannan.sadhasivam@linaro.org>
 <c63ae2c3-43ae-6a94-cf27-efb6cc038f83@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c63ae2c3-43ae-6a94-cf27-efb6cc038f83@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 25, 2020 at 12:01:54PM -0600, Jeffrey Hugo wrote:
> On 9/25/2020 11:16 AM, Manivannan Sadhasivam wrote:
> > For exposing the addresses of read/write pointers and doorbell register,
> > let's use the correct format specifiers. This fixes the following issues
> > generated using W=1 build in ARM32 and reported by Kbuild bot:
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > > > drivers/bus/mhi/core/debugfs.c:75:7: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
> >                                mhi_event->db_cfg.db_val);
> >                                ^~~~~~~~~~~~~~~~~~~~~~~~
> >     drivers/bus/mhi/core/debugfs.c:123:7: warning: format specifies type 'unsigned long long' but the argument has type 'dma_addr_t' (aka 'unsigned int') [-Wformat]
> >                                mhi_chan->db_cfg.db_val);
> >                                ^~~~~~~~~~~~~~~~~~~~~~~
> >     2 warnings generated.
> > 
> > drivers/bus/mhi/core/debugfs.c: In function ‘mhi_debugfs_events_show’:
> > drivers/bus/mhi/core/debugfs.c:74:51: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> >     seq_printf(m, " local rp: 0x%llx db: 0x%pad\n", (u64)ring->rp,
> >                                                     ^
> > drivers/bus/mhi/core/debugfs.c: In function ‘mhi_debugfs_channels_show’:
> > drivers/bus/mhi/core/debugfs.c:122:7: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> >         (u64)ring->rp, (u64)ring->wp,
> >         ^
> > drivers/bus/mhi/core/debugfs.c:122:22: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> >         (u64)ring->rp, (u64)ring->wp,
> >                        ^
> > drivers/bus/mhi/core/debugfs.c:121:62: warning: format ‘%llx’ expects argument of type ‘long long unsigned int’, but argument 5 has type ‘dma_addr_t {aka unsigned int}’ [-Wformat=]
> >     seq_printf(m, " local rp: 0x%llx local wp: 0x%llx db: 0x%llx\n",
> >                                                             ~~~^
> >                                                             %x
> > drivers/bus/mhi/core/debugfs.c:123:7:
> >         mhi_chan->db_cfg.db_val);
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> > 
> > Greg: This fixes the issue seen while testing the char-misc/char-misc-testing
> > branch.
> > 
> >   drivers/bus/mhi/core/debugfs.c | 10 +++++-----
> >   1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/bus/mhi/core/debugfs.c b/drivers/bus/mhi/core/debugfs.c
> > index 53d05a8e168d..2536ff92b76f 100644
> > --- a/drivers/bus/mhi/core/debugfs.c
> > +++ b/drivers/bus/mhi/core/debugfs.c
> > @@ -71,8 +71,8 @@ static int mhi_debugfs_events_show(struct seq_file *m, void *d)
> >   		seq_printf(m, " rp: 0x%llx wp: 0x%llx", er_ctxt->rp,
> >   			   er_ctxt->wp);
> > -		seq_printf(m, " local rp: 0x%llx db: 0x%llx\n", (u64)ring->rp,
> > -			   mhi_event->db_cfg.db_val);
> > +		seq_printf(m, " local rp: 0x%px db: 0x%pad\n", ring->rp,
> > +			   &mhi_event->db_cfg.db_val);
> >   	}
> >   	return 0;
> > @@ -118,9 +118,9 @@ static int mhi_debugfs_channels_show(struct seq_file *m, void *d)
> >   		seq_printf(m, " base: 0x%llx len: 0x%llx wp: 0x%llx",
> >   			   chan_ctxt->rbase, chan_ctxt->rlen, chan_ctxt->wp);
> > -		seq_printf(m, " local rp: 0x%llx local wp: 0x%llx db: 0x%llx\n",
> > -			   (u64)ring->rp, (u64)ring->wp,
> > -			   mhi_chan->db_cfg.db_val);
> > +		seq_printf(m, " local rp: 0x%px local wp: 0x%px db: 0x%pad\n",
> > +			   ring->rp, ring->wp,
> > +			   &mhi_chan->db_cfg.db_val);
> >   	}
> >   	return 0;
> > 
> 
> Documentation/printk-formats.txt seems to point out that %px is "insecure"
> and thus perhaps not preferred.  Are we assuming that debugfs is only
> accessible by root, and thus the %px usage here is effectively the same as
> %pK?
> 

No, this debugfs entry can be read by non-root users also. But the idea here
is to effectively show the addresses to everyone so I don't think we need to
hide it. The term "insecure" applies to kernel log where exposing the address
doesn't make much sense (except for few obvious reasons).

Thanks,
Mani

> -- 
> Jeffrey Hugo
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
