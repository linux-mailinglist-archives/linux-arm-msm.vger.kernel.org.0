Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93BA118EDBA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2020 02:51:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726956AbgCWBvl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 22 Mar 2020 21:51:41 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:64919 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726954AbgCWBvi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 22 Mar 2020 21:51:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584928296; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=rVs4UhZfq5ySydb0Mkp7e5H5eaz7AWJc5B+WJxcd6OA=;
 b=spXQb9E/uQKdL1umoi/cILs+7btx6No4JwHyXAIhYy9+WBNqzd1AYrq1P5kElktXlqttDlHc
 UKhXvVeDsgjBBuwUHHpHbD6lW2gP1yNS172LYKlYFPvRe2PKrXHzbsb4TtIYrsJA1uWE5DOY
 WRXZdYT4sb6NYg2H8Z27EvtjZFs=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e78161f.7f05264692d0-smtp-out-n03;
 Mon, 23 Mar 2020 01:51:27 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C2B99C43636; Mon, 23 Mar 2020 01:51:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rjliao)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CF9E2C433D2;
        Mon, 23 Mar 2020 01:51:26 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Mon, 23 Mar 2020 09:51:26 +0800
From:   Rocky Liao <rjliao@codeaurora.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org,
        linux-bluetooth-owner@vger.kernel.org
Subject: Re: [PATCH v1 1/2] Bluetooth: hci_qca: Add support for Qualcomm
 Bluetooth SoC QCA6390
In-Reply-To: <20200316174615.GP144492@google.com>
References: <20200314094328.3331-1-rjliao@codeaurora.org>
 <20200316174615.GP144492@google.com>
Message-ID: <1aff039c60da7e1d188bd5ef8750eefd@codeaurora.org>
X-Sender: rjliao@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

在 2020-03-17 01:46，Matthias Kaehlcke 写道：
> On Sat, Mar 14, 2020 at 05:43:27PM +0800, Rocky Liao wrote:
>> This patch adds support for QCA6390, including the devicetree and acpi
>> compatible hwid matching, and patch/nvm downloading.
>> 
>> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
>> ---
>>  drivers/bluetooth/btqca.c   | 44 +++++++++++++++++++++++++++++++----
>>  drivers/bluetooth/btqca.h   |  8 +++++++
>>  drivers/bluetooth/hci_qca.c | 46 
>> +++++++++++++++++++++++++++++++------
>>  3 files changed, 86 insertions(+), 12 deletions(-)
>> 
>> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
>> index a16845c0751d..ca126e499c58 100644
>> --- a/drivers/bluetooth/btqca.c
>> +++ b/drivers/bluetooth/btqca.c
>> @@ -14,6 +14,9 @@
>> 
>>  #define VERSION "0.1"
>> 
>> +#define QCA_IS_3991_6390(soc_type)    \
>> +	(soc_type == QCA_WCN3991 || soc_type == QCA_QCA6390)
> 
> This macro style is 3991 or 6390 is pretty ugly, IMO it's worse than 
> the
> problem it intends to solve.
> 
> I would either just spell out what the macro does, or if that becomes 
> to
> cumbersome (especially when more types are added) have a macro that 
> checks
> a bitmask like:
> 
> qca_soc_type_matches(soc_type, QCA_WCN3991 | QCA6390)
> 
> For this the SoC types read from FW would have to be mapped to a bit 
> for
> each SoC type, which could be done during initialization.
> 
> Another alternative could be to have a set of flags that indicate if a 
> SoC
> has certain characteristics (e.g. enhanced logging needs to be 
> enabled),
> these flags could be set during initialization.
> 

I prefer to adopt Bala's suggestion to use soc_type >= QCA_WCN3991

