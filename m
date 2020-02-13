Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E35115C94C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2020 18:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728138AbgBMRSa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Feb 2020 12:18:30 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:39922 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727991AbgBMRSa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Feb 2020 12:18:30 -0500
Received: by mail-ua1-f66.google.com with SMTP id 73so2536363uac.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2020 09:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UAcoXNH4HG2fyNwFmmb8hABl3itJs2j/0Jm9ndpQqSg=;
        b=iPHI9O68mbN327jdQ2QomUUx0bYCndIW2OKKpN11nJg43b8BG9LX4ckP125ogrjck/
         Hu2dItUz1Pu7VY7T4OfJKRFwg1EI9bd7V068DYb90ObEGc97PmKlfvY9jbzJlc619Kf3
         xLvEWiO13PBJb6IJjimcg5hNnV/2HfBtI0eqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UAcoXNH4HG2fyNwFmmb8hABl3itJs2j/0Jm9ndpQqSg=;
        b=KNS2iT8TFPNxIdKBSIU6yIOSyspq3PkOq5AeGXktWqpIPbMOoPcWfCaJv5IPlp+Se1
         HmR8Zh2UCs5NmqknOcEQQx3kbw/+Qt2CzzpjHW9LfOcBYKZbu0GFClxSt1FGrCq1ZJKr
         tLs2axbDEB9ibzBXJ4rNvTc7DEY79gBCDN02oIjK/KzBAnVX39Wo0X5zQT/jBVyDQRBn
         R4sZ61ZiCJetl4zjl7ZHtqa+YL3NU5flMUwjjyqOaxBho/wtA/Iz2OBIlHtx6SZRaNaF
         ujLCXDEfSiHJ0fyXqTwpKbZLtkhfyxi26CBF3Zbetnhsqrn0dLjG8kbk2Xo5wJRmNwMa
         Z5vw==
X-Gm-Message-State: APjAAAUV+81SLVvWK4B6oN0domoeZIDISQDh0AVbOw+3GgS7I/2F/w63
        MsDvHLSy3e2dXL8jVbroJWwADkqoLLMWxvNLlq4wGA==
X-Google-Smtp-Source: APXvYqwdPCGROXpw6/d+RI5H9BvARlrclJPrgOchrIQKsMlCXhLBbD9osGJZGzNbNlKZ+BipWac/d3ArG1ApLMKxw54=
X-Received: by 2002:ab0:45f2:: with SMTP id u105mr8098242uau.115.1581614309043;
 Thu, 13 Feb 2020 09:18:29 -0800 (PST)
MIME-Version: 1.0
References: <1581609364-21824-1-git-send-email-gubbaven@codeaurora.org>
In-Reply-To: <1581609364-21824-1-git-send-email-gubbaven@codeaurora.org>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Thu, 13 Feb 2020 09:18:17 -0800
Message-ID: <CANFp7mVLagCME4oTfMaFnkFnktn7h9bLiXJ09nPkNqJyveELVw@mail.gmail.com>
Subject: Re: [PATCH v3] Bluetooth: hci_qca: Bug fixes while collecting
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

