Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 498C839DB28
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jun 2021 13:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230264AbhFGLZQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Jun 2021 07:25:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26266 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231244AbhFGLZQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Jun 2021 07:25:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623065004;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zc6Zzchdln/jB85tO3RpEJVwBJg3pIhgW8I9SkpD2Q4=;
        b=MkCzP0bXHWsBlcmKcqYByyJ7p8qJsgWVr1IQtWhWhkoOE3Of1DH8JVFyBvj4ke+M6+E3a9
        f7Bk4thU+fnMilJq4mNZOQ30KfMMu5Ls84zYs91IfXzecy9nckVAs4HVjDTzwNRbOnRJTp
        opJxUblHIoJF6hQb1lbtLuuqb2VvkYg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-CPcPIY-gORaFMMvqAOjdkg-1; Mon, 07 Jun 2021 07:23:21 -0400
X-MC-Unique: CPcPIY-gORaFMMvqAOjdkg-1
Received: by mail-ej1-f69.google.com with SMTP id ji22-20020a1709079816b0290414bdf5da11so739544ejc.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jun 2021 04:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=zc6Zzchdln/jB85tO3RpEJVwBJg3pIhgW8I9SkpD2Q4=;
        b=BhAqdwSb7xQWbNxbG5RB2+w/YsRyRGgkQMTv7W56CEV7HfNO/P5az1LDFUpQASFsKZ
         G6BcxjsD2XsPS7WKzoBS9yOy2U7hUxueUJPDFZgwNYRFZcXsK5M3R6zIQUTBuHTMtX87
         l4LPE/fXE2gGLKC0kL4OTBdnmcvJf0szbrLp8LlMSktWUdQRkzh0M9vM5i1yuEbK4JsH
         KTfTKCST8dqrPzB+L+hRaEIICLSw+9X2O/rPfWUqCDDL/01JswQNKrWiVHoCAHz7cQ4m
         A1ZzACn7dP+0Ozretnc50XG0Zbde9gRIq/+WmqRvncVLJrtxJSYrcYwFykVJGAxEVW+6
         5ycQ==
X-Gm-Message-State: AOAM530UP2kDAj0pFDJlsfBvQiFcKfXxLm4ciBsUGc0/E8yj7dmEtUsB
        YkUD9+iXqAI+hP7DH/YCUYhZTgQfftqijszp9PJ0lbHRJongLE23LdkezZh/3rWopS5VL7xQqoZ
        65gniSWNVwtiDwD4+k8IUeisQdA==
X-Received: by 2002:a05:6402:22f9:: with SMTP id dn25mr19594737edb.241.1623065000248;
        Mon, 07 Jun 2021 04:23:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPvpeHfqvkFfd65yFQIat2Dl2S5NjUEZnw8jXXFjo5nalky9wHoi8WhvQxR21TBBAT4l6/rg==
X-Received: by 2002:a05:6402:22f9:: with SMTP id dn25mr19594712edb.241.1623064999981;
        Mon, 07 Jun 2021 04:23:19 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id zb19sm6364113ejb.120.2021.06.07.04.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 04:23:19 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
        id A9C06180723; Mon,  7 Jun 2021 13:23:18 +0200 (CEST)
From:   Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To:     Stephan Gerhold <stephan@gerhold.net>,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Aleksander Morgado <aleksander@aleksander.es>,
        Network Development <netdev@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [RFC] Integrate RPMSG/SMD into WWAN subsystem
In-Reply-To: <YL364+xK3mE2FU8a@gerhold.net>
References: <YLfL9Q+4860uqS8f@gerhold.net>
 <CAMZdPi9tcye-4P4i0uXZcECJ-Big5T11JdvdXW6k2mEEi9XwyA@mail.gmail.com>
 <YLtDB2Cz5ttewsFu@gerhold.net>
 <CAMZdPi_-Qa=JnThHs_h-144dAfSAjF5s+QdBawdXZ3kk8Mx8ng@mail.gmail.com>
 <YL364+xK3mE2FU8a@gerhold.net>
X-Clacks-Overhead: GNU Terry Pratchett
Date:   Mon, 07 Jun 2021 13:23:18 +0200
Message-ID: <87sg1tvryx.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Stephan Gerhold <stephan@gerhold.net> writes:

