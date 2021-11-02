Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13806442944
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 09:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbhKBIZM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 04:25:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:35520 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229924AbhKBIY4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 04:24:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E659F60F56;
        Tue,  2 Nov 2021 08:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1635841342;
        bh=OlufxP2/b5AJ7f2PZ8iRRthfSpRo/3L6cs+0T238eAo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ATCZf01PmmeXolcv8LWG1fPWIRiMrS/Egb1hTFg8vR+Na0ZI0o7cCbZ2kUwpp4yf8
         SWEzSxCnF6y4xG0++3J8tcIP+YE0unRBIc4kcgFr0dkcO6HvqxRA2FsXUv0Sccz7jT
         r+CSBdfkb5JX6PVOD13czdRmQSJDwtApSHL5n5Ls=
Date:   Tue, 2 Nov 2021 09:22:20 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, Zijun Hu <quic_zijuhu@quicinc.com>
Subject: Re: [PATCH v1 3/3] Bluetooth: hci_qca: Add support for QTI bluetooth
 MAPLE
Message-ID: <YYD1PJrFw/xmEXIW@kroah.com>
References: <1635837177-1341-1-git-send-email-zijuhu@codeaurora.org>
 <YYDqW6ewycWP1Y7a@kroah.com>
 <4f6aee28-4d86-116c-6c47-bfce5de6551b@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f6aee28-4d86-116c-6c47-bfce5de6551b@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 02, 2021 at 03:53:33PM +0800, Zijun Hu wrote:
