Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B175DE4A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 08:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbfJUGhS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 02:37:18 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:50228 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbfJUGhS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 02:37:18 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id D048860615; Mon, 21 Oct 2019 06:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571639836;
        bh=2vIcvW5geZwE7c5DDapmfwvV6vh9/TkLfY1Sx4zMLV8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=aFJEphDoAi0Z+DTztFIGNOiaxbabvkF+YFNlY2PiCCwGPtJCHVb/3xOFBFL17FebK
         fBLjqFEQJLNYvpF0Dq+yweNTEw024RBis5BWHwUQ8I0E4bUXnjx2k4v4pcbcTUx3sH
         q+oSNdNI3nd21briSH5qLs1NNAuvTkPq2XER93ug=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 6DD8C60615;
        Mon, 21 Oct 2019 06:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571639835;
        bh=2vIcvW5geZwE7c5DDapmfwvV6vh9/TkLfY1Sx4zMLV8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DYKB6iI3sNz6j7LBcwsaTnf8FCM+oDegeqf5MeFk4qk42fhnKKNS6rKZu9J/eLd5p
         MopQOPDo1YkdXXejoyy8xDiyFeElpYwIdsEBG0xPvdRhWkLLfKJqFJDjJi6qi99I6/
         4clfRCxDN2NxegTaAZfVbB8iRz92ldP06d/Kcvjo=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 21 Oct 2019 12:07:15 +0530
From:   Harish Bandi <c-hbandi@codeaurora.org>
To:     Matthias Kaehlcke <mka@chromium.org>,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        linux-bluetooth-owner@vger.kernel.org
Subject: Re: [PATCH 2/4] Bluetooth: hci_qca: Don't vote for specific voltage
In-Reply-To: <20191018182205.GA20212@google.com>
References: <20191018052405.3693555-1-bjorn.andersson@linaro.org>
 <20191018052405.3693555-3-bjorn.andersson@linaro.org>
 <20191018182205.GA20212@google.com>
Message-ID: <7f9a4de91f364a5f8ce707c8d8a2344d@codeaurora.org>
X-Sender: c-hbandi@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ Bala

On 2019-10-18 23:52, Matthias Kaehlcke wrote:
> On Thu, Oct 17, 2019 at 10:24:02PM -0700, Bjorn Andersson wrote:
>> Devices with specific voltage requirements should not request voltage
>> from the driver, but instead rely on the system configuration to 
>> define
>> appropriate voltages for each rail.
>> 
>> This ensures that PMIC and board variations are accounted for, 
>> something
>> that the 0.1V range in the hci_qca driver currently tries to address.
>> But on the Lenovo Yoga C630 (with wcn3990) vddch0 is 3.1V, which means
>> the driver will fail to set the voltage.
>> 
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> ---
>>  drivers/bluetooth/hci_qca.c | 26 ++++++++------------------
>>  1 file changed, 8 insertions(+), 18 deletions(-)
>> 
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index c07c529b0d81..54aafcc69d06 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -130,8 +130,6 @@ enum qca_speed_type {
>>   */
>>  struct qca_vreg {
>>  	const char *name;
>> -	unsigned int min_uV;
>> -	unsigned int max_uV;
>>  	unsigned int load_uA;
>>  };
>> 
>> @@ -1332,10 +1330,10 @@ static const struct hci_uart_proto qca_proto = 
>> {
>>  static const struct qca_vreg_data qca_soc_data_wcn3990 = {
>>  	.soc_type = QCA_WCN3990,
>>  	.vregs = (struct qca_vreg []) {
>> -		{ "vddio",   1800000, 1900000,  15000  },
>> -		{ "vddxo",   1800000, 1900000,  80000  },
>> -		{ "vddrf",   1300000, 1350000,  300000 },
>> -		{ "vddch0",  3300000, 3400000,  450000 },
>> +		{ "vddio", 15000  },
>> +		{ "vddxo", 80000  },
>> +		{ "vddrf", 300000 },
>> +		{ "vddch0", 450000 },
>>  	},
>>  	.num_vregs = 4,
>>  };
>> @@ -1343,10 +1341,10 @@ static const struct qca_vreg_data 
>> qca_soc_data_wcn3990 = {
>>  static const struct qca_vreg_data qca_soc_data_wcn3998 = {
>>  	.soc_type = QCA_WCN3998,
>>  	.vregs = (struct qca_vreg []) {
>> -		{ "vddio",   1800000, 1900000,  10000  },
>> -		{ "vddxo",   1800000, 1900000,  80000  },
>> -		{ "vddrf",   1300000, 1352000,  300000 },
>> -		{ "vddch0",  3300000, 3300000,  450000 },
>> +		{ "vddio", 10000  },
>> +		{ "vddxo", 80000  },
>> +		{ "vddrf", 300000 },
>> +		{ "vddch0", 450000 },
>>  	},
>>  	.num_vregs = 4,
>>  };
>> @@ -1386,13 +1384,6 @@ static int qca_power_off(struct hci_dev *hdev)
>>  static int qca_enable_regulator(struct qca_vreg vregs,
>>  				struct regulator *regulator)
>>  {
>> -	int ret;
>> -
>> -	ret = regulator_set_voltage(regulator, vregs.min_uV,
>> -				    vregs.max_uV);
>> -	if (ret)
>> -		return ret;
>> -
>>  	return regulator_enable(regulator);
>> 
>>  }
>> @@ -1401,7 +1392,6 @@ static void qca_disable_regulator(struct 
>> qca_vreg vregs,
>>  				  struct regulator *regulator)
>>  {
>>  	regulator_disable(regulator);
>> -	regulator_set_voltage(regulator, 0, vregs.max_uV);
>> 
>>  }
> 
> This was brought up multiple times during the initial review, but
> wasn't addressed.
> 
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
