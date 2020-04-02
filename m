Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C5EA19CAF0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2020 22:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388706AbgDBUTD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 16:19:03 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:33152 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732263AbgDBUTD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 16:19:03 -0400
Received: by mail-vs1-f68.google.com with SMTP id y138so3454690vsy.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 13:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3SoqWvBnm21PtEqXse9X15gYjgWddDXc0ygB71MVtXM=;
        b=bnZIjFZM51oSPn7+uw5jdRuRE4R/MAyhfT6EqbycCkOAIg8VGr8OmTdJ/ykaquEQNK
         VFTS+zOu98W21tzqM1d0cN96ybX0iuWPi66mu/6CWZsKdmwTOHqgTWdt4nZH5mse/+Nq
         DAMmcZ8LVW5Q1oOPqKorn63IepVroElq4k1HQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3SoqWvBnm21PtEqXse9X15gYjgWddDXc0ygB71MVtXM=;
        b=TMy1PXZgQo+88+9qRpZbxESo7mTI2f7FfZ40olt1zYD2uBjcjzMg+ZIR7l6AQsPGr7
         LsDi4rv081Uobjg6my/9shp+H+8wpo0wTL3walEY+uac+JiwimCOK1AVZ3PygSu38S6s
         lNmi1OnLDP8QhqN+MnnXBnFdE1DmUDSO/GHuTgL7rqV/qwW48Uh67z9pKCuD4TzEoOtr
         1hRdx9yaHcbYyfwMsW0RF+JX2P5HaxpUHKEdVK5cKV9AL2cjpYe7B1IRqhsbmz489WGf
         hzSLRW2nw0jYVRLLOzh6zWzpluUPZB/7nvbnv4+R5bNQl8Ua+UUMtzg8mYBXANPuAFQL
         9rmw==
X-Gm-Message-State: AGi0PubGhv/QuplHHbK7pl5H0SQod1QqYw6rK3cqkBtbn0DmJJcipBXa
        nwPxRA7sbK44tQPV6wJttZdp5V+cLzQ=
X-Google-Smtp-Source: APiQypKeqWd+9EXhjgAqWCELuus4muM6oc+Kpk1SWlHfA5W3XfRfZojMRVeSsczHUhORRKc2UFYKZw==
X-Received: by 2002:a67:f3d3:: with SMTP id j19mr3916095vsn.190.1585858741058;
        Thu, 02 Apr 2020 13:19:01 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 32sm1483122uad.2.2020.04.02.13.18.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 13:18:59 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id b5so3467408vsb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2020 13:18:59 -0700 (PDT)
X-Received: by 2002:a67:1e46:: with SMTP id e67mr3989900vse.106.1585858738761;
 Thu, 02 Apr 2020 13:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200311231348.129254-1-dianders@chromium.org>
 <20200311161104.RFT.v2.5.I52653eb85d7dc8981ee0dafcd0b6cc0f273e9425@changeid> <30f2b142-6ac2-2917-1ad6-1474c51f3da7@codeaurora.org>
In-Reply-To: <30f2b142-6ac2-2917-1ad6-1474c51f3da7@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 2 Apr 2020 13:18:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Un78pD+88n-RTq5N3_XS1+cB8Noje6RZzPPDC1PckK8w@mail.gmail.com>
Message-ID: <CAD=FV=Un78pD+88n-RTq5N3_XS1+cB8Noje6RZzPPDC1PckK8w@mail.gmail.com>
Subject: Re: [RFT PATCH v2 05/10] drivers: qcom: rpmh-rsc: A lot of comments
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Evan Green <evgreen@chromium.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Apr 1, 2020 at 4:30 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>
> > + * Return: 0 if no problem, or -EAGAIN if the caller should try again in a bit.
> > + *         Caller should make sure to enable interrupts between tries.
> > + *         Only ever returns -EAGAIN for ACTIVE_ONLY transfers.
> with [2] it will not return -EAGAIN, can you please remove this part.

Sounds good.  Overall I'll probably wait to spin until your series
lands because trying to keep spinning this one in conjunction with
that one is going to be a nightmare.  Hopefully that means:

a) Your series can land soon.  I think it's in pretty good shape now.
I just sent a bunch of reviews.  Might need one more spin for nits and
then we'll see if Bjorn thinks it's good to go.

