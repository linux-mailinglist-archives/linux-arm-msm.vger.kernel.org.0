Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC0083FE88A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Sep 2021 06:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233293AbhIBE03 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Sep 2021 00:26:29 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:60919 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229639AbhIBE02 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Sep 2021 00:26:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630556731; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=47uVus/VpOxPsQQSLX2hDTAuxB4AXs1JINYnGygzRGc=; b=nYCJFTvzsPimiPQROE7wkXZoEousqVdQRu6vxoUb/euQIfcpbFSQbT7Qn+AOarmLcT2KvbJq
 bhf88zjSLKkQdchUvGdQYyfNKDzsnk+27eXgZX6yAjp28O8SmwQG3/JQRA7bZXhExol1xTKR
 twevGRvD7nCOvEL1P3M2ovMck/8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6130522b40d2129ac120082e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 02 Sep 2021 04:25:15
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 56F8CC4360D; Thu,  2 Sep 2021 04:25:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.100] (unknown [49.207.193.119])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 023C7C4338F;
        Thu,  2 Sep 2021 04:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 023C7C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Base dynamic CPU power
 coefficients in reality
To:     Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mka@chromium.org, swboyd@chromium.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210830135904.1.I049b30065f3c715234b6303f55d72c059c8625eb@changeid>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <0a865b6e-be34-6371-f9f2-9913ee1c5608@codeaurora.org>
Date:   Thu, 2 Sep 2021 09:55:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210830135904.1.I049b30065f3c715234b6303f55d72c059c8625eb@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Doug,

