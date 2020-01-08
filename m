Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A94CE13395B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 04:02:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbgAHDCu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 22:02:50 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:26932 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726146AbgAHDCu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 22:02:50 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578452569; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=qCbnHjpRfsfku5ISLdGOv0VGeBZjX2wwBV7P+4U5hl4=;
 b=McVbM8061mQWTJJDWWyL8NucWmwGgjzfbn3JXnWHyfpO4Bfr93DAGet/YikKf6C6fYCK29zu
 4phyqShdfHfWxAlckLF8Dpgue493kNAirL+B4kF0gP6ZIcgfm0JmTsuoLsrOmu8b82OsL0Us
 tRujs2NILx1jxDxCo5MLmf51/pI=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e154657.7f828a469a40-smtp-out-n02;
 Wed, 08 Jan 2020 03:02:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 421DAC4479F; Wed,  8 Jan 2020 03:02:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rjliao)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AAFF6C43383;
        Wed,  8 Jan 2020 03:02:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 08 Jan 2020 11:02:45 +0800
From:   Rocky Liao <rjliao@codeaurora.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-bluetooth-owner@vger.kernel.org
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Add qca_power_on() API to support
 both wcn399x and Rome power up
In-Reply-To: <20200107173149.GD89495@google.com>
References: <20200107052601.32216-1-rjliao@codeaurora.org>
 <20200107173149.GD89495@google.com>
Message-ID: <67e12177f1dc95f1387c5c3ee138343c@codeaurora.org>
X-Sender: rjliao@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matt,

在 2020-01-08 01:31，Matthias Kaehlcke 写道：
> Hi Rocky,
> 
> On Tue, Jan 07, 2020 at 01:26:01PM +0800, Rocky Liao wrote:
>> This patch adds a unified API qca_power_on() to support both wcn399x 
>> and
>> Rome power on. For wcn399x it calls the qca_wcn3990_init() to init the
>> regulators, and for Rome it pulls up the bt_en GPIO to power up the 
>> btsoc.
>> 
>> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
>> ---
>>  drivers/bluetooth/hci_qca.c | 21 +++++++++++++++++++++
>>  1 file changed, 21 insertions(+)
>> 
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index 9392cc7f9908..f6555bd1adbc 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -1532,6 +1532,27 @@ static int qca_wcn3990_init(struct hci_uart 
>> *hu)
>>  	return 0;
>>  }
>> 
>> +static int qca_power_on(struct hci_dev *hdev)
>> +{
>> +	struct hci_uart *hu = hci_get_drvdata(hdev);
>> +	enum qca_btsoc_type soc_type = qca_soc_type(hu);
>> +	struct qca_serdev *qcadev;
>> +	int ret = 0;
> 
> another option would be to return directly from the if/else branches,
> but either way is fine.
> 
>> +
>> +	if (qca_is_wcn399x(soc_type)) {
>> +		ret = qca_wcn3990_init(hu);
>> +	} else {
>> +		if (hu->serdev) {
>> +			qcadev = serdev_device_get_drvdata(hu->serdev);
>> +			gpiod_set_value_cansleep(qcadev->bt_en, 1);
>> +			/* Controller needs time to bootup. */
>> +			msleep(150);
>> +		}
>> +	}
>> +
>> +	return ret;
>> +}
>> +
> 
> I expected qca_power_on() would be called from qca_open(), but as is
> this would only work for ROME, and not WCN399x, which only enables
> the regulators in qca_open(), qca_wcn3990_init() is called from
> qca_setup(). Is there a particular reason for this assymmetry between
> the ROME and WCN399x initialization (i.e. one is fully powered up after
> open(), the other not)?

I prefer to move the power on call from qca_open() to qca_setup() for 
Rome,
I don't see any reason for this difference with wcn399x.I will send 
patch for
this if you have no concern.
