Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8FBC1E54C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 05:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726827AbgE1DnA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 May 2020 23:43:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbgE1DnA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 May 2020 23:43:00 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3046DC08C5C1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2020 20:43:00 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id t4so13081941vsq.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2020 20:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bPaEtIz9pymnQ3zlLT7ky3GdzrpI5LZJGnrujJgXsc0=;
        b=c9KdapEUJSPKNZeQyNnqiFrr6KubgXJeNvxUNO3s2hHeydiVxTVWyJmV7sGy63xdHL
         5u8E+yrHjREHQPMLEuL2E3UkkkAQbONyrSQsVq8l/EpwP4xCYD2wzPXrZia+25uAnH0U
         iBmmbZYYjcBr0vV5SVG54wPyyE8aX9epXx750=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bPaEtIz9pymnQ3zlLT7ky3GdzrpI5LZJGnrujJgXsc0=;
        b=EgswR0y5aj/m+WAmx0nDlB3ks/wbMnojVoKLPjWdwYHR6SPlfBaFXvTtMiY940XbQm
         Ey21YlgvTfIZAZqHPfY0pcruVMJjzrTGKzCwZJCLgsN5/ObpVgE+n2TU8AXMKhav3ndV
         l8p+jMrxHLx4XCsP14JJ5gq0sKgNiBi7g+AyFB57gTx6ebF0eq4KMrtgBxt/qWZ0Zl0w
         h1dXo5nU0NvrSDLwOcUoEqZk/gkPcdbhyBWsUTlGTENYbz/bOI9Uj1iLx+cA1rW+i5/M
         OQia+SFpusovznozuCux2BaGkbi9js2YvoTCqPfokeOjg69lBbZxDJXpJNe+FX2qfC/V
         z0QQ==
X-Gm-Message-State: AOAM5302BefOUJC9JKhNOpabyw6daJfwdP8ig9ejIEaCVhfNSmmW6E++
        8ucW+sTQql4V/I/Xeav5kdYf3CK8UH4XUky7Oy588Ntli+1OVA==
X-Google-Smtp-Source: ABdhPJyeD7CvriJPtSeRzw8WUSVDYFhVUzo6FlAFfBfHtHPhZb+maNEaAfevvGRTkmo+hfxiYZ5Kvr4W1jIDx7B+XcA=
X-Received: by 2002:a67:8d48:: with SMTP id p69mr617029vsd.86.1590637379005;
 Wed, 27 May 2020 20:42:59 -0700 (PDT)
MIME-Version: 1.0
References: <1590550627-24618-1-git-send-email-zijuhu@codeaurora.org>
In-Reply-To: <1590550627-24618-1-git-send-email-zijuhu@codeaurora.org>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Wed, 27 May 2020 20:42:46 -0700
Message-ID: <CANFp7mXMiYKY-33xZX2MaHd5RyicbRb2fZHo8mk4-VM_Jf47UQ@mail.gmail.com>
Subject: Re: [PATCH v2] bluetooth: hci_qca: Fix QCA6390 memdump failure
To:     Zijun Hu <zijuhu@codeaurora.org>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org,
        Matthias Kaehlcke <mka@chromium.org>, rjliao@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Zijun,