On 8/31/2021 2:29 AM, Douglas Anderson wrote:
> The sc7180's dynamic-power-coefficient violates the device tree bindings.
> The bindings (arm/cpus.yaml) say that the units for the
> dynamic-power-coefficient are supposed to be "uW/MHz/V^2". The ones for
> sc7180 aren't this. Qualcomm arbitrarily picked 100 for the "little" CPUs
> and then picked a number for the big CPU based on this.
> 
> At the time, there was a giant dicussion about this. Apparently Qualcomm
> Engineers were instructed not to share the actual numbers here. As part
> of the discussion, I pointed out [1] that these numbers shouldn't really
> be secret since once a device is shipping anyone can just run a script
> and produce them. This patch is the result of running the script I posted
> in that discussion on sc7180-trogdor-coachz, which is currently available
> for purchase by consumers.
> 
> [1] https://lore.kernel.org/r/CAD=FV=U1FP0e3_AVHpauUUZtD-5X3XCwh5aT9fH_8S_FFML2Uw@mail.gmail.com/
> 
> I ran the script four times, measuring little, big, little, big. I used
> the 64-bit version of dhrystone 2.2 in my test. I got these results:
> 
> 576 kHz, 596 mV, 20 mW, 88 Cx
> 768 kHz, 596 mV, 32 mW, 122 Cx
> 1017 kHz, 660 mV, 45 mW, 97 Cx
> 1248 kHz, 720 mV, 87 mW, 139 Cx
> 1324 kHz, 756 mV, 109 mW, 148 Cx
> 1516 kHz, 828 mV, 150 mW, 148 Cx
> 1612 kHz, 884 mV, 182 mW, 147 Cx
> 1708 kHz, 884 mV, 192 mW, 146 Cx
> 1804 kHz, 884 mV, 207 mW, 149 Cx
> Your dynamic-power-coefficient for cpu 0: 132
> 
> 825 kHz, 596 mV, 142 mW, 401 Cx
> 979 kHz, 628 mV, 183 mW, 427 Cx
> 1113 kHz, 656 mV, 224 mW, 433 Cx
> 1267 kHz, 688 mV, 282 mW, 449 Cx
> 1555 kHz, 812 mV, 475 mW, 450 Cx
> 1708 kHz, 828 mV, 566 mW, 478 Cx
> 1843 kHz, 884 mV, 692 mW, 476 Cx
> 1900 kHz, 884 mV, 722 mW, 482 Cx
> 1996 kHz, 916 mV, 814 mW, 482 Cx
> 2112 kHz, 916 mV, 862 mW, 483 Cx
> 2208 kHz, 916 mV, 962 mW, 521 Cx
> 2323 kHz, 940 mV, 1060 mW, 517 Cx
> 2400 kHz, 956 mV, 1133 mW, 518 Cx
> Your dynamic-power-coefficient for cpu 6: 471
> 
> 576 kHz, 596 mV, 26 mW, 103 Cx
> 768 kHz, 596 mV, 40 mW, 147 Cx
> 1017 kHz, 660 mV, 54 mW, 114 Cx
> 1248 kHz, 720 mV, 97 mW, 151 Cx
> 1324 kHz, 756 mV, 113 mW, 150 Cx
> 1516 kHz, 828 mV, 154 mW, 148 Cx
> 1612 kHz, 884 mV, 194 mW, 155 Cx
> 1708 kHz, 884 mV, 203 mW, 152 Cx
> 1804 kHz, 884 mV, 219 mW, 155 Cx
> Your dynamic-power-coefficient for cpu 0: 142
> 
> 825 kHz, 596 mV, 148 mW, 530 Cx
> 979 kHz, 628 mV, 189 mW, 475 Cx
> 1113 kHz, 656 mV, 230 mW, 461 Cx
> 1267 kHz, 688 mV, 287 mW, 466 Cx
> 1555 kHz, 812 mV, 469 mW, 445 Cx
> 1708 kHz, 828 mV, 567 mW, 480 Cx
> 1843 kHz, 884 mV, 699 mW, 482 Cx
> 1900 kHz, 884 mV, 719 mW, 480 Cx
> 1996 kHz, 916 mV, 814 mW, 484 Cx
> 2112 kHz, 916 mV, 861 mW, 483 Cx
> 2208 kHz, 916 mV, 963 mW, 522 Cx
> 2323 kHz, 940 mV, 1063 mW, 520 Cx
> 2400 kHz, 956 mV, 1135 mW, 519 Cx
> Your dynamic-power-coefficient for cpu 6: 489
> 
> As you can see, the calculations aren't perfectly consistent but
> roughly you could say about 480 for big and 137 for little.
> 
> The ratio between these numbers isn't quite the same as the
> ratio between the two numbers that Qualcomm used. Presumably
> this is because Qualcomm measured something slightly different
> than the 64-bit version of dhrystone 2.2, though it might also
> be that they fudged the numbers a little. In any case, these
> numbers don't need to be perfectly exact. In fact, they can't
> be since the CPU power depends a lot on what's being run on
> the CPU and the big/little CPUs are each more or less efficient
> in different operations. Historically running the 32-bit vs.
> 64-bit versions of dhrystone produced notably different numbers,
> though I didn't test this time. In any case, let's keep the
> existing ratio but scale it based on the above so we're at

I am not sure that's really needed, we could perhaps go with the
new ratios that you got, since the existing ratios are perhaps
tuned (more usecases run than just dhrystone) for the downstream
Android scheduler.
One other thing that's perhaps tuned is the capacity-dmips-mhz,
and if the same argument applies to that (that they can't be
scaled and need to be measured with just dhrystone)
then those might need an update along with this as well, else it
just throws the power/perf balance out.

thanks,
Rajendra

