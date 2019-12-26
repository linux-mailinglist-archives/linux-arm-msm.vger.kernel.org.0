Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A87812AE79
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2019 21:30:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbfLZUao convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Dec 2019 15:30:44 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:41615 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726653AbfLZUao (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Dec 2019 15:30:44 -0500
Received: from [192.168.0.171] (188.147.97.8.nat.umts.dynamic.t-mobile.pl [188.147.97.8])
        by mail.holtmann.org (Postfix) with ESMTPSA id AD5D2CECEC;
        Thu, 26 Dec 2019 21:39:56 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: [PATCH v2 3/4] Bluetooth: hci_qca: Enable power off/on support
 during hci down/up for QCA Rome
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20191226064554.16803-3-rjliao@codeaurora.org>
Date:   Thu, 26 Dec 2019 21:30:42 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <322B016A-8F88-4AE2-8E21-5A95263FCF81@holtmann.org>
References: <20191225060317.5258-1-rjliao@codeaurora.org>
 <20191226064554.16803-1-rjliao@codeaurora.org>
 <20191226064554.16803-3-rjliao@codeaurora.org>
To:     Rocky Liao <rjliao@codeaurora.org>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rocky,

> This patch registers hdev->shutdown() callback and also sets
> HCI_QUIRK_NON_PERSISTENT_SETUP for QCA Rome. It will power-off the BT chip
> during hci down and power-on/initialize the chip again during hci up.
> 
> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
> ---
> 
> Changes in v2: None
> 
> drivers/bluetooth/hci_qca.c | 5 +++++
> 1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 45042aa27fa4..7e202041ed77 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1300,6 +1300,11 @@ static int qca_setup(struct hci_uart *hu)
> 	} else {
> 		bt_dev_info(hdev, "ROME setup");
> 		if (hu->serdev) {
> +			/* Enable NON_PERSISTENT_SETUP QUIRK to ensure to
> +			 * execute setup for every hci up.
> +			 */
> +			set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
> +			hu->hdev->shutdown = qca_power_off;

why are you setting it in the ->setup callback and not in the ->probe callback?

Regards

Marcel

