Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9F9E4428E9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 08:53:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbhKBH4a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 03:56:30 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:12703 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231165AbhKBH4V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 03:56:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635839626; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ES1CBCU8YQ00Dlp/cHiSasPPDxQFYf0gxgRi0M0vGzs=; b=pqKFHA45qn5yy58FenQXSlnD+/omD5HvtQAr9KQdJivehgAh/Nh9LSPFWc1bqxKQAVYY0Bfd
 lWKaOflcecxyMUNMVA/ah4astDBhQ1q2eHJ2Wg2sbqEnvdUFmxaoqeYiF0umx+gbAJNBPKUe
 yRgHp2SxfNzij9to+iD/eONxS48=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6180ee85c8c1b282a5f60b26 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Nov 2021 07:53:41
 GMT
Sender: zijuhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6A63DC4360C; Tue,  2 Nov 2021 07:53:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.104] (unknown [183.195.15.125])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: zijuhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CE7CDC4338F;
        Tue,  2 Nov 2021 07:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org CE7CDC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v1 3/3] Bluetooth: hci_qca: Add support for QTI bluetooth
 MAPLE
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, Zijun Hu <quic_zijuhu@quicinc.com>
References: <1635837177-1341-1-git-send-email-zijuhu@codeaurora.org>
 <YYDqW6ewycWP1Y7a@kroah.com>
