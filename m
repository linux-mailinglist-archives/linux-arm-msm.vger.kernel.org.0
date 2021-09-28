Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7154B41AD80
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 13:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239863AbhI1LFR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 07:05:17 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:59007 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239306AbhI1LFQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 07:05:16 -0400
Received: from smtpclient.apple (p5b3d2185.dip0.t-ipconnect.de [91.61.33.133])
        by mail.holtmann.org (Postfix) with ESMTPSA id 072DDCECD9;
        Tue, 28 Sep 2021 13:03:35 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v11] Bluetooth: btusb: Add support using different nvm for
  variant WCN6855 controller
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <25d13858fced474d0d71faed2d829032@codeaurora.org>
Date:   Tue, 28 Sep 2021 13:03:35 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        open list <linux-kernel@vger.kernel.org>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, zijuhu@codeaurora.org
Content-Transfer-Encoding: 8BIT
Message-Id: <C8C7AC2D-7A0C-4FCB-8D60-5705D86BC50B@holtmann.org>
References: <25d13858fced474d0d71faed2d829032@codeaurora.org>
To:     tjiang@codeaurora.org
X-Mailer: Apple Mail (2.3654.120.0.1.13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Tim,

> the RF performance of wcn6855 soc chip from different foundries will be
> difference, so we should use different nvm to configure them.
> 
> Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
> ---
> drivers/bluetooth/btusb.c | 49 ++++++++++++++++++++++++++++++++++-------------
> 1 file changed, 36 insertions(+), 13 deletions(-)

I am done reviewing this patch and frankly I don’t care how urgent this is for your new chip; and how many times you ping me privately about it. So please find someone else to write and send patches. This is not acceptable behavior here.

If you are blindly ignoring the review comments from Matthias, then I have no idea what to do. This is such a simple patch and it takes 12 revision to get this done.

static void btusb_generate_qca_nvm_name(char *fwname, size_t max_size, const struct qca_version *ver)
{
	u32 rom_version = le32_to_cpu(ver->rom_version);

	if (((ver->flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
		u16 board_id = le16_to_cpu(ver->board_id);
		const char *variant;

		switch (le32_to_cpu(ver->ram_version)) {
		case WCN6855_2_0_RAM_VERSION_GF:
		case WCN6855_2_1_RAM_VERSION_GF:
			variant = “_gf”;
			break;
		default:
			variant = “”;
			break;
		}

		/* if boardid equal 0, use default nvm without suffix */
		if (board_id == 0x0)
			snprintf(fwname, max_size, "qca/nvm_usb_%08x%s.bin”,
				 rom_version, variant);
		else
			snprintf(fwname, max_size, "qca/nvm_usb_%08x%s_%04x.bin”,
				 rom_version, variant, board_id);
	} else {
		snprintf(fwname, max_size, "qca/nvm_usb_%08x.bin”, rom_version);
	}
}

Regards

Marcel

