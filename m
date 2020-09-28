Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15F8927A554
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 04:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbgI1CLW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Sep 2020 22:11:22 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:57210 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726396AbgI1CLW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Sep 2020 22:11:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601259081; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=iWhc09D3uoAh+v6CjrqYMN1x/SDldMvdvgNKi1OpHDo=;
 b=X6/tplDVJ/6TboaUYa+pCaYUWNoAwfswF5YgDcZe5isN0dov4cD54OIoqehTcdCaPvKEaLtz
 t1xDXuH65Gp7ytuoZ0616t32J79lNcdR1Tc8jfoFnu6lMR/I7uyz12rstrLdKtA0iXqfLFKs
 OFv5o7BklhbVrsNmP+/M6X7ocho=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f714648d106659f82f4fc06 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 02:11:20
 GMT
Sender: rjliao=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B1AE9C433FE; Mon, 28 Sep 2020 02:11:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rjliao)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B1CFEC433C8;
        Mon, 28 Sep 2020 02:11:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Mon, 28 Sep 2020 10:11:19 +0800
From:   Rocky Liao <rjliao@codeaurora.org>
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        open list <linux-kernel@vger.kernel.org>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3] Bluetooth: btusb: Add Qualcomm Bluetooth SoC WCN6855
 support
In-Reply-To: <8296D361-B28F-46CA-86E1-6F7FCE62D97F@holtmann.org>
References: <20200914092744.17464-1-rjliao@codeaurora.org>
 <20200925090829.3088-1-rjliao@codeaurora.org>
 <8296D361-B28F-46CA-86E1-6F7FCE62D97F@holtmann.org>
Message-ID: <d986c0028f7d3c00bc19f7685f0ae81c@codeaurora.org>
X-Sender: rjliao@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Marcel,

在 2020-09-26 00:08，Marcel Holtmann 写道：
> Hi Rocky,
> 
>> This patch add support for WCN6855 i.e. patch and nvm download
>> support.
> 
> please always include the content of /sys/kernel/debug/usb/devices for
> this hardware.
> 
OK.

