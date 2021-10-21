Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16A9C435D58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 10:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231573AbhJUIyJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 04:54:09 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:25578 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231342AbhJUIyG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 04:54:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634806311; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=TsTUaUN6UAZjto/Yd/hWLc73ukdwtGkHFVUFsfzhjq4=;
 b=G3oBkKyzKz9Q3AYU09qhW3P/aAxd+EJZLWqwV3PBgWZpAS3a7urKJ18P2i0YhoNSoqBee8bh
 AEKQTEtdnFQreXXTUP1SIG/vJdLJYCIqmWofQrMW9y4CKeaOHzWbau61kWgwTE+ZbBCRYEG+
 W1+5IoZvlEJt3DuY9Q0nTTkNHNE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 61712a0e308e0dd330b1e034 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 21 Oct 2021 08:51:26
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E37D9C43617; Thu, 21 Oct 2021 08:51:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3A2CAC4338F;
        Thu, 21 Oct 2021 08:51:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 21 Oct 2021 14:21:25 +0530
From:   skakit@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        collinsd@codeurora.org, subbaram@codeaurora.org,
        kgunda@codeaurora.org
Subject: Re: [PATCH V2 2/4] dt-bindings: mfd: pm8008: Add pm8008 regulator
 node
In-Reply-To: <CAE-0n51pCkrdOSJFf3V4HGB5PcUcRa2y6zRQbQ30i-hQVhjC=Q@mail.gmail.com>
References: <1633060859-22969-1-git-send-email-skakit@codeaurora.org>
 <1633060859-22969-3-git-send-email-skakit@codeaurora.org>
 <CAE-0n51pCkrdOSJFf3V4HGB5PcUcRa2y6zRQbQ30i-hQVhjC=Q@mail.gmail.com>
Message-ID: <23abf3d093df63b1025e466f45ff16c6@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-10-05 23:40, Stephen Boyd wrote:
> Quoting Satya Priya (2021-09-30 21:00:57)
>> Add pm8008-regulator node and example.
>> 
>> Signed-off-by: Satya Priya <skakit@codeaurora.org>
>> ---
>> Changes in V2:
>>  - As per Rob's comments changed "pm8008[a-z]?-regulator" to
>>    "^pm8008[a-z]?-regulators".
>> 
>>  .../devicetree/bindings/mfd/qcom,pm8008.yaml       | 24 
>> ++++++++++++++++++++++
>>  1 file changed, 24 insertions(+)
>> 
>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml 
>> b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
>> index ec3138c..0c9665e 100644
>> --- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
>> @@ -45,6 +45,10 @@ properties:
>>      const: 0
>> 
>>  patternProperties:
>> +  "^pm8008[a-z]?-regulators$":
> 
> Please just call it 'regulators'
> 
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
>> +        pm8008-regulators {
> 
> Please just call it 'regulators'
> 

Okay

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
