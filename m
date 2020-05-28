Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 173A41E6949
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 20:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405814AbgE1S05 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 14:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405775AbgE1S0y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 14:26:54 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78085C08C5C8
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 11:26:54 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id z13so3841537vsn.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 11:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uL3WL3wjiZS/WqaVMZN+pC1EDFb5Gzm+8f1ZDs/CoM8=;
        b=jUoiY6LwAn07lRdvLrd7+LZ7B/jHbDcfvdN0Ne3nGHXtGE8ltaz1br+6TuczOyb0EM
         6PVc1y9DTOLiZH/DTqEJd/ph2qQvzaSL1LFK16lCvD6rCVKstqKERnU7vy/kO0Y6U6ub
         1TChCOSrsNHthGlfltW/Aw6cnWWm1DEMjSSe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uL3WL3wjiZS/WqaVMZN+pC1EDFb5Gzm+8f1ZDs/CoM8=;
        b=UAZenlVogWe0CNzP+HoMaoMSa8zkBwN1owlUFCry3ReimS/TeC0Zv7taykhrZbUq22
         pK8vrN89pjhUToU0yRq1gqFz98Tv9H2juS/LklY+WI0SBSnC2v4g9gxus9wSJTFQAUp6
         SvAW1YEjxszIa287Tv7+TPgaP7tvNRGA/dMGCRQOZ3tuPtqcf9PtY2AlllZL2EeNaZaj
         A3E/hZSoMRz9gCuh3TiiecnkYbE6OsnhW+e/T2N+pyGenlJVa6UDp7es/B4o8NBnssAG
         qoRcQdSW3SCpyZwWoFSz6YIg8Pgt/9kEeOwThmLjx2V+IjGTxh81eVchBF/ZTRJ7a+ZU
         MrTQ==
X-Gm-Message-State: AOAM532HYY8bNk4Z3waX0D0unMBhmnX1Kx7+cy+k/xnNolwttaqYfvLV
        fWZRsbVayRNx3VNPMQ9OME8q82iFARbrO47gS+Uh/uNqp5c5dA==
X-Google-Smtp-Source: ABdhPJw/uHcsZ0Kjg/6YjwtpPe8hS3OBN+zaPsqHmKdhUTROZyx2CYYR66/fHjXBifjuPn1PMRenLs3FT5lqHrBgNUI=
X-Received: by 2002:a67:d119:: with SMTP id u25mr3001502vsi.96.1590690413360;
 Thu, 28 May 2020 11:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <1590550627-24618-1-git-send-email-zijuhu@codeaurora.org>
 <CANFp7mXMiYKY-33xZX2MaHd5RyicbRb2fZHo8mk4-VM_Jf47UQ@mail.gmail.com> <cdc9c050-c7e4-da5c-defa-65abb397afd1@codeaurora.org>
In-Reply-To: <cdc9c050-c7e4-da5c-defa-65abb397afd1@codeaurora.org>
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Date:   Thu, 28 May 2020 11:26:40 -0700
Message-ID: <CANFp7mVkJ4CXyP4ASTaTVQmR2Z9jgzcJ4k5rwaUwec6T=i+2Qg@mail.gmail.com>
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

Hi,

