Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20D3B1825FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 00:44:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731417AbgCKXoP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 19:44:15 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43472 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731412AbgCKXoP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 19:44:15 -0400
Received: by mail-pl1-f193.google.com with SMTP id f8so1844719plt.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 16:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZEyMFnwakXjowg52voyfC4K3NxCZ17Ctu1QUhRXYRT8=;
        b=W8NOfb6IhTJDTK4NvVVTnkeUUX2ZTACR57qIAAHhHfGsO3drKSin6f6/Eok7XkrVlw
         IpO9S1AFMRPavhBJ3WAjnWiuNfpqSNzNqrvYwAiaIzvId7JI1ML0iN1C7ZmUKdJWvbBe
         fBqCRf8EZXV1zJFJGestM93RMkTsIBi/TdKxa9aAqx0jQOCS7T8arUXRKV4XOgrAR8yn
         QGccrmcsZakfUaSPqTi7uWuuCm0SNGECwnn2JRRkm6rmblfPxZnxprZuawaZeq7R1Gzk
         ELb52TpQbdcpXTbqqggA1AoKCUSj+ZlNy7003gdOEprd+7OUgKiF6dmnEdVdtB+kw3Q5
         FsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZEyMFnwakXjowg52voyfC4K3NxCZ17Ctu1QUhRXYRT8=;
        b=KIok6smzkzL66EHnrz2P25HrgX5y8O1qzbQyjolsU+TGbVxzaxOw1D80m0vbFCkgMO
         GN8zAWU+SgaZGo8fobSYr1jpHKIYTnOaYesRSgHB3Ni/pRuBqHwcQbx7QeEQylev0g2n
         IVeFPY/pdYpfkmefpm78FixjCPUHAc7x5n2g/OIcvbHiRUoq8wMF0CMWPx5rgodmqpgc
         mrPn4iZy0keRfsumI0vFWT+/97teQjgtAHFo33+1Kzm9jv8NqyUQk2F/VAuDFjzx3tsZ
         gotLzJSf1RMeGnYdIwAAST+apeCpxlTG1iDY7oXp7gS/44J1zB6zU26YXvLtneualxGs
         bweA==
X-Gm-Message-State: ANhLgQ0WqCnLEtYRAKNzm2YX2b8P1U62S/EScZjM2KClLoPHxgED70v4
        F3ADWAWosX6GOKhpmLM/nsTmvA==
X-Google-Smtp-Source: ADFU+vvAYHKzghO9JCb5F1g7p3KD/ZAgT/OiCQR+XEJpn5yw5f7PbqaSvpjVtk5PgBOjn8wT814SRQ==
X-Received: by 2002:a17:902:5ac9:: with SMTP id g9mr5114278plm.69.1583970252383;
        Wed, 11 Mar 2020 16:44:12 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h2sm1173651pgq.32.2020.03.11.16.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 16:44:11 -0700 (PDT)
Date:   Wed, 11 Mar 2020 16:44:09 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Alex Elder <elder@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] remoteproc: re-check state in
 rproc_trigger_recovery()
Message-ID: <20200311234409.GH14744@builder>
References: <20200228183359.16229-1-elder@linaro.org>
 <20200228183359.16229-2-elder@linaro.org>
 <20200309205633.GF1399@xps15>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309205633.GF1399@xps15>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 09 Mar 13:56 PDT 2020, Mathieu Poirier wrote:

> On Fri, Feb 28, 2020 at 12:33:56PM -0600, Alex Elder wrote:
> > Two places call rproc_trigger_recovery():
> >   - rproc_crash_handler_work() sets rproc->state to CRASHED under
> >     protection of the mutex, then calls it if recovery is not
> >     disabled.  This function is called in workqueue context when
> >     scheduled in rproc_report_crash().
> >   - rproc_recovery_write() calls it in two spots, both of which
> >     the only call it if the rproc->state is CRASHED.
> > 
> > The mutex is taken right away in rproc_trigger_recovery().  However,
> > by the time the mutex is acquired, something else might have changed
> > rproc->state to something other than CRASHED.
> 
> I'm interested in the "something might have changed" part.  The only thing I can
> see is if rproc_trigger_recovery() has been called from debugfs between the time
> the mutex is released but just before rproc_trigger_recovery() is called in
> rproc_crash_handler_work().  In this case we would be done twice, something your
> patch prevents.  Have you found other scenarios?
> 

Alex is right, by checking rproc->state outside of the lock
rproc_recovery_write() allows for multiple contexts to enter
rproc_trigger_recovery() at once.

Further more, these multiple context will be held up at the
mutex_lock_interruptible() and as each one completes the recovery the
subsequent ones will stop the rproc, generate a coredump and then start
it again.


This patch would be to fix the latter problem and allows the next patch
to move the check in the debugfs interface in under the mutex. As such
I've picked up patch 1, 2 and 4.

Regards,
Bjorn

> Thanks,
> Mathieu
> 
> > 
> > The work that follows that is only appropriate for a remoteproc in
> > CRASHED state.  So check the state after acquiring the mutex, and
> > only proceed with the recovery work if the remoteproc is still in
> > CRASHED state.
> > 
> > Delay reporting that recovering has begun until after we hold the
> > mutex and we know the remote processor is in CRASHED state.
> > 
> > Signed-off-by: Alex Elder <elder@linaro.org>
> > ---
> >  drivers/remoteproc/remoteproc_core.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> > index 097f33e4f1f3..d327cb31d5c8 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1653,12 +1653,16 @@ int rproc_trigger_recovery(struct rproc *rproc)
> >  	struct device *dev = &rproc->dev;
> >  	int ret;
> >  
> > +	ret = mutex_lock_interruptible(&rproc->lock);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* State could have changed before we got the mutex */
> > +	if (rproc->state != RPROC_CRASHED)
> > +		goto unlock_mutex;
> > +
> >  	dev_err(dev, "recovering %s\n", rproc->name);
> >  
> > -	ret = mutex_lock_interruptible(&rproc->lock);
> > -	if (ret)
> > -		return ret;
> > -
> >  	ret = rproc_stop(rproc, true);
> >  	if (ret)
> >  		goto unlock_mutex;
> > -- 
> > 2.20.1
> > 
