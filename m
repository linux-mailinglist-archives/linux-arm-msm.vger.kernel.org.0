Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 061CFF6E77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2019 07:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbfKKGOI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Nov 2019 01:14:08 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:46524 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbfKKGOH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Nov 2019 01:14:07 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 50BE8609EF; Mon, 11 Nov 2019 06:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573452846;
        bh=I8UqTvymT7Y0417tUmtAztkA40mQvmH3geek+CovnWc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=LDSRVX8rsXLgxV+lNF+YeDY4+WZDxAboQO9bxsy9FlxAl/4b0+NJAq7Ayshns01Eh
         LN7C5AMDO3nbOWwCtv0Mte6ezb9eb0BiwAouUQshunEEsAkRfm06EkJBZXehGcq59h
         4/9wt4qRrzkDhlpH1m7ylS7heebtv2sS/UDhHbyw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 994ED60913;
        Mon, 11 Nov 2019 06:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573452845;
        bh=I8UqTvymT7Y0417tUmtAztkA40mQvmH3geek+CovnWc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=WFpcJ/4m05Gm9BrpEhAzwq6qEEXYBwsD/5NDWSaAqiG5xAj6FgMwlTxpPY2uzMz2r
         30i68EoDIEdfAzK7xoNsWUouagGf4zKOyAEFzoVLZ/yomgjBXSWBgI2QCOnQIllYwT
         ffnE7Kg2bbN9smKILV9irpK3/jQ3vuaUWIGD3Ezo=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 11 Nov 2019 11:44:04 +0530
From:   kgunda@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        lee.jones@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        rnayak@codeaurora.org
Subject: Re: [PATCH V2] mfd: qcom-spmi-pmic: Add support for pm6150 and
 pm6150l
In-Reply-To: <5dc2f6fb.1c69fb81.195ac.9fff@mx.google.com>
References: <1572931309-16250-1-git-send-email-kgunda@codeaurora.org>
 <5dc2f6fb.1c69fb81.195ac.9fff@mx.google.com>
Message-ID: <bd06260d75cae2044b99751561e3df84@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-11-06 22:08, Stephen Boyd wrote:
> Quoting Kiran Gunda (2019-11-04 21:21:49)
>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt 
>> b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
>> index 1437062..b5fc64e 100644
>> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
>> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt
>> @@ -32,6 +32,8 @@ Required properties:
>>                     "qcom,pm8998",
>>                     "qcom,pmi8998",
>>                     "qcom,pm8005",
>> +                  "qcom,pm6150",
>> +                  "qcom,pm6150l",
> 
> This seems to match the compatible list in the driver. Can you convert
> this binding to YAML and then sort this compatible string list
> alpha-numberically? Two patches, one to convert to YAML and sort and
> another patch to add these new compatible strings.
> 
Sure. Will do it.
>>                     or generalized "qcom,spmi-pmic".
>>  - reg:             Specifies the SPMI USID slave address for this 
>> device.
>>                     For more information see:
>> diff --git a/drivers/mfd/qcom-spmi-pmic.c 
>> b/drivers/mfd/qcom-spmi-pmic.c
>> index e8fe705..74b7980 100644
>> --- a/drivers/mfd/qcom-spmi-pmic.c
>> +++ b/drivers/mfd/qcom-spmi-pmic.c
>> @@ -34,6 +34,8 @@
>>  #define PM8998_SUBTYPE         0x14
>>  #define PMI8998_SUBTYPE                0x15
>>  #define PM8005_SUBTYPE         0x18
>> +#define PM6150_SUBTYPE         0x28
>> +#define PM6150L_SUBTYPE                0x27
> 
> This list looks to be sorted based on id number, so just swap the two
> here.
> 
Ok. Will do it in next post.
>> 
>>  static const struct of_device_id pmic_spmi_id_table[] = {
>>         { .compatible = "qcom,spmi-pmic", .data = (void 
>> *)COMMON_SUBTYPE },
>> @@ -53,6 +55,8 @@
>>         { .compatible = "qcom,pm8998",    .data = (void 
>> *)PM8998_SUBTYPE },
>>         { .compatible = "qcom,pmi8998",   .data = (void 
>> *)PMI8998_SUBTYPE },
>>         { .compatible = "qcom,pm8005",    .data = (void 
>> *)PM8005_SUBTYPE },
>> +       { .compatible = "qcom,pm6150",    .data = (void 
>> *)PM6150_SUBTYPE },
>> +       { .compatible = "qcom,pm6150l",   .data = (void 
>> *)PM6150L_SUBTYPE },
> 
> This is also sorted based on .data value, so swap the two here too.
> 
Ok. Will do it in next post.
>>         { }
