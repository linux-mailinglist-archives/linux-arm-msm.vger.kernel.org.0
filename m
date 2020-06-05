Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC9F1EF0B8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2020 06:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbgFEEx6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jun 2020 00:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725986AbgFEEx5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jun 2020 00:53:57 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDFB1C08C5C2
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2020 21:53:57 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id r11so4882724vsj.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2020 21:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iSK3iGrwNXhNPMJarS5DBwkVfOTARnkNBQgwEVg9fzQ=;
        b=OLKa3Eru19miQbfdsFwziHODftiQNhKc4EdQde9u1NnrdN7pNq03T9y6y7pRRxwOH/
         3O+4MIcvxf/abLwwAyZDvo3EVUiawKW9fPciyLPXrNe3mzA4cb0fsaqJEtKQPGjet+0x
         yUiD4YjaWXlzJaW3tX5tQX009Vhxc4SCODiWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iSK3iGrwNXhNPMJarS5DBwkVfOTARnkNBQgwEVg9fzQ=;
        b=ZOU8jwTYc0bB5jM49TNzd30egFCAak5hHI402nCIrt/FLmyZNddeWBv8sybc/rdTff
         yscTGUHWcv4lxVuYO119zP/CjZrK07QECE2SCzRkzZdtlasUwaHjczggyqeYw8iEKKCq
         68kSd6H7Z5OGqcaT03A2pxHOR5wUXqgB7sMWA0m/kdxd8IBwsfiA3IyVDdMf6q0FwnZd
         kK7xdR9QmfyKzoAIE40F7ZSwEYeq5mjyz+JEFffGSuB+mOzAVJ9RX12HdZodATR3v6rX
         qQxpDjYEhqWw8C+C2I4gAoEMqw62WB0hyHDRbdfRKZkbj3yi8Ahb2QXO2eWxF+fx3CT8
         HaoA==
X-Gm-Message-State: AOAM530MhNVKAH+tJcqjBVjJx1bsmLe3sCY+qe94YTyZiXP8Ait/BsWQ
        1BPtDW2jKqdl0GiDVEXL/S8E5pSB8I7DpB+OcwhkoQ==
X-Google-Smtp-Source: ABdhPJwdWFvJCxmedX/E9k5TaI0rTCAck27IIEFlzSk+XHOBcn46sl1Tb3UUpBvYtbnaohow5PXV2JknybmaQG/rT6Y=
X-Received: by 2002:a67:3c6:: with SMTP id 189mr6264601vsd.71.1591332836701;
 Thu, 04 Jun 2020 21:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <1591279032-7527-1-git-send-email-gubbaven@codeaurora.org>
In-Reply-To: <1591279032-7527-1-git-send-email-gubbaven@codeaurora.org>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Thu, 4 Jun 2020 21:53:42 -0700
Message-ID: <CANFp7mX1iKNETqzjdp5z4OrRJBdaGV+f4rOQBtGomYEhsazVfw@mail.gmail.com>
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Fix double free during SSR timeout
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

Hi,

On Thu, Jun 4, 2020 at 6:59 AM Venkata Lakshmi Narayana Gubba
<gubbaven@codeaurora.org> wrote:
>
> Due to race conditions between qca_hw_error and qca_controller_memdump
> during SSR timeout,the same pointer is freed twice. Which results to
> double free error. Now a lock is acquired while SSR state moved to timeout.
suggestion: Change "which results to double free error" to "This
results in a double free."
suggestion: Change "while SSR state moved to timeout" to "when SSR
state is changed to timeout"

>
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
>  drivers/bluetooth/hci_qca.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 836949d..9110775 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -983,8 +983,11 @@ static void qca_controller_memdump(struct work_struct *work)
>         while ((skb = skb_dequeue(&qca->rx_memdump_q))) {
>
>                 mutex_lock(&qca->hci_memdump_lock);
> -               /* Skip processing the received packets if timeout detected. */
> -               if (qca->memdump_state == QCA_MEMDUMP_TIMEOUT) {
> +               /* Skip processing the received packets if timeout detected
> +                * or memdump collection completed.
> +                */
> +               if (qca->memdump_state == QCA_MEMDUMP_TIMEOUT ||
> +                   qca->memdump_state == QCA_MEMDUMP_COLLECTED) {
>                         mutex_unlock(&qca->hci_memdump_lock);
>                         return;
>                 }
> @@ -1485,7 +1488,7 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>  {
>         struct hci_uart *hu = hci_get_drvdata(hdev);
>         struct qca_data *qca = hu->priv;
> -       struct qca_memdump_data *qca_memdump = qca->qca_memdump;
> +       struct qca_memdump_data *qca_memdump = NULL;
>         char *memdump_buf = NULL;
>
>         set_bit(QCA_HW_ERROR_EVENT, &qca->flags);
> @@ -1509,9 +1512,10 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>                 qca_wait_for_dump_collection(hdev);
>         }
>
> +       mutex_lock(&qca->hci_memdump_lock);
>         if (qca->memdump_state != QCA_MEMDUMP_COLLECTED) {
>                 bt_dev_err(hu->hdev, "clearing allocated memory due to memdump timeout");
> -               mutex_lock(&qca->hci_memdump_lock);
> +               qca_memdump = qca->qca_memdump;
>                 if (qca_memdump)
>                         memdump_buf = qca_memdump->memdump_buf_head;
>                 vfree(memdump_buf);

This section of code looks a bit unclear because it's only partially
in an if statement. Suggestion:
  if (qca->qca_memdump) {
    vfree(qca->qca_memdump->memdump_buf_head);
    kfree(qca->qca_memdump);
    qca->qca_memdump = NULL;
  }

> @@ -1520,8 +1524,13 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>                 qca->memdump_state = QCA_MEMDUMP_TIMEOUT;
>                 cancel_delayed_work(&qca->ctrl_memdump_timeout);
>                 skb_queue_purge(&qca->rx_memdump_q);
> -               mutex_unlock(&qca->hci_memdump_lock);
> +       }
> +       mutex_unlock(&qca->hci_memdump_lock);
> +
> +       if (qca->memdump_state == QCA_MEMDUMP_TIMEOUT ||
> +           qca->memdump_state == QCA_MEMDUMP_COLLECTED) {
>                 cancel_work_sync(&qca->ctrl_memdump_evt);
> +               skb_queue_purge(&qca->rx_memdump_q);
>         }

Earlier in the function, you call qca_wait_for_dump_collection for
[Idle, Collecting] so the state should be either [Timeout, Collected]
at this branch. So, you can remove the `cancel_delayed_work` and
`skb_queue_purge` from above and just leave it only in the bottom
branch. Currently you're duplicating these calls unnecessarily.

I don't know if we discussed this in an earlier review but I noticed
that `qca_wait_for_dump_collection` doesn't actually pay attention to
the return value of `wait_on_bit_timeout`. I don't have context for
the order of calls anymore but is there a possibility for that timeout
to complete before `qca_memdump_timeout` is called? In that case, you
should probably set the state to timeout in
`qca_wait_for_dump_collection` as well.

>
>         clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
