Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC37412EE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 08:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbhIUHA4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 03:00:56 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:57854 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbhIUHAz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 03:00:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632207567; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=mqWwXANTiQxXkA98c0p3Y/JczBb1em+X57YatmhzCkE=; b=tZAHYXK2EBniqqfzFgZy4RHf+zEP3JMhCSq2nl3euvKkAOs+FZ9fGlTlIMm9agGghx3ZBXAA
 ppz9JFfX8iTF8PbtJqKWCDnZ8c0IoX3LR87vcK0TwE61wJiH1ZSkyhpdOhldhku7wPJ0ASJd
 0HSZZoKzAjSoxljESgwDP3DjSmE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 614982c9648642cc1c139354 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Sep 2021 06:59:21
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CEA5DC43619; Tue, 21 Sep 2021 06:59:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.204.90] (unknown [157.48.173.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9DCBAC4338F;
        Tue, 21 Sep 2021 06:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 9DCBAC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH 2/7] ASoC: qcom: dt-bindings: Add compatible names for
 lpass sc7280 digital codecs
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
Cc:     Venkata Prasad Potturu <potturu@codeaurora.org>
References: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
 <1632123331-2425-3-git-send-email-srivasam@codeaurora.org>
 <7c12126d-99a8-4572-6e95-b63131cae300@linaro.org>
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Organization: Qualcomm India Private Limited.
Message-ID: <3e8ea5bd-9301-2605-b7e9-02ddab076fc7@codeaurora.org>
Date:   Tue, 21 Sep 2021 12:29:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <7c12126d-99a8-4572-6e95-b63131cae300@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/20/2021 6:54 PM, Srinivas Kandagatla wrote:
Thanks for your time Srini!!
>
> On 20/09/2021 08:35, Srinivasa Rao Mandadapu wrote:
>> Update compatible names in va, wsa, rx and tx macro codes for lpass 
>> sc7280
>>
>> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
>> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
>> ---
>> Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 4 
>> +++-
>> Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml | 4 
>> +++-
>> Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 4 
>> +++-
>> Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml | 4 
>> +++-
>>   4 files changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml 
>> b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
>> index 443d556..a4e767e 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
>> @@ -11,7 +11,9 @@ maintainers:
>>     properties:
>>     compatible:
>> -    const: qcom,sm8250-lpass-rx-macro
>> +    oneOf:
>> +      - const: qcom,sm8250-lpass-rx-macro
>> +      - const: qcom,sc7280-lpass-rx-macro
> Recently Rob did tree wide change to use enum instead of oneOf for 
> below reason
> "
> 'enum' is equivalent to 'oneOf' with a list of 'const' entries, but 
> 'enum' is more concise and yields better error messages."
>
> So, can you move these to enums like:
>
> enum:
>   - qcom,sm8250-lpass-rx-macro
>   - qcom,sc7280-lpass-rx-macro
>
> --srini
Okay. will change accordingly and post it.
>
>>     reg:
>>       maxItems: 1
>> diff --git 
>> a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml 
>> b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
>> index 6b5ca02..cdec478 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml
>> @@ -11,7 +11,9 @@ maintainers:
>>     properties:
>>     compatible:
>> -    const: qcom,sm8250-lpass-tx-macro
>> +    oneOf:
>> +      - const: qcom,sm8250-lpass-tx-macro
>> +      - const: qcom,sc7280-lpass-tx-macro
>>       reg:
>>       maxItems: 1
>> diff --git 
>> a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml 
>> b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
>> index 679b49c..e15bc05 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
>> @@ -11,7 +11,9 @@ maintainers:
>>     properties:
>>     compatible:
>> -    const: qcom,sm8250-lpass-va-macro
>> +    oneOf:
>> +      - const: qcom,sm8250-lpass-va-macro
>> +      - const: qcom,sc7280-lpass-va-macro
>>       reg:
>>       maxItems: 1
>> diff --git 
>> a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml 
>> b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
>> index 435b019..2dcccb5 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
>> @@ -11,7 +11,9 @@ maintainers:
>>     properties:
>>     compatible:
>> -    const: qcom,sm8250-lpass-wsa-macro
>> +    oneOf:
>> +      - const: qcom,sm8250-lpass-wsa-macro
>> +      - const: qcom,sc7280-lpass-wsa-macro
>>       reg:
>>       maxItems: 1
>>
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

