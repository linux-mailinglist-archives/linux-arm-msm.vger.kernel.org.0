Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DBFD41AF17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 14:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240566AbhI1Mdm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 08:33:42 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:47893 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240526AbhI1Mdl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 08:33:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632832322; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=lz0RQ3WTqzUYVr3sYY2bnFpPgLz9uXHvoHlxlgCwPwk=;
 b=OI13nQ1PUXRZs9ryxQH9iu6QfoXFGwNWnXWVssL4jShrwvYsf6OSOD98kd2MhUoM/kEz27Um
 MsrkoYeLE/DfRoKDgwj7bEc3j78AH6s6lN4BhUcKZj8iVHF8vOc8MnyotYMPzmhPU4QBKZcJ
 8I0iFWUVWK6VR06zjE7XCG5QeC4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 61530b3e47d64efb6d3b6f67 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 12:31:58
 GMT
Sender: skakit=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DB764C43616; Tue, 28 Sep 2021 12:31:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: skakit)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 27A68C4338F;
        Tue, 28 Sep 2021 12:31:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 28 Sep 2021 18:01:56 +0530
From:   skakit@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, mka@chromium.org,
        Das Srinagesh <gurus@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>, kgunda@codeaurora.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mfd: pm8008: Add pm8008 regulator node
In-Reply-To: <CAE-0n51Xrv54XVLJwz9ENTtOhtCKWG7WtQg2o2+SFEoru1M4VA@mail.gmail.com>
References: <1631875538-22473-1-git-send-email-skakit@codeaurora.org>
 <1631875538-22473-2-git-send-email-skakit@codeaurora.org>
 <CAE-0n51Xrv54XVLJwz9ENTtOhtCKWG7WtQg2o2+SFEoru1M4VA@mail.gmail.com>
Message-ID: <1524de68017cfd6c9de706441496b3e5@codeaurora.org>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-21 01:02, Stephen Boyd wrote:
> Quoting Satya Priya (2021-09-17 03:45:35)
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
> Shouldn't it be ^pm8008-regulator$ without the a-z optional letter?
> 

Some platforms use 2 PM8008 PMICS, in that case we need suffixing like 
pm8008i pm8008j etc. So, I mentioned this way.

>> +    type: object
>> +    $ref: "../regulator/qcom,pm8008-regulator.yaml#"
>> +
>>    "^gpio@[0-9a-f]+$":
>>      type: object
>> 
