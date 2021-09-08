Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3398140369B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Sep 2021 11:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351288AbhIHJJW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Sep 2021 05:09:22 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:21584 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348336AbhIHJJJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Sep 2021 05:09:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631092082; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=8szJlKgcGuGNNeXnnIPug4EYFkWW3s0E9P2TtnxnQks=;
 b=U9B5NBmqikbztC4aFt8SN/q+JpNUXUGnMcy43rD3tkG3vXJZ8gsRUn0v0Y4pI3PXTkQ1oBS7
 g1AT2eh8CSc0yQQ3vrzU39z5XkVFtDDSNZ9TWs2V++ONU4AkfwmNWgk6cWoe3PHqc7q1xqth
 FaLVbTo64SdZUQs44qITPZP/z3U=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 61387d5cb52e91333ca621f3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 08 Sep 2021 09:07:40
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 527F9C43616; Wed,  8 Sep 2021 09:07:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B0623C4338F;
        Wed,  8 Sep 2021 09:07:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 08 Sep 2021 14:37:39 +0530
From:   skakit@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        swboyd@chromium.org, kgunda@codeaurora.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: pm8350c: Add pwm support
In-Reply-To: <YTeskY7kXsdmvGPp@google.com>
References: <1630924867-4663-1-git-send-email-skakit@codeaurora.org>
 <1630924867-4663-4-git-send-email-skakit@codeaurora.org>
 <YTeskY7kXsdmvGPp@google.com>
Message-ID: <b10e5f36fb0216a4c951d752f5103099@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-07 23:46, Matthias Kaehlcke wrote:
> On Mon, Sep 06, 2021 at 04:11:07PM +0530, satya priya wrote:
>> Add pwm support for PM8350C pmic.
>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/pm8350c.dtsi | 6 ++++++
>>  1 file changed, 6 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi 
>> b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
>> index e1b75ae..ecdae55 100644
>> --- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
>> @@ -29,6 +29,12 @@
>>  			interrupt-controller;
>>  			#interrupt-cells = <2>;
>>  		};
>> +
>> +		pm8350c_pwm4: pwm {
> 
> What does the '4' represent, an internal channel number? It should
> probably be omitted if the PM8350 only has a single output PWM
> port.
> 

pm8350c has four PWMs, but I think we can drop the '4' here.

>> +			compatible = "qcom,pm8350c-pwm";
>> +			#pwm-cells = <2>;
>> +			status = "okay";
> 
> I don't think it should be enabled by default, there may be boards with
> the PM8350C that don't use the PWM.

Okay.
