Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B90372437E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Aug 2020 11:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgHMJrc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 05:47:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726574AbgHMJrb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 05:47:31 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CF26C061384
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2020 02:47:30 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id k8so4482325wma.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2020 02:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=K76TwNOj6YPUxnu//cnGFVzxaqY2UQJNOHmvCQA8ibM=;
        b=u3zj4eb4DbqEA0J/MuJ/2jcW8Mb5+xFtNKoX546zTcr7PUfgNM0njk9BOGlazD2GBx
         Bk02ZKTY2ooC8GVOlkAncirs6AsBfzhaszTDjgGn5sWjIGDe6NF2ZV9IHfJRXc7vQ7ie
         CpYi6sPvXp0c/yBeVr11wouNsaf52l39KYudoHssTwmI4ChdT6d9cbx8Fc2A2++Z2K6T
         4klthMJN/USRp/b7v6d/KWfRKUhze7ujQV1BYerGjQvTFFhnVjVO3X5rJL/dT0PePXcS
         bwyK6P9mTCqWGD33rs+ZQWXdgR5Zcwg8vk6GHlOlmQ3YJ9r15dbWzCWLDyCiXFm0FUwd
         8d5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K76TwNOj6YPUxnu//cnGFVzxaqY2UQJNOHmvCQA8ibM=;
        b=gMSvFq00vZlCgAqwbKqZYKwoqvZs9uisqBcZH+ypIe1LPwLBsTsxBF5626FQ3DAz6H
         uLOIUOfqsFiDBsXEQTwrJWisz0glnKvuTeJlmAa3+sASKidVFqT9Fit3mYnfmo1GDhpL
         6bZvznKPCe2Yrir1x/WD3k9RkllHMXBW4/VhCJEhB+qMK7FN62MixsK6cxsrznkCcKH8
         ny2dPpRjqhQqTIUqzjQQzkiD6honmlMwJqVs3OmkIGYfBFbEaroETUOkARXW8+9yZXnZ
         lgvgd3D23TO67H48y/QDsr3VHx4QcOxqnG+7c+ofsHfAjB8w0CYn4t1LPaH+CX2fv6R9
         /2wg==
X-Gm-Message-State: AOAM530PXc0EiHiPRgWk8j/K6Bp/v9kZJhoOWzzj3Co4jTHLWwbyEch7
        qe40l2EHOgAzZ5eaxkvppnIptg==
X-Google-Smtp-Source: ABdhPJwTtTJZm1Ao/8JMd5q4rRpuspz63aaSVRyUYha/ai0uABTB9aiqdz6zC8xthX+6zSRPvlaC6Q==
X-Received: by 2002:a1c:e907:: with SMTP id q7mr3752451wmc.155.1597312048399;
        Thu, 13 Aug 2020 02:47:28 -0700 (PDT)
Received: from holly.lan (82-132-221-219.dab.02.net. [82.132.221.219])
        by smtp.gmail.com with ESMTPSA id y2sm9133729wmg.25.2020.08.13.02.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 02:47:27 -0700 (PDT)
Date:   Thu, 13 Aug 2020 10:47:24 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Akash Asthana <akashast@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, linux-serial@vger.kernel.org,
        kgdb-bugreport@lists.sourceforge.net,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [Kgdb-bugreport] [PATCH] serial: qcom_geni_serial: Fix recent
 kdb hang
Message-ID: <20200813094724.di7g3irdkm6h2lul@holly.lan>
References: <20200806221904.1.I4455ff86f0ef5281c2a0cd0a4712db614548a5ca@changeid>
 <adaef6bf-7887-feea-fedf-d3bc5566bb9d@codeaurora.org>
 <CAD=FV=X8tNpmkSrEjXgKPKsBOZfjt8aVQe47gzi5FvPqdOQN+A@mail.gmail.com>
 <b4cd8daf-ef37-4cc1-546e-ba46cb19392a@codeaurora.org>
 <CAD=FV=W=C111X2VzZaAKo8JhRGexG=crK+YJbr9FWcAzATggAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=W=C111X2VzZaAKo8JhRGexG=crK+YJbr9FWcAzATggAQ@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 11, 2020 at 09:21:22AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Aug 11, 2020 at 4:54 AM Akash Asthana <akashast@codeaurora.org> wrote:
