Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB1B232E1BB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 06:42:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229446AbhCEFmp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 00:42:45 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:50145 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229458AbhCEFmo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 00:42:44 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614922964; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=0uoPBJmy/4ZLXlf3wRY+ebAvgbPioQVtuD66JRul31E=; b=kFfqijeQ47XLgi706ZklnfpijXj9bID7BnQ7t22JjOLoo8+tocAWZptEBiciOTk5DA3GyUmr
 bVOC3SFpT32IXnHGMmrQ5Gv11+6HJTIf6mU9cROFhzersj235Ri5vnJAycaFsLCjGIuz3GJO
 UEsPgm8T1hPK/PM9DTDFRuPhNIg=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6041c4d4c862e1b9fd50b0d4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Mar 2021 05:42:44
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0E33CC433ED; Fri,  5 Mar 2021 05:42:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.1.102] (unknown [49.207.203.158])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 79D78C433C6;
        Fri,  5 Mar 2021 05:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 79D78C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v2 05/14] arm64: dts: qcom: sc7280: Add RSC and PDC
 devices
To:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Maulik Shah <mkshah@codeaurora.org>
References: <1614773878-8058-1-git-send-email-rnayak@codeaurora.org>
 <1614773878-8058-6-git-send-email-rnayak@codeaurora.org>
 <161481625091.1478170.8810587061043612400@swboyd.mtv.corp.google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <31bf64c5-26a4-dc23-3769-df7a7559083b@codeaurora.org>
Date:   Fri, 5 Mar 2021 11:12:37 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <161481625091.1478170.8810587061043612400@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/4/2021 5:34 AM, Stephen Boyd wrote:
> Quoting Rajendra Nayak (2021-03-03 04:17:49)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 4a56d9c..21c2399 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -30,6 +31,18 @@
>>                  };
>>          };
>>   
>> +       reserved_memory: reserved-memory {
> 
> Do we plan to use this label at any point? I'd prefer we remove this
> until it becomes useful.

sure, i'll drop it

> 
>> +               #address-cells = <2>;
>> +               #size-cells = <2>;
>> +               ranges;
>> +
>> +               aop_cmd_db_mem: memory@80860000 {
>> +                       reg = <0x0 0x80860000 0x0 0x20000>;
>> +                       compatible = "qcom,cmd-db";
>> +                       no-map;
>> +               };
>> +       };
>> +
>>          cpus {
>>                  #address-cells = <2>;
>>                  #size-cells = <0>;
>> @@ -203,6 +229,7 @@
>>                          interrupt-controller;
>>                          #interrupt-cells = <2>;
>>                          gpio-ranges = <&tlmm 0 0 175>;
>> +                       wakeup-parent = <&pdc>;
>>   
>>                          qup_uart5_default: qup-uart5-default {
>>                                  pins = "gpio46", "gpio47";
>> @@ -287,6 +314,23 @@
>>                                  status = "disabled";
>>                          };
>>                  };
>> +
>> +               apps_rsc: rsc@18200000 {
> 
> Any better name than 'rsc'? Maybe 'power-controller'?

hmm, Maulik, any thoughts? This would perhaps need the bindings docs
to be updated as well (and maybe the existing platform DTs using rsc too)

> 
>> +                       compatible = "qcom,rpmh-rsc";
>> +                       reg = <0 0x18200000 0 0x10000>,
>> +                             <0 0x18210000 0 0x10000>,
>> +                             <0 0x18220000 0 0x10000>;
>> +                       reg-names = "drv-0", "drv-1", "drv-2";
>> +                       interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
>> +                                    <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
>> +                                    <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
>> +                       qcom,tcs-offset = <0xd00>;
>> +                       qcom,drv-id = <2>;
>> +                       qcom,tcs-config = <ACTIVE_TCS  2>,
>> +                                         <SLEEP_TCS   3>,
>> +                                         <WAKE_TCS    3>,
>> +                                         <CONTROL_TCS 1>;
>> +               };
>>          };

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
