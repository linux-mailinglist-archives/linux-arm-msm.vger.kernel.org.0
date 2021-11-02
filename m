Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5546C442C71
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 12:24:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbhKBL0p convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>); Tue, 2 Nov 2021 07:26:45 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:60489 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbhKBL0p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 07:26:45 -0400
Received: from smtpclient.apple (p4fefc15c.dip0.t-ipconnect.de [79.239.193.92])
        by mail.holtmann.org (Postfix) with ESMTPSA id 82854CECEE;
        Tue,  2 Nov 2021 12:24:08 +0100 (CET)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH v1 3/3] Bluetooth: hci_qca: Add support for QTI bluetooth
 MAPLE
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <250a87bd-2012-201f-8f53-a229cc641c15@codeaurora.org>
Date:   Tue, 2 Nov 2021 12:24:07 +0100
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        c-hbandi@codeaurora.org, Hemantg <hemantg@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rocky Liao <rjliao@codeaurora.org>,
        Zijun Hu <quic_zijuhu@quicinc.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <366220B2-223C-4516-BA18-E40448467E9C@holtmann.org>
References: <1635837177-1341-1-git-send-email-zijuhu@codeaurora.org>
 <YYDqW6ewycWP1Y7a@kroah.com>
 <4f6aee28-4d86-116c-6c47-bfce5de6551b@codeaurora.org>
 <YYD1PJrFw/xmEXIW@kroah.com>
 <432B905E-5263-47A6-95AA-7F43715BE196@holtmann.org>
 <18e1cb9d-39e5-3953-6f32-faea6b2dee47@codeaurora.org>
 <24F36C9D-6219-4A0B-A798-029ED4EEAB06@holtmann.org>
 <250a87bd-2012-201f-8f53-a229cc641c15@codeaurora.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Zijun,

