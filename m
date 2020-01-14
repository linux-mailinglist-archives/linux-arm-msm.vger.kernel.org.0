Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AABF013A875
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2020 12:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728914AbgANLek (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jan 2020 06:34:40 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:50285 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725956AbgANLek (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jan 2020 06:34:40 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579001679; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=woaMqbbGS/XqLPbmGA4bjzbSXSg0w6f97FTkhMSYq/c=;
 b=U7K6vNPAvuWEsDVNXVsRncyoj4rYD/wYsZF5HB9V5DypPISguLYukShwKmMuYxCk5Mjt6yea
 iMDlXDqFVcPutOzda5Um3hYTYPF8qYlFduh/edS/T57xTPhEk2VDVQ4ujtdknbdyHbAkACTb
 6Vy4ouU7EQ3Rut6rcR1oM9uu4MQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e1da74d.7f84b40bf500-smtp-out-n02;
 Tue, 14 Jan 2020 11:34:37 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 41295C447A1; Tue, 14 Jan 2020 11:34:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bgodavar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 822A0C433CB;
        Tue, 14 Jan 2020 11:34:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 14 Jan 2020 17:04:35 +0530
From:   bgodavar@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        tientzu@chromium.org, seanpaul@chromium.org,
        gubbaven@codeaurora.org
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Enable clocks required for BT SOC
In-Reply-To: <20191212174348.GS228856@google.com>
References: <20191114081430.25427-1-bgodavar@codeaurora.org>
 <20191212174348.GS228856@google.com>
Message-ID: <2650b5540448295e767448ddd7662d30@codeaurora.org>
X-Sender: bgodavar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias,

sorry missed you mail.
On 2019-12-12 23:13, Matthias Kaehlcke wrote:
> On Thu, Nov 14, 2019 at 01:44:30PM +0530, Balakrishna Godavarthi wrote:
>> Instead of relying on other subsytem to turn ON clocks
>> required for BT SoC to operate, voting them from the driver.
>> 
>> Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
>> ---
>>  drivers/bluetooth/hci_qca.c | 31 +++++++++++++++++++++++++++++--
>>  1 file changed, 29 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index f10bdf8e1fc5..dc95e378574b 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -164,6 +164,7 @@ struct qca_serdev {
>>  };
>> 
>>  static int qca_regulator_enable(struct qca_serdev *qcadev);
>> +static int qca_power_on(struct qca_serdev *qcadev);
>>  static void qca_regulator_disable(struct qca_serdev *qcadev);
>>  static void qca_power_shutdown(struct hci_uart *hu);
>>  static int qca_power_off(struct hci_dev *hdev);
>> @@ -528,7 +529,7 @@ static int qca_open(struct hci_uart *hu)
>>  		} else {
>>  			hu->init_speed = qcadev->init_speed;
>>  			hu->oper_speed = qcadev->oper_speed;
>> -			ret = qca_regulator_enable(qcadev);
>> +			ret = qca_power_on(qcadev);
>>  			if (ret) {
>>  				destroy_workqueue(qca->workqueue);
>>  				kfree_skb(qca->rx_skb);
>> @@ -1214,7 +1215,7 @@ static int qca_wcn3990_init(struct hci_uart *hu)
>>  	qcadev = serdev_device_get_drvdata(hu->serdev);
>>  	if (!qcadev->bt_power->vregs_on) {
>>  		serdev_device_close(hu->serdev);
>> -		ret = qca_regulator_enable(qcadev);
>> +		ret = qca_power_on(qcadev);
>>  		if (ret)
>>  			return ret;
>> 
>> @@ -1408,6 +1409,9 @@ static void qca_power_shutdown(struct hci_uart 
>> *hu)
>>  	host_set_baudrate(hu, 2400);
>>  	qca_send_power_pulse(hu, false);
>>  	qca_regulator_disable(qcadev);
>> +
>> +	if (qcadev->susclk)
>> +		clk_disable_unprepare(qcadev->susclk);
>>  }
>> 
>>  static int qca_power_off(struct hci_dev *hdev)
>> @@ -1423,6 +1427,20 @@ static int qca_power_off(struct hci_dev *hdev)
>>  	return 0;
>>  }
>> 
>> +static int qca_power_on(struct qca_serdev *qcadev)
>> +{
>> +	int err;
>> +
>> +	if (qcadev->susclk) {
>> +		err = clk_prepare_enable(qcadev->susclk);
>> +		if (err)
>> +			return err;
>> +	}
>> +
>> +	qca_regulator_enable(qcadev);
>> +	return 0;
>> +}
>> +
>>  static int qca_regulator_enable(struct qca_serdev *qcadev)
>>  {
>>  	struct qca_power *power = qcadev->bt_power;
>> @@ -1523,6 +1541,15 @@ static int qca_serdev_probe(struct 
>> serdev_device *serdev)
>> 
>>  		qcadev->bt_power->vregs_on = false;
>> 
>> +		if (qcadev->btsoc_type == QCA_WCN3990 ||
>> +		    qcadev->btsoc_type == QCA_WCN3991) {
>> +			qcadev->susclk = devm_clk_get(&serdev->dev, NULL);
>> +			if (IS_ERR(qcadev->susclk)) {
>> +				dev_err(&serdev->dev, "failed to acquire clk\n");
>> +				return PTR_ERR(qcadev->susclk);
>> +			}
> 
> This will break existing users. Use devm_clk_get_optional() and at most
> raise a warning if the clock doesn't exist.
> 
> It would also be nice to add the clock to the affected devices in the 
> tree
> if possible:
> 
[Bala]: Sure we will use devm_clk_get_optional() in the next patch.

We will check the effected areas and update the necessary as i see some 
projects are not existing.

> arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi:
> compatible = "qcom,wcn3990-bt";
> arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi:              compatible =
> "qcom,wcn3990-bt";
> arch/arm64/boot/dts/qcom/qcs404-evb.dtsi:               compatible =
> "qcom,wcn3990-bt";
> arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:             compatible =
> "qcom,wcn3990-bt";
> arch/arm64/boot/dts/qcom/sdm845-db845c.dts:             compatible =
> "qcom,wcn3990-bt";
> arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts:
> compatible = "qcom,wcn3990-bt";
