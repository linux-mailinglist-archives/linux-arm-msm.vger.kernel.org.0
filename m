Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D51B31B2124
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 10:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgDUIKo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 04:10:44 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:50339 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727787AbgDUIKn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 04:10:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587456643; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=qhaNkfzyboUvEtiuhO92CVabH2/SAoOegZ9nrvZgMWo=; b=MSuHCitoNvhOkHoBiyB9qwl4C1y6cH4hxQpsqvAGZzlXP0N0Behx5Ry4GQZSh9lqw3q4jIT4
 nZMiMLkmM3U8eqacZkiXN3oGpt9SVafRv2d1eU/iiQOLUkPPRS3xWh8+AQ4vTbhwHC4kwe35
 kYPsDuztMemsmOMpK+x03T19TKg=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9eaa71.7f8335735fb8-smtp-out-n01;
 Tue, 21 Apr 2020 08:10:25 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6D5D4C433F2; Tue, 21 Apr 2020 08:10:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.184.221])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DC36CC433CB;
        Tue, 21 Apr 2020 08:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DC36CC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: Fix PDC compatible and reg
To:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200415054703.739507-1-bjorn.andersson@linaro.org>
 <20200421070227.GD72691@vkoul-mobl>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <d67adcc2-7f5c-3ed7-5c7c-c3b6b46cbd0b@codeaurora.org>
Date:   Tue, 21 Apr 2020 13:40:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421070227.GD72691@vkoul-mobl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

We can drop the second reg,
, <0 0x17c000f0 0 0x60>

The change [1] to read second reg and configure it, is not yet gone in 
pdc irqchip driver.
Otherthan this, the patch looks good to me.

Thanks,
Maulik

On 4/21/2020 12:32 PM, Vinod Koul wrote:
> On 14-04-20, 22:47, Bjorn Andersson wrote:
>> The pdc node suffers from both too narrow compatible and insufficient
>> cells in the reg, fix these.
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Tested-by: Vinod Koul <vkoul@kernel.org>
>
>> Fixes: 60378f1a171e ("arm64: dts: qcom: sm8250: Add sm8250 dts file")
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> index 891d83b2afea..2a7eaefd221d 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>> @@ -314,8 +314,8 @@ intc: interrupt-controller@17a00000 {
>>   		};
>>   
>>   		pdc: interrupt-controller@b220000 {
>> -			compatible = "qcom,sm8250-pdc";
>> -			reg = <0x0b220000 0x30000>, <0x17c000f0 0x60>;
>> +			compatible = "qcom,sm8250-pdc", "qcom,pdc";
>> +			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x60>;
>>   			qcom,pdc-ranges = <0 480 94>, <94 609 31>,
>>   					  <125 63 1>, <126 716 12>;
>>   			#interrupt-cells = <2>;
>> -- 
>> 2.24.0
[1] https://patchwork.kernel.org/patch/11145353/

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