On Thu, Feb 13, 2020 at 7:56 AM Venkata Lakshmi Narayana Gubba
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
> v3:
>   * Removed memdump_timer completely.
>   * Used delayed work queue.
> ---
>  drivers/bluetooth/hci_qca.c | 101 +++++++++++++++++++++++++++++---------------
>  1 file changed, 67 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index eacc65b..9cae5fe 100644
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
> @@ -138,18 +140,19 @@ struct qca_data {
>         u32 tx_idle_delay;
>         struct timer_list wake_retrans_timer;
>         u32 wake_retrans;
> -       struct timer_list memdump_timer;
>         struct workqueue_struct *workqueue;
>         struct work_struct ws_awake_rx;
>         struct work_struct ws_awake_device;
>         struct work_struct ws_rx_vote_off;
>         struct work_struct ws_tx_vote_off;
>         struct work_struct ctrl_memdump_evt;
> +       struct delayed_work ctrl_memdump_timeout;
>         struct qca_memdump_data *qca_memdump;
>         unsigned long flags;
>         struct completion drop_ev_comp;
>         wait_queue_head_t suspend_wait_q;
>         enum qca_memdump_states memdump_state;
> +       struct mutex hci_memdump_lock;
>
>         /* For debugging purpose */
>         u64 ibs_sent_wacks;
> @@ -522,23 +525,28 @@ static void hci_ibs_wake_retrans_timeout(struct timer_list *t)
>                 hci_uart_tx_wakeup(hu);
>  }
>
> -static void hci_memdump_timeout(struct timer_list *t)
> +
> +static void qca_controller_memdump_timeout(struct work_struct *work)
>  {
> -       struct qca_data *qca = from_timer(qca, t, tx_idle_timer);
> +       struct qca_data *qca = container_of(work, struct qca_data,
> +                                       ctrl_memdump_timeout.work);
>         struct hci_uart *hu = qca->hu;
> -       struct qca_memdump_data *qca_memdump = qca->qca_memdump;
> -       char *memdump_buf = qca_memdump->memdump_buf_tail;
> -
> -       bt_dev_err(hu->hdev, "clearing allocated memory due to memdump timeout");
> -       /* Inject hw error event to reset the device and driver. */
> -       hci_reset_dev(hu->hdev);
> -       vfree(memdump_buf);
> -       kfree(qca_memdump);
> -       qca->memdump_state = QCA_MEMDUMP_TIMEOUT;
> -       del_timer(&qca->memdump_timer);
> -       cancel_work_sync(&qca->ctrl_memdump_evt);
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
>  }
>
> +
>  /* Initialize protocol */
>  static int qca_open(struct hci_uart *hu)
>  {
> @@ -558,6 +566,7 @@ static int qca_open(struct hci_uart *hu)
>         skb_queue_head_init(&qca->tx_wait_q);
>         skb_queue_head_init(&qca->rx_memdump_q);
>         spin_lock_init(&qca->hci_ibs_lock);
> +       mutex_init(&qca->hci_memdump_lock);
>         qca->workqueue = alloc_ordered_workqueue("qca_wq", 0);
>         if (!qca->workqueue) {
>                 BT_ERR("QCA Workqueue not initialized properly");
> @@ -570,6 +579,8 @@ static int qca_open(struct hci_uart *hu)
>         INIT_WORK(&qca->ws_rx_vote_off, qca_wq_serial_rx_clock_vote_off);
>         INIT_WORK(&qca->ws_tx_vote_off, qca_wq_serial_tx_clock_vote_off);
>         INIT_WORK(&qca->ctrl_memdump_evt, qca_controller_memdump);
> +       INIT_DELAYED_WORK(&qca->ctrl_memdump_timeout,
> +                         qca_controller_memdump_timeout);
>         init_waitqueue_head(&qca->suspend_wait_q);
>
>         qca->hu = hu;
> @@ -596,7 +607,6 @@ static int qca_open(struct hci_uart *hu)
>
>         timer_setup(&qca->tx_idle_timer, hci_ibs_tx_idle_timeout, 0);
>         qca->tx_idle_delay = IBS_HOST_TX_IDLE_TIMEOUT_MS;
> -       timer_setup(&qca->memdump_timer, hci_memdump_timeout, 0);
>
>         BT_DBG("HCI_UART_QCA open, tx_idle_delay=%u, wake_retrans=%u",
>                qca->tx_idle_delay, qca->wake_retrans);
> @@ -677,7 +687,6 @@ static int qca_close(struct hci_uart *hu)
>         skb_queue_purge(&qca->rx_memdump_q);
>         del_timer(&qca->tx_idle_timer);
>         del_timer(&qca->wake_retrans_timer);
> -       del_timer(&qca->memdump_timer);
>         destroy_workqueue(qca->workqueue);
>         qca->hu = NULL;
>
> @@ -963,11 +972,20 @@ static void qca_controller_memdump(struct work_struct *work)
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
> @@ -992,13 +1010,15 @@ static void qca_controller_memdump(struct work_struct *work)
>                         if (!(dump_size)) {
>                                 bt_dev_err(hu->hdev, "Rx invalid memdump size");
>                                 kfree_skb(skb);
> +                               mutex_unlock(&qca->hci_memdump_lock);
>                                 return;
>                         }
>
>                         bt_dev_info(hu->hdev, "QCA collecting dump of size:%u",
>                                     dump_size);
> -                       mod_timer(&qca->memdump_timer, (jiffies +
> -                                 msecs_to_jiffies(MEMDUMP_TIMEOUT_MS)));
> +                       queue_delayed_work(qca->workqueue,
> +                                          &qca->ctrl_memdump_timeout,
> +                                       msecs_to_jiffies(MEMDUMP_TIMEOUT_MS));
>
>                         skb_pull(skb, sizeof(dump_size));
>                         memdump_buf = vmalloc(dump_size);
> @@ -1016,6 +1036,7 @@ static void qca_controller_memdump(struct work_struct *work)
>                         kfree(qca_memdump);
>                         kfree_skb(skb);
>                         qca->qca_memdump = NULL;
> +                       mutex_unlock(&qca->hci_memdump_lock);
>                         return;
>                 }
>
> @@ -1046,16 +1067,20 @@ static void qca_controller_memdump(struct work_struct *work)
>                         memdump_buf = qca_memdump->memdump_buf_head;
>                         dev_coredumpv(&hu->serdev->dev, memdump_buf,
>                                       qca_memdump->received_dump, GFP_KERNEL);
> -                       del_timer(&qca->memdump_timer);
> +                       cancel_delayed_work(&qca->ctrl_memdump_timeout);
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
> @@ -1406,30 +1431,21 @@ static void qca_wait_for_dump_collection(struct hci_dev *hdev)
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
> @@ -1449,6 +1465,23 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
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
> +               cancel_delayed_work(&qca->ctrl_memdump_timeout);
> +               skb_queue_purge(&qca->rx_memdump_q);
> +               mutex_unlock(&qca->hci_memdump_lock);
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

Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
