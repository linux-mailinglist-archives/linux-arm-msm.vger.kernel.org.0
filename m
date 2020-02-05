Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17CF8152752
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 09:03:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbgBEIDv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>); Wed, 5 Feb 2020 03:03:51 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:46938 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbgBEIDv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 03:03:51 -0500
Received: from marcel-macpro.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id AA2E6CECC4;
        Wed,  5 Feb 2020 09:13:10 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Bug fixes while collecting
 controller memory dump
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <CANFp7mXgvfQGw0bc0dwNXg9KME1XD1zYGtPdEFWbM20NJpKtzQ@mail.gmail.com>
Date:   Wed, 5 Feb 2020 09:03:48 +0100
Cc:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        robh@kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        tientzu@chromium.org, seanpaul@chromium.org, rjliao@codeaurora.org,
        Yoni Shavit <yshavit@google.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <340089F1-166F-4C7C-8CB1-2D37DF11701E@holtmann.org>
References: <1580832929-2067-1-git-send-email-gubbaven@codeaurora.org>
 <CANFp7mXgvfQGw0bc0dwNXg9KME1XD1zYGtPdEFWbM20NJpKtzQ@mail.gmail.com>
To:     Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Abhishek,

> Per our earlier review on chromium gerrit:
> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1992966
> 
> I'm not too keen on the change from mutex to spinlock because it's
> made the code more complex.
> 
> Also, it has been a couple weeks since my last review and I've lost
> the context of what order of events are supposed to happen (making
> reviewing the sequencing hard).
> 
> Good case:
> 
> Memdump event from firmware
> Some number of memdump events with seq #
> Hw error event
> Reset
> 
> Timeout case:
> 
> Memdump event from firmware
> Some number of memdump events with seq #
> Timeout schedules hw_error_event
> hw_error_event clears the memdump activity
> reset
> 
> Software memdump:
> 
> hw_error_event sends memdump command to firmware and waits for completion
> memdump event with seq#
> hw error event
> reset
> 
> Does this look right? Could you add this to either the commit message
> or as a comment in one of the functions so that it's easier to
> understand what is the expected order of events.
> 
> On Tue, Feb 4, 2020 at 8:16 AM Venkata Lakshmi Narayana Gubba
> <gubbaven@codeaurora.org> wrote:
>> 
>> This patch will fix the below issues
>>   1.Fixed race conditions while accessing memory dump state flags.
>>   2.Updated with actual context of timer in hci_memdump_timeout()
>>   3.Updated injecting hardware error event if the dumps failed to receive.
>>   4.Once timeout is triggered, stopping the memory dump collections.
>> 
>> Fixes: d841502c79e3 ("Bluetooth: hci_qca: Collect controller memory dump during SSR")
>> Reported-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
>> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
>> ---
>> drivers/bluetooth/hci_qca.c | 104 ++++++++++++++++++++++++++++++++++++++------
>> 1 file changed, 90 insertions(+), 14 deletions(-)
>> 
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index eacc65b..ea956c3 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -69,7 +69,8 @@ enum qca_flags {
>>        QCA_IBS_ENABLED,
>>        QCA_DROP_VENDOR_EVENT,
>>        QCA_SUSPENDING,
>> -       QCA_MEMDUMP_COLLECTION
>> +       QCA_MEMDUMP_COLLECTION,
>> +       QCA_HW_ERROR_EVENT
>> };
>> 
>> 
>> @@ -150,6 +151,7 @@ struct qca_data {
>>        struct completion drop_ev_comp;
>>        wait_queue_head_t suspend_wait_q;
>>        enum qca_memdump_states memdump_state;
>> +       spinlock_t hci_memdump_lock;
> In an earlier revision of this patch, you had this lock as a mutex.
> Why change it from mutex to spinlock_t? I think this has made your
> change more complex since you have to unlock during the middle of an
> operation more often (i.e. since it can block)

I agree that we should try to keep a mutex since all event processing in Bluetooth core happens in a workqueue anyway.

Regards

Marcel

