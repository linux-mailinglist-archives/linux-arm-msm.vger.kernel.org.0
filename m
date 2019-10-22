Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B7F6DFD7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2019 08:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729146AbfJVGFp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Oct 2019 02:05:45 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:42800 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbfJVGFp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Oct 2019 02:05:45 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 42CFB6079C; Tue, 22 Oct 2019 06:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571724344;
        bh=cY8sxLPZP4vsxpJajBId/YF2IaHEql2Vk2+ldt9E2fU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nfEx9uo1O1xSaTXuWcoK6t5ju6WT/+pvadG+v2eS/U3MfhLX13srdYUx/1I37J7WK
         k5VL4kA4kLjXmvb3dvJMEoAtu7z13VHQYfJzGPsv3KtVXqbbt7VK6Zqo5r+wVJqb/b
         pFulOVd8CwoUJV/4tIRTEqoHjEVeKapn/0dDPHsM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 2357960614;
        Tue, 22 Oct 2019 06:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571724343;
        bh=cY8sxLPZP4vsxpJajBId/YF2IaHEql2Vk2+ldt9E2fU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=fjydRdeXHA1xaIJwtrdGYONDeonhkM77FMoHhORPsVd7Rjra+fBoVB2ieBsewZ5fq
         z9QJ1V6Nl3lytIgUJJhpQb5W8lzCBNdTOUx+zgdWv/qjmcT5jXZWpwYVdpgTnTlEcq
         YJxjxuDX40mtlCRkl7T+L3HqCeCkVnBBAhq2+1ig=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 22 Oct 2019 11:35:43 +0530
From:   Balakrishna Godavarthi <bgodavar@codeaurora.org>
To:     Matthias Kaehlcke <mka@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        linux-bluetooth-owner@vger.kernel.org, hemantg@codeaurora.org,
        Harish Bandi <c-hbandi@codeaurora.org>
Subject: Re: [PATCH 2/4] Bluetooth: hci_qca: Don't vote for specific voltage
In-Reply-To: <7f9a4de91f364a5f8ce707c8d8a2344d@codeaurora.org>
References: <20191018052405.3693555-1-bjorn.andersson@linaro.org>
 <20191018052405.3693555-3-bjorn.andersson@linaro.org>
 <20191018182205.GA20212@google.com>
 <7f9a4de91f364a5f8ce707c8d8a2344d@codeaurora.org>
Message-ID: <5bbd8e5bbd832ecdafc7c2d603f10c6c@codeaurora.org>
X-Sender: bgodavar@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias, Bjorn andresson,

