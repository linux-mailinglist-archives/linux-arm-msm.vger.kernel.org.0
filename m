Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C179614964D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2020 16:39:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbgAYPjh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Jan 2020 10:39:37 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:23645 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726240AbgAYPjh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Jan 2020 10:39:37 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579966776; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=skCcqIIjztoVbtXxG3qEzRzmN8kZaLooAbtOL8xQJ9A=; b=kpnZEPwOQx38FNJKMC6URdVsJllzmRp6TvBuYKcpGhhflcqTr1kPHmQPavDa2BmyzzOIyNEV
 WUauuccAv1FhViaMG1AlXZZudADEk9vBUAJ0KDb3bgN04wxmG58iDWBWu3MluuPoyMoJFyZw
 roOCnGJujKpveYHqezp2lt7AMgU=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e2c6134.7f0607d6db20-smtp-out-n01;
 Sat, 25 Jan 2020 15:39:32 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CCB22C433A2; Sat, 25 Jan 2020 15:39:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.209.170.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 36334C43383;
        Sat, 25 Jan 2020 15:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 36334C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Add cpuidle low power states
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        swboyd@chromium.org, evgreen@chromium.org, dianders@chromium.org,
        devicetree@vger.kernel.org
References: <1572408318-28681-1-git-send-email-mkshah@codeaurora.org>
 <1572408318-28681-2-git-send-email-mkshah@codeaurora.org>
 <20200121234452.GW89495@google.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <948c046a-5e95-104c-0bc0-f3615edddeca@codeaurora.org>
Date:   Sat, 25 Jan 2020 21:09:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200121234452.GW89495@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias,

Yes, i will post new version very soon.

Thanks,

Maulik


