Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9C95268D34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 16:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgINORF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 10:17:05 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:53460 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbgINN02 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 09:26:28 -0400
Received: from marcel-macpro.fritz.box (p4ff9f430.dip0.t-ipconnect.de [79.249.244.48])
        by mail.holtmann.org (Postfix) with ESMTPSA id DC189CECDD;
        Mon, 14 Sep 2020 15:32:44 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH v1] Bluetooth: btusb: Add Qualcomm Bluetooth SoC WCN6855
 support
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <c177f408186da437db722d855a01c846@codeaurora.org>
Date:   Mon, 14 Sep 2020 15:25:47 +0200
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        open list <linux-kernel@vger.kernel.org>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        c-hbandi@codeaurora.org, Hemantg <hemantg@codeaurora.org>,
        mka@chromium.org, linux-bluetooth-owner@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <0C779191-3BD1-40BF-83E6-733F9C78EA03@holtmann.org>
References: <0101017457c6b810-cb8b79ae-4663-436b-83d0-4c70c245bd25-000000@us-west-2.amazonses.com>
 <2E48211B-D62D-43D8-9C97-014966FBB2CB@holtmann.org>
 <c177f408186da437db722d855a01c846@codeaurora.org>
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
>>> drivers/bluetooth/btusb.c | 42 +++++++++++++++++++++++++++++++++++----
>>> 1 file changed, 38 insertions(+), 4 deletions(-)
>>> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
>>> index fe80588c7bd3..e51e754ca9b8 100644
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
>> What is wrong with using qca_set_bdaddr() function.
> WCN6855 is using different VSC to set the bt addr

int qca_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr)                 
{                                                                                
        struct sk_buff *skb;                                                     
        int err;                                                                 
                                                                                 
        skb = __hci_cmd_sync_ev(hdev, EDL_WRITE_BD_ADDR_OPCODE, 6, bdaddr,       
                                HCI_EV_VENDOR, HCI_INIT_TIMEOUT);                
        if (IS_ERR(skb)) {                                                       
                err = PTR_ERR(skb);                                              
                bt_dev_err(hdev, "QCA Change address cmd failed (%d)", err);     
                return err;                                                      
        }                                                                        
                                                                                 
        kfree_skb(skb);                                                          
                                                                                 
        return 0;                                                                
}                                                                                
EXPORT_SYMBOL_GPL(qca_set_bdaddr);

I see that the other command is using HCI_EV_VENDOR, but is that on purpose or an accident? Might want to confirm with the btmon trace.

Regards

Marcel

