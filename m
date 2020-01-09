Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D68CF1351E0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2020 04:22:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgAIDW2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jan 2020 22:22:28 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:26831 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727549AbgAIDW1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jan 2020 22:22:27 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578540147; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=BguFrLjftiRh3lvAGyn+GztB5Ot8YO0JqHR8r0AJH3E=;
 b=GjZPdk8K+yoCMPTgPwgl5xDYJWVxVe4U1EAnQOgxaEvDHwcTljHGRQXh/HlAfOjyxbatIaGP
 w9WOqRUEJ829oUjK1aK1C8Nj2Z+OUwkhs7v0IKd8GXWq0vsXNXkMpeiiikC0jceqqPBAWB9M
 HBjZ8tmXj6rjTJqPYTAK+dlBWKg=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e169c6e.7f95208c5f10-smtp-out-n03;
 Thu, 09 Jan 2020 03:22:22 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6464BC4479C; Thu,  9 Jan 2020 03:22:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rjliao)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CF096C43383;
        Thu,  9 Jan 2020 03:22:21 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 09 Jan 2020 11:22:21 +0800
From:   Rocky Liao <rjliao@codeaurora.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-bluetooth-owner@vger.kernel.org
Subject: Re: [PATCH v2 1/3] Bluetooth: hci_qca: Add qca_power_on() API to
 support both wcn399x and Rome power up
In-Reply-To: <20200108183427.GE89495@google.com>
References: <20200107052601.32216-1-rjliao@codeaurora.org>
 <20200108090804.22889-1-rjliao@codeaurora.org>
 <20200108183427.GE89495@google.com>
Message-ID: <671e08d94aa70dc315fbaae0ba3429e4@codeaurora.org>
X-Sender: rjliao@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matt,

在 2020-01-09 02:34，Matthias Kaehlcke 写道：
> Hi Rocky,
> 
> On Wed, Jan 08, 2020 at 05:08:02PM +0800, Rocky Liao wrote:
>> This patch adds a unified API qca_power_on() to support both wcn399x 
>> and
>> Rome power on. For wcn399x it calls the qca_wcn3990_init() to init the
>> regulators, and for Rome it pulls up the bt_en GPIO to power up the 
>> btsoc.
>> 
>> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
>> ---
>> 
>> Changes in v2: None
>> 
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
>> +
>> +	if (qca_is_wcn399x(soc_type)) {
> 
> Why not include the qca_regulator_enable() call from qca_open() here?
> It is clearly part of power on.
> 
OK

>> +		ret = qca_wcn3990_init(hu);
>> +	} else {
>> +		if (hu->serdev) {
> 
> nit: you could save a level of indentation (and IMO improve
> readability) by doing:
> 
>      	       if (!hu->serdev)
> 	            	return 0;
> 
OK

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
> I think common practice would be to combine the 3 patches of this 
> series
> into one. The new function doesn't really add any new functionality, 
> but
> is a refactoring. This is more evident if you see in a single diff that
> the pieces in qca_power_on() are removed elsewhere.
OK
