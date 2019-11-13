Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B030FB321
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2019 16:02:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727655AbfKMPCl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Nov 2019 10:02:41 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:48544 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726812AbfKMPCl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Nov 2019 10:02:41 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 297D760BF4; Wed, 13 Nov 2019 15:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573657359;
        bh=PmuIPtzDsG95Mlbe4TmoFaii3H10pp3Kzpy+eC3cS6Y=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=UJgGktfGNeIBaLx2B5ouDR6rjhH1Z8copT+1dAq/AOwgRAUHUf8xeh6IDWReJ3P5J
         roP06JekYZhkh2LgDn5DG20cw3buccx0G9NSA5ynqJy2l9rtN/BuQUYn1kPNEHEj1j
         U0wjyWSdDL4I171Pb44QvrOo3TvFw16tTq5QUN7w=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6F2CE60AD9;
        Wed, 13 Nov 2019 15:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573657354;
        bh=PmuIPtzDsG95Mlbe4TmoFaii3H10pp3Kzpy+eC3cS6Y=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=BgDcsSh15qyyt0yE5G6jvzXvt94FTYXH+2Z2OwJFq+bUrpSBFQAys2hx+ZWgKlcl+
         WGQpzjH51+9a3OFRmVP8QbXo+UkK2oVSVkXq+XaMJTtvr7WbHO0IKayDBX4mxxYVe9
         knce6RHLvvKUCCwUw5Y1mCDGBqSO5sOVCVXjemHw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6F2CE60AD9
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v9 1/4] dt-bindings: clock: Document external clocks for
 MSM8998 gcc
To:     Taniya Das <tdas@codeaurora.org>, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <1573591382-14225-1-git-send-email-jhugo@codeaurora.org>
 <1573591466-14296-1-git-send-email-jhugo@codeaurora.org>
 <63e2cdd2-919d-9ec2-9fe8-48bbe34f732c@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <4dcd5e10-817e-0a12-6922-5e3f8dcf09bf@codeaurora.org>
Date:   Wed, 13 Nov 2019 08:02:32 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <63e2cdd2-919d-9ec2-9fe8-48bbe34f732c@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/13/2019 4:20 AM, Taniya Das wrote:
> Hi Jeffrey,
> 
> On 11/13/2019 2:14 AM, Jeffrey Hugo wrote:
>> The global clock controller on MSM8998 can consume a number of external
>> clocks.  Document them.
>>
>> For 7180 and 8150, the hardware always exists, so no clocks are truly
>> optional.  Therefore, simplify the binding by removing the min/max
>> qualifiers to clocks.  Also, fixup an example so that dt_binding_check
>> passes.
>>
>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> ---
>>   .../devicetree/bindings/clock/qcom,gcc.yaml        | 47 
>> +++++++++++++++-------
>>   1 file changed, 33 insertions(+), 14 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml 
>> b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
>> index e73a56f..2f3512b 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
>> @@ -40,20 +40,38 @@ properties:
>>          - qcom,gcc-sm8150
>>     clocks:
>> -    minItems: 1
>> -    maxItems: 3
>> -    items:
>> -      - description: Board XO source
>> -      - description: Board active XO source
>> -      - description: Sleep clock source
>> +    oneOf:
>> +      #qcom,gcc-sm8150
>> +      #qcom,gcc-sc7180
>> +      - items:
>> +        - description: Board XO source
>> +        - description: Board active XO source
>> +        - description: Sleep clock source
>> +      #qcom,gcc-msm8998
>> +      - items:
>> +        - description: Board XO source
>> +        - description: USB 3.0 phy pipe clock
>> +        - description: UFS phy rx symbol clock for pipe 0
>> +        - description: UFS phy rx symbol clock for pipe 1
>> +        - description: UFS phy tx symbol clock
>> +        - description: PCIE phy pipe clock
> 
> Would it be possible to add an example for MSM8998?

It doesn't seem to be materially different that the existing examples, 
but sure, that's something that can be done.

> 
>>     clock-names:
>> -    minItems: 1
>> -    maxItems: 3
>> -    items:
>> -      - const: bi_tcxo
>> -      - const: bi_tcxo_ao
>> -      - const: sleep_clk
>> +    oneOf:
>> +      #qcom,gcc-sm8150
>> +      #qcom,gcc-sc7180
>> +      - items:
>> +        - const: bi_tcxo
>> +        - const: bi_tcxo_ao
>> +        - const: sleep_clk
> 
> Not required for SC7180.

How are you determining this?

Per the earlier discussion with Stephen, if the hardware exists, it 
should be represented in DT.  According to the documentation I see, the 
sleep clock is routed to the GCC on SC7180.  The driver is not required 
to make use of it.  Thus its required from the DT perspective.

> 
>> +      #qcom,gcc-msm8998
>> +      - items:
>> +        - const: xo
>> +        - const: usb3_pipe
>> +        - const: ufs_rx_symbol0
>> +        - const: ufs_rx_symbol1
>> +        - const: ufs_tx_symbol0
>> +        - const: pcie0_pipe
>>     '#clock-cells':
>>       const: 1
>> @@ -118,6 +136,7 @@ else:
>>         compatible:
>>           contains:
>>             enum:
>> +            - qcom,gcc-msm8998
>>               - qcom,gcc-sm8150
>>               - qcom,gcc-sc7180
>>     then:
>> @@ -179,8 +198,8 @@ examples:
>>       clock-controller@100000 {
>>         compatible = "qcom,gcc-sc7180";
>>         reg = <0x100000 0x1f0000>;
>> -      clocks = <&rpmhcc 0>, <&rpmhcc 1>;
>> -      clock-names = "bi_tcxo", "bi_tcxo_ao";
>> +      clocks = <&rpmhcc 0>, <&rpmhcc 1>, <0>;
>> +      clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
> 
> SC7180 does not require a sleep clock.
> 
>>         #clock-cells = <1>;
>>         #reset-cells = <1>;
>>         #power-domain-cells = <1>;
>>
> 


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
