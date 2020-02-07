Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 435CA155239
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 07:00:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbgBGGAB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 01:00:01 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:17315 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726465AbgBGGAB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 01:00:01 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581055200; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Cvsmt9NHILAzsxmzsgrZWHIeOG+f+RWMg2h39UBzKFE=;
 b=tFWC64mmL0TGcba6AcPepSoB7KMKT8aEr4IFqgEGl3Id7tXJkrpbelMXYVcoTppOKZmhMbau
 D5tpIk1QGjgmP23mQKi/mIFaknQHTQlqkeNg0UTKU2D/ASIALsEX4+2ve2UuGz/hH5JE/ATw
 GAISx3cTDMocaRXRLSzHjv7ghqE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3cfcdf.7fc587bd5a40-smtp-out-n03;
 Fri, 07 Feb 2020 05:59:59 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2B150C447A1; Fri,  7 Feb 2020 05:59:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 74D5AC433CB;
        Fri,  7 Feb 2020 05:59:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 07 Feb 2020 11:29:57 +0530
From:   kgunda@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        rnayak@codeaurora.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH V3 2/2] mfd: qcom-spmi-pmic: Add support for pm6150 and
 pm6150l
In-Reply-To: <5e3c6415.1c69fb81.11c79.08a6@mx.google.com>
References: <1580997328-16365-1-git-send-email-kgunda@codeaurora.org>
 <1580997328-16365-2-git-send-email-kgunda@codeaurora.org>
 <5e3c6415.1c69fb81.11c79.08a6@mx.google.com>
Message-ID: <669031087ca86616c6644b67961697b6@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-02-07 00:38, Stephen Boyd wrote:
> Quoting Kiran Gunda (2020-02-06 05:55:27)
>> Add the compatibles and PMIC ids for pm6150 and pm6150l PMICs
>> found on SC7180 based platforms
>> 
>> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 2 ++
>>  drivers/mfd/qcom-spmi-pmic.c                              | 4 ++++
>>  2 files changed, 6 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml 
>> b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> index affc169..36f0795 100644
>> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>> @@ -46,6 +46,8 @@ properties:
>>        - qcom,pm8998
>>        - qcom,pmi8998
>>        - qcom,pm8005
>> +      - qcom,pm6150
>> +      - qcom,pm6150l
>>        - qcom,spmi-pmic
> 
> Maybe the yaml binding needs to say this is sorted in subtype id in a
> comment.
> 
> 	# Sorted based on subtype ID the device reports
> 
Ok.. I will add it in next post.
> Or we should sort this list in the binding and sort the compatible
> string table in the driver with a comment that it's sorted based on
> subtype id.
> 
>> 
>>    reg:
>> diff --git a/drivers/mfd/qcom-spmi-pmic.c 
>> b/drivers/mfd/qcom-spmi-pmic.c
>> index 1df1a27..5bfeec8 100644
>> --- a/drivers/mfd/qcom-spmi-pmic.c
>> +++ b/drivers/mfd/qcom-spmi-pmic.c
>> @@ -36,6 +36,8 @@
>>  #define PM8998_SUBTYPE         0x14
>>  #define PMI8998_SUBTYPE                0x15
>>  #define PM8005_SUBTYPE         0x18
>> +#define PM6150L_SUBTYPE                0x1F
>> +#define PM6150_SUBTYPE         0x28
>> 
>>  static const struct of_device_id pmic_spmi_id_table[] = {
>>         { .compatible = "qcom,spmi-pmic", .data = (void 
>> *)COMMON_SUBTYPE },
>> @@ -57,6 +59,8 @@ static const struct of_device_id 
>> pmic_spmi_id_table[] = {
>>         { .compatible = "qcom,pm8998",    .data = (void 
>> *)PM8998_SUBTYPE },
>>         { .compatible = "qcom,pmi8998",   .data = (void 
>> *)PMI8998_SUBTYPE },
>>         { .compatible = "qcom,pm8005",    .data = (void 
>> *)PM8005_SUBTYPE },
>> +       { .compatible = "qcom,pm6150l",   .data = (void 
>> *)PM6150L_SUBTYPE },
>> +       { .compatible = "qcom,pm6150",    .data = (void 
>> *)PM6150_SUBTYPE },
>>         { }
>>  };
