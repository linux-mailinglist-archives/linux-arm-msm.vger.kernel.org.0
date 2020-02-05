Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC532153109
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 13:49:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726822AbgBEMtF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Feb 2020 07:49:05 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:22937 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726575AbgBEMtE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 07:49:04 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580906944; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=eqUW7ZoIeLw5T7lHqCv2OK8ZfINQ3H2WObQzxLYs6s8=;
 b=pcG/d8lp9ujm6+PDL117+o6xAawUimaaXNSdNCdJXYVgvvCw50rx8dUjr8YkKXwb0cqcglfc
 oYoBQBhL/YxrpKnIjP4y2D++pcf/4+42uQgsg+uRGE3Al0tuny4setgNUvC4h8g9EotfMTPI
 hp5FyMdmEdV3zFntiI1a957QMvY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3ab9bb.7f37c12caf80-smtp-out-n01;
 Wed, 05 Feb 2020 12:48:59 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EC708C447A1; Wed,  5 Feb 2020 12:48:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: gubbaven)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1C8C8C43383;
        Wed,  5 Feb 2020 12:48:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 05 Feb 2020 18:18:57 +0530
From:   gubbaven@codeaurora.org
To:     Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        robh@kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        tientzu@chromium.org, seanpaul@chromium.org, rjliao@codeaurora.org,
        Yoni Shavit <yshavit@google.com>
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Bug fixes while collecting
 controller memory dump
In-Reply-To: <CANFp7mXgvfQGw0bc0dwNXg9KME1XD1zYGtPdEFWbM20NJpKtzQ@mail.gmail.com>
References: <1580832929-2067-1-git-send-email-gubbaven@codeaurora.org>
 <CANFp7mXgvfQGw0bc0dwNXg9KME1XD1zYGtPdEFWbM20NJpKtzQ@mail.gmail.com>
Message-ID: <d89347d22c12ffca5ccf4e18e0c716ab@codeaurora.org>
X-Sender: gubbaven@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Abhishek,

On 2020-02-05 04:40, Abhishek Pandit-Subedi wrote:
> Hi Venkata,
> 
> Per our earlier review on chromium gerrit:
> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/1992966
> 
> I'm not too keen on the change from mutex to spinlock because it's
> made the code more complex.
[Venkata] :

We have moved from mutex to spinlock as timer callback function is 
getting executed under interrupt context and not under process context.

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
> hw_error_event sends memdump command to firmware and waits for 
> completion
> memdump event with seq#
> hw error event
> reset
> 
> Does this look right? Could you add this to either the commit message
> or as a comment in one of the functions so that it's easier to
> understand what is the expected order of events.

[Venkata] :

The scenarios you have mentioned look right.In case of time out scenario
hw error event is injected if it is not received already.
Sure we will update the scenarios information in next patch set.

