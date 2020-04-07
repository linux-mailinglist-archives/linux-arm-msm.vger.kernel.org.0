Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 174581A1003
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2020 17:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728994AbgDGPRp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 11:17:45 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37214 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729103AbgDGPRp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 11:17:45 -0400
Received: by mail-pl1-f193.google.com with SMTP id x1so1368609plm.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2020 08:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CpJ1T/6PM5jGUGyvWbbqnbr6LLmGmBCE77aleYwC6+4=;
        b=DA923uRIVsPDPdoHY3hLXnZMfkeLCGcQ7QtTXLzc13IIbq57iQCj2zozaJG6MnDYvs
         ykAHGjTwGfm0S0qTVQQylHL1La+FIsWacAMiLksGci0wanynu1WEo6+wbsidp5q7rSyO
         Y5cc4HEVUwpFJXSUBLPO3UFPduxnDcfpr88DvMXPAyzTQnYbY/9NM5jFlsQNKnKSmBjS
         b7gNnHUkgTxNPPm2FXBpfEsFxgx4fWwJ6e4MTIWQEewhlI8mJHqQcOxeNTbI0gxnb6cK
         3OIbhpQ5/79wWr/XwMc6JgEffyN0DAxH3vno1pRH6TolTWw+niQc2WAkQhRZxITNv3MX
         M8sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CpJ1T/6PM5jGUGyvWbbqnbr6LLmGmBCE77aleYwC6+4=;
        b=FSX+fnKq89PEAkx34QYDUo+1KgFIjOVHOd1hXa/RyjGufK37RiPjg1Dux9oaZcq4GN
         ++OUqFqTkoLJJsR2CR6hfUD/M+DM/rFvAR4RFaBsO6bBlPSp7KzdXNzLBSkkew5gYsAe
         kPi18O6zYYtgvkzrbXWe6l8Qig9d2ybPwFgfMDKUQlXAHoVxP9XSziGmlhfwFDqbkIBw
         ZptkcLMBqz++fOSqPth3XE33KmMWxlyrueXWx4vj1Tp0W/u3IXJVWn0SoA+y4NkARBTE
         hOXN73IwvuIPGVJDH5YQAT1zeaOoojiQUx73sPxPsQk/1PR89YOwrWizbW5m4fnA4bQF
         Q2Hw==
X-Gm-Message-State: AGi0PuYl9OY3UNC9Hcf/HJEciA52wSe+0emy1HY6OYiqhWhCIx3Fj1Lg
        OCNhMJ3HDdOYFF3l3cJFLSrk
X-Google-Smtp-Source: APiQypIQ8T+h8WWp2+J46fA+QsEsxPR5GHxN19/dUb3NMEgMEAb6YtYmrhb/QwCY1tpIZyinXPI+aQ==
X-Received: by 2002:a17:90a:1946:: with SMTP id 6mr3507089pjh.42.1586272661943;
        Tue, 07 Apr 2020 08:17:41 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e86:d03b:65ee:cb40:6d79:8376])
        by smtp.gmail.com with ESMTPSA id c1sm1871243pje.24.2020.04.07.08.17.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 08:17:41 -0700 (PDT)
Date:   Tue, 7 Apr 2020 20:47:36 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] bus: mhi: core: Remove link_status() callback
Message-ID: <20200407151736.GI2442@Mani-XPS-13-9360>
References: <1586207077-22361-1-git-send-email-jhugo@codeaurora.org>
 <1586207077-22361-4-git-send-email-jhugo@codeaurora.org>
 <20200407055809.GA2442@Mani-XPS-13-9360>
 <c28124c2-4bd1-c5e1-5ecd-e8dd6042f818@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c28124c2-4bd1-c5e1-5ecd-e8dd6042f818@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 07, 2020 at 09:03:28AM -0600, Jeffrey Hugo wrote:
