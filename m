Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83E073AFDC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 09:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbhFVHZp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 03:25:45 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:26420 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229677AbhFVHZo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 03:25:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624346609; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=zfZLUV+XLhKbuRPyWy17JYb48rB9RQJB0YLvF+0B5RI=;
 b=eQHIPeynfMQz/V16Wshvz3AgiiQRMyxwYHu2i53SNsVbdKx6hnWNG2VNPmSOOb1qIrUKU85F
 QR4VEuS7Qbnro5Sw36HbVOJoLopNDoCVkCrPDv4BJssjKNo4NGUaxcGoqNZMjmLT6VJnFaGS
 +TTfEupHzFzIbQDfqDA2BnQFOjo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60d18fe76ddc3305c41b571c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Jun 2021 07:23:19
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 62A75C43217; Tue, 22 Jun 2021 07:23:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 54DAAC433D3;
        Tue, 22 Jun 2021 07:23:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 22 Jun 2021 12:53:17 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Rob Herring <robh@kernel.org>
Cc:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        swboyd@chromium.org, ulf.hansson@linaro.org, rjw@rjwysocki.net,
        agross@kernel.org, ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        rishabhb@codeaurora.org, sidgup@codeaurora.org
Subject: Re: [PATCH v2 02/13] dt-bindings: remoteproc: qcom: pas: Add QMP
 bindings
In-Reply-To: <20210618202512.GA2811174@robh.at.kernel.org>
References: <1623080372-13521-1-git-send-email-sibis@codeaurora.org>
 <1623080372-13521-3-git-send-email-sibis@codeaurora.org>
 <20210618202512.GA2811174@robh.at.kernel.org>
Message-ID: <cbf3f5b190f9ea15a2246dc836513b46@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Rob,
Thanks for the review.

On 2021-06-19 01:55, Rob Herring wrote:
> On Mon, Jun 07, 2021 at 09:09:21PM +0530, Sibi Sankar wrote:
>> Add Qualcomm Mailbox Protocol (QMP) binding to replace the power 
>> domains
>> exposed by the AOSS QMP node.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>> 
>> v2:
>>  * Drop R-b from Rob/Stephen due to yaml conversion.
>> 
>>  .../devicetree/bindings/remoteproc/qcom,adsp.yaml  | 40 
>> +++++++++++++++-------
>>  1 file changed, 27 insertions(+), 13 deletions(-)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml 
>> b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
>> index 9ea05e608bc1..b6396bc07388 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
>> @@ -89,6 +89,10 @@ properties:
>>      maxItems: 1
>>      description: Reference to the reserved-memory for the Hexagon 
>> core
>> 
>> +  qcom,qmp:
> 
> Is there more than one QMP? If not just search for the QMP node and you
> can avoid the ABI issue at least partially.

yeah there is just one qmp node
used by all remote processors and
we just search for the qmp node.

> 
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> 
> There's more than 1 cell? What's in them?

Just a single cell i.e. handle to the
qmp node. I'll fix this in the re-spin.

> 
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
>> @@ -381,12 +383,7 @@ allOf:
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
>> @@ -399,12 +396,10 @@ allOf:
>>        properties:
>>          power-domains:
>>            items:
>> -            - description: Load State power domain
>>              - description: CX power domain
>>              - description: MSS power domain
>>          power-domain-names:
>>            items:
>> -            - const: load_state
>>              - const: cx
>>              - const: mss
>> 
>> @@ -439,12 +434,10 @@ allOf:
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
>> @@ -458,12 +451,10 @@ allOf:
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
>> @@ -499,6 +490,29 @@ allOf:
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