b) Once I spin this it can get a quicker review so other things don't
pop up and change things.

...or, if you want, you can hijack my series and send the next version
out yourself.  I won't object to that but please give me a heads up if
you're planning to do that so we don't duplicate work.


> > @@ -246,12 +288,35 @@ static struct tcs_group *get_tcs_for_msg(struct rsc_drv *drv,
> >                       ret = rpmh_rsc_invalidate(drv);
> >                       if (ret)
> >                               return ERR_PTR(ret);
> > +
> > +                     /*
> > +                      * TODO:
> > +                      * - Temporarily enable IRQs on the wake tcs.
> > +                      * - Make sure nobody else race with us and re-write
> > +                      *   to this TCS; document how this works.
> You can remove above comment, i already included change to enable IRQs
> on wake TCS in my series.

Right.  The race comment still is somewhat interesting because the
only way we're race free is that we know that the sleep/wake values
are only programmed at a time when no more active transactions can be
started.  I'll document that assumption.  If we ever change that
assumption we'll have to think about this more since (at the moment)
programming sleep/wake doesn't set the "tcs_in_use" bit.


> > +/**
> > + * check_for_req_inflight() - Look to see if conflicting cmds are in flight.
> > + * @drv: The controller.
> > + * @tcs: A pointer to the tcs_group used for ACTIVE_ONLY transfers.
> > + * @msg: The message we want to send, which will contain several addr/data
> > + *       pairs to program (but few enough that they all fit in one TCS).
> > + *
> > + * Only for use for ACTIVE_ONLY tcs_group, since those are the only ones
> > + * that might be actively sending.
>
> This comment will need to modify/removed after we use this in place of
> find_match().
>
> see below for more details.

As per below I'm trying to understand the motivation for using
check_for_req_inflight() when writing sleep/wake sets, so changing
this is pending on that discussion.


> > @@ -411,6 +533,20 @@ static int find_free_tcs(struct tcs_group *tcs)
> >       return -EBUSY;
> >   }
> >
> > +/**
> > + * tcs_write() - Store messages into a TCS right now, or return -EBUSY.
> > + * @drv: The controller.
> > + * @msg: The data to be sent.
> > + *
> > + * Grabs a TCS for ACTIVE_ONLY transfers and writes the messages to it.
> > + *
> > + * If there are no free ACTIVE_ONLY TCSs or if a command for the same address
> > + * is already transferring returns -EBUSY which means the client should retry
> > + * shortly.
> > + *
> > + * Return: 0 on success, -EBUSY if client should retry, or an error.
> > + *         Client should have interrupts enabled for a bit before retrying.
> > + */
> >   static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
> >   {
> >       struct tcs_group *tcs;
> > @@ -418,16 +554,14 @@ static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
> >       unsigned long flags;
> >       int ret;
> >
> > +     /* TODO: get_tcs_for_msg() can return -EAGAIN and nobody handles */
> with [2] it will not return -EAGAIN, can you please remove this comment.

OK.


> >       tcs = get_tcs_for_msg(drv, msg);
> >       if (IS_ERR(tcs))
> >               return PTR_ERR(tcs);
> >
> >       spin_lock_irqsave(&tcs->lock, flags);
> > +
> >       spin_lock(&drv->lock);
> > -     /*
> > -      * The h/w does not like if we send a request to the same address,
> > -      * when one is already in-flight or being processed.
> > -      */
> please keep above comment as it is.

OK.  I guess I felt like now that check_for_req_inflight() was
documented it was just getting in the way, but I'll keep it if you
want.


> > @@ -485,6 +635,63 @@ int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
> >       return ret;
> >   }
> >
> > +/**
> > + * find_match() - Find if the cmd sequence is in the tcs_group
> > + * @tcs: The tcs_group to search.  Either sleep or wake.
> > + * @cmd: The command sequence to search for; only addr is looked at.
> > + * @len: The number of commands in the sequence.
> > + *
> > + * Searches through the given tcs_group to see if a given command sequence
> > + * is in there.
> > + *
> > + * Two sequences are matches if they modify the same set of addresses in
> > + * the same order.  The value of the data is not considered when deciding if
> > + * two things are matches.
> > + *
> > + * How this function works is best understood by example.  For our example,
> > + * we'll imagine our tcs group contains these (cmd, data) tuples:
> > + *   [(a, A), (b, B), (c, C), (d, D), (e, E), (f, F), (g, G), (h, H)]
> > + * ...in other words it has an element where (addr=a, data=A), etc.
> > + * ...we'll assume that there is one TCS in the group that can store 8 commands.
> > + *
> > + * - find_match([(a, X)]) => 0
> > + * - find_match([(c, X), (d, X)]) => 2
> > + * - find_match([(c, X), (d, X), (e, X)]) => 2
> > + * - find_match([(z, X)]) => -ENODATA
> > + * - find_match([(a, X), (y, X)]) => -EINVAL (and warning printed)
> > + * - find_match([(g, X), (h, X), (i, X)]) => -EINVAL (and warning printed)
> > + * - find_match([(y, X), (a, X)]) => -ENODATA
> > + *
> > + * NOTE: This function overall seems like it has questionable value.
> > + * - It can be used to update a message in the TCS with new data, but I
> > + *   don't believe we actually do that--we always fully invalidate and
> > + *   re-write everything.
> we are doing this from [1] onwards.

OK.


> > Specifically it would be too limiting to force
> > + *   someone not to change the set of addresses written to each time.
> > + * - This function could be attempting to avoid writing different data to
> > + *   the same address twice in a tcs_group.  If that's the goal, it doesn't
> > + *   do a great job since find_match([(y, X), (a, X)]) return -ENODATA in my
> > + *   above example.
> > + * - If you originally wrote [(a, A), (b, B), (c, C)] and later tried to
> > + *   write [(a, A), (b, B)] it'd look like a match and we wouldn't consider
> > + *   it an error that the size got shorter.
> > + * - If two clients wrote sequences that happened to be placed in slots next
> > + *   to each other then a later check could match a sequence that was the
> > + *   size of both together.
> > + *
> > + * TODO: in light of the above, prehaps we can just remove this function?
>
> We still need to check there is no duplicate request in a TCS for SLEEP
> and WAKE as well.
>
> find_match() checks if the request already exist for a resource then
> update with new value, in a way preventing new request to go in
>
> when one already exists. I am ok to remove this function since after [1]
> we always fully invalidate and then re-write and little point in
>
> finding a match now. However we need to use check_for_req_inflight()
> from tcs_ctrl_write() with little modification to ignore tcs_is_free()
>
> check if is called from tcs_ctrlr_write().

Sure, we could use find_match() to add this check.  It definitely
feels a lot better than the current solution which seems to miss a
whole lot of corner cases.

Before I do that, maybe you can help me understand the motivation,
though?  Where are you expecting to find the conflict?  Certainly
there can't be any conflict in the normal (non-batch) sleep/wake sets,
right?  We only have one entry in the RPMH cache per address so the
non-batch entries can't conflict with themselves.  There also can't be
any previous async command still pending because we cache
async/non-async alike.

For batch requests I believe that there's exactly one caller using the
batch API (otherwise rpmh_invalidate() would be a nightmare).  That
one caller is the interconnect code, right?  It feels like we could
assume that the one caller of the batch API won't write to the same
address more than one time?

So I guess you're expecting that an rpmh_write() would write to the
same address that someone wrote to with rpmh_write_batch() and it
should override it?  Does that actually happen?  Isn't the batch API
used just for interconnect stuff and nobody should be using
rpmh_write() to mess with the interconnect stuff?


> After this change on 9th change in your series,  please move it before
> current patch in series.
>
> please also keep dependency on [1] for 9th change.

Sure.  I was trying to do all the documentation in the earlier patches
to provide motivation for and help understand the later patches, but I
can change the order if need be.  It didn't seem a big deal to add the
comments and delete them, but I can understand it being weird.


> >   /**
> > - * rpmh_rsc_write_ctrl_data: Write request to the controller
> > - *
> > - * @drv: the controller
> > - * @msg: the data to be written to the controller
> > + * rpmh_rsc_write_ctrl_data() - Write request to controller but don't trigger.
> > + * @drv: The controller.
> > + * @msg: The data to be written to the controller.
> >    *
> >    * There is no response returned for writing the request to the controller.
>
> you can remove above line since responce is returned from this function.

Right.  I think this was trying to say that the request wasn't
triggered and thus there was no response.  I think it's clearer with
my addition of "but don't trigger." to the comment.



-Doug
