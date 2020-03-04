Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D58D3179003
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2020 13:03:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388019AbgCDMDc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Mar 2020 07:03:32 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:63886 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387966AbgCDMDc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Mar 2020 07:03:32 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583323411; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=w8/VI8a0yZGZ+S81+DrlT9/VeEz0sSf8UqnT8L9K+Uw=;
 b=LikPfLGLJxwMhhjV0fwHTXtIfJVgZTLPiXHufZCFcrZ97yTfMkNQunq5ZRIxPA0VOSlFFimk
 YKQaExU+lHpqa16PKQ0721ij37oFL7rQHNxBaKrVXQfy/6ZyPV/AtCmJD0ZHMtVrTqEYLx7l
 9oUrtji7arGnjj0id3iXjB5IAd8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5f98f6.7f1ee30c25e0-smtp-out-n03;
 Wed, 04 Mar 2020 12:03:02 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E17B8C433A2; Wed,  4 Mar 2020 12:03:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED autolearn=ham
        autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rjliao)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8665EC43383;
        Wed,  4 Mar 2020 12:03:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 04 Mar 2020 20:03:01 +0800
From:   Rocky Liao <rjliao@codeaurora.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        linux-bluetooth-owner@vger.kernel.org
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Make bt_en and susclk not
 mandatory for QCA Rome
In-Reply-To: <20200304085341.GF32540@localhost>
References: <20200304015429.20615-1-rjliao@codeaurora.org>
 <20200304085341.GF32540@localhost>
Message-ID: <fc80e98e2b82ba5b6852252bc57db2e8@codeaurora.org>
X-Sender: rjliao@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

在 2020-03-04 16:53，Johan Hovold 写道：
> On Wed, Mar 04, 2020 at 09:54:29AM +0800, Rocky Liao wrote:
>> On some platforms the bt_en pin and susclk are default on and there
>> is no exposed resource to control them. This patch makes the bt_en
>> and susclk not mandatory to have BT work. It also will not set the
>> HCI_QUIRK_NON_PERSISTENT_SETUP and shutdown() callback if bt_en is
>> not available.
>> 
>> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
>> ---
>>  drivers/bluetooth/hci_qca.c | 47 
>> ++++++++++++++++++++-----------------
>>  1 file changed, 26 insertions(+), 21 deletions(-)
>> 
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index bf436d6e638e..325baa046c3a 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -1562,9 +1562,11 @@ static int qca_power_on(struct hci_dev *hdev)
>>  		ret = qca_wcn3990_init(hu);
>>  	} else {
>>  		qcadev = serdev_device_get_drvdata(hu->serdev);
>> -		gpiod_set_value_cansleep(qcadev->bt_en, 1);
>> -		/* Controller needs time to bootup. */
>> -		msleep(150);
>> +		if (!IS_ERR(qcadev->bt_en)) {
>> +			gpiod_set_value_cansleep(qcadev->bt_en, 1);
>> +			/* Controller needs time to bootup. */
>> +			msleep(150);
>> +		}
>>  	}
>> 
>>  	return ret;
>> @@ -1750,7 +1752,7 @@ static void qca_power_shutdown(struct hci_uart 
>> *hu)
>>  		host_set_baudrate(hu, 2400);
>>  		qca_send_power_pulse(hu, false);
>>  		qca_regulator_disable(qcadev);
>> -	} else {
>> +	} else if (!IS_ERR(qcadev->bt_en)) {
>>  		gpiod_set_value_cansleep(qcadev->bt_en, 0);
>>  	}
>>  }
>> @@ -1852,6 +1854,7 @@ static int qca_serdev_probe(struct serdev_device 
>> *serdev)
>>  	struct hci_dev *hdev;
>>  	const struct qca_vreg_data *data;
>>  	int err;
>> +	bool power_ctrl_enabled = true;
>> 
>>  	qcadev = devm_kzalloc(&serdev->dev, sizeof(*qcadev), GFP_KERNEL);
>>  	if (!qcadev)
>> @@ -1901,35 +1904,37 @@ static int qca_serdev_probe(struct 
>> serdev_device *serdev)
>>  		qcadev->bt_en = devm_gpiod_get(&serdev->dev, "enable",
>>  					       GPIOD_OUT_LOW);
> 
> Shouldn't you use devm_gpiod_get_optional()?
> 
>>  		if (IS_ERR(qcadev->bt_en)) {
>> -			dev_err(&serdev->dev, "failed to acquire enable gpio\n");
>> -			return PTR_ERR(qcadev->bt_en);
>> +			dev_warn(&serdev->dev, "failed to acquire enable gpio\n");
>> +			power_ctrl_enabled = false;
> 
> And bail out on errors, but treat NULL as !port_ctrl_enabled?
> 
>>  		}
>> 
>>  		qcadev->susclk = devm_clk_get(&serdev->dev, NULL);
> 
> And devm_clk_get_optional() here.
> 
> Etc.
> 
> Also does the devicetree binding need to be updated to reflect this
> change?
> 
OK, I will update to use the suggested API.
The devicetress binding doesn't need to be updated as they are already 
optional there.

> Johan
