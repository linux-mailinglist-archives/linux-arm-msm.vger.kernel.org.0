Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A4CD27269C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 16:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgIUOHT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 10:07:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbgIUOHT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 10:07:19 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D8A6C061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 07:07:19 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id k14so9127330pgi.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 07:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KG0Wug7W8VnBXyhL64NP/YPzyqdGwCSVxq+fJyR9sHs=;
        b=y33E1MBopdSaJPSwM2GmSmxeKucim8p2riwdrHETCYrrcCF8Q3LACd8YWaD/Efr4nh
         1vCP+NGq3hQ0wdd7Wa5gRyRZLeD6gQ7Efhk8CjDYncf3ZCvftIXTey7A6qrSnTTTeRdF
         gGZ/N8kwWAWpj+RlMfSPj+Kck7sHP0W0G89mFtYVAN+tXMWa3Lr8cBrJv8zfct/e2Oey
         5etCDvfbG3CmJuKYgyXxuazbNvh/7n5q4QZxK9sHS3eOPFup6zQkmp0i78TeE2i37AHu
         DnrVX7GzvxBUzaJrHDwmcPWPfMcTF9ueatP3uV21tx11eqLJFIflKLylefQGymrvU1wn
         Tnyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KG0Wug7W8VnBXyhL64NP/YPzyqdGwCSVxq+fJyR9sHs=;
        b=d3TJLWNAo7g4Z6pKZzitY5VnMyKAO369i5ioWjqwyIONJObjfA5VFpL8v588dQ13WV
         O3Kt7xbytoxhAGKpV0wQc782+kbZ4HdEgnKkOAFY/VyuE+mj9N1lcQY25wylNwGtHcsb
         ZKR8LdX+hDPW+DIenNVSr9tTJ7qGb8h+fajRIj0eQoy+01005YW4v1HmkMErI54aN0rx
         ikXCdYv3yHh14DY6A9rHf4tqe34zDurqzXQKytvP8PayWGfxJZEc+rVXzJJMlkgPzpwe
         cW/hAySkB446M768SlIeVO1UgPVbXSNA/gcLQrWPFft4K+VJtc/gowLmmureCPVUYM6O
         jAnQ==
X-Gm-Message-State: AOAM532sL27bmrIujTcuJkoY6VBstqlfGvWyF62ITgoaC2tBiOfRAtPr
        RIU+RZuopGQFDpEAW7Z2zUiy
X-Google-Smtp-Source: ABdhPJwwp+iiq2mUpwHisXRydKHSLtiV4qs04Bi+TawfPcFVxHctkRk7CGKPcnVbUrf0AevaBivuiQ==
X-Received: by 2002:a63:ec4c:: with SMTP id r12mr36284072pgj.74.1600697238644;
        Mon, 21 Sep 2020 07:07:18 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6d03:bd12:1004:2ccf:6900:b97])
        by smtp.gmail.com with ESMTPSA id i9sm12101743pfq.53.2020.09.21.07.07.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Sep 2020 07:07:17 -0700 (PDT)
Date:   Mon, 21 Sep 2020 19:37:13 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bbhatt@codeaurora.org
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        hemantk@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] bus: mhi: core: Remove warnings for missing
 MODULE_LICENSE()
Message-ID: <20200921140713.GE3262@Mani-XPS-13-9360>
References: <1600381176-37604-1-git-send-email-bbhatt@codeaurora.org>
 <1600381176-37604-2-git-send-email-bbhatt@codeaurora.org>
 <6f7b6be3-f52d-b082-6065-c75e3d89d252@codeaurora.org>
 <0e34b5a2562b776ea410c80479107581@codeaurora.org>
 <20200918171809.GA3410@Mani-XPS-13-9360>
 <4506782e8bb9a50d80b4a40575ae532e@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4506782e8bb9a50d80b4a40575ae532e@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 18, 2020 at 11:48:21AM -0700, bbhatt@codeaurora.org wrote:
