Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43E311781B8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2020 20:02:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388161AbgCCSFj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Mar 2020 13:05:39 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:38899 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388233AbgCCSFe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Mar 2020 13:05:34 -0500
Received: by mail-io1-f65.google.com with SMTP id s24so4629139iog.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2020 10:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BeqmVRD23R+Ys+6oL1OQi3U6ndkvAqV94YJI5k3rbnY=;
        b=Wdf74tmgxXLRrohPgWHNosIVdnICT1cA9Lt1UzNTqQGYkQUT310eKC+YQDU7DsVX5+
         ZeBcD0lemBhKYaKyY6GtE+pLSn36sCnKEpBUpVgxf1Aq77Srl3Zh9ZwEchpnwJzkC8/G
         Mos2wMkoq8sFHfLJp9TGRTc4SvxEH52jY1pk4R3yXtS7678Fc+jFzT4/IOC0HxCXM33q
         +ktyaxHu9H8/IX5SiuHDdN5H5BUNg1PbsdLKZgsx7L0IaKZo22dIfz201EEJW1gwSDQc
         i5mQ/MERUwlzgAIIW0fghZlw8c7mYMvUmQuuKmKjKN+5ehqJH7rylxCnPNA+rjNxr1q3
         Dpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BeqmVRD23R+Ys+6oL1OQi3U6ndkvAqV94YJI5k3rbnY=;
        b=tYt6IbvftUC2+yx83gBQ1Yd1Vl4m4gMmApGDMuP8OCjxiChtnoUPdxND+GyaJZU5to
         TUrerAqzzCPgBT3XS2BJJ7IRMvg/U10XXXLLhl/45wISm71SJHXs3rrT81QUo6tTEfty
         FM5M6HoikGzJ4scpiLIGnvupc+uTo2OcdKM1kLLN2s61S9w0THOhRFGqkDwGC2k/TP1I
         tWst1fAQnBE8qXNeL0XSz8p1XMeaXL3KdQhHwjrFHizHQ4dDhxLOAiyeKv5Wmjg6I3S5
         zMStW69PVBA96BFGdJQZl6S6EeQ42+lU1+BOHc28cisKuyHo4fseJ66uEbp8E3/NvE0T
         hiRQ==
X-Gm-Message-State: ANhLgQ3t9PkMoMAkCgYn2lm5Y1ETU3OuZfoV6veMP1g/ReWZfqsbEGNn
        /6RTZkWdGfLGYM/pxvFCYBIRdXrq1FPO8WPGqsELb2jB
X-Google-Smtp-Source: ADFU+vu2a70oC8lR2iWbpY+kDjkXD0RbbPQlayFHSII+Chks5lqrwSbjjN5zO7UmxFOCozGue+NWzeJoxcwT1djquHY=
X-Received: by 2002:a02:c9cf:: with SMTP id c15mr2566556jap.71.1583258733428;
 Tue, 03 Mar 2020 10:05:33 -0800 (PST)
MIME-Version: 1.0
References: <1582167465-2549-1-git-send-email-sidgup@codeaurora.org>
 <1582167465-2549-7-git-send-email-sidgup@codeaurora.org> <20200227215940.GC20116@xps15>
 <1a615fcd5a5c435d1d8babe8d5c3f8c3@codeaurora.org> <20200228183832.GA23026@xps15>
 <cac45f2726a272ccd0ce82e12e46756f@codeaurora.org>
In-Reply-To: <cac45f2726a272ccd0ce82e12e46756f@codeaurora.org>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Tue, 3 Mar 2020 11:05:22 -0700
Message-ID: <CANLsYkzUh_BRjapX_jDZZ00Lj8MMgMPM12+otYHDKqad1s-qHQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] remoteproc: qcom: Add notification types to SSR
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, tsoni@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Siddharth Gupta <sidgup@codeaurora.org>,
        psodagud@codeaurora.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 2 Mar 2020 at 13:54, <rishabhb@codeaurora.org> wrote:
