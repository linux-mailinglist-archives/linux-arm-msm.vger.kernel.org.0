Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A58914F2F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2020 20:51:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbgAaTvg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 14:51:36 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:44735 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbgAaTvg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 14:51:36 -0500
Received: from marcel-macpro.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id ECE1CCECE8;
        Fri, 31 Jan 2020 21:00:54 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH v2 1/2] Bluetooth: hci_qca: Enable clocks required for BT
 SOC
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <1580456335-7317-1-git-send-email-gubbaven@codeaurora.org>
Date:   Fri, 31 Jan 2020 20:51:33 +0100
Cc:     Johan Hedberg <johan.hedberg@gmail.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        robh@kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        tientzu@chromium.org, seanpaul@chromium.org, rjliao@codeaurora.org,
        yshavit@google.com
Content-Transfer-Encoding: 8BIT
Message-Id: <543135AD-707A-4945-A67D-8912D1C35EED@holtmann.org>
References: <1580456335-7317-1-git-send-email-gubbaven@codeaurora.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Venkata,

> Instead of relying on other subsytem to turn ON clocks
> required for BT SoC to operate, voting them from the driver.
> 
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
> v2:
>   * addressed forward declarations
>   * updated with devm_clk_get_optional()
> 
> ---
> drivers/bluetooth/hci_qca.c | 25 +++++++++++++++++++++++++
> 1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index d6e0c99..73706f3 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1738,6 +1738,15 @@ static int qca_power_off(struct hci_dev *hdev)
> 	return 0;
> }
> 
> +static int qca_setup_clock(struct clk *clk, bool enable)
> +{
> +	if (enable)
> +		return clk_prepare_enable(clk);
> +
> +	clk_disable_unprepare(clk);
> +	return 0;
> +}
> +

this function is pointless and it just complicated the code.

> static int qca_regulator_enable(struct qca_serdev *qcadev)
> {
> 	struct qca_power *power = qcadev->bt_power;
> @@ -1755,6 +1764,13 @@ static int qca_regulator_enable(struct qca_serdev *qcadev)
> 
> 	power->vregs_on = true;
> 
> +	ret = qca_setup_clock(qcadev->susclk, true);

	ret = clk_prepare_enable(qcadev->susclk);

> +	if (ret) {
> +		/* Turn off regulators to overcome power leakage */
> +		qca_regulator_disable(qcadev);
> +		return ret;
> +	}
> +
> 	return 0;
> }
> 
> @@ -1773,6 +1789,9 @@ static void qca_regulator_disable(struct qca_serdev *qcadev)
> 
> 	regulator_bulk_disable(power->num_vregs, power->vreg_bulk);
> 	power->vregs_on = false;
> +
> +	if (qcadev->susclk)
> +		qca_setup_clock(qcadev->susclk, false);

		clk_disable_unprepare(qcadev->susclk);

> }
> 
> static int qca_init_regulators(struct qca_power *qca,
> @@ -1839,6 +1858,12 @@ static int qca_serdev_probe(struct serdev_device *serdev)
> 
> 		qcadev->bt_power->vregs_on = false;
> 
> +		qcadev->susclk = devm_clk_get_optional(&serdev->dev, NULL);
> +		if (IS_ERR(qcadev->susclk)) {
> +			dev_err(&serdev->dev, "failed to acquire clk\n");
> +			return PTR_ERR(qcadev->susclk);
> +		}
> +
> 		device_property_read_u32(&serdev->dev, "max-speed",
> 					 &qcadev->oper_speed);
> 		if (!qcadev->oper_speed)

Regards

Marcel

