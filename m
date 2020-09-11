Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 829C12659B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 08:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725710AbgIKG4s convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 02:56:48 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:48119 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725497AbgIKG4s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 02:56:48 -0400
Received: from marcel-macbook.fritz.box (p4ff9f430.dip0.t-ipconnect.de [79.249.244.48])
        by mail.holtmann.org (Postfix) with ESMTPSA id 15FBBCED19;
        Fri, 11 Sep 2020 09:03:41 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH v1] Bluetooth: btusb: Add Qualcomm Bluetooth SoC WCN6855
 support
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <0101017457c6b810-cb8b79ae-4663-436b-83d0-4c70c245bd25-000000@us-west-2.amazonses.com>
Date:   Fri, 11 Sep 2020 08:56:45 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org
Content-Transfer-Encoding: 8BIT
Message-Id: <2E48211B-D62D-43D8-9C97-014966FBB2CB@holtmann.org>
References: <0101017457c6b810-cb8b79ae-4663-436b-83d0-4c70c245bd25-000000@us-west-2.amazonses.com>
To:     Rocky Liao <rjliao@codeaurora.org>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rocky,

> This patch add support for WCN6855 i.e. patch and nvm download
> support.
> 
> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
> ---
> drivers/bluetooth/btusb.c | 42 +++++++++++++++++++++++++++++++++++----
> 1 file changed, 38 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index fe80588c7bd3..e51e754ca9b8 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -59,6 +59,7 @@ static struct usb_driver btusb_driver;
> #define BTUSB_MEDIATEK		0x200000
> #define BTUSB_WIDEBAND_SPEECH	0x400000
> #define BTUSB_VALID_LE_STATES   0x800000
> +#define BTUSB_QCA_WCN6855	0x1000000
> 
> static const struct usb_device_id btusb_table[] = {
> 	/* Generic Bluetooth USB device */
> @@ -273,6 +274,10 @@ static const struct usb_device_id blacklist_table[] = {
> 	{ USB_DEVICE(0x13d3, 0x3496), .driver_info = BTUSB_QCA_ROME },
> 	{ USB_DEVICE(0x13d3, 0x3501), .driver_info = BTUSB_QCA_ROME },
> 
> +	/* QCA WCN6855 chipset */
> +	{ USB_DEVICE(0x0cf3, 0xe600), .driver_info = BTUSB_QCA_WCN6855 |
> +						     BTUSB_WIDEBAND_SPEECH },
> +
> 	/* Broadcom BCM2035 */
> 	{ USB_DEVICE(0x0a5c, 0x2009), .driver_info = BTUSB_BCM92035 },
> 	{ USB_DEVICE(0x0a5c, 0x200a), .driver_info = BTUSB_WRONG_SCO_MTU },
> @@ -3391,6 +3396,26 @@ static int btusb_set_bdaddr_ath3012(struct hci_dev *hdev,
> 	return 0;
> }
> 
> +static int btusb_set_bdaddr_wcn6855(struct hci_dev *hdev,
> +				const bdaddr_t *bdaddr)
> +{
> +	struct sk_buff *skb;
> +	u8 buf[6];
> +	long ret;
> +
> +	memcpy(buf, bdaddr, sizeof(bdaddr_t));
> +
> +	skb = __hci_cmd_sync(hdev, 0xfc14, sizeof(buf), buf, HCI_INIT_TIMEOUT);
> +	if (IS_ERR(skb)) {
> +		ret = PTR_ERR(skb);
> +		bt_dev_err(hdev, "Change address command failed (%ld)", ret);
> +		return ret;
> +	}
> +	kfree_skb(skb);
> +
> +	return 0;
> +}

What is wrong with using qca_set_bdaddr() function.

> +
> #define QCA_DFU_PACKET_LEN	4096
> 
> #define QCA_GET_TARGET_VERSION	0x09
> @@ -3428,6 +3453,8 @@ static const struct qca_device_info qca_devices_table[] = {
> 	{ 0x00000201, 28, 4, 18 }, /* Rome 2.1 */
> 	{ 0x00000300, 28, 4, 18 }, /* Rome 3.0 */
> 	{ 0x00000302, 28, 4, 18 }, /* Rome 3.2 */
> +	{ 0x00130100, 40, 4, 18 }, /* WCN6855 1.0 */
> +	{ 0x00130200, 40, 4, 18 }  /* WCN6855 2.0 */
> };
> 
> static int btusb_qca_send_vendor_req(struct usb_device *udev, u8 request,
> @@ -3530,7 +3557,7 @@ static int btusb_setup_qca_load_rampatch(struct hci_dev *hdev,
> 	struct qca_rampatch_version *rver;
> 	const struct firmware *fw;
> 	u32 ver_rom, ver_patch;
> -	u16 rver_rom, rver_patch;
> +	u32 rver_rom, rver_patch;
> 	char fwname[64];
> 	int err;
> 
> @@ -3552,6 +3579,9 @@ static int btusb_setup_qca_load_rampatch(struct hci_dev *hdev,
> 	rver_rom = le16_to_cpu(rver->rom_version);
> 	rver_patch = le16_to_cpu(rver->patch_version);
> 
> +	if (ver_rom & ~0xffffU)
> +		rver_rom = *(u16 *)(fw->data + 16) << 16 | rver_rom;
> +

You will require proper unaligned access unless you can guarantee things are aligned properly. And since I assume the firmware data is in a specific endian format, you need to convert it correctly.

In addition, you change the variables to u32, but still use le16_to_cpu function above. Something is not adding up. Have you actually run a sparse check?

> 	bt_dev_info(hdev, "QCA: patch rome 0x%x build 0x%x, "
> 		    "firmware rome 0x%x build 0x%x",
> 		    rver_rom, rver_patch, ver_rom, ver_patch);
> @@ -3625,9 +3655,6 @@ static int btusb_setup_qca(struct hci_dev *hdev)
> 		return err;
> 
> 	ver_rom = le32_to_cpu(ver.rom_version);
> -	/* Don't care about high ROM versions */
> -	if (ver_rom & ~0xffffU)
> -		return 0;
> 
> 	for (i = 0; i < ARRAY_SIZE(qca_devices_table); i++) {
> 		if (ver_rom == qca_devices_table[i].rom_version)
> @@ -4063,6 +4090,13 @@ static int btusb_probe(struct usb_interface *intf,
> 		btusb_check_needs_reset_resume(intf);
> 	}
> 
> +	if (id->driver_info & BTUSB_QCA_WCN6855) {
> +		data->setup_on_usb = btusb_setup_qca;
> +		hdev->set_bdaddr = btusb_set_bdaddr_wcn6855;
> +		hdev->cmd_timeout = btusb_qca_cmd_timeout;
> +		set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
> +	}
> +

Regards

Marcel

