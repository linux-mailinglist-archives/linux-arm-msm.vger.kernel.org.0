Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A68B92B92CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Nov 2020 13:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727417AbgKSMuR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Nov 2020 07:50:17 -0500
Received: from z5.mailgun.us ([104.130.96.5]:31758 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727398AbgKSMuQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Nov 2020 07:50:16 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605790215; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=IaxDyN0zVVfn696/u90QGUG+9uOUlx4Eok4grDksNsc=;
 b=r/EXTseK9DnkTZ0iaSYiDhuqmXhrvGyliUX/IFh/B8cfnVM0gIasKeXwGFT5pTIrq3Gcw+wF
 wUxfG/P5lhlUbER+A0My63tREuFaVn4RoGMJnop8rTT0F5LF2w3g/5Tcf4GL3cW2lYsZXd9a
 iY4XsiIaKoy9bL/jy/FOJ7fG370=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5fb66a04e714ea65012c2f62 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 19 Nov 2020 12:50:12
 GMT
Sender: gubbaven=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 33B58C43461; Thu, 19 Nov 2020 12:50:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: gubbaven)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8FDA8C43460;
        Thu, 19 Nov 2020 12:50:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 19 Nov 2020 18:20:11 +0530
From:   gubbaven@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, rjliao@codeaurora.org,
        hbandi@codeaurora.org, abhishekpandit@chromium.org
Subject: Re: [PATCH v1] Bluetooth: Use NVM files based on SoC ID for WCN3991
In-Reply-To: <20200916180229.GA3560556@google.com>
References: <1600184605-31611-1-git-send-email-gubbaven@codeaurora.org>
 <20200916180229.GA3560556@google.com>
Message-ID: <7d9a95bc2b1c11487662c8b4c0ffa29f@codeaurora.org>
X-Sender: gubbaven@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias,

