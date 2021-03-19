Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E187E3416FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Mar 2021 08:58:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233993AbhCSH5z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Mar 2021 03:57:55 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:45303 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234082AbhCSH5i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Mar 2021 03:57:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616140658; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=zTtVE4UELiIUK/7N7IxA0XTHBceDWZcQFMbG5n3Nyqw=;
 b=g8t5YQ/PKmWaGM4cCfL29atULhP1XPTT38JDmZSM/46EHXSqRqLO1DyCPsBE0KRhiYOduibQ
 v1IQCiBgGyO7wkJzvii7ia5U99exrwivgq1ZQqYtHY9msDyEW7EXGrycsm0cg4VsdMTC3jlC
 Aq2qp6lf6QQvqVFWJi1p47pmSaM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6054596d5d70193f8849fc00 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Mar 2021 07:57:33
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 741D8C43464; Fri, 19 Mar 2021 07:57:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 68FF8C433C6;
        Fri, 19 Mar 2021 07:57:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 19 Mar 2021 13:27:32 +0530
From:   skakit@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, rnayak@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org,
        David Collins <collinsd@codeaurora.org>
Subject: Re: [PATCH V2 2/5] regulator: qcom-rpmh: Add PM7325/PMR735A regulator
 support
In-Reply-To: <YFEMezCRjK2W6THZ@google.com>
References: <1615816454-1733-1-git-send-email-skakit@codeaurora.org>
 <1615816454-1733-3-git-send-email-skakit@codeaurora.org>
 <YFEMezCRjK2W6THZ@google.com>
Message-ID: <bdd081f3ec5df5f6ecb2a4c4d826778b@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias,

Thanks for reviewing the patches!

On 2021-03-17 01:22, Matthias Kaehlcke wrote:
> On Mon, Mar 15, 2021 at 07:24:11PM +0530, satya priya wrote:
>> Add support for PM7325/PMR735A regulators. This ensures
>> that consumers are able to modify the physical state of PMIC
>> regulators.
>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> ---
>> Changes in V2:
>>  - No change.
>> 
>>  drivers/regulator/qcom-rpmh-regulator.c | 53 
>> ++++++++++++++++++++++++++++++++-
>>  1 file changed, 52 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/regulator/qcom-rpmh-regulator.c 
>> b/drivers/regulator/qcom-rpmh-regulator.c
>> index 9471890..3509523 100644
>> --- a/drivers/regulator/qcom-rpmh-regulator.c
>> +++ b/drivers/regulator/qcom-rpmh-regulator.c
>> @@ -1,5 +1,5 @@
>>  // SPDX-License-Identifier: GPL-2.0
>> -// Copyright (c) 2018-2019, The Linux Foundation. All rights 
>> reserved.
>> +// Copyright (c) 2018-2021, The Linux Foundation. All rights 
>> reserved.
>> 
>>  #define pr_fmt(fmt) "%s: " fmt, __func__
>> 
>> @@ -1042,6 +1042,49 @@ static const struct rpmh_vreg_init_data 
>> pmx55_vreg_data[] = {
>>  	{},
>>  };
>> 
>> +static const struct rpmh_vreg_init_data pm7325_vreg_data[] = {
>> +	RPMH_VREG("smps1",  "smp%s1",  &pmic5_hfsmps510, "vdd-s1"),
>> +	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps520, "vdd-s2"),
>> +	RPMH_VREG("smps3",  "smp%s3",  &pmic5_ftsmps520, "vdd-s3"),
>> +	RPMH_VREG("smps4",  "smp%s4",  &pmic5_ftsmps520, "vdd-s4"),
>> +	RPMH_VREG("smps5",  "smp%s5",  &pmic5_ftsmps520, "vdd-s5"),
>> +	RPMH_VREG("smps6",  "smp%s6",  &pmic5_ftsmps520, "vdd-s6"),
>> +	RPMH_VREG("smps7",  "smp%s7",  &pmic5_ftsmps520, "vdd-s7"),
>> +	RPMH_VREG("smps8",  "smp%s8",  &pmic5_hfsmps510, "vdd-s8"),
>> +	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo,      
>> "vdd-l1-l4-l12-l15"),
>> +	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_pldo,      "vdd-l2-l7"),
>> +	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo,      "vdd-l3"),
>> +	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_nldo,      
>> "vdd-l1-l4-l12-l15"),
>> +	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_nldo,      "vdd-l5"),
>> +	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_nldo,      "vdd-l6-l9-l10"),
>> +	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo,      "vdd-l2-l7"),
>> +	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_nldo,      "vdd-l8"),
>> +	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_nldo,      "vdd-l6-l9-l10"),
>> +	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_nldo,      "vdd-l6-l9-l10"),
>> +	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_pldo_lv,   
>> "vdd-l11-l17-l18-l19"),
>> +	RPMH_VREG("ldo12",  "ldo%s12", &pmic5_nldo,      
>> "vdd-l1-l4-l12-l15"),
>> +	RPMH_VREG("ldo13",  "ldo%s13", &pmic5_nldo,      "vdd-l13"),
>> +	RPMH_VREG("ldo14",  "ldo%s14", &pmic5_nldo,      "vdd-l14-l16"),
>> +	RPMH_VREG("ldo15",  "ldo%s15", &pmic5_nldo,      
>> "vdd-l1-l4-l12-l15"),
>> +	RPMH_VREG("ldo16",  "ldo%s16", &pmic5_nldo,      "vdd-l14-l16"),
>> +	RPMH_VREG("ldo17",  "ldo%s17", &pmic5_pldo_lv,   
>> "vdd-l11-l17-l18-l19"),
>> +	RPMH_VREG("ldo18",  "ldo%s18", &pmic5_pldo_lv,   
>> "vdd-l11-l17-l18-l19"),
>> +	RPMH_VREG("ldo19",  "ldo%s19", &pmic5_pldo_lv,   
>> "vdd-l11-l17-l18-l19"),
>> +};
> 
> Could you help me understand these funky supply names? I see other RPMh
> regulators also have them, so they are probably totally fine, but it
> isn't clear to me what exactly the names represent. Apparently the LDO
> itself is in the supply name, but many LDOs also list others.

These supply names are taken from powergrid. They are basically the 
parent supply names.
For example ldo2 and ldo7 have the parent supply vdd-l2-l7. Hence we 
gave supply name vdd-l2-l7 for these 2 regulators.

Thanks,
Satya Priya
