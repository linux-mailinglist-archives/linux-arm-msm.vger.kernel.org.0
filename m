Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18171325E77
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 08:53:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbhBZHvt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 02:51:49 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:11792 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229550AbhBZHvt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 02:51:49 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614325888; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=r8ceqRaD6vKp+3sEIocnghQuW8k5dUvRT7WlMB6q6bw=;
 b=XdwT8BcdmkKiCmPCgZJ32xlSJn8ucPjkS4BdsnVhzPsdu9AVqI0FKbpYSnfCYUuhF3QfhMiP
 3y8SsMTzHCsVORgZqn5Ju1MH+0xoNOLFg5G5kI+PG2Kns0JeUv7K559yVOBR+wbvMoviN9gY
 jyowCCN32+l9JtgukmTwfTWhP8g=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6038a865ea793fa303212752 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Feb 2021 07:51:01
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 17073C43462; Fri, 26 Feb 2021 07:51:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4B4FFC433C6;
        Fri, 26 Feb 2021 07:51:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 26 Feb 2021 13:21:00 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH 8/9] arm64: dts: qcom: sc7280: Add AOSS QMP node
In-Reply-To: <161428210272.1254594.16034240343090747878@swboyd.mtv.corp.google.com>
References: <cover.1614244789.git.saiprakash.ranjan@codeaurora.org>
 <463a45f2c3e4a91430c006fa1637c7f4f124185e.1614244789.git.saiprakash.ranjan@codeaurora.org>
 <161428210272.1254594.16034240343090747878@swboyd.mtv.corp.google.com>
Message-ID: <dc3be32a3f8197d3138fe1ef6c24316a@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-26 01:11, Stephen Boyd wrote:
> Quoting Sai Prakash Ranjan (2021-02-25 01:30:24)
>> Add a DT node for the AOSS QMP on SC7280 SoC.
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 65c1e0f2fb56..cbd567ccc04e 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -9,6 +9,7 @@
>>  #include <dt-bindings/clock/qcom,rpmh.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>  #include <dt-bindings/mailbox/qcom-ipcc.h>
>> +#include <dt-bindings/power/qcom-aoss-qmp.h>
>>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>> 
>>  / {
>> @@ -368,6 +369,19 @@ pdc: interrupt-controller@b220000 {
>>                         interrupt-controller;
>>                 };
>> 
>> +               aoss_qmp: qmp@c300000 {
> 
> power-domain-controller@c300000? power-controller@c300000?
> 

Its an AOSS message RAM and all other SM* SoCs have as qmp@
and the dt binding as well, I see only SM8150 with power-controller,
that should probably be fixed?

>> +                       compatible = "qcom,sc7280-aoss-qmp";
>> +                       reg = <0 0x0c300000 0 0x100000>;
>> +                       interrupts-extended = <&ipcc IPCC_CLIENT_AOP
>> +                                                    
>> IPCC_MPROC_SIGNAL_GLINK_QMP
>> +                                                    
>> IRQ_TYPE_EDGE_RISING>;
>> +                       mboxes = <&ipcc IPCC_CLIENT_AOP
>> +                                       IPCC_MPROC_SIGNAL_GLINK_QMP>;
>> +
>> +                       #clock-cells = <0>;
>> +                       #power-domain-cells = <1>;
>> +               };
>> +
>>                 spmi_bus: qcom,spmi@c440000 {
> 
> Ick, should be spmi@
> 

Not introduced by this patch but I'll pass on the comment.

>>                         compatible = "qcom,spmi-pmic-arb";
>>                         reg = <0 0x0c440000 0 0x1100>,


Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
