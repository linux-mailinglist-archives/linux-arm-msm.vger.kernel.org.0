Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5218434404
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 06:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbhJTEDQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 00:03:16 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:30777 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhJTEDP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 00:03:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634702462; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=P3DYTaaiVLsvcsVBCW0eBADburMciZ8lW+laDg9RToQ=;
 b=vUWCgTLUH+O3uQUG83w4jmeBOggOp22fx8fyX+g4blDku1qWgzSHFNC7RnTA348PMx+SxmDA
 lNb2tMZZY45p8JD9RWnmZuGXE3PJZ6/WmnAcBUzVue2qQeQioFndxSe0U7Er0jIMpKHPRvhN
 PQcr/WmnrncaLHZ9cjsY2ZyiU8Y=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 616f94753416c2cb701e6d88 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 20 Oct 2021 04:00:53
 GMT
Sender: tjiang=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ECEF3C4360C; Wed, 20 Oct 2021 04:00:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: tjiang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1FFAFC4338F;
        Wed, 20 Oct 2021 04:00:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 20 Oct 2021 12:00:52 +0800
From:   tjiang@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org,
        rjliao@codeaurora.org, zijuhu@codeaurora.org
Subject: Re: [PATCH v2] Bluetooth: btusb: Add support for variant WCN6855 by
 using different nvm
In-Reply-To: <YW8csSr/I1IRgAaT@google.com>
References: <81add00a4a038008e9f734c5f5e5b712@codeaurora.org>
 <YW8csSr/I1IRgAaT@google.com>
Message-ID: <39ca0c9102265d6e14f3e0da94fec40d@codeaurora.org>
X-Sender: tjiang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks Matthias for the comments. please see my comments inline .

BTW: marcel , do you agree with Matthias comments ? if fine , I will 
align Matthias comments and make the final version.

regards.
tim
On 2021-10-20 03:29, Matthias Kaehlcke wrote:
> On Tue, Oct 12, 2021 at 03:55:56PM +0800, tjiang@codeaurora.org wrote:
>> the RF performance of wcn6855 soc chip from different foundries will 
>> be
>> difference, so we should use different nvm to configure them.
>> 
>> Signed-off-by: Tim Jiang <tjiang@codeaurora.org>
>> ---
>>  drivers/bluetooth/btusb.c | 56
>> +++++++++++++++++++++++++++++++++++------------
>>  1 file changed, 42 insertions(+), 14 deletions(-)
>> 
>> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
>> index 75c83768c257..f352ff351b61 100644
>> --- a/drivers/bluetooth/btusb.c
>> +++ b/drivers/bluetooth/btusb.c
>> @@ -3190,6 +3190,9 @@ static int btusb_set_bdaddr_wcn6855(struct 
>> hci_dev
>> *hdev,
>>  #define QCA_DFU_TIMEOUT		3000
>>  #define QCA_FLAG_MULTI_NVM      0x80
>> 
>> +#define WCN6855_2_0_RAM_VERSION_GF 0x400c1200
>> +#define WCN6855_2_1_RAM_VERSION_GF 0x400c1211
>> +
>>  struct qca_version {
>>  	__le32	rom_version;
>>  	__le32	patch_version;
>> @@ -3221,6 +3224,7 @@ static const struct qca_device_info
>> qca_devices_table[] = {
>>  	{ 0x00000302, 28, 4, 16 }, /* Rome 3.2 */
>>  	{ 0x00130100, 40, 4, 16 }, /* WCN6855 1.0 */
>>  	{ 0x00130200, 40, 4, 16 }, /* WCN6855 2.0 */
>> +	{ 0x00130201, 40, 4, 16 }, /* WCN6855 2.1 */
>>  };
>> 
>>  static int btusb_qca_send_vendor_req(struct usb_device *udev, u8 
>> request,
>> @@ -3375,6 +3379,43 @@ static int btusb_setup_qca_load_rampatch(struct
>> hci_dev *hdev,
>>  	return err;
>>  }
>> 
>> +static void btusb_generate_qca_nvm_name(char *fwname,
>> +					size_t max_size,
>> +					struct qca_version *ver)
> 
> => const struct qca_version *ver
> 
>> +{
>> +	u32 rom_version = le32_to_cpu(ver->rom_version);
>> +	u16 flag = le16_to_cpu(ver->flag);
>> +
>> +	if (((flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
>> +		u16 board_id = le16_to_cpu(ver->board_id);
>> +		u32 ram_version = le32_to_cpu(ver->ram_version);
>> +		const char *variant;
>> +
>> +		switch (ram_version) {
>> +		case WCN6855_2_0_RAM_VERSION_GF:
>> +		case WCN6855_2_1_RAM_VERSION_GF:
>> +			variant = "_gf";
>> +			break;
>> +		default:
>> +			variant = "";
> 
> instead of the default branch you could assign a default to 'variant' 
> at
> declaration time, but it's fine either way.

[Tim] this code style is recommend by marcel.

> 
>> +			break;
>> +		}
>> +
>> +		/* if boardid equal 0, use default nvm without suffix */
> 
> delete the comment, it just states the obvious
> 
>> +		if (board_id == 0x0) {
> 
> nit: is there really any value in using a hex number here instead of a
> plain decimal 0?

[Tim] this line is inherit from last change , if you think I should 
change 0x0 to 0 , I am fine.

> 
>> +			snprintf(fwname, max_size, "qca/nvm_usb_%08x%s.bin",
>> +				rom_version, variant);
>> +		} else {
>> +			snprintf(fwname, max_size, "qca/nvm_usb_%08x%s_%04x.bin",
>> +				rom_version, variant, board_id);
>> +		}
>> +	} else {
>> +		snprintf(fwname, max_size, "qca/nvm_usb_%08x.bin",
>> +			rom_version);
>> +	}
>> +
>> +}
>> +
>>  static int btusb_setup_qca_load_nvm(struct hci_dev *hdev,
>>  				    struct qca_version *ver,
>>  				    const struct qca_device_info *info)
>> @@ -3383,20 +3424,7 @@ static int btusb_setup_qca_load_nvm(struct 
>> hci_dev
>> *hdev,
>>  	char fwname[64];
>>  	int err;
>> 
>> -	if (((ver->flag >> 8) & 0xff) == QCA_FLAG_MULTI_NVM) {
>> -		/* if boardid equal 0, use default nvm without surfix */
>> -		if (le16_to_cpu(ver->board_id) == 0x0) {
>> -			snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x.bin",
>> -				 le32_to_cpu(ver->rom_version));
>> -		} else {
>> -			snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x_%04x.bin",
>> -				le32_to_cpu(ver->rom_version),
>> -				le16_to_cpu(ver->board_id));
>> -		}
>> -	} else {
>> -		snprintf(fwname, sizeof(fwname), "qca/nvm_usb_%08x.bin",
>> -			 le32_to_cpu(ver->rom_version));
>> -	}
>> +	btusb_generate_qca_nvm_name(fwname, sizeof(fwname), ver);
>> 
>>  	err = request_firmware(&fw, fwname, &hdev->dev);
>>  	if (err) {
