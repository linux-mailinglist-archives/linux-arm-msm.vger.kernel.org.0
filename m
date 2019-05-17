Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77CF921303
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2019 06:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbfEQE0d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 May 2019 00:26:33 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:48378 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726755AbfEQE0d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 May 2019 00:26:33 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C0C1760DA8; Fri, 17 May 2019 04:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558067191;
        bh=IbDX8lLKkmrbMMScNIrGA8uD1ioXtQEK203WKkXTUT0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dTGmC+qNl2FUVV+7qBdEdAjItTQsseVKSWf95tfccyNE1BxfqrTygEVFXd7NO/GWQ
         jDBFBQOOkHHudfJP4ujWXnoudeljtfX3ReNKpBBbeKO6UnXYQLWvpGnHx7D+70zCIB
         FHNKwG0JOenyB8WWtc6W8nZQ32WzHg0DTpO4/IRs=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 4B63960A24;
        Fri, 17 May 2019 04:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558067190;
        bh=IbDX8lLKkmrbMMScNIrGA8uD1ioXtQEK203WKkXTUT0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=LUhHEH9FOfejyMct2qG5JfNqdbHSCyCc85invtgoc3ed/holhaFywPZZ/qDfcGzO2
         nNvx3skH4PpWKqbih7Zmd271uvLaqfSk/46wF6swOypbzDlL2hTrEe8gT/c/Ps0z7k
         Ms3t7Yb8OyVvZEeymVo2S3+duvPx6Evpwbws/AkU=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 17 May 2019 09:56:30 +0530
From:   Harish Bandi <c-hbandi@codeaurora.org>
To:     Balakrishna Godavarthi <bgodavar@codeaurora.org>
Cc:     Rocky Liao <rjliao@codeaurora.org>, robh+dt@kernel.org,
        mark.rutland@arm.com, marcel@holtmann.org, johan.hedberg@gmail.com,
        thierry.escande@linaro.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Hemantg <hemantg@codeaurora.org>,
        linux-bluetooth-owner@vger.kernel.org
Subject: Re: [PATCH v5 1/2] Bluetooth: hci_qca: Load customized NVM based on
 the device property
In-Reply-To: <178d2a3454399cfad0e61e72a13ea19a@codeaurora.org>
References: <1557631148-5120-1-git-send-email-rjliao@codeaurora.org>
 <1557919161-11010-1-git-send-email-rjliao@codeaurora.org>
 <178d2a3454399cfad0e61e72a13ea19a@codeaurora.org>
