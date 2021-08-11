Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3B293E9006
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 14:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237440AbhHKMFP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 08:05:15 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:58401 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232160AbhHKMFO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 08:05:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628683491; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=UpoWxDwi/WJD3AY6N5zl01gu9NgyIOD/P/DwkvQG18c=;
 b=VhQMgaBz2kkD0s61xLlvdoGJa48fCMk4fbF3rL84qiXZJ02434OG+2cUjbiaoBgZeebnaAOO
 r0q5g6qUIinGBTl9z7+AKo+Um6Gm2ELb6R4f6j9aoqOTRd4mbOl9/ByuaJLXrp/L0ITlNmLS
 8IcCEPPy5Wxx1+dFvU5QR25+tKU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6113bcdc454b7a558f2e4cdd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 11 Aug 2021 12:04:44
 GMT
Sender: rajpat=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 52A8EC43460; Wed, 11 Aug 2021 12:04:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rajpat)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AD779C4338A;
        Wed, 11 Aug 2021 12:04:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 11 Aug 2021 17:34:41 +0530
From:   rajpat@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, Roja Rani Yarubandi <rojay@codeaurora.org>,
        swboyd@chromium.org
Subject: Re: [PATCH V4 3/4] arm64: dts: sc7280: Update QUPv3 Debug UART DT
 node
In-Reply-To: <YP7X7kjH9wd818Xg@google.com>
References: <1627306847-25308-1-git-send-email-rajpat@codeaurora.org>
 <1627306847-25308-4-git-send-email-rajpat@codeaurora.org>
 <YP7X7kjH9wd818Xg@google.com>
Message-ID: <4700a6df7ed665c6b17003cd35aab0c4@codeaurora.org>
X-Sender: rajpat@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-26 21:12, Matthias Kaehlcke wrote:
> On Mon, Jul 26, 2021 at 07:10:46PM +0530, Rajesh Patil wrote:
>> From: Roja Rani Yarubandi <rojay@codeaurora.org>
>> 
>> Update QUPv3 Debug UART DT node with the interconnect names and
>> functions for SC7280 SoC.
>> 
>> Split the Debug UART pin control functions.
>> 
>> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
>> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
>> ---
>> Changes in V4:
>>  - As per Bjorn's comment, posting this debug-uart node update
>>    as seperate patch
>> 
>>  arch/arm64/boot/dts/qcom/sc7280-idp.dts | 18 +++++++-----------
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi    | 28 
>> ++++++++++++++++++++++++----
>>  2 files changed, 31 insertions(+), 15 deletions(-)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts 
>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> index f63cf51..a50c9e5 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> @@ -383,18 +383,14 @@
>>  	bias-pull-up;
>>  };
>> 
>> -&qup_uart5_default {
>> -	tx {
>> -		pins = "gpio46";
>> -		drive-strength = <2>;
>> -		bias-disable;
>> -	};
>> +&qup_uart5_tx {
>> +	drive-strength = <2>;
>> +	bias-disable;
>> +};
>> 
>> -	rx {
>> -		pins = "gpio47";
>> -		drive-strength = <2>;
>> -		bias-pull-up;
>> -	};
>> +&qup_uart5_rx {
>> +	drive-strength = <2>;
>> +	bias-pull-up;
>>  };
>> 
>>  &sdc1_on {
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 455e58f..951818f 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -853,8 +853,13 @@
>>  				clock-names = "se";
>>  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
>>  				pinctrl-names = "default";
>> -				pinctrl-0 = <&qup_uart5_default>;
>> +				pinctrl-0 = <&qup_uart5_cts>, <&qup_uart5_rts>, <&qup_uart5_tx>, 
>> <&qup_uart5_rx>;
>>  				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
>> +				power-domains = <&rpmhpd SC7280_CX>;
>> +				operating-points-v2 = <&qup_opp_table>;
>> +				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt 
>> SLAVE_QUP_CORE_0 0>,
>> +						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
>> +				interconnect-names = "qup-core", "qup-config";
> 
> 
> Most of the above should be added by patch '[2/4] arm64: dts: sc7280: 
> Add QUPv3
> wrapper_0 nodes'.

Based on the comments on v3 [1], I have added this as a separate patch
[1] https://lore.kernel.org/patchwork/patch/1441257/

> 
> I have to say I dislike that the SoC DT file dictates which UART to use 
> for
> the serial console. Technically it could be any of them, right? uart5 
> is
> used because that's what the IDP does, and the rest of the world is 
> expected
> to follow. Why not configure uart5 as "qcom,geni-uart" by default and
> overwrite the compatible string and pinctrl in the board file? You 
> could even
> add 'qup-uartN-all' (or similar) pinconfigs to sc7280.dtsi, which would 
> make
> the changes in the board file trivial.

Okay, will make the compatible as "qcom,geni-uart" in SoC dt and later 
modify it in idp dts as "qcom,geni-debug-uart".

Thanks,
Rajesh
