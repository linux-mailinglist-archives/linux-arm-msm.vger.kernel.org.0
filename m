Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4EF30E188
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 18:57:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232143AbhBCRzp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 12:55:45 -0500
Received: from so15.mailgun.net ([198.61.254.15]:36345 "EHLO so15.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231301AbhBCRzi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 12:55:38 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612374914; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=skd9G4BcflC/QWV4zSXi1f5Z3sAt9lA/5vhec0dO9FM=; b=OxXAYGrlmCZyFRvPl1Y1KrjOUA08mbP/1zMtW/gu2d112Rl7EkYP8VZ8KnOsSnWK/aR10nmj
 7k4scplU3iRQUxz93Uv7GRQlnCq5Q5PxKAwxbFxFTXvJ1lAN6Ofyg7up8wNVaQaaKqxJcXqS
 Lhzd8lr8X+/ZwmdA4qqdjtb3LOU=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 601ae35c84d0ac8967a1fbdd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 03 Feb 2021 17:54:36
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 72E16C43462; Wed,  3 Feb 2021 17:54:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.105] (unknown [117.210.176.5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7D02EC433ED;
        Wed,  3 Feb 2021 17:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7D02EC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH v4 2/2] arm: dts: sc7180: Add support for gpu fuse
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        dri-devel@freedesktop.org, freedreno@lists.freedesktop.org
References: <1610129731-4875-1-git-send-email-akhilpo@codeaurora.org>
 <1610129731-4875-2-git-send-email-akhilpo@codeaurora.org>
 <YBnXshYzJmNpmuEW@builder.lan>
From:   Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <af88628d-08ca-a2f3-c8f3-91732366760f@codeaurora.org>
Date:   Wed, 3 Feb 2021 23:24:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YBnXshYzJmNpmuEW@builder.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/3/2021 4:22 AM, Bjorn Andersson wrote:
> On Fri 08 Jan 12:15 CST 2021, Akhil P Oommen wrote:
> 
> Please align the $subject prefix with other changes in the same file.
> I fixed it up while picking up the patch this time.
> 
Will take of this in future. Thanks, Bjorn.

-Akhil.

> Regards,
> Bjorn
> 
>> Add support for gpu fuse to help identify the supported opps.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7180.dtsi | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index 6678f1e..8cae3eb 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -675,6 +675,11 @@
>>   				reg = <0x25b 0x1>;
>>   				bits = <1 3>;
>>   			};
>> +
>> +			gpu_speed_bin: gpu_speed_bin@1d2 {
>> +				reg = <0x1d2 0x2>;
>> +				bits = <5 8>;
>> +			};
>>   		};
>>   
>>   		sdhc_1: sdhci@7c4000 {
>> @@ -1907,52 +1912,69 @@
>>   			operating-points-v2 = <&gpu_opp_table>;
>>   			qcom,gmu = <&gmu>;
>>   
>> +			nvmem-cells = <&gpu_speed_bin>;
>> +			nvmem-cell-names = "speed_bin";
>> +
>>   			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
>>   			interconnect-names = "gfx-mem";
>>   
>>   			gpu_opp_table: opp-table {
>>   				compatible = "operating-points-v2";
>>   
>> +				opp-825000000 {
>> +					opp-hz = /bits/ 64 <825000000>;
>> +					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
>> +					opp-peak-kBps = <8532000>;
>> +					opp-supported-hw = <0x04>;
>> +				};
>> +
>>   				opp-800000000 {
>>   					opp-hz = /bits/ 64 <800000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
>>   					opp-peak-kBps = <8532000>;
>> +					opp-supported-hw = <0x07>;
>>   				};
>>   
>>   				opp-650000000 {
>>   					opp-hz = /bits/ 64 <650000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
>>   					opp-peak-kBps = <7216000>;
>> +					opp-supported-hw = <0x07>;
>>   				};
>>   
>>   				opp-565000000 {
>>   					opp-hz = /bits/ 64 <565000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
>>   					opp-peak-kBps = <5412000>;
>> +					opp-supported-hw = <0x07>;
>>   				};
>>   
>>   				opp-430000000 {
>>   					opp-hz = /bits/ 64 <430000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
>>   					opp-peak-kBps = <5412000>;
>> +					opp-supported-hw = <0x07>;
>>   				};
>>   
>>   				opp-355000000 {
>>   					opp-hz = /bits/ 64 <355000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
>>   					opp-peak-kBps = <3072000>;
>> +					opp-supported-hw = <0x07>;
>>   				};
>>   
>>   				opp-267000000 {
>>   					opp-hz = /bits/ 64 <267000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
>>   					opp-peak-kBps = <3072000>;
>> +					opp-supported-hw = <0x07>;
>>   				};
>>   
>>   				opp-180000000 {
>>   					opp-hz = /bits/ 64 <180000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
>>   					opp-peak-kBps = <1804000>;
>> +					opp-supported-hw = <0x07>;
>>   				};
>>   			};
>>   		};
>> -- 
>> 2.7.4
>>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

