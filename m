Return-Path: <linux-arm-msm+bounces-81832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E75C5CB13
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 11:54:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7A4684F70FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 10:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01AC31352C;
	Fri, 14 Nov 2025 10:45:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65225313E2E;
	Fri, 14 Nov 2025 10:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763117140; cv=none; b=N5Im5jFcQ0bZMvF0hZwZtVZLcQSvujD8s0ZqyFJlZQYALpp6LDmjpTKgZyJERJjQFx/Jito6VkDB81mgg+tLytF+axxKik+Gnr5COwy8xr8+ar+A6MSy3VBQknhT9CGSS05+h5LyolClkxPdlF9vKSJdWAzYT4epWFyWTygyCQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763117140; c=relaxed/simple;
	bh=hxmKaX7LSuFyl0R40p2NwtXTt8wPrju18slrNZhMk0g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qXen9LD45E0MGP+iJozgHhpZv0rgRBJ82kDoPSd2y2Izj1G5jW9FlW08uIxLgufNXvoftkVphaBkxH9NULSIaFCZb+Zs+wBKz4v7QDCNOoGQJS5wisSrV9bn4V031uqz6cvbigr+dhPrp+AkOKWXTcAQ6A8IxT/1gq6UjT/NYkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.5] (ip5f5af126.dynamic.kabel-deutschland.de [95.90.241.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 1731061CC3FDA;
	Fri, 14 Nov 2025 11:45:22 +0100 (CET)
Message-ID: <8ffee44c-0e44-4137-bf9e-11e7d8b168ab@molgen.mpg.de>
Date: Fri, 14 Nov 2025 11:45:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] Bluetooth: btqca: Add WCN6855 firmware priority
 selection feature
To: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann
 <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, cheng.jiang@oss.qualcomm.com,
 quic_chezhou@quicinc.com, wei.deng@oss.qualcomm.com, stable@vger.kernel.org
References: <20251114081751.3940541-1-shuai.zhang@oss.qualcomm.com>
 <20251114081751.3940541-2-shuai.zhang@oss.qualcomm.com>
 <967d99e5-7cc1-4f8c-8a1b-21b1bd096cb9@molgen.mpg.de>
 <32c952e1-39c0-421b-ad77-26603907d444@oss.qualcomm.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <32c952e1-39c0-421b-ad77-26603907d444@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Shuai,


Am 14.11.25 um 11:41 schrieb Shuai Zhang:

> On 11/14/2025 6:04 PM, Paul Menzel wrote:

>> Am 14.11.25 um 09:17 schrieb Shuai Zhang:
>>> The prefix "wcn" corresponds to the WCN685x chip, while entries without
>>> the "wcn" prefix correspond to the QCA2066 chip. There are some feature
>>> differences between the two.
>>>
>>> However, due to historical reasons, WCN685x chip has been using firmware
>>> without the "wcn" prefix. The mapping between the chip and its
>>> corresponding firmware has now been corrected.
>>
>> Present tense: … is now corrected.
>>
>> Maybe give one example of the firmware file.
>>
>> How did you test this? Maybe paste some log lines before and after?
>>
> Should I put the test log results directly in the commit?

Without knowing how they look, I cannot say for sure, but yes, I would 
add as much as possible to the commit message.

>>> Cc: stable@vger.kernel.org
>>> Fixes: 30209aeff75f ("Bluetooth: qca: Expand firmware-name to load 
>>> specific rampatch")
>>> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
>>> ---
>>>   drivers/bluetooth/btqca.c | 22 ++++++++++++++++++++--
>>>   1 file changed, 20 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
>>> index 7c958d606..8e0004ef7 100644
>>> --- a/drivers/bluetooth/btqca.c
>>> +++ b/drivers/bluetooth/btqca.c
>>> @@ -847,8 +847,12 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>>                    "qca/msbtfw%02x.mbn", rom_ver);
>>>               break;
>>>           case QCA_WCN6855:
>>> +            /* Due to historical reasons, WCN685x chip has been using firmware
>>> +             * without the "wcn" prefix. The mapping between the chip and its
>>> +             * corresponding firmware has now been corrected.
>>> +             */
>>>               snprintf(config.fwname, sizeof(config.fwname),
>>> -                 "qca/hpbtfw%02x.tlv", rom_ver);
>>> +                 "qca/wcnhpbtfw%02x.tlv", rom_ver);
>>>               break;
>>>           case QCA_WCN7850:
>>>               snprintf(config.fwname, sizeof(config.fwname),
>>> @@ -861,6 +865,13 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>>       }
>>>         err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
>>> +
>>> +    if (!rampatch_name && err < 0 && soc_type == QCA_WCN6855) {
>>> +        snprintf(config.fwname, sizeof(config.fwname),
>>> +             "qca/hpbtfw%02x.tlv", rom_ver);
>>> +        err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
>>> +    }
>>> +
>>>       if (err < 0) {
>>>           bt_dev_err(hdev, "QCA Failed to download patch (%d)", err);
>>>           return err;
>>> @@ -923,7 +934,7 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>>           case QCA_WCN6855:
>>>               qca_read_fw_board_id(hdev, &boardid);
>>>               qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
>>> -                          "hpnv", soc_type, ver, rom_ver, boardid);
>>> +                          "wcnhpnv", soc_type, ver, rom_ver, boardid);
>>>               break;
>>>           case QCA_WCN7850:
>>>               qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
>>> @@ -936,6 +947,13 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baudrate,
>>>       }
>>>         err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
>>> +
>>> +    if (!firmware_name && err < 0 && soc_type == QCA_WCN6855) {
>>> +        qca_get_nvm_name_by_board(config.fwname, sizeof(config.fwname),
>>> +                      "hpnv", soc_type, ver, rom_ver, boardid);
>>> +        err = qca_download_firmware(hdev, &config, soc_type, rom_ver);
>>> +    }
>>> +
>>>       if (err < 0) {
>>>           bt_dev_err(hdev, "QCA Failed to download NVM (%d)", err);
>>>           return err;
>>
>> The diff logs good.
>>
>> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

