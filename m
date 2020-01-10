Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6E11365A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2020 04:07:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730973AbgAJDHG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jan 2020 22:07:06 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:35631 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730972AbgAJDHF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jan 2020 22:07:05 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578625624; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=+QhPmZzsp/IOava1RMgxHzV1gETnluiY676UKvuOYXk=;
 b=bWOaWpOPOnyr4coY+9qeP9xVtvct/Y/9/ZFRcma2f3bFZ/MTcHx0psIrLdZCTdcraSLM3Gnx
 aacHD65SQ70xrc92NXCrobQdTk5JvjTEqkw7+bm9iOL+tWmAqsYowGoyjRDkDJdjO/2C26KC
 G/ZZ7miB1uBQ404H+n4dUZh9s1Q=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e17ea57.7f0ecba01f80-smtp-out-n02;
 Fri, 10 Jan 2020 03:07:03 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 43C73C4479C; Fri, 10 Jan 2020 03:07:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rjliao)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 80AB7C433CB;
        Fri, 10 Jan 2020 03:07:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Fri, 10 Jan 2020 11:07:01 +0800
From:   Rocky Liao <rjliao@codeaurora.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-bluetooth-owner@vger.kernel.org
Subject: Re: [PATCH v3] Bluetooth: hci_qca: Add qca_power_on() API to support
 both wcn399x and Rome power up
In-Reply-To: <20200109190547.GF89495@google.com>
References: <20200107052601.32216-1-rjliao@codeaurora.org>
 <20200109051427.16426-1-rjliao@codeaurora.org>
 <20200109190547.GF89495@google.com>
Message-ID: <0bb0cf0a61324da281767fe9d01bc5c3@codeaurora.org>
X-Sender: rjliao@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matt,

在 2020-01-10 03:05，Matthias Kaehlcke 写道：
> Hi Rocky,
> 
> On Thu, Jan 09, 2020 at 01:14:27PM +0800, Rocky Liao wrote:
>> This patch adds a unified API qca_power_on() to support both wcn399x 
>> and
>> Rome power on. For wcn399x it calls the qca_wcn3990_init() to init the
>> regulators, and for Rome it pulls up the bt_en GPIO to power up the 
>> btsoc.
>> It also moves all the power up operation from hdev->open() to
>> hdev->setup().
>> 
>> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
>> ---
>> 
>> Changes in v2: None
>> Changes in v3:
>>   -combined the changes of patch 2 and 3 into this patch
> 
> it would be better to actually describe what was done, "patch 2 and 3"
> doesn't provide much useful information.
> 
OK, will update that

>>   -updated the commit message
>> 
>>  drivers/bluetooth/hci_qca.c | 46 
>> ++++++++++++++++++++++++-------------
>>  1 file changed, 30 insertions(+), 16 deletions(-)
>> 
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index 82e4cd4b6663..427e381a08b4 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -541,7 +541,6 @@ static int qca_open(struct hci_uart *hu)
>>  {
>>  	struct qca_serdev *qcadev;
>>  	struct qca_data *qca;
>> -	int ret;
>> 
>>  	BT_DBG("hu %p qca_open", hu);
>> 
>> @@ -582,23 +581,10 @@ static int qca_open(struct hci_uart *hu)
>>  	hu->priv = qca;
>> 
>>  	if (hu->serdev) {
>> -
>>  		qcadev = serdev_device_get_drvdata(hu->serdev);
>> -		if (!qca_is_wcn399x(qcadev->btsoc_type)) {
>> -			gpiod_set_value_cansleep(qcadev->bt_en, 1);
>> -			/* Controller needs time to bootup. */
>> -			msleep(150);
>> -		} else {
>> +		if (qca_is_wcn399x(qcadev->btsoc_type)) {
>>  			hu->init_speed = qcadev->init_speed;
>>  			hu->oper_speed = qcadev->oper_speed;
>> -			ret = qca_regulator_enable(qcadev);
>> -			if (ret) {
>> -				destroy_workqueue(qca->workqueue);
>> -				kfree_skb(qca->rx_skb);
>> -				hu->priv = NULL;
>> -				kfree(qca);
>> -				return ret;
>> -			}
>>  		}
>>  	}
>> 
>> @@ -1531,6 +1517,31 @@ static int qca_wcn3990_init(struct hci_uart 
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
>> +	/* Non-serdev device usually is powered by external power
>> +	 * and don't need additional action in driver for power on
>> +	 */
>> +	if (!hu->serdev)
>> +		return 0;
>> +
>> +	if (qca_is_wcn399x(soc_type)) {
>> +		ret = qca_wcn3990_init(hu);
> 
> Since there is no real need to add the qca_regulator_enable() call from
> qca_open() here qca_power_on() is now essentially a fancy wrapper for
> qca_wcn3990_init(), but I guess that's ok.
> 
>> +	} else {
>> +		qcadev = serdev_device_get_drvdata(hu->serdev);
>> +		gpiod_set_value_cansleep(qcadev->bt_en, 1);
>> +		/* Controller needs time to bootup. */
>> +		msleep(150);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>  static int qca_setup(struct hci_uart *hu)
>>  {
>>  	struct hci_dev *hdev = hu->hdev;
>> @@ -1562,7 +1573,7 @@ static int qca_setup(struct hci_uart *hu)
>>  		set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);
>>  		set_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks);
>>  		hu->hdev->shutdown = qca_power_off;
>> -		ret = qca_wcn3990_init(hu);
>> +		ret = qca_power_on(hdev);
>>  		if (ret)
>>  			return ret;
>> 
>> @@ -1571,6 +1582,9 @@ static int qca_setup(struct hci_uart *hu)
>>  			return ret;
>>  	} else {
>>  		bt_dev_info(hdev, "ROME setup");
>> +		ret = qca_power_on(hdev);
>> +		if (ret)
>> +			return ret;
>>  		qca_set_speed(hu, QCA_INIT_SPEED);
>>  	}
> 
> It would be nice if we could get away with a single qca_power_on() call
> for WCN399x and ROME. How about this before 'if 
> (qca_is_wcn399x(soc_type))':
> 
> 	bt_dev_info(hdev, "setting up %s",
> 		qca_is_wcn399x(soc_type)? "wcn399x" : "ROME");
> 
> 	ret = qca_power_on(hdev);
> 	if (ret)
> 		return ret;
> 
> 
> In any case:
> 
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

Makes sense will do that