> 
> 
> On 11/2/2021 3:35 PM, Greg KH wrote:
> > On Tue, Nov 02, 2021 at 03:12:57PM +0800, Zijun Hu wrote:
> >> From: Zijun Hu <quic_zijuhu@quicinc.com>
> >>
> >> Add support for MAPLE integrated within SOC, it is mounted on
> >> a virtual tty port and powered on/off via relevant IOCTL, neither
> >> IBS nor RAMPATCH downloading is not required.
> >>
> >> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> >> ---
> >>  drivers/bluetooth/btqca.c   | 13 ++++++++++++-
> >>  drivers/bluetooth/btqca.h   | 13 +++++++++++++
> >>  drivers/bluetooth/hci_qca.c | 47 ++++++++++++++++++++++++++++++++++++++++++++-
> >>  3 files changed, 71 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> >> index be04d74037d2..b83d2ecefe5d 100644
> >> --- a/drivers/bluetooth/btqca.c
> >> +++ b/drivers/bluetooth/btqca.c
> >> @@ -255,6 +255,8 @@ static void qca_tlv_check_data(struct hci_dev *hdev,
> >>  		BT_DBG("TLV Type\t\t : 0x%x", type_len & 0x000000ff);
> >>  		BT_DBG("Length\t\t : %d bytes", length);
> >>  
> >> +		if (qca_is_maple(soc_type))
> >> +			break;
> >>  		idx = 0;
> >>  		data = tlv->data;
> >>  		while (idx < length) {
> >> @@ -552,6 +554,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> >>  	rom_ver = ((soc_ver & 0x00000f00) >> 0x04) | (soc_ver & 0x0000000f);
> >>  
> >>  	/* Download rampatch file */
> >> +	if (qca_is_maple(soc_type))
> >> +		goto download_nvm;
> >> +
> >>  	config.type = TLV_TYPE_PATCH;
> >>  	if (qca_is_wcn399x(soc_type)) {
> >>  		snprintf(config.fwname, sizeof(config.fwname),
> >> @@ -580,6 +585,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> >>  	/* Give the controller some time to get ready to receive the NVM */
> >>  	msleep(10);
> >>  
> >> +download_nvm:
> >>  	/* Download NVM configuration */
> >>  	config.type = TLV_TYPE_NVM;
> >>  	if (firmware_name)
> >> @@ -597,6 +603,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> >>  	else if (soc_type == QCA_QCA6390)
> >>  		snprintf(config.fwname, sizeof(config.fwname),
> >>  			 "qca/htnv%02x.bin", rom_ver);
> >> +	else if (qca_is_maple(soc_type))
> >> +		snprintf(config.fwname, sizeof(config.fwname),
> >> +			 "qca/mpnv%02x.bin", rom_ver);
> >>  	else if (soc_type == QCA_WCN6750)
> >>  		snprintf(config.fwname, sizeof(config.fwname),
> >>  			 "qca/msnv%02x.bin", rom_ver);
> >> @@ -609,6 +618,8 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> >>  		bt_dev_err(hdev, "QCA Failed to download NVM (%d)", err);
> >>  		return err;
> >>  	}
> >> +	if (qca_is_maple(soc_type))
> >> +		msleep(MAPLE_NVM_READY_DELAY_MS);
> >>  
> >>  	if (soc_type >= QCA_WCN3991) {
> >>  		err = qca_disable_soc_logging(hdev);
> >> @@ -637,7 +648,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
> >>  		return err;
> >>  	}
> >>  
> >> -	if (soc_type == QCA_WCN3991 || soc_type == QCA_WCN6750) {
> >> +	if (soc_type == QCA_WCN3991 || soc_type == QCA_WCN6750 || qca_is_maple(soc_type)) {
> >>  		/* get fw build info */
> >>  		err = qca_read_fw_build_info(hdev);
> >>  		if (err < 0)
> >> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
> >> index 30afa7703afd..0a5a7d1daa71 100644
> >> --- a/drivers/bluetooth/btqca.h
> >> +++ b/drivers/bluetooth/btqca.h
> >> @@ -46,6 +46,8 @@
> >>  
> >>  #define QCA_FW_BUILD_VER_LEN		255
> >>  
> >> +#define MAPLE_NVM_READY_DELAY_MS        1500
> >> +#define MAPLE_POWER_CONTROL_DELAY_MS    50
> >>  
> >>  enum qca_baudrate {
> >>  	QCA_BAUDRATE_115200 	= 0,
> >> @@ -145,6 +147,7 @@ enum qca_btsoc_type {
> >>  	QCA_WCN3991,
> >>  	QCA_QCA6390,
> >>  	QCA_WCN6750,
> >> +	QCA_MAPLE,
> >>  };
> >>  
> >>  #if IS_ENABLED(CONFIG_BT_QCA)
> >> @@ -167,6 +170,11 @@ static inline bool qca_is_wcn6750(enum qca_btsoc_type soc_type)
> >>  	return soc_type == QCA_WCN6750;
> >>  }
> >>  
> >> +static inline bool qca_is_maple(enum qca_btsoc_type soc_type)
> >> +{
> >> +	return soc_type == QCA_MAPLE;
> >> +}
> >> +
> >>  #else
> >>  
> >>  static inline int qca_set_bdaddr_rome(struct hci_dev *hdev, const bdaddr_t *bdaddr)
> >> @@ -204,6 +212,11 @@ static inline bool qca_is_wcn6750(enum qca_btsoc_type soc_type)
> >>  	return false;
> >>  }
> >>  
> >> +static inline bool qca_is_maple(enum qca_btsoc_type soc_type)
> >> +{
> >> +	return false;
> >> +}
> >> +
> >>  static inline int qca_send_pre_shutdown_cmd(struct hci_dev *hdev)
> >>  {
> >>  	return -EOPNOTSUPP;
> >> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> >> index dd768a8ed7cb..f1d9670719c4 100644
> >> --- a/drivers/bluetooth/hci_qca.c
> >> +++ b/drivers/bluetooth/hci_qca.c
> >> @@ -70,6 +70,10 @@
> >>  #define QCA_CRASHBYTE_PACKET_LEN	1096
> >>  #define QCA_MEMDUMP_BYTE		0xFB
> >>  
> >> +#ifndef IOCTL_IPC_BOOT
> >> +#define IOCTL_IPC_BOOT                  0xBE
> >> +#endif
> > 
> > You send this command, but never use it.  Where is the driver code that
> > uses this command?
> > 
> qca_maple_power_control() will use it.  this driver depends on bt_tty kernel module
> https://source.codeaurora.org/quic/qsdk/oss/kernel/linux-ipq-5.4/tree/drivers/soc/qcom/bt_tty.c?h=NHSS.QSDK.11.5.0.5.r2

You can not add code to the kernel that is not used by the kernel
itself.  That driver needs to be in the tree as well, why is it not
submitted now too?

> > And why not tabs?
> > 
> > And why is this patch series not properly threaded so tools can pick it
> > up and find them?
> > 
> > And why the odd named ioctl that is different from other ones in this
> > file?
> > 
> that IOCTL name is defined by that module.
> https://source.codeaurora.org/quic/qsdk/oss/kernel/linux-ipq-5.4/tree/include/linux/bt.h?h=NHSS.QSDK.11.5.0.5.r2

Again, it needs to be in the tree.

> > And why not just use normal power management hooks for doing things like
> > turning on and off the hardware like all other drivers?
> > 
> this device is special.

All drivers and devices are special and unique.  Just like all of them :)

What is so odd about this device that it can not work with the existing
infrastructure that the kernel has for all of the hundreds of thousands
of other devices it supports?

> it seems BT maintainer decides to drop this patch.

Of course, at the very least because there is no in-kernel user, why
would you accept such a patch if you were the maintainer?

Please submit your driver first.

thanks,

greg k-h