Message-ID: <d3e2f431a8e2ef00d7bd8c1cebe5dfc1@codeaurora.org>
X-Sender: c-hbandi@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-05-17 08:13, Balakrishna Godavarthi wrote:
> Hi Rocky,
> 
> On 2019-05-15 16:49, Rocky Liao wrote:
>> QCA BTSOC NVM is a customized firmware file and different vendors may
>> want to have different BTSOC configuration (e.g. Configure SCO over 
>> PCM
>> or I2S, Setting Tx power, etc.) via this file. This patch will allow
>> vendors to download different NVM firmware file by reading a device
>> property "firmware-name".
>> 
>> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
>> ---
>> Changes in v5:
>>   * Made the change applicable to the wcn399x series chip sets
>> ---
>>  drivers/bluetooth/btqca.c   |  8 ++++++--
>>  drivers/bluetooth/btqca.h   |  6 ++++--
>>  drivers/bluetooth/hci_qca.c | 19 ++++++++++++++++++-
>>  3 files changed, 28 insertions(+), 5 deletions(-)
>> 
>> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
>> index cc12eec..a78b80e 100644
>> --- a/drivers/bluetooth/btqca.c
>> +++ b/drivers/bluetooth/btqca.c
>> @@ -332,7 +332,8 @@ int qca_set_bdaddr_rome(struct hci_dev *hdev,
>> const bdaddr_t *bdaddr)
>>  EXPORT_SYMBOL_GPL(qca_set_bdaddr_rome);
>> 
>>  int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>> -		   enum qca_btsoc_type soc_type, u32 soc_ver)
>> +		   enum qca_btsoc_type soc_type, u32 soc_ver,
>> +		   const char *firmware_name)
>>  {
>>  	struct rome_config config;
>>  	int err;
>> @@ -365,7 +366,10 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t 
>> baudrate,
>> 
>>  	/* Download NVM configuration */
>>  	config.type = TLV_TYPE_NVM;
>> -	if (qca_is_wcn399x(soc_type))
>> +	if (firmware_name)
>> +		snprintf(config.fwname, sizeof(config.fwname),
>> +			 "qca/%s", firmware_name);
>> +	else if (qca_is_wcn399x(soc_type))
>>  		snprintf(config.fwname, sizeof(config.fwname),
>>  			 "qca/crnv%02x.bin", rom_ver);
>>  	else
>> diff --git a/drivers/bluetooth/btqca.h b/drivers/bluetooth/btqca.h
>> index 4c4fe2b..8c037bb 100644
>> --- a/drivers/bluetooth/btqca.h
>> +++ b/drivers/bluetooth/btqca.h
>> @@ -140,7 +140,8 @@ enum qca_btsoc_type {
>> 
>>  int qca_set_bdaddr_rome(struct hci_dev *hdev, const bdaddr_t 
>> *bdaddr);
>>  int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>> -		   enum qca_btsoc_type soc_type, u32 soc_ver);
>> +		   enum qca_btsoc_type soc_type, u32 soc_ver,
>> +		   const char *firmware_name);
>>  int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version);
>>  int qca_set_bdaddr(struct hci_dev *hdev, const bdaddr_t *bdaddr);
>>  static inline bool qca_is_wcn399x(enum qca_btsoc_type soc_type)
>> @@ -155,7 +156,8 @@ static inline int qca_set_bdaddr_rome(struct
>> hci_dev *hdev, const bdaddr_t *bdad
>>  }
>> 
>>  static inline int qca_uart_setup(struct hci_dev *hdev, uint8_t 
>> baudrate,
>> -				 enum qca_btsoc_type soc_type, u32 soc_ver)
>> +				 enum qca_btsoc_type soc_type, u32 soc_ver,
>> +				 const char *firmware_name)
>>  {
>>  	return -EOPNOTSUPP;
>>  }
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index 57322c4..9590602 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -169,6 +169,7 @@ struct qca_serdev {
>>  	struct qca_power *bt_power;
>>  	u32 init_speed;
>>  	u32 oper_speed;
>> +	const char *firmware_name;
>>  };
>> 
>>  static int qca_power_setup(struct hci_uart *hu, bool on);
>> @@ -190,6 +191,17 @@ static enum qca_btsoc_type qca_soc_type(struct
>> hci_uart *hu)
>>  	return soc_type;
>>  }
>> 
>> +static const char *qca_get_firmware_name(struct hci_uart *hu)
>> +{
>> +	if (hu->serdev) {
>> +		struct qca_serdev *qsd = serdev_device_get_drvdata(hu->serdev);
>> +
>> +		return qsd->firmware_name;
>> +	} else {
>> +		return NULL;
>> +	}
>> +}
>> +
>>  static void __serial_clock_on(struct tty_struct *tty)
>>  {
>>  	/* TODO: Some chipset requires to enable UART clock on client
>> @@ -1195,6 +1207,7 @@ static int qca_setup(struct hci_uart *hu)
>>  	struct qca_data *qca = hu->priv;
>>  	unsigned int speed, qca_baudrate = QCA_BAUDRATE_115200;
>>  	enum qca_btsoc_type soc_type = qca_soc_type(hu);
>> +	const char *firmware_name = qca_get_firmware_name(hu);
>>  	int ret;
>>  	int soc_ver = 0;
>> 
>> @@ -1245,7 +1258,8 @@ static int qca_setup(struct hci_uart *hu)
>> 
>>  	bt_dev_info(hdev, "QCA controller version 0x%08x", soc_ver);
>>  	/* Setup patch / NVM configurations */
>> -	ret = qca_uart_setup(hdev, qca_baudrate, soc_type, soc_ver);
>> +	ret = qca_uart_setup(hdev, qca_baudrate, soc_type, soc_ver,
>> +			firmware_name);
>>  	if (!ret) {
>>  		set_bit(QCA_IBS_ENABLED, &qca->flags);
>>  		qca_debugfs_init(hdev);
>> @@ -1477,6 +1491,9 @@ static int qca_serdev_probe(struct serdev_device 
>> *serdev)
>>  			return PTR_ERR(qcadev->bt_en);
>>  		}
>> 
>> +		device_property_read_string(&serdev->dev, "firmware-name",
>> +					 &qcadev->firmware_name);
>> +
>>  		qcadev->susclk = devm_clk_get(&serdev->dev, NULL);
>>  		if (IS_ERR(qcadev->susclk)) {
>>  			dev_err(&serdev->dev, "failed to acquire clk\n");
> 
> Thanks for doing it for wcn399x series too.
> 
> Change look fine to me.
> 
> Reviewed-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>

Tested for WCN3998.

Tested-by: Harish Bandi <c-hbandi@codeaurora.org>

Thanks,
Harish
