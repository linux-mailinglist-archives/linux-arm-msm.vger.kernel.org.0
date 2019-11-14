Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF88FC1F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2019 09:55:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbfKNIzn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Nov 2019 03:55:43 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:52882 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbfKNIzn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Nov 2019 03:55:43 -0500
Received: from marcel-macpro.fritz.box (p4FF9F0D1.dip0.t-ipconnect.de [79.249.240.209])
        by mail.holtmann.org (Postfix) with ESMTPSA id 42657CED07;
        Thu, 14 Nov 2019 10:04:47 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Enable clocks required for BT SOC
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20191114081430.25427-1-bgodavar@codeaurora.org>
Date:   Thu, 14 Nov 2019 09:55:41 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        lkml <linux-kernel@vger.kernel.org>,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, tientzu@chromium.org,
        seanpaul@chromium.org
Content-Transfer-Encoding: 8BIT
Message-Id: <39626995-672E-4D6A-8BD5-9E5D9272553B@holtmann.org>
References: <20191114081430.25427-1-bgodavar@codeaurora.org>
To:     Balakrishna Godavarthi <bgodavar@codeaurora.org>
X-Mailer: Apple Mail (2.3601.0.10)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Balakrishna,

> Instead of relying on other subsytem to turn ON clocks
> required for BT SoC to operate, voting them from the driver.
> 
> Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
> ---
> drivers/bluetooth/hci_qca.c | 31 +++++++++++++++++++++++++++++--
> 1 file changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index f10bdf8e1fc5..dc95e378574b 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -164,6 +164,7 @@ struct qca_serdev {
> };
> 
> static int qca_regulator_enable(struct qca_serdev *qcadev);
> +static int qca_power_on(struct qca_serdev *qcadev);

I really dislike forward declaration. Only use them if they are really really needed. That said, this driver might actually need cleanups since I just realized it has tons of forward declarations.

> static void qca_regulator_disable(struct qca_serdev *qcadev);
> static void qca_power_shutdown(struct hci_uart *hu);
> static int qca_power_off(struct hci_dev *hdev);
> @@ -528,7 +529,7 @@ static int qca_open(struct hci_uart *hu)
> 		} else {
> 			hu->init_speed = qcadev->init_speed;
> 			hu->oper_speed = qcadev->oper_speed;
> -			ret = qca_regulator_enable(qcadev);
> +			ret = qca_power_on(qcadev);
> 			if (ret) {
> 				destroy_workqueue(qca->workqueue);
> 				kfree_skb(qca->rx_skb);
> @@ -1214,7 +1215,7 @@ static int qca_wcn3990_init(struct hci_uart *hu)
> 	qcadev = serdev_device_get_drvdata(hu->serdev);
> 	if (!qcadev->bt_power->vregs_on) {
> 		serdev_device_close(hu->serdev);
> -		ret = qca_regulator_enable(qcadev);
> +		ret = qca_power_on(qcadev);
> 		if (ret)
> 			return ret;
> 
> @@ -1408,6 +1409,9 @@ static void qca_power_shutdown(struct hci_uart *hu)
> 	host_set_baudrate(hu, 2400);
> 	qca_send_power_pulse(hu, false);
> 	qca_regulator_disable(qcadev);
> +
> +	if (qcadev->susclk)
> +		clk_disable_unprepare(qcadev->susclk);
> }
> 
> static int qca_power_off(struct hci_dev *hdev)
> @@ -1423,6 +1427,20 @@ static int qca_power_off(struct hci_dev *hdev)
> 	return 0;
> }
> 
> +static int qca_power_on(struct qca_serdev *qcadev)
> +{
> +	int err;
> +
> +	if (qcadev->susclk) {
> +		err = clk_prepare_enable(qcadev->susclk);
> +		if (err)
> +			return err;
> +	}
> +
> +	qca_regulator_enable(qcadev);
> +	return 0;
> +}
> +
> static int qca_regulator_enable(struct qca_serdev *qcadev)
> {
> 	struct qca_power *power = qcadev->bt_power;
> @@ -1523,6 +1541,15 @@ static int qca_serdev_probe(struct serdev_device *serdev)
> 
> 		qcadev->bt_power->vregs_on = false;
> 
> +		if (qcadev->btsoc_type == QCA_WCN3990 ||
> +		    qcadev->btsoc_type == QCA_WCN3991) {

There comes a point when using a switch statement is a lot easier to read. See if that has been reached and if there are other places that would benefit from a cleanup patch.

Regards

Marcel