> Hi Loic,
>
> On Mon, Jun 07, 2021 at 11:27:07AM +0200, Loic Poulain wrote:
>> On Sat, 5 Jun 2021 at 11:25, Stephan Gerhold <stephan@gerhold.net> wrote:
>> > On Fri, Jun 04, 2021 at 11:11:45PM +0200, Loic Poulain wrote:
>> > > On Wed, 2 Jun 2021 at 20:20, Stephan Gerhold <stephan@gerhold.net> wrote:
>> > > > I've been thinking about creating some sort of "RPMSG" driver for the
>> > > > new WWAN subsystem; this would be used as a QMI/AT channel to the
>> > > > integrated modem on some older Qualcomm SoCs such as MSM8916 and MSM8974.
>> > > >
>> > > > It's easy to confuse all the different approaches that Qualcomm has to
>> > > > talk to their modems, so I will first try to briefly give an overview
>> > > > about those that I'm familiar with:
>> > > >
>> > > > ---
>> > > > There is USB and MHI that are mainly used to talk to "external" modems.
>> > > >
>> > > > For the integrated modems in many Qualcomm SoCs there is typically
>> > > > a separate control and data path. They are not really related to each
>> > > > other (e.g. currently no common parent device in sysfs).
>> > > >
>> > > > For the data path (network interface) there is "IPA" (drivers/net/ipa)
>> > > > on newer SoCs or "BAM-DMUX" on some older SoCs (e.g. MSM8916/MSM8974).
>> > > > I have a driver for BAM-DMUX that I hope to finish up and submit soon.
>> > > >
>> > > > The connection is set up via QMI. The messages are either sent via
>> > > > a shared RPMSG channel (net/qrtr sockets in Linux) or via standalone
>> > > > SMD/RPMSG channels (e.g. "DATA5_CNTL" for QMI and "DATA1" for AT).
>> > > >
>> > > > This gives a lot of possible combinations like BAM-DMUX+RPMSG
>> > > > (MSM8916, MSM8974), or IPA+QRTR (SDM845) but also other funny
>> > > > combinations like IPA+RPMSG (MSM8994) or BAM-DMUX+QRTR (MSM8937).
>> > > >
>> > > > Simply put, supporting all these in userspace like ModemManager
>> > > > is a mess (Aleksander can probably confirm).
>> > > > It would be nice if this could be simplified through the WWAN subsystem.
>> > > >
>> > > > It's not clear to me if or how well QRTR sockets can be mapped to a char
>> > > > device for the WWAN subsystem, so for now I'm trying to focus on the
>> > > > standalone RPMSG approach (for MSM8916, MSM8974, ...).
>> > > > ---
>> > > >
>> > > > Currently ModemManager uses the RPMSG channels via the rpmsg-chardev
>> > > > (drivers/rpmsg/rpmsg_char.c). It wasn't my idea to use it like this,
>> > > > I just took that over from someone else. Realistically speaking, the
>> > > > current approach isn't too different from the UCI "backdoor interface"
>> > > > approach that was rejected for MHI...
>> > > >
>> > > > I kind of expected that I can just trivially copy some code from
>> > > > rpmsg_char.c into a WWAN driver since they both end up as a simple char
>> > > > device. But it looks like the abstractions in wwan_core are kind of
>> > > > getting in the way here... As far as I can tell, they don't really fit
>> > > > together with the RPMSG interface.
>> > > >
>> > > > For example there is rpmsg_send(...) (blocking) and rpmsg_trysend(...)
>> > > > (non-blocking) and even a rpmsg_poll(...) [1] but I don't see a way to
>> > > > get notified when the TX queue is full or no longer full so I can call
>> > > > wwan_port_txon/off().
>> > > >
>> > > > Any suggestions or other thoughts?
>> > >
>> > > It would be indeed nice to get this in the WWAN framework.
>> > > I don't know much about rpmsg but I think it is straightforward for
>> > > the RX path, the ept_cb can simply forward the buffers to
>> > > wwan_port_rx.
>> >
>> > Right, that part should be straightforward.
>> >
>> > > For tx, simply call rpmsg_trysend() in the wwan tx
>> > > callback and don't use the txon/off helpers. In short, keep it simple
>> > > and check if you observe any issues.
>> > >
>> >
>> > I'm not sure that's a good idea. This sounds like exactly the kind of
>> > thing that might explode later just because I don't manage to get the
>> > TX queue full in my tests. In that case, writing to the WWAN char dev
>> > would not block, even if O_NONBLOCK is not set.
>> 
>> Right, if you think it could be a problem, you can always implement a
>> more complex solution like calling rpmsg_send from a
>> workqueue/kthread, and only re-enable tx once rpmsg_send returns.
>> 
>
> I did run into trouble when I tried to stream lots of data into the WWAN
> char device (e.g. using dd). However, in practice (with ModemManager) 
> I did not manage to cause such issues yet. Personally, I think it's
> something we should get right, just to avoid trouble later
> (like "modem suddenly stops working").
>
> Right now I extended the WWAN port ops a bit so I tells me if the write
> should be non-blocking or blocking and so I can call rpmsg_poll(...).
>
> But having some sort of workqueue also sounds like it could work quite
> well, thanks for the suggestion! Will think about it some more, or
> I might post what I have right now so you can take a look.

How big are those hardware TXQs? Just pushing packets to the hardware
until it overflows sounds like a recipe for absolutely terrible
bufferbloat... That would be bad!

-Toke