On Wed, May 27, 2020 at 11:19 PM Zijun Hu <zijuhu@codeaurora.org> wrote:
>
>
>
> On 5/28/2020 11:42 AM, Abhishek Pandit-Subedi wrote:
> > Hi Zijun,
> >
> > On Tue, May 26, 2020 at 8:37 PM Zijun Hu <zijuhu@codeaurora.org> wrote:
> >>
> >> QCA6390 memdump VSE sometimes come to bluetooth driver
> >> with wrong sequence number as illustrated as follows:
> >> frame # in DEC: frame data in HEX
> >> 1396: ff fd 01 08 74 05 00 37 8f 14
> >> 1397: ff fd 01 08 75 05 00 ff bf 38
> >> 1414: ff fd 01 08 86 05 00 fb 5e 4b
> >> 1399: ff fd 01 08 77 05 00 f3 44 0a
> >> 1400: ff fd 01 08 78 05 00 ca f7 41
> >> it is mistook for controller missing packets, so results
> >> in page fault after overwriting memdump buffer allocated.
> >>
> >> it is fixed by ignoring QCA6390 sequence number error
> >> and checking buffer space before writing.
> >>
> >> Signed-off-by: Zijun Hu <zijuhu@codeaurora.org>
> >> ---
> >>  drivers/bluetooth/hci_qca.c | 45 ++++++++++++++++++++++++++++++++++++++-------
> >>  1 file changed, 38 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> >> index e4a6823..388fe01b 100644
> >> --- a/drivers/bluetooth/hci_qca.c
> >> +++ b/drivers/bluetooth/hci_qca.c
> >> @@ -114,6 +114,7 @@ struct qca_memdump_data {
> >>         char *memdump_buf_tail;
> >>         u32 current_seq_no;
> >>         u32 received_dump;
> >> +       u32 ram_dump_size;
> >>  };
> >>
> >>  struct qca_memdump_event_hdr {
> >> @@ -976,6 +977,8 @@ static void qca_controller_memdump(struct work_struct *work)
> >>         char nullBuff[QCA_DUMP_PACKET_SIZE] = { 0 };
> >>         u16 seq_no;
> >>         u32 dump_size;
> >> +       u32 rx_size;
> >> +       enum qca_btsoc_type soc_type = qca_soc_type(hu);
> >>
> >>         while ((skb = skb_dequeue(&qca->rx_memdump_q))) {
> >>
> >> @@ -1029,6 +1032,7 @@ static void qca_controller_memdump(struct work_struct *work)
> >>
> >>                         skb_pull(skb, sizeof(dump_size));
> >>                         memdump_buf = vmalloc(dump_size);
> >> +                       qca_memdump->ram_dump_size = dump_size;
> >>                         qca_memdump->memdump_buf_head = memdump_buf;
> >>                         qca_memdump->memdump_buf_tail = memdump_buf;
> >>                 }
> >> @@ -1052,25 +1056,52 @@ static void qca_controller_memdump(struct work_struct *work)
> >>                  * packets in the buffer.
> >>                  */
> >>                 while ((seq_no > qca_memdump->current_seq_no + 1) &&
> >> +                       (soc_type != QCA_QCA6390) &&
> >
> > This probably shouldn't be SOC specific.
> >
> make sense. but this logic block should be skipped for QCA6390
> the present logic to fix controller missing packets for the other products
> is not suitable for QCA6390. for QCA6390, it doesn't miss packet and sequence
> number field of the packet maybe have data error, but serdev driver doesn't propagate
> these error info detected by UART driver to bluetooth driver. so the sequence number
> extracted from packet received is not reliable.

Ok -- then I think it would be clearer to just set seq_no =
qca_memdump->current_seq_no for QCA6390 and leave a comment about it.

>
> >>                         seq_no != QCA_LAST_SEQUENCE_NUM) {
> >>                         bt_dev_err(hu->hdev, "QCA controller missed packet:%d",
> >>                                    qca_memdump->current_seq_no);
> >> +                       rx_size = qca_memdump->received_dump;
> >> +                       rx_size += QCA_DUMP_PACKET_SIZE;
> >> +                       if (rx_size > qca_memdump->ram_dump_size) {
> >> +                               bt_dev_err(hu->hdev,
> >> +                                               "QCA memdump received %d, no space for missed packet",
> >> +                                               qca_memdump->received_dump);
> >> +                               break;
> >> +                       }
> >>                         memcpy(memdump_buf, nullBuff, QCA_DUMP_PACKET_SIZE);
> >>                         memdump_buf = memdump_buf + QCA_DUMP_PACKET_SIZE;
> >>                         qca_memdump->received_dump += QCA_DUMP_PACKET_SIZE;
> >>                         qca_memdump->current_seq_no++;
> >>                 }
> >
> > You can replace this loop with a memset(memdump_buf, 0, (seq_no -
> > qca_memdump->current_seq_no) * QCA_DUMP_PACKET_SIZE). This simplifies
> > the ram_dump_size check as well because it won't zero fill until the
> > end anymore (meaning a single bad seq_no doesn't make the rest of the
> > dump incorrect).
> >
> i don't think so
> as explained above, the sequence number is not reliable, so we can't memset buffer
> area calculated from seqence number. i just dump all the packets we received without
> any handling for QCA6390.

I suggest the following:

/* For QCA6390, ignore the seq_no and always assume packets are in order */
if (soc_type == QCA_QCA6390 && seq_no != QCA_LAST_SEQUENCE_NUM) {
    seq_no = qca_memdump->current_seq_no;
} else if (seq_no > qca_memdump->current_seq_no &&
             seq_no != QCA_LAST_SEQUENCE_NUM) {
    /* For bounds checking, add the sizes of the current pkt + the
number of missing pkts.
     * If the given seq_no exceeds the allocated size of the dump,
assume the seq_no is
     * wrong.
     */
    rx_size = (seq_no - qca_memdump->current_seq_no) * QCA_DUMP_PACKET_SIZE;
    if (rx_size + skb->len <= (qca_memdump->ram_dump_size -
qca_memdump->received_dump)) {
        memset(memdump_buf, 0, rx_size);
        memdump_buf += rx_size;
        qca_memdump->received_dump += rx_size;
        qca_memdump->current_seq_no = seq_no;
    } else {
        seq_no = qca_memdump->current_seq_no;
    }
}

> >>
> >> -               memcpy(memdump_buf, (unsigned char *) skb->data, skb->len);
> >> -               memdump_buf = memdump_buf + skb->len;
> >> -               qca_memdump->memdump_buf_tail = memdump_buf;
> >> -               qca_memdump->current_seq_no = seq_no + 1;
> >> -               qca_memdump->received_dump += skb->len;
> >> +               rx_size = qca_memdump->received_dump + skb->len;
> >> +               if (rx_size <= qca_memdump->ram_dump_size) {
> >> +                       if ((seq_no != QCA_LAST_SEQUENCE_NUM) &&
> >> +                                       (seq_no != qca_memdump->current_seq_no))
> >> +                               bt_dev_err(hu->hdev,
> >> +                                               "QCA memdump unexpected packet %d",
> >> +                                               seq_no);

This message doesn't make sense here anymore and should be removed.

> >> +                       bt_dev_dbg(hu->hdev,
> >> +                                       "QCA memdump packet %d with length %d",
> >> +                                       seq_no, skb->len);
> >> +                       memcpy(memdump_buf, (unsigned char *)skb->data,
> >> +                                       skb->len);
> >> +                       memdump_buf = memdump_buf + skb->len;
> >> +                       qca_memdump->memdump_buf_tail = memdump_buf;
> >> +                       qca_memdump->current_seq_no = seq_no + 1;
> >> +                       qca_memdump->received_dump += skb->len;
> >> +               } else {
> >> +                       bt_dev_err(hu->hdev,
> >> +                                       "QCA memdump received %d, no space for packet %d",
> >> +                                       qca_memdump->received_dump, seq_no);
> >> +               }
> >>                 qca->qca_memdump = qca_memdump;
> >>                 kfree_skb(skb);
> >>                 if (seq_no == QCA_LAST_SEQUENCE_NUM) {
> >> -                       bt_dev_info(hu->hdev, "QCA writing crash dump of size %d bytes",
> >> -                                  qca_memdump->received_dump);
> >> +                       bt_dev_info(hu->hdev,
> >> +                                       "QCA memdump Done, received %d, total %d",
> >> +                                       qca_memdump->received_dump,
> >> +                                       qca_memdump->ram_dump_size);
> >>                         memdump_buf = qca_memdump->memdump_buf_head;
> >>                         dev_coredumpv(&hu->serdev->dev, memdump_buf,
> >>                                       qca_memdump->received_dump, GFP_KERNEL);
> >> --
> >> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
> >>
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
