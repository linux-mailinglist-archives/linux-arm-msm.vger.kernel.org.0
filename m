Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E1ADDD13B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2019 23:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506162AbfJRVd7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Oct 2019 17:33:59 -0400
Received: from mail-pf1-f179.google.com ([209.85.210.179]:42404 "EHLO
        mail-pf1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2506161AbfJRVd7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Oct 2019 17:33:59 -0400
Received: by mail-pf1-f179.google.com with SMTP id q12so4626316pff.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2019 14:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NmcUecAGXuSApRjNtgEf0ETg8ugP5bkJRtiayEQOKqA=;
        b=Av2WRpxYgSpf7TYLUsuUGfnXAcPeN7re/m6If3FYxqB2lfkQRVhu0Tc/kVAp3WKxbM
         tLfjhVtLrtxb+mzef1nXTPDl1OgyoZAZsUhSh8HmY1TzHcQSRIzRiGKZzNQESk7KdST9
         BGMRUD8iKjI7UUa0Q7eK7REzuRZUMI0LeMiXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NmcUecAGXuSApRjNtgEf0ETg8ugP5bkJRtiayEQOKqA=;
        b=H8/6ygJjnMEzr7BDpBdMrHODpkkEkpizbmgdTFQICy0IKJe5gqog5/PEz5JEFRETDs
         /k80jpF5PlegsqL/WOPHmupvx9fRfpIP/w3+jbx4jxnnpgUFZaKIBcD+ep8o+3Yqmuez
         c6qKtZcco78DYVBXMHctUiDOXcP/bWcD9HnPT4IGXb5dGYY7HHGJ+MvyJ6JCLzM2Ii32
         BGuKNKVQ7sVneaxm78FLXBaxyd3zKi1ohOy3olJeP0XqNTHcvoT7aXxfTJ7Ra3UL2HFW
         idIWWe7klaOvXwKT4Bl/jHWp80ZStop1Szr9QjfpYoyCbHtbCiB9zbKltpUa95/xBtMt
         ikug==
X-Gm-Message-State: APjAAAVnuo4d0UPZwcLyfqKIqrdJ8criXyxU+7npG0YOaPUiSTszAwnv
        20RfxSM20PU5u00DnS2I9FvG3A==
X-Google-Smtp-Source: APXvYqwo8SFxCbAvCb3he4r6oWWib3Hl6gWYFR5kfupd2w4iv4QPnM3NYBLX+rYv9vWkKmujHvVu0w==
X-Received: by 2002:a63:f923:: with SMTP id h35mr12598461pgi.323.1571434436872;
        Fri, 18 Oct 2019 14:33:56 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id x10sm6547446pgl.53.2019.10.18.14.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2019 14:33:56 -0700 (PDT)
Date:   Fri, 18 Oct 2019 14:33:54 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        c-hbandi@codeaurora.org, bgodavar@codeaurora.org,
        linux-bluetooth@vger.kernel.org,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Bluetooth: hci_qca: Add delay for wcn3990 stability
Message-ID: <20191018213354.GC20212@google.com>
References: <20191017212955.6266-1-jeffrey.l.hugo@gmail.com>
 <20191018180339.GQ87296@google.com>
 <CAOCk7NrN0sjLk3onvZn7+bhs_v3A4H6CHh=XPo_NU2XzUWeEGw@mail.gmail.com>
 <20191018194039.GB20212@google.com>
 <CAOCk7NqacfVLzKueTRTFQ6aWbLXFyMQaQNXeXENzLTyMNLSp9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOCk7NqacfVLzKueTRTFQ6aWbLXFyMQaQNXeXENzLTyMNLSp9w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 18, 2019 at 01:51:39PM -0600, Jeffrey Hugo wrote:
> On Fri, Oct 18, 2019 at 1:40 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > On Fri, Oct 18, 2019 at 12:30:09PM -0600, Jeffrey Hugo wrote:
> > > On Fri, Oct 18, 2019 at 12:03 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> > > >
> > > > On Thu, Oct 17, 2019 at 02:29:55PM -0700, Jeffrey Hugo wrote:
> > > > > On the msm8998 mtp, the response to the baudrate change command is never
> > > > > received.  On the Lenovo Miix 630, the response to the baudrate change
> > > > > command is corrupted - "Frame reassembly failed (-84)".
> > > > >
> > > > > Adding a 50ms delay before re-enabling flow to receive the baudrate change
> > > > > command response from the wcn3990 addesses both issues, and allows
> > > > > bluetooth to become functional.
> > > >
> > > > From my earlier debugging on sdm845 I don't think this is what happens.
> > > > The problem is that the wcn3990 sends the response to the baudrate change
> > > > command using the new baudrate, while the UART on the SoC still operates
> > > > with the prior speed (for details see 2faa3f15fa2f ("Bluetooth: hci_qca:
> > > > wcn3990: Drop baudrate change vendor event"))
> > > >
> > > > IIRC the 50ms delay causes the HCI core to discard the received data,
> > > > which is why the "Frame reassembly failed" message disappears, not
> > > > because the response was received. In theory commit 78e8fa2972e5
> > > > ("Bluetooth: hci_qca: Deassert RTS while baudrate change command")
> > > > should have fixed those messages, do you know if CTS/RTS are connected
> > > > on the Bluetooth UART of the Lenovo Miix 630?
> > >
> > > I was testing with 5.4-rc1 which contains the indicated RTS fix.
> > >
> > > Yes, CTS/RTS are connected on the Lenovo Miix 630.
> > >
> > > I added debug statements which indicated that data was received,
> > > however it was corrupt, and the packet type did not match what was
> > > expected, hence the frame reassembly errors.
> >
> > Do you know if any data is received during the delay? In theory that
> > shouldn't be the case since RTS is deasserted, just double-checking.
> 
> I don't think so, but I've run so many tests, I'm not 100% positive.
> Let me go double check and get back to you.
> 
> >
> > What happens if you add a longer delay (e.g. 1s) before/after setting
> > the host baudrate?
> 
> Hmm, not exactly sure.  I will test.
> 
> >
> > > In response to this patch, Balakrishna pointed me to a bug report
> > > which indicated that some of the UART GPIO lines need to have a bias
> > > applied to prevent errant data from floating lines -
> > >
> > > https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1391888
> >
> > Yeah, that was another source of frame reassembly errors that we were
> > seeing on SDM845.
> >
> > Balakrishna, please post these kind of replies on-list, so that
> > everybody can benefit from possible solutions or contribute to the
> > discussion.
> >
> > > It turns out this fix was never applied to msm8998.  Applying the fix
> > > does cause the the frame reassembly errors to go away, however then
> > > the host SoC never receives the baud rate change response (I increased
> > > the timeout from 2faa3f15fa2f ("Bluetooth: hci_qca: wcn3990: Drop
> > > baudrate change vendor event") to 5 seconds).  As of now, this patch
> > > is still required.
> >
> > Interesting.
> >
> > FTR, this is the full UART pin configuration for cheza (SDM845):
> >
> > &qup_uart6_default {
> >         /* Change pinmux to all 4 pins since CTS and RTS are connected */
> >         pinmux {
> >                 pins = "gpio45", "gpio46",
> >                        "gpio47", "gpio48";
> >         };
> >
> >         pinconf-cts {
> >                 /*
> >                  * Configure a pull-down on 45 (CTS) to match the pull of
> >                  * the Bluetooth module.
> >                  */
> >                 pins = "gpio45";
> >                 bias-pull-down;
> >         };
> >
> >         pinconf-rts-tx {
> >                 /* We'll drive 46 (RTS) and 47 (TX), so no pull */
> >                 pins = "gpio46", "gpio47";
> >                 drive-strength = <2>;
> >                 bias-disable;
> >         };
> >
> >         pinconf-rx {
> >                 /*
> >                  * Configure a pull-up on 48 (RX). This is needed to avoid
> >                  * garbage data when the TX pin of the Bluetooth module is
> >                  * in tri-state (module powered off or not driving the
> >                  * signal yet).
> >                  */
> >                 pins = "gpio48";
> >                 bias-pull-up;
> >         };
> > };
> >
> > Does this correspond to what you tried on the Lenovo Miix 630?
> 
> Which GPIO maps to which pin is different -
> 45 - TX
> 46 - RX
> 47 - CTS
> 48 - RFR (RTS)
> 
> However, accounting for that, yes that corresponds to what I used.

Thanks for re-confirming.

> > > I have no idea why the delay is required, and was hoping that posting
> > > this patch would result in someone else providing some missing pieces
> > > to determine the real root cause.  I suspect that asserting RTS at the
> > > wrong time may cause an issue for the wcn3990, but I have no data nor
> > > documentation to support this guess.  I welcome any further insights
> > > you may have.
> >
> > Unfortunately I don't have a clear suggestion at this point, debugging
> > the original problem which lead to 2faa3f15fa2f ("Bluetooth: hci_qca:
> > wcn3990: Drop baudrate change vendor event") involved quite some time
> > and hooking up a scope/logic analyzer ...
> >
> > I also suspect RTS is involved, and potentially the configuration of
> > the pulls. It might be interesting to analyze the data that leads to
> > the frame assembly error and determine if it is just noise (wrong
> > pulls/drive strength?) or received with a non-matching baud-rate.
> 
> I don't have a scope/logic analyzer, but since I hooked up the
> blsp_bam I'm able to see the raw data from the uart before it gets to
> the HCI stack or anything.  As a side note, having the bam or not
> seemed to have no effect on the issue.

It's not exactly the same though. I suppose with the blsp_bam you only
see the actual data when the UART runs at the same speed as it's
counterpart. With a logic analyzer you can change the speed after
data capture, which might convert apparent garbage into reasonable
data.

> Most of the time the data was one byte (zero), some times it was a
> string of zero bytes.  Rarely it would be random data.

In terms of data ss there difference between a string of zero bytes
and a single zero byte?

From my notes the response (vendor event) to a baudrate change
command on the WCN3990 is:

04 0e 04 01 00 00 00

The tail *might* be the zero(s) you are seeing, and the first part gets
lost for some reason?

A simplified version of the code in question:

  set_RTS(false)

  hci_set_baudrate(br)
  host_set_baudrate(br)

  msleep(50); // why is this needed???
  set_RTS(true)

  // supposedly wcn3990 now sends vendor event using the new baudrate

  wait_for_vendor_event()
    // ok with msleep, otherwise frame reassembly error


Maybe the MSM8998 UART (driver) currently needs the delay to fully switch to
the new baudrate? Perhaps the pinconfig still needs tweaking of some kind?

You said when you apply the full configuration used on cheza you don't
receive the response to the baudrate change command. Does it work when you
only configure the pull-up on the RX (host) pin?