On 1/22/2020 5:14 AM, Matthias Kaehlcke wrote:
> Hi Maulik,
>
> what is the state of this patch? Sudeep and Stephen had comments requesting
> minor changes, do you plan to send a v2 soon?
>
> Thanks
>
> Matthias
>
> On Wed, Oct 30, 2019 at 09:35:18AM +0530, Maulik Shah wrote:
>> Add device bindings for cpuidle states for cpu devices.
>>
>> Cc: devicetree@vger.kernel.org
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sc7180.dtsi | 78 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 78 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index fceac50..69d5e2c 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -70,6 +70,9 @@
>>   			compatible = "arm,armv8";
>>   			reg = <0x0 0x0>;
>>   			enable-method = "psci";
>> +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
>> +					   &LITTLE_CPU_SLEEP_1
>> +					   &CLUSTER_SLEEP_0>;
>>   			next-level-cache = <&L2_0>;
>>   			L2_0: l2-cache {
>>   				compatible = "cache";
>> @@ -85,6 +88,9 @@
>>   			compatible = "arm,armv8";
>>   			reg = <0x0 0x100>;
>>   			enable-method = "psci";
>> +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
>> +					   &LITTLE_CPU_SLEEP_1
>> +					   &CLUSTER_SLEEP_0>;
>>   			next-level-cache = <&L2_100>;
>>   			L2_100: l2-cache {
>>   				compatible = "cache";
>> @@ -97,6 +103,9 @@
>>   			compatible = "arm,armv8";
>>   			reg = <0x0 0x200>;
>>   			enable-method = "psci";
>> +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
>> +					   &LITTLE_CPU_SLEEP_1
>> +					   &CLUSTER_SLEEP_0>;
>>   			next-level-cache = <&L2_200>;
>>   			L2_200: l2-cache {
>>   				compatible = "cache";
>> @@ -109,6 +118,9 @@
>>   			compatible = "arm,armv8";
>>   			reg = <0x0 0x300>;
>>   			enable-method = "psci";
>> +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
>> +					   &LITTLE_CPU_SLEEP_1
>> +					   &CLUSTER_SLEEP_0>;
>>   			next-level-cache = <&L2_300>;
>>   			L2_300: l2-cache {
>>   				compatible = "cache";
>> @@ -121,6 +133,9 @@
>>   			compatible = "arm,armv8";
>>   			reg = <0x0 0x400>;
>>   			enable-method = "psci";
>> +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
>> +					   &LITTLE_CPU_SLEEP_1
>> +					   &CLUSTER_SLEEP_0>;
>>   			next-level-cache = <&L2_400>;
>>   			L2_400: l2-cache {
>>   				compatible = "cache";
>> @@ -133,6 +148,9 @@
>>   			compatible = "arm,armv8";
>>   			reg = <0x0 0x500>;
>>   			enable-method = "psci";
>> +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
>> +					   &LITTLE_CPU_SLEEP_1
>> +					   &CLUSTER_SLEEP_0>;
>>   			next-level-cache = <&L2_500>;
>>   			L2_500: l2-cache {
>>   				compatible = "cache";
>> @@ -145,6 +163,9 @@
>>   			compatible = "arm,armv8";
>>   			reg = <0x0 0x600>;
>>   			enable-method = "psci";
>> +			cpu-idle-states = <&BIG_CPU_SLEEP_0
>> +					   &BIG_CPU_SLEEP_1
>> +					   &CLUSTER_SLEEP_0>;
>>   			next-level-cache = <&L2_600>;
>>   			L2_600: l2-cache {
>>   				compatible = "cache";
>> @@ -157,12 +178,69 @@
>>   			compatible = "arm,armv8";
>>   			reg = <0x0 0x700>;
>>   			enable-method = "psci";
>> +			cpu-idle-states = <&BIG_CPU_SLEEP_0
>> +					   &BIG_CPU_SLEEP_1
>> +					   &CLUSTER_SLEEP_0>;
>>   			next-level-cache = <&L2_700>;
>>   			L2_700: l2-cache {
>>   				compatible = "cache";
>>   				next-level-cache = <&L3_0>;
>>   			};
>>   		};
>> +
>> +		idle-states {
>> +			entry-method = "psci";
>> +
>> +			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
>> +				compatible = "arm,idle-state";
>> +				idle-state-name = "little-power-down";
>> +				arm,psci-suspend-param = <0x40000003>;
>> +				entry-latency-us = <350>;
>> +				exit-latency-us = <461>;
>> +				min-residency-us = <1890>;
>> +				local-timer-stop;
>> +			};
>> +
>> +			LITTLE_CPU_SLEEP_1: cpu-sleep-0-1 {
>> +				compatible = "arm,idle-state";
>> +				idle-state-name = "little-rail-power-down";
>> +				arm,psci-suspend-param = <0x40000004>;
>> +				entry-latency-us = <360>;
>> +				exit-latency-us = <531>;
>> +				min-residency-us = <3934>;
>> +				local-timer-stop;
>> +			};
>> +
>> +			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
>> +				compatible = "arm,idle-state";
>> +				idle-state-name = "big-power-down";
>> +				arm,psci-suspend-param = <0x40000003>;
>> +				entry-latency-us = <264>;
>> +				exit-latency-us = <621>;
>> +				min-residency-us = <952>;
>> +				local-timer-stop;
>> +			};
>> +
>> +			BIG_CPU_SLEEP_1: cpu-sleep-1-1 {
>> +				compatible = "arm,idle-state";
>> +				idle-state-name = "big-rail-power-down";
>> +				arm,psci-suspend-param = <0x40000004>;
>> +				entry-latency-us = <702>;
>> +				exit-latency-us = <1061>;
>> +				min-residency-us = <4488>;
>> +				local-timer-stop;
>> +			};
>> +
>> +			CLUSTER_SLEEP_0: cluster-sleep-0 {
>> +				compatible = "arm,idle-state";
>> +				idle-state-name = "cluster-power-down";
>> +				arm,psci-suspend-param = <0x400000F4>;
>> +				entry-latency-us = <3263>;
>> +				exit-latency-us = <6562>;
>> +				min-residency-us = <9987>;
>> +				local-timer-stop;
>> +			};
>> +		};
>>   	};
>>   
>>   	memory@80000000 {
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation
>>
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