>>>>>>>> Add support for MAPLE integrated within SOC, it is mounted on
>>>>>>>> a virtual tty port and powered on/off via relevant IOCTL, neither
>>>>>>>> IBS nor RAMPATCH downloading is not required.
>>>>>>>> 
>>>>>>>> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
>>>>>>>> ---
>>>>>>>> drivers/bluetooth/btqca.c   | 13 ++++++++++++-
>>>>>>>> drivers/bluetooth/btqca.h   | 13 +++++++++++++
>>>>>>>> drivers/bluetooth/hci_qca.c | 47 ++++++++++++++++++++++++++++++++++++++++++++-
>>>>>>>> 3 files changed, 71 insertions(+), 2 deletions(-)
>>>>>>>> 
>>>>>>>> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
>>>>>>>> index be04d74037d2..b83d2ecefe5d 100644
>>>>>>>> --- a/drivers/bluetooth/btqca.c
>>>>>>>> +++ b/drivers/bluetooth/btqca.c
>>>>>>>> @@ -255,6 +255,8 @@ static void qca_tlv_check_data(struct hci_dev *hdev,
>>>>>>>> 		BT_DBG("TLV Type\t\t : 0x%x", type_len & 0x000000ff);
>>>>>>>> 		BT_DBG("Length\t\t : %d bytes", length);
>>>>>>>> 
>>>>>>>> +		if (qca_is_maple(soc_type))
>>>>>>>> +			break;
>>>>>>>> 		idx = 0;
>>>>>>>> 		data = tlv->data;
>>>>>>>> 		while (idx < length) {
>>>>>>>> @@ -552,6 +554,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>>>>>>> 	rom_ver = ((soc_ver & 0x00000f00) >> 0x04) | (soc_ver & 0x0000000f);
>>>>>>>> 
>>>>>>>> 	/* Download rampatch file */
>>>>>>>> +	if (qca_is_maple(soc_type))
>>>>>>>> +		goto download_nvm;
>>>>>>>> +
>>>>>>>> 	config.type = TLV_TYPE_PATCH;
>>>>>>>> 	if (qca_is_wcn399x(soc_type)) {
>>>>>>>> 		snprintf(config.fwname, sizeof(config.fwname),
>>>>>>>> @@ -580,6 +585,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>>>>>>> 	/* Give the controller some time to get ready to receive the NVM */
>>>>>>>> 	msleep(10);
>>>>>>>> 
>>>>>>>> +download_nvm:
>>>>>>>> 	/* Download NVM configuration */
>>>>>>>> 	config.type = TLV_TYPE_NVM;
>>>>>>>> 	if (firmware_name)
>>>>>>>> @@ -597,6 +603,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>>>>>>> 	else if (soc_type == QCA_QCA6390)
>>>>>>>> 		snprintf(config.fwname, sizeof(config.fwname),
>>>>>>>> 			 "qca/htnv%02x.bin", rom_ver);
>>>>>>>> +	else if (qca_is_maple(soc_type))
>>>>>>>> +		snprintf(config.fwname, sizeof(config.fwname),
>>>>>>>> +			 "qca/mpnv%02x.bin", rom_ver);
>>>>>>>> 	else if (soc_type == QCA_WCN6750)
>>>>>>>> 		snprintf(config.fwname, sizeof(config.fwname),
>>>>>>>> 			 "qca/msnv%02x.bin", rom_ver);
>>>>>>>> @@ -609,6 +618,8 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>>>>>>> 		bt_dev_err(hdev, "QCA Failed to download NVM (%d)", err);
>>>>>>>> 		return err;
>>>>>>>> 	}
>>>>>>>> +	if (qca_is_maple(soc_type))
>>>>>>>> +		msleep(MAPLE_NVM_READY_DELAY_MS);
>>>>>>>> 
>>>>>>>> 	if (soc_type >= QCA_WCN3991) {
>>>>>>>> 		err = qca_disable_soc_logging(hdev);
>>>>>>>> @@ -637,7 +648,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>>>>>>> 		return err;
>>>>>>>> 	}
>>>>>>>> 
>>>>>>>> -	if (soc_type == QCA_WCN3991 || soc_type == QCA_WCN6750) {
>>>>>>>> +	if (soc_type == QCA_WCN3991 || soc_type == QCA_WCN6750 || qca_is_maple(soc_type)) {
>>>>>>>> 		/* get fw build info */
>>>>>>>> 		err = qca_read_fw_build_info(hdev);
>>>>>>>> 		if (err < 0)
>>>>>>>> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
>>>>>>>> index 30afa7703afd..0a5a7d1daa71 100644
>>>>>>>> --- a/drivers/bluetooth/btqca.h
>>>>>>>> +++ b/drivers/bluetooth/btqca.h
>>>>>>>> @@ -46,6 +46,8 @@
>>>>>>>> 
>>>>>>>> #define QCA_FW_BUILD_VER_LEN		255
>>>>>>>> 
>>>>>>>> +#define MAPLE_NVM_READY_DELAY_MS        1500
>>>>>>>> +#define MAPLE_POWER_CONTROL_DELAY_MS    50
>>>>>>>> 
>>>>>>>> enum qca_baudrate {
>>>>>>>> 	QCA_BAUDRATE_115200 	= 0,
>>>>>>>> @@ -145,6 +147,7 @@ enum qca_btsoc_type {
>>>>>>>> 	QCA_WCN3991,
>>>>>>>> 	QCA_QCA6390,
>>>>>>>> 	QCA_WCN6750,
>>>>>>>> +	QCA_MAPLE,
>>>>>>>> };
>>>>>>>> 
>>>>>>>> #if IS_ENABLED(CONFIG_BT_QCA)
>>>>>>>> @@ -167,6 +170,11 @@ static inline bool qca_is_wcn6750(enum qca_btsoc_type soc_type)
>>>>>>>> 	return soc_type == QCA_WCN6750;
>>>>>>>> }
>>>>>>>> 
>>>>>>>> +static inline bool qca_is_maple(enum qca_btsoc_type soc_type)
>>>>>>>> +{
>>>>>>>> +	return soc_type == QCA_MAPLE;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> #else
>>>>>>>> 
>>>>>>>> static inline int qca_set_bdaddr_rome(struct hci_dev *hdev, const bdaddr_t *bdaddr)
>>>>>>>> @@ -204,6 +212,11 @@ static inline bool qca_is_wcn6750(enum qca_btsoc_type soc_type)
>>>>>>>> 	return false;
>>>>>>>> }
>>>>>>>> 
>>>>>>>> +static inline bool qca_is_maple(enum qca_btsoc_type soc_type)
>>>>>>>> +{
>>>>>>>> +	return false;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> static inline int qca_send_pre_shutdown_cmd(struct hci_dev *hdev)
>>>>>>>> {
>>>>>>>> 	return -EOPNOTSUPP;
>>>>>>>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>>>>>>>> index dd768a8ed7cb..f1d9670719c4 100644
>>>>>>>> --- a/drivers/bluetooth/hci_qca.c
>>>>>>>> +++ b/drivers/bluetooth/hci_qca.c
>>>>>>>> @@ -70,6 +70,10 @@
>>>>>>>> #define QCA_CRASHBYTE_PACKET_LEN	1096
>>>>>>>> #define QCA_MEMDUMP_BYTE		0xFB
>>>>>>>> 
>>>>>>>> +#ifndef IOCTL_IPC_BOOT
>>>>>>>> +#define IOCTL_IPC_BOOT                  0xBE
>>>>>>>> +#endif
>>>>>>> 
>>>>>>> You send this command, but never use it.  Where is the driver code that
>>>>>>> uses this command?
>>>>>>> 
>>>>>> qca_maple_power_control() will use it.  this driver depends on bt_tty kernel module
>>>>>> https://source.codeaurora.org/quic/qsdk/oss/kernel/linux-ipq-5.4/tree/drivers/soc/qcom/bt_tty.c?h=NHSS.QSDK.11.5.0.5.r2
>>>>> 
>>>>> You can not add code to the kernel that is not used by the kernel
>>>>> itself.  That driver needs to be in the tree as well, why is it not
>>>>> submitted now too?
>>>>> 
>>>>>>> And why not tabs?
>>>>>>> 
>>>>>>> And why is this patch series not properly threaded so tools can pick it
>>>>>>> up and find them?
>>>>>>> 
>>>>>>> And why the odd named ioctl that is different from other ones in this
>>>>>>> file?
>>>>>>> 
>>>>>> that IOCTL name is defined by that module.
>>>>>> https://source.codeaurora.org/quic/qsdk/oss/kernel/linux-ipq-5.4/tree/include/linux/bt.h?h=NHSS.QSDK.11.5.0.5.r2
>>>>> 
>>>>> Again, it needs to be in the tree.
>>>>> 
>>>>>>> And why not just use normal power management hooks for doing things like
>>>>>>> turning on and off the hardware like all other drivers?
>>>>>>> 
>>>>>> this device is special.
>>>>> 
>>>>> All drivers and devices are special and unique.  Just like all of them :)
>>>>> 
>>>>> What is so odd about this device that it can not work with the existing
>>>>> infrastructure that the kernel has for all of the hundreds of thousands
>>>>> of other devices it supports?
>>>>> 
>>>>>> it seems BT maintainer decides to drop this patch.
>>>>> 
>>>>> Of course, at the very least because there is no in-kernel user, why
>>>>> would you accept such a patch if you were the maintainer?
>>>>> 
>>>>> Please submit your driver first.
>>>> 
>>>> this power on via ioctl is nasty business. I am so happy that we got rid of
>>>> the crucks when we finally landed serdev.
>>>> 
>>>> Some people are working on power sequence support and alike. This needs to
>>>> use proper infrastructure or extend existing infrastructure. To fit the
>>>> needs.
>>>> 
>>>> I am just 100% certain, that booting an IPC via an ioctl isn’t it. We
>>>> really suffered through it in the 2.4 kernel days. The hardware needs to
>>>> be described properly in device tree and the kernel needs to take all
>>>> the appropriate actions if a Bluetooth device is powered on via its
>>>> standard power on procedure. And that is through bluetoothd (or if you
>>>> use some other Bluetooth userspace) via the exposed API from the kernel.
>>>> 
>>> thank you. the IOCTL purpose is to bootup the special bluetooth controller.
>>> i have verified this change.
>>> i will submit this change to linux-ipq-5.4 firstly even if need to pick up many changes firstly.
>> 
>> I am not sure this is fully understood yet. Do _not_ use an ioctl to boot the Bluetooth
>> controller. Power on/off of Bluetooth hardware happens via the standard interface used
>> by bluetoothd. The Bluetooth transport driver (in your case hci_qca) has to do everything
>> needed when a) serdev->probe is called and b) hdev->open is called. Any other path to
>> power your hardware is (bluntly put) wrong.
>> 
> for all the other present controllers supported by hci_qca,  ALL the finial initialization job is Done driver itself(hci_qca)
> via hdev->setup which call qca_setup(), the initialization includes power control, clock control, driver BT enable
> pin, download F/W.

and what I am saying, it has to be the same for this hardware as well. You need to
re-design your driver / patch.

On a side note, you don’t have to add support for this hardware into hci_qca. You
can write a brand new driver to support your hardware. If hci_qca is no fit, then
start from scratch. However same rules apply work in the constraints of serdev->probe
and hdev->open to establish the Bluetooth transport.

The hdev->setup is post-transport setup and doesn’t really apply to anything powering
on the controller.

Regards

Marcel