> >
> >
> > On 8/11/2020 2:56 AM, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Mon, Aug 10, 2020 at 5:32 AM Akash Asthana <akashast@codeaurora.org> wrote:
> > >> Hi Doug,
> > >>
> > >> On 8/7/2020 10:49 AM, Douglas Anderson wrote:
> > >>> The commit e42d6c3ec0c7 ("serial: qcom_geni_serial: Make kgdb work
> > >>> even if UART isn't console") worked pretty well and I've been doing a
> > >>> lot of debugging with it.  However, recently I typed "dmesg" in kdb
> > >>> and then held the space key down to scroll through the pagination.  My
> > >>> device hung.  This was repeatable and I found that it was introduced
> > >>> with the aforementioned commit.
> > >>>
> > >>> It turns out that there are some strange boundary cases in geni where
> > >>> in some weird situations it will signal RX_LAST but then will put 0 in
> > >>> RX_LAST_BYTE.  This means that the entire last FIFO entry is valid.
> > >> IMO that means we received a word in RX_FIFO and it is the last word
> > >> hence RX_LAST bit is set.
> > > What you say would make logical sense, but it's not how I have
> > > observed geni to work.  See below.
> > >
> > >
> > >> RX_LAST_BYTE is 0 means none of the bytes are valid in the last word.
> > > This would imply that qcom_geni_serial_handle_rx() is also broken
> > > though, wouldn't it?  Specifically imagine that WORD_CNT is 1 and
> > > RX_LAST is set and RX_LAST_BYTE_VALID is true.  Here's the logic from
> > > that function:
> > >
> > >    total_bytes = BYTES_PER_FIFO_WORD * (word_cnt - 1);
> > >    if (last_word_partial && last_word_byte_cnt)
> > >      total_bytes += last_word_byte_cnt;
> > >    else
> > >      total_bytes += BYTES_PER_FIFO_WORD;
> > >    port->handle_rx(uport, total_bytes, drop);
> > >
> > > As you can see that logic will set "total_bytes" to 4 in the case I'm
> > > talking about.
> >
> > Yeah IMO as per theory this should also be corrected but since you have
> > already pulled out few experiment to prove garbage data issue(which I
> > was suspecting) is not seen.
> >
> > It's already consistent with existing logic and it behaves well
> > practically . So the changes could be merge. Meanwhile I am checking
> > with HW team to get clarity.
> >
> > >
> > >
> > >> In such scenario we should just read RX_FIFO buffer (to empty it),
> > >> discard the word and return NO_POLL_CHAR. Something like below.
> > >>
> > >> ---------------------------------------------------------------------------------------------------------------------------------------------------------
> > >>
> > >>                   else
> > >>                           private_data->poll_cached_bytes_cnt = 4;
> > >>
> > >>                   private_data->poll_cached_bytes =
> > >>                           readl(uport->membase + SE_GENI_RX_FIFOn);
> > >>           }
> > >>
> > >> +        if (!private_data->poll_cached_bytes_cnt)
> > >> +              return NO_POLL_CHAR;
> > >>           private_data->poll_cached_bytes_cnt--;
> > >>           ret = private_data->poll_cached_bytes & 0xff;
> > >> -------------------------------------------------------------------------------------------------------------------------------------------------------------
> > >>
> > >> Please let me know whether above code helps.
> > > Your code will avoid the hang.  Yes.  ...but it will drop bytes.  I
> > > devised a quick-n-dirty test.  Here's a test of your code:
> > I assumed those as invalid bytes and don't wanted to read them so yeah
> > dropping of bytes was expected.
> > >
> > > https://crrev.com/c/2346886
> > >
> > > ...and here's a test of my code:
> > >
> > > https://crrev.com/c/2346884
> > >
> > > I had to keep a buffer around since it's hard to debug the serial
> > > driver.  In both cases I put "DOUG" into the buffer when I detect this
> > > case.  If my theory about how geni worked was wrong then we should
> > > expect to see some garbage in the buffer right after the DOUG, right?
> > > ...but my code gets the alphabet in nice sequence.  Your code drops 4
> > > bytes.
> > Yeah I was expecting garbage data.
> > >
> > >
> > > NOTE: while poking around with the above two test patches I found it
> > > was pretty easy to get geni to drop bytes / hit overflow cases and
> > > also to insert bogus 0 bytes in the stream (I believe these are
> > > related).  I was able to reproduce this:
> > > * With ${SUBJECT} patch in place.
> > > * With your proposed patch.
> > > * With the recent "geni" patches reverted (in other words back to 1
> > > byte per FIFO entry).
> > >
> > > It's not terribly surprising that we're overflowing since I believe
> > > kgdb isn't too keen to read characters at the same time it's writing.
> > > That doesn't explain the weird 0-bytes that geni seemed to be
> > > inserting, but at least it would explain the overflows.  However, even
> > > after I fixed this I _still_ was getting problems.  Specifically geni
> > > seemed to be hiding bytes from me until it was too late.  I put
> > > logging in and would see this:
> > >
> > > 1 word in FIFO - wxyz
> > > 1 word in FIFO (last set, last FIFO has 1 byte) - \n
> > > Check again, still 0 bytes in FIFO
> > > Suddenly 16 bytes are in FIFO and S_RX_FIFO_WR_ERR_EN is set.
> >
> > RX data first stored in RX_ASYNC_FIFO then it's transfered to RX_FIFO
> >
> > When get_char is called and we observe 0 bytes in RX_FIFO, most probably
> > data is not transfered from RX_ASYNC_FIFO to RX_FIFO.
> >
> > BITS 27:25 of SE_GENI_RX_FIFO_STATUS register shows RX_ASYNC_FIFO word
> > count.
> 
> OK, I did a tad bit more debugging and I think any problems left after
> my patch are actually kdb's fault, though geni doesn't behave terribly
> well with overflows (it would be better if it just dropped characters
> rather than enqueuing garbage).  Specifically in the tests I was
> running recently kdb would sometimes still take over 30 ms between
> polls so it's not surprising that we'd get overflows if we're
> spamming.  All my test code and results are at:
> 
> https://crrev.com/c/2348284
> 
> Earlier when I claimed that bytes were showing up in geni too quickly
> I was wrong.  My timing code was broken at the time.
> 
> 
> > > I spent a whole bunch of time poking at this and couldn't find any
> > > sort of workaround.  Presumably geni is taking some time between me
> > > reading the last word out of the FIFO from the "previous" packet and
> > > then transitioning to the new packet.  I found a lot of references to
> > > this process in the hardware register description (see GENI_CFG_REG69,
> > > for instance), but I couldn't manage to make the kick to happen any
> > > faster.  Presumably this isn't a problem for things like Bluetooth
> > > since flow control saves them.  ...and I guess this isn't a problem in
> > > practice because we usually _send_ a lot of data to the host for
> > > console/kgdb and it's only the host => DUT path that has problems.
> > >
> > >
> > >> I am not sure about what all scenario can leads to this behavior from
> > >> hardware, I will try to get an answer from hardware team.
> > >>
> > >> Any error bit was set for SE_GENI_S_IRQ_STATUS & SE_GENI_M_IRQ_STATUS
> > >> registers?
> > > As per above I can see overflows in my test case and geni seems to be
> > > behaving pretty badly.  If you have ideas on how to fix this I'd love
> > > it.  However, it still seems like my patch is right because (at least
> > > in the cases I tested) it avoids dropping bytes in some cases.  It
> > > also matches how qcom_geni_serial_handle_rx() works and if that was
> > > broken we'd have noticed by now.
> >
> > Reviewed-by: Akash Asthana <akashast@codeaurora.org>
> 
> Thanks!  After my extra digging I now think that the weird case is
> triggered by the overflows and the FIFO certainly does get garbage in
> it when there are overflows, but I think my patch is still correct and
> gets correct bytes.  The garbage that is queued up is queued up later
> and looks like normal transfers.  ...so I think we're good to go with
> it.
> 
> So summary:
> 1. We should land my patch.
> 2. I filed <https://crbug.com/1115125> to track trying to make kdb's
> polling nicer.

This sort of thing could improve multi-line copy 'n paste (e.g. any case
where we issue more output than we receive in input) but be aware the pager
deliberately discards backlogged characters to improve latency so
in the use case that provoked this thread it makes no difference
whether the UART overflow machinery or the kdb core discards the backlog!


Daniel.