>> +
>>  int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version,
>>  			 enum qca_btsoc_type soc_type)
>>  {
>> @@ -32,7 +35,7 @@ int qca_read_soc_version(struct hci_dev *hdev, u32 
>> *soc_version,
>>  	 * VSE event. WCN3991 sends version command response as a payload to
>>  	 * command complete event.
>>  	 */
>> -	if (soc_type == QCA_WCN3991) {
>> +	if (QCA_IS_3991_6390(soc_type)) {
>>  		event_type = 0;
>>  		rlen += 1;
>>  		rtype = EDL_PATCH_VER_REQ_CMD;
>> @@ -69,7 +72,7 @@ int qca_read_soc_version(struct hci_dev *hdev, u32 
>> *soc_version,
>>  		goto out;
>>  	}
>> 
>> -	if (soc_type == QCA_WCN3991)
>> +	if (QCA_IS_3991_6390(soc_type))
>>  		memmove(&edl->data, &edl->data[1], sizeof(*ver));
>> 
>>  	ver = (struct qca_btsoc_version *)(edl->data);
>> @@ -138,6 +141,29 @@ int qca_send_pre_shutdown_cmd(struct hci_dev 
>> *hdev)
>>  }
>>  EXPORT_SYMBOL_GPL(qca_send_pre_shutdown_cmd);
>> 
>> +int qca_send_enhancelog_enable_cmd(struct hci_dev *hdev)
>> +{
>> +	struct sk_buff *skb;
>> +	int err;
>> +	const u8 param[2] = {0x14, 0x01};
>> +
>> +	bt_dev_dbg(hdev, "QCA enhanced log enable cmd");
>> +
>> +	skb = __hci_cmd_sync_ev(hdev, QCA_ENHANCED_LOG_ENABLE_CMD, 2,
>> +				param, HCI_EV_CMD_COMPLETE, HCI_INIT_TIMEOUT);
>> +
>> +	if (IS_ERR(skb)) {
>> +		err = PTR_ERR(skb);
>> +		bt_dev_err(hdev, "Enhanced log enable cmd failed (%d)", err);
>> +		return err;
>> +	}
>> +
>> +	kfree_skb(skb);
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(qca_send_enhancelog_enable_cmd);
>> +
>>  static void qca_tlv_check_data(struct qca_fw_config *config,
>>  		const struct firmware *fw, enum qca_btsoc_type soc_type)
>>  {
>> @@ -217,7 +243,7 @@ static void qca_tlv_check_data(struct 
>> qca_fw_config *config,
>>  				tlv_nvm->data[0] |= 0x80;
>> 
>>  				/* UART Baud Rate */
>> -				if (soc_type == QCA_WCN3991)
>> +				if (QCA_IS_3991_6390(soc_type))
>>  					tlv_nvm->data[1] = nvm_baud_rate;
>>  				else
>>  					tlv_nvm->data[2] = nvm_baud_rate;
>> @@ -268,7 +294,7 @@ static int qca_tlv_send_segment(struct hci_dev 
>> *hdev, int seg_size,
>>  	 * VSE event. WCN3991 sends version command response as a payload to
>>  	 * command complete event.
>>  	 */
>> -	if (soc_type == QCA_WCN3991) {
>> +	if (QCA_IS_3991_6390(soc_type)) {
>>  		event_type = 0;
>>  		rlen = sizeof(*edl);
>>  		rtype = EDL_PATCH_TLV_REQ_CMD;
>> @@ -301,7 +327,7 @@ static int qca_tlv_send_segment(struct hci_dev 
>> *hdev, int seg_size,
>>  		err = -EIO;
>>  	}
>> 
>> -	if (soc_type == QCA_WCN3991)
>> +	if (QCA_IS_3991_6390(soc_type))
>>  		goto out;
>> 
>>  	tlv_resp = (struct tlv_seg_resp *)(edl->data);
>> @@ -442,6 +468,11 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t 
>> baudrate,
>>  			    (soc_ver & 0x0000000f);
>>  		snprintf(config.fwname, sizeof(config.fwname),
>>  			 "qca/crbtfw%02x.tlv", rom_ver);
>> +	} else if (soc_type == QCA_QCA6390) {
>> +		rom_ver = ((soc_ver & 0x00000f00) >> 0x04) |
>> +			    (soc_ver & 0x0000000f);
>> +		snprintf(config.fwname, sizeof(config.fwname),
>> +			 "qca/htbtfw%02x.tlv", rom_ver);
>>  	} else {
>>  		snprintf(config.fwname, sizeof(config.fwname),
>>  			 "qca/rampatch_%08x.bin", soc_ver);
>> @@ -464,6 +495,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t 
>> baudrate,
>>  	else if (qca_is_wcn399x(soc_type))
>>  		snprintf(config.fwname, sizeof(config.fwname),
>>  			 "qca/crnv%02x.bin", rom_ver);
>> +	else if (soc_type == QCA_QCA6390)
>> +		snprintf(config.fwname, sizeof(config.fwname),
>> +			 "qca/htnv%02x.bin", rom_ver);
>>  	else
>>  		snprintf(config.fwname, sizeof(config.fwname),
>>  			 "qca/nvm_%08x.bin", soc_ver);
>> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
>> index e16a4d650597..bc703817c3d7 100644
>> --- a/drivers/bluetooth/btqca.h
>> +++ b/drivers/bluetooth/btqca.h
>> @@ -14,6 +14,7 @@
>>  #define EDL_NVM_ACCESS_SET_REQ_CMD	(0x01)
>>  #define MAX_SIZE_PER_TLV_SEGMENT	(243)
>>  #define QCA_PRE_SHUTDOWN_CMD		(0xFC08)
>> +#define QCA_ENHANCED_LOG_ENABLE_CMD     (0xFC17)
>> 
>>  #define EDL_CMD_REQ_RES_EVT		(0x00)
>>  #define EDL_PATCH_VER_RES_EVT		(0x19)
>> @@ -127,6 +128,7 @@ enum qca_btsoc_type {
>>  	QCA_WCN3990,
>>  	QCA_WCN3991,
>>  	QCA_WCN3998,
>> +	QCA_QCA6390,
> 
> QCA_QCAxxxx seems a bit redundant, why not call it QCA_6390 or QCA6390?
> I also wouldn't be opposed to scrap the QCA_ prefixes from the WCN399x
> types, this is the QCA Bluetooth driver, so it's pretty evident that
> these are Qualcomm chips.

I would like to do this in a separate patch.
