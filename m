Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 839A61E6D81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 23:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436543AbgE1VUh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 17:20:37 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:45248 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436488AbgE1VUb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 17:20:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590700826; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=c7UAj3V0yBvahfV6+X1NC5knmSvPxv2Z9CwQgu48dBI=; b=iVWJYHR6HPtjBUgNYGFhnixvmsU8Bua7TNOzMA7NVZV0t3qg4SIWsCZIvEI+nPSJ50MECDI+
 QulAsJeCwcdLqnGlDfKDVpcdYEimnnuacCXef9LHXUkqEAkDlFe6DlXg2G1dxtch22yodELO
 GQ+h+kMUQlAWfFX5bRvdx358x5w=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5ed02b1aea0dfa490e7a2574 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 May 2020 21:20:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5F775C433CB; Thu, 28 May 2020 21:20:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.253.14.55] (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: zijuhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 30154C433C6;
        Thu, 28 May 2020 21:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 30154C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=zijuhu@codeaurora.org
Subject: Re: [PATCH v2] bluetooth: hci_qca: Fix QCA6390 memdump failure
To:     Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org,
        Matthias Kaehlcke <mka@chromium.org>, rjliao@codeaurora.org
References: <1590550627-24618-1-git-send-email-zijuhu@codeaurora.org>
 <CANFp7mXMiYKY-33xZX2MaHd5RyicbRb2fZHo8mk4-VM_Jf47UQ@mail.gmail.com>
 <cdc9c050-c7e4-da5c-defa-65abb397afd1@codeaurora.org>
 <CANFp7mVkJ4CXyP4ASTaTVQmR2Z9jgzcJ4k5rwaUwec6T=i+2Qg@mail.gmail.com>
From:   Zijun Hu <zijuhu@codeaurora.org>
Message-ID: <a482d496-6eaf-a1dc-0326-44a5383bff50@codeaurora.org>
Date:   Fri, 29 May 2020 05:20:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <CANFp7mVkJ4CXyP4ASTaTVQmR2Z9jgzcJ4k5rwaUwec6T=i+2Qg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/29/2020 2:26 AM, Abhishek Pandit-Subedi wrote:
> Hi,
> 
> On Wed, May 27, 2020 at 11:19 PM Zijun Hu <zijuhu@codeaurora.org> wrote:
>>
>>
>>
>> On 5/28/2020 11:42 AM, Abhishek Pandit-Subedi wrote:
>>> Hi Zijun,
>>>
>>> On Tue, May 26, 2020 at 8:37 PM Zijun Hu <zijuhu@codeaurora.org> wrote:
>>>>
>>>> QCA6390 memdump VSE sometimes come to bluetooth driver
>>>> with wrong sequence number as illustrated as follows:
>>>> frame # in DEC: frame data in HEX
>>>> 1396: ff fd 01 08 74 05 00 37 8f 14
>>>> 1397: ff fd 01 08 75 05 00 ff bf 38
>>>> 1414: ff fd 01 08 86 05 00 fb 5e 4b
>>>> 1399: ff fd 01 08 77 05 00 f3 44 0a
>>>> 1400: ff fd 01 08 78 05 00 ca f7 41
>>>> it is mistook for controller missing packets, so results
>>>> in page fault after overwriting memdump buffer allocated.
>>>>
>>>> it is fixed by ignoring QCA6390 sequence number error
>>>> and checking buffer space before writing.
>>>>
>>>> Signed-off-by: Zijun Hu <zijuhu@codeaurora.org>
>>>> ---
>>>>  drivers/bluetooth/hci_qca.c | 45 ++++++++++++++++++++++++++++++++++++++-------
>>>>  1 file changed, 38 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>>>> index e4a6823..388fe01b 100644
>>>> --- a/drivers/bluetooth/hci_qca.c
>>>> +++ b/drivers/bluetooth/hci_qca.c
>>>> @@ -114,6 +114,7 @@ struct qca_memdump_data {
>>>>         char *memdump_buf_tail;
>>>>         u32 current_seq_no;
>>>>         u32 received_dump;
>>>> +       u32 ram_dump_size;
>>>>  };
>>>>
>>>>  struct qca_memdump_event_hdr {
>>>> @@ -976,6 +977,8 @@ static void qca_controller_memdump(struct work_struct *work)
>>>>         char nullBuff[QCA_DUMP_PACKET_SIZE] = { 0 };
>>>>         u16 seq_no;
>>>>         u32 dump_size;
>>>> +       u32 rx_size;
>>>> +       enum qca_btsoc_type soc_type = qca_soc_type(hu);
>>>>
>>>>         while ((skb = skb_dequeue(&qca->rx_memdump_q))) {
>>>>
>>>> @@ -1029,6 +1032,7 @@ static void qca_controller_memdump(struct work_struct *work)
>>>>
>>>>                         skb_pull(skb, sizeof(dump_size));
>>>>                         memdump_buf = vmalloc(dump_size);
>>>> +                       qca_memdump->ram_dump_size = dump_size;
>>>>                         qca_memdump->memdump_buf_head = memdump_buf;
>>>>                         qca_memdump->memdump_buf_tail = memdump_buf;
>>>>                 }
>>>> @@ -1052,25 +1056,52 @@ static void qca_controller_memdump(struct work_struct *work)
>>>>                  * packets in the buffer.
>>>>                  */
>>>>                 while ((seq_no > qca_memdump->current_seq_no + 1) &&
>>>> +                       (soc_type != QCA_QCA6390) &&
>>>
>>> This probably shouldn't be SOC specific.
>>>
>> make sense. but this logic block should be skipped for QCA6390
>> the present logic to fix controller missing packets for the other products
>> is not suitable for QCA6390. for QCA6390, it doesn't miss packet and sequence
>> number field of the packet maybe have data error, but serdev driver doesn't propagate
>> these error info detected by UART driver to bluetooth driver. so the sequence number
>> extracted from packet received is not reliable.
> 
> Ok -- then I think it would be clearer to just set seq_no =
> qca_memdump->current_seq_no for QCA6390 and leave a comment about it.
> 
comment is perfect . i will add it at v3
actually. seq_no is only used for prompting possible error packat received
and it doesn't have virtual usage for QCA6390.
i would like to keep the original logic based on below reasons
1) reduce code complexity
2) don't make it SOC specific as much as possible
3) we ignore sequence number and just collects all packates received without
any correction for QCA6390
>>
>>>>                         seq_no != QCA_LAST_SEQUENCE_NUM) {
>>>>                         bt_dev_err(hu->hdev, "QCA controller missed packet:%d",
>>>>                                    qca_memdump->current_seq_no);
>>>> +                       rx_size = qca_memdump->received_dump;
>>>> +                       rx_size += QCA_DUMP_PACKET_SIZE;
>>>> +                       if (rx_size > qca_memdump->ram_dump_size) {
>>>> +                               bt_dev_err(hu->hdev,
>>>> +                                               "QCA memdump received %d, no space for missed packet",
>>>> +                                               qca_memdump->received_dump);
>>>> +                               break;
>>>> +                       }
>>>>                         memcpy(memdump_buf, nullBuff, QCA_DUMP_PACKET_SIZE);
>>>>                         memdump_buf = memdump_buf + QCA_DUMP_PACKET_SIZE;
>>>>                         qca_memdump->received_dump += QCA_DUMP_PACKET_SIZE;
>>>>                         qca_memdump->current_seq_no++;
>>>>                 }
>>>
>>> You can replace this loop with a memset(memdump_buf, 0, (seq_no -
>>> qca_memdump->current_seq_no) * QCA_DUMP_PACKET_SIZE). This simplifies
>>> the ram_dump_size check as well because it won't zero fill until the
>>> end anymore (meaning a single bad seq_no doesn't make the rest of the
>>> dump incorrect).
>>>
>> i don't think so
>> as explained above, the sequence number is not reliable, so we can't memset buffer
>> area calculated from seqence number. i just dump all the packets we received without
>> any handling for QCA6390.
> 
> I suggest the following:
> 
> /* For QCA6390, ignore the seq_no and always assume packets are in order */
> if (soc_type == QCA_QCA6390 && seq_no != QCA_LAST_SEQUENCE_NUM) {
>     seq_no = qca_memdump->current_seq_no;
> } else if (seq_no > qca_memdump->current_seq_no &&
>              seq_no != QCA_LAST_SEQUENCE_NUM) {
>     /* For bounds checking, add the sizes of the current pkt + the
> number of missing pkts.
>      * If the given seq_no exceeds the allocated size of the dump,
> assume the seq_no is
>      * wrong.
>      */
>     rx_size = (seq_no - qca_memdump->current_seq_no) * QCA_DUMP_PACKET_SIZE;
>     if (rx_size + skb->len <= (qca_memdump->ram_dump_size -
> qca_memdump->received_dump)) {
>         memset(memdump_buf, 0, rx_size);
>         memdump_buf += rx_size;
>         qca_memdump->received_dump += rx_size;
>         qca_memdump->current_seq_no = seq_no;
>     } else {
>         seq_no = qca_memdump->current_seq_no;
>     }
> }
> as explained above. this will add code complexity and doesn't have much difference
with current logic.
>>>>
>>>> -               memcpy(memdump_buf, (unsigned char *) skb->data, skb->len);
>>>> -               memdump_buf = memdump_buf + skb->len;
>>>> -               qca_memdump->memdump_buf_tail = memdump_buf;
>>>> -               qca_memdump->current_seq_no = seq_no + 1;
>>>> -               qca_memdump->received_dump += skb->len;
>>>> +               rx_size = qca_memdump->received_dump + skb->len;
>>>> +               if (rx_size <= qca_memdump->ram_dump_size) {
>>>> +                       if ((seq_no != QCA_LAST_SEQUENCE_NUM) &&
>>>> +                                       (seq_no != qca_memdump->current_seq_no))
>>>> +                               bt_dev_err(hu->hdev,
>>>> +                                               "QCA memdump unexpected packet %d",
>>>> +                                               seq_no);
> 
> This message doesn't make sense here anymore and should be removed.
> 
see above explaination.
>>>> +                       bt_dev_dbg(hu->hdev,
>>>> +                                       "QCA memdump packet %d with length %d",
>>>> +                                       seq_no, skb->len);
>>>> +                       memcpy(memdump_buf, (unsigned char *)skb->data,
>>>> +                                       skb->len);
>>>> +                       memdump_buf = memdump_buf + skb->len;
>>>> +                       qca_memdump->memdump_buf_tail = memdump_buf;
>>>> +                       qca_memdump->current_seq_no = seq_no + 1;
>>>> +                       qca_memdump->received_dump += skb->len;
>>>> +               } else {
>>>> +                       bt_dev_err(hu->hdev,
>>>> +                                       "QCA memdump received %d, no space for packet %d",
>>>> +                                       qca_memdump->received_dump, seq_no);
>>>> +               }
>>>>                 qca->qca_memdump = qca_memdump;
>>>>                 kfree_skb(skb);
>>>>                 if (seq_no == QCA_LAST_SEQUENCE_NUM) {
>>>> -                       bt_dev_info(hu->hdev, "QCA writing crash dump of size %d bytes",
>>>> -                                  qca_memdump->received_dump);
>>>> +                       bt_dev_info(hu->hdev,
>>>> +                                       "QCA memdump Done, received %d, total %d",
>>>> +                                       qca_memdump->received_dump,
>>>> +                                       qca_memdump->ram_dump_size);
>>>>                         memdump_buf = qca_memdump->memdump_buf_head;
>>>>                         dev_coredumpv(&hu->serdev->dev, memdump_buf,
>>>>                                       qca_memdump->received_dump, GFP_KERNEL);
>>>> --
>>>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
>>>>
>>
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
