Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25A1344AAA7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 10:37:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243264AbhKIJkT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>); Tue, 9 Nov 2021 04:40:19 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:50659 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241297AbhKIJkS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 04:40:18 -0500
Received: from smtpclient.apple (p4fefc15c.dip0.t-ipconnect.de [79.239.193.92])
        by mail.holtmann.org (Postfix) with ESMTPSA id 7280ECED1E;
        Tue,  9 Nov 2021 10:37:31 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH v3] Bluetooth: btusb: re-definition for board_id in struct
  qca_version
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <305e41a55a4c117da86f786c374a57dc@codeaurora.org>
Date:   Tue, 9 Nov 2021 10:37:31 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        c-hbandi@codeaurora.org, Hemantg <hemantg@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rocky Liao <rjliao@codeaurora.org>, zijuhu@codeaurora.org
Content-Transfer-Encoding: 8BIT
Message-Id: <8E687716-E810-4A46-B010-A08BB261D2FF@holtmann.org>
References: <305e41a55a4c117da86f786c374a57dc@codeaurora.org>
To:     tjiang@codeaurora.org
X-Mailer: Apple Mail (2.3693.20.0.1.32)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Tim,

> As qc btsoc will using big-endian for boardID, so align host with it.
> 
> Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
> ---
> drivers/bluetooth/btusb.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 46d892bbde62..a51b1d641043 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -2883,7 +2883,7 @@ struct qca_version {
> 	__le32	rom_version;
> 	__le32	patch_version;
> 	__le32	ram_version;
> -	__le16	board_id;
> +	__u8	board_id[2];
> 	__le16	flag;
> 	__u8	reserved[4];
> } __packed;
> @@ -3072,7 +3072,7 @@ static void btusb_generate_qca_nvm_name(char *fwname, size_t max_size,
> 	u16 flag = le16_to_cpu(ver->flag);
> 
> 	if (((flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
> -		u16 board_id = le16_to_cpu(ver->board_id);
> +		u16 board_id = (ver->board_id[0] << 8) + ver->board_id[1];
> 		const char *variant;
> 
> 		switch (le32_to_cpu(ver->ram_version)) {

explain to me why I would merge this. The commit message is sparse even after I asked to explain things.

I am also not merging this handwaving endian handling. Define it is be16 or le16 and clearly state what it is. If Qualcomm screwed up the memory layout of their NVM, then say that.

Regards

Marcel

