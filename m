Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0AB93F1C22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Aug 2021 17:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240688AbhHSPDu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Aug 2021 11:03:50 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:44650 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240652AbhHSPDs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Aug 2021 11:03:48 -0400
Received: from smtpclient.apple (p5b3d23f8.dip0.t-ipconnect.de [91.61.35.248])
        by mail.holtmann.org (Postfix) with ESMTPSA id 5B6BCCED16;
        Thu, 19 Aug 2021 17:03:10 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH] Bluetooth: hci_qca: Set SSR triggered flags when SSR
 command is sent out
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <086f2add931ff541c8a6349767ae2adc@codeaurora.org>
Date:   Thu, 19 Aug 2021 17:03:09 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:BLUETOOTH SUBSYSTEM" <linux-bluetooth@vger.kernel.org>,
        Hemantg <hemantg@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>, pharish@codeaurora.org,
        Rocky Liao <rjliao@codeaurora.org>, hbandi@codeaurora.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        mcchou@chromium.org
Content-Transfer-Encoding: 8BIT
Message-Id: <6238C7AB-32D7-4D12-A14E-24D12A862405@holtmann.org>
References: <1629091302-7893-1-git-send-email-bgodavar@codeaurora.org>
 <1CE27E9C-EABD-4B25-B255-8925297D11BD@holtmann.org>
 <086f2add931ff541c8a6349767ae2adc@codeaurora.org>
To:     Balakrishna Godavarthi <bgodavar@codeaurora.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Balakrishna,

>>> This change sets SSR triggered flags when QCA SSR command is sent to
>>> SoC. After the SSR command sent, driver discards the incoming data from
>>> the upper layers. This way will ensure to read full dumps from the
>>> BT SoC without any flow control issues due to excess of data receiving
>>> from the HOST in audio usecases.
>>> Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
>>> ---
>>> drivers/bluetooth/hci_qca.c | 10 ++++++++++
>>> 1 file changed, 10 insertions(+)
>>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>>> index 53deea2..5cbed6a 100644
>>> --- a/drivers/bluetooth/hci_qca.c
>>> +++ b/drivers/bluetooth/hci_qca.c
>>> @@ -69,6 +69,8 @@
>>> #define QCA_LAST_SEQUENCE_NUM		0xFFFF
>>> #define QCA_CRASHBYTE_PACKET_LEN	1096
>>> #define QCA_MEMDUMP_BYTE		0xFB
>>> +#define QCA_SSR_OPCODE			0xFC0C
>>> +#define QCA_SSR_PKT_LEN		5
>>> enum qca_flags {
>>> 	QCA_IBS_DISABLED,
>>> @@ -871,6 +873,14 @@ static int qca_enqueue(struct hci_uart *hu, struct sk_buff *skb)
>>> 	/* Prepend skb with frame type */
>>> 	memcpy(skb_push(skb, 1), &hci_skb_pkt_type(skb), 1);
>>> +	if (hci_skb_pkt_type(skb) == HCI_COMMAND_PKT &&
>>> +	    skb->len == QCA_SSR_PKT_LEN &&
>>> +	    hci_skb_opcode(skb) == QCA_SSR_OPCODE) {
>>> +		bt_dev_info(hu->hdev, "Triggering ssr");
>>> +		set_bit(QCA_SSR_TRIGGERED, &qca->flags);
>>> +		set_bit(QCA_MEMDUMP_COLLECTION, &qca->flags);
>>> +	}
>>> +
>> can we please stop hacking around by parsing opcodes in an enqueue
>> function. Sounds like someone is injecting raw HCI vendor commands and
>> then having a driver react to it.
> [Bala]: yes this opcode is injected via hcitool to test BT SoC dump procedure or
> to collect the dumps to debug the issue during issue cases. When audio usecases are running,
> HOST sends ACL packets to SoC, in meantime if this command is sent to SoC using hcitool
> to collect dumps at particular point,  With out this check HOST is pumping continues data to
> SoC and SoC RFR line goes high, sometimes SoC become unresponsive and driver starts logging
> command timeout error. Instead here, once a cmd with this opcode is sent, timer is started
> to ensure that SSR is in progress. If no response from SoC for 8 seconds. Driver will be restarted.

so why would I add a kernel work-around for this?

Design a proper interface for this and don’t rely on injecting HCI commands via HCI raw channel.

Regards

Marcel

