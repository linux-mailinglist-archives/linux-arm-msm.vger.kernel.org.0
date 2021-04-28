Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 118A336D1E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Apr 2021 07:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235917AbhD1F6x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 01:58:53 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:45593 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbhD1F6x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 01:58:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619589489; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Rg1gpg/qMf5ZwfvDkM6GsImfatwM0n65u9QW2Zdxhjs=;
 b=UpoOKX5bqdFoXCdTgoYEeG6Z9GROMr15IEy7ZSGRuvD3fhfnHQJnki7clSz3cMWvL7TxHmqv
 +s60xg0ORD5eoywUanQS0BjWqgashK0OxRqCUl/EYftw3ZhBbEVHYQY7wTewKUDLx0fvtss5
 eOrd7a8Wr01mCDdhKazuSwLFt2c=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6088f97074f773a6649c0550 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 28 Apr 2021 05:58:08
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D4BB3C433F1; Wed, 28 Apr 2021 05:58:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 27094C433D3;
        Wed, 28 Apr 2021 05:58:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 28 Apr 2021 11:28:07 +0530
From:   skakit@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [RESEND PATCH V3 4/5] arm64: dts: qcom: pmk8350: Add PMIC
 peripherals for pmk8350
In-Reply-To: <YH8PjqhZtiNhNv8h@google.com>
References: <1618398783-7834-1-git-send-email-skakit@codeaurora.org>
 <1618398783-7834-3-git-send-email-skakit@codeaurora.org>
 <YH8PjqhZtiNhNv8h@google.com>
Message-ID: <1853cf98592b092cba25542b91c89d9c@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-04-20 22:59, Matthias Kaehlcke wrote:
> On Wed, Apr 14, 2021 at 04:43:00PM +0530, satya priya wrote:
> 
>> Subject: arm64: dts: qcom: pmk8350: Add PMIC peripherals for pmk8350
> 
> nit: why 'PMIC peripherals', are these peripherals somehow specific
> to PMICs?
> 

Okay will change it.

>> Add PON, RTC and other PMIC infra modules support for PMK8350.
> 
> nit: it seems somewhat arbitrary to specifically mention PON and RTC,
> and then treat the ADC and the thermal monitor as 'others'. You could
> just spell them out too.
> 

Okay.

>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/pmk8350.dtsi | 55 
>> ++++++++++++++++++++++++++++++++++-
>>  1 file changed, 54 insertions(+), 1 deletion(-)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/pmk8350.dtsi 
>> b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
>> index 1530b8f..bbd9fa7 100644
>> --- a/arch/arm64/boot/dts/qcom/pmk8350.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
>> @@ -3,6 +3,12 @@
>>   * Copyright (c) 2021, Linaro Limited
>>   */
>> 
>> +#include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
>> +#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
>> +#include <dt-bindings/iio/qcom,spmi-adc7-pmr735a.h>
>> +#include <dt-bindings/iio/qcom,spmi-adc7-pmr735b.h>
> 
> the includes of the constants for the other PMICs seems to be an
> remainder from older vesions, which included nodes for the on die
> temperatures of these PMICs.

As I have added on die temp nodes for these pmics in sc7280-idp file, 
will add these header files also there.

Thanks,
Satya Priya
