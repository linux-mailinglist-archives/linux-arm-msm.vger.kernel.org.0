Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E56239F073
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 10:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhFHIML (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 04:12:11 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:37577 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbhFHIMJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 04:12:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623139817; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=DjmidSMA1K0OBfo7MiVnr6mqR+WePyq9ThqosIp5PhY=;
 b=SDfM0Q2IB8BWJZLI01L/n+0JpLXl0210EzIoGIWDizqErEFwbvUL9MHPI8cCIh/IQPYvb3nu
 sOcTg1F1gCE/UPeh/w1ZXakyHQc8+SiRbJQAt0s58AjdPZu6pLu/fGUOIsMPm8jS9ocVZTpV
 TBfEQkXGZacCBmXnR4Zu/8dEMr4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60bf25e8e27c0cc77fb40502 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 08 Jun 2021 08:10:16
 GMT
Sender: rojay=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DCB0EC433F1; Tue,  8 Jun 2021 08:10:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rojay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7A3FCC433D3;
        Tue,  8 Jun 2021 08:10:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 08 Jun 2021 13:40:15 +0530
From:   rojay@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V3 3/3] arm64: dts: sc7280: Add QUPv3 wrapper_1 nodes
In-Reply-To: <YLxGuumLA5ii9awe@builder.lan>
References: <20210604135439.19119-1-rojay@codeaurora.org>
 <20210604135439.19119-4-rojay@codeaurora.org> <YLxGuumLA5ii9awe@builder.lan>
Message-ID: <ecda9dff011e4d9cb53186da1bc2ba40@codeaurora.org>
X-Sender: rojay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-06 09:23, Bjorn Andersson wrote:
> On Fri 04 Jun 08:54 CDT 2021, Roja Rani Yarubandi wrote:
> 
>> Add QUPv3 wrapper_1 DT nodes for SC7280 SoC.
>> 
>> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
>> ---
>> Changes in V3:
>>  - Broken the huge V2 patch into 3 smaller patches.
>>    1. QSPI DT nodes
>>    2. QUP wrapper_0 DT nodes
>>    3. QUP wrapper_1 DT nodes
>> 
>> Changes in V2:
>>  - As per Doug's comments removed pinmux/pinconf subnodes.
>>  - As per Doug's comments split of SPI, UART nodes has been done.
>>  - Moved QSPI node before aps_smmu as per the order.
>> 
>>  arch/arm64/boot/dts/qcom/sc7280-idp.dts |   4 +
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi    | 751 
>> ++++++++++++++++++++++++
>>  2 files changed, 755 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts 
>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> index f57458dbe763..bdea9bf4eeca 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> @@ -288,6 +288,10 @@ &qupv3_id_0 {
>>  	status = "okay";
>>  };
>> 
>> +&qupv3_id_1 {
>> +	status = "okay";
>> +};
>> +
>>  &uart5 {
>>  	status = "okay";
>>  };
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index b783f5622a66..348a34f3448e 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -881,6 +881,437 @@ uart7: serial@99c000 {
>>  			};
>>  		};
>> 
>> +		qupv3_id_1: geniqup@ac0000 {
>> +			compatible = "qcom,geni-se-qup";
>> +			reg = <0 0x00ac0000 0 0x2000>;
>> +			clock-names = "m-ahb", "s-ahb";
>> +			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
>> +				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges;
>> +			iommus = <&apps_smmu 0x43 0x0>;
>> +			interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt 
>> SLAVE_QUP_CORE_1 0>;
>> +			interconnect-names = "qup-core";
> 
> We used to have interconnect votes for the wrapper, but I recently
> merged patches that dropped these for sc7180, so please conclude which
> way this should be.
> 
> The rest looks good.
> 
> Regards,
> Bjorn

Sorry, forgot to remove interconnect votes here for both the wrappers.
I will correct this in the follow up patch.

Thanks,
Roja