From:   Zijun Hu <zijuhu@codeaurora.org>
Message-ID: <4f6aee28-4d86-116c-6c47-bfce5de6551b@codeaurora.org>
Date:   Tue, 2 Nov 2021 15:53:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YYDqW6ewycWP1Y7a@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/2/2021 3:35 PM, Greg KH wrote:
> On Tue, Nov 02, 2021 at 03:12:57PM +0800, Zijun Hu wrote:
>> From: Zijun Hu <quic_zijuhu@quicinc.com>
>>
>> Add support for MAPLE integrated within SOC, it is mounted on
>> a virtual tty port and powered on/off via relevant IOCTL, neither
>> IBS nor RAMPATCH downloading is not required.
>>
>> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
>> ---
>>  drivers/bluetooth/btqca.c   | 13 ++++++++++++-
>>  drivers/bluetooth/btqca.h   | 13 +++++++++++++
>>  drivers/bluetooth/hci_qca.c | 47 ++++++++++++++++++++++++++++++++++++++++++++-
>>  3 files changed, 71 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
>> index be04d74037d2..b83d2ecefe5d 100644
>> --- a/drivers/bluetooth/btqca.c
>> +++ b/drivers/bluetooth/btqca.c
>> @@ -255,6 +255,8 @@ static void qca_tlv_check_data(struct hci_dev *hdev,
>>  		BT_DBG("TLV Type\t\t : 0x%x", type_len & 0x000000ff);
>>  		BT_DBG("Length\t\t : %d bytes", length);
>>  
>> +		if (qca_is_maple(soc_type))
>> +			break;
>>  		idx = 0;
>>  		data = tlv->data;
>>  		while (idx < length) {
>> @@ -552,6 +554,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>  	rom_ver = ((soc_ver & 0x00000f00) >> 0x04) | (soc_ver & 0x0000000f);
>>  
>>  	/* Download rampatch file */
>> +	if (qca_is_maple(soc_type))
>> +		goto download_nvm;
>> +
>>  	config.type = TLV_TYPE_PATCH;
>>  	if (qca_is_wcn399x(soc_type)) {
>>  		snprintf(config.fwname, sizeof(config.fwname),
>> @@ -580,6 +585,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>  	/* Give the controller some time to get ready to receive the NVM */
>>  	msleep(10);
>>  
>> +download_nvm:
>>  	/* Download NVM configuration */
>>  	config.type = TLV_TYPE_NVM;
>>  	if (firmware_name)
>> @@ -597,6 +603,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>  	else if (soc_type == QCA_QCA6390)
>>  		snprintf(config.fwname, sizeof(config.fwname),
>>  			 "qca/htnv%02x.bin", rom_ver);
>> +	else if (qca_is_maple(soc_type))
>> +		snprintf(config.fwname, sizeof(config.fwname),
>> +			 "qca/mpnv%02x.bin", rom_ver);
>>  	else if (soc_type == QCA_WCN6750)
>>  		snprintf(config.fwname, sizeof(config.fwname),
>>  			 "qca/msnv%02x.bin", rom_ver);
>> @@ -609,6 +618,8 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>  		bt_dev_err(hdev, "QCA Failed to download NVM (%d)", err);
>>  		return err;
>>  	}
>> +	if (qca_is_maple(soc_type))
>> +		msleep(MAPLE_NVM_READY_DELAY_MS);
>>  
>>  	if (soc_type >= QCA_WCN3991) {
>>  		err = qca_disable_soc_logging(hdev);
>> @@ -637,7 +648,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>  		return err;
>>  	}
>>  
>> -	if (soc_type == QCA_WCN3991 || soc_type == QCA_WCN6750) {
>> +	if (soc_type == QCA_WCN3991 || soc_type == QCA_WCN6750 || qca_is_maple(soc_type)) {
>>  		/* get fw build info */
>>  		err = qca_read_fw_build_info(hdev);
>>  		if (err < 0)
>> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
>> index 30afa7703afd..0a5a7d1daa71 100644
>> --- a/drivers/bluetooth/btqca.h
>> +++ b/drivers/bluetooth/btqca.h
>> @@ -46,6 +46,8 @@
>>  
>>  #define QCA_FW_BUILD_VER_LEN		255
>>  
>> +#define MAPLE_NVM_READY_DELAY_MS        1500
>> +#define MAPLE_POWER_CONTROL_DELAY_MS    50
>>  
>>  enum qca_baudrate {
>>  	QCA_BAUDRATE_115200 	= 0,
>> @@ -145,6 +147,7 @@ enum qca_btsoc_type {
>>  	QCA_WCN3991,
>>  	QCA_QCA6390,
>>  	QCA_WCN6750,
>> +	QCA_MAPLE,
>>  };
>>  
>>  #if IS_ENABLED(CONFIG_BT_QCA)
>> @@ -167,6 +170,11 @@ static inline bool qca_is_wcn6750(enum qca_btsoc_type soc_type)
>>  	return soc_type == QCA_WCN6750;
>>  }
>>  
>> +static inline bool qca_is_maple(enum qca_btsoc_type soc_type)
>> +{
>> +	return soc_type == QCA_MAPLE;
>> +}
>> +
>>  #else
>>  
>>  static inline int qca_set_bdaddr_rome(struct hci_dev *hdev, const bdaddr_t *bdaddr)
>> @@ -204,6 +212,11 @@ static inline bool qca_is_wcn6750(enum qca_btsoc_type soc_type)
>>  	return false;
>>  }
>>  
>> +static inline bool qca_is_maple(enum qca_btsoc_type soc_type)
>> +{
>> +	return false;
>> +}
>> +
>>  static inline int qca_send_pre_shutdown_cmd(struct hci_dev *hdev)
>>  {
>>  	return -EOPNOTSUPP;
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index dd768a8ed7cb..f1d9670719c4 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -70,6 +70,10 @@
>>  #define QCA_CRASHBYTE_PACKET_LEN	1096
>>  #define QCA_MEMDUMP_BYTE		0xFB
>>  
>> +#ifndef IOCTL_IPC_BOOT
>> +#define IOCTL_IPC_BOOT                  0xBE
>> +#endif
> 
> You send this command, but never use it.  Where is the driver code that
> uses this command?
> 
qca_maple_power_control() will use it.  this driver depends on bt_tty kernel module
https://source.codeaurora.org/quic/qsdk/oss/kernel/linux-ipq-5.4/tree/drivers/soc/qcom/bt_tty.c?h=NHSS.QSDK.11.5.0.5.r2

> And why not tabs?
> 
> And why is this patch series not properly threaded so tools can pick it
> up and find them?
> 
> And why the odd named ioctl that is different from other ones in this
> file?
> 
that IOCTL name is defined by that module.
https://source.codeaurora.org/quic/qsdk/oss/kernel/linux-ipq-5.4/tree/include/linux/bt.h?h=NHSS.QSDK.11.5.0.5.r2

> And why not just use normal power management hooks for doing things like
> turning on and off the hardware like all other drivers?
> 
this device is special.

it seems BT maintainer decides to drop this patch.
so please ignore it.
thanks 
> thanks,
> 
> greg k-h
> 
