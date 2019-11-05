Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41E2CEF4B4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 06:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726033AbfKEFOI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Nov 2019 00:14:08 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:52320 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725385AbfKEFOI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Nov 2019 00:14:08 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 3739F60D7B; Tue,  5 Nov 2019 05:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572930847;
        bh=n3RAMDcBm/CT0ZtRKwVKxkrQji4NRWqEdP9UGIO6We0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AILmfG6Di7mFyNAMchBY3xvcyomgmsdMM+sgDRm45P+YwjzeSll16/pmVqrlIkDZE
         R4cLoKldqRC06LAUT+0o9ZZHOPJ5GuWpb3fFbhfLC6j8eXiWkRkOfI+cX7h2nu1Pa/
         9XYu9jXKwBS5dCYU2mxt8FOrGz7B/hZqSE1MxLdU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 51D7260D60;
        Tue,  5 Nov 2019 05:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572930846;
        bh=n3RAMDcBm/CT0ZtRKwVKxkrQji4NRWqEdP9UGIO6We0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=k36UO6jejBPve7cpXkC4r2ckwN+itm/le4jrMAa4tHVBb5vTB9x8b9eZiK+xXNJhe
         gWWtatY1kkkI3dR9DwtMiduKdRT89sLCxxirDxOOo07BDlPiCJHZbARBO10rjmXeNA
         qqWf+4D7nm3uKWqyHz630V2ytfOsXpR/wtscCT9c=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 05 Nov 2019 10:44:06 +0530
From:   kgunda@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, rnayak@codeaurora.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH V1] mfd: qcom-spmi-pmic: Add support for pm6150 and
 pm6150l
In-Reply-To: <5dc0654b.1c69fb81.5f215.8c24@mx.google.com>
References: <1572591543-15501-1-git-send-email-kgunda@codeaurora.org>
 <5dc0654b.1c69fb81.5f215.8c24@mx.google.com>
Message-ID: <5fd2ae884d360e4c91862d4c1d23ef06@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-11-04 23:22, Stephen Boyd wrote:
> Quoting Kiran Gunda (2019-10-31 23:59:03)
>> Add the compatibles and PMIC ids for pm6150 and pm6150l PMICs
>> found on SC7180 based platforms.
>> 
>> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt | 2 ++
>>  drivers/mfd/qcom-spmi-pmic.c                             | 4 ++++
>>  2 files changed, 6 insertions(+)
>> 
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
> Please sort on compatible string
> 
Will do it in next post.
>>                     or generalized "qcom,spmi-pmic".
>>  - reg:             Specifies the SPMI USID slave address for this 
>> device.
>>                     For more information see:
>> diff --git a/drivers/mfd/qcom-spmi-pmic.c 
>> b/drivers/mfd/qcom-spmi-pmic.c
>> index e8fe705..d916aa8 100644
>> --- a/drivers/mfd/qcom-spmi-pmic.c
>> +++ b/drivers/mfd/qcom-spmi-pmic.c
>> @@ -34,6 +34,8 @@
>>  #define PM8998_SUBTYPE         0x14
>>  #define PMI8998_SUBTYPE                0x15
>>  #define PM8005_SUBTYPE         0x18
>> +#define PM6150L_SUBTYPE                0x27
>> +#define PM6150_SUBTYPE         0x28
> 
> And on macro name here.
> 
Will do it in next post.
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
>> +       { .compatible = "qcom,pm6150l",   .data = (void 
>> *)PM6150L_SUBTYPE },
>> +       { .compatible = "qcom,pm6150",    .data = (void 
>> *)PM6150_SUBTYPE },
> 
> And compatible here.
> 
Will do it in next post.
>>         { }
