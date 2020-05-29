Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC0751E7C35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 13:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbgE2LrU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 May 2020 07:47:20 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:56649 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725865AbgE2LrT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 May 2020 07:47:19 -0400
Received: from marcel-macbook.fritz.box (p4fefc5a7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 163CACECD3;
        Fri, 29 May 2020 13:57:04 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v4] bluetooth: hci_qca: Fix QCA6390 memdump failure
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1590722015-3495-1-git-send-email-zijuhu@codeaurora.org>
Date:   Fri, 29 May 2020 13:47:17 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, tientzu@chromium.org
Content-Transfer-Encoding: 8BIT
Message-Id: <15B9E128-2C96-4DEB-8485-067079DDEF97@holtmann.org>
References: <1590722015-3495-1-git-send-email-zijuhu@codeaurora.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Zijun,

> QCA6390 memdump VSE sometimes come to bluetooth driver
> with wrong sequence number as illustrated as follows:
> frame # in dec: frame data in hex
> 1396: ff fd 01 08 74 05 00 37 8f 14
> 1397: ff fd 01 08 75 05 00 ff bf 38
> 1414: ff fd 01 08 86 05 00 fb 5e 4b
> 1399: ff fd 01 08 77 05 00 f3 44 0a
> 1400: ff fd 01 08 78 05 00 ca f7 41
> it is mistook for controller missing packets, so results
> in page fault after overwriting memdump buffer allocated.
> 
> Fixed by ignoring QCA6390 sequence number check and
> checking buffer space before writing.
> 
> Signed-off-by: Zijun Hu <zijuhu@codeaurora.org>
> Tested-by: Zijun Hu <zijuhu@codeaurora.org>
> ---
> Changes in v4:
> - add a piece of code comments
> Changes in v3:
> - correct coding style
> Changes in v2:
> - rename a local variable from @temp to @rx_size
> 
> drivers/bluetooth/hci_qca.c | 49 ++++++++++++++++++++++++++++++++++++++-------
> 1 file changed, 42 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index e4a6823..4acac13 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -114,6 +114,7 @@ struct qca_memdump_data {
> 	char *memdump_buf_tail;
> 	u32 current_seq_no;
> 	u32 received_dump;
> +	u32 ram_dump_size;
> };
> 
> struct qca_memdump_event_hdr {
> @@ -976,6 +977,8 @@ static void qca_controller_memdump(struct work_struct *work)
> 	char nullBuff[QCA_DUMP_PACKET_SIZE] = { 0 };
> 	u16 seq_no;
> 	u32 dump_size;
> +	u32 rx_size;
> +	enum qca_btsoc_type soc_type = qca_soc_type(hu);
> 
> 	while ((skb = skb_dequeue(&qca->rx_memdump_q))) {
> 
> @@ -1029,6 +1032,7 @@ static void qca_controller_memdump(struct work_struct *work)
> 
> 			skb_pull(skb, sizeof(dump_size));
> 			memdump_buf = vmalloc(dump_size);
> +			qca_memdump->ram_dump_size = dump_size;
> 			qca_memdump->memdump_buf_head = memdump_buf;
> 			qca_memdump->memdump_buf_tail = memdump_buf;
> 		}
> @@ -1051,26 +1055,57 @@ static void qca_controller_memdump(struct work_struct *work)
> 		 * the controller. In such cases let us store the dummy
> 		 * packets in the buffer.
> 		 */
> +		/* For QCA6390, controller does not lost packets but
> +		 * sequence number field of packat sometimes has error
> +		 * bits, so skip this checking for missing packet.
> +		 */
> 		while ((seq_no > qca_memdump->current_seq_no + 1) &&
> +			(soc_type != QCA_QCA6390) &&
> 			seq_no != QCA_LAST_SEQUENCE_NUM) {
> 			bt_dev_err(hu->hdev, "QCA controller missed packet:%d",
> 				   qca_memdump->current_seq_no);
> +			rx_size = qca_memdump->received_dump;
> +			rx_size += QCA_DUMP_PACKET_SIZE;
> +			if (rx_size > qca_memdump->ram_dump_size) {
> +				bt_dev_err(hu->hdev,
> +						"QCA memdump received %d, no space for missed packet",
> +						qca_memdump->received_dump);

please use correct indentation according to the coding style.

Regards

Marcel