> On 2020-09-18 10:18, Manivannan Sadhasivam wrote:
> > On Fri, Sep 18, 2020 at 09:49:05AM -0700, bbhatt@codeaurora.org wrote:
> > > On 2020-09-18 07:27, Jeffrey Hugo wrote:
> > > > On 9/17/2020 4:19 PM, Bhaumik Bhatt wrote:
> > > > > When building MHI as a module, missing MODULE_LICENSE() warnings
> > > > > are seen. Avoid them by adding the license and description
> > > > > information for the files where the warnings are seen.
> > > > >
> > > > > Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > > > > ---
> > > > >   drivers/bus/mhi/core/boot.c | 3 +++
> > > > >   drivers/bus/mhi/core/main.c | 3 +++
> > > > >   drivers/bus/mhi/core/pm.c   | 3 +++
> > > > >   3 files changed, 9 insertions(+)
> > > > >
> > > > > diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
> > > > > index 24422f5..78140cc 100644
> > > > > --- a/drivers/bus/mhi/core/boot.c
> > > > > +++ b/drivers/bus/mhi/core/boot.c
> > > > > @@ -523,3 +523,6 @@ void mhi_fw_load_handler(struct mhi_controller
> > > > > *mhi_cntrl)
> > > > >   error_alloc_fw_table:
> > > > >   	release_firmware(firmware);
> > > > >   }
> > > > > +
> > > > > +MODULE_LICENSE("GPL v2");
> > > > > +MODULE_DESCRIPTION("MHI Host Interface");
> > > > > diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> > > > > index 2cff5dd..172026f 100644
> > > > > --- a/drivers/bus/mhi/core/main.c
> > > > > +++ b/drivers/bus/mhi/core/main.c
> > > > > @@ -1533,3 +1533,6 @@ int mhi_poll(struct mhi_device *mhi_dev, u32
> > > > > budget)
> > > > >   	return ret;
> > > > >   }
> > > > >   EXPORT_SYMBOL_GPL(mhi_poll);
> > > > > +
> > > > > +MODULE_LICENSE("GPL v2");
> > > > > +MODULE_DESCRIPTION("MHI Host Interface");
> > > > > diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> > > > > index ce4d969..72c3dbc 100644
> > > > > --- a/drivers/bus/mhi/core/pm.c
> > > > > +++ b/drivers/bus/mhi/core/pm.c
> > > > > @@ -1150,3 +1150,6 @@ void mhi_device_put(struct mhi_device *mhi_dev)
> > > > >   	read_unlock_bh(&mhi_cntrl->pm_lock);
> > > > >   }
> > > > >   EXPORT_SYMBOL_GPL(mhi_device_put);
> > > > > +
> > > > > +MODULE_LICENSE("GPL v2");
> > > > > +MODULE_DESCRIPTION("MHI Host Interface");
> > > > >
> > > >
> > > > I would expect you only need to add the MODULE_* once per module, in
> > > > which case main.c is probably the only place that needs it.
> > > 
> > > Hi Jeff,
> > > 
> > > I thought so too. This is to fix below warnings seen when building
> > > MHI as a
> > > MODULE:
> > > 
> > > WARNING: modpost: missing MODULE_LICENSE() in
> > > drivers/bus/mhi/core/main.o
> > > WARNING: modpost: missing MODULE_LICENSE() in
> > > drivers/bus/mhi/core/pm.o
> > > WARNING: modpost: missing MODULE_LICENSE() in
> > > drivers/bus/mhi/core/boot.o
> > > 
> > > We've only had those in init.c so far.
> > > 
> > 
> > Can you please test below diff to see if it fixes the warning?
> > 
> > diff --git a/drivers/bus/mhi/core/Makefile
> > b/drivers/bus/mhi/core/Makefile
> > index 66e2700c9032..bc1469778cf8 100644
> > --- a/drivers/bus/mhi/core/Makefile
> > +++ b/drivers/bus/mhi/core/Makefile
> > @@ -1,3 +1,3 @@
> > -obj-$(CONFIG_MHI_BUS) := mhi.o
> > +obj-$(CONFIG_MHI_BUS) += mhi.o
> > 
> >  mhi-y := init.o main.o pm.o boot.o
> > 
> > Thanks,
> > Mani
> > 
> > > Thanks,
> > > Bhaumik
> > > 
> > > 'The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> > > Forum,\na Linux Foundation Collaborative Project'
> Hi Mani,
> 
> Yes I was just about to reply. I realized it was due to the Makefile change.
> I have fixed and
> tested it. The warnings are gone now. I will remove the patch.
> 

Where is the patch fixing this issue? I couldn't find it in my inbox.
I'll just post one as I need to send out the PR today.

Thanks,
Mani

> Thanks,
> Bhaumik
> 
> 'The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> Forum,\na Linux Foundation Collaborative Project'
