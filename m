Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20DBC40D1EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Sep 2021 05:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234057AbhIPDOh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Sep 2021 23:14:37 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:29389 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234027AbhIPDOh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Sep 2021 23:14:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631761997; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=L56PSK7UJgVh+fg1UMQNlQbJl4Gk/N51kf4QAV1HAdA=;
 b=CwBpjJyH0kN+ebQZagIKjRFBU/pDpqlH7zfPcOHc2KsuMa9AJ7RNV+9pjmTBPumDPQXJlAyl
 UCmJegJE8g94KAHmd4aIJhW9Gx0JnG31jJsMtbVAPR0tteupEixRD459JEz47MA/refR+Hkc
 kTRbhPLD7tAi8ROjNWGWhndwczs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6142b64bbd6681d8ed883fda (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Sep 2021 03:13:15
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 053EDC43460; Thu, 16 Sep 2021 03:13:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 25E42C4338F;
        Thu, 16 Sep 2021 03:13:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 16 Sep 2021 08:43:13 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Rob Herring <robh@kernel.org>
Cc:     mka@chromium.org, swboyd@chromium.org, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v6 02/13] dt-bindings: remoteproc: qcom: pas: Add QMP
 property
In-Reply-To: <YTi/+VIOuja9eLbl@robh.at.kernel.org>
References: <1630916637-4278-1-git-send-email-sibis@codeaurora.org>
 <1630916637-4278-3-git-send-email-sibis@codeaurora.org>
 <YTi/+VIOuja9eLbl@robh.at.kernel.org>
Message-ID: <fbd2f3ee8b5fc8dd26011a85df9cb348@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Rob,

Thanks for taking time to review
the series.

On 2021-09-08 19:21, Rob Herring wrote:
> On Mon, Sep 06, 2021 at 01:53:46PM +0530, Sibi Sankar wrote:
>> The load state power-domain, used by the co-processors to notify the
>> Always on Subsystem (AOSS) that a particular co-processor is up/down,
>> suffers from the side-effect of changing states during suspend/resume.
>> However the co-processors enter low-power modes independent to that of
>> the application processor and their states are expected to remain
>> unaltered across system suspend/resume cycles. To achieve this 
>> behavior
>> let's drop the load state power-domain and replace them with the qmp
>> property for all SoCs supporting low power mode signalling.
>> 
>> Due to the current broken load state implementation, we can afford the
>> binding breakage that ensues and the remoteproc functionality will 
>> remain
>> the same when using newer kernels with older dtbs.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>> ---
>> 
>> v6:
>>  * Updated commit message to explain binding breakage. [Stephen]
>> 
>>  .../devicetree/bindings/remoteproc/qcom,adsp.yaml  | 61 
>> +++++++++++-----------
>>  1 file changed, 31 insertions(+), 30 deletions(-)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml 
>> b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
>> index 0c112f3264a9..0d2b5bd4907a 100644
>> --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
>> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
>> @@ -93,6 +93,10 @@ properties:
>>      maxItems: 1
>>      description: Reference to the reserved-memory for the Hexagon 
>> core
>> 
>> +  qcom,qmp:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description: Reference to the AOSS side-channel message RAM.
>> +
> 
> [...]
> 
>> @@ -511,6 +486,32 @@ allOf:
>>              - const: mss_restart
>>              - const: pdc_reset
>> 
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,sc7180-mpss-pas
>> +              - qcom,sc8180x-adsp-pas
>> +              - qcom,sc8180x-cdsp-pas
>> +              - qcom,sc8180x-mpss-pas
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
> 
> This doesn't do anything. The property is already allowed for all
> compatibles. Perhaps you want to negate the if and put 'qcom,qmp: 
> false'
> here.

sure will fix it in the next re-spin.

> 
> Rob

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
