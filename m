Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 401E4DDAA6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2019 21:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbfJSTTn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Oct 2019 15:19:43 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:33758 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbfJSTTn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Oct 2019 15:19:43 -0400
Received: from marcel-macbook.fritz.box (p4FEFC197.dip0.t-ipconnect.de [79.239.193.151])
        by mail.holtmann.org (Postfix) with ESMTPSA id D9D2CCED0E;
        Sat, 19 Oct 2019 21:28:40 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
Subject: Re: [PATCH] Bluetooth: hci_qca: Add delay for wcn3990 stability
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20191018213354.GC20212@google.com>
Date:   Sat, 19 Oct 2019 21:19:40 +0200
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        c-hbandi@codeaurora.org, bgodavar@codeaurora.org,
        linux-bluetooth@vger.kernel.org,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <1E6A718E-ABEA-4B68-9A5A-C34880273550@holtmann.org>
References: <20191017212955.6266-1-jeffrey.l.hugo@gmail.com>
 <20191018180339.GQ87296@google.com>
 <CAOCk7NrN0sjLk3onvZn7+bhs_v3A4H6CHh=XPo_NU2XzUWeEGw@mail.gmail.com>
 <20191018194039.GB20212@google.com>
 <CAOCk7NqacfVLzKueTRTFQ6aWbLXFyMQaQNXeXENzLTyMNLSp9w@mail.gmail.com>
 <20191018213354.GC20212@google.com>
To:     Matthias Kaehlcke <mka@chromium.org>
X-Mailer: Apple Mail (2.3594.4.19)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias,

