Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5796116F32
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2019 15:41:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727472AbfLIOlB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Dec 2019 09:41:01 -0500
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55]:53264
        "EHLO a27-55.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726687AbfLIOlB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Dec 2019 09:41:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575902460;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=FwsTN1S8xTUtsKIR4+YjOOPQ4UCSIVoYV0o+74vu/E8=;
        b=F3cBvfzc2ApvC/q5bwfcQyj43+Tj+eIRKEaChXmnVPxJwVJ2c7749NjFbnUH/PDV
        LwoNJjbCLyld1jKm9aqezrn+Omzi+5kJrwsVCJZi//xcrsAR3YQbQp9le2/8qY1xCgd
        HCT0I1LWaOFfa32QkYq4oGUj69Y1qidZ9kjuuRAI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575902460;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=FwsTN1S8xTUtsKIR4+YjOOPQ4UCSIVoYV0o+74vu/E8=;
        b=T+0Or8QKRoFZbmCUBxgGRmn4/i55zayvWHGVRERk6T4dcMJUg+Isihj6UsyKYtwu
        XLMMZePW++nPjIjkkuhMxfIg2jO5913lLuHYVs6iOINfG5AHCaYAEZrNC5Hr3Ifi1Wv
        ADDbOWgMZq2Sc76xzwFGIc1mNVEe+1cICCyKEAlI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Mon, 9 Dec 2019 14:41:00 +0000
From:   ppvk@codeaurora.org
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     adrian.hunter@intel.com, robh+dt@kernel.org,
        ulf.hansson@linaro.org, asutoshd@codeaurora.org,
        vbadigan@codeaurora.org, stummala@codeaurora.org,
        sayalil@codeaurora.org, rampraka@codeaurora.org, sboyd@kernel.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, linux-mmc-owner@vger.kernel.org
Subject: Re: [RFC-v2 1/2] dt-bindings: mmc: sdhci-msm: Add Bus BW vote
 supported strings
In-Reply-To: <8d7f2a2f-1312-8983-4e58-80dc6939154c@linaro.org>
References: <1573220319-4287-1-git-send-email-ppvk@codeaurora.org>
 <1573220319-4287-2-git-send-email-ppvk@codeaurora.org>
 <8d7f2a2f-1312-8983-4e58-80dc6939154c@linaro.org>
Message-ID: <0101016eeb1b3894-fc246837-27f4-447b-b37a-6bc4dd1893dc-000000@us-west-2.amazonses.com>
X-Sender: ppvk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2019.12.09-54.240.27.55
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-11-13 18:46, Georgi Djakov wrote:
> Hi Pradeep,
> 
> Thanks for the patch!
> 
> On 8.11.19 г. 15:38 ч., Pradeep P V K wrote:
>> Add Bus bandwidth voting supported strings for qcom-sdhci controller.
>> 
>> Signed-off-by: Pradeep P V K <ppvk@codeaurora.org>
>> ---
>>  .../devicetree/bindings/mmc/sdhci-msm.txt          | 32 
>> ++++++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt 
>> b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
>> index da4edb1..22fb140 100644
>> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
>> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
>> @@ -39,6 +39,25 @@ Required properties:
>>  	"cal"	- reference clock for RCLK delay calibration (optional)
>>  	"sleep"	- sleep clock for RCLK delay calibration (optional)
>> 
>> +Optional Properties:
>> +* Following bus parameters are required for bus bw voting:
> 
> "bus bw voting" sounds a bit vague to me. I would say instead:
> 
> The following DT properties are required for interconnect bandwidth 
> scaling.
> 
  Thanks for the review. I will address this in my next patch set.

>> +- interconnects: Pairs of phandles and interconnect provider 
>> specifier
>> +		 to denote the edge source and destination ports of
>> +		 the interconnect path. Please refer to
>> +		 Documentation/devicetree/bindings/interconnect/
>> +		 for more details.
>> +- interconnect-names: List of interconnect path name strings sorted 
>> in the same
>> +		order as the interconnects property. Consumers drivers will use
>> +		interconnect-names to match interconnect paths with interconnect
>> +		specifiers. Please refer to Documentation/devicetree/bindings/
>> +		interconnect/ for more details.
> 
> Please describe here what there are two paths are for sdhc and how they 
> are
> expected to be named. You already responded to this question, so please 
> include
> this information here.
> Hint: Refer to the Documentation for how we described it for other 
> subsystems.
> 
ok. I will address in my next patch set.

>> +- msm-bus,name: string describing the bus path
>> +- msm-bus,num-cases: number of configurations in which sdhc can 
>> operate in
>> +- msm-bus,num-paths: number of paths to vote for
>> +- msm-bus,vectors-KBps: Takes a tuple <ib ab>, <ib ab> (2 tuples for 
>> 2
>> +				num-paths) The number of these entries *must*
>> +				be same as num-cases.
> 
> If it has to be in DT, could we use this [1] instead of the above? The 
> patches
> are not merged yet, but this might be the direction we want to go.
> 
> Thanks,
> Georgi
> 
> [1] 
> http://lore.kernel.org/r/20190807223111.230846-1-saravanak@google.com
> 

Sure, i will make the change based on [1] in my next patch set.

>> +
>>  Example:
>> 
>>  	sdhc_1: sdhci@f9824900 {
>> @@ -56,6 +75,19 @@ Example:
>> 
>>  		clocks = <&gcc GCC_SDCC1_APPS_CLK>, <&gcc GCC_SDCC1_AHB_CLK>;
>>  		clock-names = "core", "iface";
>> +		interconnects = <&qnoc 50 &qnoc 512>,
>> +				<&qnoc 1 &qnoc 544>;
>> +		interconnect-names = "sdhc-ddr","cpu-sdhc";
>> +		msm-bus,name = "sdhc1";
>> +		msm-bus,num-cases = <3>;
>> +		msm-bus,num-paths = <2>;
>> +		msm-bus,vectors-KBps =
>> +		/* No Vote */
>> +		<0 0>, <0 0>,
>> +		/* 50 MB/s */
>> +		<130718 200000>, <133320 133320>,
>> +		/* 200 MB/s */
>> +		<1338562 4096000>, <1338562 4096000>;
>>  	};
>> 
>>  	sdhc_2: sdhci@f98a4900 {
>> 
