Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3C6C26B7AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 02:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbgIPA1b convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 20:27:31 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:40526 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726775AbgIOOHH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 10:07:07 -0400
Received: from marcel-macbook.fritz.box (p4ff9f430.dip0.t-ipconnect.de [79.249.244.48])
        by mail.holtmann.org (Postfix) with ESMTPSA id 563C7CECEF;
        Tue, 15 Sep 2020 16:03:57 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH v2] Bluetooth: btusb: Add Qualcomm Bluetooth SoC WCN6855
 support
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <c9912094c4627b34f49458ae36c9cd25@codeaurora.org>
Date:   Tue, 15 Sep 2020 15:57:00 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        open list <linux-kernel@vger.kernel.org>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <A89496D5-1CDD-499E-B167-FA2064BDF1A7@holtmann.org>
References: <0101017457c6b819-d1292819-1fae-43af-8fb8-3bc572f53cd5-000000@us-west-2.amazonses.com>
 <20200914092744.17464-1-rjliao@codeaurora.org>
 <4FCC6630-8350-4E4A-B156-42B2F3581BFD@holtmann.org>
 <c9912094c4627b34f49458ae36c9cd25@codeaurora.org>
To:     Rocky Liao <rjliao@codeaurora.org>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rocky,

>>> This patch add support for WCN6855 i.e. patch and nvm download
>>> support.
>>> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
>>> ---
>>> drivers/bluetooth/btusb.c | 50 ++++++++++++++++++++++++++++++++++-----
>>> 1 file changed, 44 insertions(+), 6 deletions(-)
>>> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
>>> index fe80588c7bd3..789e8d5e829e 100644
>>> --- a/drivers/bluetooth/btusb.c
>>> +++ b/drivers/bluetooth/btusb.c
>>> @@ -59,6 +59,7 @@ static struct usb_driver btusb_driver;
>>> #define BTUSB_MEDIATEK		0x200000
>>> #define BTUSB_WIDEBAND_SPEECH	0x400000
>>> #define BTUSB_VALID_LE_STATES   0x800000
>>> +#define BTUSB_QCA_WCN6855	0x1000000
>>> static const struct usb_device_id btusb_table[] = {
>>> 	/* Generic Bluetooth USB device */
>>> @@ -273,6 +274,10 @@ static const struct usb_device_id blacklist_table[] = {
>>> 	{ USB_DEVICE(0x13d3, 0x3496), .driver_info = BTUSB_QCA_ROME },
>>> 	{ USB_DEVICE(0x13d3, 0x3501), .driver_info = BTUSB_QCA_ROME },
>>> +	/* QCA WCN6855 chipset */
>>> +	{ USB_DEVICE(0x0cf3, 0xe600), .driver_info = BTUSB_QCA_WCN6855 |
>>> +						     BTUSB_WIDEBAND_SPEECH },
>>> +
>>> 	/* Broadcom BCM2035 */
>>> 	{ USB_DEVICE(0x0a5c, 0x2009), .driver_info = BTUSB_BCM92035 },
>>> 	{ USB_DEVICE(0x0a5c, 0x200a), .driver_info = BTUSB_WRONG_SCO_MTU },
>>> @@ -3391,6 +3396,26 @@ static int btusb_set_bdaddr_ath3012(struct hci_dev *hdev,
>>> 	return 0;
>>> }
>>> +static int btusb_set_bdaddr_wcn6855(struct hci_dev *hdev,
>>> +				const bdaddr_t *bdaddr)
>>> +{
>>> +	struct sk_buff *skb;
>>> +	u8 buf[6];
>>> +	long ret;
>>> +
>>> +	memcpy(buf, bdaddr, sizeof(bdaddr_t));
>>> +
>>> +	skb = __hci_cmd_sync(hdev, 0xfc14, sizeof(buf), buf, HCI_INIT_TIMEOUT);
>>> +	if (IS_ERR(skb)) {
>>> +		ret = PTR_ERR(skb);
>>> +		bt_dev_err(hdev, "Change address command failed (%ld)", ret);
>>> +		return ret;
>>> +	}
>>> +	kfree_skb(skb);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> #define QCA_DFU_PACKET_LEN	4096
>>> #define QCA_GET_TARGET_VERSION	0x09
>>> @@ -3428,6 +3453,8 @@ static const struct qca_device_info qca_devices_table[] = {
>>> 	{ 0x00000201, 28, 4, 18 }, /* Rome 2.1 */
>>> 	{ 0x00000300, 28, 4, 18 }, /* Rome 3.0 */
>>> 	{ 0x00000302, 28, 4, 18 }, /* Rome 3.2 */
>>> +	{ 0x00130100, 40, 4, 18 }, /* WCN6855 1.0 */
>>> +	{ 0x00130200, 40, 4, 18 }  /* WCN6855 2.0 */
>>> };
>>> static int btusb_qca_send_vendor_req(struct usb_device *udev, u8 request,
>>> @@ -3529,8 +3556,8 @@ static int btusb_setup_qca_load_rampatch(struct hci_dev *hdev,
>>> {
>>> 	struct qca_rampatch_version *rver;
>>> 	const struct firmware *fw;
>>> -	u32 ver_rom, ver_patch;
>>> -	u16 rver_rom, rver_patch;
>>> +	u32 ver_rom, ver_patch, rver_rom;
>>> +	u16 rver_rom_low, rver_rom_high, rver_patch;
>>> 	char fwname[64];
>>> 	int err;
>>> @@ -3549,9 +3576,16 @@ static int btusb_setup_qca_load_rampatch(struct hci_dev *hdev,
>>> 	bt_dev_info(hdev, "using rampatch file: %s", fwname);
>>> 	rver = (struct qca_rampatch_version *)(fw->data + info->ver_offset);
>>> -	rver_rom = le16_to_cpu(rver->rom_version);
>>> +	rver_rom_low = le16_to_cpu(rver->rom_version);
>>> 	rver_patch = le16_to_cpu(rver->patch_version);
>>> +	if (ver_rom & ~0xffffU) {
>>> +		rver_rom_high = le16_to_cpu(*(__le16 *)(fw->data + 16));
>>> +		rver_rom = le32_to_cpu(rver_rom_high << 16 | rver_rom_low);
>>> +	} else {
>>> +		rver_rom = (__force u32)rver_rom_low;
>>> +	}
>>> +
>> I don’t get this. Is anything wrong with get_unaligned_le32 etc.?
>> My brain just hurts with your casting and pointer magic. Maybe the
>> whole rver logic needs a clean up first.
> It's not a 4 bytes le data, for example the version stream is 0x13, 0x00, 0x00, 0x01 and we need to convert it to 0x00130100. So we have to convert it to 2 u16 value then combine them to a u32.

what is it then? Is it big endian formatted. If it is not a 32-bit value, then don’t store it as one.

Regards

Marcel

