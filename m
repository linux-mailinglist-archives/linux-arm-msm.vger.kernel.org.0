Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99F7F4148E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Sep 2021 14:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235919AbhIVMdZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 08:33:25 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:39411 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235931AbhIVMdY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 08:33:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632313915; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=T2t0w0WVucWM+WPImcWBJQRE3Iokr1ors4nOiokKRaw=;
 b=iocnIQpSGtKg+x0sFFrUM+qYbgEwfGuGTV7UwFyFf5bzNwGu0NqkPdDmvNArAaJrGZVWW66W
 frpdnei/pUf/AGy3s5wZi7sk0eNxqqG2XHRTfImQk3fOm2XpxVNRwhq5uL+EGTpvf8TW9M1m
 Y22wQz3uE84/5chwTkdovrorRAM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 614b2222507800c8805b4c14 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 22 Sep 2021 12:31:30
 GMT
Sender: rajpat=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D9627C43616; Wed, 22 Sep 2021 12:31:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rajpat)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 457F4C4338F;
        Wed, 22 Sep 2021 12:31:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 22 Sep 2021 18:01:29 +0530
From:   rajpat@codeaurora.org
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, mka@chromium.org, dianders@chromium.org
Subject: Re: [PATCH V9 1/8] dt-bindings: spi: Add sc7280 support
In-Reply-To: <163224787559.763609.17193788799229852583@swboyd.mtv.corp.google.com>
References: <1632220746-25943-1-git-send-email-rajpat@codeaurora.org>
 <1632220746-25943-2-git-send-email-rajpat@codeaurora.org>
 <163224787559.763609.17193788799229852583@swboyd.mtv.corp.google.com>
Message-ID: <2b23ded25d1a35502b0787ddd2898e5d@codeaurora.org>
X-Sender: rajpat@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-21 23:41, Stephen Boyd wrote:
> Quoting Rajesh Patil (2021-09-21 03:38:59)
>> Add compatible for sc7280 SoC.
>> 
>> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
>> Reviewed-by: Doug Anderson <dianders@chromium.org>
>> ---
> 
> One nit below
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
>> diff --git 
>> a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml 
>> b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
>> index ef5698f..1c8b2ea 100644
>> --- a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
>> @@ -21,7 +21,10 @@ allOf:
>>  properties:
>>    compatible:
>>      items:
>> -      - const: qcom,sdm845-qspi
>> +      - enum:
>> +          - qcom,sdm845-qspi
>> +          - qcom,sc7280-qspi
> 
> Would be nice to keep this alphabet sorted too.

Okay. I will keep in alphabet order.

> 
>> +
>>        - const: qcom,qspi-v1
>> 
>>    reg:
