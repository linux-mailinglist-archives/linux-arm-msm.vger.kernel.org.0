Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 770FDDDAE6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2019 22:31:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbfJSUbb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Oct 2019 16:31:31 -0400
Received: from mail-io1-f44.google.com ([209.85.166.44]:39909 "EHLO
        mail-io1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbfJSUbb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Oct 2019 16:31:31 -0400
Received: by mail-io1-f44.google.com with SMTP id a1so11443327ioc.6;
        Sat, 19 Oct 2019 13:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UGShpeUtbGURr+8l4pRGlRklDvAb+ea4s5/O+OHThZM=;
        b=qGZu3y9ThOGCWZFAakcdNT3gbTD+loVZAC6seLaKK6xAxr2pX9AdfYMPz2AR2KqKbk
         j35zpgw9v0ETUJ/0tlvHrXa8bWHOoItmYTR8xjmzfoWjgMQlktSStiQsG86WDLnx34MQ
         93Rc/mYKsVgCtQVeHm82drJRiwEn+x2AhRpSYldJvsHx1IAXOBc/sKhlooTFtkc1pBoK
         f6JNej0tCpWfySZ9/JtIpvJeai4XBlXeNCjtN1szk+iwRv7lWjg6dninmbYiorkq9P03
         ibqCO1U7Gl9RJGXr3BlIzb5d6V6ve15S3u8q2BO+9YSkVBvLSXLQY8/yglsG0aVPR+k4
         GDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UGShpeUtbGURr+8l4pRGlRklDvAb+ea4s5/O+OHThZM=;
        b=tSSilFrvQv96qOwDm+NJ7MWBttZhEZxOnvtD90ooSzl4u0DnSRc/w6/Hz3lQ+LVlNT
         02R+9mR1/HJY0YIWxtpuuyobQDH4smXPlzIzbExZiZKlXM0WQowwj1L7hEJECSdXL3XT
         IVlCE5n+LkOyWyvEdghfrDR5e2TnR5kdwLDrQmGMQUnVE9xO338s5h0HIDBhtL6LAivU
         xbRTkdf5/z933Hz+x8hC77D5GrdbuoE03bU8irQezYaIohOn1IeihxnGROufPgUcwBaZ
         PEbIxULzldg5uxLMqCbnXWRMa5U71mxdSyO0alOVBNGxPbx24XL4cRbLyJLO5zo9SM1P
         JPqg==
X-Gm-Message-State: APjAAAU2biseVpdB0CgMlSgz3jQRYqYINKkmxdHCJl+tcti2dpE+5+uf
        tproygzkGy3cpcz0pSqkYWw0VSnnNWsNmrscxnA=
X-Google-Smtp-Source: APXvYqx3QuFmKvCDJXz/4B1nNVi9ZOoCbtE6eTDgdbKugTRp7zWOxrxgJPsfQomLTF3VqAiA7trHakgshYgix97TyAw=
X-Received: by 2002:a6b:1504:: with SMTP id 4mr15326621iov.166.1571517089851;
 Sat, 19 Oct 2019 13:31:29 -0700 (PDT)
MIME-Version: 1.0
References: <20191017212955.6266-1-jeffrey.l.hugo@gmail.com>
 <20191018180339.GQ87296@google.com> <CAOCk7NrN0sjLk3onvZn7+bhs_v3A4H6CHh=XPo_NU2XzUWeEGw@mail.gmail.com>
 <20191018194039.GB20212@google.com> <CAOCk7NqacfVLzKueTRTFQ6aWbLXFyMQaQNXeXENzLTyMNLSp9w@mail.gmail.com>
 <20191018213354.GC20212@google.com> <CAOCk7NqtYjJ5S5XWsLTrQN0qKU8-R83E_b=+cjebpAJ0+UGdxw@mail.gmail.com>
 <20191018231508.GD20212@google.com>
In-Reply-To: <20191018231508.GD20212@google.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Sat, 19 Oct 2019 14:31:18 -0600
Message-ID: <CAOCk7NpWFJDGt=6SwCRnD_07dePV=r42g7p4UFdZnJqZpbbcNA@mail.gmail.com>
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

On Fri, Oct 18, 2019 at 5:15 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Fri, Oct 18, 2019 at 04:36:23PM -0600, Jeffrey Hugo wrote:
> > On Fri, Oct 18, 2019 at 3:33 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> > >
> > > On Fri, Oct 18, 2019 at 01:51:39PM -0600, Jeffrey Hugo wrote:
> > > > On Fri, Oct 18, 2019 at 1:40 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> > > > >
> > > > > On Fri, Oct 18, 2019 at 12:30:09PM -0600, Jeffrey Hugo wrote:
> > > > > > On Fri, Oct 18, 2019 at 12:03 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> > > > > > >
> > > > > > > On Thu, Oct 17, 2019 at 02:29:55PM -0700, Jeffrey Hugo wrote:
> > > > > > > > On the msm8998 mtp, the response to the baudrate change command is never
> > > > > > > > received.  On the Lenovo Miix 630, the response to the baudrate change
> > > > > > > > command is corrupted - "Frame reassembly failed (-84)".
> > > > > > > >
> > > > > > > > Adding a 50ms delay before re-enabling flow to receive the baudrate change
> > > > > > > > command response from the wcn3990 addesses both issues, and allows
> > > > > > > > bluetooth to become functional.
> > > > > > >
> > > > > > > From my earlier debugging on sdm845 I don't think this is what happens.
> > > > > > > The problem is that the wcn3990 sends the response to the baudrate change
> > > > > > > command using the new baudrate, while the UART on the SoC still operates
> > > > > > > with the prior speed (for details see 2faa3f15fa2f ("Bluetooth: hci_qca:
> > > > > > > wcn3990: Drop baudrate change vendor event"))
> > > > > > >
> > > > > > > IIRC the 50ms delay causes the HCI core to discard the received data,
> > > > > > > which is why the "Frame reassembly failed" message disappears, not
> > > > > > > because the response was received. In theory commit 78e8fa2972e5
> > > > > > > ("Bluetooth: hci_qca: Deassert RTS while baudrate change command")
> > > > > > > should have fixed those messages, do you know if CTS/RTS are connected
> > > > > > > on the Bluetooth UART of the Lenovo Miix 630?
> > > > > >
> > > > > > I was testing with 5.4-rc1 which contains the indicated RTS fix.
> > > > > >
> > > > > > Yes, CTS/RTS are connected on the Lenovo Miix 630.
> > > > > >
> > > > > > I added debug statements which indicated that data was received,
> > > > > > however it was corrupt, and the packet type did not match what was
> > > > > > expected, hence the frame reassembly errors.
> > > > >
> > > > > Do you know if any data is received during the delay? In theory that
> > > > > shouldn't be the case since RTS is deasserted, just double-checking.
> > > >
> > > > I don't think so, but I've run so many tests, I'm not 100% positive.
> > > > Let me go double check and get back to you.
> >
> > Apparently I'd be wrong.  I instrumented the uart driver so that it
> > would indicate when it got data from the bam.  Apparently its getting
> > the data during the 50ms sleep, approximately right after the host
> > baud rate is set.
>
> Good finding!
>
> > > >
> > > > >
> > > > > What happens if you add a longer delay (e.g. 1s) before/after setting
> > > > > the host baudrate?
> > > >
> > > > Hmm, not exactly sure.  I will test.
> >
> > Adding a 1 second delay before setting the host baud rate did not
> > change the observed results - still received the data during the 50ms
> > sleep after the host baud rate set operation.
> > Adding a 1 second delay after setting the host baud rate did not
> > change when the data was received.
>
> Thanks for testing!
>
> > > >
> > > > >
> > > > > > In response to this patch, Balakrishna pointed me to a bug report
> > > > > > which indicated that some of the UART GPIO lines need to have a bias
> > > > > > applied to prevent errant data from floating lines -
> > > > > >
> > > > > > https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1391888
> > > > >
> > > > > Yeah, that was another source of frame reassembly errors that we were
> > > > > seeing on SDM845.
> > > > >
> > > > > Balakrishna, please post these kind of replies on-list, so that
> > > > > everybody can benefit from possible solutions or contribute to the
> > > > > discussion.
> > > > >
> > > > > > It turns out this fix was never applied to msm8998.  Applying the fix
> > > > > > does cause the the frame reassembly errors to go away, however then
> > > > > > the host SoC never receives the baud rate change response (I increased
> > > > > > the timeout from 2faa3f15fa2f ("Bluetooth: hci_qca: wcn3990: Drop
> > > > > > baudrate change vendor event") to 5 seconds).  As of now, this patch
> > > > > > is still required.
> > > > >
> > > > > Interesting.
> > > > >
> > > > > FTR, this is the full UART pin configuration for cheza (SDM845):
> > > > >
> > > > > &qup_uart6_default {
> > > > >         /* Change pinmux to all 4 pins since CTS and RTS are connected */
> > > > >         pinmux {
> > > > >                 pins = "gpio45", "gpio46",
> > > > >                        "gpio47", "gpio48";
> > > > >         };
> > > > >
> > > > >         pinconf-cts {
> > > > >                 /*
> > > > >                  * Configure a pull-down on 45 (CTS) to match the pull of
> > > > >                  * the Bluetooth module.
> > > > >                  */
> > > > >                 pins = "gpio45";
> > > > >                 bias-pull-down;
> > > > >         };
> > > > >
> > > > >         pinconf-rts-tx {
> > > > >                 /* We'll drive 46 (RTS) and 47 (TX), so no pull */
> > > > >                 pins = "gpio46", "gpio47";
> > > > >                 drive-strength = <2>;
> > > > >                 bias-disable;
> > > > >         };
> > > > >
> > > > >         pinconf-rx {
> > > > >                 /*
> > > > >                  * Configure a pull-up on 48 (RX). This is needed to avoid
> > > > >                  * garbage data when the TX pin of the Bluetooth module is
> > > > >                  * in tri-state (module powered off or not driving the
> > > > >                  * signal yet).
> > > > >                  */
> > > > >                 pins = "gpio48";
> > > > >                 bias-pull-up;
> > > > >         };
> > > > > };
> > > > >
> > > > > Does this correspond to what you tried on the Lenovo Miix 630?
> > > >
> > > > Which GPIO maps to which pin is different -
> > > > 45 - TX
> > > > 46 - RX
> > > > 47 - CTS
> > > > 48 - RFR (RTS)
> > > >
> > > > However, accounting for that, yes that corresponds to what I used.
> > >
> > > Thanks for re-confirming.
> > >
> > > > > > I have no idea why the delay is required, and was hoping that posting
> > > > > > this patch would result in someone else providing some missing pieces
> > > > > > to determine the real root cause.  I suspect that asserting RTS at the
> > > > > > wrong time may cause an issue for the wcn3990, but I have no data nor
> > > > > > documentation to support this guess.  I welcome any further insights
> > > > > > you may have.
> > > > >
> > > > > Unfortunately I don't have a clear suggestion at this point, debugging
> > > > > the original problem which lead to 2faa3f15fa2f ("Bluetooth: hci_qca:
> > > > > wcn3990: Drop baudrate change vendor event") involved quite some time
> > > > > and hooking up a scope/logic analyzer ...
> > > > >
> > > > > I also suspect RTS is involved, and potentially the configuration of
> > > > > the pulls. It might be interesting to analyze the data that leads to
> > > > > the frame assembly error and determine if it is just noise (wrong
> > > > > pulls/drive strength?) or received with a non-matching baud-rate.
> > > >
> > > > I don't have a scope/logic analyzer, but since I hooked up the
> > > > blsp_bam I'm able to see the raw data from the uart before it gets to
> > > > the HCI stack or anything.  As a side note, having the bam or not
> > > > seemed to have no effect on the issue.
> > >
> > > It's not exactly the same though. I suppose with the blsp_bam you only
> > > see the actual data when the UART runs at the same speed as it's
> > > counterpart. With a logic analyzer you can change the speed after
> > > data capture, which might convert apparent garbage into reasonable
> > > data.
> > >
> > > > Most of the time the data was one byte (zero), some times it was a
> > > > string of zero bytes.  Rarely it would be random data.
> > >
> > > In terms of data ss there difference between a string of zero bytes
> > > and a single zero byte?
> >
> > Per my notes, the bam would indicate that it processed one byte, which
> > was a 0, or 6 bytes, all of which were zero.
>
> ok
>
> > > From my notes the response (vendor event) to a baudrate change
> > > command on the WCN3990 is:
> > >
> > > 04 0e 04 01 00 00 00
> > >
> > > The tail *might* be the zero(s) you are seeing, and the first part gets
> > > lost for some reason?
> >
> > So, if that were the case, then the number of processed bytes would
> > probably 1, 2, or 3 which doesn't seem to line up fully with 1 or 6.
>
> ack
>
> > > A simplified version of the code in question:
> > >
> > >   set_RTS(false)
> > >
> > >   hci_set_baudrate(br)
> > >   host_set_baudrate(br)
> > >
> > >   msleep(50); // why is this needed???
> > >   set_RTS(true)
> > >
> > >   // supposedly wcn3990 now sends vendor event using the new baudrate
> > >
> > >   wait_for_vendor_event()
> > >     // ok with msleep, otherwise frame reassembly error
> >
> > Yep, I'm with you here.
> >
> > >
> > > Maybe the MSM8998 UART (driver) currently needs the delay to fully switch to
> > > the new baudrate? Perhaps the pinconfig still needs tweaking of some kind?
> >
> > So, I kinda wonder if its something else.  The uart driver on msm8998
> > is not the same as on sdm845.  The msm8998 one behaves strangely in my
> > opinion.  Any configuration (set the baud, change the flow control,
> > etc) results in a complete reinit of the entire uart.  I wonder if
> > there is a glitch, and the driver ends up inadvertently enabling flow
> > during the host baud rate switch.  If I look at the timing between
> > 50ms delay and no 50ms delay, it looks like the set_RTS(true)
> > operation occurs at the approximate same time the data would be
> > received had the 50ms delay been in place.  I wonder if since the uart
> > driver completely reconfigures everything as a result of the
> > set_RTS(true) operation, that is causing the data to be dropped -
> > either in hardware or software.  More investigation would be required
> > to find data to validate or disprove my guesses about these two
> > possible issues.
>
> A RTS glitch and data being dropped during the port reconfiguration is a
> possiblity. However, with the delay the data that otherwise would cause
> the frame reassembly error is received during the delay and discarded
> (I don't recall what exactly leads to discarding), but we still receive
> the vendor event we are waiting for (to drop it). This strongly suggests
> that the data received during the delay is not the vendor event, but
> something else. My first guess would be garbage as artifact of the
> baudrate switch and/or pin config. My second guess would be an additional
> HCI event, but I don't recall having seen that when I investigated the
> problem with changing the baudrate on cheza.

After more digging, I'm convinced there is a RTS glitch in the uart driver.

To be clear, after porting the cheza pin configuration, I don't see
any frame reassembly errors.  With the updated pinconfig, the
remaining questions would be why is the 50 ms delay necessary to
receive the event, and why does the event come when flow is disabled?

I investigated the possibility of a RTS issue.  After studying the
uart hardware documentation, I concluded that the driver was doing the
wrong thing as part of "reset".  Instead of de-asserting RTS, it was
asserting it, thus enabling flow.  Disabling flow would asset RTS as
part of the reset from the termios operation, then disable the
hardware flow management as part of a mctrl operation, which would end
up deasserting RTS (although this appear to be a concidence and not
guarenteed by the hardware documentation).  Then the host baud change
would invoke the termios operation, which would reset the hardware and
re-assert RTS, but there would be no mctrl operation to de-assert RTS
again, which is what would be expected.  Thus the wcn3990 would be
free to send the response, which would line up with the data showing
an event received immediately after the host baud change, even though
flow is expected to be disabled at that point.

I still have no logic analyzer, nor a platform that allows me to get
at the actual signals, however I hacked up the pinctrl driver to allow
me to read the raw gpio state at any point from code.  I was able to
use this to confirm that RTS was not behaving as expected, and what
exact operations in the uart driver was causing the errant behavior.

By changing the uart driver to de-assert RTS instead of asserting RTS
as part of "reset", I see that the RTS gpio line behaves as expected,
and the expected event always comes after flow is re-enabled.  This
behavior does not change despite having a 1 second delay after host
baud change, a 50ms delay, or no delay.

Therefore, I believe we have root caused why the 50ms delay was having
an effect, and determined a proper fix.  I will be formulating a
proper patch to the uart driver, and sending it upstream

Marcel, I appreciate that you picked up this change (adding a 50 ms
delay).  However, since I believe we have root caused the issue and
formulated a proper fix, this change is now unnecessary, and I believe
it should be dropped.  How would you like to handle that?  Would you
like me to post a revert?

>
> > > You said when you apply the full configuration used on cheza you don't
> > > receive the response to the baudrate change command. Does it work when you
> > > only configure the pull-up on the RX (host) pin?
> >
> > It works roughly 50% of the time, although in one of the runs init
> > later failed because of a frame reassembly error during the tlv
> > transfer.
>
> Thanks for trying, I'm still wondering if some tweaking is needed, but
> apparently just matching cheza/sdm845 doesn't work.
