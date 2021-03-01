Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F32D327C60
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 11:39:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234566AbhCAKjl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 05:39:41 -0500
Received: from z11.mailgun.us ([104.130.96.11]:11411 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234638AbhCAKiq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 05:38:46 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614595095; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=UuL0BOjtDtKcRXGevI47fgBoklaY+LeRSCj/Sg93jHw=;
 b=T0bq4+Jd1EJ2KFzgAcrdk32Keo/yuxwQzYAImVyvTmr5KzJ7DtaGpEsR7MbyznpNYsPHq/aV
 xg04qCaBo7lFXlblPoCvrZ8kO2mVO0OOUML3T8091c+jOoNOL+n7XFWWljN8TgFmlMZ/MlFt
 m0eb25bIdCfQDV+CJ3RnjVZ6wQQ=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 603cc3fe75e4458f08fe03ae (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Mar 2021 10:37:50
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C48F5C43462; Mon,  1 Mar 2021 10:37:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3C913C433ED;
        Mon,  1 Mar 2021 10:37:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Mon, 01 Mar 2021 16:07:49 +0530
From:   skakit@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, kgunda@codeaurora.org
Subject: Re: [PATCH 3/7] regulator: qcom-rpmh: Correct the pmic5_hfsmps515
 buck
In-Reply-To: <CAA8EJpqN-jb3b3yHTHwrQQj_h3M-yxAvX7Hz7bNSV3_NBCJEwQ@mail.gmail.com>
References: <1614155592-14060-1-git-send-email-skakit@codeaurora.org>
 <1614155592-14060-4-git-send-email-skakit@codeaurora.org>
 <50151f4b-298c-f0ee-a88f-7bdd945ad249@linaro.org>
 <51390b828a5d534e308460098f1b9af0@codeaurora.org>
 <CAA8EJpqN-jb3b3yHTHwrQQj_h3M-yxAvX7Hz7bNSV3_NBCJEwQ@mail.gmail.com>
Message-ID: <da15c05877c345f2aeb51649c075a95c@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-26 15:57, Dmitry Baryshkov wrote:
> On Fri, 26 Feb 2021 at 09:59, <skakit@codeaurora.org> wrote:
>> 
>> Hi,
>> 
>> On 2021-02-25 16:39, Dmitry Baryshkov wrote:
>> > On 24/02/2021 11:33, satya priya wrote:
>> >> Correct the REGULATOR_LINEAR_RANGE and n_voltges for
>> >> pmic5_hfsmps515 buck.
>> >>
>> >> Signed-off-by: satya priya <skakit@codeaurora.org>
>> >> ---
>> >>   drivers/regulator/qcom-rpmh-regulator.c | 4 ++--
>> >>   1 file changed, 2 insertions(+), 2 deletions(-)
>> >>
>> >> diff --git a/drivers/regulator/qcom-rpmh-regulator.c
>> >> b/drivers/regulator/qcom-rpmh-regulator.c
>> >> index 79a554f..36542c3 100644
>> >> --- a/drivers/regulator/qcom-rpmh-regulator.c
>> >> +++ b/drivers/regulator/qcom-rpmh-regulator.c
>> >> @@ -726,8 +726,8 @@ static const struct rpmh_vreg_hw_data
>> >> pmic5_ftsmps510 = {
>> >>   static const struct rpmh_vreg_hw_data pmic5_hfsmps515 = {
>> >>      .regulator_type = VRM,
>> >>      .ops = &rpmh_regulator_vrm_ops,
>> >> -    .voltage_range = REGULATOR_LINEAR_RANGE(2800000, 0, 4, 16000),
>> >> -    .n_voltages = 5,
>> >> +    .voltage_range = REGULATOR_LINEAR_RANGE(320000, 0, 235, 16000),
>> >> +    .n_voltages = 236,
>> >
>> > I've checked the docs for pm8009, the chip which also uses hfsmps515
>> > regulators. The pdf clearly states that the 'Output voltage operating
>> > range' is from 2.8 V to 2.85 V.
>> >
>> > So we'd probably need to define different versions of HFS515 regulator
>> > data (like I had to create for pm8009-1).
>> >
>> >
>> 
>> The min-max voltages for S1C (PM8350c) regulator are 2190000-2210000uV
>> for sc7280(kodiak), so we had to modify this buck to support this
>> regulator.
>> 
>> AFAIK, this struct defines the HW constraints of a regulator, but the
>> platform specific min-max values can be controlled from DT files. So,
>> can't we modify it like above instead of adding a new definition? the
>> new min_uV value (32000) is anyway not exceeding the old value 
>> (2800000)
>> right? please correct me if wrong.
> 
> As far as I understand for other regulators we put 'output voltage
> limitations' from the docs into the regulator definition and further
> constrain it by the platform device tree. Please correct me if I'm
> wrong.

I see that for most of the regulators, these specifications are specific 
to regulator buck (like HFS515) but not chipset specific, we set the 
chipset specific(like pm8009/pm8350c) requirements from DT files.

For example:
pmic5_nldo regulator spec mentions LLIMIT= 0.32V and ULIMIT =1.304V with 
step 8mV

.voltage_range = REGULATOR_LINEAR_RANGE(320000, 0, 123, 8000),
max output voltage supported by this regulator is 123*8000 + 320000 = 
1304000mV which is same as mentioned in the regulator spec.

> For pm8009 the data from the datasheet matches the regulators defined
> in the source file. Unfortunately I don't have kodiak specs at hand.

 From the HFS515 spec I got below info
"HFS510 and lower max output voltage is limited to 2.04V max, and 
Yoda(pm8009) requirement was 2.4V for IOT PA and 2.85V for camera 
application.  Hence, HFS515 added a new register and corresponding HW 
changes to support the higher voltage.  Table 5‑24 shows the new 
FB_RANGE bit.  When configured to 0 the buck works as earlier where Vout 
max = 2.04V in 8mV steps, but when configured to 1 the buck range 
doubles and can now support a Vout max = 4.08V in 16mV steps."

As per above, the max output voltage supported by HFS515 buck is 4.08V 
(which is kodiak pm8350c pmic's requirement).
So, we have modified the buck data to support pm8350c(palani) along with 
pm8009(yoda).

Thanks,
Satya Priya
