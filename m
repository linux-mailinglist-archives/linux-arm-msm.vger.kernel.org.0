Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 003513CE635
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jul 2021 18:45:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349444AbhGSQCW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jul 2021 12:02:22 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:62041 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349433AbhGSPuc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jul 2021 11:50:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626712272; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wC+4kPxoaNHXg251PHAM6O4Yc7Q1e6weOlw2gcruP18=;
 b=q1vLheaScc1Nh/7PZAEjT43hM0Q+j3KYoltckDvGkB6FSQK+HGCkBDEw/wN+s5BYV5CYfHXe
 MO0gU8vMRIUOfTAy2avfwKIBOP3hsFTmpSmXUHmXZkGq4zltobUpsVobo3XQjuAm1HQfJLD3
 pFwDsf63PUWS41DrD80QvLVtcW8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 60f5a8a125e56632784298a6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 19 Jul 2021 16:30:25
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1258DC4323A; Mon, 19 Jul 2021 16:30:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 46C07C20DE1;
        Mon, 19 Jul 2021 16:30:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 19 Jul 2021 22:00:23 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Rob Herring <robh@kernel.org>
Cc:     bjorn.andersson@linaro.org, swboyd@chromium.org,
        ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v3 02/13] dt-bindings: remoteproc: qcom: pas: Add QMP
 bindings
In-Reply-To: <20210714193457.GA3135088@robh.at.kernel.org>
References: <1624560727-6870-1-git-send-email-sibis@codeaurora.org>
 <1624560727-6870-3-git-send-email-sibis@codeaurora.org>
 <20210714193457.GA3135088@robh.at.kernel.org>
Message-ID: <1c29a746a450e75345a8d1e433fa51ee@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-15 01:04, Rob Herring wrote:
> On Fri, Jun 25, 2021 at 12:21:56AM +0530, Sibi Sankar wrote:
>> Add Qualcomm Mailbox Protocol (QMP) binding to replace the power 
>> domains
>> exposed by the AOSS QMP node.
> 
> Not a compatible change. Explain why that's okay for all
> platforms/users.

It's not meant for all platforms.
Rather we just replace the load-state
power-domain with the new qmp
property and it only affects the
compatibles covered below.

> 
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>> 
>> v3:
>>  * Misc. documentation fixes:
>>   - Reduce power-domain maxItems due to load_state pd removal
>>   - Combine compatibles where possible with the load_state pd removal
>>   - Fixup the qcom,qmp ref to phandle type
>> 
>>  .../devicetree/bindings/remoteproc/qcom,adsp.yaml  | 62 
>> +++++++++++-----------
>>  1 file changed, 30 insertions(+), 32 deletions(-)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml 
>> b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
>> index 9ea05e608bc1..ad85617b43fa 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
>> @@ -75,11 +75,11 @@ properties:
>> 
>>    power-domains:
>>      minItems: 1
>> -    maxItems: 3
>> +    maxItems: 2
>> 
>>    power-domain-names:
>>      minItems: 1
>> -    maxItems: 3
>> +    maxItems: 2
>> 
>>    firmware-name:
>>      $ref: /schemas/types.yaml#/definitions/string
>> @@ -89,6 +89,10 @@ properties:
>>      maxItems: 1
>>      description: Reference to the reserved-memory for the Hexagon 
>> core
>> 
>> +  qcom,qmp:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: Reference to the AOSS side-channel message RAM.
>> +
>>    qcom,smem-states:
>>      $ref: /schemas/types.yaml#/definitions/phandle-array
>>      description: States used by the AP to signal the Hexagon core
>> @@ -359,13 +363,11 @@ allOf:
>>        properties:
>>          power-domains:
>>            items:
>> -            - description: Load State power domain
>>              - description: CX power domain
>>              - description: MX power domain
>>              - description: MSS power domain
>>          power-domain-names:
>>            items:
>> -            - const: load_state
>>              - const: cx
>>              - const: mx
>>              - const: mss
>> @@ -381,43 +383,20 @@ allOf:
>>        properties:
>>          power-domains:
>>            items:
>> -            - description: Load State power domain
>>              - description: CX power domain
>> -        power-domain-names:
>> -          items:
>> -            - const: load_state
>> -            - const: cx
>> 
>>    - if:
>>        properties:
>>          compatible:
>>            contains:
>>              enum:
>> +              - qcom,sdx55-mpss-pas
>>                - qcom,sm8150-mpss-pas
>>                - qcom,sm8350-mpss-pas
>>      then:
>>        properties:
>>          power-domains:
>>            items:
>> -            - description: Load State power domain
>> -            - description: CX power domain
>> -            - description: MSS power domain
>> -        power-domain-names:
>> -          items:
>> -            - const: load_state
>> -            - const: cx
>> -            - const: mss
>> -
>> -  - if:
>> -      properties:
>> -        compatible:
>> -          contains:
>> -            enum:
>> -              - qcom,sdx55-mpss-pas
>> -    then:
>> -      properties:
>> -        power-domains:
>> -          items:
>>              - description: CX power domain
>>              - description: MSS power domain
>>          power-domain-names:
>> @@ -439,12 +418,10 @@ allOf:
>>        properties:
>>          power-domains:
>>            items:
>> -            - description: Load State power domain
>>              - description: LCX power domain
>>              - description: LMX power domain
>>          power-domain-names:
>>            items:
>> -            - const: load_state
>>              - const: lcx
>>              - const: lmx
>> 
>> @@ -458,12 +435,10 @@ allOf:
>>        properties:
>>          power-domains:
>>            items:
>> -            - description: Load State power domain
>>              - description: CX power domain
>>              - description: MXC power domain
>>          power-domain-names:
>>            items:
>> -            - const: load_state
>>              - const: cx
>>              - const: mxc
>> 
>> @@ -499,6 +474,29 @@ allOf:
>>              - const: mss_restart
>>              - const: pdc_reset
>> 
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,sc7180-mpss-pas
>> +              - qcom,sm8150-adsp-pas
>> +              - qcom,sm8150-cdsp-pas
>> +              - qcom,sm8150-mpss-pas
>> +              - qcom,sm8150-slpi-pas
>> +              - qcom,sm8250-adsp-pas
>> +              - qcom,sm8250-cdsp-pas
>> +              - qcom,sm8250-slpi-pas
>> +              - qcom,sm8350-adsp-pas
>> +              - qcom,sm8350-cdsp-pas
>> +              - qcom,sm8350-mpss-pas
>> +              - qcom,sm8350-slpi-pas
>> +    then:
>> +      properties:
>> +        qcom,qmp:
>> +          items:
>> +            - description: Reference to the AOSS side-channel message 
>> RAM.
>> +
>>  examples:
>>    - |
>>      #include <dt-bindings/clock/qcom,rpmcc.h>
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 
>> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
