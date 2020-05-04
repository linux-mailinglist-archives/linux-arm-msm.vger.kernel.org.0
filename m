Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 313A31C327E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2020 08:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726404AbgEDGPI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 May 2020 02:15:08 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:31111 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726410AbgEDGPI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 May 2020 02:15:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588572907; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=i7iQj9o0ySk1sX74mTJNhUkqJlEGwuoDp1GH+9bfS5w=; b=WCo2lAGmaEkKXMMjx0s/syUupZL/u7bHHfF7bdPATYn9YRPLpOpApWZ610J0ta86ATz42CSF
 75Zhywm2tZRAw6MoUMPr25bVNOax8Vwrx11WZNq8fFPymUuvQHi8w4yiMeBTjwsc2eSkmiLI
 9VtjjpJMtY7H/7v2SY3Ine9yH4s=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eafb2e2.7f25765970d8-smtp-out-n01;
 Mon, 04 May 2020 06:14:58 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 63A2DC432C2; Mon,  4 May 2020 06:14:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.105] (unknown [49.206.125.126])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sivaprak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 84555C433F2;
        Mon,  4 May 2020 06:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 84555C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sivaprak@codeaurora.org
Subject: Re: [PATCH V3 1/8] dt-bindings: mailbox: Add YAML schemas for QCOM
 APCS global block
To:     Rob Herring <robh@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1586832922-29191-1-git-send-email-sivaprak@codeaurora.org>
 <1586832922-29191-2-git-send-email-sivaprak@codeaurora.org>
 <20200420205924.GA13256@bogus>
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
Message-ID: <02ead2f7-3eed-d9cf-26aa-25e2ef246a4c@codeaurora.org>
Date:   Mon, 4 May 2020 11:44:51 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200420205924.GA13256@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 4/21/2020 2:29 AM, Rob Herring wrote:
> On Tue, Apr 14, 2020 at 08:25:15AM +0530, Sivaprakash Murugesan wrote:
>> Qualcomm APCS global block provides a bunch of generic properties which
>> are required in a device tree. Add YAML schema for these properties.
>>
>> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
>> ---
>>   .../bindings/mailbox/qcom,apcs-kpss-global.txt     | 88 ----------------------
>>   .../bindings/mailbox/qcom,apcs-kpss-global.yaml    | 88 ++++++++++++++++++++++
>>   2 files changed, 88 insertions(+), 88 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
>>   create mode 100644 Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
>> deleted file mode 100644
>> index beec612..0000000
>> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt
>> +++ /dev/null
>> @@ -1,88 +0,0 @@
>> -Binding for the Qualcomm APCS global block
>> -==========================================
>> -
>> -This binding describes the APCS "global" block found in various Qualcomm
>> -platforms.
>> -
>> -- compatible:
>> -	Usage: required
>> -	Value type: <string>
>> -	Definition: must be one of:
>> -		    "qcom,msm8916-apcs-kpss-global",
>> -		    "qcom,msm8996-apcs-hmss-global"
>> -		    "qcom,msm8998-apcs-hmss-global"
>> -		    "qcom,qcs404-apcs-apps-global"
>> -		    "qcom,sc7180-apss-shared"
>> -		    "qcom,sdm845-apss-shared"
>> -		    "qcom,sm8150-apss-shared"
>> -		    "qcom,ipq8074-apcs-apps-global"
>> -
>> -- reg:
>> -	Usage: required
>> -	Value type: <prop-encoded-array>
>> -	Definition: must specify the base address and size of the global block
>> -
>> -- clocks:
>> -	Usage: required if #clock-names property is present
>> -	Value type: <phandle array>
>> -	Definition: phandles to the two parent clocks of the clock driver.
>> -
>> -- #mbox-cells:
>> -	Usage: required
>> -	Value type: <u32>
>> -	Definition: as described in mailbox.txt, must be 1
>> -
>> -- #clock-cells:
>> -	Usage: optional
>> -	Value type: <u32>
>> -	Definition: as described in clock.txt, must be 0
>> -
>> -- clock-names:
>> -	Usage: required if the platform data based clock driver needs to
>> -	retrieve the parent clock names from device tree.
>> -	This will requires two mandatory clocks to be defined.
>> -	Value type: <string-array>
>> -	Definition: must be "pll" and "aux"
>> -
>> -= EXAMPLE
>> -The following example describes the APCS HMSS found in MSM8996 and part of the
>> -GLINK RPM referencing the "rpm_hlos" doorbell therein.
>> -
>> -	apcs_glb: mailbox@9820000 {
>> -		compatible = "qcom,msm8996-apcs-hmss-global";
>> -		reg = <0x9820000 0x1000>;
>> -
>> -		#mbox-cells = <1>;
>> -	};
>> -
>> -	rpm-glink {
>> -		compatible = "qcom,glink-rpm";
>> -
>> -		interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
>> -
>> -		qcom,rpm-msg-ram = <&rpm_msg_ram>;
>> -
>> -		mboxes = <&apcs_glb 0>;
>> -		mbox-names = "rpm_hlos";
>> -	};
>> -
>> -Below is another example of the APCS binding on MSM8916 platforms:
>> -
>> -	apcs: mailbox@b011000 {
>> -		compatible = "qcom,msm8916-apcs-kpss-global";
>> -		reg = <0xb011000 0x1000>;
>> -		#mbox-cells = <1>;
>> -		clocks = <&a53pll>;
>> -		#clock-cells = <0>;
>> -	};
>> -
>> -Below is another example of the APCS binding on QCS404 platforms:
>> -
>> -	apcs_glb: mailbox@b011000 {
>> -		compatible = "qcom,qcs404-apcs-apps-global", "syscon";
>> -		reg = <0x0b011000 0x1000>;
>> -		#mbox-cells = <1>;
>> -		clocks = <&apcs_hfpll>, <&gcc GCC_GPLL0_AO_OUT_MAIN>;
>> -		clock-names = "pll", "aux";
>> -		#clock-cells = <0>;
>> -	};
>> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
>> new file mode 100644
>> index 0000000..b46474b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
>> @@ -0,0 +1,88 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/mailbox/qcom,apcs-kpss-global.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Qualcomm APCS global block bindings
>> +
>> +description:
>> +  This binding describes the APCS "global" block found in various Qualcomm
>> +  platforms.
>> +
>> +maintainers:
>> +  - Sivaprakash Murugesan <sivaprak@codeaurora.org>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,ipq8074-apcs-apps-global
>> +      - qcom,msm8916-apcs-kpss-global
>> +      - qcom,msm8996-apcs-hmss-global
>> +      - qcom,msm8998-apcs-hmss-global
>> +      - qcom,qcs404-apcs-apps-global
>> +      - qcom,sc7180-apss-shared
>> +      - qcom,sdm845-apss-shared
>> +      - qcom,sm8150-apss-shared
>> +
>> +  reg:
>> +    description: specifies the base address and size of the global block
> Can drop this.
ok.
>
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    description: phandles to the parent clocks of the clock driver
> Need to define how many and what each one is.
ok.
>
>> +
>> +  '#mbox-cells':
>> +    const: 1
>> +
>> +  '#clock-cells':
>> +    const: 0
>> +
>> +  clock-names:
>> +    description:
>> +      parent clock names, required if the platform data based clock driver
>> +      needs to retrieve the parent clock names from device tree.
> Drop.
ok.
>
>> +    maxItems: 2
> Not needed as 'items' implies this.
ok.
