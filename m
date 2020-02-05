Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACDE515294F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 11:38:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728238AbgBEKiG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Feb 2020 05:38:06 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:40617 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727234AbgBEKiG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 05:38:06 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580899086; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=5ilXVdiiGsHsIhZ8uHUoDTDngAhrh2sBE7trFb5Vk7s=;
 b=E1ad2mHxVrHdPF9eIi7f0BgQGKN7jFGk3aIXzLcaGJWYwC3cVvn+l0AUsPjRlP7XqpSIPyKo
 VnjcJCrnKbZQwFOdxaQTZzGPDojTw+CIgtBh7h2uYsaRIySp01Cu4HFakrZzMQUPIgyhw2hn
 aK/fRBl7FIhCLAml3fPiXMXIuVM=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3a9b06.7fd1a5f669d0-smtp-out-n01;
 Wed, 05 Feb 2020 10:37:58 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B5EC5C447A1; Wed,  5 Feb 2020 10:37:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: gubbaven)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0A903C433CB;
        Wed,  5 Feb 2020 10:37:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 05 Feb 2020 16:07:57 +0530
From:   gubbaven@codeaurora.org
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Johan Hedberg <johan.hedberg@gmail.com>, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        robh@kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        tientzu@chromium.org, seanpaul@chromium.org, rjliao@codeaurora.org,
        yshavit@google.com
Subject: Re: [PATCH v2 1/2] Bluetooth: hci_qca: Enable clocks required for BT
 SOC
In-Reply-To: <FA054FF0-C1EF-4749-96C3-A86ECD064FE9@holtmann.org>
References: <1580456335-7317-1-git-send-email-gubbaven@codeaurora.org>
 <20200203195632.GM3948@builder>
 <FA054FF0-C1EF-4749-96C3-A86ECD064FE9@holtmann.org>
Message-ID: <1ff3bfe6793972ab47675bf6b63cc596@codeaurora.org>
X-Sender: gubbaven@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 2020-02-04 14:34, Marcel Holtmann wrote:
> Hi Bjorn,
> 
>>> Instead of relying on other subsytem to turn ON clocks
>>> required for BT SoC to operate, voting them from the driver.
>>> 
>>> Signed-off-by: Venkata Lakshmi Narayana Gubba 
>>> <gubbaven@codeaurora.org>
>>> ---
>>> v2:
>>>   * addressed forward declarations
>>>   * updated with devm_clk_get_optional()
>>> 
>>> ---
>>> drivers/bluetooth/hci_qca.c | 25 +++++++++++++++++++++++++
>>> 1 file changed, 25 insertions(+)
>>> 
>>> diff --git a/drivers/bluetooth/hci_qca.c 
>>> b/drivers/bluetooth/hci_qca.c
>>> index d6e0c99..73706f3 100644
>>> --- a/drivers/bluetooth/hci_qca.c
>>> +++ b/drivers/bluetooth/hci_qca.c
>>> @@ -1738,6 +1738,15 @@ static int qca_power_off(struct hci_dev *hdev)
>>> 	return 0;
>>> }
>>> 
>>> +static int qca_setup_clock(struct clk *clk, bool enable)
>>> +{
>>> +	if (enable)
>>> +		return clk_prepare_enable(clk);
>>> +
>>> +	clk_disable_unprepare(clk);
>>> +	return 0;
>>> +}
>> 
>> As Marcel requested, inline these.
>> 
>>> +
>>> static int qca_regulator_enable(struct qca_serdev *qcadev)
>>> {
>>> 	struct qca_power *power = qcadev->bt_power;
>>> @@ -1755,6 +1764,13 @@ static int qca_regulator_enable(struct 
>>> qca_serdev *qcadev)
>>> 
>>> 	power->vregs_on = true;
>>> 
>>> +	ret = qca_setup_clock(qcadev->susclk, true);
>>> +	if (ret) {
>>> +		/* Turn off regulators to overcome power leakage */
>> 
>> You can omit this comment as well, as the name of the function you 
>> call
>> is aptly named.
[Venkata] :
We will update in next patch set.
>> 
>>> +		qca_regulator_disable(qcadev);
>>> +		return ret;
>> 
>> Just return ret below instead.
[Venkata] :
We will update in next patch set
>> 
>>> +	}
>>> +
>>> 	return 0;
>>> }
>>> 
>>> @@ -1773,6 +1789,9 @@ static void qca_regulator_disable(struct 
>>> qca_serdev *qcadev)
>>> 
>>> 	regulator_bulk_disable(power->num_vregs, power->vreg_bulk);
>>> 	power->vregs_on = false;
>>> +
>>> +	if (qcadev->susclk)
>> 
>> In the enable path you (correctly) rely on passing NULL to the clock
>> code, so do the same here.
[Venkata] :
We will update in next patch set.
> 
> I already pushed the patch, but I am happy to accept a cleanup patch.
> 
> Regards
> 
> Marcel

Regards,
Venkata.
