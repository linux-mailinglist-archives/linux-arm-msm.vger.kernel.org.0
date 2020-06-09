Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6BAC1F4007
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 18:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731058AbgFIQAn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 12:00:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730794AbgFIQAm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 12:00:42 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A734CC03E97C
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2020 09:00:42 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id c1so12299819vsc.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2020 09:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FVbKhA/NezMaX3sdFKjoaZBxdKpUb0BC4Yh1wEUX1i8=;
        b=HbbZVpX8lEl1/PAJKl/LIFIScwEcEtm8iQCb2cSgM4H01kZLkY0m1q6Dfu/nQhkJ2u
         BidyYYPVASIl2b1khHkuTADsCtKHzx57+fTgXQXWkl3/FFk33PEvEbHzPQfs5P7eDRdG
         4Tohzxve7vwXPz/S9P4Dwv5Vky64S84P7KzKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FVbKhA/NezMaX3sdFKjoaZBxdKpUb0BC4Yh1wEUX1i8=;
        b=mT6arXzgtJrmxxEycpNzo6vcYOuJr6VZMkYQDmznaSbQ5qNmFl2asMkDkTrMW6AsAf
         cYr/JWK6TxIPlyIJgvhOBkpro3ZvJmQj1xq/7y37OY0XJ8la53FGmDnljhux0hCoCG99
         l6cxTvqRZhOW0CKypr0namTu1CaKW1QZsgOYnxMKRpFSxhOejA7Fl+1m2qPQP/s+826m
         CQ5HWTdWs8vPvoh9CrTmiyoV0BPOhromr8RhNONXACnncjRp+itoOY2l39kC2ZvG8M24
         5T7mEVAVkSlaU7wxg3R/LidQdebxTebf5WkAer29hoNE1kDrt3/aWYktTr1TTaaDejb4
         wp8A==
X-Gm-Message-State: AOAM532kqDtbuswX2IljCKx4saKa4gfCj+DrxczbvoupibdU47ArxzxO
        Qt83fAZE4WsWhoT5ubpk+hsruh/sUN0uqBBJZejqHA==
X-Google-Smtp-Source: ABdhPJx1Ay9r98Ol06bQfHruUDmVmqjfK/8k9ZGDrj+ekPNXTbJRyHNheNoU9kuUloYfvosgpr2CQOweMDeGNH8gWeI=
X-Received: by 2002:a67:6a01:: with SMTP id f1mr4034591vsc.86.1591718441472;
 Tue, 09 Jun 2020 09:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <1591718228-18819-1-git-send-email-gubbaven@codeaurora.org>
In-Reply-To: <1591718228-18819-1-git-send-email-gubbaven@codeaurora.org>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Tue, 9 Jun 2020 09:00:29 -0700
Message-ID: <CANFp7mUT68Y9vGbSXdCTZE8JzWxYv47f2RZK8+V_4Bn=FVnypw@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: hci_qca: Bug fix during SSR timeout
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        Rocky Liao <rjliao@codeaurora.org>, hbandi@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Looks good to me.

Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

On Tue, Jun 9, 2020 at 8:57 AM Venkata Lakshmi Narayana Gubba
<gubbaven@codeaurora.org> wrote:
>
> Due to race conditions between qca_hw_error and qca_controller_memdump
> during SSR timeout,the same pointer is freed twice. This results in a
> double free. Now a lock is acquired before checking the stauts of SSR
> state.
>
> Fixes: d841502c79e3 ("Bluetooth: hci_qca: Collect controller memory dump during SSR")
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
>  drivers/bluetooth/hci_qca.c | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 28c34a1..f3fde99 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -981,8 +981,11 @@ static void qca_controller_memdump(struct work_struct *work)
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
> @@ -1483,8 +1486,6 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>  {
>         struct hci_uart *hu = hci_get_drvdata(hdev);
>         struct qca_data *qca = hu->priv;
> -       struct qca_memdump_data *qca_memdump = qca->qca_memdump;
> -       char *memdump_buf = NULL;
>
>         set_bit(QCA_HW_ERROR_EVENT, &qca->flags);
>         bt_dev_info(hdev, "mem_dump_status: %d", qca->memdump_state);
> @@ -1507,19 +1508,23 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>                 qca_wait_for_dump_collection(hdev);
>         }
>
> +       mutex_lock(&qca->hci_memdump_lock);
>         if (qca->memdump_state != QCA_MEMDUMP_COLLECTED) {
>                 bt_dev_err(hu->hdev, "clearing allocated memory due to memdump timeout");
> -               mutex_lock(&qca->hci_memdump_lock);
> -               if (qca_memdump)
> -                       memdump_buf = qca_memdump->memdump_buf_head;
> -               vfree(memdump_buf);
> -               kfree(qca_memdump);
> -               qca->qca_memdump = NULL;
> +               if (qca->qca_memdump) {
> +                       vfree(qca->qca_memdump->memdump_buf_head);
> +                       kfree(qca->qca_memdump);
> +                       qca->qca_memdump = NULL;
> +               }
>                 qca->memdump_state = QCA_MEMDUMP_TIMEOUT;
>                 cancel_delayed_work(&qca->ctrl_memdump_timeout);
> -               skb_queue_purge(&qca->rx_memdump_q);
> -               mutex_unlock(&qca->hci_memdump_lock);
> +       }
> +       mutex_unlock(&qca->hci_memdump_lock);
> +
> +       if (qca->memdump_state == QCA_MEMDUMP_TIMEOUT ||
> +           qca->memdump_state == QCA_MEMDUMP_COLLECTED) {
>                 cancel_work_sync(&qca->ctrl_memdump_evt);
> +               skb_queue_purge(&qca->rx_memdump_q);
>         }
>
>         clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
