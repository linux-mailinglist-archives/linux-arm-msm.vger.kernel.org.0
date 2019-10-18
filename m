Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41934DD4FB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2019 00:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbfJRWgh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 18:36:37 -0400
Received: from mail-il1-f182.google.com ([209.85.166.182]:46372 "EHLO
        mail-il1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbfJRWgh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 18:36:37 -0400
Received: by mail-il1-f182.google.com with SMTP id m16so530506iln.13;
        Fri, 18 Oct 2019 15:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NxwyJzDw3aWp/4Mm0CkL2jLLDwOu+KS0aGGORRSwju0=;
        b=kFHWeKsUaY78OCeV1EJyHNqmo5REVhzEVdbFSJQm5tVerXDuYvJNey9I77AKrAR4SL
         qqrzwk8ItEHadepy0wMq+NFf2et6dFKQk440HkyfeJ0WfozCxnqUu59qwRh3tlAX5Wlr
         t4m/orXmU91YrTiGR1LAVDYuU1aq5qF61THHmAtcIw7OKxw+w4N7y8OqCNqiA2Hl74li
         lFK3mY9nXAvLA5LXVNIaoq97nRqwqHu9Pa5bBRGiNpxEUmq+ArF+NF2uYxfoeUgkGk48
         6TiWOkhP+NF5xjeVJfecEjI+K70WA/ebNQ5gFHXVO7Ebp38X4vGscxID4VCszbYGzIru
         oyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NxwyJzDw3aWp/4Mm0CkL2jLLDwOu+KS0aGGORRSwju0=;
        b=E+nHcF3e8TbSc5CQg1bdSiRWQKjyPYa3apdbCl0uKuLtvrEHzYG8PMWKmZ1b9VzHEK
         PM/1OyuxDETsQErO57dMOBRUPDRW7DjZbFpefNL4TF5YJkMo82QY55lIT279/hCdUNqm
         qNkJIuXK4TBUqmC2vSfR9pfrpAsc99TNYJs7ziR2ShcQSFAX6ypQYYCCN0U5J1kYnOPG
         w+4zF8JJ04eFvfaaoB4beLhGUl5PcdD4qMfqcEhoNrDoiK4kTivIPqzfaHkmuTLWDdDx
         3lhmZeF6kqdV1my8Bq0D/zgdT3iJvxoMSxrKD/Og8GlLz4rIrHqmh8rfFimbTO4QlioC
         V0Gg==
X-Gm-Message-State: APjAAAXwiIFx9gokQ/wG6TI0J5cTWuaE4HsRHm3XVFfguya5S0GgAC3a
        0u4dUGajvhCQotUlvoKWH+b4jKJ4u/wWJpGaskM=
X-Google-Smtp-Source: APXvYqxshs0VrdDmyMTisIhYkWAQAyonlBZuVpvShFms8CWbSF2/P9DCqLjxKb5J9+yoaiUUZtlwJcRfDqYV5lv1wLw=
X-Received: by 2002:a92:1dd6:: with SMTP id g83mr12859128ile.178.1571438194469;
 Fri, 18 Oct 2019 15:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20191017212955.6266-1-jeffrey.l.hugo@gmail.com>
 <20191018180339.GQ87296@google.com> <CAOCk7NrN0sjLk3onvZn7+bhs_v3A4H6CHh=XPo_NU2XzUWeEGw@mail.gmail.com>
 <20191018194039.GB20212@google.com> <CAOCk7NqacfVLzKueTRTFQ6aWbLXFyMQaQNXeXENzLTyMNLSp9w@mail.gmail.com>
 <20191018213354.GC20212@google.com>
In-Reply-To: <20191018213354.GC20212@google.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Fri, 18 Oct 2019 16:36:23 -0600
Message-ID: <CAOCk7NqtYjJ5S5XWsLTrQN0qKU8-R83E_b=+cjebpAJ0+UGdxw@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: hci_qca: Add delay for wcn3990 stability
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        c-hbandi@codeaurora.org, bgodavar@codeaurora.org,
        linux-bluetooth@vger.kernel.org,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 18, 2019 at 3:33 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Fri, Oct 18, 2019 at 01:51:39PM -0600, Jeffrey Hugo wrote:
> > On Fri, Oct 18, 2019 at 1:40 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> > >
> > > On Fri, Oct 18, 2019 at 12:30:09PM -0600, Jeffrey Hugo wrote:
> > > > On Fri, Oct 18, 2019 at 12:03 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> > > > >
> > > > > On Thu, Oct 17, 2019 at 02:29:55PM -0700, Jeffrey Hugo wrote:
> > > > > > On the msm8998 mtp, the response to the baudrate change command is never
> > > > > > received.  On the Lenovo Miix 630, the response to the baudrate change
> > > > > > command is corrupted - "Frame reassembly failed (-84)".
> > > > > >
> > > > > > Adding a 50ms delay before re-enabling flow to receive the baudrate change
> > > > > > command response from the wcn3990 addesses both issues, and allows
> > > > > > bluetooth to become functional.
> > > > >
> > > > > From my earlier debugging on sdm845 I don't think this is what happens.
> > > > > The problem is that the wcn3990 sends the response to the baudrate change
> > > > > command using the new baudrate, while the UART on the SoC still operates
> > > > > with the prior speed (for details see 2faa3f15fa2f ("Bluetooth: hci_qca:
> > > > > wcn3990: Drop baudrate change vendor event"))
> > > > >
> > > > > IIRC the 50ms delay causes the HCI core to discard the received data,
> > > > > which is why the "Frame reassembly failed" message disappears, not
> > > > > because the response was received. In theory commit 78e8fa2972e5
> > > > > ("Bluetooth: hci_qca: Deassert RTS while baudrate change command")
> > > > > should have fixed those messages, do you know if CTS/RTS are connected
> > > > > on the Bluetooth UART of the Lenovo Miix 630?
> > > >
> > > > I was testing with 5.4-rc1 which contains the indicated RTS fix.
> > > >
> > > > Yes, CTS/RTS are connected on the Lenovo Miix 630.
> > > >
> > > > I added debug statements which indicated that data was received,
> > > > however it was corrupt, and the packet type did not match what was
> > > > expected, hence the frame reassembly errors.
> > >
> > > Do you know if any data is received during the delay? In theory that
> > > shouldn't be the case since RTS is deasserted, just double-checking.
> >
> > I don't think so, but I've run so many tests, I'm not 100% positive.
> > Let me go double check and get back to you.

Apparently I'd be wrong.  I instrumented the uart driver so that it
would indicate when it got data from the bam.  Apparently its getting
the data during the 50ms sleep, approximately right after the host
baud rate is set.

> >
> > >
> > > What happens if you add a longer delay (e.g. 1s) before/after setting
> > > the host baudrate?
> >
> > Hmm, not exactly sure.  I will test.

Adding a 1 second delay before setting the host baud rate did not
change the observed results - still received the data during the 50ms
sleep after the host baud rate set operation.
Adding a 1 second delay after setting the host baud rate did not
change when the data was received.

> >
> > >
> > > > In response to this patch, Balakrishna pointed me to a bug report
> > > > which indicated that some of the UART GPIO lines need to have a bias
> > > > applied to prevent errant data from floating lines -
> > > >
> > > > https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1391888
> > >
> > > Yeah, that was another source of frame reassembly errors that we were
> > > seeing on SDM845.
> > >
> > > Balakrishna, please post these kind of replies on-list, so that
> > > everybody can benefit from possible solutions or contribute to the
> > > discussion.
> > >
> > > > It turns out this fix was never applied to msm8998.  Applying the fix
> > > > does cause the the frame reassembly errors to go away, however then
> > > > the host SoC never receives the baud rate change response (I increased
> > > > the timeout from 2faa3f15fa2f ("Bluetooth: hci_qca: wcn3990: Drop
> > > > baudrate change vendor event") to 5 seconds).  As of now, this patch
> > > > is still required.
> > >
> > > Interesting.
> > >
> > > FTR, this is the full UART pin configuration for cheza (SDM845):
> > >
> > > &qup_uart6_default {
> > >         /* Change pinmux to all 4 pins since CTS and RTS are connected */
> > >         pinmux {
> > >                 pins = "gpio45", "gpio46",
> > >                        "gpio47", "gpio48";
> > >         };
> > >
> > >         pinconf-cts {
> > >                 /*
> > >                  * Configure a pull-down on 45 (CTS) to match the pull of
> > >                  * the Bluetooth module.
> > >                  */
> > >                 pins = "gpio45";
> > >                 bias-pull-down;
> > >         };
> > >
> > >         pinconf-rts-tx {
> > >                 /* We'll drive 46 (RTS) and 47 (TX), so no pull */
> > >                 pins = "gpio46", "gpio47";
> > >                 drive-strength = <2>;
> > >                 bias-disable;
> > >         };
> > >
> > >         pinconf-rx {
> > >                 /*
> > >                  * Configure a pull-up on 48 (RX). This is needed to avoid
> > >                  * garbage data when the TX pin of the Bluetooth module is
> > >                  * in tri-state (module powered off or not driving the
> > >                  * signal yet).
> > >                  */
> > >                 pins = "gpio48";
> > >                 bias-pull-up;
> > >         };
> > > };
> > >
> > > Does this correspond to what you tried on the Lenovo Miix 630?
> >
> > Which GPIO maps to which pin is different -
> > 45 - TX
> > 46 - RX
> > 47 - CTS
> > 48 - RFR (RTS)
> >
> > However, accounting for that, yes that corresponds to what I used.
>
> Thanks for re-confirming.
>
> > > > I have no idea why the delay is required, and was hoping that posting
> > > > this patch would result in someone else providing some missing pieces
> > > > to determine the real root cause.  I suspect that asserting RTS at the
> > > > wrong time may cause an issue for the wcn3990, but I have no data nor
> > > > documentation to support this guess.  I welcome any further insights
> > > > you may have.
> > >
> > > Unfortunately I don't have a clear suggestion at this point, debugging
> > > the original problem which lead to 2faa3f15fa2f ("Bluetooth: hci_qca:
> > > wcn3990: Drop baudrate change vendor event") involved quite some time
> > > and hooking up a scope/logic analyzer ...
> > >
> > > I also suspect RTS is involved, and potentially the configuration of
> > > the pulls. It might be interesting to analyze the data that leads to
> > > the frame assembly error and determine if it is just noise (wrong
> > > pulls/drive strength?) or received with a non-matching baud-rate.
> >
> > I don't have a scope/logic analyzer, but since I hooked up the
> > blsp_bam I'm able to see the raw data from the uart before it gets to
> > the HCI stack or anything.  As a side note, having the bam or not
> > seemed to have no effect on the issue.
>
> It's not exactly the same though. I suppose with the blsp_bam you only
> see the actual data when the UART runs at the same speed as it's
> counterpart. With a logic analyzer you can change the speed after
> data capture, which might convert apparent garbage into reasonable
> data.
>
> > Most of the time the data was one byte (zero), some times it was a
> > string of zero bytes.  Rarely it would be random data.
>
> In terms of data ss there difference between a string of zero bytes
> and a single zero byte?

Per my notes, the bam would indicate that it processed one byte, which
was a 0, or 6 bytes, all of which were zero.

>
> From my notes the response (vendor event) to a baudrate change
> command on the WCN3990 is:
>
> 04 0e 04 01 00 00 00
>
> The tail *might* be the zero(s) you are seeing, and the first part gets
> lost for some reason?

So, if that were the case, then the number of processed bytes would
probably 1, 2, or 3 which doesn't seem to line up fully with 1 or 6.
>
> A simplified version of the code in question:
>
>   set_RTS(false)
>
>   hci_set_baudrate(br)
>   host_set_baudrate(br)
>
>   msleep(50); // why is this needed???
>   set_RTS(true)
>
>   // supposedly wcn3990 now sends vendor event using the new baudrate
>
>   wait_for_vendor_event()
>     // ok with msleep, otherwise frame reassembly error

Yep, I'm with you here.

>
> Maybe the MSM8998 UART (driver) currently needs the delay to fully switch to
> the new baudrate? Perhaps the pinconfig still needs tweaking of some kind?

So, I kinda wonder if its something else.  The uart driver on msm8998
is not the same as on sdm845.  The msm8998 one behaves strangely in my
opinion.  Any configuration (set the baud, change the flow control,
etc) results in a complete reinit of the entire uart.  I wonder if
there is a glitch, and the driver ends up inadvertently enabling flow
during the host baud rate switch.  If I look at the timing between
50ms delay and no 50ms delay, it looks like the set_RTS(true)
operation occurs at the approximate same time the data would be
received had the 50ms delay been in place.  I wonder if since the uart
driver completely reconfigures everything as a result of the
set_RTS(true) operation, that is causing the data to be dropped -
either in hardware or software.  More investigation would be required
to find data to validate or disprove my guesses about these two
possible issues.

>
> You said when you apply the full configuration used on cheza you don't
> receive the response to the baudrate change command. Does it work when you
> only configure the pull-up on the RX (host) pin?

It works roughly 50% of the time, although in one of the runs init
later failed because of a frame reassembly error during the tlv
transfer.
