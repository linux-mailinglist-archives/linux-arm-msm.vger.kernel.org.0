Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CDB5443E69
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Nov 2021 09:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbhKCIdl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>); Wed, 3 Nov 2021 04:33:41 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:51154 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230463AbhKCIdl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Nov 2021 04:33:41 -0400
Received: from smtpclient.apple (p4fefc15c.dip0.t-ipconnect.de [79.239.193.92])
        by mail.holtmann.org (Postfix) with ESMTPSA id CBC78CED07;
        Wed,  3 Nov 2021 09:31:03 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH v1] Bluetooth: btusb: correct nvm file name for WCN6855
 btsoc
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <6953ba78cc31b7bc1a188b998f6c6b8c@codeaurora.org>
Date:   Wed, 3 Nov 2021 09:31:03 +0100
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
Message-Id: <06F02AA4-57B3-48C8-8366-DEE672C510FA@holtmann.org>
References: <6953ba78cc31b7bc1a188b998f6c6b8c@codeaurora.org>
To:     tjiang@codeaurora.org
X-Mailer: Apple Mail (2.3693.20.0.1.32)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Tim,

> As we name nvm file by using big-endian for boardID, so align host with it.
> 
> Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
> ---
> drivers/bluetooth/btusb.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 46d892bbde62..572d64524cf3 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -3072,7 +3072,7 @@ static void btusb_generate_qca_nvm_name(char *fwname, size_t max_size,
> 	u16 flag = le16_to_cpu(ver->flag);
> 
> 	if (((flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
> -		u16 board_id = le16_to_cpu(ver->board_id);
> +		u16 board_id = be16_to_cpu(ver->board_id);
> 		const char *variant;

this change is not matching the commit description. It makes no sense. This is about your ver data structure and not your filename.

So inside your ver struct you have a mix of little-endian and bit-endian fields?

Regards

Marcel

