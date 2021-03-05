Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66CB732E1C7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 06:44:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbhCEFoP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 00:44:15 -0500
Received: from z11.mailgun.us ([104.130.96.11]:28186 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229494AbhCEFoO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 00:44:14 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614923054; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=o0lfkEy5cq/+OBYKxf4Aev5Vks1o41I/U3+bhq9lQI0=; b=mNuzRhSG0JF/yP5Q+3pm9Xd6xiC4NUp1JbBZa33ry8c2GBaHhqN7zLU4bG9U2/sAb4tdAOu8
 WkOKWshG6Yq/Yoi4RknDddJzPxrdxVCMsKgxqK5wQzjlaywUg7wcD9eFODRyiWkeWNURF4q2
 vIjDhXRWcDNXEI5bTP33Wy6wP/k=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6041c52ee5eea4c43b7eabda (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Mar 2021 05:44:14
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F2D9DC43462; Fri,  5 Mar 2021 05:44:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.1.102] (unknown [49.207.203.158])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0C5FAC43461;
        Fri,  5 Mar 2021 05:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0C5FAC43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v2 12/14] arm64: dts: qcom: sc7280: Add SPMI PMIC arbiter
 device for SC7280
To:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, satya priya <skakit@codeaurora.org>
References: <1614773878-8058-1-git-send-email-rnayak@codeaurora.org>
 <1614773878-8058-13-git-send-email-rnayak@codeaurora.org>
 <161481673286.1478170.13034581527644587648@swboyd.mtv.corp.google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <1a78ad4a-bb6c-cb68-019d-d6de54c2dc38@codeaurora.org>
Date:   Fri, 5 Mar 2021 11:14:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <161481673286.1478170.13034581527644587648@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/4/2021 5:42 AM, Stephen Boyd wrote:
> Quoting Rajendra Nayak (2021-03-03 04:17:56)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index fe4fdb9..aa6f847 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -239,6 +239,25 @@
>>                          interrupt-controller;
>>                  };
>>   
>> +               spmi_bus: spmi@c440000 {
>> +                       compatible = "qcom,spmi-pmic-arb";
>> +                       reg = <0 0x0c440000 0 0x1100>,
>> +                             <0 0x0c600000 0 0x2000000>,
>> +                             <0 0x0e600000 0 0x100000>,
>> +                             <0 0x0e700000 0 0xa0000>,
>> +                             <0 0x0c40a000 0 0x26000>;
>> +                       reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
>> +                       interrupt-names = "periph_irq";
>> +                       interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
>> +                       qcom,ee = <0>;
>> +                       qcom,channel = <0>;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
> 
> I see the binding says these should be 2 instead of 1 but I suspect that
> is incorrect.

yeah looks like the bindings need to be fixed

> 
>> +                       interrupt-controller;
>> +                       #interrupt-cells = <4>;
>> +                       cell-index = <0>;
> 
> Is cell-index used? Please remove as I don't see it used anywhere and
> not in the binding.

I'll drop it. thanks

> 
>> +               };
>> +
>>                  tlmm: pinctrl@f100000 {
>>                          compatible = "qcom,sc7280-pinctrl";
>>                          reg = <0 0x0f100000 0 0x1000000>;

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
