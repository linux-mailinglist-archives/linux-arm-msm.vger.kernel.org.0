Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37E3EC235A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Sep 2019 16:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731459AbfI3OcW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Sep 2019 10:32:22 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:52578 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbfI3OcW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Sep 2019 10:32:22 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 88C1C61156; Mon, 30 Sep 2019 14:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569853940;
        bh=27oTolUn8I14Ygh/14k2Slwwxq1tVdhkDg1GGep9/tc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=bkeGwARc9alvIMfafDKup75VaICLhVuLSRWU8zUE+Yc8T8Jz4pVbfUaAShzGrRdG6
         VVTIbb1TzS6hMLKeh1aXnPboNz7xFtVq0dntOL9cne8PS8uE7JuiyZgsN/ahW1XUbJ
         GvfxwgyUDc7iJZMlbBq6kuCwZau1sE4mFIn9E23o=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 643506013C;
        Mon, 30 Sep 2019 14:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569853939;
        bh=27oTolUn8I14Ygh/14k2Slwwxq1tVdhkDg1GGep9/tc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MJTnjXOrIVRsa9dWFxeFN+qv8EfRfNsmzuJVe7BTB3q4VuqWZyLUDVU1yZalqTmFO
         c3D6DHFYggnTQA7veYp6fHPzkYYdx4TPhh7srH0v49nDGBF0CB2sOQd9p9d24QVsMy
         YJIhQV24Mj7AcAYVcBLjRw39Sxay2frELShTH6fU=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 30 Sep 2019 20:02:19 +0530
From:   ppvk@codeaurora.org
To:     Rob Herring <robh@kernel.org>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        asutoshd@codeaurora.org, vbadigan@codeaurora.org,
        stummala@codeaurora.org, sayalil@codeaurora.org,
        rampraka@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [RFC 2/2] dt-bindings: mmc: sdhci-msm: Add Bus BW vote supported
 strings
In-Reply-To: <5d7ba95c.1c69fb81.edf8e.6556@mx.google.com>
References: <1567774037-2344-1-git-send-email-ppvk@codeaurora.org>
 <1567774037-2344-3-git-send-email-ppvk@codeaurora.org>
 <5d7ba95c.1c69fb81.edf8e.6556@mx.google.com>
Message-ID: <695802ae255fe40ab9ca7750e0bbed91@codeaurora.org>
X-Sender: ppvk@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-09-13 20:06, Rob Herring wrote:
> On Fri, Sep 06, 2019 at 06:17:17PM +0530, Pradeep P V K wrote:
>> Add Bus bandwidth voting supported strings for qcom-sdhci controller.
> 
> What is bus bandwidth voting?

Controller is connected with its master using NOC and it controls its 
slaves using another NOC path.
So,controller have 2 NOC paths as below.
     a. CPU to Controller, This path is used to access the registers of 
controllers.
     b. Controller to DDR, This path is a data path, where data is 
read/write from/to DDR.
All data transfer will happen on these NOC's, which is shared between 
other peripherals.
In order to achieve required throughput (Data transfer Bandwidth) we put 
vote on these NOC's to
scale the NOC clocks to support required bandwidth.

Instantaneous bandwidth (ib) and Arbitrated bandwidth (ab) values are 
the values calculated (This involves various arch. specific parameters
like clock plans, voltage corners, etc. which varies from vendor to 
vendor and target to target)
to put vote on those noc's to achieve require throughput.

> 
>> 
>> Signed-off-by: Pradeep P V K <ppvk@codeaurora.org>
>> ---
>>  .../devicetree/bindings/mmc/sdhci-msm.txt          | 32 
>> ++++++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt 
>> b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
>> index da4edb1..8255d92 100644
>> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
>> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.txt
>> @@ -39,6 +39,25 @@ Required properties:
>>  	"cal"	- reference clock for RCLK delay calibration (optional)
>>  	"sleep"	- sleep clock for RCLK delay calibration (optional)
>> 
>> +Optional Properties:
>> +* Following bus parameters are required for bus bw voting:
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
> How many? What are the strings?

As this is implemented using interconnect framework, "interconnects" and 
"interconnect-names" are required
and below qcom specific properties are required to calculate the ab and 
ib values.
> 
>> +- qcom,msm-bus,name: string describing the bus path
>> +- qcom,msm-bus,num-cases: number of configurations in which sdhc can 
>> operate in
>> +- qcom,msm-bus,num-paths: number of paths to vote for
>> +- qcom,msm-bus,vectors-KBps: Takes a tuple <ib ab>, <ib ab> (2 tuples 
>> for 2
> 
> ib and ab are what? Didn't we just add interconnect bindings for
> expressing bandwidth?

Instantaneous bandwidth (ib) is peak bandwidth and Arbitrated bandwidth 
(ab) is the Average bandwidth.
There is no interconnect binding node as such for expressing the 
bandwidth. Hence the reason to use the
above qcom nodes for parsing and storing the req. bandwidth.

> 
>> +				num-paths) The number of these entries *must*
>> +				be same as num-cases.
> 
> Are all these properties SDHCI specific or can we expect to get these
> for *all* the QCom blocks?
> 
As per the current implementation, these are some optional properties 
and is required
only when the bus bandwidth support is needed and all these are qcom 
specific.

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
>> +		qcom,msm-bus,name = "sdhc1";
>> +		qcom,msm-bus,num-cases = <3>;
>> +		qcom,msm-bus,num-paths = <2>;
>> +		qcom,msm-bus,vectors-KBps =
>> +		/* No Vote */
>> +		<0 0>, <0 0>,
>> +		/* 50 MB/s */
>> +		<130718 200000>, <133320 133320>,
>> +		/* 200 MB/s */
>> +		<1338562 4096000>, <1338562 4096000>;
>>  	};
>> 
>>  	sdhc_2: sdhci@f98a4900 {
>> --
>> 1.9.1
>> 
