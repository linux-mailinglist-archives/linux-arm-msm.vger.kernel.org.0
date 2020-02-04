Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D034A151753
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 10:04:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgBDJEy convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>); Tue, 4 Feb 2020 04:04:54 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:33201 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbgBDJEy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 04:04:54 -0500
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 379BFCED24;
        Tue,  4 Feb 2020 10:14:13 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH v2 1/2] Bluetooth: hci_qca: Enable clocks required for BT
 SOC
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200203195632.GM3948@builder>
Date:   Tue, 4 Feb 2020 10:04:51 +0100
Cc:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
        Johan Hedberg <johan.hedberg@gmail.com>, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        robh@kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        tientzu@chromium.org, seanpaul@chromium.org, rjliao@codeaurora.org,
        yshavit@google.com
Content-Transfer-Encoding: 8BIT
Message-Id: <FA054FF0-C1EF-4749-96C3-A86ECD064FE9@holtmann.org>
References: <1580456335-7317-1-git-send-email-gubbaven@codeaurora.org>
 <20200203195632.GM3948@builder>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

>> Instead of relying on other subsytem to turn ON clocks
>> required for BT SoC to operate, voting them from the driver.
>> 
>> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
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
> 
> As Marcel requested, inline these.
> 
>> +
>> static int qca_regulator_enable(struct qca_serdev *qcadev)
>> {
>> 	struct qca_power *power = qcadev->bt_power;
>> @@ -1755,6 +1764,13 @@ static int qca_regulator_enable(struct qca_serdev *qcadev)
>> 
>> 	power->vregs_on = true;
>> 
>> +	ret = qca_setup_clock(qcadev->susclk, true);
>> +	if (ret) {
>> +		/* Turn off regulators to overcome power leakage */
> 
> You can omit this comment as well, as the name of the function you call
> is aptly named.
> 
>> +		qca_regulator_disable(qcadev);
>> +		return ret;
> 
> Just return ret below instead.
> 
>> +	}
>> +
>> 	return 0;
>> }
>> 
>> @@ -1773,6 +1789,9 @@ static void qca_regulator_disable(struct qca_serdev *qcadev)
>> 
>> 	regulator_bulk_disable(power->num_vregs, power->vreg_bulk);
>> 	power->vregs_on = false;
>> +
>> +	if (qcadev->susclk)
> 
> In the enable path you (correctly) rely on passing NULL to the clock
> code, so do the same here.

I already pushed the patch, but I am happy to accept a cleanup patch.

Regards

Marcel

