Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16ECF15ADDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 17:58:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbgBLQ56 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 11:57:58 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:32826 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726982AbgBLQ56 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 11:57:58 -0500
Received: by mail-ua1-f65.google.com with SMTP id w15so1139279uap.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2020 08:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M44H4y8M/omYLEnNOVyeBqCAU1Ni6YwQGOizLsG3AIo=;
        b=jmnYfrArTkQwHk3l1N9dF0vLq9OR6llBC3gvsmoPv/S61Cnp6G9Yfgu3s8tkbbTKPx
         N+AwGJNJux3mxJd0/EQ1+kZUEcIf+Vsj7bF6NI99kgZTgI0dzeCAZzmy7Y9GKoudI9bX
         W+pzFzdEWwHmS7NweegE0B8e5MMwG6ncDZLdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M44H4y8M/omYLEnNOVyeBqCAU1Ni6YwQGOizLsG3AIo=;
        b=kNwL61xo2xzST6wJYOfOHGZqrTYfb8rkCOybzlkSPP5AHJEhaGILSUzPqdjqFMXgDv
         Vjjjee6XXYu+FKOgJL57ZymmBRdizl2imCvhNnveZ8rFF2i+FnglFJNxqNgkXkU3875P
         27EOS+pQzUu+Ne3I90SFo5kHRL913qr5upzN4rmdGLpsh/Z0Lzkf1yTyASTL58w4+fxo
         ur1plvSmKTpo5ceVR/j3H+EbO2HTRVD+u9AcjsguS5x6DopfIqv49dSpddtxUU2a2DU3
         1Nk6A4jdIl/oPP2OnKylWf4ywo0SxBxd8KOZnW/xEeEn5Yef7z1DT/sF3kj7e1WRvZAx
         l2zg==
X-Gm-Message-State: APjAAAUXZbfquiNpRJgJYREyftCvKwaV19U4MacpXH/9N6eygbikYzd7
        xqpEMLRtrBI1zIhXgnO7XNELFQEWb59S/8wa4tlYLg==
X-Google-Smtp-Source: APXvYqxN9LgrkK447vumGG+Tu9aaMLq6r16f1Csp5C7d2PTzDAT5FC7pE1wSe2GYWCm4Goy0qRXvfiKl1LItIjQ9HCY=
X-Received: by 2002:ab0:7802:: with SMTP id x2mr5270088uaq.100.1581526677014;
 Wed, 12 Feb 2020 08:57:57 -0800 (PST)
MIME-Version: 1.0
References: <1581522508-31337-1-git-send-email-gubbaven@codeaurora.org>
In-Reply-To: <1581522508-31337-1-git-send-email-gubbaven@codeaurora.org>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Wed, 12 Feb 2020 08:57:46 -0800
Message-ID: <CANFp7mVGurJ0LG9X9EDoT0j25SoJgXeXpWvAVDymhWYVb3nnbw@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: hci_qca: Bug fixes while collecting
 controller memory dump
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        robh@kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        Claire Chang <tientzu@chromium.org>,
        Sean Paul <seanpaul@chromium.org>, rjliao@codeaurora.org,
        Yoni Shavit <yshavit@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Venkata,

I would suggest removing the memdump_timer entirely and making the
ctrl_memdump_timeout into struct delayed_work.

Instead of using mod_timer to get the callback ready, you would
instead call `queue_delayed_work(qca->workqueue,
&qca->ctrl_memdump_timeout, MEMDUMP_TIMEOUT_MS);` and instead of
del_timer, you would instead
`cancel_delayed_work(&qca->ctrl_memdump_timeout)` if mutex is held or
`cancel_delayed_work_sync(&qca->ctrl_memdump_timeout)` if mutex is not
held.

Other than that, everything else looks good to me.

