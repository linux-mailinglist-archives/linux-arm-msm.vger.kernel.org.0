Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED2C741AF40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 14:43:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240699AbhI1MpL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 08:45:11 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:32336 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240783AbhI1MpL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 08:45:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632833012; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=JbjyQjUEF+2p6JDdH0AfBffAgxEQOr6+/L+pNG7q4l0=;
 b=iB5SVTJtcWzsLdnpy2OnxcSR2+p7vvsmBtbZo4b3H/5LADVjWtA5lSdnys/2BWzapEJ/+Gbp
 1j9UxMB2jIUzEJ89aie5AmkXeTMrCh24ODJ9froeRuBthMyv82c5FbQU8rEiiUZs0gE/cj48
 jmlqHUKXQXK8P42TBwPUIxroKbw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 61530de49ffb41314940fd1a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 12:43:16
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1ED5DC43638; Tue, 28 Sep 2021 12:43:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CC8F3C4361C;
        Tue, 28 Sep 2021 12:43:12 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 28 Sep 2021 18:13:12 +0530
From:   skakit@codeaurora.org
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, mka@chromium.org,
        swboyd@chromium.org, Das Srinagesh <gurus@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mfd: pm8008: Add pm8008 regulator node
In-Reply-To: <YUjxxnz9BFS7/WDK@robh.at.kernel.org>
References: <1631875538-22473-1-git-send-email-skakit@codeaurora.org>
 <1631875538-22473-2-git-send-email-skakit@codeaurora.org>
 <YUjxxnz9BFS7/WDK@robh.at.kernel.org>
Message-ID: <90420204e2a0628adffc9ab542d275a7@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-21 02:10, Rob Herring wrote:
> On Fri, Sep 17, 2021 at 04:15:35PM +0530, Satya Priya wrote:
>> Add pm8008-regulator node and example.
>> 
>> Signed-off-by: Satya Priya <skakit@codeaurora.org>
>> ---
>>  .../devicetree/bindings/mfd/qcom,pm8008.yaml       | 24 
>> ++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml 
>> b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
>> index ec3138c..de182f8 100644
>> --- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
>> @@ -45,6 +45,10 @@ properties:
>>      const: 0
>> 
>>  patternProperties:
>> +  "^pm8008[a-z]?-regulator$":
> 
> Is more than 1 node possible for a given PMIC? If not use 'regulators'
> for the node name.
> 

Not possible, will change the node name.

>> +    type: object
>> +    $ref: "../regulator/qcom,pm8008-regulator.yaml#"
>> +
>>    "^gpio@[0-9a-f]+$":
>>      type: object
>> 
>> @@ -122,6 +126,26 @@ examples:
>>            interrupt-controller;
>>            #interrupt-cells = <2>;
>>          };
>> +
>> +        pm8008-regulator {
>> +          compatible = "qcom,pm8008-regulator";
>> +          #address-cells = <1>;
>> +          #size-cells = <0>;
>> +
>> +          vdd_l1_l2-supply = <&vreg_s8b_1p2>;
>> +          vdd_l3_l4-supply = <&vreg_s1b_1p8>;
>> +          vdd_l5-supply = <&vreg_bob>;
>> +          vdd_l6-supply = <&vreg_bob>;
>> +          vdd_l7-supply = <&vreg_bob>;
>> +
>> +          pm8008_l1: regulator@4000 {
>> +            reg = <0x4000>;
>> +            regulator-name = "pm8008_l1";
>> +            regulator-min-microvolt = <950000>;
>> +            regulator-max-microvolt = <1300000>;
>> +            qcom,min-dropout-voltage = <96000>;
>> +          };
>> +        };
>>        };
>>      };
>> 
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>> member
>> of Code Aurora Forum, hosted by The Linux Foundation
>> 
>> 
