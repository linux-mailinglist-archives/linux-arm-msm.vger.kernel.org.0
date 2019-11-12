Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05AE9F958F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2019 17:25:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbfKLQZt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Nov 2019 11:25:49 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:36096 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726936AbfKLQZt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Nov 2019 11:25:49 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id EB4E660909; Tue, 12 Nov 2019 16:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573575947;
        bh=DXkWV66VkppVyJ+i/rYBmYzA5hXfIYYXNPGMHx1zrQc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=HbwnJAn1ILUq/icq4thw2EebaC0DSTP96B2LFVOovATYTih09MkDUkTMc998SutWt
         kkH/4TcQLpAtxo0btcpPmhTZUs6kOX2Zf/qivSXVnkbB0m1nDlOUEmyBqMTW8YSY6j
         UWsvqRb0faQMvklkTYtl0a3/IOh251BPNFoGlgQ0=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DDB0A6053B;
        Tue, 12 Nov 2019 16:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573575944;
        bh=DXkWV66VkppVyJ+i/rYBmYzA5hXfIYYXNPGMHx1zrQc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Yz+J/1VyCQQpVfU0+a3O5kA5mGybn8BMb+BYrndOIVQ6h8vy9iy089MlUHCu1yKtH
         I6d1dbaD43ebM3Qu7Y2D7kSwEyMCdUWUrQRMySQYqZMSMDXGF1PeqUZSG+hTLXbbZw
         RGkxPMxv9zRgAxMlB7rPv6qrIGahfSt/sYt6couA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DDB0A6053B
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v8 1/4] dt-bindings: clock: Document external clocks for
 MSM8998 gcc
To:     Rob Herring <robh@kernel.org>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com,
        agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <1573254987-10241-1-git-send-email-jhugo@codeaurora.org>
 <1573255036-10302-1-git-send-email-jhugo@codeaurora.org>
 <20191112004417.GA16664@bogus>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <3e4b1342-7965-2d80-e28d-0cb728037abd@codeaurora.org>
Date:   Tue, 12 Nov 2019 09:25:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191112004417.GA16664@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/11/2019 5:44 PM, Rob Herring wrote:
> On Fri, Nov 08, 2019 at 04:17:16PM -0700, Jeffrey Hugo wrote:
>> The global clock controller on MSM8998 can consume a number of external
>> clocks.  Document them.
>>
>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> ---
>>   .../devicetree/bindings/clock/qcom,gcc.yaml        | 47 +++++++++++++++-------
>>   1 file changed, 33 insertions(+), 14 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
>> index e73a56f..2f3512b 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
>> @@ -40,20 +40,38 @@ properties:
>>          - qcom,gcc-sm8150
>>   
>>     clocks:
>> -    minItems: 1
> 
> 1 or 2 clocks are no longer allowed?

Correct.

The primary reason is that Stephen indicated in previous discussions 
that if the hardware exists, it should be indicated in DT, regardless if 
the driver uses it.  In the 7180 and 8150 case, the hardware exists, so 
these should not be optional.

The secondary reason is I found that the schema was broken anyways.  In 
the way it was written, if you implemented sleep, you could not skip 
xo_ao, however there is a dts that did exactly that.

The third reason was that I couldn't find a way to write valid yaml to 
preserve the original meaning.  when you have an "items" as a subnode of 
"oneOf", you no longer have control over the minItems/maxItems, so all 3 
became required anyways.  I find it disappointing that the "version" of 
Yaml used for DT bindings is not documented, so after several hours of 
trial and error, I just gave up since I found this to work (failed cases 
just gave me an error with no indication of what was wrong, not even a 
line number).

> 
>> -    maxItems: 3
>> -    items:
>> -      - description: Board XO source
>> -      - description: Board active XO source
>> -      - description: Sleep clock source
>> +    oneOf:
>> +      #qcom,gcc-sm8150
>> +      #qcom,gcc-sc7180
> 
> Typically, this would be an if/then schema, but I'm okay with leaving it
> like this. Depends whether you want to check the clocks match the
> compatible.

Is there an example somewhere?  The only thing I found was 
example-schema.yaml which seemed to suggest this way.

> 
>> +      - items:
>> +        - description: Board XO source
>> +        - description: Board active XO source
>> +        - description: Sleep clock source
>> +      #qcom,gcc-msm8998
>> +      - items:
>> +        - description: Board XO source
>> +        - description: USB 3.0 phy pipe clock
>> +        - description: UFS phy rx symbol clock for pipe 0
>> +        - description: UFS phy rx symbol clock for pipe 1
>> +        - description: UFS phy tx symbol clock
>> +        - description: PCIE phy pipe clock
>>   
>>     clock-names:
>> -    minItems: 1
>> -    maxItems: 3
>> -    items:
>> -      - const: bi_tcxo
>> -      - const: bi_tcxo_ao
>> -      - const: sleep_clk
>> +    oneOf:
>> +      #qcom,gcc-sm8150
>> +      #qcom,gcc-sc7180
>> +      - items:
>> +        - const: bi_tcxo
>> +        - const: bi_tcxo_ao
>> +        - const: sleep_clk
>> +      #qcom,gcc-msm8998
>> +      - items:
>> +        - const: xo
>> +        - const: usb3_pipe
>> +        - const: ufs_rx_symbol0
>> +        - const: ufs_rx_symbol1
>> +        - const: ufs_tx_symbol0
>> +        - const: pcie0_pipe
>>   
>>     '#clock-cells':
>>       const: 1
>> @@ -118,6 +136,7 @@ else:
>>         compatible:
>>           contains:
>>             enum:
>> +            - qcom,gcc-msm8998
>>               - qcom,gcc-sm8150
>>               - qcom,gcc-sc7180
>>     then:
>> @@ -179,8 +198,8 @@ examples:
>>       clock-controller@100000 {
>>         compatible = "qcom,gcc-sc7180";
>>         reg = <0x100000 0x1f0000>;
>> -      clocks = <&rpmhcc 0>, <&rpmhcc 1>;
>> -      clock-names = "bi_tcxo", "bi_tcxo_ao";
>> +      clocks = <&rpmhcc 0>, <&rpmhcc 1>, <0>;
>> +      clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
> 
> The patch subject says 8998, but this is changing sc7180.

I'm fixing up the example so that it no longer fails checks.  See the 
above comment.

> 
>>         #clock-cells = <1>;
>>         #reset-cells = <1>;
>>         #power-domain-cells = <1>;
>> -- 
>> Qualcomm Technologies, Inc. is a member of the
>> Code Aurora Forum, a Linux Foundation Collaborative Project.
>>


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