> On 4/6/2020 11:58 PM, Manivannan Sadhasivam wrote:
> > Hi Jeff,
> > 
> > On Mon, Apr 06, 2020 at 03:04:37PM -0600, Jeffrey Hugo wrote:
> > > If the MHI core detects invalid data due to a PCI read, it calls into
> > > the controller via link_status() to double check that the link is infact
> > > down.  All in all, this is pretty pointless, and racy.  There are no good
> > > reasons for this, and only drawbacks.
> > > 
> > > Its pointless because chances are, the controller is going to do the same
> > > thing to determine if the link is down - attempt a PCI access and compare
> > > the result.  This does not make the link status decision any smarter.
> > > 
> > > Its racy because its possible that the link was down at the time of the
> > > MHI core access, but then recovered before the controller access.  In this
> > > case, the controller will indicate the link is not down, and the MHI core
> > > will precede to use a bad value as the MHI core does not attempt to retry
> > > the access.
> > > 
> > > Retrying the access in the MHI core is a bad idea because again, it is
> > > racy - what if the link is down again?  Furthermore, there may be some
> > > higher level state associated with the link status, that is now invalid
> > > because the link went down.
> > > 
> > > The only reason why the MHI core could see "invalid" data when doing a PCI
> > > access, that is actually valid, is if the register actually contained the
> > > PCI spec defined sentinel for an invalid access.  In this case, it is
> > > arguable that the MHI implementation broken, and should be fixed, not
> > > worked around.
> > > 
> > > Therefore, remove the link_status() callback before anyone attempts to
> > > implement it.
> > > 
> > > Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> > 
> > LGTM. But as per the IRC discussion I'd like the mhi_reg_read() to be
> > implemented as a callback in mhi_controller struct inorder to truly make MHI
> > a PCI agnostic bus.
> > 
> > Since we don't have any controller driver in mainline, I think it is the
> > good time to do this change.
> 
> No problem.  I thought you might prefer that approach, hence the discussion.
> :)
> 
> Do you want that included in this change, or as a follow up?
> 

You can add a patch in this series itself.

Thanks,
Mani

> > 
> > For this,
> > 
> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > Thanks,
> > Mani
> > 
> > > ---
> > >   drivers/bus/mhi/core/init.c | 6 ++----
> > >   drivers/bus/mhi/core/main.c | 5 ++---
> > >   include/linux/mhi.h         | 2 --
> > >   3 files changed, 4 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> > > index b38359c..2af08d57 100644
> > > --- a/drivers/bus/mhi/core/init.c
> > > +++ b/drivers/bus/mhi/core/init.c
> > > @@ -812,10 +812,8 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
> > >   	if (!mhi_cntrl)
> > >   		return -EINVAL;
> > > -	if (!mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put)
> > > -		return -EINVAL;
> > > -
> > > -	if (!mhi_cntrl->status_cb || !mhi_cntrl->link_status)
> > > +	if (!mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put ||
> > > +	    !mhi_cntrl->status_cb)
> > >   		return -EINVAL;
> > >   	ret = parse_config(mhi_cntrl, config);
> > > diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> > > index eb4256b..473278b8 100644
> > > --- a/drivers/bus/mhi/core/main.c
> > > +++ b/drivers/bus/mhi/core/main.c
> > > @@ -20,9 +20,8 @@ int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
> > >   {
> > >   	u32 tmp = readl(base + offset);
> > > -	/* If there is any unexpected value, query the link status */
> > > -	if (PCI_INVALID_READ(tmp) &&
> > > -	    mhi_cntrl->link_status(mhi_cntrl))
> > > +	/* If the value is invalid, the link is down */
> > > +	if (PCI_INVALID_READ(tmp))
> > >   		return -EIO;
> > >   	*out = tmp;
> > > diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> > > index ad19960..be704a4 100644
> > > --- a/include/linux/mhi.h
> > > +++ b/include/linux/mhi.h
> > > @@ -335,7 +335,6 @@ struct mhi_controller_config {
> > >    * @syserr_worker: System error worker
> > >    * @state_event: State change event
> > >    * @status_cb: CB function to notify power states of the device (required)
> > > - * @link_status: CB function to query link status of the device (required)
> > >    * @wake_get: CB function to assert device wake (optional)
> > >    * @wake_put: CB function to de-assert device wake (optional)
> > >    * @wake_toggle: CB function to assert and de-assert device wake (optional)
> > > @@ -417,7 +416,6 @@ struct mhi_controller {
> > >   	void (*status_cb)(struct mhi_controller *mhi_cntrl,
> > >   			  enum mhi_callback cb);
> > > -	int (*link_status)(struct mhi_controller *mhi_cntrl);
> > >   	void (*wake_get)(struct mhi_controller *mhi_cntrl, bool override);
> > >   	void (*wake_put)(struct mhi_controller *mhi_cntrl, bool override);
> > >   	void (*wake_toggle)(struct mhi_controller *mhi_cntrl);
> > > -- 
> > > Qualcomm Technologies, Inc. is a member of the
> > > Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
> 
> -- 
> Jeffrey Hugo
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
