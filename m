Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A53F2173FC1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2020 19:38:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725805AbgB1Sii (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Feb 2020 13:38:38 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45705 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726720AbgB1Sii (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Feb 2020 13:38:38 -0500
Received: by mail-pf1-f194.google.com with SMTP id 2so2128292pfg.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2020 10:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7Mj1CM/WyswvfaSTAEBfuMjiDk0djmCwfBfsrA3O5uc=;
        b=BlVt49tTxtV5Bde7kV6ngAmWl7rEt0i8rqnv7INClnaweok4PqrcznuNCW7HcNzaMz
         ljc/q6AvcKzmdVCiDy4mi/v6PxO5RTRYkjOyXw5URocA2fEmZot5OKlRsYrfCz1vr0Tr
         RsNIX1ns65INwth6gEZOzYmbcEj/+XiOKypop7ME4vEVgDxTX3ollzeTpmVQxpRxJv0X
         /f9kAtJPxHFCCepDzwCCSd5UGFFO6tSkCboCfPFaMPlHAray9Z33GJ47Z3UhzQO0TsU5
         /D6aHhSxntnh8253NMf8uOkRBZ8QW46dl6etIkJ5EVG25OheZVCPdehinVQiV/l1UVPZ
         LChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7Mj1CM/WyswvfaSTAEBfuMjiDk0djmCwfBfsrA3O5uc=;
        b=Dn3Hv9dVXuVBt2Xua+Nr+SAN7jOpxcX2rwM82n/KZxbZu+XX79B53TKh5WjWgUSX08
         z+gy1e5qf+S0RF7HXb8TfP1mw1XtWh2JUPcadjAhl1ZMBnwGqzjYolo0Slkc5NlDAq0y
         cZcWmmzz4TcXkJQcEUaFie6hYFkbYVbM8ByEAKgtIuU3tkzZsn6TSNo0YqjRofBGyGWx
         wd+p/KStHtBgc54xnZQY7ie8q9XN9Ptiw5KUBPMSwVzEMuMmYePcA8erw7GISYdZVqFQ
         nVIQQlL8HOyVE6MyabVwRzQwYoz3Dm3YC4gcl1tvorFR+4Stepz9xvDnRxl3iSG6LghF
         qjWg==
X-Gm-Message-State: APjAAAU/q4n4Il8p5nc4saluXRg7OJiLNtagQaAxOaMInOfZpQDo4UcI
        UiaSWLNarXtejQQnEAl54G0qsw==
X-Google-Smtp-Source: APXvYqwU0KE04kKPdLTj115noM9yxYuTjDpZIVSW/jvVwAsLLZopU3CtFzW4tbOFtdfVVt7ikP16Ow==
X-Received: by 2002:a62:ce8b:: with SMTP id y133mr5773442pfg.172.1582915115515;
        Fri, 28 Feb 2020 10:38:35 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id b5sm12301691pfb.179.2020.02.28.10.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 10:38:34 -0800 (PST)
Date:   Fri, 28 Feb 2020 11:38:32 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     rishabhb@codeaurora.org
Cc:     Siddharth Gupta <sidgup@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, ohad@wizery.com, tsoni@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, psodagud@codeaurora.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/6] remoteproc: qcom: Add notification types to SSR
Message-ID: <20200228183832.GA23026@xps15>
References: <1582167465-2549-1-git-send-email-sidgup@codeaurora.org>
 <1582167465-2549-7-git-send-email-sidgup@codeaurora.org>
 <20200227215940.GC20116@xps15>
 <1a615fcd5a5c435d1d8babe8d5c3f8c3@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a615fcd5a5c435d1d8babe8d5c3f8c3@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 27, 2020 at 04:00:21PM -0800, rishabhb@codeaurora.org wrote:
> On 2020-02-27 13:59, Mathieu Poirier wrote:
> > On Wed, Feb 19, 2020 at 06:57:45PM -0800, Siddharth Gupta wrote:
> > > The SSR subdevice only adds callback for the unprepare event. Add
> > > callbacks
> > > for unprepare, start and prepare events. The client driver for a
> > > particular
> > > remoteproc might be interested in knowing the status of the remoteproc
> > > while undergoing SSR, not just when the remoteproc has finished
> > > shutting
> > > down.
> > > 
> > > Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> > > ---
> > >  drivers/remoteproc/qcom_common.c | 39
> > > +++++++++++++++++++++++++++++++++++----
> > >  include/linux/remoteproc.h       | 15 +++++++++++++++
> > >  2 files changed, 50 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/qcom_common.c
> > > b/drivers/remoteproc/qcom_common.c
> > > index 6714f27..6f04a5b 100644
> > > --- a/drivers/remoteproc/qcom_common.c
> > > +++ b/drivers/remoteproc/qcom_common.c
> > > @@ -183,9 +183,9 @@ EXPORT_SYMBOL_GPL(qcom_remove_smd_subdev);
> > >   *
> > >   * Returns pointer to srcu notifier head on success, ERR_PTR on
> > > failure.
> > >   *
> > > - * This registers the @notify function as handler for restart
> > > notifications. As
> > > - * remote processors are stopped this function will be called, with
> > > the rproc
> > > - * pointer passed as a parameter.
> > > + * This registers the @notify function as handler for
> > > powerup/shutdown
> > > + * notifications. This function will be invoked inside the
> > > callbacks registered
> > > + * for the ssr subdevice, with the rproc pointer passed as a
> > > parameter.
> > >   */
> > >  void *qcom_register_ssr_notifier(struct rproc *rproc, struct
> > > notifier_block *nb)
> > >  {
> > > @@ -227,11 +227,39 @@ int qcom_unregister_ssr_notifier(void *notify,
> > > struct notifier_block *nb)
> > >  }
> > >  EXPORT_SYMBOL_GPL(qcom_unregister_ssr_notifier);
> > > 
> > > +static int ssr_notify_prepare(struct rproc_subdev *subdev)
> > > +{
> > > +	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
> > > +
> > > +	srcu_notifier_call_chain(ssr->rproc_notif_list,
> > > +				 RPROC_BEFORE_POWERUP, (void *)ssr->name);
> > > +	return 0;
> > > +}
> > > +
> > > +static int ssr_notify_start(struct rproc_subdev *subdev)
> > > +{
> > > +	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
> > > +
> > > +	srcu_notifier_call_chain(ssr->rproc_notif_list,
> > > +				 RPROC_AFTER_POWERUP, (void *)ssr->name);
> > > +	return 0;
> > > +}
> > > +
> > > +static void ssr_notify_stop(struct rproc_subdev *subdev, bool
> > > crashed)
> > > +{
> > > +	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
> > > +
> > > +	srcu_notifier_call_chain(ssr->rproc_notif_list,
> > > +				 RPROC_BEFORE_SHUTDOWN, (void *)ssr->name);
> > > +}
> > > +
> > > +
> > >  static void ssr_notify_unprepare(struct rproc_subdev *subdev)
> > >  {
> > >  	struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
> > > 
> > > -	srcu_notifier_call_chain(ssr->rproc_notif_list, 0, (void
> > > *)ssr->name);
> > > +	srcu_notifier_call_chain(ssr->rproc_notif_list,
> > > +				 RPROC_AFTER_SHUTDOWN, (void *)ssr->name);
> > >  }
> > > 
> > >  /**
> > > @@ -248,6 +276,9 @@ void qcom_add_ssr_subdev(struct rproc *rproc,
> > > struct qcom_rproc_ssr *ssr,
> > >  {
> > >  	ssr->name = ssr_name;
> > >  	ssr->subdev.name = kstrdup("ssr_notifs", GFP_KERNEL);
> > > +	ssr->subdev.prepare = ssr_notify_prepare;
> > > +	ssr->subdev.start = ssr_notify_start;
> > > +	ssr->subdev.stop = ssr_notify_stop;
> > 
> > Now that I have a better understanding of what this patchset is doing, I
> > realise
> > my comments in patch 04 won't work.  To differentiate the subdevs of an
> > rproc I
> > suggest to wrap them in a generic structure with a type and an enum.
> > That way
> > you can differenciate between subdevices without having to add to the
> > core.
> Ok. I can try that.
> > 
> > That being said, I don't understand what patches 5 and 6 are doing...
> > Registering with the global ssr_notifiers allowed to gracefully shutdown
> > all the
> > MCUs in the system when one of them would go down.  But now that we are
> > using
> > the notifier on a per MCU, I really don't see why each subdev couldn't
> > implement
> > the right prepare/start/stop functions.
> > 
> > Am I missing something here?
> We only want kernel clients to be notified when the Remoteproc they are
> interested
> in changes state. For e.g. audio kernel driver should be notified when audio
> processor goes down but it does not care about any other remoteproc.
> If you are suggesting that these kernel clients be added as subdevices then
> we will end up having many subdevices registered to each remoteproc. So we
> implemented a notifier chain per Remoteproc. This keeps the SSR
> notifications as
> the subdevice per remoteproc, and all interested clients can register to it.

It seems like I am missing information...  Your are referring to "kernel
clients" and as such I must assume some drivers that are not part of the 
remoteproc/rpmsg subsystems are calling qcom_register_ssr_notifier().  I must
also assume these drivers (or that functionality) are not yet upsream because
all I can see calling qcom_register_ssr_notifier() is qcom_glink_ssr_probe(). 

Speaking of which, what is the role of the qcom_glink_ssr_driver?  Is the glink
device that driver is handling the same as the glink device registed in
adsp_probe() and q6v5_probe()? 

> > 
> > 
> > >  	ssr->subdev.unprepare = ssr_notify_unprepare;
> > >  	ssr->rproc_notif_list = kzalloc(sizeof(struct srcu_notifier_head),
> > >  								GFP_KERNEL);
> > > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > > index e2f60cc..4be4478 100644
> > > --- a/include/linux/remoteproc.h
> > > +++ b/include/linux/remoteproc.h
> > > @@ -449,6 +449,21 @@ struct rproc_dump_segment {
> > >  };
> > > 
> > >  /**
> > > + * enum rproc_notif_type - Different stages of remoteproc
> > > notifications
> > > + * @RPROC_BEFORE_SHUTDOWN:	unprepare stage of  remoteproc
> > > + * @RPROC_AFTER_SHUTDOWN:	stop stage of  remoteproc
> > > + * @RPROC_BEFORE_POWERUP:	prepare stage of  remoteproc
> > > + * @RPROC_AFTER_POWERUP:	start stage of  remoteproc
> > > + */
> > > +enum rproc_notif_type {
> > > +	RPROC_BEFORE_SHUTDOWN,
> > > +	RPROC_AFTER_SHUTDOWN,
> > > +	RPROC_BEFORE_POWERUP,
> > > +	RPROC_AFTER_POWERUP,
> > > +	RPROC_MAX
> > > +};
> > > +
> > > +/**
> > >   * struct rproc - represents a physical remote processor device
> > >   * @node: list node of this rproc object
> > >   * @domain: iommu domain
> > > --
> > > Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > > a Linux Foundation Collaborative Project
> > > 
> > > _______________________________________________
> > > linux-arm-kernel mailing list
> > > linux-arm-kernel@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