On Tue, May 26, 2020 at 8:37 PM Zijun Hu <zijuhu@codeaurora.org> wrote:
>
> QCA6390 memdump VSE sometimes come to bluetooth driver
> with wrong sequence number as illustrated as follows:
> frame # in DEC: frame data in HEX
> 1396: ff fd 01 08 74 05 00 37 8f 14
> 1397: ff fd 01 08 75 05 00 ff bf 38
> 1414: ff fd 01 08 86 05 00 fb 5e 4b
> 1399: ff fd 01 08 77 05 00 f3 44 0a
> 1400: ff fd 01 08 78 05 00 ca f7 41
> it is mistook for controller missing packets, so results
> in page fault after overwriting memdump buffer allocated.
>
> it is fixed by ignoring QCA6390 sequence number error
> and checking buffer space before writing.
>
> Signed-off-by: Zijun Hu <zijuhu@codeaurora.org>
> ---
>  drivers/bluetooth/hci_qca.c | 45 ++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 38 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index e4a6823..388fe01b 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -114,6 +114,7 @@ struct qca_memdump_data {
>         char *memdump_buf_tail;
>         u32 current_seq_no;
>         u32 received_dump;
> +       u32 ram_dump_size;
>  };
>
>  struct qca_memdump_event_hdr {
> @@ -976,6 +977,8 @@ static void qca_controller_memdump(struct work_struct *work)
>         char nullBuff[QCA_DUMP_PACKET_SIZE] = { 0 };
>         u16 seq_no;
>         u32 dump_size;
> +       u32 rx_size;
> +       enum qca_btsoc_type soc_type = qca_soc_type(hu);
>
>         while ((skb = skb_dequeue(&qca->rx_memdump_q))) {
>
> @@ -1029,6 +1032,7 @@ static void qca_controller_memdump(struct work_struct *work)
>
>                         skb_pull(skb, sizeof(dump_size));
>                         memdump_buf = vmalloc(dump_size);
> +                       qca_memdump->ram_dump_size = dump_size;
>                         qca_memdump->memdump_buf_head = memdump_buf;
>                         qca_memdump->memdump_buf_tail = memdump_buf;
>                 }
> @@ -1052,25 +1056,52 @@ static void qca_controller_memdump(struct work_struct *work)
>                  * packets in the buffer.
>                  */
>                 while ((seq_no > qca_memdump->current_seq_no + 1) &&
> +                       (soc_type != QCA_QCA6390) &&

This probably shouldn't be SOC specific.

>                         seq_no != QCA_LAST_SEQUENCE_NUM) {
>                         bt_dev_err(hu->hdev, "QCA controller missed packet:%d",
>                                    qca_memdump->current_seq_no);
> +                       rx_size = qca_memdump->received_dump;
> +                       rx_size += QCA_DUMP_PACKET_SIZE;
> +                       if (rx_size > qca_memdump->ram_dump_size) {
> +                               bt_dev_err(hu->hdev,
> +                                               "QCA memdump received %d, no space for missed packet",
> +                                               qca_memdump->received_dump);
> +                               break;
> +                       }
>                         memcpy(memdump_buf, nullBuff, QCA_DUMP_PACKET_SIZE);
>                         memdump_buf = memdump_buf + QCA_DUMP_PACKET_SIZE;
>                         qca_memdump->received_dump += QCA_DUMP_PACKET_SIZE;
>                         qca_memdump->current_seq_no++;
>                 }

You can replace this loop with a memset(memdump_buf, 0, (seq_no -
qca_memdump->current_seq_no) * QCA_DUMP_PACKET_SIZE). This simplifies
the ram_dump_size check as well because it won't zero fill until the
end anymore (meaning a single bad seq_no doesn't make the rest of the
dump incorrect).

>
> -               memcpy(memdump_buf, (unsigned char *) skb->data, skb->len);
> -               memdump_buf = memdump_buf + skb->len;
> -               qca_memdump->memdump_buf_tail = memdump_buf;
> -               qca_memdump->current_seq_no = seq_no + 1;
> -               qca_memdump->received_dump += skb->len;
> +               rx_size = qca_memdump->received_dump + skb->len;
> +               if (rx_size <= qca_memdump->ram_dump_size) {
> +                       if ((seq_no != QCA_LAST_SEQUENCE_NUM) &&
> +                                       (seq_no != qca_memdump->current_seq_no))
> +                               bt_dev_err(hu->hdev,
> +                                               "QCA memdump unexpected packet %d",
> +                                               seq_no);
> +                       bt_dev_dbg(hu->hdev,
> +                                       "QCA memdump packet %d with length %d",
> +                                       seq_no, skb->len);
> +                       memcpy(memdump_buf, (unsigned char *)skb->data,
> +                                       skb->len);
> +                       memdump_buf = memdump_buf + skb->len;
> +                       qca_memdump->memdump_buf_tail = memdump_buf;
> +                       qca_memdump->current_seq_no = seq_no + 1;
> +                       qca_memdump->received_dump += skb->len;
> +               } else {
> +                       bt_dev_err(hu->hdev,
> +                                       "QCA memdump received %d, no space for packet %d",
> +                                       qca_memdump->received_dump, seq_no);
> +               }
>                 qca->qca_memdump = qca_memdump;
>                 kfree_skb(skb);
>                 if (seq_no == QCA_LAST_SEQUENCE_NUM) {
> -                       bt_dev_info(hu->hdev, "QCA writing crash dump of size %d bytes",
> -                                  qca_memdump->received_dump);
> +                       bt_dev_info(hu->hdev,
> +                                       "QCA memdump Done, received %d, total %d",
> +                                       qca_memdump->received_dump,
> +                                       qca_memdump->ram_dump_size);
>                         memdump_buf = qca_memdump->memdump_buf_head;
>                         dev_coredumpv(&hu->serdev->dev, memdump_buf,
>                                       qca_memdump->received_dump, GFP_KERNEL);
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
>
