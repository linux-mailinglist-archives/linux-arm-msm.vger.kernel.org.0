Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACF55270312
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 19:18:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgIRRSQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 13:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgIRRSQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 13:18:16 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 803D2C0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2020 10:18:16 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id bw23so678751pjb.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2020 10:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7CLUrRFKwNrwTUyxJoKuleB6MYxxEKnOKzNF221gmC0=;
        b=SCteN+WchU83TDktKoSQ3XWkRzDQcCljQpmVUWTABHX4PiW2kuTWnYt6v6ZFRQvdFW
         nRGBw/xH92RJPO7iPmXAEIK21lPxjD4hLSCT2gFK72jkUzlOwDZpb1lEzaZMCPmJogP+
         NHk6t8k94dWOzQz3eyJxo9P7moQjAWsUXZIEV93Vd53lQlkVWmr0khF3KFvOW3DfuZcq
         7MW44efOKxCIGgUAgDLxSqGFa/0/nIbi3UDVEdNcvLQeIBYEUZsytbCVdhLYrbH/sLr7
         sRIqVFzN+HQNGNLUCEiiKSY5lQ/4brngCZ3jpXZd1x966KkyajC+ezuhN2dpWqqkXBg3
         KVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7CLUrRFKwNrwTUyxJoKuleB6MYxxEKnOKzNF221gmC0=;
        b=ulMELkyQT+5iBZnpGWs2Lo9ULoSWAZ10u+J2+PQDAG4qr2kjKoElzc+pW0fOY1ozeq
         /JcwrykZux8yTprBy2SyDGGt8sYRprBPjGKgD4RCCTpG9cWTF7c808saMgM3mT7Ays5J
         Gc4rCTzWMLFEzjle9tO+tjXhtOq5+hgpyz91hK5FfBYOWGBHl/ozqo0Pzuh0q6Wjd/so
         ZleA7UShcx0q1/6REU5NIlC5H+yHHh1NbfnKoD+Q0CLCN48oDVQ4gOE3sZI9AMq2WRE6
         d0/DBD8htrs0bmECAZGYFY+NaDxkgBAz0iMFbCxkNcFqRXhY/3avO9a+HxcoC9hUGI6p
         5tdA==
X-Gm-Message-State: AOAM533zQmUwzew4PLHs62CXTIrdSLFPr0/11YxmSZYkDtoeRI9vpUPN
        iNQw13AxeiUIGhHBkv3gXrsG
X-Google-Smtp-Source: ABdhPJzk9kdvRZxiiMzV1zqsWZeRBM7A2B/AF2DI/wS8ijsthwkryajYpn8Unuqb6jaaVi9yX4Y7/Q==
X-Received: by 2002:a17:902:8e8c:b029:d1:e5f9:9f7 with SMTP id bg12-20020a1709028e8cb02900d1e5f909f7mr16243903plb.72.1600449495685;
        Fri, 18 Sep 2020 10:18:15 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6291:66eb:7496:aa7a:b42d:458c])
        by smtp.gmail.com with ESMTPSA id q11sm3656897pgj.92.2020.09.18.10.18.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Sep 2020 10:18:14 -0700 (PDT)
Date:   Fri, 18 Sep 2020 22:48:09 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bbhatt@codeaurora.org
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        hemantk@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] bus: mhi: core: Remove warnings for missing
 MODULE_LICENSE()
Message-ID: <20200918171809.GA3410@Mani-XPS-13-9360>
References: <1600381176-37604-1-git-send-email-bbhatt@codeaurora.org>
 <1600381176-37604-2-git-send-email-bbhatt@codeaurora.org>
 <6f7b6be3-f52d-b082-6065-c75e3d89d252@codeaurora.org>
 <0e34b5a2562b776ea410c80479107581@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e34b5a2562b776ea410c80479107581@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 18, 2020 at 09:49:05AM -0700, bbhatt@codeaurora.org wrote:
> On 2020-09-18 07:27, Jeffrey Hugo wrote:
> > On 9/17/2020 4:19 PM, Bhaumik Bhatt wrote:
> > > When building MHI as a module, missing MODULE_LICENSE() warnings
> > > are seen. Avoid them by adding the license and description
> > > information for the files where the warnings are seen.
> > > 
> > > Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > > ---
> > >   drivers/bus/mhi/core/boot.c | 3 +++
> > >   drivers/bus/mhi/core/main.c | 3 +++
> > >   drivers/bus/mhi/core/pm.c   | 3 +++
> > >   3 files changed, 9 insertions(+)
> > > 
> > > diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
> > > index 24422f5..78140cc 100644
> > > --- a/drivers/bus/mhi/core/boot.c
> > > +++ b/drivers/bus/mhi/core/boot.c
> > > @@ -523,3 +523,6 @@ void mhi_fw_load_handler(struct mhi_controller
> > > *mhi_cntrl)
> > >   error_alloc_fw_table:
> > >   	release_firmware(firmware);
> > >   }
> > > +
> > > +MODULE_LICENSE("GPL v2");
> > > +MODULE_DESCRIPTION("MHI Host Interface");
> > > diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> > > index 2cff5dd..172026f 100644
> > > --- a/drivers/bus/mhi/core/main.c
> > > +++ b/drivers/bus/mhi/core/main.c
> > > @@ -1533,3 +1533,6 @@ int mhi_poll(struct mhi_device *mhi_dev, u32
> > > budget)
> > >   	return ret;
> > >   }
> > >   EXPORT_SYMBOL_GPL(mhi_poll);
> > > +
> > > +MODULE_LICENSE("GPL v2");
> > > +MODULE_DESCRIPTION("MHI Host Interface");
> > > diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> > > index ce4d969..72c3dbc 100644
> > > --- a/drivers/bus/mhi/core/pm.c
> > > +++ b/drivers/bus/mhi/core/pm.c
> > > @@ -1150,3 +1150,6 @@ void mhi_device_put(struct mhi_device *mhi_dev)
> > >   	read_unlock_bh(&mhi_cntrl->pm_lock);
> > >   }
> > >   EXPORT_SYMBOL_GPL(mhi_device_put);
> > > +
> > > +MODULE_LICENSE("GPL v2");
> > > +MODULE_DESCRIPTION("MHI Host Interface");
> > > 
> > 
> > I would expect you only need to add the MODULE_* once per module, in
> > which case main.c is probably the only place that needs it.
> 
> Hi Jeff,
> 
> I thought so too. This is to fix below warnings seen when building MHI as a
> MODULE:
> 
> WARNING: modpost: missing MODULE_LICENSE() in drivers/bus/mhi/core/main.o
> WARNING: modpost: missing MODULE_LICENSE() in drivers/bus/mhi/core/pm.o
> WARNING: modpost: missing MODULE_LICENSE() in drivers/bus/mhi/core/boot.o
> 
> We've only had those in init.c so far.
> 

Can you please test below diff to see if it fixes the warning?

diff --git a/drivers/bus/mhi/core/Makefile b/drivers/bus/mhi/core/Makefile
index 66e2700c9032..bc1469778cf8 100644
--- a/drivers/bus/mhi/core/Makefile
+++ b/drivers/bus/mhi/core/Makefile
@@ -1,3 +1,3 @@
-obj-$(CONFIG_MHI_BUS) := mhi.o
+obj-$(CONFIG_MHI_BUS) += mhi.o
 
 mhi-y := init.o main.o pm.o boot.o

Thanks,
Mani

> Thanks,
> Bhaumik
> 
> 'The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> Forum,\na Linux Foundation Collaborative Project'
