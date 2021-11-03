Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85978444361
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Nov 2021 15:24:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231517AbhKCO1d convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>); Wed, 3 Nov 2021 10:27:33 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:44428 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbhKCO1d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Nov 2021 10:27:33 -0400
Received: from smtpclient.apple (p4fefc15c.dip0.t-ipconnect.de [79.239.193.92])
        by mail.holtmann.org (Postfix) with ESMTPSA id 9F9D9CED12;
        Wed,  3 Nov 2021 15:24:53 +0100 (CET)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH v2] Bluetooth: btusb: using big-endian definition for
 board_id in struct qca_version
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <c92c38b60b1b55b5d72f7f1c718641e1@codeaurora.org>
Date:   Wed, 3 Nov 2021 15:24:53 +0100
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
Message-Id: <90D7F483-BCD9-430C-94EA-4018237ABE36@holtmann.org>
References: <c92c38b60b1b55b5d72f7f1c718641e1@codeaurora.org>
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
> drivers/bluetooth/btusb.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 46d892bbde62..08a1c6d8390f 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -2883,7 +2883,7 @@ struct qca_version {
> 	__le32	rom_version;
> 	__le32	patch_version;
> 	__le32	ram_version;
> -	__le16	board_id;
> +	__be16	board_id;
> 	__le16	flag;
> 	__u8	reserved[4];
> } __packed;
> @@ -3072,7 +3072,7 @@ static void btusb_generate_qca_nvm_name(char *fwname, size_t max_size,
> 	u16 flag = le16_to_cpu(ver->flag);
> 
> 	if (((flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
> -		u16 board_id = le16_to_cpu(ver->board_id);
> +		u16 board_id = be16_to_cpu(ver->board_id);
> 		const char *variant;

my original comment still stands. Are you sure you are doing this correctly. The in-memory layout of your NVM is mixed little-endian and big-endian? Really? Or do you want to convert back from host endian to big endian?

You commit message text suggest that you have to do this:

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 46d892bbde62..55a33a5fea56 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3090,7 +3090,7 @@ static void btusb_generate_qca_nvm_name(char *fwname, size_t max_size,
                                rom_version, variant);
                } else {
                        snprintf(fwname, max_size, "qca/nvm_usb_%08x%s_%04x.bin",
-                               rom_version, variant, board_id);
+                               rom_version, variant, cpu_to_be16(board_id));
                }
        } else {
                snprintf(fwname, max_size, "qca/nvm_usb_%08x.bin”,

And really, I can not do this anymore. Write lengthy commit messages explaining your change in detail. I am not looking a patches anymore until they have a proper paragraph explaining the change and why it is correct.

Also this change had v16 before I merged and even in that version I had to fix issues. Please stop wasting my time. I have no idea why this wasn’t caught earlier. It is a fundamental flaw. I am close to just reverting the previous patch since it seems it clearly needs more testing.

Regards

Marcel

