Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9563C391B66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 17:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235351AbhEZPPh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 11:15:37 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:56267 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235348AbhEZPPf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 11:15:35 -0400
Received: from smtpclient.apple (p4fefc9d6.dip0.t-ipconnect.de [79.239.201.214])
        by mail.holtmann.org (Postfix) with ESMTPSA id ACDBFCED1D;
        Wed, 26 May 2021 17:21:57 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH v1] Bluetooth: btusb: use default nvm if boardID is 0 for
 wcn6855.
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1618996576-7743-1-git-send-email-zijuhu@codeaurora.org>
Date:   Wed, 26 May 2021 17:14:01 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, tjiang@codeaurora.org
Content-Transfer-Encoding: 8BIT
Message-Id: <0200EB0E-F931-43F1-B1CB-E19127BE9A70@holtmann.org>
References: <1618996576-7743-1-git-send-email-zijuhu@codeaurora.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Zijun,

> if boardID is 0, will use the default nvm file without surfix.
> 
> Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
> ---
> drivers/bluetooth/btusb.c | 11 ++++++++---
> 1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 6f25337..61afea9 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -4138,9 +4138,14 @@ static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
> 	int err;
> 
> 	if (((ver->flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
> -		snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x_%04x.bin",
> -			 le32_to_cpu(ver->rom_version),
> -			 le16_to_cpu(ver->board_id));
> +		if (le16_to_cpu(ver->board_id) == 0x0) { //if boardid equal 0, use default nvm.

this comment style is not acceptable.

> +			snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x.bin",
> +				 le32_to_cpu(ver->rom_version));
> +		} else {
> +			snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x_%04x.bin",
> +				le32_to_cpu(ver->rom_version),
> +				le16_to_cpu(ver->board_id));
> +		}
> 	} else {
> 		snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x.bin",
> 			 le32_to_cpu(ver->rom_version));

Regards

Marcel