On 2019-10-21 12:07, Harish Bandi wrote:
> + Bala
> 
> On 2019-10-18 23:52, Matthias Kaehlcke wrote:
>> On Thu, Oct 17, 2019 at 10:24:02PM -0700, Bjorn Andersson wrote:
>>> Devices with specific voltage requirements should not request voltage
>>> from the driver, but instead rely on the system configuration to 
>>> define
>>> appropriate voltages for each rail.
>>> 
>>> This ensures that PMIC and board variations are accounted for, 
>>> something
>>> that the 0.1V range in the hci_qca driver currently tries to address.
>>> But on the Lenovo Yoga C630 (with wcn3990) vddch0 is 3.1V, which 
>>> means
>>> the driver will fail to set the voltage.
>>> 
>>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>> ---
>>>  drivers/bluetooth/hci_qca.c | 26 ++++++++------------------
>>>  1 file changed, 8 insertions(+), 18 deletions(-)
>>> 
>>> diff --git a/drivers/bluetooth/hci_qca.c 
>>> b/drivers/bluetooth/hci_qca.c
>>> index c07c529b0d81..54aafcc69d06 100644
>>> --- a/drivers/bluetooth/hci_qca.c
>>> +++ b/drivers/bluetooth/hci_qca.c
>>> @@ -130,8 +130,6 @@ enum qca_speed_type {
>>>   */
>>>  struct qca_vreg {
>>>  	const char *name;
>>> -	unsigned int min_uV;
>>> -	unsigned int max_uV;
>>>  	unsigned int load_uA;
>>>  };
>>> 
>>> @@ -1332,10 +1330,10 @@ static const struct hci_uart_proto qca_proto 
>>> = {
>>>  static const struct qca_vreg_data qca_soc_data_wcn3990 = {
>>>  	.soc_type = QCA_WCN3990,
>>>  	.vregs = (struct qca_vreg []) {
>>> -		{ "vddio",   1800000, 1900000,  15000  },
>>> -		{ "vddxo",   1800000, 1900000,  80000  },
>>> -		{ "vddrf",   1300000, 1350000,  300000 },
>>> -		{ "vddch0",  3300000, 3400000,  450000 },
>>> +		{ "vddio", 15000  },
>>> +		{ "vddxo", 80000  },
>>> +		{ "vddrf", 300000 },
>>> +		{ "vddch0", 450000 },
>>>  	},
>>>  	.num_vregs = 4,
>>>  };
>>> @@ -1343,10 +1341,10 @@ static const struct qca_vreg_data 
>>> qca_soc_data_wcn3990 = {
>>>  static const struct qca_vreg_data qca_soc_data_wcn3998 = {
>>>  	.soc_type = QCA_WCN3998,
>>>  	.vregs = (struct qca_vreg []) {
>>> -		{ "vddio",   1800000, 1900000,  10000  },
>>> -		{ "vddxo",   1800000, 1900000,  80000  },
>>> -		{ "vddrf",   1300000, 1352000,  300000 },
>>> -		{ "vddch0",  3300000, 3300000,  450000 },
>>> +		{ "vddio", 10000  },
>>> +		{ "vddxo", 80000  },
>>> +		{ "vddrf", 300000 },
>>> +		{ "vddch0", 450000 },
>>>  	},
>>>  	.num_vregs = 4,
>>>  };
>>> @@ -1386,13 +1384,6 @@ static int qca_power_off(struct hci_dev *hdev)
>>>  static int qca_enable_regulator(struct qca_vreg vregs,
>>>  				struct regulator *regulator)
>>>  {
>>> -	int ret;
>>> -
>>> -	ret = regulator_set_voltage(regulator, vregs.min_uV,
>>> -				    vregs.max_uV);
>>> -	if (ret)
>>> -		return ret;
>>> -
>>>  	return regulator_enable(regulator);
>>> 
>>>  }
>>> @@ -1401,7 +1392,6 @@ static void qca_disable_regulator(struct 
>>> qca_vreg vregs,
>>>  				  struct regulator *regulator)
>>>  {
>>>  	regulator_disable(regulator);
>>> -	regulator_set_voltage(regulator, 0, vregs.max_uV);
>>> 
>>>  }
>> 
>> This was brought up multiple times during the initial review, but
>> wasn't addressed.
>> 
>> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>


yes true PMIC dts regulator should do this.
But we have some real time issues observed.

Issue 1:

In PMIC dts node, ASAIK we have three levels of voltages.

1. Default voltage.
2. Minimum voltage. (mandatory entry)
3. Maximum voltage. (mandatory entry)

Let us assume that the if PMIC regulator dts node supports  defaults 
voltage to 3.2 Volts and Min  as 3.1 V and max as 3.3V
So default operating voltage is 3.1V  when we turn on BT (but according 
to spec SoC requires min of 3.3V to operate,
Might have some functionality failures on end to end testing

Issue 2:

WCN3990 RF is shared with WiFi, so it also try to turn on the 
regulators. Wifi driver uses the same approach of restricting to min and 
max voltages in driver.
Let us assume we turned ON BT and CH0 is set to 3.1v (as in your case), 
Wifi is tuned on now, as its request the CH0 to operate at 3.3 Volts, 
regulator will fail to set this voltage as BT is operating
at CH0 3.1v (assuming max voltage is 3.2v)
https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git/tree/drivers/net/wireless/ath/ath10k/snoc.c#n39

Issue 3:

By mistake PMIC has low min or default voltage and high max voltages, 
that is harm for WNC3990.

I would suggest to restrict the min and max voltages in driver, instead 
of relaying on PMIC to do this.
BTW pmic will do this and doing it in our driver is safer.

Let me know your views on this.
-- 
Regards
Balakrishna.
