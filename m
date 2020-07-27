Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9827F22E613
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jul 2020 08:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbgG0GvH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 02:51:07 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:58065 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726270AbgG0GvG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 02:51:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595832664; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=NZJVjYhVsFEASgD9T7lU7RM9AwnOeyEC5q0Uw50tNJ4=;
 b=JysotARB/reul7PGShxTLageak5DsuOj1NHaTavmRJ8OHR5II23t44vkiY5mMpCIATS0aLHZ
 s6FLMiBomuTGyO1NQH+NwOsfrQMBoOni2YmoLf8JxY4B5OHi5jW6ncRP0LbhfKWIG/RmnLk5
 ML67pOC6QNiK8TVQMN4FCZO8kvk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n19.prod.us-east-1.postgun.com with SMTP id
 5f1e7940a61bb9e3f52225b8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 27 Jul 2020 06:50:40
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4E8AAC433C6; Mon, 27 Jul 2020 06:50:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sbhanu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7C5A3C433C9;
        Mon, 27 Jul 2020 06:50:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 27 Jul 2020 12:20:38 +0530
From:   sbhanu@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, rnayak@codeaurora.org,
        Pradeep P V K <ppvk@codeaurora.org>,
        devicetree-owner@vger.kernel.org
Subject: Re: [PATCH V2] arm64: dts: qcom: sc7180: Add bandwidth votes for eMMC
 and SDcard
In-Reply-To: <20200724171018.GZ3191083@google.com>
References: <1595328381-29552-1-git-send-email-sbhanu@codeaurora.org>
 <20200724171018.GZ3191083@google.com>
Message-ID: <7ffcb56e9e6723f4bae687e0f491cb93@codeaurora.org>
X-Sender: sbhanu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-07-24 22:40, Matthias Kaehlcke wrote:
> Hi Shaik,
> 
> On Tue, Jul 21, 2020 at 04:16:21PM +0530, Shaik Sajida Bhanu wrote:
>> From: Pradeep P V K <ppvk@codeaurora.org>
>> 
>> Add the bandwidth domain supporting performance state and
>> the corresponding OPP tables for the sdhc device on sc7180.
>> 
>> Signed-off-by: Pradeep P V K <ppvk@codeaurora.org>
>> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
>> ---
>> 
>> Changes since V1:
>> 	- Incorporated review comments by Bjorn Andersson.
>> ---
>>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index 68f9894..d78a066 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -684,6 +684,9 @@
>>  			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
>>  					<&gcc GCC_SDCC1_AHB_CLK>;
>>  			clock-names = "core", "iface";
>> +			interconnects = <&aggre1_noc MASTER_EMMC &mc_virt SLAVE_EBI1>,
>> +				<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_EMMC_CFG>;
>> +			interconnect-names = "sdhc-ddr","cpu-sdhc";
>>  			power-domains = <&rpmhpd SC7180_CX>;
>>  			operating-points-v2 = <&sdhc1_opp_table>;
>> 
>> @@ -704,11 +707,15 @@
>>  				opp-100000000 {
>>  					opp-hz = /bits/ 64 <100000000>;
>>  					required-opps = <&rpmhpd_opp_low_svs>;
>> +					opp-peak-kBps = <100000 100000>;
>> +					opp-avg-kBps = <100000 50000>;
>>  				};
>> 
>>  				opp-384000000 {
>>  					opp-hz = /bits/ 64 <384000000>;
>>  					required-opps = <&rpmhpd_opp_svs_l1>;
>> +					opp-peak-kBps = <600000 900000>;
>> +					opp-avg-kBps = <261438 300000>;
>>  				};
>>  			};
>>  		};
>> @@ -2476,6 +2483,10 @@
>>  			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
>>  					<&gcc GCC_SDCC2_AHB_CLK>;
>>  			clock-names = "core", "iface";
>> +
>> +			interconnects = <&aggre1_noc MASTER_SDCC_2 &mc_virt SLAVE_EBI1>,
>> +				<&gem_noc MASTER_APPSS_PROC &config_noc	SLAVE_SDCC_2>;
>> +			interconnect-names = "sdhc-ddr","cpu-sdhc";
>>  			power-domains = <&rpmhpd SC7180_CX>;
>>  			operating-points-v2 = <&sdhc2_opp_table>;
>> 
>> @@ -2489,11 +2500,15 @@
>>  				opp-100000000 {
>>  					opp-hz = /bits/ 64 <100000000>;
>>  					required-opps = <&rpmhpd_opp_low_svs>;
>> +					opp-peak-kBps = <160000 100000>;
>> +					opp-avg-kBps = <80000 50000>;
>>  				};
>> 
>>  				opp-202000000 {
>>  					opp-hz = /bits/ 64 <202000000>;
>>  					required-opps = <&rpmhpd_opp_svs_l1>;
>> +					opp-peak-kBps = <200000	120000>;
>> +					opp-avg-kBps = <100000 60000>;
>>  				};
>>  			};
>>  		};
> 
> Does the sdhci-msm driver actually have BW scaling support at this 
> point?
> 

yes

> There is commit 4ece9795be56 ("mmc: sdhci-msm: Add interconnect
> bandwidth scaling support"), whose commit message says "make sure
> interconnect driver is ready before handling interconnect scaling.".
> 
> I haven't seen any patch adding the scaling support (supposedly by
> adding dev_pm_opp_set_bw() calls?). Did I miss it? If not it seems
> it would make sense to post it in a series together with this patch,
> as far as I can tell this patch alone does nothing in practical terms.
> 
> grep sdhc /sys/kernel/debug/interconnect/interconnect_summary
>   8804000.sdhci                          0            0            0
>   7c4000.sdhci                           0            0            0
>   7c4000.sdhci                           0            0            0
>   8804000.sdhci                          0            0            0
>   ...

"mmc: sdhci-msm: Use OPP API to set clk/perf 
state"(https://lkml.org/lkml/2020/4/8/425) and "mmc: sdhci-msm: Add 
interconnect bandwidth scaling 
support"(https://lkml.org/lkml/2020/3/12/60) with these two patches 
scaling will be supported for sdhci-msm driver.

the values  in  grep sdhc 
/sys/kernel/debug/interconnect/interconnect_summary will be zero during 
device is in suspend state... and the values in  grep sdhc 
/sys/kernel/debug/interconnect/interconnect_summary during device in 
resume state will be like the following::

cicalhost / # cat /sys/kernel/debug/interconnect/interconnect_summary | 
grep sdh
   8804000.sdhci                          0        60000       120000
   7c4000.sdhci                           0       300000       900000
   7c4000.sdhci                           0       300000       900000
   8804000.sdhci                          0        60000       120000
   8804000.sdhci                          0       100000       200000
   7c4000.sdhci                           0       261438       600000
   8804000.sdhci                          0        60000       120000

