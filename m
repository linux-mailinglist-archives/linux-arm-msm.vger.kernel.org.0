Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 102791501FB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2020 08:27:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727406AbgBCH1t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 02:27:49 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:49508 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727306AbgBCH1s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 02:27:48 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580714868; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=iHnr0J8kqrVDVU+/0MUoetOaiS5m6yFUsUBUaVKZVc0=;
 b=KoRfMLUZM/aqmCrOnRoJR2BzE8tp6tHsELYydkX2PPloNjGWgLbM2ZKx3NdtqTbCgzG0UilR
 stUtDSVcRnJgsFlg1xEG7X+sbAQP/QmlE1qIFLVusZwKqF9WDh7bG2QiTWhTaqW08rK8l9Cd
 koiIiIQaWw0is2iKQoqgV+PvVsw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e37cb71.7f42edba1148-smtp-out-n03;
 Mon, 03 Feb 2020 07:27:45 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9C32AC433A2; Mon,  3 Feb 2020 07:27:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: gubbaven)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 92ED8C43383;
        Mon,  3 Feb 2020 07:27:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 03 Feb 2020 12:57:42 +0530
From:   gubbaven@codeaurora.org
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        robh@kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        tientzu@chromium.org, seanpaul@chromium.org, rjliao@codeaurora.org,
        yshavit@google.com
Subject: Re: [PATCH v2 1/2] Bluetooth: hci_qca: Enable clocks required for BT
 SOC
In-Reply-To: <543135AD-707A-4945-A67D-8912D1C35EED@holtmann.org>
References: <1580456335-7317-1-git-send-email-gubbaven@codeaurora.org>
 <543135AD-707A-4945-A67D-8912D1C35EED@holtmann.org>
Message-ID: <b38d85546b89df7351abb9a7e25d7475@codeaurora.org>
X-Sender: gubbaven@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Marcel,

On 2020-02-01 01:21, Marcel Holtmann wrote:
> Hi Venkata,
> 
>> Instead of relying on other subsytem to turn ON clocks
>> required for BT SoC to operate, voting them from the driver.
>> 
>> Signed-off-by: Venkata Lakshmi Narayana Gubba 
>> <gubbaven@codeaurora.org>
>> ---
>> v2:
>>   * addressed forward declarations
>>   * updated with devm_clk_get_optional()
>> 
>> ---
>> drivers/bluetooth/hci_qca.c | 25 +++++++++++++++++++++++++
>> 1 file changed, 25 insertions(+)
>> 
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index d6e0c99..73706f3 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -1738,6 +1738,15 @@ static int qca_power_off(struct hci_dev *hdev)
>> 	return 0;
>> }
>> 
>> +static int qca_setup_clock(struct clk *clk, bool enable)
>> +{
>> +	if (enable)
>> +		return clk_prepare_enable(clk);
>> +
>> +	clk_disable_unprepare(clk);
>> +	return 0;
>> +}
>> +
> 
> this function is pointless and it just complicated the code.

[Venkata] : Sure we will remove the function and will update in next 
patch set.
> 
>> static int qca_regulator_enable(struct qca_serdev *qcadev)
>> {
>> 	struct qca_power *power = qcadev->bt_power;
>> @@ -1755,6 +1764,13 @@ static int qca_regulator_enable(struct 
>> qca_serdev *qcadev)
>> 
>> 	power->vregs_on = true;
>> 
>> +	ret = qca_setup_clock(qcadev->susclk, true);
> 
> 	ret = clk_prepare_enable(qcadev->susclk);

[Venkata] : Sure.We will update in next patch set.

> 
>> +	if (ret) {
>> +		/* Turn off regulators to overcome power leakage */
>> +		qca_regulator_disable(qcadev);
>> +		return ret;
>> +	}
>> +
>> 	return 0;
>> }
>> 
>> @@ -1773,6 +1789,9 @@ static void qca_regulator_disable(struct 
>> qca_serdev *qcadev)
>> 
>> 	regulator_bulk_disable(power->num_vregs, power->vreg_bulk);
>> 	power->vregs_on = false;
>> +
>> +	if (qcadev->susclk)
>> +		qca_setup_clock(qcadev->susclk, false);
> 
> 		clk_disable_unprepare(qcadev->susclk);

[Venkata] : Sure.We will update in next patch set.
> 
>> }
>> 
>> static int qca_init_regulators(struct qca_power *qca,
>> @@ -1839,6 +1858,12 @@ static int qca_serdev_probe(struct 
>> serdev_device *serdev)
>> 
>> 		qcadev->bt_power->vregs_on = false;
>> 
>> +		qcadev->susclk = devm_clk_get_optional(&serdev->dev, NULL);
>> +		if (IS_ERR(qcadev->susclk)) {
>> +			dev_err(&serdev->dev, "failed to acquire clk\n");
>> +			return PTR_ERR(qcadev->susclk);
>> +		}
>> +
>> 		device_property_read_u32(&serdev->dev, "max-speed",
>> 					 &qcadev->oper_speed);
>> 		if (!qcadev->oper_speed)
> 
> Regards
> 
> Marcel

Regards,
Venkata.
