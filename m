Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B7CF41C49D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Sep 2021 14:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343627AbhI2MZR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Sep 2021 08:25:17 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:40492 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245563AbhI2MZQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Sep 2021 08:25:16 -0400
Received: from smtpclient.apple (p5b3d2185.dip0.t-ipconnect.de [91.61.33.133])
        by mail.holtmann.org (Postfix) with ESMTPSA id 09636CECF8;
        Wed, 29 Sep 2021 14:23:34 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v1] Bluetooth: btusb: Add the new support IDs for WCN6855
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <d7b3f7d75e58b81081b11e8f3ac7e536@codeaurora.org>
Date:   Wed, 29 Sep 2021 14:23:33 +0200
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
Message-Id: <95D9737D-62AD-486C-A30B-D49CD1101300@holtmann.org>
References: <d7b3f7d75e58b81081b11e8f3ac7e536@codeaurora.org>
To:     tjiang@codeaurora.org
X-Mailer: Apple Mail (2.3654.120.0.1.13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Tim,

> Add some new support IDs to usb_device_id table for WCN6855.
> 
> Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
> ---
> drivers/bluetooth/btusb.c | 37 +++++++++++++++++++++++++++++++++++++
> 1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index 34363d3c85e5..346cb1ea93a6 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -295,6 +295,43 @@ static const struct usb_device_id blacklist_table[] = {
> 	{ USB_DEVICE(0x0cf3, 0xe600), .driver_info = BTUSB_QCA_WCN6855 |
> 						     BTUSB_WIDEBAND_SPEECH |
> 						     BTUSB_VALID_LE_STATES },
> +	{ USB_DEVICE(0x0489, 0xe0cc), .driver_info = BTUSB_QCA_WCN6855 |
> +						     BTUSB_WIDEBAND_SPEECH |
> +						     BTUSB_VALID_LE_STATES },
> +	{ USB_DEVICE(0x0489, 0xe0c9), .driver_info = BTUSB_QCA_WCN6855 |
> +						     BTUSB_WIDEBAND_SPEECH |
> +						     BTUSB_VALID_LE_STATES },
> +	{ USB_DEVICE(0x0489, 0xe0d6), .driver_info = BTUSB_QCA_WCN6855 |
> +						     BTUSB_WIDEBAND_SPEECH |
> +						     BTUSB_VALID_LE_STATES },
> +	{ USB_DEVICE(0x0489, 0xe0e3), .driver_info = BTUSB_QCA_WCN6855 |
> +						     BTUSB_WIDEBAND_SPEECH |
> +						     BTUSB_VALID_LE_STATES },
> +	{ USB_DEVICE(0x0489, 0xe0d0), .driver_info = BTUSB_QCA_WCN6855 |
> +						     BTUSB_WIDEBAND_SPEECH |
> +						     BTUSB_VALID_LE_STATES },
> +	{ USB_DEVICE(0x0489, 0xe0df), .driver_info = BTUSB_QCA_WCN6855 |
> +						     BTUSB_WIDEBAND_SPEECH |
> +						     BTUSB_VALID_LE_STATES },
> +	{ USB_DEVICE(0x0489, 0xe0e1), .driver_info = BTUSB_QCA_WCN6855 |
> +						     BTUSB_WIDEBAND_SPEECH |
> +						     BTUSB_VALID_LE_STATES },
> +	{ USB_DEVICE(0x04ca, 0x3025), .driver_info = BTUSB_QCA_WCN6855 |
> +						     BTUSB_WIDEBAND_SPEECH |
> +						     BTUSB_VALID_LE_STATES },
> +	{ USB_DEVICE(0x10ab, 0x9608), .driver_info = BTUSB_QCA_WCN6855 |
> +						     BTUSB_WIDEBAND_SPEECH |
> +						     BTUSB_VALID_LE_STATES },
> +	{ USB_DEVICE(0x10ab, 0x9609), .driver_info = BTUSB_QCA_WCN6855 |
> +						     BTUSB_WIDEBAND_SPEECH |
> +						     BTUSB_VALID_LE_STATES },
> +	{ USB_DEVICE(0x10ab, 0x9308), .driver_info = BTUSB_QCA_WCN6855 |
> +						     BTUSB_WIDEBAND_SPEECH |
> +						     BTUSB_VALID_LE_STATES },
> +	{ USB_DEVICE(0x10ab, 0x9309), .driver_info = BTUSB_QCA_WCN6855 |
> +						     BTUSB_WIDEBAND_SPEECH |
> +						     BTUSB_VALID_LE_STATES },
> +

nobody is sending patches like this. Everybody includes /sys/kernel/debug/usb/devices portion and describes the devices.

Regards

Marcel