> 
> On Tue, Feb 4, 2020 at 8:16 AM Venkata Lakshmi Narayana Gubba
> <gubbaven@codeaurora.org> wrote:
>> 
>> This patch will fix the below issues
>>    1.Fixed race conditions while accessing memory dump state flags.
>>    2.Updated with actual context of timer in hci_memdump_timeout()
>>    3.Updated injecting hardware error event if the dumps failed to 
>> receive.
>>    4.Once timeout is triggered, stopping the memory dump collections.
>> 
>> Fixes: d841502c79e3 ("Bluetooth: hci_qca: Collect controller memory 
>> dump during SSR")
>> Reported-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
>> Signed-off-by: Venkata Lakshmi Narayana Gubba 
>> <gubbaven@codeaurora.org>
>> ---
>>  drivers/bluetooth/hci_qca.c | 104 
>> ++++++++++++++++++++++++++++++++++++++------
>>  1 file changed, 90 insertions(+), 14 deletions(-)
>> 
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index eacc65b..ea956c3 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -69,7 +69,8 @@ enum qca_flags {
>>         QCA_IBS_ENABLED,
>>         QCA_DROP_VENDOR_EVENT,
>>         QCA_SUSPENDING,
>> -       QCA_MEMDUMP_COLLECTION
>> +       QCA_MEMDUMP_COLLECTION,
>> +       QCA_HW_ERROR_EVENT
>>  };
>> 
>> 
>> @@ -150,6 +151,7 @@ struct qca_data {
>>         struct completion drop_ev_comp;
>>         wait_queue_head_t suspend_wait_q;
>>         enum qca_memdump_states memdump_state;
>> +       spinlock_t hci_memdump_lock;
> In an earlier revision of this patch, you had this lock as a mutex.
> Why change it from mutex to spinlock_t? I think this has made your
> change more complex since you have to unlock during the middle of an
> operation more often (i.e. since it can block)

[Venkata] :

We have created a scenario to trigger timer callback function 
hci_memdump_timeout()
and we have observed that kernel is going to panic state with mutex 
implementation.
We got the following error.It seems timer callback function is getting 
executed
in interuupt context and not under process context.After moving to 
spinlock we dont
see these issues.

[  182.203510] BUG: sleeping function called from invalid context at 
/mnt/host/source/src/third_party/kernel/v5.4/kernel/locking/mutex.c:281

[  182.216198] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 0, 
name: swapper/3

[  182.224460] ------------[ cut here ]------------

[  182.229254] kernel BUG at 
/mnt/host/source/src/third_party/kernel/v5.4/kernel/sched/core.c:6787!

[  182.238331] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP

[  182.411931] Call trace:

[  182.414489]  ___might_sleep+0x11c/0x120

[  182.418442]  __might_sleep+0x50/0x84

[  182.422127]  mutex_lock+0x28/0x60

[  182.425554]  hci_memdump_timeout+0x50/0x90 [hci_uart]

[  182.430755]  call_timer_fn+0xc4/0x1a8

[  182.434532]  __run_timers+0x214/0x2c0

[  182.438298]  run_timer_softirq+0x24/0x44

[  182.442343]  __do_softirq+0x164/0x30c

[  182.446123]  irq_exit+0xa0/0xa4

[  182.449361]  __handle_domain_irq+0x8c/0xc4

[  182.453572]  gic_handle_irq+0xd0/0x178

[  182.457434]  el1_irq+0xb8/0x180

[  182.460710]  cpuidle_enter_state+0xf8/0x27c

[  182.465059]  cpuidle_enter+0x38/0x4c

[  182.468778]  do_idle+0x1a4/0x290

[  182.472140]  cpu_startup_entry+0x24/0x28

[  182.476223]  secondary_start_kernel+0x148/0x154

[  182.480934] Code: 913ba400 9400a9f4 d53b4228 12190109 (d4210000)

[  182.487244] ---[ end trace 8d7b29f94068a7cf ]---

[  182.523162] Kernel panic - not syncing: Fatal exception in interrupt


>> 
>>         /* For debugging purpose */
>>         u64 ibs_sent_wacks;
>> @@ -524,19 +526,19 @@ static void hci_ibs_wake_retrans_timeout(struct 
>> timer_list *t)
>> 
>>  static void hci_memdump_timeout(struct timer_list *t)
>>  {
>> -       struct qca_data *qca = from_timer(qca, t, tx_idle_timer);
>> +       struct qca_data *qca = from_timer(qca, t, memdump_timer);
>>         struct hci_uart *hu = qca->hu;
>> -       struct qca_memdump_data *qca_memdump = qca->qca_memdump;
>> -       char *memdump_buf = qca_memdump->memdump_buf_tail;
>> +       unsigned long flags;
>> 
>> -       bt_dev_err(hu->hdev, "clearing allocated memory due to memdump 
>> timeout");
>> -       /* Inject hw error event to reset the device and driver. */
>> -       hci_reset_dev(hu->hdev);
>> -       vfree(memdump_buf);
>> -       kfree(qca_memdump);
>> +       spin_lock_irqsave(&qca->hci_memdump_lock, flags);
>>         qca->memdump_state = QCA_MEMDUMP_TIMEOUT;
>> +       if (!test_bit(QCA_HW_ERROR_EVENT, &qca->flags)) {
>> +               /* Inject hw error event to reset the device and 
>> driver. */
>> +               hci_reset_dev(hu->hdev);
>> +       }
>> +
>>         del_timer(&qca->memdump_timer);
>> -       cancel_work_sync(&qca->ctrl_memdump_evt);
>> +       spin_unlock_irqrestore(&qca->hci_memdump_lock, flags);
> 
> Missing cancel_work_sync (not sure if intentional but it's included in
> qca_wait_for_dump_collection so it should probably be here too)
[Venkata] :

As timer callback function is running under interrupt context
and cancel_work_sync() might go to sleep, we got kernel panic
for calling this function in timer callback function.
So we have moved cancel_work_sync() to qca_hw_error() and handled
under QCA_MEMDUMP_TIMEOUT scenario.

> 
>>  }
>> 
>>  /* Initialize protocol */
>> @@ -558,6 +560,7 @@ static int qca_open(struct hci_uart *hu)
>>         skb_queue_head_init(&qca->tx_wait_q);
>>         skb_queue_head_init(&qca->rx_memdump_q);
>>         spin_lock_init(&qca->hci_ibs_lock);
>> +       spin_lock_init(&qca->hci_memdump_lock);
>>         qca->workqueue = alloc_ordered_workqueue("qca_wq", 0);
>>         if (!qca->workqueue) {
>>                 BT_ERR("QCA Workqueue not initialized properly");
>> @@ -960,14 +963,25 @@ static void qca_controller_memdump(struct 
>> work_struct *work)
>>         char nullBuff[QCA_DUMP_PACKET_SIZE] = { 0 };
>>         u16 seq_no;
>>         u32 dump_size;
>> +       unsigned long flags;
>> 
>>         while ((skb = skb_dequeue(&qca->rx_memdump_q))) {
>> 
>> +               spin_lock_irqsave(&qca->hci_memdump_lock, flags);
>> +               /* Skip processing the received packets if timeout 
>> detected. */
>> +               if (qca->memdump_state == QCA_MEMDUMP_TIMEOUT) {
>> +                       spin_unlock_irqrestore(&qca->hci_memdump_lock, 
>> flags);
>> +                       return;
>> +               }
>> +
>>                 if (!qca_memdump) {
>>                         qca_memdump = kzalloc(sizeof(struct 
>> qca_memdump_data),
>>                                               GFP_ATOMIC);
>> -                       if (!qca_memdump)
>> +                       if (!qca_memdump) {
>> +                               
>> spin_unlock_irqrestore(&qca->hci_memdump_lock,
>> +                                                               
>> flags);
>>                                 return;
>> +                       }
>> 
>>                         qca->qca_memdump = qca_memdump;
>>                 }
>> @@ -992,6 +1006,8 @@ static void qca_controller_memdump(struct 
>> work_struct *work)
>>                         if (!(dump_size)) {
>>                                 bt_dev_err(hu->hdev, "Rx invalid 
>> memdump size");
>>                                 kfree_skb(skb);
>> +                               
>> spin_unlock_irqrestore(&qca->hci_memdump_lock,
>> +                                                       flags);
>>                                 return;
>>                         }
>> 
>> @@ -1001,7 +1017,24 @@ static void qca_controller_memdump(struct 
>> work_struct *work)
>>                                   
>> msecs_to_jiffies(MEMDUMP_TIMEOUT_MS)));
>> 
>>                         skb_pull(skb, sizeof(dump_size));
>> +
>> +                       /* vmalloc() might go to sleep while trying to 
>> allocate
>> +                        * memory.As calling sleep function under spin 
>> lock is
>> +                        * not allowed so unlocking spin lock and will 
>> be locked
>> +                        * again after vmalloc().
>> +                        */
>> +                       spin_unlock_irqrestore(&qca->hci_memdump_lock, 
>> flags);
>>                         memdump_buf = vmalloc(dump_size);
>> +                       spin_lock_irqsave(&qca->hci_memdump_lock, 
>> flags);
>> +                       /* Skip processing the received packets if 
>> timeout
>> +                        * detected.
>> +                        */
>> +                       if (qca->memdump_state == QCA_MEMDUMP_TIMEOUT) 
>> {
>> +                               
>> spin_unlock_irqrestore(&qca->hci_memdump_lock,
>> +                                                       flags);
>> +                               return;
>> +                       }
>> +
>>                         qca_memdump->memdump_buf_head = memdump_buf;
>>                         qca_memdump->memdump_buf_tail = memdump_buf;
>>                 }
>> @@ -1016,6 +1049,7 @@ static void qca_controller_memdump(struct 
>> work_struct *work)
>>                         kfree(qca_memdump);
>>                         kfree_skb(skb);
>>                         qca->qca_memdump = NULL;
>> +                       spin_unlock_irqrestore(&qca->hci_memdump_lock, 
>> flags);
>>                         return;
>>                 }
>> 
>> @@ -1044,18 +1078,37 @@ static void qca_controller_memdump(struct 
>> work_struct *work)
>>                         bt_dev_info(hu->hdev, "QCA writing crash dump 
>> of size %d bytes",
>>                                    qca_memdump->received_dump);
>>                         memdump_buf = qca_memdump->memdump_buf_head;
>> +
>> +                       /* dev_coredumpv() might go to sleep.As 
>> calling sleep
>> +                        * function under spin lock is not allowed so 
>> unlocking
>> +                        * spin lock and will be locked again after
>> +                        * dev_coredumpv().
>> +                        */
>> +                       spin_unlock_irqrestore(&qca->hci_memdump_lock,
>> +                                               flags);
>>                         dev_coredumpv(&hu->serdev->dev, memdump_buf,
>>                                       qca_memdump->received_dump, 
>> GFP_KERNEL);
>> +                       spin_lock_irqsave(&qca->hci_memdump_lock, 
>> flags);
>> +                       if (qca->memdump_state == QCA_MEMDUMP_TIMEOUT) 
>> {
>> +                               
>> spin_unlock_irqrestore(&qca->hci_memdump_lock,
>> +                                                       flags);
>> +                               return;
>> +                       }
>> +
>>                         del_timer(&qca->memdump_timer);
>>                         kfree(qca->qca_memdump);
>>                         qca->qca_memdump = NULL;
>>                         qca->memdump_state = QCA_MEMDUMP_COLLECTED;
>> +                       clear_bit(QCA_MEMDUMP_COLLECTION, 
>> &qca->flags);
>>                 }
>> +
>> +               spin_unlock_irqrestore(&qca->hci_memdump_lock, flags);
>>         }
>> 
>>  }
>> 
>> -int qca_controller_memdump_event(struct hci_dev *hdev, struct sk_buff 
>> *skb)
>> +static int qca_controller_memdump_event(struct hci_dev *hdev,
>> +                                       struct sk_buff *skb)
>>  {
>>         struct hci_uart *hu = hci_get_drvdata(hdev);
>>         struct qca_data *qca = hu->priv;
>> @@ -1408,19 +1461,25 @@ static void 
>> qca_wait_for_dump_collection(struct hci_dev *hdev)
>>         struct qca_data *qca = hu->priv;
>>         struct qca_memdump_data *qca_memdump = qca->qca_memdump;
>>         char *memdump_buf = NULL;
>> +       unsigned long flags;
>> 
>>         wait_on_bit_timeout(&qca->flags, QCA_MEMDUMP_COLLECTION,
>>                             TASK_UNINTERRUPTIBLE, MEMDUMP_TIMEOUT_MS);
>> 
>>         clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
>> -       if (qca->memdump_state == QCA_MEMDUMP_IDLE) {
>> +       if (qca->memdump_state == QCA_MEMDUMP_IDLE ||
>> +           qca->memdump_state == QCA_MEMDUMP_COLLECTING) {
>>                 bt_dev_err(hu->hdev, "Clearing the buffers due to 
>> timeout");
>> +               spin_lock_irqsave(&qca->hci_memdump_lock, flags);
>>                 if (qca_memdump)
>> -                       memdump_buf = qca_memdump->memdump_buf_tail;
>> +                       memdump_buf = qca_memdump->memdump_buf_head;
>>                 vfree(memdump_buf);
>>                 kfree(qca_memdump);
>> +               qca->qca_memdump = NULL;
>>                 qca->memdump_state = QCA_MEMDUMP_TIMEOUT;
>>                 del_timer(&qca->memdump_timer);
>> +               skb_queue_purge(&qca->rx_memdump_q);
>> +               spin_unlock_irqrestore(&qca->hci_memdump_lock, flags);
>>                 cancel_work_sync(&qca->ctrl_memdump_evt);
>>         }
>>  }
>> @@ -1429,7 +1488,11 @@ static void qca_hw_error(struct hci_dev *hdev, 
>> u8 code)
>>  {
>>         struct hci_uart *hu = hci_get_drvdata(hdev);
>>         struct qca_data *qca = hu->priv;
>> +       struct qca_memdump_data *qca_memdump = qca->qca_memdump;
>> +       char *memdump_buf = NULL;
>> +       unsigned long flags;
>> 
>> +       set_bit(QCA_HW_ERROR_EVENT, &qca->flags);
>>         bt_dev_info(hdev, "mem_dump_status: %d", qca->memdump_state);
>> 
>>         if (qca->memdump_state == QCA_MEMDUMP_IDLE) {
>> @@ -1448,7 +1511,20 @@ static void qca_hw_error(struct hci_dev *hdev, 
>> u8 code)
>>                  */
>>                 bt_dev_info(hdev, "waiting for dump to complete");
>>                 qca_wait_for_dump_collection(hdev);
>> +       } else if (qca->memdump_state == QCA_MEMDUMP_TIMEOUT) {
>> +               bt_dev_err(hu->hdev, "clearing allocated memory due to 
>> memdump timeout");
>> +               spin_lock_irqsave(&qca->hci_memdump_lock, flags);
>> +               if (qca_memdump)
>> +                       memdump_buf = qca_memdump->memdump_buf_head;
>> +               vfree(memdump_buf);
>> +               kfree(qca_memdump);
>> +               qca->qca_memdump = NULL;
>> +               skb_queue_purge(&qca->rx_memdump_q);
>> +               spin_unlock_irqrestore(&qca->hci_memdump_lock, flags);
>> +               cancel_work_sync(&qca->ctrl_memdump_evt);
>>         }
>> +
>> +       clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
>>  }
>> 
>>  static void qca_cmd_timeout(struct hci_dev *hdev)
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>> member
>> of Code Aurora Forum, hosted by The Linux Foundation
>> 

Regards,
Venkata.