>>>>>> On the msm8998 mtp, the response to the baudrate change command is never
>>>>>> received.  On the Lenovo Miix 630, the response to the baudrate change
>>>>>> command is corrupted - "Frame reassembly failed (-84)".
>>>>>> 
>>>>>> Adding a 50ms delay before re-enabling flow to receive the baudrate change
>>>>>> command response from the wcn3990 addesses both issues, and allows
>>>>>> bluetooth to become functional.
>>>>> 
>>>>> From my earlier debugging on sdm845 I don't think this is what happens.
>>>>> The problem is that the wcn3990 sends the response to the baudrate change
>>>>> command using the new baudrate, while the UART on the SoC still operates
>>>>> with the prior speed (for details see 2faa3f15fa2f ("Bluetooth: hci_qca:
>>>>> wcn3990: Drop baudrate change vendor event"))
>>>>> 
>>>>> IIRC the 50ms delay causes the HCI core to discard the received data,
>>>>> which is why the "Frame reassembly failed" message disappears, not
>>>>> because the response was received. In theory commit 78e8fa2972e5
>>>>> ("Bluetooth: hci_qca: Deassert RTS while baudrate change command")
>>>>> should have fixed those messages, do you know if CTS/RTS are connected
>>>>> on the Bluetooth UART of the Lenovo Miix 630?
>>>> 
>>>> I was testing with 5.4-rc1 which contains the indicated RTS fix.
>>>> 
>>>> Yes, CTS/RTS are connected on the Lenovo Miix 630.
>>>> 
>>>> I added debug statements which indicated that data was received,
>>>> however it was corrupt, and the packet type did not match what was
>>>> expected, hence the frame reassembly errors.
>>> 
>>> Do you know if any data is received during the delay? In theory that
>>> shouldn't be the case since RTS is deasserted, just double-checking.
>> 
>> I don't think so, but I've run so many tests, I'm not 100% positive.
>> Let me go double check and get back to you.
>> 
>>> 
>>> What happens if you add a longer delay (e.g. 1s) before/after setting
>>> the host baudrate?
>> 
>> Hmm, not exactly sure.  I will test.
>> 
>>> 
>>>> In response to this patch, Balakrishna pointed me to a bug report
>>>> which indicated that some of the UART GPIO lines need to have a bias
>>>> applied to prevent errant data from floating lines -
>>>> 
>>>> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1391888
>>> 
>>> Yeah, that was another source of frame reassembly errors that we were
>>> seeing on SDM845.
>>> 
>>> Balakrishna, please post these kind of replies on-list, so that
>>> everybody can benefit from possible solutions or contribute to the
>>> discussion.
>>> 
>>>> It turns out this fix was never applied to msm8998.  Applying the fix
>>>> does cause the the frame reassembly errors to go away, however then
>>>> the host SoC never receives the baud rate change response (I increased
>>>> the timeout from 2faa3f15fa2f ("Bluetooth: hci_qca: wcn3990: Drop
>>>> baudrate change vendor event") to 5 seconds).  As of now, this patch
>>>> is still required.
>>> 
>>> Interesting.
>>> 
>>> FTR, this is the full UART pin configuration for cheza (SDM845):
>>> 
>>> &qup_uart6_default {
>>>        /* Change pinmux to all 4 pins since CTS and RTS are connected */
>>>        pinmux {
>>>                pins = "gpio45", "gpio46",
>>>                       "gpio47", "gpio48";
>>>        };
>>> 
>>>        pinconf-cts {
>>>                /*
>>>                 * Configure a pull-down on 45 (CTS) to match the pull of
>>>                 * the Bluetooth module.
>>>                 */
>>>                pins = "gpio45";
>>>                bias-pull-down;
>>>        };
>>> 
>>>        pinconf-rts-tx {
>>>                /* We'll drive 46 (RTS) and 47 (TX), so no pull */
>>>                pins = "gpio46", "gpio47";
>>>                drive-strength = <2>;
>>>                bias-disable;
>>>        };
>>> 
>>>        pinconf-rx {
>>>                /*
>>>                 * Configure a pull-up on 48 (RX). This is needed to avoid
>>>                 * garbage data when the TX pin of the Bluetooth module is
>>>                 * in tri-state (module powered off or not driving the
>>>                 * signal yet).
>>>                 */
>>>                pins = "gpio48";
>>>                bias-pull-up;
>>>        };
>>> };
>>> 
>>> Does this correspond to what you tried on the Lenovo Miix 630?
>> 
>> Which GPIO maps to which pin is different -
>> 45 - TX
>> 46 - RX
>> 47 - CTS
>> 48 - RFR (RTS)
>> 
>> However, accounting for that, yes that corresponds to what I used.
> 
> Thanks for re-confirming.
> 
>>>> I have no idea why the delay is required, and was hoping that posting
>>>> this patch would result in someone else providing some missing pieces
>>>> to determine the real root cause.  I suspect that asserting RTS at the
>>>> wrong time may cause an issue for the wcn3990, but I have no data nor
>>>> documentation to support this guess.  I welcome any further insights
>>>> you may have.
>>> 
>>> Unfortunately I don't have a clear suggestion at this point, debugging
>>> the original problem which lead to 2faa3f15fa2f ("Bluetooth: hci_qca:
>>> wcn3990: Drop baudrate change vendor event") involved quite some time
>>> and hooking up a scope/logic analyzer ...
>>> 
>>> I also suspect RTS is involved, and potentially the configuration of
>>> the pulls. It might be interesting to analyze the data that leads to
>>> the frame assembly error and determine if it is just noise (wrong
>>> pulls/drive strength?) or received with a non-matching baud-rate.
>> 
>> I don't have a scope/logic analyzer, but since I hooked up the
>> blsp_bam I'm able to see the raw data from the uart before it gets to
>> the HCI stack or anything.  As a side note, having the bam or not
>> seemed to have no effect on the issue.
> 
> It's not exactly the same though. I suppose with the blsp_bam you only
> see the actual data when the UART runs at the same speed as it's
> counterpart. With a logic analyzer you can change the speed after
> data capture, which might convert apparent garbage into reasonable
> data.
> 
>> Most of the time the data was one byte (zero), some times it was a
>> string of zero bytes.  Rarely it would be random data.
> 
> In terms of data ss there difference between a string of zero bytes
> and a single zero byte?
> 
> From my notes the response (vendor event) to a baudrate change
> command on the WCN3990 is:
> 
> 04 0e 04 01 00 00 00
> 
> The tail *might* be the zero(s) you are seeing, and the first part gets
> lost for some reason?

you could allow the zero bytes be a valid sequence. See BCM_RECV_NULL for an example on how to include that into the H:4 receive code. Then remove the extra msleep and run btmon to see if you get zero bytes and how many.

Regards

Marcel

