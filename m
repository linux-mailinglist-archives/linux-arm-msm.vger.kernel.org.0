Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C69CE325DD3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 08:01:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbhBZHAM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 02:00:12 -0500
Received: from z11.mailgun.us ([104.130.96.11]:53614 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229550AbhBZHAJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 02:00:09 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614322792; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=hAhoz3D6d2Kk6jyvUqWPj14y7zKa/ypo+MS/MSezQXk=;
 b=k7LGf5VjQJ9Fyc3y/Ba6Nkq1KKPXk2zOcVOQk28Y3g374/sCrXDcxa9S4y1yvqfNH3YV4Klj
 pp/ZEWxXlxY9OwdkGoKEX7F3Ns20ndzGVB2P3CUQHFk4b3Suk2VFXGAzcpKo2aizrV0mZve2
 cchSYPpd7K0lAuVFsCvh0c2/Xe0=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60389c5bba1dc157807a59fb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Feb 2021 06:59:39
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2BF95C43463; Fri, 26 Feb 2021 06:59:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4DB2EC433CA;
        Fri, 26 Feb 2021 06:59:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 26 Feb 2021 12:29:38 +0530
From:   skakit@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, rnayak@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [PATCH 3/7] regulator: qcom-rpmh: Correct the pmic5_hfsmps515
 buck
In-Reply-To: <50151f4b-298c-f0ee-a88f-7bdd945ad249@linaro.org>
References: <1614155592-14060-1-git-send-email-skakit@codeaurora.org>
 <1614155592-14060-4-git-send-email-skakit@codeaurora.org>
 <50151f4b-298c-f0ee-a88f-7bdd945ad249@linaro.org>
Message-ID: <51390b828a5d534e308460098f1b9af0@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 2021-02-25 16:39, Dmitry Baryshkov wrote:
> On 24/02/2021 11:33, satya priya wrote:
>> Correct the REGULATOR_LINEAR_RANGE and n_voltges for
>> pmic5_hfsmps515 buck.
>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> ---
>>   drivers/regulator/qcom-rpmh-regulator.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/regulator/qcom-rpmh-regulator.c 
>> b/drivers/regulator/qcom-rpmh-regulator.c
>> index 79a554f..36542c3 100644
>> --- a/drivers/regulator/qcom-rpmh-regulator.c
>> +++ b/drivers/regulator/qcom-rpmh-regulator.c
>> @@ -726,8 +726,8 @@ static const struct rpmh_vreg_hw_data 
>> pmic5_ftsmps510 = {
>>   static const struct rpmh_vreg_hw_data pmic5_hfsmps515 = {
>>   	.regulator_type = VRM,
>>   	.ops = &rpmh_regulator_vrm_ops,
>> -	.voltage_range = REGULATOR_LINEAR_RANGE(2800000, 0, 4, 16000),
>> -	.n_voltages = 5,
>> +	.voltage_range = REGULATOR_LINEAR_RANGE(320000, 0, 235, 16000),
>> +	.n_voltages = 236,
> 
> I've checked the docs for pm8009, the chip which also uses hfsmps515
> regulators. The pdf clearly states that the 'Output voltage operating
> range' is from 2.8 V to 2.85 V.
> 
> So we'd probably need to define different versions of HFS515 regulator
> data (like I had to create for pm8009-1).
> 
> 

The min-max voltages for S1C (PM8350c) regulator are 2190000-2210000uV 
for sc7280(kodiak), so we had to modify this buck to support this 
regulator.

AFAIK, this struct defines the HW constraints of a regulator, but the 
platform specific min-max values can be controlled from DT files. So, 
can't we modify it like above instead of adding a new definition? the 
new min_uV value (32000) is anyway not exceeding the old value (2800000) 
right? please correct me if wrong.

>>   	.pmic_mode_map = pmic_mode_map_pmic5_smps,
>>   	.of_map_mode = rpmh_regulator_pmic4_smps_of_map_mode,
>>   };
>> 

Thanks,
Satya Priya