On Wed, Feb 12, 2020 at 7:51 AM Venkata Lakshmi Narayana Gubba
<gubbaven@codeaurora.org> wrote:
>
> This patch will fix the below issues
>    1.Fixed race conditions while accessing memory dump state flags.
>    2.Updated with actual context of timer in hci_memdump_timeout()
>    3.Updated injecting hardware error event if the dumps failed to receive.
>    4.Once timeout is triggered, stopping the memory dump collections.
>
> Possible scenarios while collecting memory dump:
>
> Scenario 1:
>
> Memdump event from firmware
> Some number of memdump events with seq #
> Hw error event
> Reset
>
> Scenario 2:
>
> Memdump event from firmware
> Some number of memdump events with seq #
> Timeout schedules hw_error_event if hw error event is not received already
> hw_error_event clears the memdump activity
> reset
>
> Scenario 3:
>
> hw_error_event sends memdump command to firmware and waits for completion
> Some number of memdump events with seq #
> hw error event
> reset
>
> Fixes: d841502c79e3 ("Bluetooth: hci_qca: Collect controller memory dump during SSR")
> Reported-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
>  drivers/bluetooth/hci_qca.c | 96 ++++++++++++++++++++++++++++++++-------------
>  1 file changed, 69 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index eacc65b..80ee838 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -29,6 +29,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/serdev.h>
> +#include <linux/mutex.h>
>  #include <asm/unaligned.h>
>
>  #include <net/bluetooth/bluetooth.h>
> @@ -69,7 +70,8 @@ enum qca_flags {
>         QCA_IBS_ENABLED,
>         QCA_DROP_VENDOR_EVENT,
>         QCA_SUSPENDING,
> -       QCA_MEMDUMP_COLLECTION
> +       QCA_MEMDUMP_COLLECTION,
> +       QCA_HW_ERROR_EVENT
>  };
>
>
> @@ -145,11 +147,13 @@ struct qca_data {
>         struct work_struct ws_rx_vote_off;
>         struct work_struct ws_tx_vote_off;
>         struct work_struct ctrl_memdump_evt;
> +       struct work_struct ctrl_memdump_timeout;
>         struct qca_memdump_data *qca_memdump;
>         unsigned long flags;
>         struct completion drop_ev_comp;
>         wait_queue_head_t suspend_wait_q;
>         enum qca_memdump_states memdump_state;
> +       struct mutex hci_memdump_lock;
>
>         /* For debugging purpose */
>         u64 ibs_sent_wacks;
> @@ -524,21 +528,33 @@ static void hci_ibs_wake_retrans_timeout(struct timer_list *t)
>
>  static void hci_memdump_timeout(struct timer_list *t)
>  {
> -       struct qca_data *qca = from_timer(qca, t, tx_idle_timer);
> -       struct hci_uart *hu = qca->hu;
> -       struct qca_memdump_data *qca_memdump = qca->qca_memdump;
> -       char *memdump_buf = qca_memdump->memdump_buf_tail;
> -
> -       bt_dev_err(hu->hdev, "clearing allocated memory due to memdump timeout");
> -       /* Inject hw error event to reset the device and driver. */
> -       hci_reset_dev(hu->hdev);
> -       vfree(memdump_buf);
> -       kfree(qca_memdump);
> -       qca->memdump_state = QCA_MEMDUMP_TIMEOUT;
> +       struct qca_data *qca = from_timer(qca, t, memdump_timer);
> +
> +       queue_work(qca->workqueue, &qca->ctrl_memdump_timeout);
>         del_timer(&qca->memdump_timer);
> -       cancel_work_sync(&qca->ctrl_memdump_evt);
>  }
>
> +static void qca_controller_memdump_timeout(struct work_struct *work)
> +{
> +       struct qca_data *qca = container_of(work, struct qca_data,
> +                                       ctrl_memdump_timeout);
> +       struct hci_uart *hu = qca->hu;
> +
> +       mutex_lock(&qca->hci_memdump_lock);
> +       if (test_bit(QCA_MEMDUMP_COLLECTION, &qca->flags)) {
> +               qca->memdump_state = QCA_MEMDUMP_TIMEOUT;
> +               if (!test_bit(QCA_HW_ERROR_EVENT, &qca->flags)) {
> +                       /* Inject hw error event to reset the device
> +                        * and driver.
> +                        */
> +                       hci_reset_dev(hu->hdev);
> +               }
> +       }
> +
> +       mutex_unlock(&qca->hci_memdump_lock);
> +}
> +
> +
>  /* Initialize protocol */
>  static int qca_open(struct hci_uart *hu)
>  {
> @@ -558,6 +574,7 @@ static int qca_open(struct hci_uart *hu)
>         skb_queue_head_init(&qca->tx_wait_q);
>         skb_queue_head_init(&qca->rx_memdump_q);
>         spin_lock_init(&qca->hci_ibs_lock);
> +       mutex_init(&qca->hci_memdump_lock);
>         qca->workqueue = alloc_ordered_workqueue("qca_wq", 0);
>         if (!qca->workqueue) {
>                 BT_ERR("QCA Workqueue not initialized properly");
> @@ -570,6 +587,7 @@ static int qca_open(struct hci_uart *hu)
>         INIT_WORK(&qca->ws_rx_vote_off, qca_wq_serial_rx_clock_vote_off);
>         INIT_WORK(&qca->ws_tx_vote_off, qca_wq_serial_tx_clock_vote_off);
>         INIT_WORK(&qca->ctrl_memdump_evt, qca_controller_memdump);
> +       INIT_WORK(&qca->ctrl_memdump_timeout, qca_controller_memdump_timeout);
>         init_waitqueue_head(&qca->suspend_wait_q);
>
>         qca->hu = hu;
> @@ -963,11 +981,20 @@ static void qca_controller_memdump(struct work_struct *work)
>
>         while ((skb = skb_dequeue(&qca->rx_memdump_q))) {
>
> +               mutex_lock(&qca->hci_memdump_lock);
> +               /* Skip processing the received packets if timeout detected. */
> +               if (qca->memdump_state == QCA_MEMDUMP_TIMEOUT) {
> +                       mutex_unlock(&qca->hci_memdump_lock);
> +                       return;
> +               }
> +
>                 if (!qca_memdump) {
>                         qca_memdump = kzalloc(sizeof(struct qca_memdump_data),
>                                               GFP_ATOMIC);
> -                       if (!qca_memdump)
> +                       if (!qca_memdump) {
> +                               mutex_unlock(&qca->hci_memdump_lock);
>                                 return;
> +                       }
>
>                         qca->qca_memdump = qca_memdump;
>                 }
> @@ -992,6 +1019,7 @@ static void qca_controller_memdump(struct work_struct *work)
>                         if (!(dump_size)) {
>                                 bt_dev_err(hu->hdev, "Rx invalid memdump size");
>                                 kfree_skb(skb);
> +                               mutex_unlock(&qca->hci_memdump_lock);
>                                 return;
>                         }
>
> @@ -1016,6 +1044,7 @@ static void qca_controller_memdump(struct work_struct *work)
>                         kfree(qca_memdump);
>                         kfree_skb(skb);
>                         qca->qca_memdump = NULL;
> +                       mutex_unlock(&qca->hci_memdump_lock);
>                         return;
>                 }
>
> @@ -1050,12 +1079,16 @@ static void qca_controller_memdump(struct work_struct *work)
>                         kfree(qca->qca_memdump);
>                         qca->qca_memdump = NULL;
>                         qca->memdump_state = QCA_MEMDUMP_COLLECTED;
> +                       clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
>                 }
> +
> +               mutex_unlock(&qca->hci_memdump_lock);
>         }
>
>  }
>
> -int qca_controller_memdump_event(struct hci_dev *hdev, struct sk_buff *skb)
> +static int qca_controller_memdump_event(struct hci_dev *hdev,
> +                                       struct sk_buff *skb)
>  {
>         struct hci_uart *hu = hci_get_drvdata(hdev);
>         struct qca_data *qca = hu->priv;
> @@ -1406,30 +1439,21 @@ static void qca_wait_for_dump_collection(struct hci_dev *hdev)
>  {
>         struct hci_uart *hu = hci_get_drvdata(hdev);
>         struct qca_data *qca = hu->priv;
> -       struct qca_memdump_data *qca_memdump = qca->qca_memdump;
> -       char *memdump_buf = NULL;
>
>         wait_on_bit_timeout(&qca->flags, QCA_MEMDUMP_COLLECTION,
>                             TASK_UNINTERRUPTIBLE, MEMDUMP_TIMEOUT_MS);
>
>         clear_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
> -       if (qca->memdump_state == QCA_MEMDUMP_IDLE) {
> -               bt_dev_err(hu->hdev, "Clearing the buffers due to timeout");
> -               if (qca_memdump)
> -                       memdump_buf = qca_memdump->memdump_buf_tail;
> -               vfree(memdump_buf);
> -               kfree(qca_memdump);
> -               qca->memdump_state = QCA_MEMDUMP_TIMEOUT;
> -               del_timer(&qca->memdump_timer);
> -               cancel_work_sync(&qca->ctrl_memdump_evt);
> -       }
>  }
>
>  static void qca_hw_error(struct hci_dev *hdev, u8 code)
>  {
>         struct hci_uart *hu = hci_get_drvdata(hdev);
>         struct qca_data *qca = hu->priv;
> +       struct qca_memdump_data *qca_memdump = qca->qca_memdump;
> +       char *memdump_buf = NULL;
>
> +       set_bit(QCA_HW_ERROR_EVENT, &qca->flags);
>         bt_dev_info(hdev, "mem_dump_status: %d", qca->memdump_state);
>
>         if (qca->memdump_state == QCA_MEMDUMP_IDLE) {
> @@ -1449,6 +1473,24 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>                 bt_dev_info(hdev, "waiting for dump to complete");
>                 qca_wait_for_dump_collection(hdev);
>         }
> +
> +       if (qca->memdump_state != QCA_MEMDUMP_COLLECTED) {
> +               bt_dev_err(hu->hdev, "clearing allocated memory due to memdump timeout");
> +               mutex_lock(&qca->hci_memdump_lock);
> +               if (qca_memdump)
> +                       memdump_buf = qca_memdump->memdump_buf_head;
> +               vfree(memdump_buf);
> +               kfree(qca_memdump);
> +               qca->qca_memdump = NULL;
> +               qca->memdump_state = QCA_MEMDUMP_TIMEOUT;
> +               del_timer(&qca->memdump_timer);
> +               skb_queue_purge(&qca->rx_memdump_q);
> +               mutex_unlock(&qca->hci_memdump_lock);
> +               cancel_work_sync(&qca->ctrl_memdump_timeout);
> +               cancel_work_sync(&qca->ctrl_memdump_evt);
> +       }
> +
> +       clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
>  }
>
>  static void qca_cmd_timeout(struct hci_dev *hdev)
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>

Thanks
Abhishek
