Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6BE42412D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 17:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239233AbhJFPWb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 11:22:31 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:58451 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231671AbhJFPWa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 11:22:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633533637; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=vTominGrDerw5CGaGhPCV6xyYr12cyAJAlCnNz1Tn0w=; b=Hi5YYned3Vvi7MhIth1jpAw+JYdk1qmS+/3SeMnuoVYxyd3isDsURyGhiFbHwTFh6iJ3LUs6
 KF+7t9krYy8EPvsitdg+m7vJkjjv8kjre7VRaGY0qauoAQ1MgkDz/JFgoZQNLB2lapcNPuel
 dCgO4kQ0eaeihyYt8aOLXQBHBOw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 615dbeb403355859c8b81ac4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 06 Oct 2021 15:20:20
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 33B00C43460; Wed,  6 Oct 2021 15:20:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.29.129] (unknown [49.36.85.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B0F89C4338F;
        Wed,  6 Oct 2021 15:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org B0F89C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v10 5/5] arm64: dts: qcom: sc7280: Enable SoC sleep stats
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, linux@roeck-us.net,
        rnayak@codeaurora.org, lsrao@codeaurora.org,
        devicetree@vger.kernel.org
References: <1633425065-7927-1-git-send-email-mkshah@codeaurora.org>
 <1633425065-7927-6-git-send-email-mkshah@codeaurora.org>
 <YVx4o8mfmFjKW5ng@ripper>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <e1d88886-23ea-77b3-c827-0f83d2df576f@codeaurora.org>
Date:   Wed, 6 Oct 2021 20:50:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YVx4o8mfmFjKW5ng@ripper>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 10/5/2021 9:39 PM, Bjorn Andersson wrote:
> On Tue 05 Oct 02:11 PDT 2021, Maulik Shah wrote:
> 
>> Add device node for SoC sleep stats driver which provides various
>> low power mode stats.
>>
>> Also update the reg size of aoss_qmp device to 0x400.
>>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> 
> Can you please follow up with patches for the other upstream platforms
> as well.
> 
> Thanks,
> Bjorn
> 

Sure, included most of other upstream platforms in v11.

Thanks,
Maulik

>> ---
>>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 39635da..f8622ae 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -2637,7 +2637,7 @@
>>   
>>   		aoss_qmp: power-controller@c300000 {
>>   			compatible = "qcom,sc7280-aoss-qmp";
>> -			reg = <0 0x0c300000 0 0x100000>;
>> +			reg = <0 0x0c300000 0 0x400>;
>>   			interrupts-extended = <&ipcc IPCC_CLIENT_AOP
>>   						     IPCC_MPROC_SIGNAL_GLINK_QMP
>>   						     IRQ_TYPE_EDGE_RISING>;
>> @@ -2647,6 +2647,11 @@
>>   			#clock-cells = <0>;
>>   		};
>>   
>> +		memory@c3f0000 {
>> +			compatible = "qcom,rpmh-sleep-stats";
>> +			reg = <0 0x0c3f0000 0 0x400>;
>> +		};
>> +
>>   		spmi_bus: spmi@c440000 {
>>   			compatible = "qcom,spmi-pmic-arb";
>>   			reg = <0 0x0c440000 0 0x1100>,
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation
>>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member of Code Aurora Forum, hosted by The Linux Foundation
