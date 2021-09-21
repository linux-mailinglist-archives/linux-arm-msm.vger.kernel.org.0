Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8D7412DA5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 06:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232341AbhIUEF3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 00:05:29 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:34076 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229942AbhIUEF1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 00:05:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632197039; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=kEkqeGXMJQxV/+/TJfXOrWeipK4ag54CqEyWxmSVgZ4=;
 b=u80axSlqbChhANj587yxCtuPOS7rf/WOa60/bawl10jusElVKHhSWR1w7GDJa2w/PRIJGGnJ
 DkLGDjFiqtr/x/QQk9D1I02X5cX0zRhKjqXVy13jba7TYDbbZsyDWL7MXBqnmyipgy5sve8Q
 cft0kbKFfnbCtmsz5XaslmWLbsk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 614959afec62f57c9a1b76e0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Sep 2021 04:03:59
 GMT
Sender: rajpat=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 90088C43617; Tue, 21 Sep 2021 04:03:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rajpat)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E0A98C4338F;
        Tue, 21 Sep 2021 04:03:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 21 Sep 2021 09:33:57 +0530
From:   rajpat@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, mka@chromium.org, dianders@chromium.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: Re: [PATCH V8 4/8] arm64: dts: sc7280: Add QUPv3 wrapper_0 nodes
In-Reply-To: <CAE-0n51JdKDSDKhbhQSbF5w=cn5iQ_uRDG0-NMR+FPdGkuX4UA@mail.gmail.com>
References: <1631872087-24416-1-git-send-email-rajpat@codeaurora.org>
 <1631872087-24416-5-git-send-email-rajpat@codeaurora.org>
 <CAE-0n51JdKDSDKhbhQSbF5w=cn5iQ_uRDG0-NMR+FPdGkuX4UA@mail.gmail.com>
Message-ID: <aca568eb87d0f3b95fcf35f956613f4f@codeaurora.org>
X-Sender: rajpat@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-21 01:12, Stephen Boyd wrote:
> Quoting Rajesh Patil (2021-09-17 02:48:03)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 2fbcb0a..a2a4d7e 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -536,24 +536,444 @@
>>                 qupv3_id_0: geniqup@9c0000 {
>>                         compatible = "qcom,geni-se-qup";
>>                         reg = <0 0x009c0000 0 0x2000>;
>> -                       clock-names = "m-ahb", "s-ahb";
>>                         clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
>>                                  <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
>> +                       clock-names = "m-ahb", "s-ahb";
>>                         #address-cells = <2>;
>>                         #size-cells = <2>;
>>                         ranges;
>> +                       iommus = <&apps_smmu 0x123 0x0>;
>>                         status = "disabled";
>> 
>> +                       qup_opp_table: qup-opp-table {
> 
> Sorry to mislead you. I see now why it can't be here. qeniqup has
> address cells and size cells not equal to zero, which means that every
> child node of qeniqup should have a reg property. So this OPP table
> needs to be moved to the root again (ugh).

Okay

> 
>> +                               compatible = "operating-points-v2";
>> +
>> +                               opp-75000000 {
>> +                                       opp-hz = /bits/ 64 <75000000>;
>> +                                       required-opps = 
>> <&rpmhpd_opp_low_svs>;
>> +                               };
>> +
>> +                               opp-100000000 {
>> +                                       opp-hz = /bits/ 64 
>> <100000000>;
>> +                                       required-opps = 
>> <&rpmhpd_opp_svs>;
>> +                               };
>> +
>> +                               opp-128000000 {
>> +                                       opp-hz = /bits/ 64 
>> <128000000>;
>> +                                       required-opps = 
>> <&rpmhpd_opp_nom>;
>> +                               };
>> +                       };
>> +
>> +                       i2c0: i2c@980000 {
>> +                               compatible = "qcom,geni-i2c";
>> +                               reg = <0 0x00980000 0 0x4000>;
>> +                               clocks = <&gcc 
>> GCC_QUPV3_WRAP0_S0_CLK>;
>> +                               clock-names = "se";
>> +                               pinctrl-names = "default";
> [...]
>> 
>>                 cnoc2: interconnect@1500000 {
>> @@ -1574,11 +1994,311 @@
>>                                 function = "qspi_data";
> [...]
>> +
>> +                       qup_spi0_cs_gpio: qup-spi0-cs_gpio {
> 
> Please make it "qup_spi0_cs_gpio: qup-spi0-cs-gpio" as node names 
> should
> have dashes instead of underscores.

Okay

> 
>> +                               pins = "gpio3";