>> 
>> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
>> ---
>> drivers/bluetooth/btusb.c | 66 +++++++++++++++++++++++++++++++--------
>> 1 file changed, 53 insertions(+), 13 deletions(-)
>> 
>> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
>> index 9f294b941943..e888e4c02d69 100644
>> --- a/drivers/bluetooth/btusb.c
>> +++ b/drivers/bluetooth/btusb.c
>> @@ -59,6 +59,7 @@ static struct usb_driver btusb_driver;
>> #define BTUSB_MEDIATEK		0x200000
>> #define BTUSB_WIDEBAND_SPEECH	0x400000
>> #define BTUSB_VALID_LE_STATES   0x800000
>> +#define BTUSB_QCA_WCN6855	0x1000000
>> 
>> static const struct usb_device_id btusb_table[] = {
>> 	/* Generic Bluetooth USB device */
>> @@ -291,6 +292,10 @@ static const struct usb_device_id 
>> blacklist_table[] = {
>> 	{ USB_DEVICE(0x13d3, 0x3501), .driver_info = BTUSB_QCA_ROME |
>> 						     BTUSB_WIDEBAND_SPEECH },
>> 
>> +	/* QCA WCN6855 chipset */
>> +	{ USB_DEVICE(0x0cf3, 0xe600), .driver_info = BTUSB_QCA_WCN6855 |
>> +						     BTUSB_WIDEBAND_SPEECH },
>> +
>> 	/* Broadcom BCM2035 */
>> 	{ USB_DEVICE(0x0a5c, 0x2009), .driver_info = BTUSB_BCM92035 },
>> 	{ USB_DEVICE(0x0a5c, 0x200a), .driver_info = BTUSB_WRONG_SCO_MTU },
>> @@ -3409,6 +3414,27 @@ static int btusb_set_bdaddr_ath3012(struct 
>> hci_dev *hdev,
>> 	return 0;
>> }
>> 
>> +static int btusb_set_bdaddr_wcn6855(struct hci_dev *hdev,
>> +				const bdaddr_t *bdaddr)
>> +{
>> +	struct sk_buff *skb;
>> +	u8 buf[6];
>> +	long ret;
>> +
>> +	memcpy(buf, bdaddr, sizeof(bdaddr_t));
>> +
>> +	skb = __hci_cmd_sync_ev(hdev, 0xfc14, sizeof(buf), buf,
>> +				HCI_EV_CMD_COMPLETE, HCI_INIT_TIMEOUT);
>> +	if (IS_ERR(skb)) {
>> +		ret = PTR_ERR(skb);
>> +		bt_dev_err(hdev, "Change address command failed (%ld)", ret);
>> +		return ret;
>> +	}
>> +	kfree_skb(skb);
>> +
>> +	return 0;
>> +}
>> +
>> #define QCA_DFU_PACKET_LEN	4096
>> 
>> #define QCA_GET_TARGET_VERSION	0x09
>> @@ -3428,7 +3454,8 @@ struct qca_version {
>> } __packed;
>> 
>> struct qca_rampatch_version {
>> -	__le16	rom_version;
>> +	__le16	rom_version_high;
>> +	__le16  rom_version_low;
>> 	__le16	patch_version;
>> } __packed;
> 
> How does this work. The struct now has an extra 16-bit in the middle.
> Is this backwards compatible?
> 
It works with old HW by shift the offset byte in qca_devices_table, from 
18 to 16.
So for old HW only rom_version_low is being used and it still points to 
the correct
bytes.

>> 
>> @@ -3440,12 +3467,14 @@ struct qca_device_info {
>> };
>> 
>> static const struct qca_device_info qca_devices_table[] = {
>> -	{ 0x00000100, 20, 4, 10 }, /* Rome 1.0 */
>> -	{ 0x00000101, 20, 4, 10 }, /* Rome 1.1 */
>> -	{ 0x00000200, 28, 4, 18 }, /* Rome 2.0 */
>> -	{ 0x00000201, 28, 4, 18 }, /* Rome 2.1 */
>> -	{ 0x00000300, 28, 4, 18 }, /* Rome 3.0 */
>> -	{ 0x00000302, 28, 4, 18 }, /* Rome 3.2 */
>> +	{ 0x00000100, 20, 4, 8 }, /* Rome 1.0 */
>> +	{ 0x00000101, 20, 4, 8 }, /* Rome 1.1 */
> 
> Align it with 8  }
> 
OK.

>> +	{ 0x00000200, 28, 4, 16 }, /* Rome 2.0 */
>> +	{ 0x00000201, 28, 4, 16 }, /* Rome 2.1 */
>> +	{ 0x00000300, 28, 4, 16 }, /* Rome 3.0 */
>> +	{ 0x00000302, 28, 4, 16 }, /* Rome 3.2 */
>> +	{ 0x00130100, 40, 4, 16 }, /* WCN6855 1.0 */
>> +	{ 0x00130200, 40, 4, 16 }  /* WCN6855 2.0 */
> 
> And the last one should also be },
> 
OK.

>> };
>> 
>> static int btusb_qca_send_vendor_req(struct usb_device *udev, u8 
>> request,
>> @@ -3547,8 +3576,8 @@ static int btusb_setup_qca_load_rampatch(struct 
>> hci_dev *hdev,
>> {
>> 	struct qca_rampatch_version *rver;
>> 	const struct firmware *fw;
>> -	u32 ver_rom, ver_patch;
>> -	u16 rver_rom, rver_patch;
>> +	u32 ver_rom, ver_patch, rver_rom;
>> +	u16 rver_rom_low, rver_rom_high, rver_patch;
>> 	char fwname[64];
>> 	int err;
>> 
>> @@ -3567,9 +3596,16 @@ static int btusb_setup_qca_load_rampatch(struct 
>> hci_dev *hdev,
>> 	bt_dev_info(hdev, "using rampatch file: %s", fwname);
>> 
>> 	rver = (struct qca_rampatch_version *)(fw->data + info->ver_offset);
>> -	rver_rom = le16_to_cpu(rver->rom_version);
>> +	rver_rom_low = le16_to_cpu(rver->rom_version_low);
>> 	rver_patch = le16_to_cpu(rver->patch_version);
>> 
>> +	if (ver_rom & ~0xffffU) {
>> +		rver_rom_high = le16_to_cpu(rver->rom_version_high);
>> +		rver_rom = le32_to_cpu(rver_rom_high << 16 | rver_rom_low);
>> +	} else {
>> +		rver_rom = rver_rom_low;
>> +	}
>> +
>> 	bt_dev_info(hdev, "QCA: patch rome 0x%x build 0x%x, "
>> 		    "firmware rome 0x%x build 0x%x",
>> 		    rver_rom, rver_patch, ver_rom, ver_patch);
>> @@ -3643,9 +3679,6 @@ static int btusb_setup_qca(struct hci_dev *hdev)
>> 		return err;
>> 
>> 	ver_rom = le32_to_cpu(ver.rom_version);
>> -	/* Don't care about high ROM versions */
>> -	if (ver_rom & ~0xffffU)
>> -		return 0;
>> 
>> 	for (i = 0; i < ARRAY_SIZE(qca_devices_table); i++) {
>> 		if (ver_rom == qca_devices_table[i].rom_version)
>> @@ -4081,6 +4114,13 @@ static int btusb_probe(struct usb_interface 
>> *intf,
>> 		btusb_check_needs_reset_resume(intf);
>> 	}
>> 
>> +	if (id->driver_info & BTUSB_QCA_WCN6855) {
>> +		data->setup_on_usb = btusb_setup_qca;
>> +		hdev->set_bdaddr = btusb_set_bdaddr_wcn6855;
>> +		hdev->cmd_timeout = btusb_qca_cmd_timeout;
>> +		set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
>> +	}
>> +
>> 	if (id->driver_info & BTUSB_AMP) {
>> 		/* AMP controllers do not support SCO packets */
>> 		data->isoc = NULL;
> 
> Regards
> 
> Marcel