On 2020-09-16 23:32, Matthias Kaehlcke wrote:
> Hi Venkata,
> 
> I agree with Marcel that the version magic is confusing ...
> 
> On Tue, Sep 15, 2020 at 09:13:25PM +0530, Venkata Lakshmi Narayana 
> Gubba wrote:
>> This change will allow to use different NVM file based
>> on WCN3991 BT SoC ID.Need to use different NVM file based on
>> fab location for WCN3991 BT SoC.
>> 
>> Signed-off-by: Venkata Lakshmi Narayana Gubba 
>> <gubbaven@codeaurora.org>
>> ---
>>  drivers/bluetooth/btqca.c   | 41 
>> +++++++++++++++++++++++++----------------
>>  drivers/bluetooth/btqca.h   | 13 ++++++++-----
>>  drivers/bluetooth/hci_qca.c | 11 +++++------
>>  3 files changed, 38 insertions(+), 27 deletions(-)
>> 
>> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
>> index ce9dcff..a7e72f1 100644
>> --- a/drivers/bluetooth/btqca.c
>> +++ b/drivers/bluetooth/btqca.c
>> @@ -14,12 +14,11 @@
>> 
>>  #define VERSION "0.1"
>> 
>> -int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version,
>> +int qca_read_soc_version(struct hci_dev *hdev, struct 
>> qca_btsoc_version *ver,
>>  			 enum qca_btsoc_type soc_type)
>>  {
>>  	struct sk_buff *skb;
>>  	struct edl_event_hdr *edl;
>> -	struct qca_btsoc_version *ver;
>>  	char cmd;
>>  	int err = 0;
>>  	u8 event_type = HCI_EV_VENDOR;
>> @@ -70,9 +69,9 @@ int qca_read_soc_version(struct hci_dev *hdev, u32 
>> *soc_version,
>>  	}
>> 
>>  	if (soc_type >= QCA_WCN3991)
>> -		memmove(&edl->data, &edl->data[1], sizeof(*ver));
>> -
>> -	ver = (struct qca_btsoc_version *)(edl->data);
>> +		memcpy(ver, &edl->data[1], sizeof(*ver));
>> +	else
>> +		memcpy(ver, &edl->data, sizeof(*ver));
>> 
>>  	bt_dev_info(hdev, "QCA Product ID   :0x%08x",
>>  		    le32_to_cpu(ver->product_id));
>> @@ -83,13 +82,7 @@ int qca_read_soc_version(struct hci_dev *hdev, u32 
>> *soc_version,
>>  	bt_dev_info(hdev, "QCA Patch Version:0x%08x",
>>  		    le16_to_cpu(ver->patch_ver));
>> 
>> -	/* QCA chipset version can be decided by patch and SoC
>> -	 * version, combination with upper 2 bytes from SoC
>> -	 * and lower 2 bytes from patch will be used.
>> -	 */
>> -	*soc_version = (le32_to_cpu(ver->soc_id) << 16) |
>> -		       (le16_to_cpu(ver->rom_ver) & 0x0000ffff);
>> -	if (*soc_version == 0)
>> +	if (le32_to_cpu(ver->soc_id) == 0 || le16_to_cpu(ver->rom_ver) == 0)
>>  		err = -EILSEQ;
>> 
>>  out:
>> @@ -446,15 +439,25 @@ int qca_set_bdaddr_rome(struct hci_dev *hdev, 
>> const bdaddr_t *bdaddr)
>>  EXPORT_SYMBOL_GPL(qca_set_bdaddr_rome);
>> 
>>  int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>> -		   enum qca_btsoc_type soc_type, u32 soc_ver,
>> +		   enum qca_btsoc_type soc_type, struct qca_btsoc_version ver,
>>  		   const char *firmware_name)
>>  {
>>  	struct qca_fw_config config;
>>  	int err;
>>  	u8 rom_ver = 0;
>> +	u32 soc_ver;
>> 
>>  	bt_dev_dbg(hdev, "QCA setup on UART");
>> 
>> +	/* QCA chipset version can be decided by patch and SoC
>> +	 * version, combination with upper 2 bytes from SoC
>> +	 * and lower 2 bytes from patch will be used.
>> +	 */
>> +	soc_ver = (le32_to_cpu(ver.soc_id) << 16) |
>> +		       (le16_to_cpu(ver.rom_ver) & 0x0000ffff);
>> +
> 
> Can we at least do the leN_to_cpu conversions in qca_read_soc_version()
> as previously to make this less clunky?
> 
> And/or define a macro to extract 'soc_ver' to unclunkify this further.
> 
[Venkata]:
I will define a macro to extract soc_ver and will update in next 
patchset.
>> +	bt_dev_info(hdev, "QCA controller version 0x%08x", soc_ver);
>> +
>>  	config.user_baud_rate = baudrate;
>> 
>>  	/* Download rampatch file */
>> @@ -491,9 +494,15 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t 
>> baudrate,
>>  	if (firmware_name)
>>  		snprintf(config.fwname, sizeof(config.fwname),
>>  			 "qca/%s", firmware_name);
>> -	else if (qca_is_wcn399x(soc_type))
>> -		snprintf(config.fwname, sizeof(config.fwname),
>> -			 "qca/crnv%02x.bin", rom_ver);
>> +	else if (qca_is_wcn399x(soc_type)) {
>> +		if (ver.soc_id == QCA_WCN3991_SOC_ID) {
>> +			snprintf(config.fwname, sizeof(config.fwname),
>> +				 "qca/crnv%02xu.bin", rom_ver);
>> +		} else {
>> +			snprintf(config.fwname, sizeof(config.fwname),
>> +				 "qca/crnv%02x.bin", rom_ver);
>> +		}
>> +	}
>>  	else if (soc_type == QCA_QCA6390)
>>  		snprintf(config.fwname, sizeof(config.fwname),
>>  			 "qca/htnv%02x.bin", rom_ver);
>> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
>> index d81b74c..d01a9f5 100644
>> --- a/drivers/bluetooth/btqca.h
>> +++ b/drivers/bluetooth/btqca.h
>> @@ -34,6 +34,8 @@
>>  #define QCA_HCI_CC_OPCODE		0xFC00
>>  #define QCA_HCI_CC_SUCCESS		0x00
>> 
>> +#define QCA_WCN3991_SOC_ID		(0x40014320)
> 
> The QCA_ prefix seems a bit verbose, given that this is a QCA driver 
> and
> WCN3991 uniquely identifies the chip. Having the prefix just needlessly
> clutters conditions, I suggest to just call it SOC_ID_WCN3991.