> least _somewhat_ based in the correct units. I'll pick:
> * little: 130
> * big:    527
> ...which basically means we're scaling the old numbers by 30%.
> 
> We also need to scale all of the sustainable-power numbers by
> the same amount.
> 
> Fixes: 71f873169a80 ("arm64: dts: qcom: sc7180: Add dynamic CPU power coefficients")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>   .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  |  2 +-
>   .../boot/dts/qcom/sc7180-trogdor-pompom.dtsi  |  8 ++---
>   arch/arm64/boot/dts/qcom/sc7180.dtsi          | 36 +++++++++----------
>   3 files changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> index a758e4d22612..4ba687dc850f 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
> @@ -33,7 +33,7 @@ skin_temp_thermal: skin-temp-thermal {
>   			polling-delay = <0>;
>   
>   			thermal-sensors = <&pm6150_adc_tm 1>;
> -			sustainable-power = <814>;
> +			sustainable-power = <1058>;
>   
>   			trips {
>   				skin_temp_alert0: trip-point0 {
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
> index a246dbd74cc1..e066bce768c7 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
> @@ -44,7 +44,7 @@ &cpu6_alert1 {
>   };
>   
>   &cpu6_thermal {
> -	sustainable-power = <948>;
> +	sustainable-power = <1232>;
>   };
>   
>   &cpu7_alert0 {
> @@ -56,7 +56,7 @@ &cpu7_alert1 {
>   };
>   
>   &cpu7_thermal {
> -	sustainable-power = <948>;
> +	sustainable-power = <1232>;
>   };
>   
>   &cpu8_alert0 {
> @@ -68,7 +68,7 @@ &cpu8_alert1 {
>   };
>   
>   &cpu8_thermal {
> -	sustainable-power = <948>;
> +	sustainable-power = <1232>;
>   };
>   
>   &cpu9_alert0 {
> @@ -80,7 +80,7 @@ &cpu9_alert1 {
>   };
>   
>   &cpu9_thermal {
> -	sustainable-power = <948>;
> +	sustainable-power = <1232>;
>   };
>   
>   &gpio_keys {
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 47b20ba69057..e2c92dae580a 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -138,7 +138,7 @@ CPU0: cpu@0 {
>   					   &LITTLE_CPU_SLEEP_1
>   					   &CLUSTER_SLEEP_0>;
>   			capacity-dmips-mhz = <1024>;
> -			dynamic-power-coefficient = <100>;
> +			dynamic-power-coefficient = <130>;
>   			operating-points-v2 = <&cpu0_opp_table>;
>   			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
>   					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
> @@ -163,7 +163,7 @@ CPU1: cpu@100 {
>   					   &LITTLE_CPU_SLEEP_1
>   					   &CLUSTER_SLEEP_0>;
>   			capacity-dmips-mhz = <1024>;
> -			dynamic-power-coefficient = <100>;
> +			dynamic-power-coefficient = <130>;
>   			next-level-cache = <&L2_100>;
>   			operating-points-v2 = <&cpu0_opp_table>;
>   			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
> @@ -185,7 +185,7 @@ CPU2: cpu@200 {
>   					   &LITTLE_CPU_SLEEP_1
>   					   &CLUSTER_SLEEP_0>;
>   			capacity-dmips-mhz = <1024>;
> -			dynamic-power-coefficient = <100>;
> +			dynamic-power-coefficient = <130>;
>   			next-level-cache = <&L2_200>;
>   			operating-points-v2 = <&cpu0_opp_table>;
>   			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
> @@ -207,7 +207,7 @@ CPU3: cpu@300 {
>   					   &LITTLE_CPU_SLEEP_1
>   					   &CLUSTER_SLEEP_0>;
>   			capacity-dmips-mhz = <1024>;
> -			dynamic-power-coefficient = <100>;
> +			dynamic-power-coefficient = <130>;
>   			next-level-cache = <&L2_300>;
>   			operating-points-v2 = <&cpu0_opp_table>;
>   			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
> @@ -229,7 +229,7 @@ CPU4: cpu@400 {
>   					   &LITTLE_CPU_SLEEP_1
>   					   &CLUSTER_SLEEP_0>;
>   			capacity-dmips-mhz = <1024>;
> -			dynamic-power-coefficient = <100>;
> +			dynamic-power-coefficient = <130>;
>   			next-level-cache = <&L2_400>;
>   			operating-points-v2 = <&cpu0_opp_table>;
>   			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
> @@ -251,7 +251,7 @@ CPU5: cpu@500 {
>   					   &LITTLE_CPU_SLEEP_1
>   					   &CLUSTER_SLEEP_0>;
>   			capacity-dmips-mhz = <1024>;
> -			dynamic-power-coefficient = <100>;
> +			dynamic-power-coefficient = <130>;
>   			next-level-cache = <&L2_500>;
>   			operating-points-v2 = <&cpu0_opp_table>;
>   			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
> @@ -273,7 +273,7 @@ CPU6: cpu@600 {
>   					   &BIG_CPU_SLEEP_1
>   					   &CLUSTER_SLEEP_0>;
>   			capacity-dmips-mhz = <1740>;
> -			dynamic-power-coefficient = <405>;
> +			dynamic-power-coefficient = <527>;
>   			next-level-cache = <&L2_600>;
>   			operating-points-v2 = <&cpu6_opp_table>;
>   			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
> @@ -295,7 +295,7 @@ CPU7: cpu@700 {
>   					   &BIG_CPU_SLEEP_1
>   					   &CLUSTER_SLEEP_0>;
>   			capacity-dmips-mhz = <1740>;
> -			dynamic-power-coefficient = <405>;
> +			dynamic-power-coefficient = <527>;
>   			next-level-cache = <&L2_700>;
>   			operating-points-v2 = <&cpu6_opp_table>;
>   			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &mc_virt SLAVE_EBI1 3>,
> @@ -3592,7 +3592,7 @@ cpu0_thermal: cpu0-thermal {
>   			polling-delay = <0>;
>   
>   			thermal-sensors = <&tsens0 1>;
> -			sustainable-power = <768>;
> +			sustainable-power = <998>;
>   
>   			trips {
>   				cpu0_alert0: trip-point0 {
> @@ -3641,7 +3641,7 @@ cpu1_thermal: cpu1-thermal {
>   			polling-delay = <0>;
>   
>   			thermal-sensors = <&tsens0 2>;
> -			sustainable-power = <768>;
> +			sustainable-power = <998>;
>   
>   			trips {
>   				cpu1_alert0: trip-point0 {
> @@ -3690,7 +3690,7 @@ cpu2_thermal: cpu2-thermal {
>   			polling-delay = <0>;
>   
>   			thermal-sensors = <&tsens0 3>;
> -			sustainable-power = <768>;
> +			sustainable-power = <998>;
>   
>   			trips {
>   				cpu2_alert0: trip-point0 {
> @@ -3739,7 +3739,7 @@ cpu3_thermal: cpu3-thermal {
>   			polling-delay = <0>;
>   
>   			thermal-sensors = <&tsens0 4>;
> -			sustainable-power = <768>;
> +			sustainable-power = <998>;
>   
>   			trips {
>   				cpu3_alert0: trip-point0 {
> @@ -3788,7 +3788,7 @@ cpu4_thermal: cpu4-thermal {
>   			polling-delay = <0>;
>   
>   			thermal-sensors = <&tsens0 5>;
> -			sustainable-power = <768>;
> +			sustainable-power = <998>;
>   
>   			trips {
>   				cpu4_alert0: trip-point0 {
> @@ -3837,7 +3837,7 @@ cpu5_thermal: cpu5-thermal {
>   			polling-delay = <0>;
>   
>   			thermal-sensors = <&tsens0 6>;
> -			sustainable-power = <768>;
> +			sustainable-power = <998>;
>   
>   			trips {
>   				cpu5_alert0: trip-point0 {
> @@ -3886,7 +3886,7 @@ cpu6_thermal: cpu6-thermal {
>   			polling-delay = <0>;
>   
>   			thermal-sensors = <&tsens0 9>;
> -			sustainable-power = <1202>;
> +			sustainable-power = <1563>;
>   
>   			trips {
>   				cpu6_alert0: trip-point0 {
> @@ -3927,7 +3927,7 @@ cpu7_thermal: cpu7-thermal {
>   			polling-delay = <0>;
>   
>   			thermal-sensors = <&tsens0 10>;
> -			sustainable-power = <1202>;
> +			sustainable-power = <1563>;
>   
>   			trips {
>   				cpu7_alert0: trip-point0 {
> @@ -3968,7 +3968,7 @@ cpu8_thermal: cpu8-thermal {
>   			polling-delay = <0>;
>   
>   			thermal-sensors = <&tsens0 11>;
> -			sustainable-power = <1202>;
> +			sustainable-power = <1563>;
>   
>   			trips {
>   				cpu8_alert0: trip-point0 {
> @@ -4009,7 +4009,7 @@ cpu9_thermal: cpu9-thermal {
>   			polling-delay = <0>;
>   
>   			thermal-sensors = <&tsens0 12>;
> -			sustainable-power = <1202>;
> +			sustainable-power = <1563>;
>   
>   			trips {
>   				cpu9_alert0: trip-point0 {
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
