Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9645BFFE33
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2019 07:01:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726455AbfKRGBz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 01:01:55 -0500
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188]:48848
        "EHLO a27-188.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726140AbfKRGBy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 01:01:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574056913;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=Yancb5dODX/2FNvCl/6xMdvPhXPIMMHBTGHGYXMnW+s=;
        b=hrlrNkJ3nDFj/ygJSWJeIXMjQ/5t2xnKTaEUuntC6p+tKYFsMSrukzp9TDkAcIGB
        N/l1a4k8r0u+/ZH3cAErH77XLuyMvwFSUzSRO48PIPFYTHebU9NX3o6fHyN/fG5mBY9
        9wpiYGbiyBnCUUpjUj8AH1SPu1TEeTLvIAC8x4CA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574056913;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=Yancb5dODX/2FNvCl/6xMdvPhXPIMMHBTGHGYXMnW+s=;
        b=HHCuCMCzyUv3MSyoMrOUBPvvDp2xT3K34LIoDVyz1kNv/q+tUmkC162NUFqXYqRJ
        ntUmUp1isQxpVDPsXKvHCgF4hW6j0AKGCbMtctJ6we/p3ml7rys3LUrokW8hr/ZHup0
        VDhKxGa2rs6bzFNIb0e45VJN4ILBvPc82fA7vOfE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 18 Nov 2019 06:01:53 +0000
From:   bgodavar@codeaurora.org
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, tientzu@chromium.org,
        seanpaul@chromium.org
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Enable clocks required for BT SOC
In-Reply-To: <39626995-672E-4D6A-8BD5-9E5D9272553B@holtmann.org>
References: <20191114081430.25427-1-bgodavar@codeaurora.org>
 <39626995-672E-4D6A-8BD5-9E5D9272553B@holtmann.org>
Message-ID: <0101016e7d1a6a67-d4af94cf-407a-4215-bd48-82d33990d5bb-000000@us-west-2.amazonses.com>
X-Sender: bgodavar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2019.11.18-54.240.27.188
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-11-14 14:25, Marcel Holtmann wrote:
> Hi Balakrishna,
> 
>> Instead of relying on other subsytem to turn ON clocks
>> required for BT SoC to operate, voting them from the driver.
>> 
>> Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
>> ---
>> drivers/bluetooth/hci_qca.c | 31 +++++++++++++++++++++++++++++--
>> 1 file changed, 29 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index f10bdf8e1fc5..dc95e378574b 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -164,6 +164,7 @@ struct qca_serdev {
>> };
>> 
>> static int qca_regulator_enable(struct qca_serdev *qcadev);
>> +static int qca_power_on(struct qca_serdev *qcadev);
> 
> I really dislike forward declaration. Only use them if they are really
> really needed. That said, this driver might actually need cleanups
> since I just realized it has tons of forward declarations.
> 

[Bala]: agree, will work on this change.

>> static void qca_regulator_disable(struct qca_serdev *qcadev);
>> static void qca_power_shutdown(struct hci_uart *hu);
>> static int qca_power_off(struct hci_dev *hdev);
>> @@ -528,7 +529,7 @@ static int qca_open(struct hci_uart *hu)
>> 		} else {
>> 			hu->init_speed = qcadev->init_speed;
>> 			hu->oper_speed = qcadev->oper_speed;
>> -			ret = qca_regulator_enable(qcadev);
>> +			ret = qca_power_on(qcadev);
>> 			if (ret) {
>> 				destroy_workqueue(qca->workqueue);
>> 				kfree_skb(qca->rx_skb);
>> @@ -1214,7 +1215,7 @@ static int qca_wcn3990_init(struct hci_uart *hu)
>> 	qcadev = serdev_device_get_drvdata(hu->serdev);
>> 	if (!qcadev->bt_power->vregs_on) {
>> 		serdev_device_close(hu->serdev);
>> -		ret = qca_regulator_enable(qcadev);
>> +		ret = qca_power_on(qcadev);
>> 		if (ret)
>> 			return ret;
>> 
>> @@ -1408,6 +1409,9 @@ static void qca_power_shutdown(struct hci_uart 
>> *hu)
>> 	host_set_baudrate(hu, 2400);
>> 	qca_send_power_pulse(hu, false);
>> 	qca_regulator_disable(qcadev);
>> +
>> +	if (qcadev->susclk)
>> +		clk_disable_unprepare(qcadev->susclk);
>> }
>> 
>> static int qca_power_off(struct hci_dev *hdev)
>> @@ -1423,6 +1427,20 @@ static int qca_power_off(struct hci_dev *hdev)
>> 	return 0;
>> }
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
>> static int qca_regulator_enable(struct qca_serdev *qcadev)
>> {
>> 	struct qca_power *power = qcadev->bt_power;
>> @@ -1523,6 +1541,15 @@ static int qca_serdev_probe(struct 
>> serdev_device *serdev)
>> 
>> 		qcadev->bt_power->vregs_on = false;
>> 
>> +		if (qcadev->btsoc_type == QCA_WCN3990 ||
>> +		    qcadev->btsoc_type == QCA_WCN3991) {
> 
> There comes a point when using a switch statement is a lot easier to
> read. See if that has been reached and if there are other places that
> would benefit from a cleanup patch.
> 

[Bala] : will work on this.

> Regards
> 
> Marcel