>
> On 2020-02-28 10:38, Mathieu Poirier wrote:
> > On Thu, Feb 27, 2020 at 04:00:21PM -0800, rishabhb@codeaurora.org
> > wrote:
> >> On 2020-02-27 13:59, Mathieu Poirier wrote:
> >> > On Wed, Feb 19, 2020 at 06:57:45PM -0800, Siddharth Gupta wrote:
> >> > > The SSR subdevice only adds callback for the unprepare event. Add
> >> > > callbacks
> >> > > for unprepare, start and prepare events. The client driver for a
> >> > > particular
> >> > > remoteproc might be interested in knowing the status of the remoteproc
> >> > > while undergoing SSR, not just when the remoteproc has finished
> >> > > shutting
> >> > > down.
> >> > >
> >> > > Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> >> > > ---
> >> > >  drivers/remoteproc/qcom_common.c | 39
> >> > > +++++++++++++++++++++++++++++++++++----
> >> > >  include/linux/remoteproc.h       | 15 +++++++++++++++
> >> > >  2 files changed, 50 insertions(+), 4 deletions(-)
> >> > >
> >> > > diff --git a/drivers/remoteproc/qcom_common.c
> >> > > b/drivers/remoteproc/qcom_common.c
> >> > > index 6714f27..6f04a5b 100644
> >> > > --- a/drivers/remoteproc/qcom_common.c
> >> > > +++ b/drivers/remoteproc/qcom_common.c
> >> > > @@ -183,9 +183,9 @@ EXPORT_SYMBOL_GPL(qcom_remove_smd_subdev);
> >> > >   *
> >> > >   * Returns pointer to srcu notifier head on success, ERR_PTR on
> >> > > failure.
> >> > >   *
> >> > > - * This registers the @notify function as handler for restart
> >> > > notifications. As
> >> > > - * remote processors are stopped this function will be called, with
> >> > > the rproc
> >> > > - * pointer passed as a parameter.
> >> > > + * This registers the @notify function as handler for
> >> > > powerup/shutdown
> >> > > + * notifications. This function will be invoked inside the
> >> > > callbacks registered
> >> > > + * for the ssr subdevice, with the rproc pointer passed as a
> >> > > parameter.
> >> > >   */
> >> > >  void *qcom_register_ssr_notifier(struct rproc *rproc, struct
> >> > > notifier_block *nb)
> >> > >  {
> >> > > @@ -227,11 +227,39 @@ int qcom_unregister_ssr_notifier(void *notify,
> >> > > struct notifier_block *nb)
> >> > >  }
> >> > >  EXPORT_SYMBOL_GPL(qcom_unregister_ssr_notifier);
> >> > >
> >> > > +static int ssr_notify_prepare(struct rproc_subdev *subdev)
> >> > > +{
> >> > > +        struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
> >> > > +
> >> > > +        srcu_notifier_call_chain(ssr->rproc_notif_list,
> >> > > +                                 RPROC_BEFORE_POWERUP, (void *)ssr->name);
> >> > > +        return 0;
> >> > > +}
> >> > > +
> >> > > +static int ssr_notify_start(struct rproc_subdev *subdev)
> >> > > +{
> >> > > +        struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
> >> > > +
> >> > > +        srcu_notifier_call_chain(ssr->rproc_notif_list,
> >> > > +                                 RPROC_AFTER_POWERUP, (void *)ssr->name);
> >> > > +        return 0;
> >> > > +}
> >> > > +
> >> > > +static void ssr_notify_stop(struct rproc_subdev *subdev, bool
> >> > > crashed)
> >> > > +{
> >> > > +        struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
> >> > > +
> >> > > +        srcu_notifier_call_chain(ssr->rproc_notif_list,
> >> > > +                                 RPROC_BEFORE_SHUTDOWN, (void *)ssr->name);
> >> > > +}
> >> > > +
> >> > > +
> >> > >  static void ssr_notify_unprepare(struct rproc_subdev *subdev)
> >> > >  {
> >> > >          struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
> >> > >
> >> > > -        srcu_notifier_call_chain(ssr->rproc_notif_list, 0, (void
> >> > > *)ssr->name);
> >> > > +        srcu_notifier_call_chain(ssr->rproc_notif_list,
> >> > > +                                 RPROC_AFTER_SHUTDOWN, (void *)ssr->name);
> >> > >  }
> >> > >
> >> > >  /**
> >> > > @@ -248,6 +276,9 @@ void qcom_add_ssr_subdev(struct rproc *rproc,
> >> > > struct qcom_rproc_ssr *ssr,
> >> > >  {
> >> > >          ssr->name = ssr_name;
> >> > >          ssr->subdev.name = kstrdup("ssr_notifs", GFP_KERNEL);
> >> > > +        ssr->subdev.prepare = ssr_notify_prepare;
> >> > > +        ssr->subdev.start = ssr_notify_start;
> >> > > +        ssr->subdev.stop = ssr_notify_stop;
> >> >
> >> > Now that I have a better understanding of what this patchset is doing, I
> >> > realise
> >> > my comments in patch 04 won't work.  To differentiate the subdevs of an
> >> > rproc I
> >> > suggest to wrap them in a generic structure with a type and an enum.
> >> > That way
> >> > you can differenciate between subdevices without having to add to the
> >> > core.
> >> Ok. I can try that.
> >> >
> >> > That being said, I don't understand what patches 5 and 6 are doing...
> >> > Registering with the global ssr_notifiers allowed to gracefully shutdown
> >> > all the
> >> > MCUs in the system when one of them would go down.  But now that we are
> >> > using
> >> > the notifier on a per MCU, I really don't see why each subdev couldn't
> >> > implement
> >> > the right prepare/start/stop functions.
> >> >
> >> > Am I missing something here?
> >> We only want kernel clients to be notified when the Remoteproc they
> >> are
> >> interested
> >> in changes state. For e.g. audio kernel driver should be notified when
> >> audio
> >> processor goes down but it does not care about any other remoteproc.
> >> If you are suggesting that these kernel clients be added as subdevices
> >> then
> >> we will end up having many subdevices registered to each remoteproc.
> >> So we
> >> implemented a notifier chain per Remoteproc. This keeps the SSR
> >> notifications as
> >> the subdevice per remoteproc, and all interested clients can register
> >> to it.
> >
> > It seems like I am missing information...  Your are referring to
> > "kernel
> > clients" and as such I must assume some drivers that are not part of
> > the
> > remoteproc/rpmsg subsystems are calling qcom_register_ssr_notifier().
> > I must
> Yes these are not part of remoteproc framework and they will register
> for notifications.
> > also assume these drivers (or that functionality) are not yet upsream
> > because
> > all I can see calling qcom_register_ssr_notifier() is
> > qcom_glink_ssr_probe().
> Correct.These are not upstreamed.

Ok, things are starting to make sense.

> >
> > Speaking of which, what is the role of the qcom_glink_ssr_driver?  Is
> > the glink
> > device that driver is handling the same as the glink device registed in
> > adsp_probe() and q6v5_probe()?
> glink ssr driver will send out notifications to remoteprocs that have
> opened the
> "glink_ssr" channel that some subsystem has gone down or booted up. This
> helps notify
> neighboring subsystems about change in state of any other subsystem.

I am still looking for an answer to my second question.

> >
> >> >
> >> >
> >> > >          ssr->subdev.unprepare = ssr_notify_unprepare;
> >> > >          ssr->rproc_notif_list = kzalloc(sizeof(struct srcu_notifier_head),
> >> > >                                                                  GFP_KERNEL);
> >> > > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> >> > > index e2f60cc..4be4478 100644
> >> > > --- a/include/linux/remoteproc.h
> >> > > +++ b/include/linux/remoteproc.h
> >> > > @@ -449,6 +449,21 @@ struct rproc_dump_segment {
> >> > >  };
> >> > >
> >> > >  /**
> >> > > + * enum rproc_notif_type - Different stages of remoteproc
> >> > > notifications
> >> > > + * @RPROC_BEFORE_SHUTDOWN:      unprepare stage of  remoteproc
> >> > > + * @RPROC_AFTER_SHUTDOWN:       stop stage of  remoteproc
> >> > > + * @RPROC_BEFORE_POWERUP:       prepare stage of  remoteproc
> >> > > + * @RPROC_AFTER_POWERUP:        start stage of  remoteproc
> >> > > + */
> >> > > +enum rproc_notif_type {
> >> > > +        RPROC_BEFORE_SHUTDOWN,
> >> > > +        RPROC_AFTER_SHUTDOWN,
> >> > > +        RPROC_BEFORE_POWERUP,
> >> > > +        RPROC_AFTER_POWERUP,
> >> > > +        RPROC_MAX
> >> > > +};
> >> > > +
> >> > > +/**
> >> > >   * struct rproc - represents a physical remote processor device
> >> > >   * @node: list node of this rproc object
> >> > >   * @domain: iommu domain
> >> > > --
> >> > > Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> >> > > a Linux Foundation Collaborative Project
> >> > >
> >> > > _______________________________________________
> >> > > linux-arm-kernel mailing list
> >> > > linux-arm-kernel@lists.infradead.org
> >> > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
